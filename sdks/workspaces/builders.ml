open Types

let make_capacity_status ~active_user_sessions:(active_user_sessions_ : active_user_sessions)
    ~actual_user_sessions:(actual_user_sessions_ : actual_user_sessions)
    ~desired_user_sessions:(desired_user_sessions_ : desired_user_sessions)
    ~available_user_sessions:(available_user_sessions_ : available_user_sessions) () =
  ({
     active_user_sessions = active_user_sessions_;
     actual_user_sessions = actual_user_sessions_;
     desired_user_sessions = desired_user_sessions_;
     available_user_sessions = available_user_sessions_;
   }
    : capacity_status)

let make_workspaces_pool_error ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : workspaces_pool_error_code option) () =
  ({ error_message = error_message_; error_code = error_code_ } : workspaces_pool_error)

let make_application_settings_response ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?settings_group:(settings_group_ : settings_group option)
    ~status:(status_ : application_settings_status_enum) () =
  ({ s3_bucket_name = s3_bucket_name_; settings_group = settings_group_; status = status_ }
    : application_settings_response)

let make_timeout_settings
    ?max_user_duration_in_seconds:
      (max_user_duration_in_seconds_ : max_user_duration_in_seconds option)
    ?idle_disconnect_timeout_in_seconds:
      (idle_disconnect_timeout_in_seconds_ : idle_disconnect_timeout_in_seconds option)
    ?disconnect_timeout_in_seconds:
      (disconnect_timeout_in_seconds_ : disconnect_timeout_in_seconds option) () =
  ({
     max_user_duration_in_seconds = max_user_duration_in_seconds_;
     idle_disconnect_timeout_in_seconds = idle_disconnect_timeout_in_seconds_;
     disconnect_timeout_in_seconds = disconnect_timeout_in_seconds_;
   }
    : timeout_settings)

let make_workspaces_pool ?timeout_settings:(timeout_settings_ : timeout_settings option)
    ?application_settings:(application_settings_ : application_settings_response option)
    ?errors:(errors_ : workspaces_pool_errors option)
    ?description:(description_ : update_description option)
    ~running_mode:(running_mode_ : pools_running_mode) ~directory_id:(directory_id_ : directory_id)
    ~bundle_id:(bundle_id_ : bundle_id) ~created_at:(created_at_ : timestamp)
    ~state:(state_ : workspaces_pool_state) ~pool_name:(pool_name_ : workspaces_pool_name)
    ~capacity_status:(capacity_status_ : capacity_status) ~pool_arn:(pool_arn_ : ar_n)
    ~pool_id:(pool_id_ : workspaces_pool_id) () =
  ({
     running_mode = running_mode_;
     timeout_settings = timeout_settings_;
     application_settings = application_settings_;
     errors = errors_;
     directory_id = directory_id_;
     bundle_id = bundle_id_;
     created_at = created_at_;
     state = state_;
     description = description_;
     pool_name = pool_name_;
     capacity_status = capacity_status_;
     pool_arn = pool_arn_;
     pool_id = pool_id_;
   }
    : workspaces_pool)

let make_capacity ~desired_user_sessions:(desired_user_sessions_ : desired_user_sessions) () =
  ({ desired_user_sessions = desired_user_sessions_ } : capacity)

let make_application_settings_request ?settings_group:(settings_group_ : settings_group option)
    ~status:(status_ : application_settings_status_enum) () =
  ({ settings_group = settings_group_; status = status_ } : application_settings_request)

let make_update_workspaces_pool_request ?running_mode:(running_mode_ : pools_running_mode option)
    ?timeout_settings:(timeout_settings_ : timeout_settings option)
    ?application_settings:(application_settings_ : application_settings_request option)
    ?capacity:(capacity_ : capacity option) ?directory_id:(directory_id_ : directory_id option)
    ?bundle_id:(bundle_id_ : bundle_id option)
    ?description:(description_ : update_description option) ~pool_id:(pool_id_ : workspaces_pool_id)
    () =
  ({
     running_mode = running_mode_;
     timeout_settings = timeout_settings_;
     application_settings = application_settings_;
     capacity = capacity_;
     directory_id = directory_id_;
     bundle_id = bundle_id_;
     description = description_;
     pool_id = pool_id_;
   }
    : update_workspaces_pool_request)

let make_update_workspace_image_permission_request
    ~shared_account_id:(shared_account_id_ : aws_account)
    ~allow_copy_image:(allow_copy_image_ : boolean_object)
    ~image_id:(image_id_ : workspace_image_id) () =
  ({
     shared_account_id = shared_account_id_;
     allow_copy_image = allow_copy_image_;
     image_id = image_id_;
   }
    : update_workspace_image_permission_request)

let make_update_workspace_bundle_request ?image_id:(image_id_ : workspace_image_id option)
    ?bundle_id:(bundle_id_ : bundle_id option) () =
  ({ image_id = image_id_; bundle_id = bundle_id_ } : update_workspace_bundle_request)

let make_ip_rule_item ?rule_desc:(rule_desc_ : ip_rule_desc option)
    ?ip_rule:(ip_rule_ : ip_rule option) () =
  ({ rule_desc = rule_desc_; ip_rule = ip_rule_ } : ip_rule_item)

let make_update_rules_of_ip_group_request ~user_rules:(user_rules_ : ip_rule_list)
    ~group_id:(group_id_ : ip_group_id) () =
  ({ user_rules = user_rules_; group_id = group_id_ } : update_rules_of_ip_group_request)

let make_connection_alias_permission ~allow_association:(allow_association_ : boolean_object)
    ~shared_account_id:(shared_account_id_ : aws_account) () =
  ({ allow_association = allow_association_; shared_account_id = shared_account_id_ }
    : connection_alias_permission)

let make_update_connection_alias_permission_request
    ~connection_alias_permission:(connection_alias_permission_ : connection_alias_permission)
    ~alias_id:(alias_id_ : connection_alias_id) () =
  ({ connection_alias_permission = connection_alias_permission_; alias_id = alias_id_ }
    : update_connection_alias_permission_request)

let make_update_connect_client_add_in_request ?ur_l:(ur_l_ : add_in_url option)
    ?name:(name_ : add_in_name option) ~resource_id:(resource_id_ : directory_id)
    ~add_in_id:(add_in_id_ : amazon_uuid) () =
  ({ ur_l = ur_l_; name = name_; resource_id = resource_id_; add_in_id = add_in_id_ }
    : update_connect_client_add_in_request)

let make_terminate_workspaces_pool_session_request ~session_id:(session_id_ : amazon_uuid) () =
  ({ session_id = session_id_ } : terminate_workspaces_pool_session_request)

let make_terminate_workspaces_pool_request ~pool_id:(pool_id_ : workspaces_pool_id) () =
  ({ pool_id = pool_id_ } : terminate_workspaces_pool_request)

let make_failed_workspace_change_request ?error_message:(error_message_ : description option)
    ?error_code:(error_code_ : error_type option)
    ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({ error_message = error_message_; error_code = error_code_; workspace_id = workspace_id_ }
    : failed_workspace_change_request)

let make_terminate_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : terminate_request)

let make_terminate_workspaces_request
    ~terminate_workspace_requests:(terminate_workspace_requests_ : terminate_workspace_requests) ()
    =
  ({ terminate_workspace_requests = terminate_workspace_requests_ } : terminate_workspaces_request)

let make_stop_workspaces_pool_request ~pool_id:(pool_id_ : workspaces_pool_id) () =
  ({ pool_id = pool_id_ } : stop_workspaces_pool_request)

let make_stop_request ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({ workspace_id = workspace_id_ } : stop_request)

let make_stop_workspaces_request
    ~stop_workspace_requests:(stop_workspace_requests_ : stop_workspace_requests) () =
  ({ stop_workspace_requests = stop_workspace_requests_ } : stop_workspaces_request)

let make_start_workspaces_pool_request ~pool_id:(pool_id_ : workspaces_pool_id) () =
  ({ pool_id = pool_id_ } : start_workspaces_pool_request)

let make_start_request ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({ workspace_id = workspace_id_ } : start_request)

let make_start_workspaces_request
    ~start_workspace_requests:(start_workspace_requests_ : start_workspace_requests) () =
  ({ start_workspace_requests = start_workspace_requests_ } : start_workspaces_request)

let make_revoke_ip_rules_request ~user_rules:(user_rules_ : ip_revoked_rule_list)
    ~group_id:(group_id_ : ip_group_id) () =
  ({ user_rules = user_rules_; group_id = group_id_ } : revoke_ip_rules_request)

