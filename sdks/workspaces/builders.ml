open Types

let make_account_link ?account_link_id:(account_link_id_ : link_id option)
    ?account_link_status:(account_link_status_ : account_link_status_enum option)
    ?source_account_id:(source_account_id_ : aws_account option)
    ?target_account_id:(target_account_id_ : aws_account option) () =
  ({
     account_link_id = account_link_id_;
     account_link_status = account_link_status_;
     source_account_id = source_account_id_;
     target_account_id = target_account_id_;
   }
    : account_link)

let make_accept_account_link_invitation_request ?client_token:(client_token_ : client_token option)
    ~link_id:(link_id_ : link_id) () =
  ({ link_id = link_id_; client_token = client_token_ } : accept_account_link_invitation_request)

let make_access_endpoint ?access_endpoint_type:(access_endpoint_type_ : access_endpoint_type option)
    ?vpc_endpoint_id:(vpc_endpoint_id_ : alphanumeric_dash_underscore_non_empty_string option) () =
  ({ access_endpoint_type = access_endpoint_type_; vpc_endpoint_id = vpc_endpoint_id_ }
    : access_endpoint)

let make_access_endpoint_config
    ?internet_fallback_protocols:
      (internet_fallback_protocols_ : internet_fallback_protocol_list option)
    ~access_endpoints:(access_endpoints_ : access_endpoint_list) () =
  ({
     access_endpoints = access_endpoints_;
     internet_fallback_protocols = internet_fallback_protocols_;
   }
    : access_endpoint_config)

