open Types

let make_access_endpoint ?vpce_id:(vpce_id_ : string_ option)
    ~endpoint_type:(endpoint_type_ : access_endpoint_type) () =
  ({ endpoint_type = endpoint_type_; vpce_id = vpce_id_ } : access_endpoint)

let make_admin_app_license_usage_record ~user_arn:(user_arn_ : string_)
    ~billing_period:(billing_period_ : string_)
    ~owner_aws_account_id:(owner_aws_account_id_ : aws_account_id)
    ~subscription_first_used_date:(subscription_first_used_date_ : timestamp)
    ~subscription_last_used_date:(subscription_last_used_date_ : timestamp)
    ~license_type:(license_type_ : string_) ~user_id:(user_id_ : string_) () =
  ({
     user_arn = user_arn_;
     billing_period = billing_period_;
     owner_aws_account_id = owner_aws_account_id_;
     subscription_first_used_date = subscription_first_used_date_;
     subscription_last_used_date = subscription_last_used_date_;
     license_type = license_type_;
     user_id = user_id_;
   }
    : admin_app_license_usage_record)

let make_agent_access_setting ~agent_action:(agent_action_ : agent_action)
    ~permission:(permission_ : permission) () =
  ({ agent_action = agent_action_; permission = permission_ } : agent_access_setting)

let make_agent_access_config ?s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn option)
    ?screenshots_upload_enabled:(screenshots_upload_enabled_ : boolean_object option)
    ?user_control_mode:(user_control_mode_ : user_control_mode option)
    ~settings:(settings_ : agent_access_setting_list)
    ~screen_resolution:(screen_resolution_ : screen_resolution)
    ~screen_image_format:(screen_image_format_ : screen_image_format) () =
  ({
     settings = settings_;
     s3_bucket_arn = s3_bucket_arn_;
     screenshots_upload_enabled = screenshots_upload_enabled_;
     screen_resolution = screen_resolution_;
     screen_image_format = screen_image_format_;
     user_control_mode = user_control_mode_;
   }
    : agent_access_config)

let make_agent_access_config_for_update ?settings:(settings_ : agent_access_setting_list option)
    ?s3_bucket_arn:(s3_bucket_arn_ : s3_bucket_arn option)
    ?screenshots_upload_enabled:(screenshots_upload_enabled_ : boolean_object option)
    ?screen_resolution:(screen_resolution_ : screen_resolution option)
    ?screen_image_format:(screen_image_format_ : screen_image_format option)
    ?user_control_mode:(user_control_mode_ : user_control_mode option) () =
  ({
     settings = settings_;
     s3_bucket_arn = s3_bucket_arn_;
     screenshots_upload_enabled = screenshots_upload_enabled_;
     screen_resolution = screen_resolution_;
     screen_image_format = screen_image_format_;
     user_control_mode = user_control_mode_;
   }
    : agent_access_config_for_update)

let make_error_details ?error_code:(error_code_ : string_ option)
    ?error_message:(error_message_ : string_ option) () =
  ({ error_code = error_code_; error_message = error_message_ } : error_details)

let make_s3_location ?s3_key:(s3_key_ : s3_key option) ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_bucket = s3_bucket_; s3_key = s3_key_ } : s3_location)

let make_script_details ?executable_parameters:(executable_parameters_ : string_ option)
    ~script_s3_location:(script_s3_location_ : s3_location)
    ~executable_path:(executable_path_ : string_)
    ~timeout_in_seconds:(timeout_in_seconds_ : integer) () =
  ({
     script_s3_location = script_s3_location_;
     executable_path = executable_path_;
     executable_parameters = executable_parameters_;
     timeout_in_seconds = timeout_in_seconds_;
   }
    : script_details)

let make_app_block ?description:(description_ : string_ option)
    ?display_name:(display_name_ : string_ option)
    ?source_s3_location:(source_s3_location_ : s3_location option)
    ?setup_script_details:(setup_script_details_ : script_details option)
    ?created_time:(created_time_ : timestamp option)
    ?post_setup_script_details:(post_setup_script_details_ : script_details option)
    ?packaging_type:(packaging_type_ : packaging_type option)
    ?state:(state_ : app_block_state option)
    ?app_block_errors:(app_block_errors_ : error_details_list option) ~name:(name_ : string_)
    ~arn:(arn_ : arn) () =
  ({
     name = name_;
     arn = arn_;
     description = description_;
     display_name = display_name_;
     source_s3_location = source_s3_location_;
     setup_script_details = setup_script_details_;
     created_time = created_time_;
     post_setup_script_details = post_setup_script_details_;
     packaging_type = packaging_type_;
     state = state_;
     app_block_errors = app_block_errors_;
   }
    : app_block)

let make_app_block_builder_state_change_reason
    ?code:(code_ : app_block_builder_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : app_block_builder_state_change_reason)

let make_resource_error ?error_code:(error_code_ : fleet_error_code option)
    ?error_message:(error_message_ : string_ option)
    ?error_timestamp:(error_timestamp_ : timestamp option) () =
  ({ error_code = error_code_; error_message = error_message_; error_timestamp = error_timestamp_ }
    : resource_error)

let make_vpc_config ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?security_group_ids:(security_group_ids_ : security_group_id_list option) () =
  ({ subnet_ids = subnet_ids_; security_group_ids = security_group_ids_ } : vpc_config)