let make_restore_workspace_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : restore_workspace_request)

let make_account_link ?target_account_id:(target_account_id_ : aws_account option)
    ?source_account_id:(source_account_id_ : aws_account option)
    ?account_link_status:(account_link_status_ : account_link_status_enum option)
    ?account_link_id:(account_link_id_ : link_id option) () =
  ({
     target_account_id = target_account_id_;
     source_account_id = source_account_id_;
     account_link_status = account_link_status_;
     account_link_id = account_link_id_;
   }
    : account_link)

let make_reject_account_link_invitation_request ?client_token:(client_token_ : client_token option)
    ~link_id:(link_id_ : link_id) () =
  ({ client_token = client_token_; link_id = link_id_ } : reject_account_link_invitation_request)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_microsoft_entra_config
    ?application_config_secret_arn:(application_config_secret_arn_ : secrets_manager_arn option)
    ?tenant_id:(tenant_id_ : microsoft_entra_config_tenant_id option) () =
  ({ application_config_secret_arn = application_config_secret_arn_; tenant_id = tenant_id_ }
    : microsoft_entra_config)

let make_active_directory_config
    ~service_account_secret_arn:(service_account_secret_arn_ : secrets_manager_arn)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ service_account_secret_arn = service_account_secret_arn_; domain_name = domain_name_ }
    : active_directory_config)

let make_register_workspace_directory_request
    ?active_directory_config:(active_directory_config_ : active_directory_config option)
    ?workspace_type:(workspace_type_ : workspace_type option)
    ?microsoft_entra_config:(microsoft_entra_config_ : microsoft_entra_config option)
    ?idc_instance_arn:(idc_instance_arn_ : ar_n option)
    ?user_identity_type:(user_identity_type_ : user_identity_type option)
    ?workspace_directory_description:
      (workspace_directory_description_ : workspace_directory_description option)
    ?workspace_directory_name:(workspace_directory_name_ : workspace_directory_name option)
    ?tags:(tags_ : tag_list option) ?tenancy:(tenancy_ : tenancy option)
    ?enable_self_service:(enable_self_service_ : boolean_object option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     active_directory_config = active_directory_config_;
     workspace_type = workspace_type_;
     microsoft_entra_config = microsoft_entra_config_;
     idc_instance_arn = idc_instance_arn_;
     user_identity_type = user_identity_type_;
     workspace_directory_description = workspace_directory_description_;
     workspace_directory_name = workspace_directory_name_;
     tags = tags_;
     tenancy = tenancy_;
     enable_self_service = enable_self_service_;
     subnet_ids = subnet_ids_;
     directory_id = directory_id_;
   }
    : register_workspace_directory_request)

let make_rebuild_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : rebuild_request)

let make_rebuild_workspaces_request
    ~rebuild_workspace_requests:(rebuild_workspace_requests_ : rebuild_workspace_requests) () =
  ({ rebuild_workspace_requests = rebuild_workspace_requests_ } : rebuild_workspaces_request)

let make_reboot_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : reboot_request)

let make_reboot_workspaces_request
    ~reboot_workspace_requests:(reboot_workspace_requests_ : reboot_workspace_requests) () =
  ({ reboot_workspace_requests = reboot_workspace_requests_ } : reboot_workspaces_request)

let make_modify_workspace_state_request ~workspace_state:(workspace_state_ : target_workspace_state)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_state = workspace_state_; workspace_id = workspace_id_ }
    : modify_workspace_state_request)

let make_global_accelerator_for_work_space
    ?preferred_protocol:(preferred_protocol_ : aga_preferred_protocol_for_work_space option)
    ~mode:(mode_ : aga_mode_for_work_space_enum) () =
  ({ preferred_protocol = preferred_protocol_; mode = mode_ } : global_accelerator_for_work_space)

let make_workspace_properties
    ?global_accelerator:(global_accelerator_ : global_accelerator_for_work_space option)
    ?operating_system_name:(operating_system_name_ : operating_system_name option)
    ?protocols:(protocols_ : protocol_list option)
    ?compute_type_name:(compute_type_name_ : compute option)
    ?user_volume_size_gib:(user_volume_size_gib_ : user_volume_size_gib option)
    ?root_volume_size_gib:(root_volume_size_gib_ : root_volume_size_gib option)
    ?running_mode_auto_stop_timeout_in_minutes:
      (running_mode_auto_stop_timeout_in_minutes_ : running_mode_auto_stop_timeout_in_minutes option)
    ?running_mode:(running_mode_ : running_mode option) () =
  ({
     global_accelerator = global_accelerator_;
     operating_system_name = operating_system_name_;
     protocols = protocols_;
     compute_type_name = compute_type_name_;
     user_volume_size_gib = user_volume_size_gib_;
     root_volume_size_gib = root_volume_size_gib_;
     running_mode_auto_stop_timeout_in_minutes = running_mode_auto_stop_timeout_in_minutes_;
     running_mode = running_mode_;
   }
    : workspace_properties)

let make_modify_workspace_properties_request
    ?data_replication:(data_replication_ : data_replication option)
    ?workspace_properties:(workspace_properties_ : workspace_properties option)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({
     data_replication = data_replication_;
     workspace_properties = workspace_properties_;
     workspace_id = workspace_id_;
   }
    : modify_workspace_properties_request)

let make_workspace_creation_properties ?instance_iam_role_arn:(instance_iam_role_arn_ : ar_n option)
    ?enable_maintenance_mode:(enable_maintenance_mode_ : boolean_object option)
    ?user_enabled_as_local_administrator:
      (user_enabled_as_local_administrator_ : boolean_object option)
    ?custom_security_group_id:(custom_security_group_id_ : security_group_id option)
    ?default_ou:(default_ou_ : default_ou option)
    ?enable_internet_access:(enable_internet_access_ : boolean_object option) () =
  ({
     instance_iam_role_arn = instance_iam_role_arn_;
     enable_maintenance_mode = enable_maintenance_mode_;
     user_enabled_as_local_administrator = user_enabled_as_local_administrator_;
     custom_security_group_id = custom_security_group_id_;
     default_ou = default_ou_;
     enable_internet_access = enable_internet_access_;
   }
    : workspace_creation_properties)

let make_modify_workspace_creation_properties_request
    ~workspace_creation_properties:(workspace_creation_properties_ : workspace_creation_properties)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ workspace_creation_properties = workspace_creation_properties_; resource_id = resource_id_ }
    : modify_workspace_creation_properties_request)

let make_access_endpoint
    ?vpc_endpoint_id:(vpc_endpoint_id_ : alphanumeric_dash_underscore_non_empty_string option)
    ?access_endpoint_type:(access_endpoint_type_ : access_endpoint_type option) () =
  ({ vpc_endpoint_id = vpc_endpoint_id_; access_endpoint_type = access_endpoint_type_ }
    : access_endpoint)

let make_access_endpoint_config
    ?internet_fallback_protocols:
      (internet_fallback_protocols_ : internet_fallback_protocol_list option)
    ~access_endpoints:(access_endpoints_ : access_endpoint_list) () =
  ({
     internet_fallback_protocols = internet_fallback_protocols_;
     access_endpoints = access_endpoints_;
   }
    : access_endpoint_config)

let make_workspace_access_properties
    ?access_endpoint_config:(access_endpoint_config_ : access_endpoint_config option)
    ?device_type_work_spaces_thin_client:
      (device_type_work_spaces_thin_client_ : access_property_value option)
    ?device_type_linux:(device_type_linux_ : access_property_value option)
    ?device_type_zero_client:(device_type_zero_client_ : access_property_value option)
    ?device_type_chrome_os:(device_type_chrome_os_ : access_property_value option)
    ?device_type_android:(device_type_android_ : access_property_value option)
    ?device_type_ios:(device_type_ios_ : access_property_value option)
    ?device_type_web:(device_type_web_ : access_property_value option)
    ?device_type_osx:(device_type_osx_ : access_property_value option)
    ?device_type_windows:(device_type_windows_ : access_property_value option) () =
  ({
     access_endpoint_config = access_endpoint_config_;
     device_type_work_spaces_thin_client = device_type_work_spaces_thin_client_;
     device_type_linux = device_type_linux_;
     device_type_zero_client = device_type_zero_client_;
     device_type_chrome_os = device_type_chrome_os_;
     device_type_android = device_type_android_;
     device_type_ios = device_type_ios_;
     device_type_web = device_type_web_;
     device_type_osx = device_type_osx_;
     device_type_windows = device_type_windows_;
   }
    : workspace_access_properties)

