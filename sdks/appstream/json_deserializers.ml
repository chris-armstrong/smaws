open Smaws_Lib.Json.DeserializeHelpers
open Types

let workspace_image_id_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson
let subnet_id_list_of_yojson tree path = list_of_yojson string__of_yojson tree path
let security_group_id_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let vpc_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_ids =
       option_of_yojson
         (value_for_key security_group_id_list_of_yojson "SecurityGroupIds")
         _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_id_list_of_yojson "SubnetIds") _list path;
   }
    : vpc_config)

let integer_of_yojson = int_of_yojson

let volume_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_size_in_gb =
       option_of_yojson (value_for_key integer_of_yojson "VolumeSizeInGb") _list path;
   }
    : volume_config)

let visibility_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SHARED" -> SHARED
    | `String "PRIVATE" -> PRIVATE
    | `String "PUBLIC" -> PUBLIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "VisibilityType" value)
    | _ -> raise (deserialize_wrong_type_error path "VisibilityType")
     : visibility_type)
    : visibility_type)

let username_of_yojson = string_of_yojson

let authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_AD" -> AWS_AD
    | `String "USERPOOL" -> USERPOOL
    | `String "SAML" -> SAML
    | `String "API" -> API
    | `String value -> raise (deserialize_unknown_enum_value_error path "AuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AuthenticationType")
     : authentication_type)
    : authentication_type)

let boolean__of_yojson = bool_of_yojson

let user_stack_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     send_email_notification =
       option_of_yojson (value_for_key boolean__of_yojson "SendEmailNotification") _list path;
     authentication_type =
       value_for_key authentication_type_of_yojson "AuthenticationType" _list path;
     user_name = value_for_key username_of_yojson "UserName" _list path;
     stack_name = value_for_key string__of_yojson "StackName" _list path;
   }
    : user_stack_association)

let user_stack_association_list_of_yojson tree path =
  list_of_yojson user_stack_association_of_yojson tree path

let user_stack_association_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String "DIRECTORY_NOT_FOUND" -> DIRECTORY_NOT_FOUND
    | `String "USER_NAME_NOT_FOUND" -> USER_NAME_NOT_FOUND
    | `String "STACK_NOT_FOUND" -> STACK_NOT_FOUND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UserStackAssociationErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "UserStackAssociationErrorCode")
     : user_stack_association_error_code)
    : user_stack_association_error_code)

let user_stack_association_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson
         (value_for_key user_stack_association_error_code_of_yojson "ErrorCode")
         _list path;
     user_stack_association =
       option_of_yojson
         (value_for_key user_stack_association_of_yojson "UserStackAssociation")
         _list path;
   }
    : user_stack_association_error)

let user_stack_association_error_list_of_yojson tree path =
  list_of_yojson user_stack_association_error_of_yojson tree path

let action_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTO_TIME_ZONE_REDIRECTION" -> AUTO_TIME_ZONE_REDIRECTION
    | `String "DOMAIN_SMART_CARD_SIGNIN" -> DOMAIN_SMART_CARD_SIGNIN
    | `String "DOMAIN_PASSWORD_SIGNIN" -> DOMAIN_PASSWORD_SIGNIN
    | `String "PRINTING_TO_LOCAL_DEVICE" -> PRINTING_TO_LOCAL_DEVICE
    | `String "FILE_DOWNLOAD" -> FILE_DOWNLOAD
    | `String "FILE_UPLOAD" -> FILE_UPLOAD
    | `String "CLIPBOARD_COPY_TO_LOCAL_DEVICE" -> CLIPBOARD_COPY_TO_LOCAL_DEVICE
    | `String "CLIPBOARD_COPY_FROM_LOCAL_DEVICE" -> CLIPBOARD_COPY_FROM_LOCAL_DEVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Action" value)
    | _ -> raise (deserialize_wrong_type_error path "Action")
     : action)
    : action)

let permission_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Permission" value)
    | _ -> raise (deserialize_wrong_type_error path "Permission")
     : permission)
    : permission)

let user_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maximum_length = option_of_yojson (value_for_key integer_of_yojson "MaximumLength") _list path;
     permission = value_for_key permission_of_yojson "Permission" _list path;
     action = value_for_key action_of_yojson "Action" _list path;
   }
    : user_setting)

let user_setting_list_of_yojson tree path = list_of_yojson user_setting_of_yojson tree path
let arn_of_yojson = string_of_yojson
let user_attribute_value_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_type =
       value_for_key authentication_type_of_yojson "AuthenticationType" _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     last_name =
       option_of_yojson (value_for_key user_attribute_value_of_yojson "LastName") _list path;
     first_name =
       option_of_yojson (value_for_key user_attribute_value_of_yojson "FirstName") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     enabled = option_of_yojson (value_for_key boolean__of_yojson "Enabled") _list path;
     user_name = option_of_yojson (value_for_key username_of_yojson "UserName") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
   }
    : user)

let user_list_of_yojson tree path = list_of_yojson user_of_yojson tree path
let user_id_of_yojson = string_of_yojson

let user_control_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "VIEW_STOP" -> VIEW_STOP
    | `String "VIEW_ONLY" -> VIEW_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "UserControlMode" value)
    | _ -> raise (deserialize_wrong_type_error path "UserControlMode")
     : user_control_mode)
    : user_control_mode)

let usb_device_filter_string_of_yojson = string_of_yojson

let usb_device_filter_strings_of_yojson tree path =
  list_of_yojson usb_device_filter_string_of_yojson tree path

let usage_report_schedule_of_yojson (tree : t) path =
  ((match tree with
    | `String "DAILY" -> DAILY
    | `String value -> raise (deserialize_unknown_enum_value_error path "UsageReportSchedule" value)
    | _ -> raise (deserialize_wrong_type_error path "UsageReportSchedule")
     : usage_report_schedule)
    : usage_report_schedule)

let usage_report_execution_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVICE_ERROR" -> INTERNAL_SERVICE_ERROR
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String "RESOURCE_NOT_FOUND" -> RESOURCE_NOT_FOUND
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UsageReportExecutionErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "UsageReportExecutionErrorCode")
     : usage_report_execution_error_code)
    : usage_report_execution_error_code)

let last_report_generation_execution_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson
         (value_for_key usage_report_execution_error_code_of_yojson "ErrorCode")
         _list path;
   }
    : last_report_generation_execution_error)

let last_report_generation_execution_errors_of_yojson tree path =
  list_of_yojson last_report_generation_execution_error_of_yojson tree path

let usage_report_subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscription_errors =
       option_of_yojson
         (value_for_key last_report_generation_execution_errors_of_yojson "SubscriptionErrors")
         _list path;
     last_generated_report_date =
       option_of_yojson (value_for_key timestamp_of_yojson "LastGeneratedReportDate") _list path;
     schedule =
       option_of_yojson (value_for_key usage_report_schedule_of_yojson "Schedule") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
   }
    : usage_report_subscription)

let usage_report_subscription_list_of_yojson tree path =
  list_of_yojson usage_report_subscription_of_yojson tree path

let boolean_object_of_yojson = bool_of_yojson
let url_pattern_of_yojson = string_of_yojson
let url_pattern_list_of_yojson tree path = list_of_yojson url_pattern_of_yojson tree path

let url_redirection_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     denied_urls =
       option_of_yojson (value_for_key url_pattern_list_of_yojson "DeniedUrls") _list path;
     allowed_urls =
       option_of_yojson (value_for_key url_pattern_list_of_yojson "AllowedUrls") _list path;
     enabled = value_for_key boolean_object_of_yojson "Enabled" _list path;
   }
    : url_redirection_config)

let name_of_yojson = string_of_yojson

let theme_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ThemeState" value)
    | _ -> raise (deserialize_wrong_type_error path "ThemeState")
     : theme_state)
    : theme_state)

let theme_title_text_of_yojson = string_of_yojson

let theme_styling_of_yojson (tree : t) path =
  ((match tree with
    | `String "RED" -> RED
    | `String "PINK" -> PINK
    | `String "BLUE" -> BLUE
    | `String "LIGHT_BLUE" -> LIGHT_BLUE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ThemeStyling" value)
    | _ -> raise (deserialize_wrong_type_error path "ThemeStyling")
     : theme_styling)
    : theme_styling)

let theme_footer_link_display_name_of_yojson = string_of_yojson
let theme_footer_link_ur_l_of_yojson = string_of_yojson

let theme_footer_link_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     footer_link_ur_l =
       option_of_yojson (value_for_key theme_footer_link_ur_l_of_yojson "FooterLinkURL") _list path;
     display_name =
       option_of_yojson
         (value_for_key theme_footer_link_display_name_of_yojson "DisplayName")
         _list path;
   }
    : theme_footer_link)

let theme_footer_links_of_yojson tree path = list_of_yojson theme_footer_link_of_yojson tree path

let theme_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     theme_favicon_ur_l =
       option_of_yojson (value_for_key string__of_yojson "ThemeFaviconURL") _list path;
     theme_organization_logo_ur_l =
       option_of_yojson (value_for_key string__of_yojson "ThemeOrganizationLogoURL") _list path;
     theme_footer_links =
       option_of_yojson (value_for_key theme_footer_links_of_yojson "ThemeFooterLinks") _list path;
     theme_styling =
       option_of_yojson (value_for_key theme_styling_of_yojson "ThemeStyling") _list path;
     theme_title_text =
       option_of_yojson (value_for_key theme_title_text_of_yojson "ThemeTitleText") _list path;
     state = option_of_yojson (value_for_key theme_state_of_yojson "State") _list path;
     stack_name = option_of_yojson (value_for_key name_of_yojson "StackName") _list path;
   }
    : theme)

let update_theme_for_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ theme = option_of_yojson (value_for_key theme_of_yojson "Theme") _list path }
    : update_theme_for_stack_result)

let s3_bucket_of_yojson = string_of_yojson
let s3_key_of_yojson = string_of_yojson

let s3_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_key = option_of_yojson (value_for_key s3_key_of_yojson "S3Key") _list path;
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
   }
    : s3_location)

let theme_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "FOOTER_LINKS" -> FOOTER_LINKS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ThemeAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "ThemeAttribute")
     : theme_attribute)
    : theme_attribute)

let theme_attributes_of_yojson tree path = list_of_yojson theme_attribute_of_yojson tree path

let update_theme_for_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes_to_delete =
       option_of_yojson (value_for_key theme_attributes_of_yojson "AttributesToDelete") _list path;
     state = option_of_yojson (value_for_key theme_state_of_yojson "State") _list path;
     favicon_s3_location =
       option_of_yojson (value_for_key s3_location_of_yojson "FaviconS3Location") _list path;
     organization_logo_s3_location =
       option_of_yojson
         (value_for_key s3_location_of_yojson "OrganizationLogoS3Location")
         _list path;
     theme_styling =
       option_of_yojson (value_for_key theme_styling_of_yojson "ThemeStyling") _list path;
     title_text = option_of_yojson (value_for_key theme_title_text_of_yojson "TitleText") _list path;
     footer_links =
       option_of_yojson (value_for_key theme_footer_links_of_yojson "FooterLinks") _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
   }
    : update_theme_for_stack_request)

let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let operation_not_permitted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : operation_not_permitted_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let invalid_parameter_combination_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_parameter_combination_exception)

let invalid_account_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_account_status_exception)

let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : concurrent_modification_exception)

let storage_connector_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONE_DRIVE" -> ONE_DRIVE
    | `String "GOOGLE_DRIVE" -> GOOGLE_DRIVE
    | `String "HOMEFOLDERS" -> HOMEFOLDERS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageConnectorType" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageConnectorType")
     : storage_connector_type)
    : storage_connector_type)

let resource_identifier_of_yojson = string_of_yojson
let domain_of_yojson = string_of_yojson
let domain_list_of_yojson tree path = list_of_yojson domain_of_yojson tree path

