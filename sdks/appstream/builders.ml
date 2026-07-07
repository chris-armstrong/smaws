open Types

let make_vpc_config ?security_group_ids:(security_group_ids_ : security_group_id_list option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option) () =
  ({ security_group_ids = security_group_ids_; subnet_ids = subnet_ids_ } : vpc_config)

let make_volume_config ?volume_size_in_gb:(volume_size_in_gb_ : integer option) () =
  ({ volume_size_in_gb = volume_size_in_gb_ } : volume_config)

let make_user_stack_association
    ?send_email_notification:(send_email_notification_ : boolean_ option)
    ~authentication_type:(authentication_type_ : authentication_type)
    ~user_name:(user_name_ : username) ~stack_name:(stack_name_ : string_) () =
  ({
     send_email_notification = send_email_notification_;
     authentication_type = authentication_type_;
     user_name = user_name_;
     stack_name = stack_name_;
   }
    : user_stack_association)

let make_user_stack_association_error ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : user_stack_association_error_code option)
    ?user_stack_association:(user_stack_association_ : user_stack_association option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     user_stack_association = user_stack_association_;
   }
    : user_stack_association_error)

let make_user_setting ?maximum_length:(maximum_length_ : integer option)
    ~permission:(permission_ : permission) ~action:(action_ : action) () =
  ({ maximum_length = maximum_length_; permission = permission_; action = action_ } : user_setting)

let make_user ?created_time:(created_time_ : timestamp option)
    ?last_name:(last_name_ : user_attribute_value option)
    ?first_name:(first_name_ : user_attribute_value option) ?status:(status_ : string_ option)
    ?enabled:(enabled_ : boolean_ option) ?user_name:(user_name_ : username option)
    ?arn:(arn_ : arn option) ~authentication_type:(authentication_type_ : authentication_type) () =
  ({
     authentication_type = authentication_type_;
     created_time = created_time_;
     last_name = last_name_;
     first_name = first_name_;
     status = status_;
     enabled = enabled_;
     user_name = user_name_;
     arn = arn_;
   }
    : user)

let make_last_report_generation_execution_error ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : usage_report_execution_error_code option) () =
  ({ error_message = error_message_; error_code = error_code_ }
    : last_report_generation_execution_error)

let make_usage_report_subscription
    ?subscription_errors:(subscription_errors_ : last_report_generation_execution_errors option)
    ?last_generated_report_date:(last_generated_report_date_ : timestamp option)
    ?schedule:(schedule_ : usage_report_schedule option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option) () =
  ({
     subscription_errors = subscription_errors_;
     last_generated_report_date = last_generated_report_date_;
     schedule = schedule_;
     s3_bucket_name = s3_bucket_name_;
   }
    : usage_report_subscription)

let make_url_redirection_config ?denied_urls:(denied_urls_ : url_pattern_list option)
    ?allowed_urls:(allowed_urls_ : url_pattern_list option) ~enabled:(enabled_ : boolean_object) ()
    =
  ({ denied_urls = denied_urls_; allowed_urls = allowed_urls_; enabled = enabled_ }
    : url_redirection_config)

let make_theme_footer_link ?footer_link_ur_l:(footer_link_ur_l_ : theme_footer_link_ur_l option)
    ?display_name:(display_name_ : theme_footer_link_display_name option) () =
  ({ footer_link_ur_l = footer_link_ur_l_; display_name = display_name_ } : theme_footer_link)

let make_theme ?created_time:(created_time_ : timestamp option)
    ?theme_favicon_ur_l:(theme_favicon_ur_l_ : string_ option)
    ?theme_organization_logo_ur_l:(theme_organization_logo_ur_l_ : string_ option)
    ?theme_footer_links:(theme_footer_links_ : theme_footer_links option)
    ?theme_styling:(theme_styling_ : theme_styling option)
    ?theme_title_text:(theme_title_text_ : theme_title_text option)
    ?state:(state_ : theme_state option) ?stack_name:(stack_name_ : name option) () =
  ({
     created_time = created_time_;
     theme_favicon_ur_l = theme_favicon_ur_l_;
     theme_organization_logo_ur_l = theme_organization_logo_ur_l_;
     theme_footer_links = theme_footer_links_;
     theme_styling = theme_styling_;
     theme_title_text = theme_title_text_;
     state = state_;
     stack_name = stack_name_;
   }
    : theme)

let make_s3_location ?s3_key:(s3_key_ : s3_key option) ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_key = s3_key_; s3_bucket = s3_bucket_ } : s3_location)

let make_update_theme_for_stack_request
    ?attributes_to_delete:(attributes_to_delete_ : theme_attributes option)
    ?state:(state_ : theme_state option)
    ?favicon_s3_location:(favicon_s3_location_ : s3_location option)
    ?organization_logo_s3_location:(organization_logo_s3_location_ : s3_location option)
    ?theme_styling:(theme_styling_ : theme_styling option)
    ?title_text:(title_text_ : theme_title_text option)
    ?footer_links:(footer_links_ : theme_footer_links option) ~stack_name:(stack_name_ : name) () =
  ({
     attributes_to_delete = attributes_to_delete_;
     state = state_;
     favicon_s3_location = favicon_s3_location_;
     organization_logo_s3_location = organization_logo_s3_location_;
     theme_styling = theme_styling_;
     title_text = title_text_;
     footer_links = footer_links_;
     stack_name = stack_name_;
   }
    : update_theme_for_stack_request)

let make_storage_connector
    ?domains_require_admin_consent:(domains_require_admin_consent_ : domain_list option)
    ?domains:(domains_ : domain_list option)
    ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ~connector_type:(connector_type_ : storage_connector_type) () =
  ({
     domains_require_admin_consent = domains_require_admin_consent_;
     domains = domains_;
     resource_identifier = resource_identifier_;
     connector_type = connector_type_;
   }
    : storage_connector)

let make_stack_error ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : stack_error_code option) () =
  ({ error_message = error_message_; error_code = error_code_ } : stack_error)

let make_application_settings_response ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?settings_group:(settings_group_ : settings_group option) ?enabled:(enabled_ : boolean_ option)
    () =
  ({ s3_bucket_name = s3_bucket_name_; settings_group = settings_group_; enabled = enabled_ }
    : application_settings_response)

let make_access_endpoint ?vpce_id:(vpce_id_ : string_ option)
    ~endpoint_type:(endpoint_type_ : access_endpoint_type) () =
  ({ vpce_id = vpce_id_; endpoint_type = endpoint_type_ } : access_endpoint)

let make_streaming_experience_settings
    ?preferred_protocol:(preferred_protocol_ : preferred_protocol option) () =
  ({ preferred_protocol = preferred_protocol_ } : streaming_experience_settings)

let make_content_redirection ?host_to_client:(host_to_client_ : url_redirection_config option) () =
  ({ host_to_client = host_to_client_ } : content_redirection)

let make_agent_access_setting ~permission:(permission_ : permission)
    ~agent_action:(agent_action_ : agent_action) () =
  ({ permission = permission_; agent_action = agent_action_ } : agent_access_setting)

let make_agent_access_config ?user_control_mode:(user_control_mode_ : user_control_mode option)
    ?screenshots_upload_enabled:(screenshots_upload_enabled_ : boolean_object option)
    ?s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn option)
    ~screen_image_format:(screen_image_format_ : screen_image_format)
    ~screen_resolution:(screen_resolution_ : screen_resolution)
    ~settings:(settings_ : agent_access_setting_list) () =
  ({
     user_control_mode = user_control_mode_;
     screen_image_format = screen_image_format_;
     screen_resolution = screen_resolution_;
     screenshots_upload_enabled = screenshots_upload_enabled_;
     s3_bucket_arn = s3_bucket_arn_;
     settings = settings_;
   }
    : agent_access_config)