let make_modify_workspace_access_properties_request
    ~workspace_access_properties:(workspace_access_properties_ : workspace_access_properties)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ workspace_access_properties = workspace_access_properties_; resource_id = resource_id_ }
    : modify_workspace_access_properties_request)

let make_user_setting ?maximum_length:(maximum_length_ : maximum_length option)
    ~permission:(permission_ : user_setting_permission_enum)
    ~action:(action_ : user_setting_action_enum) () =
  ({ maximum_length = maximum_length_; permission = permission_; action = action_ } : user_setting)

let make_storage_connector ~status:(status_ : storage_connector_status_enum)
    ~connector_type:(connector_type_ : storage_connector_type_enum) () =
  ({ status = status_; connector_type = connector_type_ } : storage_connector)

let make_global_accelerator_for_directory
    ?preferred_protocol:(preferred_protocol_ : aga_preferred_protocol_for_directory option)
    ~mode:(mode_ : aga_mode_for_directory_enum) () =
  ({ preferred_protocol = preferred_protocol_; mode = mode_ } : global_accelerator_for_directory)

let make_streaming_properties
    ?global_accelerator:(global_accelerator_ : global_accelerator_for_directory option)
    ?storage_connectors:(storage_connectors_ : storage_connectors option)
    ?user_settings:(user_settings_ : user_settings option)
    ?streaming_experience_preferred_protocol:
      (streaming_experience_preferred_protocol_ :
         streaming_experience_preferred_protocol_enum option) () =
  ({
     global_accelerator = global_accelerator_;
     storage_connectors = storage_connectors_;
     user_settings = user_settings_;
     streaming_experience_preferred_protocol = streaming_experience_preferred_protocol_;
   }
    : streaming_properties)

let make_modify_streaming_properties_request
    ?streaming_properties:(streaming_properties_ : streaming_properties option)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ streaming_properties = streaming_properties_; resource_id = resource_id_ }
    : modify_streaming_properties_request)

let make_selfservice_permissions ?rebuild_workspace:(rebuild_workspace_ : reconnect_enum option)
    ?switch_running_mode:(switch_running_mode_ : reconnect_enum option)
    ?change_compute_type:(change_compute_type_ : reconnect_enum option)
    ?increase_volume_size:(increase_volume_size_ : reconnect_enum option)
    ?restart_workspace:(restart_workspace_ : reconnect_enum option) () =
  ({
     rebuild_workspace = rebuild_workspace_;
     switch_running_mode = switch_running_mode_;
     change_compute_type = change_compute_type_;
     increase_volume_size = increase_volume_size_;
     restart_workspace = restart_workspace_;
   }
    : selfservice_permissions)

let make_modify_selfservice_permissions_request
    ~selfservice_permissions:(selfservice_permissions_ : selfservice_permissions)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ selfservice_permissions = selfservice_permissions_; resource_id = resource_id_ }
    : modify_selfservice_permissions_request)

let make_saml_properties
    ?relay_state_parameter_name:(relay_state_parameter_name_ : non_empty_string option)
    ?user_access_url:(user_access_url_ : saml_user_access_url option)
    ?status:(status_ : saml_status_enum option) () =
  ({
     relay_state_parameter_name = relay_state_parameter_name_;
     user_access_url = user_access_url_;
     status = status_;
   }
    : saml_properties)

let make_modify_saml_properties_request
    ?properties_to_delete:(properties_to_delete_ : deletable_saml_properties_list option)
    ?saml_properties:(saml_properties_ : saml_properties option)
    ~resource_id:(resource_id_ : directory_id) () =
  ({
     properties_to_delete = properties_to_delete_;
     saml_properties = saml_properties_;
     resource_id = resource_id_;
   }
    : modify_saml_properties_request)

let make_modify_endpoint_encryption_mode_response () = (() : unit)

let make_modify_endpoint_encryption_mode_request
    ~endpoint_encryption_mode:(endpoint_encryption_mode_ : endpoint_encryption_mode)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ endpoint_encryption_mode = endpoint_encryption_mode_; directory_id = directory_id_ }
    : modify_endpoint_encryption_mode_request)

let make_client_properties ?log_upload_enabled:(log_upload_enabled_ : log_upload_enum option)
    ?reconnect_enabled:(reconnect_enabled_ : reconnect_enum option) () =
  ({ log_upload_enabled = log_upload_enabled_; reconnect_enabled = reconnect_enabled_ }
    : client_properties)

let make_modify_client_properties_request
    ~client_properties:(client_properties_ : client_properties)
    ~resource_id:(resource_id_ : non_empty_string) () =
  ({ client_properties = client_properties_; resource_id = resource_id_ }
    : modify_client_properties_request)

let make_certificate_based_auth_properties
    ?certificate_authority_arn:(certificate_authority_arn_ : certificate_authority_arn option)
    ?status:(status_ : certificate_based_auth_status_enum option) () =
  ({ certificate_authority_arn = certificate_authority_arn_; status = status_ }
    : certificate_based_auth_properties)

let make_modify_certificate_based_auth_properties_request
    ?properties_to_delete:
      (properties_to_delete_ : deletable_certificate_based_auth_properties_list option)
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ~resource_id:(resource_id_ : directory_id) () =
  ({
     properties_to_delete = properties_to_delete_;
     certificate_based_auth_properties = certificate_based_auth_properties_;
     resource_id = resource_id_;
   }
    : modify_certificate_based_auth_properties_request)

let make_modify_account_request
    ?dedicated_tenancy_management_cidr_range:
      (dedicated_tenancy_management_cidr_range_ : dedicated_tenancy_management_cidr_range option)
    ?dedicated_tenancy_support:(dedicated_tenancy_support_ : dedicated_tenancy_support_enum option)
    () =
  ({
     dedicated_tenancy_management_cidr_range = dedicated_tenancy_management_cidr_range_;
     dedicated_tenancy_support = dedicated_tenancy_support_;
   }
    : modify_account_request)

let make_migrate_workspace_request ~bundle_id:(bundle_id_ : bundle_id)
    ~source_workspace_id:(source_workspace_id_ : workspace_id) () =
  ({ bundle_id = bundle_id_; source_workspace_id = source_workspace_id_ }
    : migrate_workspace_request)

let make_list_available_management_cidr_ranges_request
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : management_cidr_range_max_results option)
    ~management_cidr_range_constraint:
      (management_cidr_range_constraint_ : management_cidr_range_constraint) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     management_cidr_range_constraint = management_cidr_range_constraint_;
   }
    : list_available_management_cidr_ranges_request)

let make_list_account_links_request ?max_results:(max_results_ : limit option)
    ?next_token:(next_token_ : pagination_token option)
    ?link_status_filter:(link_status_filter_ : link_status_filter_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     link_status_filter = link_status_filter_;
   }
    : list_account_links_request)

let make_import_workspace_image_request ?applications:(applications_ : application_list option)
    ?tags:(tags_ : tag_list option)
    ~image_description:(image_description_ : workspace_image_description)
    ~image_name:(image_name_ : workspace_image_name)
    ~ingestion_process:(ingestion_process_ : workspace_image_ingestion_process)
    ~ec2_image_id:(ec2_image_id_ : ec2_image_id) () =
  ({
     applications = applications_;
     tags = tags_;
     image_description = image_description_;
     image_name = image_name_;
     ingestion_process = ingestion_process_;
     ec2_image_id = ec2_image_id_;
   }
    : import_workspace_image_request)

let make_import_custom_workspace_image_request ?tags:(tags_ : tag_list option)
    ~os_version:(os_version_ : os_version) ~platform:(platform_ : platform)
    ~infrastructure_configuration_arn:
      (infrastructure_configuration_arn_ : infrastructure_configuration_arn)
    ~image_source:(image_source_ : image_source_identifier)
    ~protocol:(protocol_ : custom_image_protocol) ~compute_type:(compute_type_ : image_compute_type)
    ~image_description:(image_description_ : workspace_image_description)
    ~image_name:(image_name_ : workspace_image_name) () =
  ({
     tags = tags_;
     os_version = os_version_;
     platform = platform_;
     infrastructure_configuration_arn = infrastructure_configuration_arn_;
     image_source = image_source_;
     protocol = protocol_;
     compute_type = compute_type_;
     image_description = image_description_;
     image_name = image_name_;
   }
    : import_custom_workspace_image_request)