let make_account_modification
    ?modification_state:(modification_state_ : dedicated_tenancy_modification_state_enum option)
    ?dedicated_tenancy_support:
      (dedicated_tenancy_support_ : dedicated_tenancy_support_result_enum option)
    ?dedicated_tenancy_management_cidr_range:
      (dedicated_tenancy_management_cidr_range_ : dedicated_tenancy_management_cidr_range option)
    ?start_time:(start_time_ : timestamp option)
    ?error_code:(error_code_ : workspace_error_code option)
    ?error_message:(error_message_ : description option) () =
  ({
     modification_state = modification_state_;
     dedicated_tenancy_support = dedicated_tenancy_support_;
     dedicated_tenancy_management_cidr_range = dedicated_tenancy_management_cidr_range_;
     start_time = start_time_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : account_modification)

let make_active_directory_config ~domain_name:(domain_name_ : domain_name)
    ~service_account_secret_arn:(service_account_secret_arn_ : secrets_manager_arn) () =
  ({ domain_name = domain_name_; service_account_secret_arn = service_account_secret_arn_ }
    : active_directory_config)

let make_association_state_reason ?error_code:(error_code_ : association_error_code option)
    ?error_message:(error_message_ : string2048 option) () =
  ({ error_code = error_code_; error_message = error_message_ } : association_state_reason)

let make_application_resource_association
    ?application_id:(application_id_ : work_space_application_id option)
    ?associated_resource_id:(associated_resource_id_ : non_empty_string option)
    ?associated_resource_type:
      (associated_resource_type_ : application_associated_resource_type option)
    ?created:(created_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?state:(state_ : association_state option)
    ?state_reason:(state_reason_ : association_state_reason option) () =
  ({
     application_id = application_id_;
     associated_resource_id = associated_resource_id_;
     associated_resource_type = associated_resource_type_;
     created = created_;
     last_updated_time = last_updated_time_;
     state = state_;
     state_reason = state_reason_;
   }
    : application_resource_association)

let make_application_settings_request ?settings_group:(settings_group_ : settings_group option)
    ~status:(status_ : application_settings_status_enum) () =
  ({ status = status_; settings_group = settings_group_ } : application_settings_request)

let make_application_settings_response ?settings_group:(settings_group_ : settings_group option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ~status:(status_ : application_settings_status_enum) () =
  ({ status = status_; settings_group = settings_group_; s3_bucket_name = s3_bucket_name_ }
    : application_settings_response)

let make_associate_connection_alias_request ~alias_id:(alias_id_ : connection_alias_id)
    ~resource_id:(resource_id_ : non_empty_string) () =
  ({ alias_id = alias_id_; resource_id = resource_id_ } : associate_connection_alias_request)

let make_associate_ip_groups_request ~directory_id:(directory_id_ : directory_id)
    ~group_ids:(group_ids_ : ip_group_id_list) () =
  ({ directory_id = directory_id_; group_ids = group_ids_ } : associate_ip_groups_request)

let make_workspace_resource_association
    ?associated_resource_id:(associated_resource_id_ : non_empty_string option)
    ?associated_resource_type:
      (associated_resource_type_ : work_space_associated_resource_type option)
    ?created:(created_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?state:(state_ : association_state option)
    ?state_reason:(state_reason_ : association_state_reason option)
    ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({
     associated_resource_id = associated_resource_id_;
     associated_resource_type = associated_resource_type_;
     created = created_;
     last_updated_time = last_updated_time_;
     state = state_;
     state_reason = state_reason_;
     workspace_id = workspace_id_;
   }
    : workspace_resource_association)

let make_associate_workspace_application_request ~workspace_id:(workspace_id_ : workspace_id)
    ~application_id:(application_id_ : work_space_application_id) () =
  ({ workspace_id = workspace_id_; application_id = application_id_ }
    : associate_workspace_application_request)

let make_ip_rule_item ?ip_rule:(ip_rule_ : ip_rule option)
    ?rule_desc:(rule_desc_ : ip_rule_desc option) () =
  ({ ip_rule = ip_rule_; rule_desc = rule_desc_ } : ip_rule_item)

let make_authorize_ip_rules_request ~group_id:(group_id_ : ip_group_id)
    ~user_rules:(user_rules_ : ip_rule_list) () =
  ({ group_id = group_id_; user_rules = user_rules_ } : authorize_ip_rules_request)

let make_compute_type ?name:(name_ : compute option) () = ({ name = name_ } : compute_type)

let make_user_storage ~capacity:(capacity_ : non_empty_string) () =
  ({ capacity = capacity_ } : user_storage)

let make_root_storage ~capacity:(capacity_ : non_empty_string) () =
  ({ capacity = capacity_ } : root_storage)

let make_workspace_bundle ?bundle_id:(bundle_id_ : bundle_id option)
    ?name:(name_ : non_empty_string option) ?owner:(owner_ : bundle_owner option)
    ?description:(description_ : description option)
    ?image_id:(image_id_ : workspace_image_id option)
    ?root_storage:(root_storage_ : root_storage option)
    ?user_storage:(user_storage_ : user_storage option)
    ?compute_type:(compute_type_ : compute_type option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?state:(state_ : workspace_bundle_state option) ?bundle_type:(bundle_type_ : bundle_type option)
    () =
  ({
     bundle_id = bundle_id_;
     name = name_;
     owner = owner_;
     description = description_;
     image_id = image_id_;
     root_storage = root_storage_;
     user_storage = user_storage_;
     compute_type = compute_type_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     state = state_;
     bundle_type = bundle_type_;
   }
    : workspace_bundle)

let make_bundle_resource_association
    ?associated_resource_id:(associated_resource_id_ : non_empty_string option)
    ?associated_resource_type:(associated_resource_type_ : bundle_associated_resource_type option)
    ?bundle_id:(bundle_id_ : bundle_id option) ?created:(created_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?state:(state_ : association_state option)
    ?state_reason:(state_reason_ : association_state_reason option) () =
  ({
     associated_resource_id = associated_resource_id_;
     associated_resource_type = associated_resource_type_;
     bundle_id = bundle_id_;
     created = created_;
     last_updated_time = last_updated_time_;
     state = state_;
     state_reason = state_reason_;
   }
    : bundle_resource_association)

let make_capacity ~desired_user_sessions:(desired_user_sessions_ : desired_user_sessions) () =
  ({ desired_user_sessions = desired_user_sessions_ } : capacity)

let make_capacity_status
    ~available_user_sessions:(available_user_sessions_ : available_user_sessions)
    ~desired_user_sessions:(desired_user_sessions_ : desired_user_sessions)
    ~actual_user_sessions:(actual_user_sessions_ : actual_user_sessions)
    ~active_user_sessions:(active_user_sessions_ : active_user_sessions) () =
  ({
     available_user_sessions = available_user_sessions_;
     desired_user_sessions = desired_user_sessions_;
     actual_user_sessions = actual_user_sessions_;
     active_user_sessions = active_user_sessions_;
   }
    : capacity_status)

let make_certificate_based_auth_properties
    ?status:(status_ : certificate_based_auth_status_enum option)
    ?certificate_authority_arn:(certificate_authority_arn_ : certificate_authority_arn option) () =
  ({ status = status_; certificate_authority_arn = certificate_authority_arn_ }
    : certificate_based_auth_properties)

let make_client_properties ?reconnect_enabled:(reconnect_enabled_ : reconnect_enum option)
    ?log_upload_enabled:(log_upload_enabled_ : log_upload_enum option) () =
  ({ reconnect_enabled = reconnect_enabled_; log_upload_enabled = log_upload_enabled_ }
    : client_properties)

let make_connect_client_add_in ?add_in_id:(add_in_id_ : amazon_uuid option)
    ?resource_id:(resource_id_ : directory_id option) ?name:(name_ : add_in_name option)
    ?ur_l:(ur_l_ : add_in_url option) () =
  ({ add_in_id = add_in_id_; resource_id = resource_id_; name = name_; ur_l = ur_l_ }
    : connect_client_add_in)

let make_connection_alias_association
    ?association_status:(association_status_ : association_status option)
    ?associated_account_id:(associated_account_id_ : aws_account option)
    ?resource_id:(resource_id_ : non_empty_string option)
    ?connection_identifier:(connection_identifier_ : connection_identifier option) () =
  ({
     association_status = association_status_;
     associated_account_id = associated_account_id_;
     resource_id = resource_id_;
     connection_identifier = connection_identifier_;
   }
    : connection_alias_association)

let make_connection_alias ?connection_string:(connection_string_ : connection_string option)
    ?alias_id:(alias_id_ : connection_alias_id option)
    ?state:(state_ : connection_alias_state option)
    ?owner_account_id:(owner_account_id_ : aws_account option)
    ?associations:(associations_ : connection_alias_association_list option) () =
  ({
     connection_string = connection_string_;
     alias_id = alias_id_;
     state = state_;
     owner_account_id = owner_account_id_;
     associations = associations_;
   }
    : connection_alias)

let make_connection_alias_permission ~shared_account_id:(shared_account_id_ : aws_account)
    ~allow_association:(allow_association_ : boolean_object) () =
  ({ shared_account_id = shared_account_id_; allow_association = allow_association_ }
    : connection_alias_permission)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_copy_workspace_image_request
    ?description:(description_ : workspace_image_description option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : workspace_image_name) ~source_image_id:(source_image_id_ : workspace_image_id)
    ~source_region:(source_region_ : region) () =
  ({
     name = name_;
     description = description_;
     source_image_id = source_image_id_;
     source_region = source_region_;
     tags = tags_;
   }
    : copy_workspace_image_request)

let make_create_account_link_invitation_request ?client_token:(client_token_ : client_token option)
    ~target_account_id:(target_account_id_ : aws_account) () =
  ({ target_account_id = target_account_id_; client_token = client_token_ }
    : create_account_link_invitation_request)

let make_create_connect_client_add_in_request ~resource_id:(resource_id_ : directory_id)
    ~name:(name_ : add_in_name) ~ur_l:(ur_l_ : add_in_url) () =
  ({ resource_id = resource_id_; name = name_; ur_l = ur_l_ }
    : create_connect_client_add_in_request)

let make_create_connection_alias_request ?tags:(tags_ : tag_list option)
    ~connection_string:(connection_string_ : connection_string) () =
  ({ connection_string = connection_string_; tags = tags_ } : create_connection_alias_request)

let make_create_ip_group_request ?group_desc:(group_desc_ : ip_group_desc option)
    ?user_rules:(user_rules_ : ip_rule_list option) ?tags:(tags_ : tag_list option)
    ~group_name:(group_name_ : ip_group_name) () =
  ({ group_name = group_name_; group_desc = group_desc_; user_rules = user_rules_; tags = tags_ }
    : create_ip_group_request)

let make_pending_create_standby_workspaces_request ?user_name:(user_name_ : user_name option)
    ?directory_id:(directory_id_ : directory_id option) ?state:(state_ : workspace_state option)
    ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({
     user_name = user_name_;
     directory_id = directory_id_;
     state = state_;
     workspace_id = workspace_id_;
   }
    : pending_create_standby_workspaces_request)

let make_standby_workspace
    ?volume_encryption_key:(volume_encryption_key_ : volume_encryption_key option)
    ?tags:(tags_ : tag_list option) ?data_replication:(data_replication_ : data_replication option)
    ~primary_workspace_id:(primary_workspace_id_ : workspace_id)
    ~directory_id:(directory_id_ : directory_id) () =
  ({
     primary_workspace_id = primary_workspace_id_;
     volume_encryption_key = volume_encryption_key_;
     directory_id = directory_id_;
     tags = tags_;
     data_replication = data_replication_;
   }
    : standby_workspace)

let make_failed_create_standby_workspaces_request
    ?standby_workspace_request:(standby_workspace_request_ : standby_workspace option)
    ?error_code:(error_code_ : workspace_error_code option)
    ?error_message:(error_message_ : description option) () =
  ({
     standby_workspace_request = standby_workspace_request_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : failed_create_standby_workspaces_request)

let make_create_standby_workspaces_request ~primary_region:(primary_region_ : region)
    ~standby_workspaces:(standby_workspaces_ : standby_workspaces_list) () =
  ({ primary_region = primary_region_; standby_workspaces = standby_workspaces_ }
    : create_standby_workspaces_request)

let make_create_tags_request ~resource_id:(resource_id_ : non_empty_string) ~tags:(tags_ : tag_list)
    () =
  ({ resource_id = resource_id_; tags = tags_ } : create_tags_request)

let make_create_updated_workspace_image_request ?tags:(tags_ : tag_list option)
    ~name:(name_ : workspace_image_name) ~description:(description_ : workspace_image_description)
    ~source_image_id:(source_image_id_ : workspace_image_id) () =
  ({ name = name_; description = description_; source_image_id = source_image_id_; tags = tags_ }
    : create_updated_workspace_image_request)

let make_create_workspace_bundle_request ?root_storage:(root_storage_ : root_storage option)
    ?tags:(tags_ : tag_list option) ~bundle_name:(bundle_name_ : workspace_bundle_name)
    ~bundle_description:(bundle_description_ : workspace_bundle_description)
    ~image_id:(image_id_ : workspace_image_id) ~compute_type:(compute_type_ : compute_type)
    ~user_storage:(user_storage_ : user_storage) () =
  ({
     bundle_name = bundle_name_;
     bundle_description = bundle_description_;
     image_id = image_id_;
     compute_type = compute_type_;
     user_storage = user_storage_;
     root_storage = root_storage_;
     tags = tags_;
   }
    : create_workspace_bundle_request)

let make_operating_system ?type_:(type__ : operating_system_type option) () =
  ({ type_ = type__ } : operating_system)

let make_create_workspace_image_request ?tags:(tags_ : tag_list option)
    ~name:(name_ : workspace_image_name) ~description:(description_ : workspace_image_description)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ name = name_; description = description_; workspace_id = workspace_id_; tags = tags_ }
    : create_workspace_image_request)

let make_standby_workspaces_properties
    ?standby_workspace_id:(standby_workspace_id_ : workspace_id option)
    ?data_replication:(data_replication_ : data_replication option)
    ?recovery_snapshot_time:(recovery_snapshot_time_ : timestamp option) () =
  ({
     standby_workspace_id = standby_workspace_id_;
     data_replication = data_replication_;
     recovery_snapshot_time = recovery_snapshot_time_;
   }
    : standby_workspaces_properties)

let make_data_replication_settings ?data_replication:(data_replication_ : data_replication option)
    ?recovery_snapshot_time:(recovery_snapshot_time_ : timestamp option) () =
  ({ data_replication = data_replication_; recovery_snapshot_time = recovery_snapshot_time_ }
    : data_replication_settings)

let make_related_workspace_properties ?workspace_id:(workspace_id_ : workspace_id option)
    ?region:(region_ : region option) ?state:(state_ : workspace_state option)
    ?type_:(type__ : standby_workspace_relationship_type option) () =
  ({ workspace_id = workspace_id_; region = region_; state = state_; type_ = type__ }
    : related_workspace_properties)

let make_modification_state ?resource:(resource_ : modification_resource_enum option)
    ?state:(state_ : modification_state_enum option) () =
  ({ resource = resource_; state = state_ } : modification_state)

let make_global_accelerator_for_work_space
    ?preferred_protocol:(preferred_protocol_ : aga_preferred_protocol_for_work_space option)
    ~mode:(mode_ : aga_mode_for_work_space_enum) () =
  ({ mode = mode_; preferred_protocol = preferred_protocol_ } : global_accelerator_for_work_space)

let make_workspace_properties ?running_mode:(running_mode_ : running_mode option)
    ?running_mode_auto_stop_timeout_in_minutes:
      (running_mode_auto_stop_timeout_in_minutes_ : running_mode_auto_stop_timeout_in_minutes option)
    ?root_volume_size_gib:(root_volume_size_gib_ : root_volume_size_gib option)
    ?user_volume_size_gib:(user_volume_size_gib_ : user_volume_size_gib option)
    ?compute_type_name:(compute_type_name_ : compute option)
    ?protocols:(protocols_ : protocol_list option)
    ?operating_system_name:(operating_system_name_ : operating_system_name option)
    ?global_accelerator:(global_accelerator_ : global_accelerator_for_work_space option) () =
  ({
     running_mode = running_mode_;
     running_mode_auto_stop_timeout_in_minutes = running_mode_auto_stop_timeout_in_minutes_;
     root_volume_size_gib = root_volume_size_gib_;
     user_volume_size_gib = user_volume_size_gib_;
     compute_type_name = compute_type_name_;
     protocols = protocols_;
     operating_system_name = operating_system_name_;
     global_accelerator = global_accelerator_;
   }
    : workspace_properties)

let make_workspace ?workspace_id:(workspace_id_ : workspace_id option)
    ?directory_id:(directory_id_ : directory_id option) ?user_name:(user_name_ : user_name option)
    ?ip_address:(ip_address_ : ip_address option)
    ?ipv6_address:(ipv6_address_ : ipv6_address option) ?state:(state_ : workspace_state option)
    ?bundle_id:(bundle_id_ : bundle_id option) ?subnet_id:(subnet_id_ : subnet_id option)
    ?error_message:(error_message_ : description option)
    ?error_code:(error_code_ : workspace_error_code option)
    ?computer_name:(computer_name_ : computer_name option)
    ?volume_encryption_key:(volume_encryption_key_ : volume_encryption_key option)
    ?user_volume_encryption_enabled:(user_volume_encryption_enabled_ : boolean_object option)
    ?root_volume_encryption_enabled:(root_volume_encryption_enabled_ : boolean_object option)
    ?workspace_name:(workspace_name_ : workspace_name option)
    ?workspace_properties:(workspace_properties_ : workspace_properties option)
    ?modification_states:(modification_states_ : modification_state_list option)
    ?related_workspaces:(related_workspaces_ : related_workspaces option)
    ?data_replication_settings:(data_replication_settings_ : data_replication_settings option)
    ?standby_workspaces_properties:
      (standby_workspaces_properties_ : standby_workspaces_properties_list option) () =
  ({
     workspace_id = workspace_id_;
     directory_id = directory_id_;
     user_name = user_name_;
     ip_address = ip_address_;
     ipv6_address = ipv6_address_;
     state = state_;
     bundle_id = bundle_id_;
     subnet_id = subnet_id_;
     error_message = error_message_;
     error_code = error_code_;
     computer_name = computer_name_;
     volume_encryption_key = volume_encryption_key_;
     user_volume_encryption_enabled = user_volume_encryption_enabled_;
     root_volume_encryption_enabled = root_volume_encryption_enabled_;
     workspace_name = workspace_name_;
     workspace_properties = workspace_properties_;
     modification_states = modification_states_;
     related_workspaces = related_workspaces_;
     data_replication_settings = data_replication_settings_;
     standby_workspaces_properties = standby_workspaces_properties_;
   }
    : workspace)

let make_workspace_request
    ?volume_encryption_key:(volume_encryption_key_ : volume_encryption_key option)
    ?user_volume_encryption_enabled:(user_volume_encryption_enabled_ : boolean_object option)
    ?root_volume_encryption_enabled:(root_volume_encryption_enabled_ : boolean_object option)
    ?workspace_properties:(workspace_properties_ : workspace_properties option)
    ?tags:(tags_ : tag_list option) ?workspace_name:(workspace_name_ : workspace_name option)
    ?ipv6_address:(ipv6_address_ : ipv6_address option) ~directory_id:(directory_id_ : directory_id)
    ~user_name:(user_name_ : user_name) ~bundle_id:(bundle_id_ : bundle_id) () =
  ({
     directory_id = directory_id_;
     user_name = user_name_;
     bundle_id = bundle_id_;
     volume_encryption_key = volume_encryption_key_;
     user_volume_encryption_enabled = user_volume_encryption_enabled_;
     root_volume_encryption_enabled = root_volume_encryption_enabled_;
     workspace_properties = workspace_properties_;
     tags = tags_;
     workspace_name = workspace_name_;
     ipv6_address = ipv6_address_;
   }
    : workspace_request)

let make_failed_create_workspace_request
    ?workspace_request:(workspace_request_ : workspace_request option)
    ?error_code:(error_code_ : error_type option)
    ?error_message:(error_message_ : description option) () =
  ({
     workspace_request = workspace_request_;
     error_code = error_code_;
     error_message = error_message_;
   }
    : failed_create_workspace_request)

let make_create_workspaces_request ~workspaces:(workspaces_ : workspace_request_list) () =
  ({ workspaces = workspaces_ } : create_workspaces_request)

let make_timeout_settings
    ?disconnect_timeout_in_seconds:
      (disconnect_timeout_in_seconds_ : disconnect_timeout_in_seconds option)
    ?idle_disconnect_timeout_in_seconds:
      (idle_disconnect_timeout_in_seconds_ : idle_disconnect_timeout_in_seconds option)
    ?max_user_duration_in_seconds:
      (max_user_duration_in_seconds_ : max_user_duration_in_seconds option) () =
  ({
     disconnect_timeout_in_seconds = disconnect_timeout_in_seconds_;
     idle_disconnect_timeout_in_seconds = idle_disconnect_timeout_in_seconds_;
     max_user_duration_in_seconds = max_user_duration_in_seconds_;
   }
    : timeout_settings)

let make_workspaces_pool_error ?error_code:(error_code_ : workspaces_pool_error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ error_code = error_code_; error_message = error_message_ } : workspaces_pool_error)

let make_workspaces_pool ?description:(description_ : update_description option)
    ?errors:(errors_ : workspaces_pool_errors option)
    ?application_settings:(application_settings_ : application_settings_response option)
    ?timeout_settings:(timeout_settings_ : timeout_settings option)
    ~pool_id:(pool_id_ : workspaces_pool_id) ~pool_arn:(pool_arn_ : ar_n)
    ~capacity_status:(capacity_status_ : capacity_status)
    ~pool_name:(pool_name_ : workspaces_pool_name) ~state:(state_ : workspaces_pool_state)
    ~created_at:(created_at_ : timestamp) ~bundle_id:(bundle_id_ : bundle_id)
    ~directory_id:(directory_id_ : directory_id) ~running_mode:(running_mode_ : pools_running_mode)
    () =
  ({
     pool_id = pool_id_;
     pool_arn = pool_arn_;
     capacity_status = capacity_status_;
     pool_name = pool_name_;
     description = description_;
     state = state_;
     created_at = created_at_;
     bundle_id = bundle_id_;
     directory_id = directory_id_;
     errors = errors_;
     application_settings = application_settings_;
     timeout_settings = timeout_settings_;
     running_mode = running_mode_;
   }
    : workspaces_pool)

let make_create_workspaces_pool_request ?tags:(tags_ : tag_list option)
    ?application_settings:(application_settings_ : application_settings_request option)
    ?timeout_settings:(timeout_settings_ : timeout_settings option)
    ?running_mode:(running_mode_ : pools_running_mode option)
    ~pool_name:(pool_name_ : workspaces_pool_name) ~description:(description_ : update_description)
    ~bundle_id:(bundle_id_ : bundle_id) ~directory_id:(directory_id_ : directory_id)
    ~capacity:(capacity_ : capacity) () =
  ({
     pool_name = pool_name_;
     description = description_;
     bundle_id = bundle_id_;
     directory_id = directory_id_;
     capacity = capacity_;
     tags = tags_;
     application_settings = application_settings_;
     timeout_settings = timeout_settings_;
     running_mode = running_mode_;
   }
    : create_workspaces_pool_request)

let make_custom_workspace_image_import_error_details ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : image_error_message option) () =
  ({ error_code = error_code_; error_message = error_message_ }
    : custom_workspace_image_import_error_details)

let make_default_client_branding_attributes ?logo_url:(logo_url_ : client_url option)
    ?support_email:(support_email_ : client_email option)
    ?support_link:(support_link_ : client_url option)
    ?forgot_password_link:(forgot_password_link_ : client_url option)
    ?login_message:(login_message_ : login_message option) () =
  ({
     logo_url = logo_url_;
     support_email = support_email_;
     support_link = support_link_;
     forgot_password_link = forgot_password_link_;
     login_message = login_message_;
   }
    : default_client_branding_attributes)

let make_default_import_client_branding_attributes ?logo:(logo_ : default_logo option)
    ?support_email:(support_email_ : client_email option)
    ?support_link:(support_link_ : client_url option)
    ?forgot_password_link:(forgot_password_link_ : client_url option)
    ?login_message:(login_message_ : login_message option) () =
  ({
     logo = logo_;
     support_email = support_email_;
     support_link = support_link_;
     forgot_password_link = forgot_password_link_;
     login_message = login_message_;
   }
    : default_import_client_branding_attributes)

let make_default_workspace_creation_properties
    ?enable_internet_access:(enable_internet_access_ : boolean_object option)
    ?default_ou:(default_ou_ : default_ou option)
    ?custom_security_group_id:(custom_security_group_id_ : security_group_id option)
    ?user_enabled_as_local_administrator:
      (user_enabled_as_local_administrator_ : boolean_object option)
    ?enable_maintenance_mode:(enable_maintenance_mode_ : boolean_object option)
    ?instance_iam_role_arn:(instance_iam_role_arn_ : ar_n option) () =
  ({
     enable_internet_access = enable_internet_access_;
     default_ou = default_ou_;
     custom_security_group_id = custom_security_group_id_;
     user_enabled_as_local_administrator = user_enabled_as_local_administrator_;
     enable_maintenance_mode = enable_maintenance_mode_;
     instance_iam_role_arn = instance_iam_role_arn_;
   }
    : default_workspace_creation_properties)

let make_delete_account_link_invitation_request ?client_token:(client_token_ : client_token option)
    ~link_id:(link_id_ : link_id) () =
  ({ link_id = link_id_; client_token = client_token_ } : delete_account_link_invitation_request)

let make_delete_client_branding_request ~resource_id:(resource_id_ : directory_id)
    ~platforms:(platforms_ : client_device_type_list) () =
  ({ resource_id = resource_id_; platforms = platforms_ } : delete_client_branding_request)

let make_delete_connect_client_add_in_request ~add_in_id:(add_in_id_ : amazon_uuid)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ add_in_id = add_in_id_; resource_id = resource_id_ } : delete_connect_client_add_in_request)

let make_delete_connection_alias_request ~alias_id:(alias_id_ : connection_alias_id) () =
  ({ alias_id = alias_id_ } : delete_connection_alias_request)

let make_delete_ip_group_request ~group_id:(group_id_ : ip_group_id) () =
  ({ group_id = group_id_ } : delete_ip_group_request)

let make_delete_tags_request ~resource_id:(resource_id_ : non_empty_string)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_id = resource_id_; tag_keys = tag_keys_ } : delete_tags_request)