let make_stack ?agent_access_config:(agent_access_config_ : agent_access_config option)
    ?content_redirection:(content_redirection_ : content_redirection option)
    ?streaming_experience_settings:
      (streaming_experience_settings_ : streaming_experience_settings option)
    ?embed_host_domains:(embed_host_domains_ : embed_host_domains option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?application_settings:(application_settings_ : application_settings_response option)
    ?user_settings:(user_settings_ : user_setting_list option)
    ?stack_errors:(stack_errors_ : stack_errors option)
    ?feedback_ur_l:(feedback_ur_l_ : feedback_ur_l option)
    ?redirect_ur_l:(redirect_ur_l_ : redirect_ur_l option)
    ?storage_connectors:(storage_connectors_ : storage_connector_list option)
    ?created_time:(created_time_ : timestamp option) ?display_name:(display_name_ : string_ option)
    ?description:(description_ : string_ option) ?arn:(arn_ : arn option) ~name:(name_ : string_) ()
    =
  ({
     agent_access_config = agent_access_config_;
     content_redirection = content_redirection_;
     streaming_experience_settings = streaming_experience_settings_;
     embed_host_domains = embed_host_domains_;
     access_endpoints = access_endpoints_;
     application_settings = application_settings_;
     user_settings = user_settings_;
     stack_errors = stack_errors_;
     feedback_ur_l = feedback_ur_l_;
     redirect_ur_l = redirect_ur_l_;
     storage_connectors = storage_connectors_;
     created_time = created_time_;
     display_name = display_name_;
     description = description_;
     name = name_;
     arn = arn_;
   }
    : stack)

let make_application_settings ?settings_group:(settings_group_ : settings_group option)
    ~enabled:(enabled_ : boolean_) () =
  ({ settings_group = settings_group_; enabled = enabled_ } : application_settings)

let make_agent_access_config_for_update
    ?user_control_mode:(user_control_mode_ : user_control_mode option)
    ?screen_image_format:(screen_image_format_ : screen_image_format option)
    ?screen_resolution:(screen_resolution_ : screen_resolution option)
    ?screenshots_upload_enabled:(screenshots_upload_enabled_ : boolean_object option)
    ?s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn option)
    ?settings:(settings_ : agent_access_setting_list option) () =
  ({
     user_control_mode = user_control_mode_;
     screen_image_format = screen_image_format_;
     screen_resolution = screen_resolution_;
     screenshots_upload_enabled = screenshots_upload_enabled_;
     s3_bucket_arn = s3_bucket_arn_;
     settings = settings_;
   }
    : agent_access_config_for_update)

let make_update_stack_request
    ?agent_access_config:(agent_access_config_ : agent_access_config_for_update option)
    ?content_redirection:(content_redirection_ : content_redirection option)
    ?streaming_experience_settings:
      (streaming_experience_settings_ : streaming_experience_settings option)
    ?embed_host_domains:(embed_host_domains_ : embed_host_domains option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?application_settings:(application_settings_ : application_settings option)
    ?user_settings:(user_settings_ : user_setting_list option)
    ?attributes_to_delete:(attributes_to_delete_ : stack_attributes option)
    ?feedback_ur_l:(feedback_ur_l_ : feedback_ur_l option)
    ?redirect_ur_l:(redirect_ur_l_ : redirect_ur_l option)
    ?delete_storage_connectors:(delete_storage_connectors_ : boolean_ option)
    ?storage_connectors:(storage_connectors_ : storage_connector_list option)
    ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option) ~name:(name_ : string_) () =
  ({
     agent_access_config = agent_access_config_;
     content_redirection = content_redirection_;
     streaming_experience_settings = streaming_experience_settings_;
     embed_host_domains = embed_host_domains_;
     access_endpoints = access_endpoints_;
     application_settings = application_settings_;
     user_settings = user_settings_;
     attributes_to_delete = attributes_to_delete_;
     feedback_ur_l = feedback_ur_l_;
     redirect_ur_l = redirect_ur_l_;
     delete_storage_connectors = delete_storage_connectors_;
     storage_connectors = storage_connectors_;
     name = name_;
     description = description_;
     display_name = display_name_;
   }
    : update_stack_request)

let make_image_permissions ?allow_image_builder:(allow_image_builder_ : boolean_object option)
    ?allow_fleet:(allow_fleet_ : boolean_object option) () =
  ({ allow_image_builder = allow_image_builder_; allow_fleet = allow_fleet_ } : image_permissions)

let make_update_image_permissions_request
    ~image_permissions:(image_permissions_ : image_permissions)
    ~shared_account_id:(shared_account_id_ : aws_account_id) ~name:(name_ : name) () =
  ({ image_permissions = image_permissions_; shared_account_id = shared_account_id_; name = name_ }
    : update_image_permissions_request)

let make_compute_capacity_status
    ?drain_mode_unused_user_sessions:(drain_mode_unused_user_sessions_ : integer option)
    ?drain_mode_active_user_sessions:(drain_mode_active_user_sessions_ : integer option)
    ?draining:(draining_ : integer option)
    ?actual_user_sessions:(actual_user_sessions_ : integer option)
    ?active_user_sessions:(active_user_sessions_ : integer option)
    ?available_user_sessions:(available_user_sessions_ : integer option)
    ?desired_user_sessions:(desired_user_sessions_ : integer option)
    ?available:(available_ : integer option) ?in_use:(in_use_ : integer option)
    ?running:(running_ : integer option) ~desired:(desired_ : integer) () =
  ({
     drain_mode_unused_user_sessions = drain_mode_unused_user_sessions_;
     drain_mode_active_user_sessions = drain_mode_active_user_sessions_;
     draining = draining_;
     actual_user_sessions = actual_user_sessions_;
     active_user_sessions = active_user_sessions_;
     available_user_sessions = available_user_sessions_;
     desired_user_sessions = desired_user_sessions_;
     available = available_;
     in_use = in_use_;
     running = running_;
     desired = desired_;
   }
    : compute_capacity_status)

let make_fleet_error ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : fleet_error_code option) () =
  ({ error_message = error_message_; error_code = error_code_ } : fleet_error)

let make_domain_join_info
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_distinguished_name option)
    ?directory_name:(directory_name_ : directory_name option) () =
  ({
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
     directory_name = directory_name_;
   }
    : domain_join_info)