let make_default_client_branding_attributes ?login_message:(login_message_ : login_message option)
    ?forgot_password_link:(forgot_password_link_ : client_url option)
    ?support_link:(support_link_ : client_url option)
    ?support_email:(support_email_ : client_email option) ?logo_url:(logo_url_ : client_url option)
    () =
  ({
     login_message = login_message_;
     forgot_password_link = forgot_password_link_;
     support_link = support_link_;
     support_email = support_email_;
     logo_url = logo_url_;
   }
    : default_client_branding_attributes)

let make_ios_client_branding_attributes ?login_message:(login_message_ : login_message option)
    ?forgot_password_link:(forgot_password_link_ : client_url option)
    ?support_link:(support_link_ : client_url option)
    ?support_email:(support_email_ : client_email option)
    ?logo3x_url:(logo3x_url_ : client_url option) ?logo2x_url:(logo2x_url_ : client_url option)
    ?logo_url:(logo_url_ : client_url option) () =
  ({
     login_message = login_message_;
     forgot_password_link = forgot_password_link_;
     support_link = support_link_;
     support_email = support_email_;
     logo3x_url = logo3x_url_;
     logo2x_url = logo2x_url_;
     logo_url = logo_url_;
   }
    : ios_client_branding_attributes)

let make_default_import_client_branding_attributes
    ?login_message:(login_message_ : login_message option)
    ?forgot_password_link:(forgot_password_link_ : client_url option)
    ?support_link:(support_link_ : client_url option)
    ?support_email:(support_email_ : client_email option) ?logo:(logo_ : default_logo option) () =
  ({
     login_message = login_message_;
     forgot_password_link = forgot_password_link_;
     support_link = support_link_;
     support_email = support_email_;
     logo = logo_;
   }
    : default_import_client_branding_attributes)

let make_ios_import_client_branding_attributes
    ?login_message:(login_message_ : login_message option)
    ?forgot_password_link:(forgot_password_link_ : client_url option)
    ?support_link:(support_link_ : client_url option)
    ?support_email:(support_email_ : client_email option) ?logo3x:(logo3x_ : ios3_x_logo option)
    ?logo2x:(logo2x_ : ios2_x_logo option) ?logo:(logo_ : ios_logo option) () =
  ({
     login_message = login_message_;
     forgot_password_link = forgot_password_link_;
     support_link = support_link_;
     support_email = support_email_;
     logo3x = logo3x_;
     logo2x = logo2x_;
     logo = logo_;
   }
    : ios_import_client_branding_attributes)

let make_import_client_branding_request
    ?device_type_web:(device_type_web_ : default_import_client_branding_attributes option)
    ?device_type_linux:(device_type_linux_ : default_import_client_branding_attributes option)
    ?device_type_ios:(device_type_ios_ : ios_import_client_branding_attributes option)
    ?device_type_android:(device_type_android_ : default_import_client_branding_attributes option)
    ?device_type_osx:(device_type_osx_ : default_import_client_branding_attributes option)
    ?device_type_windows:(device_type_windows_ : default_import_client_branding_attributes option)
    ~resource_id:(resource_id_ : directory_id) () =
  ({
     device_type_web = device_type_web_;
     device_type_linux = device_type_linux_;
     device_type_ios = device_type_ios_;
     device_type_android = device_type_android_;
     device_type_osx = device_type_osx_;
     device_type_windows = device_type_windows_;
     resource_id = resource_id_;
   }
    : import_client_branding_request)

let make_get_account_link_request ?linked_account_id:(linked_account_id_ : aws_account option)
    ?link_id:(link_id_ : link_id option) () =
  ({ linked_account_id = linked_account_id_; link_id = link_id_ } : get_account_link_request)

let make_association_state_reason ?error_message:(error_message_ : string2048 option)
    ?error_code:(error_code_ : association_error_code option) () =
  ({ error_message = error_message_; error_code = error_code_ } : association_state_reason)

let make_workspace_resource_association ?workspace_id:(workspace_id_ : workspace_id option)
    ?state_reason:(state_reason_ : association_state_reason option)
    ?state:(state_ : association_state option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?created:(created_ : timestamp option)
    ?associated_resource_type:
      (associated_resource_type_ : work_space_associated_resource_type option)
    ?associated_resource_id:(associated_resource_id_ : non_empty_string option) () =
  ({
     workspace_id = workspace_id_;
     state_reason = state_reason_;
     state = state_;
     last_updated_time = last_updated_time_;
     created = created_;
     associated_resource_type = associated_resource_type_;
     associated_resource_id = associated_resource_id_;
   }
    : workspace_resource_association)

let make_disassociate_workspace_application_request
    ~application_id:(application_id_ : work_space_application_id)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ application_id = application_id_; workspace_id = workspace_id_ }
    : disassociate_workspace_application_request)

let make_disassociate_ip_groups_request ~group_ids:(group_ids_ : ip_group_id_list)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ group_ids = group_ids_; directory_id = directory_id_ } : disassociate_ip_groups_request)

let make_disassociate_connection_alias_request ~alias_id:(alias_id_ : connection_alias_id) () =
  ({ alias_id = alias_id_ } : disassociate_connection_alias_request)

let make_network_access_configuration ?eni_id:(eni_id_ : non_empty_string option)
    ?eni_private_ip_address:(eni_private_ip_address_ : non_empty_string option) () =
  ({ eni_id = eni_id_; eni_private_ip_address = eni_private_ip_address_ }
    : network_access_configuration)

let make_workspaces_pool_session ?start_time:(start_time_ : timestamp option)
    ?network_access_configuration:
      (network_access_configuration_ : network_access_configuration option)
    ?expiration_time:(expiration_time_ : timestamp option)
    ?instance_id:(instance_id_ : session_instance_id option)
    ?connection_state:(connection_state_ : session_connection_state option)
    ?authentication_type:(authentication_type_ : authentication_type option)
    ~user_id:(user_id_ : workspaces_pool_user_id) ~pool_id:(pool_id_ : workspaces_pool_id)
    ~session_id:(session_id_ : amazon_uuid) () =
  ({
     user_id = user_id_;
     start_time = start_time_;
     network_access_configuration = network_access_configuration_;
     expiration_time = expiration_time_;
     pool_id = pool_id_;
     instance_id = instance_id_;
     session_id = session_id_;
     connection_state = connection_state_;
     authentication_type = authentication_type_;
   }
    : workspaces_pool_session)

let make_describe_workspaces_pool_sessions_request
    ?next_token:(next_token_ : pagination_token option) ?limit:(limit_ : limit50 option)
    ?user_id:(user_id_ : workspaces_pool_user_id option) ~pool_id:(pool_id_ : workspaces_pool_id) ()
    =
  ({ next_token = next_token_; limit = limit_; user_id = user_id_; pool_id = pool_id_ }
    : describe_workspaces_pool_sessions_request)

let make_describe_workspaces_pools_filter
    ~operator:(operator_ : describe_workspaces_pools_filter_operator)
    ~values:(values_ : describe_workspaces_pools_filter_values)
    ~name:(name_ : describe_workspaces_pools_filter_name) () =
  ({ operator = operator_; values = values_; name = name_ } : describe_workspaces_pools_filter)

let make_describe_workspaces_pools_request ?next_token:(next_token_ : pagination_token option)
    ?limit:(limit_ : limit option) ?filters:(filters_ : describe_workspaces_pools_filters option)
    ?pool_ids:(pool_ids_ : workspaces_pool_ids option) () =
  ({ next_token = next_token_; limit = limit_; filters = filters_; pool_ids = pool_ids_ }
    : describe_workspaces_pools_request)

let make_snapshot ?snapshot_time:(snapshot_time_ : timestamp option) () =
  ({ snapshot_time = snapshot_time_ } : snapshot)

let make_describe_workspace_snapshots_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : describe_workspace_snapshots_request)

let make_workspace_connection_status
    ?last_known_user_connection_timestamp:(last_known_user_connection_timestamp_ : timestamp option)
    ?connection_state_check_timestamp:(connection_state_check_timestamp_ : timestamp option)
    ?connection_state:(connection_state_ : connection_state option)
    ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({
     last_known_user_connection_timestamp = last_known_user_connection_timestamp_;
     connection_state_check_timestamp = connection_state_check_timestamp_;
     connection_state = connection_state_;
     workspace_id = workspace_id_;
   }
    : workspace_connection_status)