let storage_connector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domains_require_admin_consent =
       option_of_yojson
         (value_for_key domain_list_of_yojson "DomainsRequireAdminConsent")
         _list path;
     domains = option_of_yojson (value_for_key domain_list_of_yojson "Domains") _list path;
     resource_identifier =
       option_of_yojson
         (value_for_key resource_identifier_of_yojson "ResourceIdentifier")
         _list path;
     connector_type = value_for_key storage_connector_type_of_yojson "ConnectorType" _list path;
   }
    : storage_connector)

let storage_connector_list_of_yojson tree path =
  list_of_yojson storage_connector_of_yojson tree path

let redirect_ur_l_of_yojson = string_of_yojson
let feedback_ur_l_of_yojson = string_of_yojson

let stack_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVICE_ERROR" -> INTERNAL_SERVICE_ERROR
    | `String "STORAGE_CONNECTOR_ERROR" -> STORAGE_CONNECTOR_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "StackErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "StackErrorCode")
     : stack_error_code)
    : stack_error_code)

let stack_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key stack_error_code_of_yojson "ErrorCode") _list path;
   }
    : stack_error)

let stack_errors_of_yojson tree path = list_of_yojson stack_error_of_yojson tree path
let settings_group_of_yojson = string_of_yojson

let application_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
     settings_group =
       option_of_yojson (value_for_key settings_group_of_yojson "SettingsGroup") _list path;
     enabled = option_of_yojson (value_for_key boolean__of_yojson "Enabled") _list path;
   }
    : application_settings_response)

let access_endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STREAMING" -> STREAMING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccessEndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessEndpointType")
     : access_endpoint_type)
    : access_endpoint_type)

let access_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpce_id = option_of_yojson (value_for_key string__of_yojson "VpceId") _list path;
     endpoint_type = value_for_key access_endpoint_type_of_yojson "EndpointType" _list path;
   }
    : access_endpoint)

let access_endpoint_list_of_yojson tree path = list_of_yojson access_endpoint_of_yojson tree path
let embed_host_domain_of_yojson = string_of_yojson
let embed_host_domains_of_yojson tree path = list_of_yojson embed_host_domain_of_yojson tree path

let preferred_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "UDP" -> UDP
    | `String "TCP" -> TCP
    | `String value -> raise (deserialize_unknown_enum_value_error path "PreferredProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "PreferredProtocol")
     : preferred_protocol)
    : preferred_protocol)

let streaming_experience_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preferred_protocol =
       option_of_yojson (value_for_key preferred_protocol_of_yojson "PreferredProtocol") _list path;
   }
    : streaming_experience_settings)

let content_redirection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     host_to_client =
       option_of_yojson (value_for_key url_redirection_config_of_yojson "HostToClient") _list path;
   }
    : content_redirection)

let agent_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "FORWARD_MCP_TOOLS" -> FORWARD_MCP_TOOLS
    | `String "COMPUTER_INPUT" -> COMPUTER_INPUT
    | `String "COMPUTER_VISION" -> COMPUTER_VISION
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgentAction" value)
    | _ -> raise (deserialize_wrong_type_error path "AgentAction")
     : agent_action)
    : agent_action)

let agent_access_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     permission = value_for_key permission_of_yojson "Permission" _list path;
     agent_action = value_for_key agent_action_of_yojson "AgentAction" _list path;
   }
    : agent_access_setting)

let agent_access_setting_list_of_yojson tree path =
  list_of_yojson agent_access_setting_of_yojson tree path

let s3_bucket_arn_of_yojson = string_of_yojson

let screen_resolution_of_yojson (tree : t) path =
  ((match tree with
    | `String "W_1280xH_720" -> W_1280xH_720
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScreenResolution" value)
    | _ -> raise (deserialize_wrong_type_error path "ScreenResolution")
     : screen_resolution)
    : screen_resolution)

let screen_image_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "JPEG" -> JPEG
    | `String "PNG" -> PNG
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScreenImageFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ScreenImageFormat")
     : screen_image_format)
    : screen_image_format)

let agent_access_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_control_mode =
       option_of_yojson (value_for_key user_control_mode_of_yojson "UserControlMode") _list path;
     screen_image_format =
       value_for_key screen_image_format_of_yojson "ScreenImageFormat" _list path;
     screen_resolution = value_for_key screen_resolution_of_yojson "ScreenResolution" _list path;
     screenshots_upload_enabled =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "ScreenshotsUploadEnabled")
         _list path;
     s3_bucket_arn =
       option_of_yojson (value_for_key s3_bucket_arn_of_yojson "S3BucketArn") _list path;
     settings = value_for_key agent_access_setting_list_of_yojson "Settings" _list path;
   }
    : agent_access_config)

let stack_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_access_config =
       option_of_yojson (value_for_key agent_access_config_of_yojson "AgentAccessConfig") _list path;
     content_redirection =
       option_of_yojson
         (value_for_key content_redirection_of_yojson "ContentRedirection")
         _list path;
     streaming_experience_settings =
       option_of_yojson
         (value_for_key streaming_experience_settings_of_yojson "StreamingExperienceSettings")
         _list path;
     embed_host_domains =
       option_of_yojson (value_for_key embed_host_domains_of_yojson "EmbedHostDomains") _list path;
     access_endpoints =
       option_of_yojson (value_for_key access_endpoint_list_of_yojson "AccessEndpoints") _list path;
     application_settings =
       option_of_yojson
         (value_for_key application_settings_response_of_yojson "ApplicationSettings")
         _list path;
     user_settings =
       option_of_yojson (value_for_key user_setting_list_of_yojson "UserSettings") _list path;
     stack_errors = option_of_yojson (value_for_key stack_errors_of_yojson "StackErrors") _list path;
     feedback_ur_l =
       option_of_yojson (value_for_key feedback_ur_l_of_yojson "FeedbackURL") _list path;
     redirect_ur_l =
       option_of_yojson (value_for_key redirect_ur_l_of_yojson "RedirectURL") _list path;
     storage_connectors =
       option_of_yojson
         (value_for_key storage_connector_list_of_yojson "StorageConnectors")
         _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     display_name = option_of_yojson (value_for_key string__of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
   }
    : stack)

let update_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ stack = option_of_yojson (value_for_key stack_of_yojson "Stack") _list path }
    : update_stack_result)

let display_name_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson

let stack_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "AGENT_ACCESS_CONFIG" -> AGENT_ACCESS_CONFIG
    | `String "CONTENT_REDIRECTION" -> CONTENT_REDIRECTION
    | `String "STREAMING_EXPERIENCE_SETTINGS" -> STREAMING_EXPERIENCE_SETTINGS
    | `String "ACCESS_ENDPOINTS" -> ACCESS_ENDPOINTS
    | `String "IAM_ROLE_ARN" -> IAM_ROLE_ARN
    | `String "EMBED_HOST_DOMAINS" -> EMBED_HOST_DOMAINS
    | `String "USER_SETTINGS" -> USER_SETTINGS
    | `String "THEME_NAME" -> THEME_NAME
    | `String "FEEDBACK_URL" -> FEEDBACK_URL
    | `String "REDIRECT_URL" -> REDIRECT_URL
    | `String "STORAGE_CONNECTOR_ONE_DRIVE" -> STORAGE_CONNECTOR_ONE_DRIVE
    | `String "STORAGE_CONNECTOR_GOOGLE_DRIVE" -> STORAGE_CONNECTOR_GOOGLE_DRIVE
    | `String "STORAGE_CONNECTOR_HOMEFOLDERS" -> STORAGE_CONNECTOR_HOMEFOLDERS
    | `String "STORAGE_CONNECTORS" -> STORAGE_CONNECTORS
    | `String value -> raise (deserialize_unknown_enum_value_error path "StackAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "StackAttribute")
     : stack_attribute)
    : stack_attribute)

let stack_attributes_of_yojson tree path = list_of_yojson stack_attribute_of_yojson tree path

let application_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     settings_group =
       option_of_yojson (value_for_key settings_group_of_yojson "SettingsGroup") _list path;
     enabled = value_for_key boolean__of_yojson "Enabled" _list path;
   }
    : application_settings)

let agent_access_config_for_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_control_mode =
       option_of_yojson (value_for_key user_control_mode_of_yojson "UserControlMode") _list path;
     screen_image_format =
       option_of_yojson (value_for_key screen_image_format_of_yojson "ScreenImageFormat") _list path;
     screen_resolution =
       option_of_yojson (value_for_key screen_resolution_of_yojson "ScreenResolution") _list path;
     screenshots_upload_enabled =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "ScreenshotsUploadEnabled")
         _list path;
     s3_bucket_arn =
       option_of_yojson (value_for_key s3_bucket_arn_of_yojson "S3BucketArn") _list path;
     settings =
       option_of_yojson (value_for_key agent_access_setting_list_of_yojson "Settings") _list path;
   }
    : agent_access_config_for_update)

let update_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_access_config =
       option_of_yojson
         (value_for_key agent_access_config_for_update_of_yojson "AgentAccessConfig")
         _list path;
     content_redirection =
       option_of_yojson
         (value_for_key content_redirection_of_yojson "ContentRedirection")
         _list path;
     streaming_experience_settings =
       option_of_yojson
         (value_for_key streaming_experience_settings_of_yojson "StreamingExperienceSettings")
         _list path;
     embed_host_domains =
       option_of_yojson (value_for_key embed_host_domains_of_yojson "EmbedHostDomains") _list path;
     access_endpoints =
       option_of_yojson (value_for_key access_endpoint_list_of_yojson "AccessEndpoints") _list path;
     application_settings =
       option_of_yojson
         (value_for_key application_settings_of_yojson "ApplicationSettings")
         _list path;
     user_settings =
       option_of_yojson (value_for_key user_setting_list_of_yojson "UserSettings") _list path;
     attributes_to_delete =
       option_of_yojson (value_for_key stack_attributes_of_yojson "AttributesToDelete") _list path;
     feedback_ur_l =
       option_of_yojson (value_for_key feedback_ur_l_of_yojson "FeedbackURL") _list path;
     redirect_ur_l =
       option_of_yojson (value_for_key redirect_ur_l_of_yojson "RedirectURL") _list path;
     delete_storage_connectors =
       option_of_yojson (value_for_key boolean__of_yojson "DeleteStorageConnectors") _list path;
     storage_connectors =
       option_of_yojson
         (value_for_key storage_connector_list_of_yojson "StorageConnectors")
         _list path;
     name = value_for_key string__of_yojson "Name" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
   }
    : update_stack_request)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_in_use_exception)

let invalid_role_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_role_exception)

let incompatible_image_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : incompatible_image_exception)

let update_image_permissions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let aws_account_id_of_yojson = string_of_yojson

let image_permissions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     allow_image_builder =
       option_of_yojson (value_for_key boolean_object_of_yojson "allowImageBuilder") _list path;
     allow_fleet = option_of_yojson (value_for_key boolean_object_of_yojson "allowFleet") _list path;
   }
    : image_permissions)

let update_image_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_permissions = value_for_key image_permissions_of_yojson "ImagePermissions" _list path;
     shared_account_id = value_for_key aws_account_id_of_yojson "SharedAccountId" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : update_image_permissions_request)

let resource_not_available_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_available_exception)

let fleet_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ELASTIC" -> ELASTIC
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String "ALWAYS_ON" -> ALWAYS_ON
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetType" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetType")
     : fleet_type)
    : fleet_type)

let compute_capacity_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     drain_mode_unused_user_sessions =
       option_of_yojson (value_for_key integer_of_yojson "DrainModeUnusedUserSessions") _list path;
     drain_mode_active_user_sessions =
       option_of_yojson (value_for_key integer_of_yojson "DrainModeActiveUserSessions") _list path;
     draining = option_of_yojson (value_for_key integer_of_yojson "Draining") _list path;
     actual_user_sessions =
       option_of_yojson (value_for_key integer_of_yojson "ActualUserSessions") _list path;
     active_user_sessions =
       option_of_yojson (value_for_key integer_of_yojson "ActiveUserSessions") _list path;
     available_user_sessions =
       option_of_yojson (value_for_key integer_of_yojson "AvailableUserSessions") _list path;
     desired_user_sessions =
       option_of_yojson (value_for_key integer_of_yojson "DesiredUserSessions") _list path;
     available = option_of_yojson (value_for_key integer_of_yojson "Available") _list path;
     in_use = option_of_yojson (value_for_key integer_of_yojson "InUse") _list path;
     running = option_of_yojson (value_for_key integer_of_yojson "Running") _list path;
     desired = value_for_key integer_of_yojson "Desired" _list path;
   }
    : compute_capacity_status)

let fleet_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "RUNNING" -> RUNNING
    | `String "STARTING" -> STARTING
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetState" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetState")
     : fleet_state)
    : fleet_state)