let make_fleet ?disable_imds_v1:(disable_imds_v1_ : boolean_object option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?max_sessions_per_instance:(max_sessions_per_instance_ : integer option)
    ?session_script_s3_location:(session_script_s3_location_ : s3_location option)
    ?usb_device_filter_strings:(usb_device_filter_strings_ : usb_device_filter_strings option)
    ?max_concurrent_sessions:(max_concurrent_sessions_ : integer option)
    ?platform:(platform_ : platform_type option) ?stream_view:(stream_view_ : stream_view option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?idle_disconnect_timeout_in_seconds:(idle_disconnect_timeout_in_seconds_ : integer option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?fleet_errors:(fleet_errors_ : fleet_errors option)
    ?created_time:(created_time_ : timestamp option) ?vpc_config:(vpc_config_ : vpc_config option)
    ?disconnect_timeout_in_seconds:(disconnect_timeout_in_seconds_ : integer option)
    ?max_user_duration_in_seconds:(max_user_duration_in_seconds_ : integer option)
    ?fleet_type:(fleet_type_ : fleet_type option) ?image_arn:(image_arn_ : arn option)
    ?image_name:(image_name_ : string_ option) ?description:(description_ : string_ option)
    ?display_name:(display_name_ : string_ option) ~state:(state_ : fleet_state)
    ~compute_capacity_status:(compute_capacity_status_ : compute_capacity_status)
    ~instance_type:(instance_type_ : string_) ~name:(name_ : string_) ~arn:(arn_ : arn) () =
  ({
     disable_imds_v1 = disable_imds_v1_;
     root_volume_config = root_volume_config_;
     max_sessions_per_instance = max_sessions_per_instance_;
     session_script_s3_location = session_script_s3_location_;
     usb_device_filter_strings = usb_device_filter_strings_;
     max_concurrent_sessions = max_concurrent_sessions_;
     platform = platform_;
     stream_view = stream_view_;
     iam_role_arn = iam_role_arn_;
     idle_disconnect_timeout_in_seconds = idle_disconnect_timeout_in_seconds_;
     domain_join_info = domain_join_info_;
     enable_default_internet_access = enable_default_internet_access_;
     fleet_errors = fleet_errors_;
     created_time = created_time_;
     vpc_config = vpc_config_;
     state = state_;
     disconnect_timeout_in_seconds = disconnect_timeout_in_seconds_;
     max_user_duration_in_seconds = max_user_duration_in_seconds_;
     compute_capacity_status = compute_capacity_status_;
     fleet_type = fleet_type_;
     instance_type = instance_type_;
     image_arn = image_arn_;
     image_name = image_name_;
     description = description_;
     display_name = display_name_;
     name = name_;
     arn = arn_;
   }
    : fleet)

let make_compute_capacity ?desired_sessions:(desired_sessions_ : integer option)
    ?desired_instances:(desired_instances_ : integer option) () =
  ({ desired_sessions = desired_sessions_; desired_instances = desired_instances_ }
    : compute_capacity)

let make_update_fleet_request ?disable_imds_v1:(disable_imds_v1_ : boolean_object option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?max_sessions_per_instance:(max_sessions_per_instance_ : integer option)
    ?session_script_s3_location:(session_script_s3_location_ : s3_location option)
    ?usb_device_filter_strings:(usb_device_filter_strings_ : usb_device_filter_strings option)
    ?max_concurrent_sessions:(max_concurrent_sessions_ : integer option)
    ?platform:(platform_ : platform_type option) ?stream_view:(stream_view_ : stream_view option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?attributes_to_delete:(attributes_to_delete_ : fleet_attributes option)
    ?idle_disconnect_timeout_in_seconds:(idle_disconnect_timeout_in_seconds_ : integer option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?delete_vpc_config:(delete_vpc_config_ : boolean_ option)
    ?disconnect_timeout_in_seconds:(disconnect_timeout_in_seconds_ : integer option)
    ?max_user_duration_in_seconds:(max_user_duration_in_seconds_ : integer option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?compute_capacity:(compute_capacity_ : compute_capacity option)
    ?instance_type:(instance_type_ : string_ option) ?name:(name_ : name option)
    ?image_arn:(image_arn_ : arn option) ?image_name:(image_name_ : string_ option) () =
  ({
     disable_imds_v1 = disable_imds_v1_;
     root_volume_config = root_volume_config_;
     max_sessions_per_instance = max_sessions_per_instance_;
     session_script_s3_location = session_script_s3_location_;
     usb_device_filter_strings = usb_device_filter_strings_;
     max_concurrent_sessions = max_concurrent_sessions_;
     platform = platform_;
     stream_view = stream_view_;
     iam_role_arn = iam_role_arn_;
     attributes_to_delete = attributes_to_delete_;
     idle_disconnect_timeout_in_seconds = idle_disconnect_timeout_in_seconds_;
     domain_join_info = domain_join_info_;
     enable_default_internet_access = enable_default_internet_access_;
     display_name = display_name_;
     description = description_;
     delete_vpc_config = delete_vpc_config_;
     disconnect_timeout_in_seconds = disconnect_timeout_in_seconds_;
     max_user_duration_in_seconds = max_user_duration_in_seconds_;
     vpc_config = vpc_config_;
     compute_capacity = compute_capacity_;
     instance_type = instance_type_;
     name = name_;
     image_arn = image_arn_;
     image_name = image_name_;
   }
    : update_fleet_request)

let make_entitlement_attribute ~value:(value_ : string_) ~name:(name_ : string_) () =
  ({ value = value_; name = name_ } : entitlement_attribute)

let make_entitlement ?last_modified_time:(last_modified_time_ : timestamp option)
    ?created_time:(created_time_ : timestamp option)
    ?description:(description_ : description option)
    ~attributes:(attributes_ : entitlement_attribute_list)
    ~app_visibility:(app_visibility_ : app_visibility) ~stack_name:(stack_name_ : name)
    ~name:(name_ : name) () =
  ({
     last_modified_time = last_modified_time_;
     created_time = created_time_;
     attributes = attributes_;
     app_visibility = app_visibility_;
     description = description_;
     stack_name = stack_name_;
     name = name_;
   }
    : entitlement)

let make_update_entitlement_request ?attributes:(attributes_ : entitlement_attribute_list option)
    ?app_visibility:(app_visibility_ : app_visibility option)
    ?description:(description_ : description option) ~stack_name:(stack_name_ : name)
    ~name:(name_ : name) () =
  ({
     attributes = attributes_;
     app_visibility = app_visibility_;
     description = description_;
     stack_name = stack_name_;
     name = name_;
   }
    : update_entitlement_request)

let make_service_account_credentials ~account_password:(account_password_ : account_password)
    ~account_name:(account_name_ : account_name) () =
  ({ account_password = account_password_; account_name = account_name_ }
    : service_account_credentials)

let make_certificate_based_auth_properties
    ?certificate_authority_arn:(certificate_authority_arn_ : arn option)
    ?status:(status_ : certificate_based_auth_status option) () =
  ({ certificate_authority_arn = certificate_authority_arn_; status = status_ }
    : certificate_based_auth_properties)

let make_directory_config
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ?created_time:(created_time_ : timestamp option)
    ?service_account_credentials:(service_account_credentials_ : service_account_credentials option)
    ?organizational_unit_distinguished_names:
      (organizational_unit_distinguished_names_ :
         organizational_unit_distinguished_names_list option)
    ~directory_name:(directory_name_ : directory_name) () =
  ({
     certificate_based_auth_properties = certificate_based_auth_properties_;
     created_time = created_time_;
     service_account_credentials = service_account_credentials_;
     organizational_unit_distinguished_names = organizational_unit_distinguished_names_;
     directory_name = directory_name_;
   }
    : directory_config)

let make_update_directory_config_request
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ?service_account_credentials:(service_account_credentials_ : service_account_credentials option)
    ?organizational_unit_distinguished_names:
      (organizational_unit_distinguished_names_ :
         organizational_unit_distinguished_names_list option)
    ~directory_name:(directory_name_ : directory_name) () =
  ({
     certificate_based_auth_properties = certificate_based_auth_properties_;
     service_account_credentials = service_account_credentials_;
     organizational_unit_distinguished_names = organizational_unit_distinguished_names_;
     directory_name = directory_name_;
   }
    : update_directory_config_request)

let make_application ?created_time:(created_time_ : timestamp option)
    ?instance_families:(instance_families_ : string_list option)
    ?platforms:(platforms_ : platforms option)
    ?icon_s3_location:(icon_s3_location_ : s3_location option)
    ?app_block_arn:(app_block_arn_ : arn option) ?arn:(arn_ : arn option)
    ?description:(description_ : string_ option)
    ?working_directory:(working_directory_ : string_ option) ?metadata:(metadata_ : metadata option)
    ?enabled:(enabled_ : boolean_ option) ?launch_parameters:(launch_parameters_ : string_ option)
    ?launch_path:(launch_path_ : string_ option) ?icon_ur_l:(icon_ur_l_ : string_ option)
    ?display_name:(display_name_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     created_time = created_time_;
     instance_families = instance_families_;
     platforms = platforms_;
     icon_s3_location = icon_s3_location_;
     app_block_arn = app_block_arn_;
     arn = arn_;
     description = description_;
     working_directory = working_directory_;
     metadata = metadata_;
     enabled = enabled_;
     launch_parameters = launch_parameters_;
     launch_path = launch_path_;
     icon_ur_l = icon_ur_l_;
     display_name = display_name_;
     name = name_;
   }
    : application)

let make_update_application_request
    ?attributes_to_delete:(attributes_to_delete_ : application_attributes option)
    ?app_block_arn:(app_block_arn_ : arn option)
    ?launch_parameters:(launch_parameters_ : string_ option)
    ?working_directory:(working_directory_ : string_ option)
    ?launch_path:(launch_path_ : string_ option)
    ?icon_s3_location:(icon_s3_location_ : s3_location option)
    ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option) ~name:(name_ : name) () =
  ({
     attributes_to_delete = attributes_to_delete_;
     app_block_arn = app_block_arn_;
     launch_parameters = launch_parameters_;
     working_directory = working_directory_;
     launch_path = launch_path_;
     icon_s3_location = icon_s3_location_;
     description = description_;
     display_name = display_name_;
     name = name_;
   }
    : update_application_request)

let make_resource_error ?error_timestamp:(error_timestamp_ : timestamp option)
    ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : fleet_error_code option) () =
  ({ error_timestamp = error_timestamp_; error_message = error_message_; error_code = error_code_ }
    : resource_error)

let make_app_block_builder_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : app_block_builder_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : app_block_builder_state_change_reason)

let make_app_block_builder ?disable_imds_v1:(disable_imds_v1_ : boolean_object option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?state_change_reason:(state_change_reason_ : app_block_builder_state_change_reason option)
    ?app_block_builder_errors:(app_block_builder_errors_ : resource_errors option)
    ?created_time:(created_time_ : timestamp option) ?iam_role_arn:(iam_role_arn_ : arn option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?description:(description_ : string_ option) ?display_name:(display_name_ : string_ option)
    ~state:(state_ : app_block_builder_state) ~vpc_config:(vpc_config_ : vpc_config)
    ~instance_type:(instance_type_ : string_)
    ~platform:(platform_ : app_block_builder_platform_type) ~name:(name_ : string_)
    ~arn:(arn_ : arn) () =
  ({
     disable_imds_v1 = disable_imds_v1_;
     access_endpoints = access_endpoints_;
     state_change_reason = state_change_reason_;
     app_block_builder_errors = app_block_builder_errors_;
     created_time = created_time_;
     state = state_;
     vpc_config = vpc_config_;
     iam_role_arn = iam_role_arn_;
     enable_default_internet_access = enable_default_internet_access_;
     instance_type = instance_type_;
     platform = platform_;
     description = description_;
     display_name = display_name_;
     name = name_;
     arn = arn_;
   }
    : app_block_builder)

let make_update_app_block_builder_request
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option)
    ?attributes_to_delete:(attributes_to_delete_ : app_block_builder_attributes option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?instance_type:(instance_type_ : string_ option)
    ?platform:(platform_ : platform_type option) ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ~name:(name_ : name) () =
  ({
     disable_imds_v1 = disable_imds_v1_;
     attributes_to_delete = attributes_to_delete_;
     access_endpoints = access_endpoints_;
     iam_role_arn = iam_role_arn_;
     enable_default_internet_access = enable_default_internet_access_;
     vpc_config = vpc_config_;
     instance_type = instance_type_;
     platform = platform_;
     display_name = display_name_;
     description = description_;
     name = name_;
   }
    : update_app_block_builder_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags) ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_image_builder_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : image_builder_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : image_builder_state_change_reason)

let make_network_access_configuration ?eni_id:(eni_id_ : string_ option)
    ?eni_ipv6_addresses:(eni_ipv6_addresses_ : string_list option)
    ?eni_private_ip_address:(eni_private_ip_address_ : string_ option) () =
  ({
     eni_id = eni_id_;
     eni_ipv6_addresses = eni_ipv6_addresses_;
     eni_private_ip_address = eni_private_ip_address_;
   }
    : network_access_configuration)

let make_image_builder ?disable_imds_v1:(disable_imds_v1_ : boolean_object option)
    ?latest_appstream_agent_version:
      (latest_appstream_agent_version_ : latest_appstream_agent_version option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?appstream_agent_version:(appstream_agent_version_ : appstream_agent_version option)
    ?image_builder_errors:(image_builder_errors_ : resource_errors option)
    ?network_access_configuration:
      (network_access_configuration_ : network_access_configuration option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?created_time:(created_time_ : timestamp option)
    ?state_change_reason:(state_change_reason_ : image_builder_state_change_reason option)
    ?state:(state_ : image_builder_state option) ?iam_role_arn:(iam_role_arn_ : arn option)
    ?platform:(platform_ : platform_type option) ?instance_type:(instance_type_ : string_ option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?display_name:(display_name_ : string_ option)
    ?description:(description_ : string_ option) ?image_arn:(image_arn_ : arn option)
    ?arn:(arn_ : arn option) ~name:(name_ : string_) () =
  ({
     disable_imds_v1 = disable_imds_v1_;
     latest_appstream_agent_version = latest_appstream_agent_version_;
     root_volume_config = root_volume_config_;
     access_endpoints = access_endpoints_;
     appstream_agent_version = appstream_agent_version_;
     image_builder_errors = image_builder_errors_;
     network_access_configuration = network_access_configuration_;
     domain_join_info = domain_join_info_;
     enable_default_internet_access = enable_default_internet_access_;
     created_time = created_time_;
     state_change_reason = state_change_reason_;
     state = state_;
     iam_role_arn = iam_role_arn_;
     platform = platform_;
     instance_type = instance_type_;
     vpc_config = vpc_config_;
     display_name = display_name_;
     description = description_;
     image_arn = image_arn_;
     arn = arn_;
     name = name_;
   }
    : image_builder)

let make_stop_image_builder_request ~name:(name_ : string_) () =
  ({ name = name_ } : stop_image_builder_request)

let make_stop_fleet_request ~name:(name_ : string_) () = ({ name = name_ } : stop_fleet_request)

let make_stop_app_block_builder_request ~name:(name_ : name) () =
  ({ name = name_ } : stop_app_block_builder_request)

let make_start_software_deployment_to_image_builder_request
    ?retry_failed_deployments:(retry_failed_deployments_ : boolean_ option)
    ~image_builder_name:(image_builder_name_ : name) () =
  ({
     retry_failed_deployments = retry_failed_deployments_;
     image_builder_name = image_builder_name_;
   }
    : start_software_deployment_to_image_builder_request)

let make_start_image_builder_request
    ?appstream_agent_version:(appstream_agent_version_ : appstream_agent_version option)
    ~name:(name_ : string_) () =
  ({ appstream_agent_version = appstream_agent_version_; name = name_ }
    : start_image_builder_request)

let make_start_fleet_request ~name:(name_ : string_) () = ({ name = name_ } : start_fleet_request)

let make_start_app_block_builder_request ~name:(name_ : name) () =
  ({ name = name_ } : start_app_block_builder_request)

let make_error_details ?error_message:(error_message_ : string_ option)
    ?error_code:(error_code_ : string_ option) () =
  ({ error_message = error_message_; error_code = error_code_ } : error_details)

let make_software_associations ?deployment_error:(deployment_error_ : error_details_list option)
    ?status:(status_ : software_deployment_status option)
    ?software_name:(software_name_ : string_ option) () =
  ({ deployment_error = deployment_error_; status = status_; software_name = software_name_ }
    : software_associations)

let make_shared_image_permissions ~image_permissions:(image_permissions_ : image_permissions)
    ~shared_account_id:(shared_account_id_ : aws_account_id) () =
  ({ image_permissions = image_permissions_; shared_account_id = shared_account_id_ }
    : shared_image_permissions)

let make_session ?instance_drain_status:(instance_drain_status_ : instance_drain_status option)
    ?instance_id:(instance_id_ : string_ option)
    ?network_access_configuration:
      (network_access_configuration_ : network_access_configuration option)
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?max_expiration_time:(max_expiration_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?connection_state:(connection_state_ : session_connection_state option)
    ~state:(state_ : session_state) ~fleet_name:(fleet_name_ : string_)
    ~stack_name:(stack_name_ : string_) ~user_id:(user_id_ : user_id) ~id:(id_ : string_) () =
  ({
     instance_drain_status = instance_drain_status_;
     instance_id = instance_id_;
     network_access_configuration = network_access_configuration_;
     authentication_type = authentication_type_;
     max_expiration_time = max_expiration_time_;
     start_time = start_time_;
     connection_state = connection_state_;
     state = state_;
     fleet_name = fleet_name_;
     stack_name = stack_name_;
     user_id = user_id_;
     id = id_;
   }
    : session)

let make_script_details ?executable_parameters:(executable_parameters_ : string_ option)
    ~timeout_in_seconds:(timeout_in_seconds_ : integer)
    ~executable_path:(executable_path_ : string_)
    ~script_s3_location:(script_s3_location_ : s3_location) () =
  ({
     timeout_in_seconds = timeout_in_seconds_;
     executable_parameters = executable_parameters_;
     executable_path = executable_path_;
     script_s3_location = script_s3_location_;
   }
    : script_details)

let make_runtime_validation_config
    ?intended_instance_type:(intended_instance_type_ : instance_type option) () =
  ({ intended_instance_type = intended_instance_type_ } : runtime_validation_config)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_export_image_task ?error_details:(error_details_ : error_details_list option)
    ?tag_specifications:(tag_specifications_ : tags option) ?ami_id:(ami_id_ : photon_ami_id option)
    ?state:(state_ : export_image_task_state option)
    ?ami_description:(ami_description_ : description option)
    ~created_date:(created_date_ : timestamp) ~ami_name:(ami_name_ : ami_name)
    ~image_arn:(image_arn_ : arn) ~task_id:(task_id_ : uui_d) () =
  ({
     error_details = error_details_;
     tag_specifications = tag_specifications_;
     ami_id = ami_id_;
     state = state_;
     ami_description = ami_description_;
     created_date = created_date_;
     ami_name = ami_name_;
     image_arn = image_arn_;
     task_id = task_id_;
   }
    : export_image_task)

let make_filter ~values:(values_ : filter_values) ~name:(name_ : filter_name) () =
  ({ values = values_; name = name_ } : filter)

let make_list_export_image_tasks_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_export_image_tasks_request)

let make_entitled_application ~application_identifier:(application_identifier_ : string_) () =
  ({ application_identifier = application_identifier_ } : entitled_application)

let make_list_entitled_applications_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) ~entitlement_name:(entitlement_name_ : name)
    ~stack_name:(stack_name_ : name) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     entitlement_name = entitlement_name_;
     stack_name = stack_name_;
   }
    : list_entitled_applications_request)

let make_list_associated_stacks_request ?next_token:(next_token_ : string_ option)
    ~fleet_name:(fleet_name_ : string_) () =
  ({ next_token = next_token_; fleet_name = fleet_name_ } : list_associated_stacks_request)

let make_list_associated_fleets_request ?next_token:(next_token_ : string_ option)
    ~stack_name:(stack_name_ : string_) () =
  ({ next_token = next_token_; stack_name = stack_name_ } : list_associated_fleets_request)

let make_get_export_image_task_request ?task_id:(task_id_ : uui_d option) () =
  ({ task_id = task_id_ } : get_export_image_task_request)

let make_expire_session_request ~session_id:(session_id_ : string_) () =
  ({ session_id = session_id_ } : expire_session_request)

let make_enable_user_request ~authentication_type:(authentication_type_ : authentication_type)
    ~user_name:(user_name_ : username) () =
  ({ authentication_type = authentication_type_; user_name = user_name_ } : enable_user_request)

let make_drain_session_instance_request ~session_id:(session_id_ : string_) () =
  ({ session_id = session_id_ } : drain_session_instance_request)

let make_disassociate_software_from_image_builder_request
    ~software_names:(software_names_ : string_list) ~image_builder_name:(image_builder_name_ : name)
    () =
  ({ software_names = software_names_; image_builder_name = image_builder_name_ }
    : disassociate_software_from_image_builder_request)

let make_disassociate_fleet_request ~stack_name:(stack_name_ : string_)
    ~fleet_name:(fleet_name_ : string_) () =
  ({ stack_name = stack_name_; fleet_name = fleet_name_ } : disassociate_fleet_request)

let make_disassociate_application_from_entitlement_request
    ~application_identifier:(application_identifier_ : string_)
    ~entitlement_name:(entitlement_name_ : name) ~stack_name:(stack_name_ : name) () =
  ({
     application_identifier = application_identifier_;
     entitlement_name = entitlement_name_;
     stack_name = stack_name_;
   }
    : disassociate_application_from_entitlement_request)

let make_disassociate_application_fleet_request ~application_arn:(application_arn_ : arn)
    ~fleet_name:(fleet_name_ : name) () =
  ({ application_arn = application_arn_; fleet_name = fleet_name_ }
    : disassociate_application_fleet_request)

let make_disassociate_app_block_builder_app_block_request
    ~app_block_builder_name:(app_block_builder_name_ : name) ~app_block_arn:(app_block_arn_ : arn)
    () =
  ({ app_block_builder_name = app_block_builder_name_; app_block_arn = app_block_arn_ }
    : disassociate_app_block_builder_app_block_request)

let make_disable_user_request ~authentication_type:(authentication_type_ : authentication_type)
    ~user_name:(user_name_ : username) () =
  ({ authentication_type = authentication_type_; user_name = user_name_ } : disable_user_request)

let make_describe_user_stack_associations_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results option)
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?user_name:(user_name_ : username option) ?stack_name:(stack_name_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     authentication_type = authentication_type_;
     user_name = user_name_;
     stack_name = stack_name_;
   }
    : describe_user_stack_associations_request)

let make_describe_users_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     authentication_type = authentication_type_;
   }
    : describe_users_request)