let make_describe_workspaces_connection_status_request
    ?next_token:(next_token_ : pagination_token option)
    ?workspace_ids:(workspace_ids_ : workspace_id_list option) () =
  ({ next_token = next_token_; workspace_ids = workspace_ids_ }
    : describe_workspaces_connection_status_request)

let make_modification_state ?state:(state_ : modification_state_enum option)
    ?resource:(resource_ : modification_resource_enum option) () =
  ({ state = state_; resource = resource_ } : modification_state)

let make_related_workspace_properties ?type_:(type__ : standby_workspace_relationship_type option)
    ?state:(state_ : workspace_state option) ?region:(region_ : region option)
    ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({ type_ = type__; state = state_; region = region_; workspace_id = workspace_id_ }
    : related_workspace_properties)

let make_data_replication_settings
    ?recovery_snapshot_time:(recovery_snapshot_time_ : timestamp option)
    ?data_replication:(data_replication_ : data_replication option) () =
  ({ recovery_snapshot_time = recovery_snapshot_time_; data_replication = data_replication_ }
    : data_replication_settings)

let make_standby_workspaces_properties
    ?recovery_snapshot_time:(recovery_snapshot_time_ : timestamp option)
    ?data_replication:(data_replication_ : data_replication option)
    ?standby_workspace_id:(standby_workspace_id_ : workspace_id option) () =
  ({
     recovery_snapshot_time = recovery_snapshot_time_;
     data_replication = data_replication_;
     standby_workspace_id = standby_workspace_id_;
   }
    : standby_workspaces_properties)

let make_workspace
    ?standby_workspaces_properties:
      (standby_workspaces_properties_ : standby_workspaces_properties_list option)
    ?data_replication_settings:(data_replication_settings_ : data_replication_settings option)
    ?related_workspaces:(related_workspaces_ : related_workspaces option)
    ?modification_states:(modification_states_ : modification_state_list option)
    ?workspace_properties:(workspace_properties_ : workspace_properties option)
    ?workspace_name:(workspace_name_ : workspace_name option)
    ?root_volume_encryption_enabled:(root_volume_encryption_enabled_ : boolean_object option)
    ?user_volume_encryption_enabled:(user_volume_encryption_enabled_ : boolean_object option)
    ?volume_encryption_key:(volume_encryption_key_ : volume_encryption_key option)
    ?computer_name:(computer_name_ : computer_name option)
    ?error_code:(error_code_ : workspace_error_code option)
    ?error_message:(error_message_ : description option) ?subnet_id:(subnet_id_ : subnet_id option)
    ?bundle_id:(bundle_id_ : bundle_id option) ?state:(state_ : workspace_state option)
    ?ipv6_address:(ipv6_address_ : ipv6_address option)
    ?ip_address:(ip_address_ : ip_address option) ?user_name:(user_name_ : user_name option)
    ?directory_id:(directory_id_ : directory_id option)
    ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({
     standby_workspaces_properties = standby_workspaces_properties_;
     data_replication_settings = data_replication_settings_;
     related_workspaces = related_workspaces_;
     modification_states = modification_states_;
     workspace_properties = workspace_properties_;
     workspace_name = workspace_name_;
     root_volume_encryption_enabled = root_volume_encryption_enabled_;
     user_volume_encryption_enabled = user_volume_encryption_enabled_;
     volume_encryption_key = volume_encryption_key_;
     computer_name = computer_name_;
     error_code = error_code_;
     error_message = error_message_;
     subnet_id = subnet_id_;
     bundle_id = bundle_id_;
     state = state_;
     ipv6_address = ipv6_address_;
     ip_address = ip_address_;
     user_name = user_name_;
     directory_id = directory_id_;
     workspace_id = workspace_id_;
   }
    : workspace)

let make_describe_workspaces_request ?workspace_name:(workspace_name_ : workspace_name option)
    ?next_token:(next_token_ : pagination_token option) ?limit:(limit_ : limit option)
    ?bundle_id:(bundle_id_ : bundle_id option) ?user_name:(user_name_ : user_name option)
    ?directory_id:(directory_id_ : directory_id option)
    ?workspace_ids:(workspace_ids_ : workspace_id_list option) () =
  ({
     workspace_name = workspace_name_;
     next_token = next_token_;
     limit = limit_;
     bundle_id = bundle_id_;
     user_name = user_name_;
     directory_id = directory_id_;
     workspace_ids = workspace_ids_;
   }
    : describe_workspaces_request)

let make_operating_system ?type_:(type__ : operating_system_type option) () =
  ({ type_ = type__ } : operating_system)

let make_error_details ?error_message:(error_message_ : description option)
    ?error_code:(error_code_ : workspace_image_error_detail_code option) () =
  ({ error_message = error_message_; error_code = error_code_ } : error_details)

let make_workspace_image ?error_details:(error_details_ : error_details_list option)
    ?updates:(updates_ : update_result option)
    ?owner_account_id:(owner_account_id_ : aws_account option)
    ?created:(created_ : timestamp option) ?error_message:(error_message_ : description option)
    ?error_code:(error_code_ : workspace_image_error_code option)
    ?required_tenancy:(required_tenancy_ : workspace_image_required_tenancy option)
    ?state:(state_ : workspace_image_state option)
    ?operating_system:(operating_system_ : operating_system option)
    ?description:(description_ : workspace_image_description option)
    ?name:(name_ : workspace_image_name option) ?image_id:(image_id_ : workspace_image_id option) ()
    =
  ({
     error_details = error_details_;
     updates = updates_;
     owner_account_id = owner_account_id_;
     created = created_;
     error_message = error_message_;
     error_code = error_code_;
     required_tenancy = required_tenancy_;
     state = state_;
     operating_system = operating_system_;
     description = description_;
     name = name_;
     image_id = image_id_;
   }
    : workspace_image)

let make_describe_workspace_images_request ?max_results:(max_results_ : limit option)
    ?next_token:(next_token_ : pagination_token option)
    ?image_type:(image_type_ : image_type option)
    ?image_ids:(image_ids_ : workspace_image_id_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     image_type = image_type_;
     image_ids = image_ids_;
   }
    : describe_workspace_images_request)

let make_image_permission ?shared_account_id:(shared_account_id_ : aws_account option) () =
  ({ shared_account_id = shared_account_id_ } : image_permission)

let make_describe_workspace_image_permissions_request ?max_results:(max_results_ : limit option)
    ?next_token:(next_token_ : pagination_token option) ~image_id:(image_id_ : workspace_image_id)
    () =
  ({ max_results = max_results_; next_token = next_token_; image_id = image_id_ }
    : describe_workspace_image_permissions_request)

let make_default_workspace_creation_properties
    ?instance_iam_role_arn:(instance_iam_role_arn_ : ar_n option)
    ?enable_maintenance_mode:(enable_maintenance_mode_ : boolean_object option)
    ?user_enabled_as_local_administrator:
      (user_enabled_as_local_administrator_ : boolean_object option)
    ?custom_security_group_id:(custom_security_group_id_ : security_group_id option)
    ?default_ou:(default_ou_ : default_ou option)
    ?enable_internet_access:(enable_internet_access_ : boolean_object option) () =
  ({
     instance_iam_role_arn = instance_iam_role_arn_;
     enable_maintenance_mode = enable_maintenance_mode_;
     user_enabled_as_local_administrator = user_enabled_as_local_administrator_;
     custom_security_group_id = custom_security_group_id_;
     default_ou = default_ou_;
     enable_internet_access = enable_internet_access_;
   }
    : default_workspace_creation_properties)

let make_idc_config ?application_arn:(application_arn_ : ar_n option)
    ?instance_arn:(instance_arn_ : ar_n option) () =
  ({ application_arn = application_arn_; instance_arn = instance_arn_ } : idc_config)