let make_delete_workspace_bundle_request ?bundle_id:(bundle_id_ : bundle_id option) () =
  ({ bundle_id = bundle_id_ } : delete_workspace_bundle_request)

let make_delete_workspace_image_request ~image_id:(image_id_ : workspace_image_id) () =
  ({ image_id = image_id_ } : delete_workspace_image_request)

let make_work_space_application_deployment
    ?associations:(associations_ : workspace_resource_association_list option) () =
  ({ associations = associations_ } : work_space_application_deployment)

let make_deploy_workspace_applications_request ?force:(force_ : boolean_object option)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_; force = force_ } : deploy_workspace_applications_request)

let make_deregister_workspace_directory_request ~directory_id:(directory_id_ : directory_id) () =
  ({ directory_id = directory_id_ } : deregister_workspace_directory_request)

let make_describe_account_request () = (() : unit)

let make_describe_account_modifications_request ?next_token:(next_token_ : pagination_token option)
    () =
  ({ next_token = next_token_ } : describe_account_modifications_request)

let make_describe_application_associations_request ?max_results:(max_results_ : limit option)
    ?next_token:(next_token_ : pagination_token option)
    ~application_id:(application_id_ : work_space_application_id)
    ~associated_resource_types:
      (associated_resource_types_ : application_associated_resource_type_list) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     application_id = application_id_;
     associated_resource_types = associated_resource_types_;
   }
    : describe_application_associations_request)