let make_describe_usage_report_subscriptions_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option) () =
  ({ next_token = next_token_; max_results = max_results_ }
    : describe_usage_report_subscriptions_request)

let make_describe_theme_for_stack_request ~stack_name:(stack_name_ : name) () =
  ({ stack_name = stack_name_ } : describe_theme_for_stack_request)

let make_describe_stacks_request ?next_token:(next_token_ : string_ option)
    ?names:(names_ : string_list option) () =
  ({ next_token = next_token_; names = names_ } : describe_stacks_request)

let make_describe_software_associations_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option) ~associated_resource:(associated_resource_ : arn)
    () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     associated_resource = associated_resource_;
   }
    : describe_software_associations_request)

let make_describe_sessions_request ?instance_id:(instance_id_ : string_ option)
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?limit:(limit_ : integer option) ?next_token:(next_token_ : string_ option)
    ?user_id:(user_id_ : user_id option) ~fleet_name:(fleet_name_ : name)
    ~stack_name:(stack_name_ : name) () =
  ({
     instance_id = instance_id_;
     authentication_type = authentication_type_;
     limit = limit_;
     next_token = next_token_;
     user_id = user_id_;
     fleet_name = fleet_name_;
     stack_name = stack_name_;
   }
    : describe_sessions_request)