let make_app_block_builder ?display_name:(display_name_ : string_ option)
    ?description:(description_ : string_ option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?iam_role_arn:(iam_role_arn_ : arn option) ?created_time:(created_time_ : timestamp option)
    ?app_block_builder_errors:(app_block_builder_errors_ : resource_errors option)
    ?state_change_reason:(state_change_reason_ : app_block_builder_state_change_reason option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option) ~arn:(arn_ : arn)
    ~name:(name_ : string_) ~platform:(platform_ : app_block_builder_platform_type)
    ~instance_type:(instance_type_ : string_) ~vpc_config:(vpc_config_ : vpc_config)
    ~state:(state_ : app_block_builder_state) () =
  ({
     arn = arn_;
     name = name_;
     display_name = display_name_;
     description = description_;
     platform = platform_;
     instance_type = instance_type_;
     enable_default_internet_access = enable_default_internet_access_;
     iam_role_arn = iam_role_arn_;
     vpc_config = vpc_config_;
     state = state_;
     created_time = created_time_;
     app_block_builder_errors = app_block_builder_errors_;
     state_change_reason = state_change_reason_;
     access_endpoints = access_endpoints_;
     disable_imds_v1 = disable_imds_v1_;
   }
    : app_block_builder)

let make_app_block_builder_app_block_association ~app_block_arn:(app_block_arn_ : arn)
    ~app_block_builder_name:(app_block_builder_name_ : name) () =
  ({ app_block_arn = app_block_arn_; app_block_builder_name = app_block_builder_name_ }
    : app_block_builder_app_block_association)

let make_application_config ?display_name:(display_name_ : app_display_name option)
    ?absolute_icon_path:(absolute_icon_path_ : file_path option)
    ?absolute_manifest_path:(absolute_manifest_path_ : file_path option)
    ?working_directory:(working_directory_ : file_path option)
    ?launch_parameters:(launch_parameters_ : launch_parameters option) ~name:(name_ : app_name)
    ~absolute_app_path:(absolute_app_path_ : file_path) () =
  ({
     name = name_;
     display_name = display_name_;
     absolute_app_path = absolute_app_path_;
     absolute_icon_path = absolute_icon_path_;
     absolute_manifest_path = absolute_manifest_path_;
     working_directory = working_directory_;
     launch_parameters = launch_parameters_;
   }
    : application_config)

let make_application ?name:(name_ : string_ option) ?display_name:(display_name_ : string_ option)
    ?icon_ur_l:(icon_ur_l_ : string_ option) ?launch_path:(launch_path_ : string_ option)
    ?launch_parameters:(launch_parameters_ : string_ option) ?enabled:(enabled_ : boolean_ option)
    ?metadata:(metadata_ : metadata option) ?working_directory:(working_directory_ : string_ option)
    ?description:(description_ : string_ option) ?arn:(arn_ : arn option)
    ?app_block_arn:(app_block_arn_ : arn option)
    ?icon_s3_location:(icon_s3_location_ : s3_location option)
    ?platforms:(platforms_ : platforms option)
    ?instance_families:(instance_families_ : string_list option)
    ?created_time:(created_time_ : timestamp option) () =
  ({
     name = name_;
     display_name = display_name_;
     icon_ur_l = icon_ur_l_;
     launch_path = launch_path_;
     launch_parameters = launch_parameters_;
     enabled = enabled_;
     metadata = metadata_;
     working_directory = working_directory_;
     description = description_;
     arn = arn_;
     app_block_arn = app_block_arn_;
     icon_s3_location = icon_s3_location_;
     platforms = platforms_;
     instance_families = instance_families_;
     created_time = created_time_;
   }
    : application)

let make_application_fleet_association ~fleet_name:(fleet_name_ : string_)
    ~application_arn:(application_arn_ : arn) () =
  ({ fleet_name = fleet_name_; application_arn = application_arn_ } : application_fleet_association)

let make_application_settings ?settings_group:(settings_group_ : settings_group option)
    ~enabled:(enabled_ : boolean_) () =
  ({ enabled = enabled_; settings_group = settings_group_ } : application_settings)

let make_application_settings_response ?enabled:(enabled_ : boolean_ option)
    ?settings_group:(settings_group_ : settings_group option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option) () =
  ({ enabled = enabled_; settings_group = settings_group_; s3_bucket_name = s3_bucket_name_ }
    : application_settings_response)

let make_associate_app_block_builder_app_block_request ~app_block_arn:(app_block_arn_ : arn)
    ~app_block_builder_name:(app_block_builder_name_ : name) () =
  ({ app_block_arn = app_block_arn_; app_block_builder_name = app_block_builder_name_ }
    : associate_app_block_builder_app_block_request)

let make_associate_application_fleet_request ~fleet_name:(fleet_name_ : name)
    ~application_arn:(application_arn_ : arn) () =
  ({ fleet_name = fleet_name_; application_arn = application_arn_ }
    : associate_application_fleet_request)

let make_associate_application_to_entitlement_request ~stack_name:(stack_name_ : name)
    ~entitlement_name:(entitlement_name_ : name)
    ~application_identifier:(application_identifier_ : string_) () =
  ({
     stack_name = stack_name_;
     entitlement_name = entitlement_name_;
     application_identifier = application_identifier_;
   }
    : associate_application_to_entitlement_request)

let make_associate_fleet_request ~fleet_name:(fleet_name_ : string_)
    ~stack_name:(stack_name_ : string_) () =
  ({ fleet_name = fleet_name_; stack_name = stack_name_ } : associate_fleet_request)

let make_associate_software_to_image_builder_request
    ~image_builder_name:(image_builder_name_ : name) ~software_names:(software_names_ : string_list)
    () =
  ({ image_builder_name = image_builder_name_; software_names = software_names_ }
    : associate_software_to_image_builder_request)

let make_user_stack_association
    ?send_email_notification:(send_email_notification_ : boolean_ option)
    ~stack_name:(stack_name_ : string_) ~user_name:(user_name_ : username)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({
     stack_name = stack_name_;
     user_name = user_name_;
     authentication_type = authentication_type_;
     send_email_notification = send_email_notification_;
   }
    : user_stack_association)

let make_user_stack_association_error
    ?user_stack_association:(user_stack_association_ : user_stack_association option)
    ?error_code:(error_code_ : user_stack_association_error_code option)
    ?error_message:(error_message_ : string_ option) () =
  ({
     user_stack_association = user_stack_association_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : user_stack_association_error)

let make_batch_associate_user_stack_request
    ~user_stack_associations:(user_stack_associations_ : user_stack_association_list) () =
  ({ user_stack_associations = user_stack_associations_ } : batch_associate_user_stack_request)

let make_batch_disassociate_user_stack_request
    ~user_stack_associations:(user_stack_associations_ : user_stack_association_list) () =
  ({ user_stack_associations = user_stack_associations_ } : batch_disassociate_user_stack_request)

let make_certificate_based_auth_properties ?status:(status_ : certificate_based_auth_status option)
    ?certificate_authority_arn:(certificate_authority_arn_ : arn option) () =
  ({ status = status_; certificate_authority_arn = certificate_authority_arn_ }
    : certificate_based_auth_properties)

let make_compute_capacity ?desired_instances:(desired_instances_ : integer option)
    ?desired_sessions:(desired_sessions_ : integer option) () =
  ({ desired_instances = desired_instances_; desired_sessions = desired_sessions_ }
    : compute_capacity)

let make_compute_capacity_status ?running:(running_ : integer option)
    ?in_use:(in_use_ : integer option) ?available:(available_ : integer option)
    ?desired_user_sessions:(desired_user_sessions_ : integer option)
    ?available_user_sessions:(available_user_sessions_ : integer option)
    ?active_user_sessions:(active_user_sessions_ : integer option)
    ?actual_user_sessions:(actual_user_sessions_ : integer option)
    ?draining:(draining_ : integer option)
    ?drain_mode_active_user_sessions:(drain_mode_active_user_sessions_ : integer option)
    ?drain_mode_unused_user_sessions:(drain_mode_unused_user_sessions_ : integer option)
    ~desired:(desired_ : integer) () =
  ({
     desired = desired_;
     running = running_;
     in_use = in_use_;
     available = available_;
     desired_user_sessions = desired_user_sessions_;
     available_user_sessions = available_user_sessions_;
     active_user_sessions = active_user_sessions_;
     actual_user_sessions = actual_user_sessions_;
     draining = draining_;
     drain_mode_active_user_sessions = drain_mode_active_user_sessions_;
     drain_mode_unused_user_sessions = drain_mode_unused_user_sessions_;
   }
    : compute_capacity_status)

let make_url_redirection_config ?allowed_urls:(allowed_urls_ : url_pattern_list option)
    ?denied_urls:(denied_urls_ : url_pattern_list option) ~enabled:(enabled_ : boolean_object) () =
  ({ enabled = enabled_; allowed_urls = allowed_urls_; denied_urls = denied_urls_ }
    : url_redirection_config)

let make_content_redirection ?host_to_client:(host_to_client_ : url_redirection_config option) () =
  ({ host_to_client = host_to_client_ } : content_redirection)

let make_copy_image_response ?destination_image_name:(destination_image_name_ : name option) () =
  ({ destination_image_name = destination_image_name_ } : copy_image_response)

let make_copy_image_request
    ?destination_image_description:(destination_image_description_ : description option)
    ~source_image_name:(source_image_name_ : name)
    ~destination_image_name:(destination_image_name_ : name)
    ~destination_region:(destination_region_ : region_name) () =
  ({
     source_image_name = source_image_name_;
     destination_image_name = destination_image_name_;
     destination_region = destination_region_;
     destination_image_description = destination_image_description_;
   }
    : copy_image_request)

let make_create_app_block_request ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option)
    ?setup_script_details:(setup_script_details_ : script_details option)
    ?tags:(tags_ : tags option)
    ?post_setup_script_details:(post_setup_script_details_ : script_details option)
    ?packaging_type:(packaging_type_ : packaging_type option) ~name:(name_ : name)
    ~source_s3_location:(source_s3_location_ : s3_location) () =
  ({
     name = name_;
     description = description_;
     display_name = display_name_;
     source_s3_location = source_s3_location_;
     setup_script_details = setup_script_details_;
     tags = tags_;
     post_setup_script_details = post_setup_script_details_;
     packaging_type = packaging_type_;
   }
    : create_app_block_request)

let make_create_app_block_builder_request ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option) ?tags:(tags_ : tags option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option) ~name:(name_ : name)
    ~platform:(platform_ : app_block_builder_platform_type)
    ~instance_type:(instance_type_ : string_) ~vpc_config:(vpc_config_ : vpc_config) () =
  ({
     name = name_;
     description = description_;
     display_name = display_name_;
     tags = tags_;
     platform = platform_;
     instance_type = instance_type_;
     vpc_config = vpc_config_;
     enable_default_internet_access = enable_default_internet_access_;
     iam_role_arn = iam_role_arn_;
     access_endpoints = access_endpoints_;
     disable_imds_v1 = disable_imds_v1_;
   }
    : create_app_block_builder_request)