let make_work_space_application ?application_id:(application_id_ : work_space_application_id option)
    ?created:(created_ : timestamp option) ?description:(description_ : string2048 option)
    ?license_type:(license_type_ : work_space_application_license_type option)
    ?name:(name_ : non_empty_string option) ?owner:(owner_ : work_space_application_owner option)
    ?state:(state_ : work_space_application_state option)
    ?supported_compute_type_names:(supported_compute_type_names_ : compute_list option)
    ?supported_operating_system_names:
      (supported_operating_system_names_ : operating_system_name_list option) () =
  ({
     application_id = application_id_;
     created = created_;
     description = description_;
     license_type = license_type_;
     name = name_;
     owner = owner_;
     state = state_;
     supported_compute_type_names = supported_compute_type_names_;
     supported_operating_system_names = supported_operating_system_names_;
   }
    : work_space_application)

let make_describe_applications_request
    ?application_ids:(application_ids_ : work_space_application_id_list option)
    ?compute_type_names:(compute_type_names_ : compute_list option)
    ?license_type:(license_type_ : work_space_application_license_type option)
    ?operating_system_names:(operating_system_names_ : operating_system_name_list option)
    ?owner:(owner_ : work_space_application_owner option) ?max_results:(max_results_ : limit option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     application_ids = application_ids_;
     compute_type_names = compute_type_names_;
     license_type = license_type_;
     operating_system_names = operating_system_names_;
     owner = owner_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_applications_request)

let make_describe_bundle_associations_request ~bundle_id:(bundle_id_ : bundle_id)
    ~associated_resource_types:(associated_resource_types_ : bundle_associated_resource_type_list)
    () =
  ({ bundle_id = bundle_id_; associated_resource_types = associated_resource_types_ }
    : describe_bundle_associations_request)

let make_ios_client_branding_attributes ?logo_url:(logo_url_ : client_url option)
    ?logo2x_url:(logo2x_url_ : client_url option) ?logo3x_url:(logo3x_url_ : client_url option)
    ?support_email:(support_email_ : client_email option)
    ?support_link:(support_link_ : client_url option)
    ?forgot_password_link:(forgot_password_link_ : client_url option)
    ?login_message:(login_message_ : login_message option) () =
  ({
     logo_url = logo_url_;
     logo2x_url = logo2x_url_;
     logo3x_url = logo3x_url_;
     support_email = support_email_;
     support_link = support_link_;
     forgot_password_link = forgot_password_link_;
     login_message = login_message_;
   }
    : ios_client_branding_attributes)

let make_describe_client_branding_request ~resource_id:(resource_id_ : directory_id) () =
  ({ resource_id = resource_id_ } : describe_client_branding_request)

let make_describe_client_properties_request ~resource_ids:(resource_ids_ : resource_id_list) () =
  ({ resource_ids = resource_ids_ } : describe_client_properties_request)

let make_describe_connect_client_add_ins_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : limit option) ~resource_id:(resource_id_ : directory_id) () =
  ({ resource_id = resource_id_; next_token = next_token_; max_results = max_results_ }
    : describe_connect_client_add_ins_request)

let make_describe_connection_alias_permissions_request
    ?next_token:(next_token_ : pagination_token option) ?max_results:(max_results_ : limit option)
    ~alias_id:(alias_id_ : connection_alias_id) () =
  ({ alias_id = alias_id_; next_token = next_token_; max_results = max_results_ }
    : describe_connection_alias_permissions_request)

let make_describe_connection_aliases_request
    ?alias_ids:(alias_ids_ : connection_alias_id_list option)
    ?resource_id:(resource_id_ : non_empty_string option) ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ alias_ids = alias_ids_; resource_id = resource_id_; limit = limit_; next_token = next_token_ }
    : describe_connection_aliases_request)

let make_describe_custom_workspace_image_import_request ~image_id:(image_id_ : workspace_image_id)
    () =
  ({ image_id = image_id_ } : describe_custom_workspace_image_import_request)