let make_image_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : image_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : image_state_change_reason)

let make_image ?image_type:(image_type_ : image_type option)
    ?managed_software_included:(managed_software_included_ : boolean_ option)
    ?image_shared_with_others:(image_shared_with_others_ : image_shared_with_others option)
    ?dynamic_app_providers_enabled:
      (dynamic_app_providers_enabled_ : dynamic_app_providers_enabled option)
    ?supported_instance_families:(supported_instance_families_ : string_list option)
    ?latest_appstream_agent_version:
      (latest_appstream_agent_version_ : latest_appstream_agent_version option)
    ?image_errors:(image_errors_ : resource_errors option)
    ?image_permissions:(image_permissions_ : image_permissions option)
    ?appstream_agent_version:(appstream_agent_version_ : appstream_agent_version option)
    ?public_base_image_released_date:(public_base_image_released_date_ : timestamp option)
    ?created_time:(created_time_ : timestamp option)
    ?applications:(applications_ : applications option)
    ?state_change_reason:(state_change_reason_ : image_state_change_reason option)
    ?description:(description_ : string_ option) ?platform:(platform_ : platform_type option)
    ?image_builder_name:(image_builder_name_ : string_ option)
    ?image_builder_supported:(image_builder_supported_ : boolean_ option)
    ?visibility:(visibility_ : visibility_type option) ?state:(state_ : image_state option)
    ?display_name:(display_name_ : string_ option) ?base_image_arn:(base_image_arn_ : arn option)
    ?arn:(arn_ : arn option) ~name:(name_ : string_) () =
  ({
     image_type = image_type_;
     managed_software_included = managed_software_included_;
     image_shared_with_others = image_shared_with_others_;
     dynamic_app_providers_enabled = dynamic_app_providers_enabled_;
     supported_instance_families = supported_instance_families_;
     latest_appstream_agent_version = latest_appstream_agent_version_;
     image_errors = image_errors_;
     image_permissions = image_permissions_;
     appstream_agent_version = appstream_agent_version_;
     public_base_image_released_date = public_base_image_released_date_;
     created_time = created_time_;
     applications = applications_;
     state_change_reason = state_change_reason_;
     description = description_;
     platform = platform_;
     image_builder_name = image_builder_name_;
     image_builder_supported = image_builder_supported_;
     visibility = visibility_;
     state = state_;
     display_name = display_name_;
     base_image_arn = base_image_arn_;
     arn = arn_;
     name = name_;
   }
    : image)