let fleet_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALIDATION_ERROR" -> VALIDATION_ERROR
    | `String "DOMAIN_JOIN_INTERNAL_SERVICE_ERROR" -> DOMAIN_JOIN_INTERNAL_SERVICE_ERROR
    | `String "DOMAIN_JOIN_NERR_PASSWORD_EXPIRED" -> DOMAIN_JOIN_NERR_PASSWORD_EXPIRED
    | `String "DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED" ->
        DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED
    | `String "DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED" -> DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED
    | `String "DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME" -> DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME
    | `String "DOMAIN_JOIN_ERROR_NOT_SUPPORTED" -> DOMAIN_JOIN_ERROR_NOT_SUPPORTED
    | `String "DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN" -> DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN
    | `String "DOMAIN_JOIN_ERROR_MORE_DATA" -> DOMAIN_JOIN_ERROR_MORE_DATA
    | `String "DOMAIN_JOIN_ERROR_INVALID_PARAMETER" -> DOMAIN_JOIN_ERROR_INVALID_PARAMETER
    | `String "DOMAIN_JOIN_ERROR_LOGON_FAILURE" -> DOMAIN_JOIN_ERROR_LOGON_FAILURE
    | `String "DOMAIN_JOIN_ERROR_ACCESS_DENIED" -> DOMAIN_JOIN_ERROR_ACCESS_DENIED
    | `String "DOMAIN_JOIN_ERROR_FILE_NOT_FOUND" -> DOMAIN_JOIN_ERROR_FILE_NOT_FOUND
    | `String "FLEET_INSTANCE_PROVISIONING_FAILURE" -> FLEET_INSTANCE_PROVISIONING_FAILURE
    | `String "FLEET_STOPPED" -> FLEET_STOPPED
    | `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION
    | `String "IGW_NOT_ATTACHED" -> IGW_NOT_ATTACHED
    | `String "SECURITY_GROUPS_NOT_FOUND" -> SECURITY_GROUPS_NOT_FOUND
    | `String "INVALID_SUBNET_CONFIGURATION" -> INVALID_SUBNET_CONFIGURATION
    | `String "IMAGE_NOT_FOUND" -> IMAGE_NOT_FOUND
    | `String "SUBNET_NOT_FOUND" -> SUBNET_NOT_FOUND
    | `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION
    | `String "SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES" -> SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES
    | `String "STS_DISABLED_IN_REGION" -> STS_DISABLED_IN_REGION
    | `String "MACHINE_ROLE_IS_MISSING" -> MACHINE_ROLE_IS_MISSING
    | `String "IAM_SERVICE_ROLE_IS_MISSING" -> IAM_SERVICE_ROLE_IS_MISSING
    | `String "INTERNAL_SERVICE_ERROR" -> INTERNAL_SERVICE_ERROR
    | `String "NETWORK_INTERFACE_LIMIT_EXCEEDED" -> NETWORK_INTERFACE_LIMIT_EXCEEDED
    | `String "IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION
    | `String "IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION
    | `String "IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION" ->
        IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetErrorCode")
     : fleet_error_code)
    : fleet_error_code)

let fleet_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key fleet_error_code_of_yojson "ErrorCode") _list path;
   }
    : fleet_error)

let fleet_errors_of_yojson tree path = list_of_yojson fleet_error_of_yojson tree path
let directory_name_of_yojson = string_of_yojson
let organizational_unit_distinguished_name_of_yojson = string_of_yojson

let domain_join_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     organizational_unit_distinguished_name =
       option_of_yojson
         (value_for_key organizational_unit_distinguished_name_of_yojson
            "OrganizationalUnitDistinguishedName")
         _list path;
     directory_name =
       option_of_yojson (value_for_key directory_name_of_yojson "DirectoryName") _list path;
   }
    : domain_join_info)

let stream_view_of_yojson (tree : t) path =
  ((match tree with
    | `String "DESKTOP" -> DESKTOP
    | `String "APP" -> APP
    | `String value -> raise (deserialize_unknown_enum_value_error path "StreamView" value)
    | _ -> raise (deserialize_wrong_type_error path "StreamView")
     : stream_view)
    : stream_view)

let platform_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UBUNTU_PRO_2404" -> UBUNTU_PRO_2404
    | `String "ROCKY_LINUX8" -> ROCKY_LINUX8
    | `String "RHEL8" -> RHEL8
    | `String "AMAZON_LINUX2" -> AMAZON_LINUX2
    | `String "WINDOWS_SERVER_2025" -> WINDOWS_SERVER_2025
    | `String "WINDOWS_SERVER_2022" -> WINDOWS_SERVER_2022
    | `String "WINDOWS_SERVER_2019" -> WINDOWS_SERVER_2019
    | `String "WINDOWS_SERVER_2016" -> WINDOWS_SERVER_2016
    | `String "WINDOWS" -> WINDOWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlatformType" value)
    | _ -> raise (deserialize_wrong_type_error path "PlatformType")
     : platform_type)
    : platform_type)

let fleet_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_imds_v1 =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableIMDSV1") _list path;
     root_volume_config =
       option_of_yojson (value_for_key volume_config_of_yojson "RootVolumeConfig") _list path;
     max_sessions_per_instance =
       option_of_yojson (value_for_key integer_of_yojson "MaxSessionsPerInstance") _list path;
     session_script_s3_location =
       option_of_yojson (value_for_key s3_location_of_yojson "SessionScriptS3Location") _list path;
     usb_device_filter_strings =
       option_of_yojson
         (value_for_key usb_device_filter_strings_of_yojson "UsbDeviceFilterStrings")
         _list path;
     max_concurrent_sessions =
       option_of_yojson (value_for_key integer_of_yojson "MaxConcurrentSessions") _list path;
     platform = option_of_yojson (value_for_key platform_type_of_yojson "Platform") _list path;
     stream_view = option_of_yojson (value_for_key stream_view_of_yojson "StreamView") _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     idle_disconnect_timeout_in_seconds =
       option_of_yojson
         (value_for_key integer_of_yojson "IdleDisconnectTimeoutInSeconds")
         _list path;
     domain_join_info =
       option_of_yojson (value_for_key domain_join_info_of_yojson "DomainJoinInfo") _list path;
     enable_default_internet_access =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDefaultInternetAccess")
         _list path;
     fleet_errors = option_of_yojson (value_for_key fleet_errors_of_yojson "FleetErrors") _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     state = value_for_key fleet_state_of_yojson "State" _list path;
     disconnect_timeout_in_seconds =
       option_of_yojson (value_for_key integer_of_yojson "DisconnectTimeoutInSeconds") _list path;
     max_user_duration_in_seconds =
       option_of_yojson (value_for_key integer_of_yojson "MaxUserDurationInSeconds") _list path;
     compute_capacity_status =
       value_for_key compute_capacity_status_of_yojson "ComputeCapacityStatus" _list path;
     fleet_type = option_of_yojson (value_for_key fleet_type_of_yojson "FleetType") _list path;
     instance_type = value_for_key string__of_yojson "InstanceType" _list path;
     image_arn = option_of_yojson (value_for_key arn_of_yojson "ImageArn") _list path;
     image_name = option_of_yojson (value_for_key string__of_yojson "ImageName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     display_name = option_of_yojson (value_for_key string__of_yojson "DisplayName") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : fleet)

let update_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet = option_of_yojson (value_for_key fleet_of_yojson "Fleet") _list path }
    : update_fleet_result)

let compute_capacity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_sessions =
       option_of_yojson (value_for_key integer_of_yojson "DesiredSessions") _list path;
     desired_instances =
       option_of_yojson (value_for_key integer_of_yojson "DesiredInstances") _list path;
   }
    : compute_capacity)

let fleet_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "VOLUME_CONFIGURATION" -> VOLUME_CONFIGURATION
    | `String "MAX_SESSIONS_PER_INSTANCE" -> MAX_SESSIONS_PER_INSTANCE
    | `String "SESSION_SCRIPT_S3_LOCATION" -> SESSION_SCRIPT_S3_LOCATION
    | `String "USB_DEVICE_FILTER_STRINGS" -> USB_DEVICE_FILTER_STRINGS
    | `String "IAM_ROLE_ARN" -> IAM_ROLE_ARN
    | `String "DOMAIN_JOIN_INFO" -> DOMAIN_JOIN_INFO
    | `String "VPC_CONFIGURATION_SECURITY_GROUP_IDS" -> VPC_CONFIGURATION_SECURITY_GROUP_IDS
    | `String "VPC_CONFIGURATION" -> VPC_CONFIGURATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "FleetAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "FleetAttribute")
     : fleet_attribute)
    : fleet_attribute)

let fleet_attributes_of_yojson tree path = list_of_yojson fleet_attribute_of_yojson tree path

let update_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_imds_v1 =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableIMDSV1") _list path;
     root_volume_config =
       option_of_yojson (value_for_key volume_config_of_yojson "RootVolumeConfig") _list path;
     max_sessions_per_instance =
       option_of_yojson (value_for_key integer_of_yojson "MaxSessionsPerInstance") _list path;
     session_script_s3_location =
       option_of_yojson (value_for_key s3_location_of_yojson "SessionScriptS3Location") _list path;
     usb_device_filter_strings =
       option_of_yojson
         (value_for_key usb_device_filter_strings_of_yojson "UsbDeviceFilterStrings")
         _list path;
     max_concurrent_sessions =
       option_of_yojson (value_for_key integer_of_yojson "MaxConcurrentSessions") _list path;
     platform = option_of_yojson (value_for_key platform_type_of_yojson "Platform") _list path;
     stream_view = option_of_yojson (value_for_key stream_view_of_yojson "StreamView") _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     attributes_to_delete =
       option_of_yojson (value_for_key fleet_attributes_of_yojson "AttributesToDelete") _list path;
     idle_disconnect_timeout_in_seconds =
       option_of_yojson
         (value_for_key integer_of_yojson "IdleDisconnectTimeoutInSeconds")
         _list path;
     domain_join_info =
       option_of_yojson (value_for_key domain_join_info_of_yojson "DomainJoinInfo") _list path;
     enable_default_internet_access =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDefaultInternetAccess")
         _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     delete_vpc_config =
       option_of_yojson (value_for_key boolean__of_yojson "DeleteVpcConfig") _list path;
     disconnect_timeout_in_seconds =
       option_of_yojson (value_for_key integer_of_yojson "DisconnectTimeoutInSeconds") _list path;
     max_user_duration_in_seconds =
       option_of_yojson (value_for_key integer_of_yojson "MaxUserDurationInSeconds") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     compute_capacity =
       option_of_yojson (value_for_key compute_capacity_of_yojson "ComputeCapacity") _list path;
     instance_type = option_of_yojson (value_for_key string__of_yojson "InstanceType") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     image_arn = option_of_yojson (value_for_key arn_of_yojson "ImageArn") _list path;
     image_name = option_of_yojson (value_for_key string__of_yojson "ImageName") _list path;
   }
    : update_fleet_request)

let request_limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : request_limit_exceeded_exception)

let app_visibility_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASSOCIATED" -> ASSOCIATED
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "AppVisibility" value)
    | _ -> raise (deserialize_wrong_type_error path "AppVisibility")
     : app_visibility)
    : app_visibility)

let entitlement_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key string__of_yojson "Value" _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : entitlement_attribute)

let entitlement_attribute_list_of_yojson tree path =
  list_of_yojson entitlement_attribute_of_yojson tree path

let entitlement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     attributes = value_for_key entitlement_attribute_list_of_yojson "Attributes" _list path;
     app_visibility = value_for_key app_visibility_of_yojson "AppVisibility" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : entitlement)