let make_workspace_directory ?error_message:(error_message_ : description option)
    ?streaming_properties:(streaming_properties_ : streaming_properties option)
    ?active_directory_config:(active_directory_config_ : active_directory_config option)
    ?idc_config:(idc_config_ : idc_config option)
    ?workspace_type:(workspace_type_ : workspace_type option)
    ?user_identity_type:(user_identity_type_ : user_identity_type option)
    ?workspace_directory_description:
      (workspace_directory_description_ : workspace_directory_description option)
    ?workspace_directory_name:(workspace_directory_name_ : workspace_directory_name option)
    ?microsoft_entra_config:(microsoft_entra_config_ : microsoft_entra_config option)
    ?endpoint_encryption_mode:(endpoint_encryption_mode_ : endpoint_encryption_mode option)
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ?saml_properties:(saml_properties_ : saml_properties option)
    ?selfservice_permissions:(selfservice_permissions_ : selfservice_permissions option)
    ?tenancy:(tenancy_ : tenancy option)
    ?workspace_access_properties:(workspace_access_properties_ : workspace_access_properties option)
    ?ip_group_ids:(ip_group_ids_ : ip_group_id_list option)
    ?workspace_creation_properties:
      (workspace_creation_properties_ : default_workspace_creation_properties option)
    ?state:(state_ : workspace_directory_state option)
    ?workspace_security_group_id:(workspace_security_group_id_ : security_group_id option)
    ?directory_type:(directory_type_ : workspace_directory_type option)
    ?iam_role_id:(iam_role_id_ : ar_n option)
    ?customer_user_name:(customer_user_name_ : user_name option)
    ?dns_ipv6_addresses:(dns_ipv6_addresses_ : dns_ipv6_addresses option)
    ?dns_ip_addresses:(dns_ip_addresses_ : dns_ip_addresses option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?registration_code:(registration_code_ : registration_code option)
    ?directory_name:(directory_name_ : directory_name option) ?alias:(alias_ : alias option)
    ?directory_id:(directory_id_ : directory_id option) () =
  ({
     error_message = error_message_;
     streaming_properties = streaming_properties_;
     active_directory_config = active_directory_config_;
     idc_config = idc_config_;
     workspace_type = workspace_type_;
     user_identity_type = user_identity_type_;
     workspace_directory_description = workspace_directory_description_;
     workspace_directory_name = workspace_directory_name_;
     microsoft_entra_config = microsoft_entra_config_;
     endpoint_encryption_mode = endpoint_encryption_mode_;
     certificate_based_auth_properties = certificate_based_auth_properties_;
     saml_properties = saml_properties_;
     selfservice_permissions = selfservice_permissions_;
     tenancy = tenancy_;
     workspace_access_properties = workspace_access_properties_;
     ip_group_ids = ip_group_ids_;
     workspace_creation_properties = workspace_creation_properties_;
     state = state_;
     workspace_security_group_id = workspace_security_group_id_;
     directory_type = directory_type_;
     iam_role_id = iam_role_id_;
     customer_user_name = customer_user_name_;
     dns_ipv6_addresses = dns_ipv6_addresses_;
     dns_ip_addresses = dns_ip_addresses_;
     subnet_ids = subnet_ids_;
     registration_code = registration_code_;
     directory_name = directory_name_;
     alias = alias_;
     directory_id = directory_id_;
   }
    : workspace_directory)

let make_describe_workspace_directories_filter
    ~values:(values_ : describe_workspace_directories_filter_values)
    ~name:(name_ : describe_workspace_directories_filter_name) () =
  ({ values = values_; name = name_ } : describe_workspace_directories_filter)

let make_describe_workspace_directories_request
    ?filters:(filters_ : describe_workspace_directories_filter_list option)
    ?next_token:(next_token_ : pagination_token option) ?limit:(limit_ : limit option)
    ?workspace_directory_names:(workspace_directory_names_ : workspace_directory_name_list option)
    ?directory_ids:(directory_ids_ : directory_id_list option) () =
  ({
     filters = filters_;
     next_token = next_token_;
     limit = limit_;
     workspace_directory_names = workspace_directory_names_;
     directory_ids = directory_ids_;
   }
    : describe_workspace_directories_request)

let make_root_storage ~capacity:(capacity_ : non_empty_string) () =
  ({ capacity = capacity_ } : root_storage)

let make_user_storage ~capacity:(capacity_ : non_empty_string) () =
  ({ capacity = capacity_ } : user_storage)

let make_compute_type ?name:(name_ : compute option) () = ({ name = name_ } : compute_type)

let make_workspace_bundle ?bundle_type:(bundle_type_ : bundle_type option)
    ?state:(state_ : workspace_bundle_state option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?compute_type:(compute_type_ : compute_type option)
    ?user_storage:(user_storage_ : user_storage option)
    ?root_storage:(root_storage_ : root_storage option)
    ?image_id:(image_id_ : workspace_image_id option)
    ?description:(description_ : description option) ?owner:(owner_ : bundle_owner option)
    ?name:(name_ : non_empty_string option) ?bundle_id:(bundle_id_ : bundle_id option) () =
  ({
     bundle_type = bundle_type_;
     state = state_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     compute_type = compute_type_;
     user_storage = user_storage_;
     root_storage = root_storage_;
     image_id = image_id_;
     description = description_;
     owner = owner_;
     name = name_;
     bundle_id = bundle_id_;
   }
    : workspace_bundle)

let make_describe_workspace_bundles_request ?next_token:(next_token_ : pagination_token option)
    ?owner:(owner_ : bundle_owner option) ?bundle_ids:(bundle_ids_ : bundle_id_list option) () =
  ({ next_token = next_token_; owner = owner_; bundle_ids = bundle_ids_ }
    : describe_workspace_bundles_request)

let make_describe_workspace_associations_request
    ~associated_resource_types:
      (associated_resource_types_ : work_space_associated_resource_type_list)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ associated_resource_types = associated_resource_types_; workspace_id = workspace_id_ }
    : describe_workspace_associations_request)

let make_describe_tags_request ~resource_id:(resource_id_ : non_empty_string) () =
  ({ resource_id = resource_id_ } : describe_tags_request)

let make_workspaces_ip_group ?user_rules:(user_rules_ : ip_rule_list option)
    ?group_desc:(group_desc_ : ip_group_desc option)
    ?group_name:(group_name_ : ip_group_name option) ?group_id:(group_id_ : ip_group_id option) () =
  ({
     user_rules = user_rules_;
     group_desc = group_desc_;
     group_name = group_name_;
     group_id = group_id_;
   }
    : workspaces_ip_group)

let make_describe_ip_groups_request ?max_results:(max_results_ : limit option)
    ?next_token:(next_token_ : pagination_token option)
    ?group_ids:(group_ids_ : ip_group_id_list option) () =
  ({ max_results = max_results_; next_token = next_token_; group_ids = group_ids_ }
    : describe_ip_groups_request)