let make_create_app_block_builder_streaming_url_request ?validity:(validity_ : long option)
    ~app_block_builder_name:(app_block_builder_name_ : name) () =
  ({ app_block_builder_name = app_block_builder_name_; validity = validity_ }
    : create_app_block_builder_streaming_url_request)

let make_create_application_request ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?working_directory:(working_directory_ : string_ option)
    ?launch_parameters:(launch_parameters_ : string_ option) ?tags:(tags_ : tags option)
    ~name:(name_ : name) ~icon_s3_location:(icon_s3_location_ : s3_location)
    ~launch_path:(launch_path_ : string_) ~platforms:(platforms_ : platforms)
    ~instance_families:(instance_families_ : string_list) ~app_block_arn:(app_block_arn_ : arn) () =
  ({
     name = name_;
     display_name = display_name_;
     description = description_;
     icon_s3_location = icon_s3_location_;
     launch_path = launch_path_;
     working_directory = working_directory_;
     launch_parameters = launch_parameters_;
     platforms = platforms_;
     instance_families = instance_families_;
     app_block_arn = app_block_arn_;
     tags = tags_;
   }
    : create_application_request)

let make_service_account_credentials ~account_name:(account_name_ : account_name)
    ~account_password:(account_password_ : account_password) () =
  ({ account_name = account_name_; account_password = account_password_ }
    : service_account_credentials)

let make_directory_config
    ?organizational_unit_distinguished_names:
      (organizational_unit_distinguished_names_ :
         organizational_unit_distinguished_names_list option)
    ?service_account_credentials:(service_account_credentials_ : service_account_credentials option)
    ?created_time:(created_time_ : timestamp option)
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ~directory_name:(directory_name_ : directory_name) () =
  ({
     directory_name = directory_name_;
     organizational_unit_distinguished_names = organizational_unit_distinguished_names_;
     service_account_credentials = service_account_credentials_;
     created_time = created_time_;
     certificate_based_auth_properties = certificate_based_auth_properties_;
   }
    : directory_config)

let make_create_directory_config_request
    ?service_account_credentials:(service_account_credentials_ : service_account_credentials option)
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ~directory_name:(directory_name_ : directory_name)
    ~organizational_unit_distinguished_names:
      (organizational_unit_distinguished_names_ : organizational_unit_distinguished_names_list) () =
  ({
     directory_name = directory_name_;
     organizational_unit_distinguished_names = organizational_unit_distinguished_names_;
     service_account_credentials = service_account_credentials_;
     certificate_based_auth_properties = certificate_based_auth_properties_;
   }
    : create_directory_config_request)

let make_entitlement_attribute ~name:(name_ : string_) ~value:(value_ : string_) () =
  ({ name = name_; value = value_ } : entitlement_attribute)

let make_entitlement ?description:(description_ : description option)
    ?created_time:(created_time_ : timestamp option)
    ?last_modified_time:(last_modified_time_ : timestamp option) ~name:(name_ : name)
    ~stack_name:(stack_name_ : name) ~app_visibility:(app_visibility_ : app_visibility)
    ~attributes:(attributes_ : entitlement_attribute_list) () =
  ({
     name = name_;
     stack_name = stack_name_;
     description = description_;
     app_visibility = app_visibility_;
     attributes = attributes_;
     created_time = created_time_;
     last_modified_time = last_modified_time_;
   }
    : entitlement)

let make_create_entitlement_request ?description:(description_ : description option)
    ~name:(name_ : name) ~stack_name:(stack_name_ : name)
    ~app_visibility:(app_visibility_ : app_visibility)
    ~attributes:(attributes_ : entitlement_attribute_list) () =
  ({
     name = name_;
     stack_name = stack_name_;
     description = description_;
     app_visibility = app_visibility_;
     attributes = attributes_;
   }
    : create_entitlement_request)

let make_export_image_task ?ami_description:(ami_description_ : description option)
    ?state:(state_ : export_image_task_state option) ?ami_id:(ami_id_ : photon_ami_id option)
    ?tag_specifications:(tag_specifications_ : tags option)
    ?error_details:(error_details_ : error_details_list option) ~task_id:(task_id_ : uui_d)
    ~image_arn:(image_arn_ : arn) ~ami_name:(ami_name_ : ami_name)
    ~created_date:(created_date_ : timestamp) () =
  ({
     task_id = task_id_;
     image_arn = image_arn_;
     ami_name = ami_name_;
     created_date = created_date_;
     ami_description = ami_description_;
     state = state_;
     ami_id = ami_id_;
     tag_specifications = tag_specifications_;
     error_details = error_details_;
   }
    : export_image_task)

let make_create_export_image_task_request ?tag_specifications:(tag_specifications_ : tags option)
    ?ami_description:(ami_description_ : description option) ~image_name:(image_name_ : name)
    ~ami_name:(ami_name_ : ami_name) ~iam_role_arn:(iam_role_arn_ : arn) () =
  ({
     image_name = image_name_;
     ami_name = ami_name_;
     iam_role_arn = iam_role_arn_;
     tag_specifications = tag_specifications_;
     ami_description = ami_description_;
   }
    : create_export_image_task_request)

let make_volume_config ?volume_size_in_gb:(volume_size_in_gb_ : integer option) () =
  ({ volume_size_in_gb = volume_size_in_gb_ } : volume_config)

let make_domain_join_info ?directory_name:(directory_name_ : directory_name option)
    ?organizational_unit_distinguished_name:
      (organizational_unit_distinguished_name_ : organizational_unit_distinguished_name option) () =
  ({
     directory_name = directory_name_;
     organizational_unit_distinguished_name = organizational_unit_distinguished_name_;
   }
    : domain_join_info)

let make_fleet_error ?error_code:(error_code_ : fleet_error_code option)
    ?error_message:(error_message_ : string_ option) () =
  ({ error_code = error_code_; error_message = error_message_ } : fleet_error)