let make_describe_images_request ?max_results:(max_results_ : describe_images_max_results option)
    ?next_token:(next_token_ : string_ option) ?type_:(type__ : visibility_type option)
    ?arns:(arns_ : arn_list option) ?names:(names_ : string_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     type_ = type__;
     arns = arns_;
     names = names_;
   }
    : describe_images_request)

let make_describe_image_permissions_request ?next_token:(next_token_ : string_ option)
    ?shared_aws_account_ids:(shared_aws_account_ids_ : aws_account_id_list option)
    ?max_results:(max_results_ : max_results option) ~name:(name_ : name) () =
  ({
     next_token = next_token_;
     shared_aws_account_ids = shared_aws_account_ids_;
     max_results = max_results_;
     name = name_;
   }
    : describe_image_permissions_request)

let make_describe_image_builders_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option) ?names:(names_ : string_list option) () =
  ({ next_token = next_token_; max_results = max_results_; names = names_ }
    : describe_image_builders_request)

let make_describe_fleets_request ?next_token:(next_token_ : string_ option)
    ?names:(names_ : string_list option) () =
  ({ next_token = next_token_; names = names_ } : describe_fleets_request)

let make_describe_entitlements_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) ?name:(name_ : name option)
    ~stack_name:(stack_name_ : name) () =
  ({ max_results = max_results_; next_token = next_token_; stack_name = stack_name_; name = name_ }
    : describe_entitlements_request)

let make_describe_directory_configs_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option)
    ?directory_names:(directory_names_ : directory_name_list option) () =
  ({ next_token = next_token_; max_results = max_results_; directory_names = directory_names_ }
    : describe_directory_configs_request)

let make_admin_app_license_usage_record ~user_id:(user_id_ : string_)
    ~license_type:(license_type_ : string_)
    ~subscription_last_used_date:(subscription_last_used_date_ : timestamp)
    ~subscription_first_used_date:(subscription_first_used_date_ : timestamp)
    ~owner_aws_account_id:(owner_aws_account_id_ : aws_account_id)
    ~billing_period:(billing_period_ : string_) ~user_arn:(user_arn_ : string_) () =
  ({
     user_id = user_id_;
     license_type = license_type_;
     subscription_last_used_date = subscription_last_used_date_;
     subscription_first_used_date = subscription_first_used_date_;
     owner_aws_account_id = owner_aws_account_id_;
     billing_period = billing_period_;
     user_arn = user_arn_;
   }
    : admin_app_license_usage_record)

let make_describe_app_license_usage_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option) ~billing_period:(billing_period_ : string_) () =
  ({ next_token = next_token_; max_results = max_results_; billing_period = billing_period_ }
    : describe_app_license_usage_request)

let make_describe_applications_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) ?arns:(arns_ : arn_list option) () =
  ({ max_results = max_results_; next_token = next_token_; arns = arns_ }
    : describe_applications_request)

let make_application_fleet_association ~application_arn:(application_arn_ : arn)
    ~fleet_name:(fleet_name_ : string_) () =
  ({ application_arn = application_arn_; fleet_name = fleet_name_ } : application_fleet_association)

let make_describe_application_fleet_associations_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option) ?application_arn:(application_arn_ : arn option)
    ?fleet_name:(fleet_name_ : name option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     application_arn = application_arn_;
     fleet_name = fleet_name_;
   }
    : describe_application_fleet_associations_request)

let make_app_block ?app_block_errors:(app_block_errors_ : error_details_list option)
    ?state:(state_ : app_block_state option)
    ?packaging_type:(packaging_type_ : packaging_type option)
    ?post_setup_script_details:(post_setup_script_details_ : script_details option)
    ?created_time:(created_time_ : timestamp option)
    ?setup_script_details:(setup_script_details_ : script_details option)
    ?source_s3_location:(source_s3_location_ : s3_location option)
    ?display_name:(display_name_ : string_ option) ?description:(description_ : string_ option)
    ~arn:(arn_ : arn) ~name:(name_ : string_) () =
  ({
     app_block_errors = app_block_errors_;
     state = state_;
     packaging_type = packaging_type_;
     post_setup_script_details = post_setup_script_details_;
     created_time = created_time_;
     setup_script_details = setup_script_details_;
     source_s3_location = source_s3_location_;
     display_name = display_name_;
     description = description_;
     arn = arn_;
     name = name_;
   }
    : app_block)

let make_describe_app_blocks_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) ?arns:(arns_ : arn_list option) () =
  ({ max_results = max_results_; next_token = next_token_; arns = arns_ }
    : describe_app_blocks_request)

let make_describe_app_block_builders_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) ?names:(names_ : string_list option) () =
  ({ max_results = max_results_; next_token = next_token_; names = names_ }
    : describe_app_block_builders_request)

let make_app_block_builder_app_block_association
    ~app_block_builder_name:(app_block_builder_name_ : name) ~app_block_arn:(app_block_arn_ : arn)
    () =
  ({ app_block_builder_name = app_block_builder_name_; app_block_arn = app_block_arn_ }
    : app_block_builder_app_block_association)

let make_describe_app_block_builder_app_block_associations_request
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer option)
    ?app_block_builder_name:(app_block_builder_name_ : name option)
    ?app_block_arn:(app_block_arn_ : arn option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     app_block_builder_name = app_block_builder_name_;
     app_block_arn = app_block_arn_;
   }
    : describe_app_block_builder_app_block_associations_request)

let make_delete_user_request ~authentication_type:(authentication_type_ : authentication_type)
    ~user_name:(user_name_ : username) () =
  ({ authentication_type = authentication_type_; user_name = user_name_ } : delete_user_request)

let make_delete_usage_report_subscription_request () = (() : unit)

let make_delete_theme_for_stack_request ~stack_name:(stack_name_ : name) () =
  ({ stack_name = stack_name_ } : delete_theme_for_stack_request)

let make_delete_stack_request ~name:(name_ : string_) () = ({ name = name_ } : delete_stack_request)

let make_delete_image_permissions_request ~shared_account_id:(shared_account_id_ : aws_account_id)
    ~name:(name_ : name) () =
  ({ shared_account_id = shared_account_id_; name = name_ } : delete_image_permissions_request)

let make_delete_image_builder_request ~name:(name_ : name) () =
  ({ name = name_ } : delete_image_builder_request)

let make_delete_image_request ~name:(name_ : name) () = ({ name = name_ } : delete_image_request)
let make_delete_fleet_request ~name:(name_ : string_) () = ({ name = name_ } : delete_fleet_request)

let make_delete_entitlement_request ~stack_name:(stack_name_ : name) ~name:(name_ : name) () =
  ({ stack_name = stack_name_; name = name_ } : delete_entitlement_request)

let make_delete_directory_config_request ~directory_name:(directory_name_ : directory_name) () =
  ({ directory_name = directory_name_ } : delete_directory_config_request)

let make_delete_application_request ~name:(name_ : name) () =
  ({ name = name_ } : delete_application_request)

let make_delete_app_block_builder_request ~name:(name_ : name) () =
  ({ name = name_ } : delete_app_block_builder_request)

let make_delete_app_block_request ~name:(name_ : name) () =
  ({ name = name_ } : delete_app_block_request)