let make_image_resource_association
    ?associated_resource_id:(associated_resource_id_ : non_empty_string option)
    ?associated_resource_type:(associated_resource_type_ : image_associated_resource_type option)
    ?created:(created_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option)
    ?image_id:(image_id_ : workspace_image_id option) ?state:(state_ : association_state option)
    ?state_reason:(state_reason_ : association_state_reason option) () =
  ({
     associated_resource_id = associated_resource_id_;
     associated_resource_type = associated_resource_type_;
     created = created_;
     last_updated_time = last_updated_time_;
     image_id = image_id_;
     state = state_;
     state_reason = state_reason_;
   }
    : image_resource_association)

let make_describe_image_associations_request ~image_id:(image_id_ : workspace_image_id)
    ~associated_resource_types:(associated_resource_types_ : image_associated_resource_type_list) ()
    =
  ({ image_id = image_id_; associated_resource_types = associated_resource_types_ }
    : describe_image_associations_request)

let make_workspaces_ip_group ?group_id:(group_id_ : ip_group_id option)
    ?group_name:(group_name_ : ip_group_name option)
    ?group_desc:(group_desc_ : ip_group_desc option) ?user_rules:(user_rules_ : ip_rule_list option)
    () =
  ({
     group_id = group_id_;
     group_name = group_name_;
     group_desc = group_desc_;
     user_rules = user_rules_;
   }
    : workspaces_ip_group)

let make_describe_ip_groups_request ?group_ids:(group_ids_ : ip_group_id_list option)
    ?next_token:(next_token_ : pagination_token option) ?max_results:(max_results_ : limit option)
    () =
  ({ group_ids = group_ids_; next_token = next_token_; max_results = max_results_ }
    : describe_ip_groups_request)

let make_describe_tags_request ~resource_id:(resource_id_ : non_empty_string) () =
  ({ resource_id = resource_id_ } : describe_tags_request)

let make_describe_workspace_associations_request ~workspace_id:(workspace_id_ : workspace_id)
    ~associated_resource_types:
      (associated_resource_types_ : work_space_associated_resource_type_list) () =
  ({ workspace_id = workspace_id_; associated_resource_types = associated_resource_types_ }
    : describe_workspace_associations_request)

let make_describe_workspace_bundles_request ?bundle_ids:(bundle_ids_ : bundle_id_list option)
    ?owner:(owner_ : bundle_owner option) ?next_token:(next_token_ : pagination_token option) () =
  ({ bundle_ids = bundle_ids_; owner = owner_; next_token = next_token_ }
    : describe_workspace_bundles_request)

let make_global_accelerator_for_directory
    ?preferred_protocol:(preferred_protocol_ : aga_preferred_protocol_for_directory option)
    ~mode:(mode_ : aga_mode_for_directory_enum) () =
  ({ mode = mode_; preferred_protocol = preferred_protocol_ } : global_accelerator_for_directory)

let make_storage_connector ~connector_type:(connector_type_ : storage_connector_type_enum)
    ~status:(status_ : storage_connector_status_enum) () =
  ({ connector_type = connector_type_; status = status_ } : storage_connector)

let make_user_setting ?maximum_length:(maximum_length_ : maximum_length option)
    ~action:(action_ : user_setting_action_enum)
    ~permission:(permission_ : user_setting_permission_enum) () =
  ({ action = action_; permission = permission_; maximum_length = maximum_length_ } : user_setting)

let make_streaming_properties
    ?streaming_experience_preferred_protocol:
      (streaming_experience_preferred_protocol_ :
         streaming_experience_preferred_protocol_enum option)
    ?user_settings:(user_settings_ : user_settings option)
    ?storage_connectors:(storage_connectors_ : storage_connectors option)
    ?global_accelerator:(global_accelerator_ : global_accelerator_for_directory option) () =
  ({
     streaming_experience_preferred_protocol = streaming_experience_preferred_protocol_;
     user_settings = user_settings_;
     storage_connectors = storage_connectors_;
     global_accelerator = global_accelerator_;
   }
    : streaming_properties)

let make_idc_config ?instance_arn:(instance_arn_ : ar_n option)
    ?application_arn:(application_arn_ : ar_n option) () =
  ({ instance_arn = instance_arn_; application_arn = application_arn_ } : idc_config)

let make_microsoft_entra_config ?tenant_id:(tenant_id_ : microsoft_entra_config_tenant_id option)
    ?application_config_secret_arn:(application_config_secret_arn_ : secrets_manager_arn option) ()
    =
  ({ tenant_id = tenant_id_; application_config_secret_arn = application_config_secret_arn_ }
    : microsoft_entra_config)

let make_saml_properties ?status:(status_ : saml_status_enum option)
    ?user_access_url:(user_access_url_ : saml_user_access_url option)
    ?relay_state_parameter_name:(relay_state_parameter_name_ : non_empty_string option) () =
  ({
     status = status_;
     user_access_url = user_access_url_;
     relay_state_parameter_name = relay_state_parameter_name_;
   }
    : saml_properties)

let make_selfservice_permissions ?restart_workspace:(restart_workspace_ : reconnect_enum option)
    ?increase_volume_size:(increase_volume_size_ : reconnect_enum option)
    ?change_compute_type:(change_compute_type_ : reconnect_enum option)
    ?switch_running_mode:(switch_running_mode_ : reconnect_enum option)
    ?rebuild_workspace:(rebuild_workspace_ : reconnect_enum option) () =
  ({
     restart_workspace = restart_workspace_;
     increase_volume_size = increase_volume_size_;
     change_compute_type = change_compute_type_;
     switch_running_mode = switch_running_mode_;
     rebuild_workspace = rebuild_workspace_;
   }
    : selfservice_permissions)

let make_workspace_access_properties
    ?device_type_windows:(device_type_windows_ : access_property_value option)
    ?device_type_osx:(device_type_osx_ : access_property_value option)
    ?device_type_web:(device_type_web_ : access_property_value option)
    ?device_type_ios:(device_type_ios_ : access_property_value option)
    ?device_type_android:(device_type_android_ : access_property_value option)
    ?device_type_chrome_os:(device_type_chrome_os_ : access_property_value option)
    ?device_type_zero_client:(device_type_zero_client_ : access_property_value option)
    ?device_type_linux:(device_type_linux_ : access_property_value option)
    ?device_type_work_spaces_thin_client:
      (device_type_work_spaces_thin_client_ : access_property_value option)
    ?access_endpoint_config:(access_endpoint_config_ : access_endpoint_config option) () =
  ({
     device_type_windows = device_type_windows_;
     device_type_osx = device_type_osx_;
     device_type_web = device_type_web_;
     device_type_ios = device_type_ios_;
     device_type_android = device_type_android_;
     device_type_chrome_os = device_type_chrome_os_;
     device_type_zero_client = device_type_zero_client_;
     device_type_linux = device_type_linux_;
     device_type_work_spaces_thin_client = device_type_work_spaces_thin_client_;
     access_endpoint_config = access_endpoint_config_;
   }
    : workspace_access_properties)