let update_entitlement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entitlement = option_of_yojson (value_for_key entitlement_of_yojson "Entitlement") _list path }
    : update_entitlement_result)

let update_entitlement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       option_of_yojson (value_for_key entitlement_attribute_list_of_yojson "Attributes") _list path;
     app_visibility =
       option_of_yojson (value_for_key app_visibility_of_yojson "AppVisibility") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : update_entitlement_request)

let entitlement_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : entitlement_not_found_exception)

let organizational_unit_distinguished_names_list_of_yojson tree path =
  list_of_yojson organizational_unit_distinguished_name_of_yojson tree path

let account_name_of_yojson = string_of_yojson
let account_password_of_yojson = string_of_yojson

let service_account_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_password = value_for_key account_password_of_yojson "AccountPassword" _list path;
     account_name = value_for_key account_name_of_yojson "AccountName" _list path;
   }
    : service_account_credentials)

let certificate_based_auth_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED_NO_DIRECTORY_LOGIN_FALLBACK" -> ENABLED_NO_DIRECTORY_LOGIN_FALLBACK
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CertificateBasedAuthStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CertificateBasedAuthStatus")
     : certificate_based_auth_status)
    : certificate_based_auth_status)

let certificate_based_auth_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_authority_arn =
       option_of_yojson (value_for_key arn_of_yojson "CertificateAuthorityArn") _list path;
     status =
       option_of_yojson (value_for_key certificate_based_auth_status_of_yojson "Status") _list path;
   }
    : certificate_based_auth_properties)

let directory_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_based_auth_properties =
       option_of_yojson
         (value_for_key certificate_based_auth_properties_of_yojson "CertificateBasedAuthProperties")
         _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     service_account_credentials =
       option_of_yojson
         (value_for_key service_account_credentials_of_yojson "ServiceAccountCredentials")
         _list path;
     organizational_unit_distinguished_names =
       option_of_yojson
         (value_for_key organizational_unit_distinguished_names_list_of_yojson
            "OrganizationalUnitDistinguishedNames")
         _list path;
     directory_name = value_for_key directory_name_of_yojson "DirectoryName" _list path;
   }
    : directory_config)

let update_directory_config_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_config =
       option_of_yojson (value_for_key directory_config_of_yojson "DirectoryConfig") _list path;
   }
    : update_directory_config_result)

let update_directory_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_based_auth_properties =
       option_of_yojson
         (value_for_key certificate_based_auth_properties_of_yojson "CertificateBasedAuthProperties")
         _list path;
     service_account_credentials =
       option_of_yojson
         (value_for_key service_account_credentials_of_yojson "ServiceAccountCredentials")
         _list path;
     organizational_unit_distinguished_names =
       option_of_yojson
         (value_for_key organizational_unit_distinguished_names_list_of_yojson
            "OrganizationalUnitDistinguishedNames")
         _list path;
     directory_name = value_for_key directory_name_of_yojson "DirectoryName" _list path;
   }
    : update_directory_config_request)

let metadata_of_yojson tree path = map_of_yojson string__of_yojson string__of_yojson tree path
let platforms_of_yojson tree path = list_of_yojson platform_type_of_yojson tree path
let string_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let application_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     instance_families =
       option_of_yojson (value_for_key string_list_of_yojson "InstanceFamilies") _list path;
     platforms = option_of_yojson (value_for_key platforms_of_yojson "Platforms") _list path;
     icon_s3_location =
       option_of_yojson (value_for_key s3_location_of_yojson "IconS3Location") _list path;
     app_block_arn = option_of_yojson (value_for_key arn_of_yojson "AppBlockArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     working_directory =
       option_of_yojson (value_for_key string__of_yojson "WorkingDirectory") _list path;
     metadata = option_of_yojson (value_for_key metadata_of_yojson "Metadata") _list path;
     enabled = option_of_yojson (value_for_key boolean__of_yojson "Enabled") _list path;
     launch_parameters =
       option_of_yojson (value_for_key string__of_yojson "LaunchParameters") _list path;
     launch_path = option_of_yojson (value_for_key string__of_yojson "LaunchPath") _list path;
     icon_ur_l = option_of_yojson (value_for_key string__of_yojson "IconURL") _list path;
     display_name = option_of_yojson (value_for_key string__of_yojson "DisplayName") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
   }
    : application)

let update_application_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application = option_of_yojson (value_for_key application_of_yojson "Application") _list path }
    : update_application_result)

let application_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "WORKING_DIRECTORY" -> WORKING_DIRECTORY
    | `String "LAUNCH_PARAMETERS" -> LAUNCH_PARAMETERS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ApplicationAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "ApplicationAttribute")
     : application_attribute)
    : application_attribute)

let application_attributes_of_yojson tree path =
  list_of_yojson application_attribute_of_yojson tree path

let update_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes_to_delete =
       option_of_yojson
         (value_for_key application_attributes_of_yojson "AttributesToDelete")
         _list path;
     app_block_arn = option_of_yojson (value_for_key arn_of_yojson "AppBlockArn") _list path;
     launch_parameters =
       option_of_yojson (value_for_key string__of_yojson "LaunchParameters") _list path;
     working_directory =
       option_of_yojson (value_for_key string__of_yojson "WorkingDirectory") _list path;
     launch_path = option_of_yojson (value_for_key string__of_yojson "LaunchPath") _list path;
     icon_s3_location =
       option_of_yojson (value_for_key s3_location_of_yojson "IconS3Location") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : update_application_request)

let app_block_builder_platform_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WINDOWS_SERVER_2019" -> WINDOWS_SERVER_2019
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AppBlockBuilderPlatformType" value)
    | _ -> raise (deserialize_wrong_type_error path "AppBlockBuilderPlatformType")
     : app_block_builder_platform_type)
    : app_block_builder_platform_type)

let app_block_builder_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "RUNNING" -> RUNNING
    | `String "STARTING" -> STARTING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AppBlockBuilderState" value)
    | _ -> raise (deserialize_wrong_type_error path "AppBlockBuilderState")
     : app_block_builder_state)
    : app_block_builder_state)

let resource_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "ErrorTimestamp") _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key fleet_error_code_of_yojson "ErrorCode") _list path;
   }
    : resource_error)

let resource_errors_of_yojson tree path = list_of_yojson resource_error_of_yojson tree path

let app_block_builder_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AppBlockBuilderStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AppBlockBuilderStateChangeReasonCode")
     : app_block_builder_state_change_reason_code)
    : app_block_builder_state_change_reason_code)

let app_block_builder_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson
         (value_for_key app_block_builder_state_change_reason_code_of_yojson "Code")
         _list path;
   }
    : app_block_builder_state_change_reason)

let app_block_builder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_imds_v1 =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableIMDSV1") _list path;
     access_endpoints =
       option_of_yojson (value_for_key access_endpoint_list_of_yojson "AccessEndpoints") _list path;
     state_change_reason =
       option_of_yojson
         (value_for_key app_block_builder_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     app_block_builder_errors =
       option_of_yojson (value_for_key resource_errors_of_yojson "AppBlockBuilderErrors") _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     state = value_for_key app_block_builder_state_of_yojson "State" _list path;
     vpc_config = value_for_key vpc_config_of_yojson "VpcConfig" _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     enable_default_internet_access =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDefaultInternetAccess")
         _list path;
     instance_type = value_for_key string__of_yojson "InstanceType" _list path;
     platform = value_for_key app_block_builder_platform_type_of_yojson "Platform" _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     display_name = option_of_yojson (value_for_key string__of_yojson "DisplayName") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
   }
    : app_block_builder)

let update_app_block_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_builder =
       option_of_yojson (value_for_key app_block_builder_of_yojson "AppBlockBuilder") _list path;
   }
    : update_app_block_builder_result)

let app_block_builder_attribute_of_yojson (tree : t) path =
  ((match tree with
    | `String "VPC_CONFIGURATION_SECURITY_GROUP_IDS" -> VPC_CONFIGURATION_SECURITY_GROUP_IDS
    | `String "ACCESS_ENDPOINTS" -> ACCESS_ENDPOINTS
    | `String "IAM_ROLE_ARN" -> IAM_ROLE_ARN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AppBlockBuilderAttribute" value)
    | _ -> raise (deserialize_wrong_type_error path "AppBlockBuilderAttribute")
     : app_block_builder_attribute)
    : app_block_builder_attribute)

let app_block_builder_attributes_of_yojson tree path =
  list_of_yojson app_block_builder_attribute_of_yojson tree path

let update_app_block_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_imds_v1 =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableIMDSV1") _list path;
     attributes_to_delete =
       option_of_yojson
         (value_for_key app_block_builder_attributes_of_yojson "AttributesToDelete")
         _list path;
     access_endpoints =
       option_of_yojson (value_for_key access_endpoint_list_of_yojson "AccessEndpoints") _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     enable_default_internet_access =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDefaultInternetAccess")
         _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     instance_type = option_of_yojson (value_for_key string__of_yojson "InstanceType") _list path;
     platform = option_of_yojson (value_for_key platform_type_of_yojson "Platform") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : update_app_block_builder_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let uui_d_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tags_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_of_yojson "Tags" _list path;
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let streaming_url_user_id_of_yojson = string_of_yojson

let image_builder_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_IMAGE_IMPORT" -> PENDING_IMAGE_IMPORT
    | `String "SYNCING_APPS" -> SYNCING_APPS
    | `String "PENDING_SYNCING_APPS" -> PENDING_SYNCING_APPS
    | `String "PENDING_QUALIFICATION" -> PENDING_QUALIFICATION
    | `String "UPDATING" -> UPDATING
    | `String "FAILED" -> FAILED
    | `String "DELETING" -> DELETING
    | `String "SNAPSHOTTING" -> SNAPSHOTTING
    | `String "REBOOTING" -> REBOOTING
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "RUNNING" -> RUNNING
    | `String "UPDATING_AGENT" -> UPDATING_AGENT
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageBuilderState" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageBuilderState")
     : image_builder_state)
    : image_builder_state)

let image_builder_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMAGE_UNAVAILABLE" -> IMAGE_UNAVAILABLE
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ImageBuilderStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageBuilderStateChangeReasonCode")
     : image_builder_state_change_reason_code)
    : image_builder_state_change_reason_code)

let image_builder_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson
         (value_for_key image_builder_state_change_reason_code_of_yojson "Code")
         _list path;
   }
    : image_builder_state_change_reason)

let network_access_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     eni_id = option_of_yojson (value_for_key string__of_yojson "EniId") _list path;
     eni_ipv6_addresses =
       option_of_yojson (value_for_key string_list_of_yojson "EniIpv6Addresses") _list path;
     eni_private_ip_address =
       option_of_yojson (value_for_key string__of_yojson "EniPrivateIpAddress") _list path;
   }
    : network_access_configuration)

let appstream_agent_version_of_yojson = string_of_yojson