let make_create_user_request ?last_name:(last_name_ : user_attribute_value option)
    ?first_name:(first_name_ : user_attribute_value option)
    ?message_action:(message_action_ : message_action option)
    ~authentication_type:(authentication_type_ : authentication_type)
    ~user_name:(user_name_ : username) () =
  ({
     authentication_type = authentication_type_;
     last_name = last_name_;
     first_name = first_name_;
     message_action = message_action_;
     user_name = user_name_;
   }
    : create_user_request)

let make_create_usage_report_subscription_request () = (() : unit)

let make_create_updated_image_request ?dry_run:(dry_run_ : boolean_ option)
    ?new_image_tags:(new_image_tags_ : tags option)
    ?new_image_display_name:(new_image_display_name_ : display_name option)
    ?new_image_description:(new_image_description_ : description option)
    ~new_image_name:(new_image_name_ : name) ~existing_image_name:(existing_image_name_ : name) () =
  ({
     dry_run = dry_run_;
     new_image_tags = new_image_tags_;
     new_image_display_name = new_image_display_name_;
     new_image_description = new_image_description_;
     new_image_name = new_image_name_;
     existing_image_name = existing_image_name_;
   }
    : create_updated_image_request)

let make_create_theme_for_stack_request ?footer_links:(footer_links_ : theme_footer_links option)
    ~favicon_s3_location:(favicon_s3_location_ : s3_location)
    ~organization_logo_s3_location:(organization_logo_s3_location_ : s3_location)
    ~theme_styling:(theme_styling_ : theme_styling) ~title_text:(title_text_ : theme_title_text)
    ~stack_name:(stack_name_ : name) () =
  ({
     favicon_s3_location = favicon_s3_location_;
     organization_logo_s3_location = organization_logo_s3_location_;
     theme_styling = theme_styling_;
     title_text = title_text_;
     footer_links = footer_links_;
     stack_name = stack_name_;
   }
    : create_theme_for_stack_request)

let make_create_streaming_url_request ?session_context:(session_context_ : string_ option)
    ?validity:(validity_ : long option) ?application_id:(application_id_ : string_ option)
    ~user_id:(user_id_ : streaming_url_user_id) ~fleet_name:(fleet_name_ : string_)
    ~stack_name:(stack_name_ : string_) () =
  ({
     session_context = session_context_;
     validity = validity_;
     application_id = application_id_;
     user_id = user_id_;
     fleet_name = fleet_name_;
     stack_name = stack_name_;
   }
    : create_streaming_url_request)

let make_create_stack_request
    ?agent_access_config:(agent_access_config_ : agent_access_config option)
    ?content_redirection:(content_redirection_ : content_redirection option)
    ?streaming_experience_settings:
      (streaming_experience_settings_ : streaming_experience_settings option)
    ?embed_host_domains:(embed_host_domains_ : embed_host_domains option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option) ?tags:(tags_ : tags option)
    ?application_settings:(application_settings_ : application_settings option)
    ?user_settings:(user_settings_ : user_setting_list option)
    ?feedback_ur_l:(feedback_ur_l_ : feedback_ur_l option)
    ?redirect_ur_l:(redirect_ur_l_ : redirect_ur_l option)
    ?storage_connectors:(storage_connectors_ : storage_connector_list option)
    ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ~name:(name_ : name) () =
  ({
     agent_access_config = agent_access_config_;
     content_redirection = content_redirection_;
     streaming_experience_settings = streaming_experience_settings_;
     embed_host_domains = embed_host_domains_;
     access_endpoints = access_endpoints_;
     tags = tags_;
     application_settings = application_settings_;
     user_settings = user_settings_;
     feedback_ur_l = feedback_ur_l_;
     redirect_ur_l = redirect_ur_l_;
     storage_connectors = storage_connectors_;
     display_name = display_name_;
     description = description_;
     name = name_;
   }
    : create_stack_request)

let make_application_config ?launch_parameters:(launch_parameters_ : launch_parameters option)
    ?working_directory:(working_directory_ : file_path option)
    ?absolute_manifest_path:(absolute_manifest_path_ : file_path option)
    ?absolute_icon_path:(absolute_icon_path_ : file_path option)
    ?display_name:(display_name_ : app_display_name option)
    ~absolute_app_path:(absolute_app_path_ : file_path) ~name:(name_ : app_name) () =
  ({
     launch_parameters = launch_parameters_;
     working_directory = working_directory_;
     absolute_manifest_path = absolute_manifest_path_;
     absolute_icon_path = absolute_icon_path_;
     absolute_app_path = absolute_app_path_;
     display_name = display_name_;
     name = name_;
   }
    : application_config)