let make_workspace_directory ?directory_id:(directory_id_ : directory_id option)
    ?alias:(alias_ : alias option) ?directory_name:(directory_name_ : directory_name option)
    ?registration_code:(registration_code_ : registration_code option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?dns_ip_addresses:(dns_ip_addresses_ : dns_ip_addresses option)
    ?dns_ipv6_addresses:(dns_ipv6_addresses_ : dns_ipv6_addresses option)
    ?customer_user_name:(customer_user_name_ : user_name option)
    ?iam_role_id:(iam_role_id_ : ar_n option)
    ?directory_type:(directory_type_ : workspace_directory_type option)
    ?workspace_security_group_id:(workspace_security_group_id_ : security_group_id option)
    ?state:(state_ : workspace_directory_state option)
    ?workspace_creation_properties:
      (workspace_creation_properties_ : default_workspace_creation_properties option)
    ?ip_group_ids:(ip_group_ids_ : ip_group_id_list option)
    ?workspace_access_properties:(workspace_access_properties_ : workspace_access_properties option)
    ?tenancy:(tenancy_ : tenancy option)
    ?selfservice_permissions:(selfservice_permissions_ : selfservice_permissions option)
    ?saml_properties:(saml_properties_ : saml_properties option)
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ?endpoint_encryption_mode:(endpoint_encryption_mode_ : endpoint_encryption_mode option)
    ?microsoft_entra_config:(microsoft_entra_config_ : microsoft_entra_config option)
    ?workspace_directory_name:(workspace_directory_name_ : workspace_directory_name option)
    ?workspace_directory_description:
      (workspace_directory_description_ : workspace_directory_description option)
    ?user_identity_type:(user_identity_type_ : user_identity_type option)
    ?workspace_type:(workspace_type_ : workspace_type option)
    ?idc_config:(idc_config_ : idc_config option)
    ?active_directory_config:(active_directory_config_ : active_directory_config option)
    ?streaming_properties:(streaming_properties_ : streaming_properties option)
    ?error_message:(error_message_ : description option) () =
  ({
     directory_id = directory_id_;
     alias = alias_;
     directory_name = directory_name_;
     registration_code = registration_code_;
     subnet_ids = subnet_ids_;
     dns_ip_addresses = dns_ip_addresses_;
     dns_ipv6_addresses = dns_ipv6_addresses_;
     customer_user_name = customer_user_name_;
     iam_role_id = iam_role_id_;
     directory_type = directory_type_;
     workspace_security_group_id = workspace_security_group_id_;
     state = state_;
     workspace_creation_properties = workspace_creation_properties_;
     ip_group_ids = ip_group_ids_;
     workspace_access_properties = workspace_access_properties_;
     tenancy = tenancy_;
     selfservice_permissions = selfservice_permissions_;
     saml_properties = saml_properties_;
     certificate_based_auth_properties = certificate_based_auth_properties_;
     endpoint_encryption_mode = endpoint_encryption_mode_;
     microsoft_entra_config = microsoft_entra_config_;
     workspace_directory_name = workspace_directory_name_;
     workspace_directory_description = workspace_directory_description_;
     user_identity_type = user_identity_type_;
     workspace_type = workspace_type_;
     idc_config = idc_config_;
     active_directory_config = active_directory_config_;
     streaming_properties = streaming_properties_;
     error_message = error_message_;
   }
    : workspace_directory)

let make_describe_workspace_directories_filter
    ~name:(name_ : describe_workspace_directories_filter_name)
    ~values:(values_ : describe_workspace_directories_filter_values) () =
  ({ name = name_; values = values_ } : describe_workspace_directories_filter)

let make_describe_workspace_directories_request
    ?directory_ids:(directory_ids_ : directory_id_list option)
    ?workspace_directory_names:(workspace_directory_names_ : workspace_directory_name_list option)
    ?limit:(limit_ : limit option) ?next_token:(next_token_ : pagination_token option)
    ?filters:(filters_ : describe_workspace_directories_filter_list option) () =
  ({
     directory_ids = directory_ids_;
     workspace_directory_names = workspace_directory_names_;
     limit = limit_;
     next_token = next_token_;
     filters = filters_;
   }
    : describe_workspace_directories_request)

let make_image_permission ?shared_account_id:(shared_account_id_ : aws_account option) () =
  ({ shared_account_id = shared_account_id_ } : image_permission)

let make_describe_workspace_image_permissions_request
    ?next_token:(next_token_ : pagination_token option) ?max_results:(max_results_ : limit option)
    ~image_id:(image_id_ : workspace_image_id) () =
  ({ image_id = image_id_; next_token = next_token_; max_results = max_results_ }
    : describe_workspace_image_permissions_request)

let make_error_details ?error_code:(error_code_ : workspace_image_error_detail_code option)
    ?error_message:(error_message_ : description option) () =
  ({ error_code = error_code_; error_message = error_message_ } : error_details)

let make_workspace_image ?image_id:(image_id_ : workspace_image_id option)
    ?name:(name_ : workspace_image_name option)
    ?description:(description_ : workspace_image_description option)
    ?operating_system:(operating_system_ : operating_system option)
    ?state:(state_ : workspace_image_state option)
    ?required_tenancy:(required_tenancy_ : workspace_image_required_tenancy option)
    ?error_code:(error_code_ : workspace_image_error_code option)
    ?error_message:(error_message_ : description option) ?created:(created_ : timestamp option)
    ?owner_account_id:(owner_account_id_ : aws_account option)
    ?updates:(updates_ : update_result option)
    ?error_details:(error_details_ : error_details_list option) () =
  ({
     image_id = image_id_;
     name = name_;
     description = description_;
     operating_system = operating_system_;
     state = state_;
     required_tenancy = required_tenancy_;
     error_code = error_code_;
     error_message = error_message_;
     created = created_;
     owner_account_id = owner_account_id_;
     updates = updates_;
     error_details = error_details_;
   }
    : workspace_image)

let make_describe_workspace_images_request ?image_ids:(image_ids_ : workspace_image_id_list option)
    ?image_type:(image_type_ : image_type option)
    ?next_token:(next_token_ : pagination_token option) ?max_results:(max_results_ : limit option)
    () =
  ({
     image_ids = image_ids_;
     image_type = image_type_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_workspace_images_request)

let make_snapshot ?snapshot_time:(snapshot_time_ : timestamp option) () =
  ({ snapshot_time = snapshot_time_ } : snapshot)

let make_describe_workspace_snapshots_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : describe_workspace_snapshots_request)

let make_describe_workspaces_request ?workspace_ids:(workspace_ids_ : workspace_id_list option)
    ?directory_id:(directory_id_ : directory_id option) ?user_name:(user_name_ : user_name option)
    ?bundle_id:(bundle_id_ : bundle_id option) ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : pagination_token option)
    ?workspace_name:(workspace_name_ : workspace_name option) () =
  ({
     workspace_ids = workspace_ids_;
     directory_id = directory_id_;
     user_name = user_name_;
     bundle_id = bundle_id_;
     limit = limit_;
     next_token = next_token_;
     workspace_name = workspace_name_;
   }
    : describe_workspaces_request)

let make_workspace_connection_status ?workspace_id:(workspace_id_ : workspace_id option)
    ?connection_state:(connection_state_ : connection_state option)
    ?connection_state_check_timestamp:(connection_state_check_timestamp_ : timestamp option)
    ?last_known_user_connection_timestamp:(last_known_user_connection_timestamp_ : timestamp option)
    () =
  ({
     workspace_id = workspace_id_;
     connection_state = connection_state_;
     connection_state_check_timestamp = connection_state_check_timestamp_;
     last_known_user_connection_timestamp = last_known_user_connection_timestamp_;
   }
    : workspace_connection_status)

let make_describe_workspaces_connection_status_request
    ?workspace_ids:(workspace_ids_ : workspace_id_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ workspace_ids = workspace_ids_; next_token = next_token_ }
    : describe_workspaces_connection_status_request)

let make_network_access_configuration
    ?eni_private_ip_address:(eni_private_ip_address_ : non_empty_string option)
    ?eni_id:(eni_id_ : non_empty_string option) () =
  ({ eni_private_ip_address = eni_private_ip_address_; eni_id = eni_id_ }
    : network_access_configuration)

let make_workspaces_pool_session
    ?authentication_type:(authentication_type_ : authentication_type option)
    ?connection_state:(connection_state_ : session_connection_state option)
    ?instance_id:(instance_id_ : session_instance_id option)
    ?expiration_time:(expiration_time_ : timestamp option)
    ?network_access_configuration:
      (network_access_configuration_ : network_access_configuration option)
    ?start_time:(start_time_ : timestamp option) ~session_id:(session_id_ : amazon_uuid)
    ~pool_id:(pool_id_ : workspaces_pool_id) ~user_id:(user_id_ : workspaces_pool_user_id) () =
  ({
     authentication_type = authentication_type_;
     connection_state = connection_state_;
     session_id = session_id_;
     instance_id = instance_id_;
     pool_id = pool_id_;
     expiration_time = expiration_time_;
     network_access_configuration = network_access_configuration_;
     start_time = start_time_;
     user_id = user_id_;
   }
    : workspaces_pool_session)

let make_describe_workspaces_pool_sessions_request
    ?user_id:(user_id_ : workspaces_pool_user_id option) ?limit:(limit_ : limit50 option)
    ?next_token:(next_token_ : pagination_token option) ~pool_id:(pool_id_ : workspaces_pool_id) ()
    =
  ({ pool_id = pool_id_; user_id = user_id_; limit = limit_; next_token = next_token_ }
    : describe_workspaces_pool_sessions_request)

let make_describe_workspaces_pools_filter ~name:(name_ : describe_workspaces_pools_filter_name)
    ~values:(values_ : describe_workspaces_pools_filter_values)
    ~operator:(operator_ : describe_workspaces_pools_filter_operator) () =
  ({ name = name_; values = values_; operator = operator_ } : describe_workspaces_pools_filter)

let make_describe_workspaces_pools_request ?pool_ids:(pool_ids_ : workspaces_pool_ids option)
    ?filters:(filters_ : describe_workspaces_pools_filters option) ?limit:(limit_ : limit option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ pool_ids = pool_ids_; filters = filters_; limit = limit_; next_token = next_token_ }
    : describe_workspaces_pools_request)