let latest_appstream_agent_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "FALSE" -> FALSE
    | `String "TRUE" -> TRUE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LatestAppstreamAgentVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "LatestAppstreamAgentVersion")
     : latest_appstream_agent_version)
    : latest_appstream_agent_version)

let image_builder_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_imds_v1 =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableIMDSV1") _list path;
     latest_appstream_agent_version =
       option_of_yojson
         (value_for_key latest_appstream_agent_version_of_yojson "LatestAppstreamAgentVersion")
         _list path;
     root_volume_config =
       option_of_yojson (value_for_key volume_config_of_yojson "RootVolumeConfig") _list path;
     access_endpoints =
       option_of_yojson (value_for_key access_endpoint_list_of_yojson "AccessEndpoints") _list path;
     appstream_agent_version =
       option_of_yojson
         (value_for_key appstream_agent_version_of_yojson "AppstreamAgentVersion")
         _list path;
     image_builder_errors =
       option_of_yojson (value_for_key resource_errors_of_yojson "ImageBuilderErrors") _list path;
     network_access_configuration =
       option_of_yojson
         (value_for_key network_access_configuration_of_yojson "NetworkAccessConfiguration")
         _list path;
     domain_join_info =
       option_of_yojson (value_for_key domain_join_info_of_yojson "DomainJoinInfo") _list path;
     enable_default_internet_access =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDefaultInternetAccess")
         _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     state_change_reason =
       option_of_yojson
         (value_for_key image_builder_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     state = option_of_yojson (value_for_key image_builder_state_of_yojson "State") _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     platform = option_of_yojson (value_for_key platform_type_of_yojson "Platform") _list path;
     instance_type = option_of_yojson (value_for_key string__of_yojson "InstanceType") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     display_name = option_of_yojson (value_for_key string__of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     image_arn = option_of_yojson (value_for_key arn_of_yojson "ImageArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : image_builder)

let stop_image_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_builder =
       option_of_yojson (value_for_key image_builder_of_yojson "ImageBuilder") _list path;
   }
    : stop_image_builder_result)

let stop_image_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : stop_image_builder_request)

let stop_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : stop_fleet_request)

let stop_app_block_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_builder =
       option_of_yojson (value_for_key app_block_builder_of_yojson "AppBlockBuilder") _list path;
   }
    : stop_app_block_builder_result)

let stop_app_block_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_of_yojson "Name" _list path } : stop_app_block_builder_request)

let start_software_deployment_to_image_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_software_deployment_to_image_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_failed_deployments =
       option_of_yojson (value_for_key boolean__of_yojson "RetryFailedDeployments") _list path;
     image_builder_name = value_for_key name_of_yojson "ImageBuilderName" _list path;
   }
    : start_software_deployment_to_image_builder_request)

let start_image_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_builder =
       option_of_yojson (value_for_key image_builder_of_yojson "ImageBuilder") _list path;
   }
    : start_image_builder_result)

let start_image_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     appstream_agent_version =
       option_of_yojson
         (value_for_key appstream_agent_version_of_yojson "AppstreamAgentVersion")
         _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : start_image_builder_request)

let start_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let start_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : start_fleet_request)

let start_app_block_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_builder =
       option_of_yojson (value_for_key app_block_builder_of_yojson "AppBlockBuilder") _list path;
   }
    : start_app_block_builder_result)

let start_app_block_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_of_yojson "Name" _list path } : start_app_block_builder_request)

let stack_list_of_yojson tree path = list_of_yojson stack_of_yojson tree path

let software_deployment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED_TO_UNINSTALL" -> FAILED_TO_UNINSTALL
    | `String "FAILED_TO_INSTALL" -> FAILED_TO_INSTALL
    | `String "PENDING_UNINSTALLATION" -> PENDING_UNINSTALLATION
    | `String "STAGED_FOR_UNINSTALLATION" -> STAGED_FOR_UNINSTALLATION
    | `String "INSTALLED" -> INSTALLED
    | `String "PENDING_INSTALLATION" -> PENDING_INSTALLATION
    | `String "STAGED_FOR_INSTALLATION" -> STAGED_FOR_INSTALLATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SoftwareDeploymentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "SoftwareDeploymentStatus")
     : software_deployment_status)
    : software_deployment_status)

let error_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
   }
    : error_details)

let error_details_list_of_yojson tree path = list_of_yojson error_details_of_yojson tree path

let software_associations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deployment_error =
       option_of_yojson (value_for_key error_details_list_of_yojson "DeploymentError") _list path;
     status =
       option_of_yojson (value_for_key software_deployment_status_of_yojson "Status") _list path;
     software_name = option_of_yojson (value_for_key string__of_yojson "SoftwareName") _list path;
   }
    : software_associations)

let software_associations_list_of_yojson tree path =
  list_of_yojson software_associations_of_yojson tree path

let shared_image_permissions_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_permissions = value_for_key image_permissions_of_yojson "imagePermissions" _list path;
     shared_account_id = value_for_key aws_account_id_of_yojson "sharedAccountId" _list path;
   }
    : shared_image_permissions)

let shared_image_permissions_list_of_yojson tree path =
  list_of_yojson shared_image_permissions_of_yojson tree path

let session_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXPIRED" -> EXPIRED
    | `String "PENDING" -> PENDING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SessionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionState")
     : session_state)
    : session_state)

let session_connection_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_CONNECTED" -> NOT_CONNECTED
    | `String "CONNECTED" -> CONNECTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SessionConnectionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SessionConnectionState")
     : session_connection_state)
    : session_connection_state)

let instance_drain_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_APPLICABLE" -> NOT_APPLICABLE
    | `String "DRAINING" -> DRAINING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "InstanceDrainStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceDrainStatus")
     : instance_drain_status)
    : instance_drain_status)

let session_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_drain_status =
       option_of_yojson
         (value_for_key instance_drain_status_of_yojson "InstanceDrainStatus")
         _list path;
     instance_id = option_of_yojson (value_for_key string__of_yojson "InstanceId") _list path;
     network_access_configuration =
       option_of_yojson
         (value_for_key network_access_configuration_of_yojson "NetworkAccessConfiguration")
         _list path;
     authentication_type =
       option_of_yojson
         (value_for_key authentication_type_of_yojson "AuthenticationType")
         _list path;
     max_expiration_time =
       option_of_yojson (value_for_key timestamp_of_yojson "MaxExpirationTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     connection_state =
       option_of_yojson
         (value_for_key session_connection_state_of_yojson "ConnectionState")
         _list path;
     state = value_for_key session_state_of_yojson "State" _list path;
     fleet_name = value_for_key string__of_yojson "FleetName" _list path;
     stack_name = value_for_key string__of_yojson "StackName" _list path;
     user_id = value_for_key user_id_of_yojson "UserId" _list path;
     id = value_for_key string__of_yojson "Id" _list path;
   }
    : session)

let session_list_of_yojson tree path = list_of_yojson session_of_yojson tree path

let script_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout_in_seconds = value_for_key integer_of_yojson "TimeoutInSeconds" _list path;
     executable_parameters =
       option_of_yojson (value_for_key string__of_yojson "ExecutableParameters") _list path;
     executable_path = value_for_key string__of_yojson "ExecutablePath" _list path;
     script_s3_location = value_for_key s3_location_of_yojson "ScriptS3Location" _list path;
   }
    : script_details)

let instance_type_of_yojson = string_of_yojson

let runtime_validation_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     intended_instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "IntendedInstanceType") _list path;
   }
    : runtime_validation_config)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_already_exists_exception)

let region_name_of_yojson = string_of_yojson
let photon_ami_id_of_yojson = string_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let ami_name_of_yojson = string_of_yojson

let export_image_task_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "EXPORTING" -> EXPORTING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportImageTaskState" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportImageTaskState")
     : export_image_task_state)
    : export_image_task_state)

let export_image_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_details =
       option_of_yojson (value_for_key error_details_list_of_yojson "ErrorDetails") _list path;
     tag_specifications =
       option_of_yojson (value_for_key tags_of_yojson "TagSpecifications") _list path;
     ami_id = option_of_yojson (value_for_key photon_ami_id_of_yojson "AmiId") _list path;
     state = option_of_yojson (value_for_key export_image_task_state_of_yojson "State") _list path;
     ami_description =
       option_of_yojson (value_for_key description_of_yojson "AmiDescription") _list path;
     created_date = value_for_key timestamp_of_yojson "CreatedDate" _list path;
     ami_name = value_for_key ami_name_of_yojson "AmiName" _list path;
     image_arn = value_for_key arn_of_yojson "ImageArn" _list path;
     task_id = value_for_key uui_d_of_yojson "TaskId" _list path;
   }
    : export_image_task)

let export_image_tasks_of_yojson tree path = list_of_yojson export_image_task_of_yojson tree path

let list_export_image_tasks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     export_image_tasks =
       option_of_yojson (value_for_key export_image_tasks_of_yojson "ExportImageTasks") _list path;
   }
    : list_export_image_tasks_result)

let filter_name_of_yojson = string_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key filter_values_of_yojson "Values" _list path;
     name = value_for_key filter_name_of_yojson "Name" _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path
let max_results_of_yojson = int_of_yojson

let list_export_image_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_export_image_tasks_request)

let entitled_application_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application_identifier = value_for_key string__of_yojson "ApplicationIdentifier" _list path }
    : entitled_application)

let entitled_application_list_of_yojson tree path =
  list_of_yojson entitled_application_of_yojson tree path

let list_entitled_applications_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     entitled_applications =
       option_of_yojson
         (value_for_key entitled_application_list_of_yojson "EntitledApplications")
         _list path;
   }
    : list_entitled_applications_result)

let list_entitled_applications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     entitlement_name = value_for_key name_of_yojson "EntitlementName" _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
   }
    : list_entitled_applications_request)

let list_associated_stacks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     names = option_of_yojson (value_for_key string_list_of_yojson "Names") _list path;
   }
    : list_associated_stacks_result)

let list_associated_stacks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     fleet_name = value_for_key string__of_yojson "FleetName" _list path;
   }
    : list_associated_stacks_request)

let list_associated_fleets_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     names = option_of_yojson (value_for_key string_list_of_yojson "Names") _list path;
   }
    : list_associated_fleets_result)

let list_associated_fleets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     stack_name = value_for_key string__of_yojson "StackName" _list path;
   }
    : list_associated_fleets_request)

let get_export_image_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_image_task =
       option_of_yojson (value_for_key export_image_task_of_yojson "ExportImageTask") _list path;
   }
    : get_export_image_task_result)

let get_export_image_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = option_of_yojson (value_for_key uui_d_of_yojson "TaskId") _list path }
    : get_export_image_task_request)

let expire_session_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let expire_session_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key string__of_yojson "SessionId" _list path } : expire_session_request)

let enable_user_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let enable_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_type =
       value_for_key authentication_type_of_yojson "AuthenticationType" _list path;
     user_name = value_for_key username_of_yojson "UserName" _list path;
   }
    : enable_user_request)

let drain_session_instance_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let drain_session_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ session_id = value_for_key string__of_yojson "SessionId" _list path }
    : drain_session_instance_request)

let disassociate_software_from_image_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_software_from_image_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     software_names = value_for_key string_list_of_yojson "SoftwareNames" _list path;
     image_builder_name = value_for_key name_of_yojson "ImageBuilderName" _list path;
   }
    : disassociate_software_from_image_builder_request)

let disassociate_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stack_name = value_for_key string__of_yojson "StackName" _list path;
     fleet_name = value_for_key string__of_yojson "FleetName" _list path;
   }
    : disassociate_fleet_request)

let disassociate_application_from_entitlement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_application_from_entitlement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_identifier = value_for_key string__of_yojson "ApplicationIdentifier" _list path;
     entitlement_name = value_for_key name_of_yojson "EntitlementName" _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
   }
    : disassociate_application_from_entitlement_request)

let disassociate_application_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_application_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn = value_for_key arn_of_yojson "ApplicationArn" _list path;
     fleet_name = value_for_key name_of_yojson "FleetName" _list path;
   }
    : disassociate_application_fleet_request)

let disassociate_app_block_builder_app_block_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_app_block_builder_app_block_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_builder_name = value_for_key name_of_yojson "AppBlockBuilderName" _list path;
     app_block_arn = value_for_key arn_of_yojson "AppBlockArn" _list path;
   }
    : disassociate_app_block_builder_app_block_request)

let disable_user_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disable_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_type =
       value_for_key authentication_type_of_yojson "AuthenticationType" _list path;
     user_name = value_for_key username_of_yojson "UserName" _list path;
   }
    : disable_user_request)

let describe_user_stack_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     user_stack_associations =
       option_of_yojson
         (value_for_key user_stack_association_list_of_yojson "UserStackAssociations")
         _list path;
   }
    : describe_user_stack_associations_result)

let describe_user_stack_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     authentication_type =
       option_of_yojson
         (value_for_key authentication_type_of_yojson "AuthenticationType")
         _list path;
     user_name = option_of_yojson (value_for_key username_of_yojson "UserName") _list path;
     stack_name = option_of_yojson (value_for_key string__of_yojson "StackName") _list path;
   }
    : describe_user_stack_associations_request)

let describe_users_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     users = option_of_yojson (value_for_key user_list_of_yojson "Users") _list path;
   }
    : describe_users_result)