let make_image_resource_association ?state_reason:(state_reason_ : association_state_reason option)
    ?state:(state_ : association_state option) ?image_id:(image_id_ : workspace_image_id option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?created:(created_ : timestamp option)
    ?associated_resource_type:(associated_resource_type_ : image_associated_resource_type option)
    ?associated_resource_id:(associated_resource_id_ : non_empty_string option) () =
  ({
     state_reason = state_reason_;
     state = state_;
     image_id = image_id_;
     last_updated_time = last_updated_time_;
     created = created_;
     associated_resource_type = associated_resource_type_;
     associated_resource_id = associated_resource_id_;
   }
    : image_resource_association)

let make_describe_image_associations_request
    ~associated_resource_types:(associated_resource_types_ : image_associated_resource_type_list)
    ~image_id:(image_id_ : workspace_image_id) () =
  ({ associated_resource_types = associated_resource_types_; image_id = image_id_ }
    : describe_image_associations_request)

let make_custom_workspace_image_import_error_details
    ?error_message:(error_message_ : image_error_message option)
    ?error_code:(error_code_ : error_code option) () =
  ({ error_message = error_message_; error_code = error_code_ }
    : custom_workspace_image_import_error_details)

let make_describe_custom_workspace_image_import_request ~image_id:(image_id_ : workspace_image_id)
    () =
  ({ image_id = image_id_ } : describe_custom_workspace_image_import_request)

let make_describe_connection_alias_permissions_request ?max_results:(max_results_ : limit option)
    ?next_token:(next_token_ : pagination_token option) ~alias_id:(alias_id_ : connection_alias_id)
    () =
  ({ max_results = max_results_; next_token = next_token_; alias_id = alias_id_ }
    : describe_connection_alias_permissions_request)

let make_connection_alias_association
    ?connection_identifier:(connection_identifier_ : connection_identifier option)
    ?resource_id:(resource_id_ : non_empty_string option)
    ?associated_account_id:(associated_account_id_ : aws_account option)
    ?association_status:(association_status_ : association_status option) () =
  ({
     connection_identifier = connection_identifier_;
     resource_id = resource_id_;
     associated_account_id = associated_account_id_;
     association_status = association_status_;
   }
    : connection_alias_association)

let make_connection_alias ?associations:(associations_ : connection_alias_association_list option)
    ?owner_account_id:(owner_account_id_ : aws_account option)
    ?state:(state_ : connection_alias_state option)
    ?alias_id:(alias_id_ : connection_alias_id option)
    ?connection_string:(connection_string_ : connection_string option) () =
  ({
     associations = associations_;
     owner_account_id = owner_account_id_;
     state = state_;
     alias_id = alias_id_;
     connection_string = connection_string_;
   }
    : connection_alias)

let make_describe_connection_aliases_request ?next_token:(next_token_ : pagination_token option)
    ?limit:(limit_ : limit option) ?resource_id:(resource_id_ : non_empty_string option)
    ?alias_ids:(alias_ids_ : connection_alias_id_list option) () =
  ({ next_token = next_token_; limit = limit_; resource_id = resource_id_; alias_ids = alias_ids_ }
    : describe_connection_aliases_request)

let make_connect_client_add_in ?ur_l:(ur_l_ : add_in_url option) ?name:(name_ : add_in_name option)
    ?resource_id:(resource_id_ : directory_id option) ?add_in_id:(add_in_id_ : amazon_uuid option)
    () =
  ({ ur_l = ur_l_; name = name_; resource_id = resource_id_; add_in_id = add_in_id_ }
    : connect_client_add_in)

let make_describe_connect_client_add_ins_request ?max_results:(max_results_ : limit option)
    ?next_token:(next_token_ : pagination_token option) ~resource_id:(resource_id_ : directory_id)
    () =
  ({ max_results = max_results_; next_token = next_token_; resource_id = resource_id_ }
    : describe_connect_client_add_ins_request)

let make_describe_client_properties_request ~resource_ids:(resource_ids_ : resource_id_list) () =
  ({ resource_ids = resource_ids_ } : describe_client_properties_request)

let make_describe_client_branding_request ~resource_id:(resource_id_ : directory_id) () =
  ({ resource_id = resource_id_ } : describe_client_branding_request)

let make_bundle_resource_association ?state_reason:(state_reason_ : association_state_reason option)
    ?state:(state_ : association_state option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?created:(created_ : timestamp option) ?bundle_id:(bundle_id_ : bundle_id option)
    ?associated_resource_type:(associated_resource_type_ : bundle_associated_resource_type option)
    ?associated_resource_id:(associated_resource_id_ : non_empty_string option) () =
  ({
     state_reason = state_reason_;
     state = state_;
     last_updated_time = last_updated_time_;
     created = created_;
     bundle_id = bundle_id_;
     associated_resource_type = associated_resource_type_;
     associated_resource_id = associated_resource_id_;
   }
    : bundle_resource_association)

let make_describe_bundle_associations_request
    ~associated_resource_types:(associated_resource_types_ : bundle_associated_resource_type_list)
    ~bundle_id:(bundle_id_ : bundle_id) () =
  ({ associated_resource_types = associated_resource_types_; bundle_id = bundle_id_ }
    : describe_bundle_associations_request)

let make_work_space_application
    ?supported_operating_system_names:
      (supported_operating_system_names_ : operating_system_name_list option)
    ?supported_compute_type_names:(supported_compute_type_names_ : compute_list option)
    ?state:(state_ : work_space_application_state option)
    ?owner:(owner_ : work_space_application_owner option) ?name:(name_ : non_empty_string option)
    ?license_type:(license_type_ : work_space_application_license_type option)
    ?description:(description_ : string2048 option) ?created:(created_ : timestamp option)
    ?application_id:(application_id_ : work_space_application_id option) () =
  ({
     supported_operating_system_names = supported_operating_system_names_;
     supported_compute_type_names = supported_compute_type_names_;
     state = state_;
     owner = owner_;
     name = name_;
     license_type = license_type_;
     description = description_;
     created = created_;
     application_id = application_id_;
   }
    : work_space_application)

let make_describe_applications_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : limit option) ?owner:(owner_ : work_space_application_owner option)
    ?operating_system_names:(operating_system_names_ : operating_system_name_list option)
    ?license_type:(license_type_ : work_space_application_license_type option)
    ?compute_type_names:(compute_type_names_ : compute_list option)
    ?application_ids:(application_ids_ : work_space_application_id_list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     owner = owner_;
     operating_system_names = operating_system_names_;
     license_type = license_type_;
     compute_type_names = compute_type_names_;
     application_ids = application_ids_;
   }
    : describe_applications_request)

let make_application_resource_association
    ?state_reason:(state_reason_ : association_state_reason option)
    ?state:(state_ : association_state option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?created:(created_ : timestamp option)
    ?associated_resource_type:
      (associated_resource_type_ : application_associated_resource_type option)
    ?associated_resource_id:(associated_resource_id_ : non_empty_string option)
    ?application_id:(application_id_ : work_space_application_id option) () =
  ({
     state_reason = state_reason_;
     state = state_;
     last_updated_time = last_updated_time_;
     created = created_;
     associated_resource_type = associated_resource_type_;
     associated_resource_id = associated_resource_id_;
     application_id = application_id_;
   }
    : application_resource_association)

let make_describe_application_associations_request
    ?next_token:(next_token_ : pagination_token option) ?max_results:(max_results_ : limit option)
    ~associated_resource_types:
      (associated_resource_types_ : application_associated_resource_type_list)
    ~application_id:(application_id_ : work_space_application_id) () =
  ({
     associated_resource_types = associated_resource_types_;
     application_id = application_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_application_associations_request)

let make_account_modification ?error_message:(error_message_ : description option)
    ?error_code:(error_code_ : workspace_error_code option)
    ?start_time:(start_time_ : timestamp option)
    ?dedicated_tenancy_management_cidr_range:
      (dedicated_tenancy_management_cidr_range_ : dedicated_tenancy_management_cidr_range option)
    ?dedicated_tenancy_support:
      (dedicated_tenancy_support_ : dedicated_tenancy_support_result_enum option)
    ?modification_state:(modification_state_ : dedicated_tenancy_modification_state_enum option) ()
    =
  ({
     error_message = error_message_;
     error_code = error_code_;
     start_time = start_time_;
     dedicated_tenancy_management_cidr_range = dedicated_tenancy_management_cidr_range_;
     dedicated_tenancy_support = dedicated_tenancy_support_;
     modification_state = modification_state_;
   }
    : account_modification)

let make_describe_account_modifications_request ?next_token:(next_token_ : pagination_token option)
    () =
  ({ next_token = next_token_ } : describe_account_modifications_request)

let make_describe_account_request () = (() : unit)

let make_deregister_workspace_directory_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : deregister_workspace_directory_request)

let make_work_space_application_deployment
    ?associations:(associations_ : workspace_resource_association_list option) () =
  ({ associations = associations_ } : work_space_application_deployment)

let make_deploy_workspace_applications_request ?force:(force_ : boolean_object option)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ force = force_; workspace_id = workspace_id_ } : deploy_workspace_applications_request)

let make_delete_workspace_image_request ~image_id:(image_id_ : workspace_image_id) () =
  ({ image_id = image_id_ } : delete_workspace_image_request)

let make_delete_workspace_bundle_request ?bundle_id:(bundle_id_ : bundle_id option) () =
  ({ bundle_id = bundle_id_ } : delete_workspace_bundle_request)

let make_delete_tags_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_id:(resource_id_ : non_empty_string) () =
  ({ tag_keys = tag_keys_; resource_id = resource_id_ } : delete_tags_request)

let make_delete_ip_group_request ~group_id:(group_id_ : ip_group_id) () =
  ({ group_id = group_id_ } : delete_ip_group_request)

let make_delete_connection_alias_request ~alias_id:(alias_id_ : connection_alias_id) () =
  ({ alias_id = alias_id_ } : delete_connection_alias_request)

let make_delete_connect_client_add_in_request ~resource_id:(resource_id_ : directory_id)
    ~add_in_id:(add_in_id_ : amazon_uuid) () =
  ({ resource_id = resource_id_; add_in_id = add_in_id_ } : delete_connect_client_add_in_request)

let make_delete_client_branding_request ~platforms:(platforms_ : client_device_type_list)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ platforms = platforms_; resource_id = resource_id_ } : delete_client_branding_request)

let make_delete_account_link_invitation_request ?client_token:(client_token_ : client_token option)
    ~link_id:(link_id_ : link_id) () =
  ({ client_token = client_token_; link_id = link_id_ } : delete_account_link_invitation_request)