let make_create_imported_image_request ?dry_run:(dry_run_ : boolean_ option)
    ?app_catalog_config:(app_catalog_config_ : app_catalog_config option)
    ?agent_software_version:(agent_software_version_ : agent_software_version option)
    ?runtime_validation_config:(runtime_validation_config_ : runtime_validation_config option)
    ?tags:(tags_ : tags option) ?display_name:(display_name_ : image_import_display_name option)
    ?description:(description_ : image_import_description option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?workspace_image_id:(workspace_image_id_ : workspace_image_id option)
    ?source_ami_id:(source_ami_id_ : photon_ami_id option) ~name:(name_ : name) () =
  ({
     dry_run = dry_run_;
     app_catalog_config = app_catalog_config_;
     agent_software_version = agent_software_version_;
     runtime_validation_config = runtime_validation_config_;
     tags = tags_;
     display_name = display_name_;
     description = description_;
     iam_role_arn = iam_role_arn_;
     workspace_image_id = workspace_image_id_;
     source_ami_id = source_ami_id_;
     name = name_;
   }
    : create_imported_image_request)

let make_create_image_builder_streaming_url_request ?validity:(validity_ : long option)
    ~name:(name_ : string_) () =
  ({ validity = validity_; name = name_ } : create_image_builder_streaming_url_request)

let make_create_image_builder_request ?disable_imds_v1:(disable_imds_v1_ : boolean_object option)
    ?softwares_to_uninstall:(softwares_to_uninstall_ : string_list option)
    ?softwares_to_install:(softwares_to_install_ : string_list option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option) ?tags:(tags_ : tags option)
    ?appstream_agent_version:(appstream_agent_version_ : appstream_agent_version option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?iam_role_arn:(iam_role_arn_ : arn option) ?vpc_config:(vpc_config_ : vpc_config option)
    ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ?image_arn:(image_arn_ : arn option)
    ?image_name:(image_name_ : string_ option) ~instance_type:(instance_type_ : string_)
    ~name:(name_ : name) () =
  ({
     disable_imds_v1 = disable_imds_v1_;
     softwares_to_uninstall = softwares_to_uninstall_;
     softwares_to_install = softwares_to_install_;
     root_volume_config = root_volume_config_;
     access_endpoints = access_endpoints_;
     tags = tags_;
     appstream_agent_version = appstream_agent_version_;
     domain_join_info = domain_join_info_;
     enable_default_internet_access = enable_default_internet_access_;
     iam_role_arn = iam_role_arn_;
     vpc_config = vpc_config_;
     display_name = display_name_;
     description = description_;
     instance_type = instance_type_;
     image_arn = image_arn_;
     image_name = image_name_;
     name = name_;
   }
    : create_image_builder_request)

let make_create_fleet_request ?disable_imds_v1:(disable_imds_v1_ : boolean_object option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?max_sessions_per_instance:(max_sessions_per_instance_ : integer option)
    ?session_script_s3_location:(session_script_s3_location_ : s3_location option)
    ?usb_device_filter_strings:(usb_device_filter_strings_ : usb_device_filter_strings option)
    ?max_concurrent_sessions:(max_concurrent_sessions_ : integer option)
    ?platform:(platform_ : platform_type option) ?stream_view:(stream_view_ : stream_view option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?idle_disconnect_timeout_in_seconds:(idle_disconnect_timeout_in_seconds_ : integer option)
    ?tags:(tags_ : tags option) ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?disconnect_timeout_in_seconds:(disconnect_timeout_in_seconds_ : integer option)
    ?max_user_duration_in_seconds:(max_user_duration_in_seconds_ : integer option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?compute_capacity:(compute_capacity_ : compute_capacity option)
    ?fleet_type:(fleet_type_ : fleet_type option) ?image_arn:(image_arn_ : arn option)
    ?image_name:(image_name_ : name option) ~instance_type:(instance_type_ : string_)
    ~name:(name_ : name) () =
  ({
     disable_imds_v1 = disable_imds_v1_;
     root_volume_config = root_volume_config_;
     max_sessions_per_instance = max_sessions_per_instance_;
     session_script_s3_location = session_script_s3_location_;
     usb_device_filter_strings = usb_device_filter_strings_;
     max_concurrent_sessions = max_concurrent_sessions_;
     platform = platform_;
     stream_view = stream_view_;
     iam_role_arn = iam_role_arn_;
     idle_disconnect_timeout_in_seconds = idle_disconnect_timeout_in_seconds_;
     tags = tags_;
     domain_join_info = domain_join_info_;
     enable_default_internet_access = enable_default_internet_access_;
     display_name = display_name_;
     description = description_;
     disconnect_timeout_in_seconds = disconnect_timeout_in_seconds_;
     max_user_duration_in_seconds = max_user_duration_in_seconds_;
     vpc_config = vpc_config_;
     compute_capacity = compute_capacity_;
     fleet_type = fleet_type_;
     instance_type = instance_type_;
     image_arn = image_arn_;
     image_name = image_name_;
     name = name_;
   }
    : create_fleet_request)

let make_create_export_image_task_request ?ami_description:(ami_description_ : description option)
    ?tag_specifications:(tag_specifications_ : tags option) ~iam_role_arn:(iam_role_arn_ : arn)
    ~ami_name:(ami_name_ : ami_name) ~image_name:(image_name_ : name) () =
  ({
     ami_description = ami_description_;
     tag_specifications = tag_specifications_;
     iam_role_arn = iam_role_arn_;
     ami_name = ami_name_;
     image_name = image_name_;
   }
    : create_export_image_task_request)

let make_create_entitlement_request ?description:(description_ : description option)
    ~attributes:(attributes_ : entitlement_attribute_list)
    ~app_visibility:(app_visibility_ : app_visibility) ~stack_name:(stack_name_ : name)
    ~name:(name_ : name) () =
  ({
     attributes = attributes_;
     app_visibility = app_visibility_;
     description = description_;
     stack_name = stack_name_;
     name = name_;
   }
    : create_entitlement_request)

let make_create_directory_config_request
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ?service_account_credentials:(service_account_credentials_ : service_account_credentials option)
    ~organizational_unit_distinguished_names:
      (organizational_unit_distinguished_names_ : organizational_unit_distinguished_names_list)
    ~directory_name:(directory_name_ : directory_name) () =
  ({
     certificate_based_auth_properties = certificate_based_auth_properties_;
     service_account_credentials = service_account_credentials_;
     organizational_unit_distinguished_names = organizational_unit_distinguished_names_;
     directory_name = directory_name_;
   }
    : create_directory_config_request)

let make_create_application_request ?tags:(tags_ : tags option)
    ?launch_parameters:(launch_parameters_ : string_ option)
    ?working_directory:(working_directory_ : string_ option)
    ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option) ~app_block_arn:(app_block_arn_ : arn)
    ~instance_families:(instance_families_ : string_list) ~platforms:(platforms_ : platforms)
    ~launch_path:(launch_path_ : string_) ~icon_s3_location:(icon_s3_location_ : s3_location)
    ~name:(name_ : name) () =
  ({
     tags = tags_;
     app_block_arn = app_block_arn_;
     instance_families = instance_families_;
     platforms = platforms_;
     launch_parameters = launch_parameters_;
     working_directory = working_directory_;
     launch_path = launch_path_;
     icon_s3_location = icon_s3_location_;
     description = description_;
     display_name = display_name_;
     name = name_;
   }
    : create_application_request)

let make_create_app_block_builder_streaming_url_request ?validity:(validity_ : long option)
    ~app_block_builder_name:(app_block_builder_name_ : name) () =
  ({ validity = validity_; app_block_builder_name = app_block_builder_name_ }
    : create_app_block_builder_streaming_url_request)

let make_create_app_block_builder_request
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?tags:(tags_ : tags option) ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option) ~vpc_config:(vpc_config_ : vpc_config)
    ~instance_type:(instance_type_ : string_)
    ~platform:(platform_ : app_block_builder_platform_type) ~name:(name_ : name) () =
  ({
     disable_imds_v1 = disable_imds_v1_;
     access_endpoints = access_endpoints_;
     iam_role_arn = iam_role_arn_;
     enable_default_internet_access = enable_default_internet_access_;
     vpc_config = vpc_config_;
     instance_type = instance_type_;
     platform = platform_;
     tags = tags_;
     display_name = display_name_;
     description = description_;
     name = name_;
   }
    : create_app_block_builder_request)

let make_create_app_block_request ?packaging_type:(packaging_type_ : packaging_type option)
    ?post_setup_script_details:(post_setup_script_details_ : script_details option)
    ?tags:(tags_ : tags option)
    ?setup_script_details:(setup_script_details_ : script_details option)
    ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ~source_s3_location:(source_s3_location_ : s3_location) ~name:(name_ : name) () =
  ({
     packaging_type = packaging_type_;
     post_setup_script_details = post_setup_script_details_;
     tags = tags_;
     setup_script_details = setup_script_details_;
     source_s3_location = source_s3_location_;
     display_name = display_name_;
     description = description_;
     name = name_;
   }
    : create_app_block_request)

let make_copy_image_response ?destination_image_name:(destination_image_name_ : name option) () =
  ({ destination_image_name = destination_image_name_ } : copy_image_response)

let make_copy_image_request
    ?destination_image_description:(destination_image_description_ : description option)
    ~destination_region:(destination_region_ : region_name)
    ~destination_image_name:(destination_image_name_ : name)
    ~source_image_name:(source_image_name_ : name) () =
  ({
     destination_image_description = destination_image_description_;
     destination_region = destination_region_;
     destination_image_name = destination_image_name_;
     source_image_name = source_image_name_;
   }
    : copy_image_request)

let make_batch_disassociate_user_stack_request
    ~user_stack_associations:(user_stack_associations_ : user_stack_association_list) () =
  ({ user_stack_associations = user_stack_associations_ } : batch_disassociate_user_stack_request)

let make_batch_associate_user_stack_request
    ~user_stack_associations:(user_stack_associations_ : user_stack_association_list) () =
  ({ user_stack_associations = user_stack_associations_ } : batch_associate_user_stack_request)

let make_associate_software_to_image_builder_request ~software_names:(software_names_ : string_list)
    ~image_builder_name:(image_builder_name_ : name) () =
  ({ software_names = software_names_; image_builder_name = image_builder_name_ }
    : associate_software_to_image_builder_request)

let make_associate_fleet_request ~stack_name:(stack_name_ : string_)
    ~fleet_name:(fleet_name_ : string_) () =
  ({ stack_name = stack_name_; fleet_name = fleet_name_ } : associate_fleet_request)

let make_associate_application_to_entitlement_request
    ~application_identifier:(application_identifier_ : string_)
    ~entitlement_name:(entitlement_name_ : name) ~stack_name:(stack_name_ : name) () =
  ({
     application_identifier = application_identifier_;
     entitlement_name = entitlement_name_;
     stack_name = stack_name_;
   }
    : associate_application_to_entitlement_request)

let make_associate_application_fleet_request ~application_arn:(application_arn_ : arn)
    ~fleet_name:(fleet_name_ : name) () =
  ({ application_arn = application_arn_; fleet_name = fleet_name_ }
    : associate_application_fleet_request)

let make_associate_app_block_builder_app_block_request
    ~app_block_builder_name:(app_block_builder_name_ : name) ~app_block_arn:(app_block_arn_ : arn)
    () =
  ({ app_block_builder_name = app_block_builder_name_; app_block_arn = app_block_arn_ }
    : associate_app_block_builder_app_block_request)