let describe_users_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     authentication_type =
       value_for_key authentication_type_of_yojson "AuthenticationType" _list path;
   }
    : describe_users_request)

let describe_usage_report_subscriptions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     usage_report_subscriptions =
       option_of_yojson
         (value_for_key usage_report_subscription_list_of_yojson "UsageReportSubscriptions")
         _list path;
   }
    : describe_usage_report_subscriptions_result)

let describe_usage_report_subscriptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
   }
    : describe_usage_report_subscriptions_request)

let describe_theme_for_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ theme = option_of_yojson (value_for_key theme_of_yojson "Theme") _list path }
    : describe_theme_for_stack_result)

let describe_theme_for_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ stack_name = value_for_key name_of_yojson "StackName" _list path }
    : describe_theme_for_stack_request)

let describe_stacks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     stacks = option_of_yojson (value_for_key stack_list_of_yojson "Stacks") _list path;
   }
    : describe_stacks_result)

let describe_stacks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     names = option_of_yojson (value_for_key string_list_of_yojson "Names") _list path;
   }
    : describe_stacks_request)

let describe_software_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     software_associations =
       option_of_yojson
         (value_for_key software_associations_list_of_yojson "SoftwareAssociations")
         _list path;
     associated_resource =
       option_of_yojson (value_for_key arn_of_yojson "AssociatedResource") _list path;
   }
    : describe_software_associations_result)

let describe_software_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     associated_resource = value_for_key arn_of_yojson "AssociatedResource" _list path;
   }
    : describe_software_associations_request)

let describe_sessions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     sessions = option_of_yojson (value_for_key session_list_of_yojson "Sessions") _list path;
   }
    : describe_sessions_result)

let describe_sessions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id = option_of_yojson (value_for_key string__of_yojson "InstanceId") _list path;
     authentication_type =
       option_of_yojson
         (value_for_key authentication_type_of_yojson "AuthenticationType")
         _list path;
     limit = option_of_yojson (value_for_key integer_of_yojson "Limit") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     user_id = option_of_yojson (value_for_key user_id_of_yojson "UserId") _list path;
     fleet_name = value_for_key name_of_yojson "FleetName" _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
   }
    : describe_sessions_request)

let image_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALIDATING" -> VALIDATING
    | `String "IMPORTING" -> IMPORTING
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "COPYING" -> COPYING
    | `String "FAILED" -> FAILED
    | `String "AVAILABLE" -> AVAILABLE
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageState" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageState")
     : image_state)
    : image_state)

let image_state_change_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMAGE_IMPORT_FAILURE" -> IMAGE_IMPORT_FAILURE
    | `String "IMAGE_UPDATE_FAILURE" -> IMAGE_UPDATE_FAILURE
    | `String "IMAGE_COPY_FAILURE" -> IMAGE_COPY_FAILURE
    | `String "IMAGE_BUILDER_NOT_AVAILABLE" -> IMAGE_BUILDER_NOT_AVAILABLE
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ImageStateChangeReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageStateChangeReasonCode")
     : image_state_change_reason_code)
    : image_state_change_reason_code)

let image_state_change_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "Message") _list path;
     code =
       option_of_yojson (value_for_key image_state_change_reason_code_of_yojson "Code") _list path;
   }
    : image_state_change_reason)

let applications_of_yojson tree path = list_of_yojson application_of_yojson tree path

let dynamic_app_providers_enabled_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DynamicAppProvidersEnabled" value)
    | _ -> raise (deserialize_wrong_type_error path "DynamicAppProvidersEnabled")
     : dynamic_app_providers_enabled)
    : dynamic_app_providers_enabled)

let image_shared_with_others_of_yojson (tree : t) path =
  ((match tree with
    | `String "FALSE" -> FALSE
    | `String "TRUE" -> TRUE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ImageSharedWithOthers" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageSharedWithOthers")
     : image_shared_with_others)
    : image_shared_with_others)

let image_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BYOL" -> BYOL
    | `String "NATIVE" -> NATIVE
    | `String "CUSTOM" -> CUSTOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImageType" value)
    | _ -> raise (deserialize_wrong_type_error path "ImageType")
     : image_type)
    : image_type)

let image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_type = option_of_yojson (value_for_key image_type_of_yojson "ImageType") _list path;
     managed_software_included =
       option_of_yojson (value_for_key boolean__of_yojson "ManagedSoftwareIncluded") _list path;
     image_shared_with_others =
       option_of_yojson
         (value_for_key image_shared_with_others_of_yojson "ImageSharedWithOthers")
         _list path;
     dynamic_app_providers_enabled =
       option_of_yojson
         (value_for_key dynamic_app_providers_enabled_of_yojson "DynamicAppProvidersEnabled")
         _list path;
     supported_instance_families =
       option_of_yojson (value_for_key string_list_of_yojson "SupportedInstanceFamilies") _list path;
     latest_appstream_agent_version =
       option_of_yojson
         (value_for_key latest_appstream_agent_version_of_yojson "LatestAppstreamAgentVersion")
         _list path;
     image_errors =
       option_of_yojson (value_for_key resource_errors_of_yojson "ImageErrors") _list path;
     image_permissions =
       option_of_yojson (value_for_key image_permissions_of_yojson "ImagePermissions") _list path;
     appstream_agent_version =
       option_of_yojson
         (value_for_key appstream_agent_version_of_yojson "AppstreamAgentVersion")
         _list path;
     public_base_image_released_date =
       option_of_yojson (value_for_key timestamp_of_yojson "PublicBaseImageReleasedDate") _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     applications =
       option_of_yojson (value_for_key applications_of_yojson "Applications") _list path;
     state_change_reason =
       option_of_yojson
         (value_for_key image_state_change_reason_of_yojson "StateChangeReason")
         _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     platform = option_of_yojson (value_for_key platform_type_of_yojson "Platform") _list path;
     image_builder_name =
       option_of_yojson (value_for_key string__of_yojson "ImageBuilderName") _list path;
     image_builder_supported =
       option_of_yojson (value_for_key boolean__of_yojson "ImageBuilderSupported") _list path;
     visibility = option_of_yojson (value_for_key visibility_type_of_yojson "Visibility") _list path;
     state = option_of_yojson (value_for_key image_state_of_yojson "State") _list path;
     display_name = option_of_yojson (value_for_key string__of_yojson "DisplayName") _list path;
     base_image_arn = option_of_yojson (value_for_key arn_of_yojson "BaseImageArn") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : image)

let image_list_of_yojson tree path = list_of_yojson image_of_yojson tree path

let describe_images_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     images = option_of_yojson (value_for_key image_list_of_yojson "Images") _list path;
   }
    : describe_images_result)

let arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path
let describe_images_max_results_of_yojson = int_of_yojson

let describe_images_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key describe_images_max_results_of_yojson "MaxResults")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     type_ = option_of_yojson (value_for_key visibility_type_of_yojson "Type") _list path;
     arns = option_of_yojson (value_for_key arn_list_of_yojson "Arns") _list path;
     names = option_of_yojson (value_for_key string_list_of_yojson "Names") _list path;
   }
    : describe_images_request)

let describe_image_permissions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     shared_image_permissions_list =
       option_of_yojson
         (value_for_key shared_image_permissions_list_of_yojson "SharedImagePermissionsList")
         _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
   }
    : describe_image_permissions_result)

let aws_account_id_list_of_yojson tree path = list_of_yojson aws_account_id_of_yojson tree path

let describe_image_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     shared_aws_account_ids =
       option_of_yojson
         (value_for_key aws_account_id_list_of_yojson "SharedAwsAccountIds")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : describe_image_permissions_request)

let image_builder_list_of_yojson tree path = list_of_yojson image_builder_of_yojson tree path

let describe_image_builders_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     image_builders =
       option_of_yojson (value_for_key image_builder_list_of_yojson "ImageBuilders") _list path;
   }
    : describe_image_builders_result)

let describe_image_builders_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     names = option_of_yojson (value_for_key string_list_of_yojson "Names") _list path;
   }
    : describe_image_builders_request)

let fleet_list_of_yojson tree path = list_of_yojson fleet_of_yojson tree path

let describe_fleets_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     fleets = option_of_yojson (value_for_key fleet_list_of_yojson "Fleets") _list path;
   }
    : describe_fleets_result)

let describe_fleets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     names = option_of_yojson (value_for_key string_list_of_yojson "Names") _list path;
   }
    : describe_fleets_request)

let entitlement_list_of_yojson tree path = list_of_yojson entitlement_of_yojson tree path

let describe_entitlements_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     entitlements =
       option_of_yojson (value_for_key entitlement_list_of_yojson "Entitlements") _list path;
   }
    : describe_entitlements_result)

let describe_entitlements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
   }
    : describe_entitlements_request)

let directory_config_list_of_yojson tree path = list_of_yojson directory_config_of_yojson tree path

let describe_directory_configs_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     directory_configs =
       option_of_yojson
         (value_for_key directory_config_list_of_yojson "DirectoryConfigs")
         _list path;
   }
    : describe_directory_configs_result)

let directory_name_list_of_yojson tree path = list_of_yojson directory_name_of_yojson tree path

let describe_directory_configs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     directory_names =
       option_of_yojson (value_for_key directory_name_list_of_yojson "DirectoryNames") _list path;
   }
    : describe_directory_configs_request)

let admin_app_license_usage_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_id = value_for_key string__of_yojson "UserId" _list path;
     license_type = value_for_key string__of_yojson "LicenseType" _list path;
     subscription_last_used_date =
       value_for_key timestamp_of_yojson "SubscriptionLastUsedDate" _list path;
     subscription_first_used_date =
       value_for_key timestamp_of_yojson "SubscriptionFirstUsedDate" _list path;
     owner_aws_account_id = value_for_key aws_account_id_of_yojson "OwnerAWSAccountId" _list path;
     billing_period = value_for_key string__of_yojson "BillingPeriod" _list path;
     user_arn = value_for_key string__of_yojson "UserArn" _list path;
   }
    : admin_app_license_usage_record)

let admin_app_license_usage_list_of_yojson tree path =
  list_of_yojson admin_app_license_usage_record_of_yojson tree path

let describe_app_license_usage_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     app_license_usages =
       option_of_yojson
         (value_for_key admin_app_license_usage_list_of_yojson "AppLicenseUsages")
         _list path;
   }
    : describe_app_license_usage_result)

let describe_app_license_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     billing_period = value_for_key string__of_yojson "BillingPeriod" _list path;
   }
    : describe_app_license_usage_request)

let describe_applications_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     applications =
       option_of_yojson (value_for_key applications_of_yojson "Applications") _list path;
   }
    : describe_applications_result)

let describe_applications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     arns = option_of_yojson (value_for_key arn_list_of_yojson "Arns") _list path;
   }
    : describe_applications_request)

let application_fleet_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn = value_for_key arn_of_yojson "ApplicationArn" _list path;
     fleet_name = value_for_key string__of_yojson "FleetName" _list path;
   }
    : application_fleet_association)

let application_fleet_association_list_of_yojson tree path =
  list_of_yojson application_fleet_association_of_yojson tree path

let describe_application_fleet_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     application_fleet_associations =
       option_of_yojson
         (value_for_key application_fleet_association_list_of_yojson "ApplicationFleetAssociations")
         _list path;
   }
    : describe_application_fleet_associations_result)

let describe_application_fleet_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     application_arn = option_of_yojson (value_for_key arn_of_yojson "ApplicationArn") _list path;
     fleet_name = option_of_yojson (value_for_key name_of_yojson "FleetName") _list path;
   }
    : describe_application_fleet_associations_request)

let packaging_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPSTREAM2" -> APPSTREAM2
    | `String "CUSTOM" -> CUSTOM
    | `String value -> raise (deserialize_unknown_enum_value_error path "PackagingType" value)
    | _ -> raise (deserialize_wrong_type_error path "PackagingType")
     : packaging_type)
    : packaging_type)

let app_block_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "INACTIVE" -> INACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AppBlockState" value)
    | _ -> raise (deserialize_wrong_type_error path "AppBlockState")
     : app_block_state)
    : app_block_state)