let make_disassociate_connection_alias_request ~alias_id:(alias_id_ : connection_alias_id) () =
  ({ alias_id = alias_id_ } : disassociate_connection_alias_request)

let make_disassociate_ip_groups_request ~directory_id:(directory_id_ : directory_id)
    ~group_ids:(group_ids_ : ip_group_id_list) () =
  ({ directory_id = directory_id_; group_ids = group_ids_ } : disassociate_ip_groups_request)

let make_disassociate_workspace_application_request ~workspace_id:(workspace_id_ : workspace_id)
    ~application_id:(application_id_ : work_space_application_id) () =
  ({ workspace_id = workspace_id_; application_id = application_id_ }
    : disassociate_workspace_application_request)

let make_failed_workspace_change_request ?workspace_id:(workspace_id_ : workspace_id option)
    ?error_code:(error_code_ : error_type option)
    ?error_message:(error_message_ : description option) () =
  ({ workspace_id = workspace_id_; error_code = error_code_; error_message = error_message_ }
    : failed_workspace_change_request)

let make_get_account_link_request ?link_id:(link_id_ : link_id option)
    ?linked_account_id:(linked_account_id_ : aws_account option) () =
  ({ link_id = link_id_; linked_account_id = linked_account_id_ } : get_account_link_request)

let make_ios_import_client_branding_attributes ?logo:(logo_ : ios_logo option)
    ?logo2x:(logo2x_ : ios2_x_logo option) ?logo3x:(logo3x_ : ios3_x_logo option)
    ?support_email:(support_email_ : client_email option)
    ?support_link:(support_link_ : client_url option)
    ?forgot_password_link:(forgot_password_link_ : client_url option)
    ?login_message:(login_message_ : login_message option) () =
  ({
     logo = logo_;
     logo2x = logo2x_;
     logo3x = logo3x_;
     support_email = support_email_;
     support_link = support_link_;
     forgot_password_link = forgot_password_link_;
     login_message = login_message_;
   }
    : ios_import_client_branding_attributes)

let make_import_client_branding_request
    ?device_type_windows:(device_type_windows_ : default_import_client_branding_attributes option)
    ?device_type_osx:(device_type_osx_ : default_import_client_branding_attributes option)
    ?device_type_android:(device_type_android_ : default_import_client_branding_attributes option)
    ?device_type_ios:(device_type_ios_ : ios_import_client_branding_attributes option)
    ?device_type_linux:(device_type_linux_ : default_import_client_branding_attributes option)
    ?device_type_web:(device_type_web_ : default_import_client_branding_attributes option)
    ~resource_id:(resource_id_ : directory_id) () =
  ({
     resource_id = resource_id_;
     device_type_windows = device_type_windows_;
     device_type_osx = device_type_osx_;
     device_type_android = device_type_android_;
     device_type_ios = device_type_ios_;
     device_type_linux = device_type_linux_;
     device_type_web = device_type_web_;
   }
    : import_client_branding_request)

let make_import_custom_workspace_image_request ?tags:(tags_ : tag_list option)
    ~image_name:(image_name_ : workspace_image_name)
    ~image_description:(image_description_ : workspace_image_description)
    ~compute_type:(compute_type_ : image_compute_type) ~protocol:(protocol_ : custom_image_protocol)
    ~image_source:(image_source_ : image_source_identifier)
    ~infrastructure_configuration_arn:
      (infrastructure_configuration_arn_ : infrastructure_configuration_arn)
    ~platform:(platform_ : platform) ~os_version:(os_version_ : os_version) () =
  ({
     image_name = image_name_;
     image_description = image_description_;
     compute_type = compute_type_;
     protocol = protocol_;
     image_source = image_source_;
     infrastructure_configuration_arn = infrastructure_configuration_arn_;
     platform = platform_;
     os_version = os_version_;
     tags = tags_;
   }
    : import_custom_workspace_image_request)

let make_import_workspace_image_request ?tags:(tags_ : tag_list option)
    ?applications:(applications_ : application_list option)
    ~ec2_image_id:(ec2_image_id_ : ec2_image_id)
    ~ingestion_process:(ingestion_process_ : workspace_image_ingestion_process)
    ~image_name:(image_name_ : workspace_image_name)
    ~image_description:(image_description_ : workspace_image_description) () =
  ({
     ec2_image_id = ec2_image_id_;
     ingestion_process = ingestion_process_;
     image_name = image_name_;
     image_description = image_description_;
     tags = tags_;
     applications = applications_;
   }
    : import_workspace_image_request)

let make_list_account_links_request
    ?link_status_filter:(link_status_filter_ : link_status_filter_list option)
    ?next_token:(next_token_ : pagination_token option) ?max_results:(max_results_ : limit option)
    () =
  ({
     link_status_filter = link_status_filter_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_account_links_request)

let make_list_available_management_cidr_ranges_request
    ?max_results:(max_results_ : management_cidr_range_max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~management_cidr_range_constraint:
      (management_cidr_range_constraint_ : management_cidr_range_constraint) () =
  ({
     management_cidr_range_constraint = management_cidr_range_constraint_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_available_management_cidr_ranges_request)

let make_migrate_workspace_request ~source_workspace_id:(source_workspace_id_ : workspace_id)
    ~bundle_id:(bundle_id_ : bundle_id) () =
  ({ source_workspace_id = source_workspace_id_; bundle_id = bundle_id_ }
    : migrate_workspace_request)

let make_modify_account_request
    ?dedicated_tenancy_support:(dedicated_tenancy_support_ : dedicated_tenancy_support_enum option)
    ?dedicated_tenancy_management_cidr_range:
      (dedicated_tenancy_management_cidr_range_ : dedicated_tenancy_management_cidr_range option) ()
    =
  ({
     dedicated_tenancy_support = dedicated_tenancy_support_;
     dedicated_tenancy_management_cidr_range = dedicated_tenancy_management_cidr_range_;
   }
    : modify_account_request)

let make_modify_certificate_based_auth_properties_request
    ?certificate_based_auth_properties:
      (certificate_based_auth_properties_ : certificate_based_auth_properties option)
    ?properties_to_delete:
      (properties_to_delete_ : deletable_certificate_based_auth_properties_list option)
    ~resource_id:(resource_id_ : directory_id) () =
  ({
     resource_id = resource_id_;
     certificate_based_auth_properties = certificate_based_auth_properties_;
     properties_to_delete = properties_to_delete_;
   }
    : modify_certificate_based_auth_properties_request)

let make_modify_client_properties_request ~resource_id:(resource_id_ : non_empty_string)
    ~client_properties:(client_properties_ : client_properties) () =
  ({ resource_id = resource_id_; client_properties = client_properties_ }
    : modify_client_properties_request)

let make_modify_endpoint_encryption_mode_response () = (() : unit)

let make_modify_endpoint_encryption_mode_request ~directory_id:(directory_id_ : directory_id)
    ~endpoint_encryption_mode:(endpoint_encryption_mode_ : endpoint_encryption_mode) () =
  ({ directory_id = directory_id_; endpoint_encryption_mode = endpoint_encryption_mode_ }
    : modify_endpoint_encryption_mode_request)

let make_modify_saml_properties_request ?saml_properties:(saml_properties_ : saml_properties option)
    ?properties_to_delete:(properties_to_delete_ : deletable_saml_properties_list option)
    ~resource_id:(resource_id_ : directory_id) () =
  ({
     resource_id = resource_id_;
     saml_properties = saml_properties_;
     properties_to_delete = properties_to_delete_;
   }
    : modify_saml_properties_request)

let make_modify_selfservice_permissions_request ~resource_id:(resource_id_ : directory_id)
    ~selfservice_permissions:(selfservice_permissions_ : selfservice_permissions) () =
  ({ resource_id = resource_id_; selfservice_permissions = selfservice_permissions_ }
    : modify_selfservice_permissions_request)

let make_modify_streaming_properties_request
    ?streaming_properties:(streaming_properties_ : streaming_properties option)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ resource_id = resource_id_; streaming_properties = streaming_properties_ }
    : modify_streaming_properties_request)

let make_modify_workspace_access_properties_request ~resource_id:(resource_id_ : directory_id)
    ~workspace_access_properties:(workspace_access_properties_ : workspace_access_properties) () =
  ({ resource_id = resource_id_; workspace_access_properties = workspace_access_properties_ }
    : modify_workspace_access_properties_request)

let make_workspace_creation_properties
    ?enable_internet_access:(enable_internet_access_ : boolean_object option)
    ?default_ou:(default_ou_ : default_ou option)
    ?custom_security_group_id:(custom_security_group_id_ : security_group_id option)
    ?user_enabled_as_local_administrator:
      (user_enabled_as_local_administrator_ : boolean_object option)
    ?enable_maintenance_mode:(enable_maintenance_mode_ : boolean_object option)
    ?instance_iam_role_arn:(instance_iam_role_arn_ : ar_n option) () =
  ({
     enable_internet_access = enable_internet_access_;
     default_ou = default_ou_;
     custom_security_group_id = custom_security_group_id_;
     user_enabled_as_local_administrator = user_enabled_as_local_administrator_;
     enable_maintenance_mode = enable_maintenance_mode_;
     instance_iam_role_arn = instance_iam_role_arn_;
   }
    : workspace_creation_properties)

let make_modify_workspace_creation_properties_request ~resource_id:(resource_id_ : directory_id)
    ~workspace_creation_properties:(workspace_creation_properties_ : workspace_creation_properties)
    () =
  ({ resource_id = resource_id_; workspace_creation_properties = workspace_creation_properties_ }
    : modify_workspace_creation_properties_request)

let make_modify_workspace_properties_request
    ?workspace_properties:(workspace_properties_ : workspace_properties option)
    ?data_replication:(data_replication_ : data_replication option)
    ~workspace_id:(workspace_id_ : workspace_id) () =
  ({
     workspace_id = workspace_id_;
     workspace_properties = workspace_properties_;
     data_replication = data_replication_;
   }
    : modify_workspace_properties_request)

let make_modify_workspace_state_request ~workspace_id:(workspace_id_ : workspace_id)
    ~workspace_state:(workspace_state_ : target_workspace_state) () =
  ({ workspace_id = workspace_id_; workspace_state = workspace_state_ }
    : modify_workspace_state_request)

let make_reboot_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : reboot_request)