let make_create_workspaces_pool_request ?running_mode:(running_mode_ : pools_running_mode option)
    ?timeout_settings:(timeout_settings_ : timeout_settings option)
    ?application_settings:(application_settings_ : application_settings_request option)
    ?tags:(tags_ : tag_list option) ~capacity:(capacity_ : capacity)
    ~directory_id:(directory_id_ : directory_id) ~bundle_id:(bundle_id_ : bundle_id)
    ~description:(description_ : update_description) ~pool_name:(pool_name_ : workspaces_pool_name)
    () =
  ({
     running_mode = running_mode_;
     timeout_settings = timeout_settings_;
     application_settings = application_settings_;
     tags = tags_;
     capacity = capacity_;
     directory_id = directory_id_;
     bundle_id = bundle_id_;
     description = description_;
     pool_name = pool_name_;
   }
    : create_workspaces_pool_request)

let make_workspace_request ?ipv6_address:(ipv6_address_ : ipv6_address option)
    ?workspace_name:(workspace_name_ : workspace_name option) ?tags:(tags_ : tag_list option)
    ?workspace_properties:(workspace_properties_ : workspace_properties option)
    ?root_volume_encryption_enabled:(root_volume_encryption_enabled_ : boolean_object option)
    ?user_volume_encryption_enabled:(user_volume_encryption_enabled_ : boolean_object option)
    ?volume_encryption_key:(volume_encryption_key_ : volume_encryption_key option)
    ~bundle_id:(bundle_id_ : bundle_id) ~user_name:(user_name_ : user_name)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     ipv6_address = ipv6_address_;
     workspace_name = workspace_name_;
     tags = tags_;
     workspace_properties = workspace_properties_;
     root_volume_encryption_enabled = root_volume_encryption_enabled_;
     user_volume_encryption_enabled = user_volume_encryption_enabled_;
     volume_encryption_key = volume_encryption_key_;
     bundle_id = bundle_id_;
     user_name = user_name_;
     directory_id = directory_id_;
   }
    : workspace_request)

let make_failed_create_workspace_request ?error_message:(error_message_ : description option)
    ?error_code:(error_code_ : error_type option)
    ?workspace_request:(workspace_request_ : workspace_request option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     workspace_request = workspace_request_;
   }
    : failed_create_workspace_request)

let make_create_workspaces_request ~workspaces:(workspaces_ : workspace_request_list) () =
  ({ workspaces = workspaces_ } : create_workspaces_request)

let make_create_workspace_image_request ?tags:(tags_ : tag_list option)
    ~workspace_id:(workspace_id_ : workspace_id)
    ~description:(description_ : workspace_image_description) ~name:(name_ : workspace_image_name)
    () =
  ({ tags = tags_; workspace_id = workspace_id_; description = description_; name = name_ }
    : create_workspace_image_request)

let make_create_workspace_bundle_request ?tags:(tags_ : tag_list option)
    ?root_storage:(root_storage_ : root_storage option) ~user_storage:(user_storage_ : user_storage)
    ~compute_type:(compute_type_ : compute_type) ~image_id:(image_id_ : workspace_image_id)
    ~bundle_description:(bundle_description_ : workspace_bundle_description)
    ~bundle_name:(bundle_name_ : workspace_bundle_name) () =
  ({
     tags = tags_;
     root_storage = root_storage_;
     user_storage = user_storage_;
     compute_type = compute_type_;
     image_id = image_id_;
     bundle_description = bundle_description_;
     bundle_name = bundle_name_;
   }
    : create_workspace_bundle_request)

let make_create_updated_workspace_image_request ?tags:(tags_ : tag_list option)
    ~source_image_id:(source_image_id_ : workspace_image_id)
    ~description:(description_ : workspace_image_description) ~name:(name_ : workspace_image_name)
    () =
  ({ tags = tags_; source_image_id = source_image_id_; description = description_; name = name_ }
    : create_updated_workspace_image_request)

let make_create_tags_request ~tags:(tags_ : tag_list) ~resource_id:(resource_id_ : non_empty_string)
    () =
  ({ tags = tags_; resource_id = resource_id_ } : create_tags_request)

let make_standby_workspace ?data_replication:(data_replication_ : data_replication option)
    ?tags:(tags_ : tag_list option)
    ?volume_encryption_key:(volume_encryption_key_ : volume_encryption_key option)
    ~directory_id:(directory_id_ : directory_id)
    ~primary_workspace_id:(primary_workspace_id_ : workspace_id) () =
  ({
     data_replication = data_replication_;
     tags = tags_;
     directory_id = directory_id_;
     volume_encryption_key = volume_encryption_key_;
     primary_workspace_id = primary_workspace_id_;
   }
    : standby_workspace)

let make_failed_create_standby_workspaces_request
    ?error_message:(error_message_ : description option)
    ?error_code:(error_code_ : workspace_error_code option)
    ?standby_workspace_request:(standby_workspace_request_ : standby_workspace option) () =
  ({
     error_message = error_message_;
     error_code = error_code_;
     standby_workspace_request = standby_workspace_request_;
   }
    : failed_create_standby_workspaces_request)

let make_pending_create_standby_workspaces_request
    ?workspace_id:(workspace_id_ : workspace_id option) ?state:(state_ : workspace_state option)
    ?directory_id:(directory_id_ : directory_id option) ?user_name:(user_name_ : user_name option)
    () =
  ({
     workspace_id = workspace_id_;
     state = state_;
     directory_id = directory_id_;
     user_name = user_name_;
   }
    : pending_create_standby_workspaces_request)

let make_create_standby_workspaces_request
    ~standby_workspaces:(standby_workspaces_ : standby_workspaces_list)
    ~primary_region:(primary_region_ : region) () =
  ({ standby_workspaces = standby_workspaces_; primary_region = primary_region_ }
    : create_standby_workspaces_request)

let make_create_ip_group_request ?tags:(tags_ : tag_list option)
    ?user_rules:(user_rules_ : ip_rule_list option) ?group_desc:(group_desc_ : ip_group_desc option)
    ~group_name:(group_name_ : ip_group_name) () =
  ({ tags = tags_; user_rules = user_rules_; group_desc = group_desc_; group_name = group_name_ }
    : create_ip_group_request)

let make_create_connection_alias_request ?tags:(tags_ : tag_list option)
    ~connection_string:(connection_string_ : connection_string) () =
  ({ tags = tags_; connection_string = connection_string_ } : create_connection_alias_request)

let make_create_connect_client_add_in_request ~ur_l:(ur_l_ : add_in_url) ~name:(name_ : add_in_name)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ ur_l = ur_l_; name = name_; resource_id = resource_id_ }
    : create_connect_client_add_in_request)

let make_create_account_link_invitation_request ?client_token:(client_token_ : client_token option)
    ~target_account_id:(target_account_id_ : aws_account) () =
  ({ client_token = client_token_; target_account_id = target_account_id_ }
    : create_account_link_invitation_request)

let make_copy_workspace_image_request ?tags:(tags_ : tag_list option)
    ?description:(description_ : workspace_image_description option)
    ~source_region:(source_region_ : region)
    ~source_image_id:(source_image_id_ : workspace_image_id) ~name:(name_ : workspace_image_name) ()
    =
  ({
     tags = tags_;
     source_region = source_region_;
     source_image_id = source_image_id_;
     description = description_;
     name = name_;
   }
    : copy_workspace_image_request)

let make_authorize_ip_rules_request ~user_rules:(user_rules_ : ip_rule_list)
    ~group_id:(group_id_ : ip_group_id) () =
  ({ user_rules = user_rules_; group_id = group_id_ } : authorize_ip_rules_request)

let make_associate_workspace_application_request
    ~application_id:(application_id_ : work_space_application_id)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ application_id = application_id_; workspace_id = workspace_id_ }
    : associate_workspace_application_request)

let make_associate_ip_groups_request ~group_ids:(group_ids_ : ip_group_id_list)
    ~directory_id:(directory_id_ : directory_id) () =
  ({ group_ids = group_ids_; directory_id = directory_id_ } : associate_ip_groups_request)

let make_associate_connection_alias_request ~resource_id:(resource_id_ : non_empty_string)
    ~alias_id:(alias_id_ : connection_alias_id) () =
  ({ resource_id = resource_id_; alias_id = alias_id_ } : associate_connection_alias_request)

let make_accept_account_link_invitation_request ?client_token:(client_token_ : client_token option)
    ~link_id:(link_id_ : link_id) () =
  ({ client_token = client_token_; link_id = link_id_ } : accept_account_link_invitation_request)