let app_block_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_errors =
       option_of_yojson (value_for_key error_details_list_of_yojson "AppBlockErrors") _list path;
     state = option_of_yojson (value_for_key app_block_state_of_yojson "State") _list path;
     packaging_type =
       option_of_yojson (value_for_key packaging_type_of_yojson "PackagingType") _list path;
     post_setup_script_details =
       option_of_yojson (value_for_key script_details_of_yojson "PostSetupScriptDetails") _list path;
     created_time = option_of_yojson (value_for_key timestamp_of_yojson "CreatedTime") _list path;
     setup_script_details =
       option_of_yojson (value_for_key script_details_of_yojson "SetupScriptDetails") _list path;
     source_s3_location =
       option_of_yojson (value_for_key s3_location_of_yojson "SourceS3Location") _list path;
     display_name = option_of_yojson (value_for_key string__of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "Description") _list path;
     arn = value_for_key arn_of_yojson "Arn" _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : app_block)

let app_blocks_of_yojson tree path = list_of_yojson app_block_of_yojson tree path

let describe_app_blocks_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     app_blocks = option_of_yojson (value_for_key app_blocks_of_yojson "AppBlocks") _list path;
   }
    : describe_app_blocks_result)

let describe_app_blocks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     arns = option_of_yojson (value_for_key arn_list_of_yojson "Arns") _list path;
   }
    : describe_app_blocks_request)

let app_block_builder_list_of_yojson tree path =
  list_of_yojson app_block_builder_of_yojson tree path

let describe_app_block_builders_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     app_block_builders =
       option_of_yojson
         (value_for_key app_block_builder_list_of_yojson "AppBlockBuilders")
         _list path;
   }
    : describe_app_block_builders_result)

let describe_app_block_builders_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     names = option_of_yojson (value_for_key string_list_of_yojson "Names") _list path;
   }
    : describe_app_block_builders_request)

let app_block_builder_app_block_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_builder_name = value_for_key name_of_yojson "AppBlockBuilderName" _list path;
     app_block_arn = value_for_key arn_of_yojson "AppBlockArn" _list path;
   }
    : app_block_builder_app_block_association)

let app_block_builder_app_block_associations_list_of_yojson tree path =
  list_of_yojson app_block_builder_app_block_association_of_yojson tree path

let describe_app_block_builder_app_block_associations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     app_block_builder_app_block_associations =
       option_of_yojson
         (value_for_key app_block_builder_app_block_associations_list_of_yojson
            "AppBlockBuilderAppBlockAssociations")
         _list path;
   }
    : describe_app_block_builder_app_block_associations_result)

let describe_app_block_builder_app_block_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key integer_of_yojson "MaxResults") _list path;
     app_block_builder_name =
       option_of_yojson (value_for_key name_of_yojson "AppBlockBuilderName") _list path;
     app_block_arn = option_of_yojson (value_for_key arn_of_yojson "AppBlockArn") _list path;
   }
    : describe_app_block_builder_app_block_associations_request)

let delete_user_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_type =
       value_for_key authentication_type_of_yojson "AuthenticationType" _list path;
     user_name = value_for_key username_of_yojson "UserName" _list path;
   }
    : delete_user_request)

let delete_usage_report_subscription_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_usage_report_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_theme_for_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_theme_for_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ stack_name = value_for_key name_of_yojson "StackName" _list path }
    : delete_theme_for_stack_request)

let delete_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : delete_stack_request)

let delete_image_permissions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_image_permissions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shared_account_id = value_for_key aws_account_id_of_yojson "SharedAccountId" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : delete_image_permissions_request)

let delete_image_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_builder =
       option_of_yojson (value_for_key image_builder_of_yojson "ImageBuilder") _list path;
   }
    : delete_image_builder_result)

let delete_image_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_of_yojson "Name" _list path } : delete_image_builder_request)

let delete_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image = option_of_yojson (value_for_key image_of_yojson "Image") _list path }
    : delete_image_result)

let delete_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_of_yojson "Name" _list path } : delete_image_request)

let delete_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "Name" _list path } : delete_fleet_request)

let delete_entitlement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_entitlement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stack_name = value_for_key name_of_yojson "StackName" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : delete_entitlement_request)

let delete_directory_config_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_directory_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ directory_name = value_for_key directory_name_of_yojson "DirectoryName" _list path }
    : delete_directory_config_request)

let delete_application_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_of_yojson "Name" _list path } : delete_application_request)

let delete_app_block_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_app_block_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_of_yojson "Name" _list path } : delete_app_block_builder_request)

let delete_app_block_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_app_block_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key name_of_yojson "Name" _list path } : delete_app_block_request)

let create_user_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let message_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESEND" -> RESEND
    | `String "SUPPRESS" -> SUPPRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "MessageAction" value)
    | _ -> raise (deserialize_wrong_type_error path "MessageAction")
     : message_action)
    : message_action)

let create_user_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     authentication_type =
       value_for_key authentication_type_of_yojson "AuthenticationType" _list path;
     last_name =
       option_of_yojson (value_for_key user_attribute_value_of_yojson "LastName") _list path;
     first_name =
       option_of_yojson (value_for_key user_attribute_value_of_yojson "FirstName") _list path;
     message_action =
       option_of_yojson (value_for_key message_action_of_yojson "MessageAction") _list path;
     user_name = value_for_key username_of_yojson "UserName" _list path;
   }
    : create_user_request)

let create_usage_report_subscription_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schedule =
       option_of_yojson (value_for_key usage_report_schedule_of_yojson "Schedule") _list path;
     s3_bucket_name = option_of_yojson (value_for_key string__of_yojson "S3BucketName") _list path;
   }
    : create_usage_report_subscription_result)

let create_usage_report_subscription_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_updated_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_update_image =
       option_of_yojson (value_for_key boolean__of_yojson "canUpdateImage") _list path;
     image = option_of_yojson (value_for_key image_of_yojson "image") _list path;
   }
    : create_updated_image_result)

let create_updated_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run = option_of_yojson (value_for_key boolean__of_yojson "dryRun") _list path;
     new_image_tags = option_of_yojson (value_for_key tags_of_yojson "newImageTags") _list path;
     new_image_display_name =
       option_of_yojson (value_for_key display_name_of_yojson "newImageDisplayName") _list path;
     new_image_description =
       option_of_yojson (value_for_key description_of_yojson "newImageDescription") _list path;
     new_image_name = value_for_key name_of_yojson "newImageName" _list path;
     existing_image_name = value_for_key name_of_yojson "existingImageName" _list path;
   }
    : create_updated_image_request)

let create_theme_for_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ theme = option_of_yojson (value_for_key theme_of_yojson "Theme") _list path }
    : create_theme_for_stack_result)

let create_theme_for_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     favicon_s3_location = value_for_key s3_location_of_yojson "FaviconS3Location" _list path;
     organization_logo_s3_location =
       value_for_key s3_location_of_yojson "OrganizationLogoS3Location" _list path;
     theme_styling = value_for_key theme_styling_of_yojson "ThemeStyling" _list path;
     title_text = value_for_key theme_title_text_of_yojson "TitleText" _list path;
     footer_links =
       option_of_yojson (value_for_key theme_footer_links_of_yojson "FooterLinks") _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
   }
    : create_theme_for_stack_request)

let create_streaming_url_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires = option_of_yojson (value_for_key timestamp_of_yojson "Expires") _list path;
     streaming_ur_l = option_of_yojson (value_for_key string__of_yojson "StreamingURL") _list path;
   }
    : create_streaming_url_result)

let long_of_yojson = long_of_yojson

let create_streaming_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_context =
       option_of_yojson (value_for_key string__of_yojson "SessionContext") _list path;
     validity = option_of_yojson (value_for_key long_of_yojson "Validity") _list path;
     application_id = option_of_yojson (value_for_key string__of_yojson "ApplicationId") _list path;
     user_id = value_for_key streaming_url_user_id_of_yojson "UserId" _list path;
     fleet_name = value_for_key string__of_yojson "FleetName" _list path;
     stack_name = value_for_key string__of_yojson "StackName" _list path;
   }
    : create_streaming_url_request)

let create_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ stack = option_of_yojson (value_for_key stack_of_yojson "Stack") _list path }
    : create_stack_result)

let create_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_access_config =
       option_of_yojson (value_for_key agent_access_config_of_yojson "AgentAccessConfig") _list path;
     content_redirection =
       option_of_yojson
         (value_for_key content_redirection_of_yojson "ContentRedirection")
         _list path;
     streaming_experience_settings =
       option_of_yojson
         (value_for_key streaming_experience_settings_of_yojson "StreamingExperienceSettings")
         _list path;
     embed_host_domains =
       option_of_yojson (value_for_key embed_host_domains_of_yojson "EmbedHostDomains") _list path;
     access_endpoints =
       option_of_yojson (value_for_key access_endpoint_list_of_yojson "AccessEndpoints") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     application_settings =
       option_of_yojson
         (value_for_key application_settings_of_yojson "ApplicationSettings")
         _list path;
     user_settings =
       option_of_yojson (value_for_key user_setting_list_of_yojson "UserSettings") _list path;
     feedback_ur_l =
       option_of_yojson (value_for_key feedback_ur_l_of_yojson "FeedbackURL") _list path;
     redirect_ur_l =
       option_of_yojson (value_for_key redirect_ur_l_of_yojson "RedirectURL") _list path;
     storage_connectors =
       option_of_yojson
         (value_for_key storage_connector_list_of_yojson "StorageConnectors")
         _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : create_stack_request)

let dry_run_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : dry_run_operation_exception)

let create_imported_image_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ image = option_of_yojson (value_for_key image_of_yojson "Image") _list path }
    : create_imported_image_result)

let image_import_description_of_yojson = string_of_yojson
let image_import_display_name_of_yojson = string_of_yojson

let agent_software_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALWAYS_LATEST" -> ALWAYS_LATEST
    | `String "CURRENT_LATEST" -> CURRENT_LATEST
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AgentSoftwareVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "AgentSoftwareVersion")
     : agent_software_version)
    : agent_software_version)

let app_name_of_yojson = string_of_yojson
let app_display_name_of_yojson = string_of_yojson
let file_path_of_yojson = string_of_yojson
let launch_parameters_of_yojson = string_of_yojson

let application_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     launch_parameters =
       option_of_yojson (value_for_key launch_parameters_of_yojson "LaunchParameters") _list path;
     working_directory =
       option_of_yojson (value_for_key file_path_of_yojson "WorkingDirectory") _list path;
     absolute_manifest_path =
       option_of_yojson (value_for_key file_path_of_yojson "AbsoluteManifestPath") _list path;
     absolute_icon_path =
       option_of_yojson (value_for_key file_path_of_yojson "AbsoluteIconPath") _list path;
     absolute_app_path = value_for_key file_path_of_yojson "AbsoluteAppPath" _list path;
     display_name =
       option_of_yojson (value_for_key app_display_name_of_yojson "DisplayName") _list path;
     name = value_for_key app_name_of_yojson "Name" _list path;
   }
    : application_config)

let app_catalog_config_of_yojson tree path = list_of_yojson application_config_of_yojson tree path

let create_imported_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dry_run = option_of_yojson (value_for_key boolean__of_yojson "DryRun") _list path;
     app_catalog_config =
       option_of_yojson (value_for_key app_catalog_config_of_yojson "AppCatalogConfig") _list path;
     agent_software_version =
       option_of_yojson
         (value_for_key agent_software_version_of_yojson "AgentSoftwareVersion")
         _list path;
     runtime_validation_config =
       option_of_yojson
         (value_for_key runtime_validation_config_of_yojson "RuntimeValidationConfig")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     display_name =
       option_of_yojson (value_for_key image_import_display_name_of_yojson "DisplayName") _list path;
     description =
       option_of_yojson (value_for_key image_import_description_of_yojson "Description") _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     workspace_image_id =
       option_of_yojson (value_for_key workspace_image_id_of_yojson "WorkspaceImageId") _list path;
     source_ami_id =
       option_of_yojson (value_for_key photon_ami_id_of_yojson "SourceAmiId") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : create_imported_image_request)