let make_reboot_workspaces_request
    ~reboot_workspace_requests:(reboot_workspace_requests_ : reboot_workspace_requests) () =
  ({ reboot_workspace_requests = reboot_workspace_requests_ } : reboot_workspaces_request)

let make_rebuild_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : rebuild_request)

let make_rebuild_workspaces_request
    ~rebuild_workspace_requests:(rebuild_workspace_requests_ : rebuild_workspace_requests) () =
  ({ rebuild_workspace_requests = rebuild_workspace_requests_ } : rebuild_workspaces_request)

let make_register_workspace_directory_request ?directory_id:(directory_id_ : directory_id option)
    ?subnet_ids:(subnet_ids_ : subnet_ids option)
    ?enable_self_service:(enable_self_service_ : boolean_object option)
    ?tenancy:(tenancy_ : tenancy option) ?tags:(tags_ : tag_list option)
    ?workspace_directory_name:(workspace_directory_name_ : workspace_directory_name option)
    ?workspace_directory_description:
      (workspace_directory_description_ : workspace_directory_description option)
    ?user_identity_type:(user_identity_type_ : user_identity_type option)
    ?idc_instance_arn:(idc_instance_arn_ : ar_n option)
    ?microsoft_entra_config:(microsoft_entra_config_ : microsoft_entra_config option)
    ?workspace_type:(workspace_type_ : workspace_type option)
    ?active_directory_config:(active_directory_config_ : active_directory_config option) () =
  ({
     directory_id = directory_id_;
     subnet_ids = subnet_ids_;
     enable_self_service = enable_self_service_;
     tenancy = tenancy_;
     tags = tags_;
     workspace_directory_name = workspace_directory_name_;
     workspace_directory_description = workspace_directory_description_;
     user_identity_type = user_identity_type_;
     idc_instance_arn = idc_instance_arn_;
     microsoft_entra_config = microsoft_entra_config_;
     workspace_type = workspace_type_;
     active_directory_config = active_directory_config_;
   }
    : register_workspace_directory_request)

let make_reject_account_link_invitation_request ?client_token:(client_token_ : client_token option)
    ~link_id:(link_id_ : link_id) () =
  ({ link_id = link_id_; client_token = client_token_ } : reject_account_link_invitation_request)

let make_restore_workspace_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : restore_workspace_request)

let make_revoke_ip_rules_request ~group_id:(group_id_ : ip_group_id)
    ~user_rules:(user_rules_ : ip_revoked_rule_list) () =
  ({ group_id = group_id_; user_rules = user_rules_ } : revoke_ip_rules_request)

let make_start_request ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({ workspace_id = workspace_id_ } : start_request)

let make_start_workspaces_request
    ~start_workspace_requests:(start_workspace_requests_ : start_workspace_requests) () =
  ({ start_workspace_requests = start_workspace_requests_ } : start_workspaces_request)

let make_start_workspaces_pool_request ~pool_id:(pool_id_ : workspaces_pool_id) () =
  ({ pool_id = pool_id_ } : start_workspaces_pool_request)

let make_stop_request ?workspace_id:(workspace_id_ : workspace_id option) () =
  ({ workspace_id = workspace_id_ } : stop_request)

let make_stop_workspaces_request
    ~stop_workspace_requests:(stop_workspace_requests_ : stop_workspace_requests) () =
  ({ stop_workspace_requests = stop_workspace_requests_ } : stop_workspaces_request)

let make_stop_workspaces_pool_request ~pool_id:(pool_id_ : workspaces_pool_id) () =
  ({ pool_id = pool_id_ } : stop_workspaces_pool_request)

let make_terminate_request ~workspace_id:(workspace_id_ : workspace_id) () =
  ({ workspace_id = workspace_id_ } : terminate_request)

let make_terminate_workspaces_request
    ~terminate_workspace_requests:(terminate_workspace_requests_ : terminate_workspace_requests) ()
    =
  ({ terminate_workspace_requests = terminate_workspace_requests_ } : terminate_workspaces_request)

let make_terminate_workspaces_pool_request ~pool_id:(pool_id_ : workspaces_pool_id) () =
  ({ pool_id = pool_id_ } : terminate_workspaces_pool_request)

let make_terminate_workspaces_pool_session_request ~session_id:(session_id_ : amazon_uuid) () =
  ({ session_id = session_id_ } : terminate_workspaces_pool_session_request)

let make_update_connect_client_add_in_request ?name:(name_ : add_in_name option)
    ?ur_l:(ur_l_ : add_in_url option) ~add_in_id:(add_in_id_ : amazon_uuid)
    ~resource_id:(resource_id_ : directory_id) () =
  ({ add_in_id = add_in_id_; resource_id = resource_id_; name = name_; ur_l = ur_l_ }
    : update_connect_client_add_in_request)

let make_update_connection_alias_permission_request ~alias_id:(alias_id_ : connection_alias_id)
    ~connection_alias_permission:(connection_alias_permission_ : connection_alias_permission) () =
  ({ alias_id = alias_id_; connection_alias_permission = connection_alias_permission_ }
    : update_connection_alias_permission_request)

let make_update_rules_of_ip_group_request ~group_id:(group_id_ : ip_group_id)
    ~user_rules:(user_rules_ : ip_rule_list) () =
  ({ group_id = group_id_; user_rules = user_rules_ } : update_rules_of_ip_group_request)

let make_update_workspace_bundle_request ?bundle_id:(bundle_id_ : bundle_id option)
    ?image_id:(image_id_ : workspace_image_id option) () =
  ({ bundle_id = bundle_id_; image_id = image_id_ } : update_workspace_bundle_request)

let make_update_workspace_image_permission_request ~image_id:(image_id_ : workspace_image_id)
    ~allow_copy_image:(allow_copy_image_ : boolean_object)
    ~shared_account_id:(shared_account_id_ : aws_account) () =
  ({
     image_id = image_id_;
     allow_copy_image = allow_copy_image_;
     shared_account_id = shared_account_id_;
   }
    : update_workspace_image_permission_request)

let make_update_workspaces_pool_request ?description:(description_ : update_description option)
    ?bundle_id:(bundle_id_ : bundle_id option) ?directory_id:(directory_id_ : directory_id option)
    ?capacity:(capacity_ : capacity option)
    ?application_settings:(application_settings_ : application_settings_request option)
    ?timeout_settings:(timeout_settings_ : timeout_settings option)
    ?running_mode:(running_mode_ : pools_running_mode option)
    ~pool_id:(pool_id_ : workspaces_pool_id) () =
  ({
     pool_id = pool_id_;
     description = description_;
     bundle_id = bundle_id_;
     directory_id = directory_id_;
     capacity = capacity_;
     application_settings = application_settings_;
     timeout_settings = timeout_settings_;
     running_mode = running_mode_;
   }
    : update_workspaces_pool_request)