let make_fleet ?display_name:(display_name_ : string_ option)
    ?description:(description_ : string_ option) ?image_name:(image_name_ : string_ option)
    ?image_arn:(image_arn_ : arn option) ?fleet_type:(fleet_type_ : fleet_type option)
    ?max_user_duration_in_seconds:(max_user_duration_in_seconds_ : integer option)
    ?disconnect_timeout_in_seconds:(disconnect_timeout_in_seconds_ : integer option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?created_time:(created_time_ : timestamp option)
    ?fleet_errors:(fleet_errors_ : fleet_errors option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?idle_disconnect_timeout_in_seconds:(idle_disconnect_timeout_in_seconds_ : integer option)
    ?iam_role_arn:(iam_role_arn_ : arn option) ?stream_view:(stream_view_ : stream_view option)
    ?platform:(platform_ : platform_type option)
    ?max_concurrent_sessions:(max_concurrent_sessions_ : integer option)
    ?usb_device_filter_strings:(usb_device_filter_strings_ : usb_device_filter_strings option)
    ?session_script_s3_location:(session_script_s3_location_ : s3_location option)
    ?max_sessions_per_instance:(max_sessions_per_instance_ : integer option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option) ~arn:(arn_ : arn)
    ~name:(name_ : string_) ~instance_type:(instance_type_ : string_)
    ~compute_capacity_status:(compute_capacity_status_ : compute_capacity_status)
    ~state:(state_ : fleet_state) () =
  ({
     arn = arn_;
     name = name_;
     display_name = display_name_;
     description = description_;
     image_name = image_name_;
     image_arn = image_arn_;
     instance_type = instance_type_;
     fleet_type = fleet_type_;
     compute_capacity_status = compute_capacity_status_;
     max_user_duration_in_seconds = max_user_duration_in_seconds_;
     disconnect_timeout_in_seconds = disconnect_timeout_in_seconds_;
     state = state_;
     vpc_config = vpc_config_;
     created_time = created_time_;
     fleet_errors = fleet_errors_;
     enable_default_internet_access = enable_default_internet_access_;
     domain_join_info = domain_join_info_;
     idle_disconnect_timeout_in_seconds = idle_disconnect_timeout_in_seconds_;
     iam_role_arn = iam_role_arn_;
     stream_view = stream_view_;
     platform = platform_;
     max_concurrent_sessions = max_concurrent_sessions_;
     usb_device_filter_strings = usb_device_filter_strings_;
     session_script_s3_location = session_script_s3_location_;
     max_sessions_per_instance = max_sessions_per_instance_;
     root_volume_config = root_volume_config_;
     disable_imds_v1 = disable_imds_v1_;
   }
    : fleet)

let make_create_fleet_request ?image_name:(image_name_ : name option)
    ?image_arn:(image_arn_ : arn option) ?fleet_type:(fleet_type_ : fleet_type option)
    ?compute_capacity:(compute_capacity_ : compute_capacity option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?max_user_duration_in_seconds:(max_user_duration_in_seconds_ : integer option)
    ?disconnect_timeout_in_seconds:(disconnect_timeout_in_seconds_ : integer option)
    ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option) ?tags:(tags_ : tags option)
    ?idle_disconnect_timeout_in_seconds:(idle_disconnect_timeout_in_seconds_ : integer option)
    ?iam_role_arn:(iam_role_arn_ : arn option) ?stream_view:(stream_view_ : stream_view option)
    ?platform:(platform_ : platform_type option)
    ?max_concurrent_sessions:(max_concurrent_sessions_ : integer option)
    ?usb_device_filter_strings:(usb_device_filter_strings_ : usb_device_filter_strings option)
    ?session_script_s3_location:(session_script_s3_location_ : s3_location option)
    ?max_sessions_per_instance:(max_sessions_per_instance_ : integer option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option) ~name:(name_ : name)
    ~instance_type:(instance_type_ : string_) () =
  ({
     name = name_;
     image_name = image_name_;
     image_arn = image_arn_;
     instance_type = instance_type_;
     fleet_type = fleet_type_;
     compute_capacity = compute_capacity_;
     vpc_config = vpc_config_;
     max_user_duration_in_seconds = max_user_duration_in_seconds_;
     disconnect_timeout_in_seconds = disconnect_timeout_in_seconds_;
     description = description_;
     display_name = display_name_;
     enable_default_internet_access = enable_default_internet_access_;
     domain_join_info = domain_join_info_;
     tags = tags_;
     idle_disconnect_timeout_in_seconds = idle_disconnect_timeout_in_seconds_;
     iam_role_arn = iam_role_arn_;
     stream_view = stream_view_;
     platform = platform_;
     max_concurrent_sessions = max_concurrent_sessions_;
     usb_device_filter_strings = usb_device_filter_strings_;
     session_script_s3_location = session_script_s3_location_;
     max_sessions_per_instance = max_sessions_per_instance_;
     root_volume_config = root_volume_config_;
     disable_imds_v1 = disable_imds_v1_;
   }
    : create_fleet_request)

let make_network_access_configuration
    ?eni_private_ip_address:(eni_private_ip_address_ : string_ option)
    ?eni_ipv6_addresses:(eni_ipv6_addresses_ : string_list option)
    ?eni_id:(eni_id_ : string_ option) () =
  ({
     eni_private_ip_address = eni_private_ip_address_;
     eni_ipv6_addresses = eni_ipv6_addresses_;
     eni_id = eni_id_;
   }
    : network_access_configuration)

let make_image_builder_state_change_reason
    ?code:(code_ : image_builder_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : image_builder_state_change_reason)

let make_image_builder ?arn:(arn_ : arn option) ?image_arn:(image_arn_ : arn option)
    ?description:(description_ : string_ option) ?display_name:(display_name_ : string_ option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?instance_type:(instance_type_ : string_ option)
    ?platform:(platform_ : platform_type option) ?iam_role_arn:(iam_role_arn_ : arn option)
    ?state:(state_ : image_builder_state option)
    ?state_change_reason:(state_change_reason_ : image_builder_state_change_reason option)
    ?created_time:(created_time_ : timestamp option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?network_access_configuration:
      (network_access_configuration_ : network_access_configuration option)
    ?image_builder_errors:(image_builder_errors_ : resource_errors option)
    ?appstream_agent_version:(appstream_agent_version_ : appstream_agent_version option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?latest_appstream_agent_version:
      (latest_appstream_agent_version_ : latest_appstream_agent_version option)
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option) ~name:(name_ : string_) () =
  ({
     name = name_;
     arn = arn_;
     image_arn = image_arn_;
     description = description_;
     display_name = display_name_;
     vpc_config = vpc_config_;
     instance_type = instance_type_;
     platform = platform_;
     iam_role_arn = iam_role_arn_;
     state = state_;
     state_change_reason = state_change_reason_;
     created_time = created_time_;
     enable_default_internet_access = enable_default_internet_access_;
     domain_join_info = domain_join_info_;
     network_access_configuration = network_access_configuration_;
     image_builder_errors = image_builder_errors_;
     appstream_agent_version = appstream_agent_version_;
     access_endpoints = access_endpoints_;
     root_volume_config = root_volume_config_;
     latest_appstream_agent_version = latest_appstream_agent_version_;
     disable_imds_v1 = disable_imds_v1_;
   }
    : image_builder)

let make_create_image_builder_request ?image_name:(image_name_ : string_ option)
    ?image_arn:(image_arn_ : arn option) ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option)
    ?vpc_config:(vpc_config_ : vpc_config option) ?iam_role_arn:(iam_role_arn_ : arn option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?appstream_agent_version:(appstream_agent_version_ : appstream_agent_version option)
    ?tags:(tags_ : tags option) ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?softwares_to_install:(softwares_to_install_ : string_list option)
    ?softwares_to_uninstall:(softwares_to_uninstall_ : string_list option)
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option) ~name:(name_ : name)
    ~instance_type:(instance_type_ : string_) () =
  ({
     name = name_;
     image_name = image_name_;
     image_arn = image_arn_;
     instance_type = instance_type_;
     description = description_;
     display_name = display_name_;
     vpc_config = vpc_config_;
     iam_role_arn = iam_role_arn_;
     enable_default_internet_access = enable_default_internet_access_;
     domain_join_info = domain_join_info_;
     appstream_agent_version = appstream_agent_version_;
     tags = tags_;
     access_endpoints = access_endpoints_;
     root_volume_config = root_volume_config_;
     softwares_to_install = softwares_to_install_;
     softwares_to_uninstall = softwares_to_uninstall_;
     disable_imds_v1 = disable_imds_v1_;
   }
    : create_image_builder_request)

let make_create_image_builder_streaming_url_request ?validity:(validity_ : long option)
    ~name:(name_ : string_) () =
  ({ name = name_; validity = validity_ } : create_image_builder_streaming_url_request)

let make_image_permissions ?allow_fleet:(allow_fleet_ : boolean_object option)
    ?allow_image_builder:(allow_image_builder_ : boolean_object option) () =
  ({ allow_fleet = allow_fleet_; allow_image_builder = allow_image_builder_ } : image_permissions)

let make_image_state_change_reason ?code:(code_ : image_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : image_state_change_reason)

let make_image ?arn:(arn_ : arn option) ?base_image_arn:(base_image_arn_ : arn option)
    ?display_name:(display_name_ : string_ option) ?state:(state_ : image_state option)
    ?visibility:(visibility_ : visibility_type option)
    ?image_builder_supported:(image_builder_supported_ : boolean_ option)
    ?image_builder_name:(image_builder_name_ : string_ option)
    ?platform:(platform_ : platform_type option) ?description:(description_ : string_ option)
    ?state_change_reason:(state_change_reason_ : image_state_change_reason option)
    ?applications:(applications_ : applications option)
    ?created_time:(created_time_ : timestamp option)
    ?public_base_image_released_date:(public_base_image_released_date_ : timestamp option)
    ?appstream_agent_version:(appstream_agent_version_ : appstream_agent_version option)
    ?image_permissions:(image_permissions_ : image_permissions option)
    ?image_errors:(image_errors_ : resource_errors option)
    ?latest_appstream_agent_version:
      (latest_appstream_agent_version_ : latest_appstream_agent_version option)
    ?supported_instance_families:(supported_instance_families_ : string_list option)
    ?dynamic_app_providers_enabled:
      (dynamic_app_providers_enabled_ : dynamic_app_providers_enabled option)
    ?image_shared_with_others:(image_shared_with_others_ : image_shared_with_others option)
    ?managed_software_included:(managed_software_included_ : boolean_ option)
    ?image_type:(image_type_ : image_type option) ~name:(name_ : string_) () =
  ({
     name = name_;
     arn = arn_;
     base_image_arn = base_image_arn_;
     display_name = display_name_;
     state = state_;
     visibility = visibility_;
     image_builder_supported = image_builder_supported_;
     image_builder_name = image_builder_name_;
     platform = platform_;
     description = description_;
     state_change_reason = state_change_reason_;
     applications = applications_;
     created_time = created_time_;
     public_base_image_released_date = public_base_image_released_date_;
     appstream_agent_version = appstream_agent_version_;
     image_permissions = image_permissions_;
     image_errors = image_errors_;
     latest_appstream_agent_version = latest_appstream_agent_version_;
     supported_instance_families = supported_instance_families_;
     dynamic_app_providers_enabled = dynamic_app_providers_enabled_;
     image_shared_with_others = image_shared_with_others_;
     managed_software_included = managed_software_included_;
     image_type = image_type_;
   }
    : image)

let make_runtime_validation_config
    ?intended_instance_type:(intended_instance_type_ : instance_type option) () =
  ({ intended_instance_type = intended_instance_type_ } : runtime_validation_config)

let make_create_imported_image_request ?source_ami_id:(source_ami_id_ : photon_ami_id option)
    ?workspace_image_id:(workspace_image_id_ : workspace_image_id option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?description:(description_ : image_import_description option)
    ?display_name:(display_name_ : image_import_display_name option) ?tags:(tags_ : tags option)
    ?runtime_validation_config:(runtime_validation_config_ : runtime_validation_config option)
    ?agent_software_version:(agent_software_version_ : agent_software_version option)
    ?app_catalog_config:(app_catalog_config_ : app_catalog_config option)
    ?dry_run:(dry_run_ : boolean_ option) ~name:(name_ : name) () =
  ({
     name = name_;
     source_ami_id = source_ami_id_;
     workspace_image_id = workspace_image_id_;
     iam_role_arn = iam_role_arn_;
     description = description_;
     display_name = display_name_;
     tags = tags_;
     runtime_validation_config = runtime_validation_config_;
     agent_software_version = agent_software_version_;
     app_catalog_config = app_catalog_config_;
     dry_run = dry_run_;
   }
    : create_imported_image_request)

let make_streaming_experience_settings
    ?preferred_protocol:(preferred_protocol_ : preferred_protocol option) () =
  ({ preferred_protocol = preferred_protocol_ } : streaming_experience_settings)

let make_user_setting ?maximum_length:(maximum_length_ : integer option) ~action:(action_ : action)
    ~permission:(permission_ : permission) () =
  ({ action = action_; permission = permission_; maximum_length = maximum_length_ } : user_setting)

let make_stack_error ?error_code:(error_code_ : stack_error_code option)
    ?error_message:(error_message_ : string_ option) () =
  ({ error_code = error_code_; error_message = error_message_ } : stack_error)

let make_storage_connector ?resource_identifier:(resource_identifier_ : resource_identifier option)
    ?domains:(domains_ : domain_list option)
    ?domains_require_admin_consent:(domains_require_admin_consent_ : domain_list option)
    ~connector_type:(connector_type_ : storage_connector_type) () =
  ({
     connector_type = connector_type_;
     resource_identifier = resource_identifier_;
     domains = domains_;
     domains_require_admin_consent = domains_require_admin_consent_;
   }
    : storage_connector)

let make_stack ?arn:(arn_ : arn option) ?description:(description_ : string_ option)
    ?display_name:(display_name_ : string_ option) ?created_time:(created_time_ : timestamp option)
    ?storage_connectors:(storage_connectors_ : storage_connector_list option)
    ?redirect_ur_l:(redirect_ur_l_ : redirect_ur_l option)
    ?feedback_ur_l:(feedback_ur_l_ : feedback_ur_l option)
    ?stack_errors:(stack_errors_ : stack_errors option)
    ?user_settings:(user_settings_ : user_setting_list option)
    ?application_settings:(application_settings_ : application_settings_response option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?embed_host_domains:(embed_host_domains_ : embed_host_domains option)
    ?streaming_experience_settings:
      (streaming_experience_settings_ : streaming_experience_settings option)
    ?content_redirection:(content_redirection_ : content_redirection option)
    ?agent_access_config:(agent_access_config_ : agent_access_config option) ~name:(name_ : string_)
    () =
  ({
     arn = arn_;
     name = name_;
     description = description_;
     display_name = display_name_;
     created_time = created_time_;
     storage_connectors = storage_connectors_;
     redirect_ur_l = redirect_ur_l_;
     feedback_ur_l = feedback_ur_l_;
     stack_errors = stack_errors_;
     user_settings = user_settings_;
     application_settings = application_settings_;
     access_endpoints = access_endpoints_;
     embed_host_domains = embed_host_domains_;
     streaming_experience_settings = streaming_experience_settings_;
     content_redirection = content_redirection_;
     agent_access_config = agent_access_config_;
   }
    : stack)

let make_create_stack_request ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option)
    ?storage_connectors:(storage_connectors_ : storage_connector_list option)
    ?redirect_ur_l:(redirect_ur_l_ : redirect_ur_l option)
    ?feedback_ur_l:(feedback_ur_l_ : feedback_ur_l option)
    ?user_settings:(user_settings_ : user_setting_list option)
    ?application_settings:(application_settings_ : application_settings option)
    ?tags:(tags_ : tags option) ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?embed_host_domains:(embed_host_domains_ : embed_host_domains option)
    ?streaming_experience_settings:
      (streaming_experience_settings_ : streaming_experience_settings option)
    ?content_redirection:(content_redirection_ : content_redirection option)
    ?agent_access_config:(agent_access_config_ : agent_access_config option) ~name:(name_ : name) ()
    =
  ({
     name = name_;
     description = description_;
     display_name = display_name_;
     storage_connectors = storage_connectors_;
     redirect_ur_l = redirect_ur_l_;
     feedback_ur_l = feedback_ur_l_;
     user_settings = user_settings_;
     application_settings = application_settings_;
     tags = tags_;
     access_endpoints = access_endpoints_;
     embed_host_domains = embed_host_domains_;
     streaming_experience_settings = streaming_experience_settings_;
     content_redirection = content_redirection_;
     agent_access_config = agent_access_config_;
   }
    : create_stack_request)

let make_create_streaming_url_request ?application_id:(application_id_ : string_ option)
    ?validity:(validity_ : long option) ?session_context:(session_context_ : string_ option)
    ~stack_name:(stack_name_ : string_) ~fleet_name:(fleet_name_ : string_)
    ~user_id:(user_id_ : streaming_url_user_id) () =
  ({
     stack_name = stack_name_;
     fleet_name = fleet_name_;
     user_id = user_id_;
     application_id = application_id_;
     validity = validity_;
     session_context = session_context_;
   }
    : create_streaming_url_request)

let make_theme_footer_link ?display_name:(display_name_ : theme_footer_link_display_name option)
    ?footer_link_ur_l:(footer_link_ur_l_ : theme_footer_link_ur_l option) () =
  ({ display_name = display_name_; footer_link_ur_l = footer_link_ur_l_ } : theme_footer_link)

let make_theme ?stack_name:(stack_name_ : name option) ?state:(state_ : theme_state option)
    ?theme_title_text:(theme_title_text_ : theme_title_text option)
    ?theme_styling:(theme_styling_ : theme_styling option)
    ?theme_footer_links:(theme_footer_links_ : theme_footer_links option)
    ?theme_organization_logo_ur_l:(theme_organization_logo_ur_l_ : string_ option)
    ?theme_favicon_ur_l:(theme_favicon_ur_l_ : string_ option)
    ?created_time:(created_time_ : timestamp option) () =
  ({
     stack_name = stack_name_;
     state = state_;
     theme_title_text = theme_title_text_;
     theme_styling = theme_styling_;
     theme_footer_links = theme_footer_links_;
     theme_organization_logo_ur_l = theme_organization_logo_ur_l_;
     theme_favicon_ur_l = theme_favicon_ur_l_;
     created_time = created_time_;
   }
    : theme)

let make_create_theme_for_stack_request ?footer_links:(footer_links_ : theme_footer_links option)
    ~stack_name:(stack_name_ : name) ~title_text:(title_text_ : theme_title_text)
    ~theme_styling:(theme_styling_ : theme_styling)
    ~organization_logo_s3_location:(organization_logo_s3_location_ : s3_location)
    ~favicon_s3_location:(favicon_s3_location_ : s3_location) () =
  ({
     stack_name = stack_name_;
     footer_links = footer_links_;
     title_text = title_text_;
     theme_styling = theme_styling_;
     organization_logo_s3_location = organization_logo_s3_location_;
     favicon_s3_location = favicon_s3_location_;
   }
    : create_theme_for_stack_request)

let make_create_updated_image_request
    ?new_image_description:(new_image_description_ : description option)
    ?new_image_display_name:(new_image_display_name_ : display_name option)
    ?new_image_tags:(new_image_tags_ : tags option) ?dry_run:(dry_run_ : boolean_ option)
    ~existing_image_name:(existing_image_name_ : name) ~new_image_name:(new_image_name_ : name) () =
  ({
     existing_image_name = existing_image_name_;
     new_image_name = new_image_name_;
     new_image_description = new_image_description_;
     new_image_display_name = new_image_display_name_;
     new_image_tags = new_image_tags_;
     dry_run = dry_run_;
   }
    : create_updated_image_request)

let make_create_usage_report_subscription_request () = (() : unit)

let make_create_user_request ?message_action:(message_action_ : message_action option)
    ?first_name:(first_name_ : user_attribute_value option)
    ?last_name:(last_name_ : user_attribute_value option) ~user_name:(user_name_ : username)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({
     user_name = user_name_;
     message_action = message_action_;
     first_name = first_name_;
     last_name = last_name_;
     authentication_type = authentication_type_;
   }
    : create_user_request)

let make_delete_app_block_request ~name:(name_ : name) () =
  ({ name = name_ } : delete_app_block_request)

let make_delete_app_block_builder_request ~name:(name_ : name) () =
  ({ name = name_ } : delete_app_block_builder_request)

let make_delete_application_request ~name:(name_ : name) () =
  ({ name = name_ } : delete_application_request)

let make_delete_directory_config_request ~directory_name:(directory_name_ : directory_name) () =
  ({ directory_name = directory_name_ } : delete_directory_config_request)

let make_delete_entitlement_request ~name:(name_ : name) ~stack_name:(stack_name_ : name) () =
  ({ name = name_; stack_name = stack_name_ } : delete_entitlement_request)

let make_delete_fleet_request ~name:(name_ : string_) () = ({ name = name_ } : delete_fleet_request)
let make_delete_image_request ~name:(name_ : name) () = ({ name = name_ } : delete_image_request)

let make_delete_image_builder_request ~name:(name_ : name) () =
  ({ name = name_ } : delete_image_builder_request)

let make_delete_image_permissions_request ~name:(name_ : name)
    ~shared_account_id:(shared_account_id_ : aws_account_id) () =
  ({ name = name_; shared_account_id = shared_account_id_ } : delete_image_permissions_request)

let make_delete_stack_request ~name:(name_ : string_) () = ({ name = name_ } : delete_stack_request)

let make_delete_theme_for_stack_request ~stack_name:(stack_name_ : name) () =
  ({ stack_name = stack_name_ } : delete_theme_for_stack_request)

let make_delete_usage_report_subscription_request () = (() : unit)

let make_delete_user_request ~user_name:(user_name_ : username)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({ user_name = user_name_; authentication_type = authentication_type_ } : delete_user_request)

let make_describe_app_block_builder_app_block_associations_request
    ?app_block_arn:(app_block_arn_ : arn option)
    ?app_block_builder_name:(app_block_builder_name_ : name option)
    ?max_results:(max_results_ : integer option) ?next_token:(next_token_ : string_ option) () =
  ({
     app_block_arn = app_block_arn_;
     app_block_builder_name = app_block_builder_name_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_app_block_builder_app_block_associations_request)

let make_describe_app_block_builders_request ?names:(names_ : string_list option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer option) () =
  ({ names = names_; next_token = next_token_; max_results = max_results_ }
    : describe_app_block_builders_request)

let make_describe_app_blocks_request ?arns:(arns_ : arn_list option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer option) () =
  ({ arns = arns_; next_token = next_token_; max_results = max_results_ }
    : describe_app_blocks_request)

let make_describe_app_license_usage_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) ~billing_period:(billing_period_ : string_) () =
  ({ billing_period = billing_period_; max_results = max_results_; next_token = next_token_ }
    : describe_app_license_usage_request)

let make_describe_application_fleet_associations_request ?fleet_name:(fleet_name_ : name option)
    ?application_arn:(application_arn_ : arn option) ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) () =
  ({
     fleet_name = fleet_name_;
     application_arn = application_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_application_fleet_associations_request)

let make_describe_applications_request ?arns:(arns_ : arn_list option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer option) () =
  ({ arns = arns_; next_token = next_token_; max_results = max_results_ }
    : describe_applications_request)

let make_describe_directory_configs_request
    ?directory_names:(directory_names_ : directory_name_list option)
    ?max_results:(max_results_ : integer option) ?next_token:(next_token_ : string_ option) () =
  ({ directory_names = directory_names_; max_results = max_results_; next_token = next_token_ }
    : describe_directory_configs_request)

let make_describe_entitlements_request ?name:(name_ : name option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer option)
    ~stack_name:(stack_name_ : name) () =
  ({ name = name_; stack_name = stack_name_; next_token = next_token_; max_results = max_results_ }
    : describe_entitlements_request)

let make_describe_fleets_request ?names:(names_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ names = names_; next_token = next_token_ } : describe_fleets_request)

let make_describe_image_builders_request ?names:(names_ : string_list option)
    ?max_results:(max_results_ : integer option) ?next_token:(next_token_ : string_ option) () =
  ({ names = names_; max_results = max_results_; next_token = next_token_ }
    : describe_image_builders_request)

let make_shared_image_permissions ~shared_account_id:(shared_account_id_ : aws_account_id)
    ~image_permissions:(image_permissions_ : image_permissions) () =
  ({ shared_account_id = shared_account_id_; image_permissions = image_permissions_ }
    : shared_image_permissions)

let make_describe_image_permissions_request ?max_results:(max_results_ : max_results option)
    ?shared_aws_account_ids:(shared_aws_account_ids_ : aws_account_id_list option)
    ?next_token:(next_token_ : string_ option) ~name:(name_ : name) () =
  ({
     name = name_;
     max_results = max_results_;
     shared_aws_account_ids = shared_aws_account_ids_;
     next_token = next_token_;
   }
    : describe_image_permissions_request)

let make_describe_images_request ?names:(names_ : string_list option)
    ?arns:(arns_ : arn_list option) ?type_:(type__ : visibility_type option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : describe_images_max_results option) () =
  ({
     names = names_;
     arns = arns_;
     type_ = type__;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_images_request)

let make_session ?connection_state:(connection_state_ : session_connection_state option)
    ?start_time:(start_time_ : timestamp option)
    ?max_expiration_time:(max_expiration_time_ : timestamp option)
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?network_access_configuration:
      (network_access_configuration_ : network_access_configuration option)
    ?instance_id:(instance_id_ : string_ option)
    ?instance_drain_status:(instance_drain_status_ : instance_drain_status option)
    ~id:(id_ : string_) ~user_id:(user_id_ : user_id) ~stack_name:(stack_name_ : string_)
    ~fleet_name:(fleet_name_ : string_) ~state:(state_ : session_state) () =
  ({
     id = id_;
     user_id = user_id_;
     stack_name = stack_name_;
     fleet_name = fleet_name_;
     state = state_;
     connection_state = connection_state_;
     start_time = start_time_;
     max_expiration_time = max_expiration_time_;
     authentication_type = authentication_type_;
     network_access_configuration = network_access_configuration_;
     instance_id = instance_id_;
     instance_drain_status = instance_drain_status_;
   }
    : session)

let make_describe_sessions_request ?user_id:(user_id_ : user_id option)
    ?next_token:(next_token_ : string_ option) ?limit:(limit_ : integer option)
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?instance_id:(instance_id_ : string_ option) ~stack_name:(stack_name_ : name)
    ~fleet_name:(fleet_name_ : name) () =
  ({
     stack_name = stack_name_;
     fleet_name = fleet_name_;
     user_id = user_id_;
     next_token = next_token_;
     limit = limit_;
     authentication_type = authentication_type_;
     instance_id = instance_id_;
   }
    : describe_sessions_request)

let make_software_associations ?software_name:(software_name_ : string_ option)
    ?status:(status_ : software_deployment_status option)
    ?deployment_error:(deployment_error_ : error_details_list option) () =
  ({ software_name = software_name_; status = status_; deployment_error = deployment_error_ }
    : software_associations)

let make_describe_software_associations_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) ~associated_resource:(associated_resource_ : arn) ()
    =
  ({
     associated_resource = associated_resource_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_software_associations_request)

let make_describe_stacks_request ?names:(names_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ names = names_; next_token = next_token_ } : describe_stacks_request)

let make_describe_theme_for_stack_request ~stack_name:(stack_name_ : name) () =
  ({ stack_name = stack_name_ } : describe_theme_for_stack_request)

let make_last_report_generation_execution_error
    ?error_code:(error_code_ : usage_report_execution_error_code option)
    ?error_message:(error_message_ : string_ option) () =
  ({ error_code = error_code_; error_message = error_message_ }
    : last_report_generation_execution_error)

let make_usage_report_subscription ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?schedule:(schedule_ : usage_report_schedule option)
    ?last_generated_report_date:(last_generated_report_date_ : timestamp option)
    ?subscription_errors:(subscription_errors_ : last_report_generation_execution_errors option) ()
    =
  ({
     s3_bucket_name = s3_bucket_name_;
     schedule = schedule_;
     last_generated_report_date = last_generated_report_date_;
     subscription_errors = subscription_errors_;
   }
    : usage_report_subscription)

let make_describe_usage_report_subscriptions_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ }
    : describe_usage_report_subscriptions_request)

let make_describe_user_stack_associations_request ?stack_name:(stack_name_ : string_ option)
    ?user_name:(user_name_ : username option)
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : string_ option) () =
  ({
     stack_name = stack_name_;
     user_name = user_name_;
     authentication_type = authentication_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_user_stack_associations_request)

let make_user ?arn:(arn_ : arn option) ?user_name:(user_name_ : username option)
    ?enabled:(enabled_ : boolean_ option) ?status:(status_ : string_ option)
    ?first_name:(first_name_ : user_attribute_value option)
    ?last_name:(last_name_ : user_attribute_value option)
    ?created_time:(created_time_ : timestamp option)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({
     arn = arn_;
     user_name = user_name_;
     enabled = enabled_;
     status = status_;
     first_name = first_name_;
     last_name = last_name_;
     created_time = created_time_;
     authentication_type = authentication_type_;
   }
    : user)

let make_describe_users_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({
     authentication_type = authentication_type_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_users_request)

let make_disable_user_request ~user_name:(user_name_ : username)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({ user_name = user_name_; authentication_type = authentication_type_ } : disable_user_request)

let make_disassociate_app_block_builder_app_block_request ~app_block_arn:(app_block_arn_ : arn)
    ~app_block_builder_name:(app_block_builder_name_ : name) () =
  ({ app_block_arn = app_block_arn_; app_block_builder_name = app_block_builder_name_ }
    : disassociate_app_block_builder_app_block_request)

let make_disassociate_application_fleet_request ~fleet_name:(fleet_name_ : name)
    ~application_arn:(application_arn_ : arn) () =
  ({ fleet_name = fleet_name_; application_arn = application_arn_ }
    : disassociate_application_fleet_request)

let make_disassociate_application_from_entitlement_request ~stack_name:(stack_name_ : name)
    ~entitlement_name:(entitlement_name_ : name)
    ~application_identifier:(application_identifier_ : string_) () =
  ({
     stack_name = stack_name_;
     entitlement_name = entitlement_name_;
     application_identifier = application_identifier_;
   }
    : disassociate_application_from_entitlement_request)

let make_disassociate_fleet_request ~fleet_name:(fleet_name_ : string_)
    ~stack_name:(stack_name_ : string_) () =
  ({ fleet_name = fleet_name_; stack_name = stack_name_ } : disassociate_fleet_request)

let make_disassociate_software_from_image_builder_request
    ~image_builder_name:(image_builder_name_ : name) ~software_names:(software_names_ : string_list)
    () =
  ({ image_builder_name = image_builder_name_; software_names = software_names_ }
    : disassociate_software_from_image_builder_request)

let make_drain_session_instance_request ~session_id:(session_id_ : string_) () =
  ({ session_id = session_id_ } : drain_session_instance_request)

let make_enable_user_request ~user_name:(user_name_ : username)
    ~authentication_type:(authentication_type_ : authentication_type) () =
  ({ user_name = user_name_; authentication_type = authentication_type_ } : enable_user_request)

let make_entitled_application ~application_identifier:(application_identifier_ : string_) () =
  ({ application_identifier = application_identifier_ } : entitled_application)

let make_expire_session_request ~session_id:(session_id_ : string_) () =
  ({ session_id = session_id_ } : expire_session_request)

let make_filter ~name:(name_ : filter_name) ~values:(values_ : filter_values) () =
  ({ name = name_; values = values_ } : filter)

let make_get_export_image_task_request ?task_id:(task_id_ : uui_d option) () =
  ({ task_id = task_id_ } : get_export_image_task_request)

let make_list_associated_fleets_request ?next_token:(next_token_ : string_ option)
    ~stack_name:(stack_name_ : string_) () =
  ({ stack_name = stack_name_; next_token = next_token_ } : list_associated_fleets_request)

let make_list_associated_stacks_request ?next_token:(next_token_ : string_ option)
    ~fleet_name:(fleet_name_ : string_) () =
  ({ fleet_name = fleet_name_; next_token = next_token_ } : list_associated_stacks_request)

let make_list_entitled_applications_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : integer option) ~stack_name:(stack_name_ : name)
    ~entitlement_name:(entitlement_name_ : name) () =
  ({
     stack_name = stack_name_;
     entitlement_name = entitlement_name_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_entitled_applications_request)

let make_list_export_image_tasks_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : string_ option) () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_export_image_tasks_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_update_theme_for_stack_request ?footer_links:(footer_links_ : theme_footer_links option)
    ?title_text:(title_text_ : theme_title_text option)
    ?theme_styling:(theme_styling_ : theme_styling option)
    ?organization_logo_s3_location:(organization_logo_s3_location_ : s3_location option)
    ?favicon_s3_location:(favicon_s3_location_ : s3_location option)
    ?state:(state_ : theme_state option)
    ?attributes_to_delete:(attributes_to_delete_ : theme_attributes option)
    ~stack_name:(stack_name_ : name) () =
  ({
     stack_name = stack_name_;
     footer_links = footer_links_;
     title_text = title_text_;
     theme_styling = theme_styling_;
     organization_logo_s3_location = organization_logo_s3_location_;
     favicon_s3_location = favicon_s3_location_;
     state = state_;
     attributes_to_delete = attributes_to_delete_;
   }
    : update_theme_for_stack_request)

let make_update_stack_request ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?storage_connectors:(storage_connectors_ : storage_connector_list option)
    ?delete_storage_connectors:(delete_storage_connectors_ : boolean_ option)
    ?redirect_ur_l:(redirect_ur_l_ : redirect_ur_l option)
    ?feedback_ur_l:(feedback_ur_l_ : feedback_ur_l option)
    ?attributes_to_delete:(attributes_to_delete_ : stack_attributes option)
    ?user_settings:(user_settings_ : user_setting_list option)
    ?application_settings:(application_settings_ : application_settings option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?embed_host_domains:(embed_host_domains_ : embed_host_domains option)
    ?streaming_experience_settings:
      (streaming_experience_settings_ : streaming_experience_settings option)
    ?content_redirection:(content_redirection_ : content_redirection option)
    ?agent_access_config:(agent_access_config_ : agent_access_config_for_update option)
    ~name:(name_ : string_) () =
  ({
     display_name = display_name_;
     description = description_;
     name = name_;
     storage_connectors = storage_connectors_;
     delete_storage_connectors = delete_storage_connectors_;
     redirect_ur_l = redirect_ur_l_;
     feedback_ur_l = feedback_ur_l_;
     attributes_to_delete = attributes_to_delete_;
     user_settings = user_settings_;
     application_settings = application_settings_;
     access_endpoints = access_endpoints_;
     embed_host_domains = embed_host_domains_;
     streaming_experience_settings = streaming_experience_settings_;
     content_redirection = content_redirection_;
     agent_access_config = agent_access_config_;
   }
    : update_stack_request)

let make_update_image_permissions_request ~name:(name_ : name)
    ~shared_account_id:(shared_account_id_ : aws_account_id)
    ~image_permissions:(image_permissions_ : image_permissions) () =
  ({ name = name_; shared_account_id = shared_account_id_; image_permissions = image_permissions_ }
    : update_image_permissions_request)

let make_update_fleet_request ?image_name:(image_name_ : string_ option)
    ?image_arn:(image_arn_ : arn option) ?name:(name_ : name option)
    ?instance_type:(instance_type_ : string_ option)
    ?compute_capacity:(compute_capacity_ : compute_capacity option)
    ?vpc_config:(vpc_config_ : vpc_config option)
    ?max_user_duration_in_seconds:(max_user_duration_in_seconds_ : integer option)
    ?disconnect_timeout_in_seconds:(disconnect_timeout_in_seconds_ : integer option)
    ?delete_vpc_config:(delete_vpc_config_ : boolean_ option)
    ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?domain_join_info:(domain_join_info_ : domain_join_info option)
    ?idle_disconnect_timeout_in_seconds:(idle_disconnect_timeout_in_seconds_ : integer option)
    ?attributes_to_delete:(attributes_to_delete_ : fleet_attributes option)
    ?iam_role_arn:(iam_role_arn_ : arn option) ?stream_view:(stream_view_ : stream_view option)
    ?platform:(platform_ : platform_type option)
    ?max_concurrent_sessions:(max_concurrent_sessions_ : integer option)
    ?usb_device_filter_strings:(usb_device_filter_strings_ : usb_device_filter_strings option)
    ?session_script_s3_location:(session_script_s3_location_ : s3_location option)
    ?max_sessions_per_instance:(max_sessions_per_instance_ : integer option)
    ?root_volume_config:(root_volume_config_ : volume_config option)
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option) () =
  ({
     image_name = image_name_;
     image_arn = image_arn_;
     name = name_;
     instance_type = instance_type_;
     compute_capacity = compute_capacity_;
     vpc_config = vpc_config_;
     max_user_duration_in_seconds = max_user_duration_in_seconds_;
     disconnect_timeout_in_seconds = disconnect_timeout_in_seconds_;
     delete_vpc_config = delete_vpc_config_;
     description = description_;
     display_name = display_name_;
     enable_default_internet_access = enable_default_internet_access_;
     domain_join_info = domain_join_info_;
     idle_disconnect_timeout_in_seconds = idle_disconnect_timeout_in_seconds_;
     attributes_to_delete = attributes_to_delete_;
     iam_role_arn = iam_role_arn_;
     stream_view = stream_view_;
     platform = platform_;
     max_concurrent_sessions = max_concurrent_sessions_;
     usb_device_filter_strings = usb_device_filter_strings_;
     session_script_s3_location = session_script_s3_location_;
     max_sessions_per_instance = max_sessions_per_instance_;
     root_volume_config = root_volume_config_;
     disable_imds_v1 = disable_imds_v1_;
   }
    : update_fleet_request)

let make_update_entitlement_request ?description:(description_ : description option)
    ?app_visibility:(app_visibility_ : app_visibility option)
    ?attributes:(attributes_ : entitlement_attribute_list option) ~name:(name_ : name)
    ~stack_name:(stack_name_ : name) () =
  ({
     name = name_;
     stack_name = stack_name_;
     description = description_;
     app_visibility = app_visibility_;
     attributes = attributes_;
   }
    : update_entitlement_request)

let make_update_directory_config_request
    ?organizational_unit_distinguished_names:
      (organizational_unit_distinguished_names_ :
         organizational_unit_distinguished_names_list option)
    ?service_account_credentials:(service_account_credentials_ : service_account_credentials option)
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ~directory_name:(directory_name_ : directory_name) () =
  ({
     directory_name = directory_name_;
     organizational_unit_distinguished_names = organizational_unit_distinguished_names_;
     service_account_credentials = service_account_credentials_;
     certificate_based_auth_properties = certificate_based_auth_properties_;
   }
    : update_directory_config_request)

let make_update_application_request ?display_name:(display_name_ : display_name option)
    ?description:(description_ : description option)
    ?icon_s3_location:(icon_s3_location_ : s3_location option)
    ?launch_path:(launch_path_ : string_ option)
    ?working_directory:(working_directory_ : string_ option)
    ?launch_parameters:(launch_parameters_ : string_ option)
    ?app_block_arn:(app_block_arn_ : arn option)
    ?attributes_to_delete:(attributes_to_delete_ : application_attributes option)
    ~name:(name_ : name) () =
  ({
     name = name_;
     display_name = display_name_;
     description = description_;
     icon_s3_location = icon_s3_location_;
     launch_path = launch_path_;
     working_directory = working_directory_;
     launch_parameters = launch_parameters_;
     app_block_arn = app_block_arn_;
     attributes_to_delete = attributes_to_delete_;
   }
    : update_application_request)

let make_update_app_block_builder_request ?description:(description_ : description option)
    ?display_name:(display_name_ : display_name option) ?platform:(platform_ : platform_type option)
    ?instance_type:(instance_type_ : string_ option) ?vpc_config:(vpc_config_ : vpc_config option)
    ?enable_default_internet_access:(enable_default_internet_access_ : boolean_object option)
    ?iam_role_arn:(iam_role_arn_ : arn option)
    ?access_endpoints:(access_endpoints_ : access_endpoint_list option)
    ?attributes_to_delete:(attributes_to_delete_ : app_block_builder_attributes option)
    ?disable_imds_v1:(disable_imds_v1_ : boolean_object option) ~name:(name_ : name) () =
  ({
     name = name_;
     description = description_;
     display_name = display_name_;
     platform = platform_;
     instance_type = instance_type_;
     vpc_config = vpc_config_;
     enable_default_internet_access = enable_default_internet_access_;
     iam_role_arn = iam_role_arn_;
     access_endpoints = access_endpoints_;
     attributes_to_delete = attributes_to_delete_;
     disable_imds_v1 = disable_imds_v1_;
   }
    : update_app_block_builder_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_stop_image_builder_request ~name:(name_ : string_) () =
  ({ name = name_ } : stop_image_builder_request)

let make_stop_fleet_request ~name:(name_ : string_) () = ({ name = name_ } : stop_fleet_request)

let make_stop_app_block_builder_request ~name:(name_ : name) () =
  ({ name = name_ } : stop_app_block_builder_request)

let make_start_software_deployment_to_image_builder_request
    ?retry_failed_deployments:(retry_failed_deployments_ : boolean_ option)
    ~image_builder_name:(image_builder_name_ : name) () =
  ({
     image_builder_name = image_builder_name_;
     retry_failed_deployments = retry_failed_deployments_;
   }
    : start_software_deployment_to_image_builder_request)

let make_start_image_builder_request
    ?appstream_agent_version:(appstream_agent_version_ : appstream_agent_version option)
    ~name:(name_ : string_) () =
  ({ name = name_; appstream_agent_version = appstream_agent_version_ }
    : start_image_builder_request)

let make_start_fleet_request ~name:(name_ : string_) () = ({ name = name_ } : start_fleet_request)

let make_start_app_block_builder_request ~name:(name_ : name) () =
  ({ name = name_ } : start_app_block_builder_request)