let create_image_builder_streaming_url_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires = option_of_yojson (value_for_key timestamp_of_yojson "Expires") _list path;
     streaming_ur_l = option_of_yojson (value_for_key string__of_yojson "StreamingURL") _list path;
   }
    : create_image_builder_streaming_url_result)

let create_image_builder_streaming_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validity = option_of_yojson (value_for_key long_of_yojson "Validity") _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : create_image_builder_streaming_url_request)

let create_image_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     image_builder =
       option_of_yojson (value_for_key image_builder_of_yojson "ImageBuilder") _list path;
   }
    : create_image_builder_result)

let create_image_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_imds_v1 =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableIMDSV1") _list path;
     softwares_to_uninstall =
       option_of_yojson (value_for_key string_list_of_yojson "SoftwaresToUninstall") _list path;
     softwares_to_install =
       option_of_yojson (value_for_key string_list_of_yojson "SoftwaresToInstall") _list path;
     root_volume_config =
       option_of_yojson (value_for_key volume_config_of_yojson "RootVolumeConfig") _list path;
     access_endpoints =
       option_of_yojson (value_for_key access_endpoint_list_of_yojson "AccessEndpoints") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     appstream_agent_version =
       option_of_yojson
         (value_for_key appstream_agent_version_of_yojson "AppstreamAgentVersion")
         _list path;
     domain_join_info =
       option_of_yojson (value_for_key domain_join_info_of_yojson "DomainJoinInfo") _list path;
     enable_default_internet_access =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDefaultInternetAccess")
         _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     instance_type = value_for_key string__of_yojson "InstanceType" _list path;
     image_arn = option_of_yojson (value_for_key arn_of_yojson "ImageArn") _list path;
     image_name = option_of_yojson (value_for_key string__of_yojson "ImageName") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : create_image_builder_request)

let create_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ fleet = option_of_yojson (value_for_key fleet_of_yojson "Fleet") _list path }
    : create_fleet_result)

let create_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_imds_v1 =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableIMDSV1") _list path;
     root_volume_config =
       option_of_yojson (value_for_key volume_config_of_yojson "RootVolumeConfig") _list path;
     max_sessions_per_instance =
       option_of_yojson (value_for_key integer_of_yojson "MaxSessionsPerInstance") _list path;
     session_script_s3_location =
       option_of_yojson (value_for_key s3_location_of_yojson "SessionScriptS3Location") _list path;
     usb_device_filter_strings =
       option_of_yojson
         (value_for_key usb_device_filter_strings_of_yojson "UsbDeviceFilterStrings")
         _list path;
     max_concurrent_sessions =
       option_of_yojson (value_for_key integer_of_yojson "MaxConcurrentSessions") _list path;
     platform = option_of_yojson (value_for_key platform_type_of_yojson "Platform") _list path;
     stream_view = option_of_yojson (value_for_key stream_view_of_yojson "StreamView") _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     idle_disconnect_timeout_in_seconds =
       option_of_yojson
         (value_for_key integer_of_yojson "IdleDisconnectTimeoutInSeconds")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     domain_join_info =
       option_of_yojson (value_for_key domain_join_info_of_yojson "DomainJoinInfo") _list path;
     enable_default_internet_access =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDefaultInternetAccess")
         _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     disconnect_timeout_in_seconds =
       option_of_yojson (value_for_key integer_of_yojson "DisconnectTimeoutInSeconds") _list path;
     max_user_duration_in_seconds =
       option_of_yojson (value_for_key integer_of_yojson "MaxUserDurationInSeconds") _list path;
     vpc_config = option_of_yojson (value_for_key vpc_config_of_yojson "VpcConfig") _list path;
     compute_capacity =
       option_of_yojson (value_for_key compute_capacity_of_yojson "ComputeCapacity") _list path;
     fleet_type = option_of_yojson (value_for_key fleet_type_of_yojson "FleetType") _list path;
     instance_type = value_for_key string__of_yojson "InstanceType" _list path;
     image_arn = option_of_yojson (value_for_key arn_of_yojson "ImageArn") _list path;
     image_name = option_of_yojson (value_for_key name_of_yojson "ImageName") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : create_fleet_request)

let create_export_image_task_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_image_task =
       option_of_yojson (value_for_key export_image_task_of_yojson "ExportImageTask") _list path;
   }
    : create_export_image_task_result)

let create_export_image_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ami_description =
       option_of_yojson (value_for_key description_of_yojson "AmiDescription") _list path;
     tag_specifications =
       option_of_yojson (value_for_key tags_of_yojson "TagSpecifications") _list path;
     iam_role_arn = value_for_key arn_of_yojson "IamRoleArn" _list path;
     ami_name = value_for_key ami_name_of_yojson "AmiName" _list path;
     image_name = value_for_key name_of_yojson "ImageName" _list path;
   }
    : create_export_image_task_request)

let entitlement_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : entitlement_already_exists_exception)

let create_entitlement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entitlement = option_of_yojson (value_for_key entitlement_of_yojson "Entitlement") _list path }
    : create_entitlement_result)

let create_entitlement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = value_for_key entitlement_attribute_list_of_yojson "Attributes" _list path;
     app_visibility = value_for_key app_visibility_of_yojson "AppVisibility" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : create_entitlement_request)

let create_directory_config_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     directory_config =
       option_of_yojson (value_for_key directory_config_of_yojson "DirectoryConfig") _list path;
   }
    : create_directory_config_result)

let create_directory_config_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     certificate_based_auth_properties =
       option_of_yojson
         (value_for_key certificate_based_auth_properties_of_yojson "CertificateBasedAuthProperties")
         _list path;
     service_account_credentials =
       option_of_yojson
         (value_for_key service_account_credentials_of_yojson "ServiceAccountCredentials")
         _list path;
     organizational_unit_distinguished_names =
       value_for_key organizational_unit_distinguished_names_list_of_yojson
         "OrganizationalUnitDistinguishedNames" _list path;
     directory_name = value_for_key directory_name_of_yojson "DirectoryName" _list path;
   }
    : create_directory_config_request)

let create_application_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ application = option_of_yojson (value_for_key application_of_yojson "Application") _list path }
    : create_application_result)

let create_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     app_block_arn = value_for_key arn_of_yojson "AppBlockArn" _list path;
     instance_families = value_for_key string_list_of_yojson "InstanceFamilies" _list path;
     platforms = value_for_key platforms_of_yojson "Platforms" _list path;
     launch_parameters =
       option_of_yojson (value_for_key string__of_yojson "LaunchParameters") _list path;
     working_directory =
       option_of_yojson (value_for_key string__of_yojson "WorkingDirectory") _list path;
     launch_path = value_for_key string__of_yojson "LaunchPath" _list path;
     icon_s3_location = value_for_key s3_location_of_yojson "IconS3Location" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : create_application_request)

let create_app_block_builder_streaming_url_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires = option_of_yojson (value_for_key timestamp_of_yojson "Expires") _list path;
     streaming_ur_l = option_of_yojson (value_for_key string__of_yojson "StreamingURL") _list path;
   }
    : create_app_block_builder_streaming_url_result)

let create_app_block_builder_streaming_url_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     validity = option_of_yojson (value_for_key long_of_yojson "Validity") _list path;
     app_block_builder_name = value_for_key name_of_yojson "AppBlockBuilderName" _list path;
   }
    : create_app_block_builder_streaming_url_request)

let create_app_block_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_builder =
       option_of_yojson (value_for_key app_block_builder_of_yojson "AppBlockBuilder") _list path;
   }
    : create_app_block_builder_result)

let create_app_block_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disable_imds_v1 =
       option_of_yojson (value_for_key boolean_object_of_yojson "DisableIMDSV1") _list path;
     access_endpoints =
       option_of_yojson (value_for_key access_endpoint_list_of_yojson "AccessEndpoints") _list path;
     iam_role_arn = option_of_yojson (value_for_key arn_of_yojson "IamRoleArn") _list path;
     enable_default_internet_access =
       option_of_yojson
         (value_for_key boolean_object_of_yojson "EnableDefaultInternetAccess")
         _list path;
     vpc_config = value_for_key vpc_config_of_yojson "VpcConfig" _list path;
     instance_type = value_for_key string__of_yojson "InstanceType" _list path;
     platform = value_for_key app_block_builder_platform_type_of_yojson "Platform" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : create_app_block_builder_request)

let create_app_block_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ app_block = option_of_yojson (value_for_key app_block_of_yojson "AppBlock") _list path }
    : create_app_block_result)

let create_app_block_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     packaging_type =
       option_of_yojson (value_for_key packaging_type_of_yojson "PackagingType") _list path;
     post_setup_script_details =
       option_of_yojson (value_for_key script_details_of_yojson "PostSetupScriptDetails") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     setup_script_details =
       option_of_yojson (value_for_key script_details_of_yojson "SetupScriptDetails") _list path;
     source_s3_location = value_for_key s3_location_of_yojson "SourceS3Location" _list path;
     display_name = option_of_yojson (value_for_key display_name_of_yojson "DisplayName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     name = value_for_key name_of_yojson "Name" _list path;
   }
    : create_app_block_request)

let copy_image_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_image_name =
       option_of_yojson (value_for_key name_of_yojson "DestinationImageName") _list path;
   }
    : copy_image_response)

let copy_image_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_image_description =
       option_of_yojson
         (value_for_key description_of_yojson "DestinationImageDescription")
         _list path;
     destination_region = value_for_key region_name_of_yojson "DestinationRegion" _list path;
     destination_image_name = value_for_key name_of_yojson "DestinationImageName" _list path;
     source_image_name = value_for_key name_of_yojson "SourceImageName" _list path;
   }
    : copy_image_request)

let batch_disassociate_user_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key user_stack_association_error_list_of_yojson "errors")
         _list path;
   }
    : batch_disassociate_user_stack_result)

let batch_disassociate_user_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_stack_associations =
       value_for_key user_stack_association_list_of_yojson "UserStackAssociations" _list path;
   }
    : batch_disassociate_user_stack_request)

let batch_associate_user_stack_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key user_stack_association_error_list_of_yojson "errors")
         _list path;
   }
    : batch_associate_user_stack_result)

let batch_associate_user_stack_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_stack_associations =
       value_for_key user_stack_association_list_of_yojson "UserStackAssociations" _list path;
   }
    : batch_associate_user_stack_request)

let associate_software_to_image_builder_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_software_to_image_builder_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     software_names = value_for_key string_list_of_yojson "SoftwareNames" _list path;
     image_builder_name = value_for_key name_of_yojson "ImageBuilderName" _list path;
   }
    : associate_software_to_image_builder_request)

let associate_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stack_name = value_for_key string__of_yojson "StackName" _list path;
     fleet_name = value_for_key string__of_yojson "FleetName" _list path;
   }
    : associate_fleet_request)

let associate_application_to_entitlement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_application_to_entitlement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_identifier = value_for_key string__of_yojson "ApplicationIdentifier" _list path;
     entitlement_name = value_for_key name_of_yojson "EntitlementName" _list path;
     stack_name = value_for_key name_of_yojson "StackName" _list path;
   }
    : associate_application_to_entitlement_request)

let associate_application_fleet_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_fleet_association =
       option_of_yojson
         (value_for_key application_fleet_association_of_yojson "ApplicationFleetAssociation")
         _list path;
   }
    : associate_application_fleet_result)

let associate_application_fleet_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_arn = value_for_key arn_of_yojson "ApplicationArn" _list path;
     fleet_name = value_for_key name_of_yojson "FleetName" _list path;
   }
    : associate_application_fleet_request)

let associate_app_block_builder_app_block_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_builder_app_block_association =
       option_of_yojson
         (value_for_key app_block_builder_app_block_association_of_yojson
            "AppBlockBuilderAppBlockAssociation")
         _list path;
   }
    : associate_app_block_builder_app_block_result)

let associate_app_block_builder_app_block_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     app_block_builder_name = value_for_key name_of_yojson "AppBlockBuilderName" _list path;
     app_block_arn = value_for_key arn_of_yojson "AppBlockArn" _list path;
   }
    : associate_app_block_builder_app_block_request)
