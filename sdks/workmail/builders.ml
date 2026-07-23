open Types

let make_access_control_rule ?name:(name_ : access_control_rule_name option)
    ?effect_:(effect__ : access_control_rule_effect option)
    ?description:(description_ : access_control_rule_description option)
    ?ip_ranges:(ip_ranges_ : ip_range_list option)
    ?not_ip_ranges:(not_ip_ranges_ : ip_range_list option) ?actions:(actions_ : actions_list option)
    ?not_actions:(not_actions_ : actions_list option) ?user_ids:(user_ids_ : user_id_list option)
    ?not_user_ids:(not_user_ids_ : user_id_list option)
    ?date_created:(date_created_ : timestamp option)
    ?date_modified:(date_modified_ : timestamp option)
    ?impersonation_role_ids:(impersonation_role_ids_ : impersonation_role_id_list option)
    ?not_impersonation_role_ids:(not_impersonation_role_ids_ : impersonation_role_id_list option) ()
    =
  ({
     name = name_;
     effect_ = effect__;
     description = description_;
     ip_ranges = ip_ranges_;
     not_ip_ranges = not_ip_ranges_;
     actions = actions_;
     not_actions = not_actions_;
     user_ids = user_ids_;
     not_user_ids = not_user_ids_;
     date_created = date_created_;
     date_modified = date_modified_;
     impersonation_role_ids = impersonation_role_ids_;
     not_impersonation_role_ids = not_impersonation_role_ids_;
   }
    : access_control_rule)

let make_associate_delegate_to_resource_response () = (() : unit)

let make_associate_delegate_to_resource_request
    ~organization_id:(organization_id_ : organization_id)
    ~resource_id:(resource_id_ : entity_identifier) ~entity_id:(entity_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; resource_id = resource_id_; entity_id = entity_id_ }
    : associate_delegate_to_resource_request)

let make_associate_member_to_group_response () = (() : unit)

let make_associate_member_to_group_request ~organization_id:(organization_id_ : organization_id)
    ~group_id:(group_id_ : entity_identifier) ~member_id:(member_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; group_id = group_id_; member_id = member_id_ }
    : associate_member_to_group_request)

let make_assume_impersonation_role_response ?token:(token_ : impersonation_token option)
    ?expires_in:(expires_in_ : expires_in option) () =
  ({ token = token_; expires_in = expires_in_ } : assume_impersonation_role_response)

let make_assume_impersonation_role_request ~organization_id:(organization_id_ : organization_id)
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id) () =
  ({ organization_id = organization_id_; impersonation_role_id = impersonation_role_id_ }
    : assume_impersonation_role_request)

let make_lambda_availability_provider ~lambda_arn:(lambda_arn_ : lambda_arn) () =
  ({ lambda_arn = lambda_arn_ } : lambda_availability_provider)

let make_redacted_ews_availability_provider ?ews_endpoint:(ews_endpoint_ : url option)
    ?ews_username:(ews_username_ : external_user_name option) () =
  ({ ews_endpoint = ews_endpoint_; ews_username = ews_username_ }
    : redacted_ews_availability_provider)

let make_availability_configuration ?domain_name:(domain_name_ : domain_name option)
    ?provider_type:(provider_type_ : availability_provider_type option)
    ?ews_provider:(ews_provider_ : redacted_ews_availability_provider option)
    ?lambda_provider:(lambda_provider_ : lambda_availability_provider option)
    ?date_created:(date_created_ : timestamp option)
    ?date_modified:(date_modified_ : timestamp option) () =
  ({
     domain_name = domain_name_;
     provider_type = provider_type_;
     ews_provider = ews_provider_;
     lambda_provider = lambda_provider_;
     date_created = date_created_;
     date_modified = date_modified_;
   }
    : availability_configuration)

let make_booking_options ?auto_accept_requests:(auto_accept_requests_ : boolean_ option)
    ?auto_decline_recurring_requests:(auto_decline_recurring_requests_ : boolean_ option)
    ?auto_decline_conflicting_requests:(auto_decline_conflicting_requests_ : boolean_ option) () =
  ({
     auto_accept_requests = auto_accept_requests_;
     auto_decline_recurring_requests = auto_decline_recurring_requests_;
     auto_decline_conflicting_requests = auto_decline_conflicting_requests_;
   }
    : booking_options)

let make_cancel_mailbox_export_job_response () = (() : unit)

let make_cancel_mailbox_export_job_request ~client_token:(client_token_ : idempotency_client_token)
    ~job_id:(job_id_ : mailbox_export_job_id) ~organization_id:(organization_id_ : organization_id)
    () =
  ({ client_token = client_token_; job_id = job_id_; organization_id = organization_id_ }
    : cancel_mailbox_export_job_request)

let make_create_alias_response () = (() : unit)

let make_create_alias_request ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : work_mail_identifier) ~alias:(alias_ : email_address) () =
  ({ organization_id = organization_id_; entity_id = entity_id_; alias = alias_ }
    : create_alias_request)

let make_create_availability_configuration_response () = (() : unit)

let make_ews_availability_provider ~ews_endpoint:(ews_endpoint_ : url)
    ~ews_username:(ews_username_ : external_user_name) ~ews_password:(ews_password_ : password) () =
  ({ ews_endpoint = ews_endpoint_; ews_username = ews_username_; ews_password = ews_password_ }
    : ews_availability_provider)

let make_create_availability_configuration_request
    ?client_token:(client_token_ : idempotency_client_token option)
    ?ews_provider:(ews_provider_ : ews_availability_provider option)
    ?lambda_provider:(lambda_provider_ : lambda_availability_provider option)
    ~organization_id:(organization_id_ : organization_id) ~domain_name:(domain_name_ : domain_name)
    () =
  ({
     client_token = client_token_;
     organization_id = organization_id_;
     domain_name = domain_name_;
     ews_provider = ews_provider_;
     lambda_provider = lambda_provider_;
   }
    : create_availability_configuration_request)

let make_create_group_response ?group_id:(group_id_ : work_mail_identifier option) () =
  ({ group_id = group_id_ } : create_group_response)

let make_create_group_request
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ~organization_id:(organization_id_ : organization_id) ~name:(name_ : group_name) () =
  ({
     organization_id = organization_id_;
     name = name_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
   }
    : create_group_request)

let make_create_identity_center_application_response
    ?application_arn:(application_arn_ : application_arn option) () =
  ({ application_arn = application_arn_ } : create_identity_center_application_response)

let make_create_identity_center_application_request
    ?client_token:(client_token_ : idempotency_client_token option)
    ~name:(name_ : identity_center_application_name) ~instance_arn:(instance_arn_ : instance_arn) ()
    =
  ({ name = name_; instance_arn = instance_arn_; client_token = client_token_ }
    : create_identity_center_application_request)

let make_create_impersonation_role_response
    ?impersonation_role_id:(impersonation_role_id_ : impersonation_role_id option) () =
  ({ impersonation_role_id = impersonation_role_id_ } : create_impersonation_role_response)

let make_impersonation_rule ?name:(name_ : impersonation_rule_name option)
    ?description:(description_ : impersonation_rule_description option)
    ?target_users:(target_users_ : target_users option)
    ?not_target_users:(not_target_users_ : target_users option)
    ~impersonation_rule_id:(impersonation_rule_id_ : impersonation_rule_id)
    ~effect_:(effect__ : access_effect) () =
  ({
     impersonation_rule_id = impersonation_rule_id_;
     name = name_;
     description = description_;
     effect_ = effect__;
     target_users = target_users_;
     not_target_users = not_target_users_;
   }
    : impersonation_rule)

let make_create_impersonation_role_request
    ?client_token:(client_token_ : idempotency_client_token option)
    ?description:(description_ : impersonation_role_description option)
    ~organization_id:(organization_id_ : organization_id) ~name:(name_ : impersonation_role_name)
    ~type_:(type__ : impersonation_role_type) ~rules:(rules_ : impersonation_rule_list) () =
  ({
     client_token = client_token_;
     organization_id = organization_id_;
     name = name_;
     type_ = type__;
     description = description_;
     rules = rules_;
   }
    : create_impersonation_role_request)

let make_create_mobile_device_access_rule_response
    ?mobile_device_access_rule_id:
      (mobile_device_access_rule_id_ : mobile_device_access_rule_id option) () =
  ({ mobile_device_access_rule_id = mobile_device_access_rule_id_ }
    : create_mobile_device_access_rule_response)

let make_create_mobile_device_access_rule_request
    ?client_token:(client_token_ : idempotency_client_token option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ?device_types:(device_types_ : device_type_list option)
    ?not_device_types:(not_device_types_ : device_type_list option)
    ?device_models:(device_models_ : device_model_list option)
    ?not_device_models:(not_device_models_ : device_model_list option)
    ?device_operating_systems:(device_operating_systems_ : device_operating_system_list option)
    ?not_device_operating_systems:
      (not_device_operating_systems_ : device_operating_system_list option)
    ?device_user_agents:(device_user_agents_ : device_user_agent_list option)
    ?not_device_user_agents:(not_device_user_agents_ : device_user_agent_list option)
    ~organization_id:(organization_id_ : organization_id)
    ~name:(name_ : mobile_device_access_rule_name)
    ~effect_:(effect__ : mobile_device_access_rule_effect) () =
  ({
     organization_id = organization_id_;
     client_token = client_token_;
     name = name_;
     description = description_;
     effect_ = effect__;
     device_types = device_types_;
     not_device_types = not_device_types_;
     device_models = device_models_;
     not_device_models = not_device_models_;
     device_operating_systems = device_operating_systems_;
     not_device_operating_systems = not_device_operating_systems_;
     device_user_agents = device_user_agents_;
     not_device_user_agents = not_device_user_agents_;
   }
    : create_mobile_device_access_rule_request)

let make_create_organization_response ?organization_id:(organization_id_ : organization_id option)
    () =
  ({ organization_id = organization_id_ } : create_organization_response)

let make_domain ?hosted_zone_id:(hosted_zone_id_ : hosted_zone_id option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ domain_name = domain_name_; hosted_zone_id = hosted_zone_id_ } : domain)

let make_create_organization_request ?directory_id:(directory_id_ : directory_id option)
    ?client_token:(client_token_ : idempotency_client_token option)
    ?domains:(domains_ : domains option) ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?enable_interoperability:(enable_interoperability_ : boolean_ option)
    ~alias:(alias_ : organization_name) () =
  ({
     directory_id = directory_id_;
     alias = alias_;
     client_token = client_token_;
     domains = domains_;
     kms_key_arn = kms_key_arn_;
     enable_interoperability = enable_interoperability_;
   }
    : create_organization_request)

let make_create_resource_response ?resource_id:(resource_id_ : resource_id option) () =
  ({ resource_id = resource_id_ } : create_resource_response)

let make_create_resource_request ?description:(description_ : resource_description option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ~organization_id:(organization_id_ : organization_id) ~name:(name_ : resource_name)
    ~type_:(type__ : resource_type) () =
  ({
     organization_id = organization_id_;
     name = name_;
     type_ = type__;
     description = description_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
   }
    : create_resource_request)

let make_create_user_response ?user_id:(user_id_ : work_mail_identifier option) () =
  ({ user_id = user_id_ } : create_user_response)

let make_create_user_request ?password:(password_ : password option)
    ?role:(role_ : user_role option) ?first_name:(first_name_ : user_attribute option)
    ?last_name:(last_name_ : user_attribute option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ?identity_provider_user_id:(identity_provider_user_id_ : identity_provider_user_id option)
    ~organization_id:(organization_id_ : organization_id) ~name:(name_ : user_name)
    ~display_name:(display_name_ : user_attribute) () =
  ({
     organization_id = organization_id_;
     name = name_;
     display_name = display_name_;
     password = password_;
     role = role_;
     first_name = first_name_;
     last_name = last_name_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
     identity_provider_user_id = identity_provider_user_id_;
   }
    : create_user_request)

let make_delegate ~id:(id_ : string_) ~type_:(type__ : member_type) () =
  ({ id = id_; type_ = type__ } : delegate)

let make_delete_access_control_rule_response () = (() : unit)

let make_delete_access_control_rule_request ~organization_id:(organization_id_ : organization_id)
    ~name:(name_ : access_control_rule_name) () =
  ({ organization_id = organization_id_; name = name_ } : delete_access_control_rule_request)

let make_delete_alias_response () = (() : unit)

let make_delete_alias_request ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : work_mail_identifier) ~alias:(alias_ : email_address) () =
  ({ organization_id = organization_id_; entity_id = entity_id_; alias = alias_ }
    : delete_alias_request)

let make_delete_availability_configuration_response () = (() : unit)

let make_delete_availability_configuration_request
    ~organization_id:(organization_id_ : organization_id) ~domain_name:(domain_name_ : domain_name)
    () =
  ({ organization_id = organization_id_; domain_name = domain_name_ }
    : delete_availability_configuration_request)

let make_delete_email_monitoring_configuration_response () = (() : unit)

let make_delete_email_monitoring_configuration_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : delete_email_monitoring_configuration_request)

let make_delete_group_response () = (() : unit)

let make_delete_group_request ~organization_id:(organization_id_ : organization_id)
    ~group_id:(group_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; group_id = group_id_ } : delete_group_request)

let make_delete_identity_center_application_response () = (() : unit)

let make_delete_identity_center_application_request
    ~application_arn:(application_arn_ : application_arn) () =
  ({ application_arn = application_arn_ } : delete_identity_center_application_request)

let make_delete_identity_provider_configuration_response () = (() : unit)

let make_delete_identity_provider_configuration_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : delete_identity_provider_configuration_request)

let make_delete_impersonation_role_response () = (() : unit)

let make_delete_impersonation_role_request ~organization_id:(organization_id_ : organization_id)
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id) () =
  ({ organization_id = organization_id_; impersonation_role_id = impersonation_role_id_ }
    : delete_impersonation_role_request)

let make_delete_mailbox_permissions_response () = (() : unit)

let make_delete_mailbox_permissions_request ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : entity_identifier) ~grantee_id:(grantee_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; entity_id = entity_id_; grantee_id = grantee_id_ }
    : delete_mailbox_permissions_request)

let make_delete_mobile_device_access_override_response () = (() : unit)

let make_delete_mobile_device_access_override_request
    ~organization_id:(organization_id_ : organization_id) ~user_id:(user_id_ : entity_identifier)
    ~device_id:(device_id_ : device_id) () =
  ({ organization_id = organization_id_; user_id = user_id_; device_id = device_id_ }
    : delete_mobile_device_access_override_request)

let make_delete_mobile_device_access_rule_response () = (() : unit)

let make_delete_mobile_device_access_rule_request
    ~organization_id:(organization_id_ : organization_id)
    ~mobile_device_access_rule_id:(mobile_device_access_rule_id_ : mobile_device_access_rule_id) ()
    =
  ({
     organization_id = organization_id_;
     mobile_device_access_rule_id = mobile_device_access_rule_id_;
   }
    : delete_mobile_device_access_rule_request)

let make_delete_organization_response ?organization_id:(organization_id_ : organization_id option)
    ?state:(state_ : string_ option) () =
  ({ organization_id = organization_id_; state = state_ } : delete_organization_response)

let make_delete_organization_request ?client_token:(client_token_ : idempotency_client_token option)
    ?force_delete:(force_delete_ : boolean_ option)
    ?delete_identity_center_application:(delete_identity_center_application_ : boolean_ option)
    ~organization_id:(organization_id_ : organization_id)
    ~delete_directory:(delete_directory_ : boolean_) () =
  ({
     client_token = client_token_;
     organization_id = organization_id_;
     delete_directory = delete_directory_;
     force_delete = force_delete_;
     delete_identity_center_application = delete_identity_center_application_;
   }
    : delete_organization_request)

let make_delete_personal_access_token_response () = (() : unit)

let make_delete_personal_access_token_request ~organization_id:(organization_id_ : organization_id)
    ~personal_access_token_id:(personal_access_token_id_ : personal_access_token_id) () =
  ({ organization_id = organization_id_; personal_access_token_id = personal_access_token_id_ }
    : delete_personal_access_token_request)

let make_delete_resource_response () = (() : unit)

let make_delete_resource_request ~organization_id:(organization_id_ : organization_id)
    ~resource_id:(resource_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; resource_id = resource_id_ } : delete_resource_request)

let make_delete_retention_policy_response () = (() : unit)

let make_delete_retention_policy_request ~organization_id:(organization_id_ : organization_id)
    ~id:(id_ : short_string) () =
  ({ organization_id = organization_id_; id = id_ } : delete_retention_policy_request)

let make_delete_user_response () = (() : unit)

let make_delete_user_request ~organization_id:(organization_id_ : organization_id)
    ~user_id:(user_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; user_id = user_id_ } : delete_user_request)

let make_deregister_from_work_mail_response () = (() : unit)

let make_deregister_from_work_mail_request ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; entity_id = entity_id_ }
    : deregister_from_work_mail_request)

let make_deregister_mail_domain_response () = (() : unit)

let make_deregister_mail_domain_request ~organization_id:(organization_id_ : organization_id)
    ~domain_name:(domain_name_ : work_mail_domain_name) () =
  ({ organization_id = organization_id_; domain_name = domain_name_ }
    : deregister_mail_domain_request)

let make_describe_email_monitoring_configuration_response ?role_arn:(role_arn_ : role_arn option)
    ?log_group_arn:(log_group_arn_ : log_group_arn option) () =
  ({ role_arn = role_arn_; log_group_arn = log_group_arn_ }
    : describe_email_monitoring_configuration_response)

let make_describe_email_monitoring_configuration_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : describe_email_monitoring_configuration_request)

let make_describe_entity_response ?entity_id:(entity_id_ : work_mail_identifier option)
    ?name:(name_ : string_ option) ?type_:(type__ : entity_type option) () =
  ({ entity_id = entity_id_; name = name_; type_ = type__ } : describe_entity_response)

let make_describe_entity_request ~organization_id:(organization_id_ : organization_id)
    ~email:(email_ : email_address) () =
  ({ organization_id = organization_id_; email = email_ } : describe_entity_request)

let make_describe_group_response ?group_id:(group_id_ : work_mail_identifier option)
    ?name:(name_ : group_name option) ?email:(email_ : email_address option)
    ?state:(state_ : entity_state option) ?enabled_date:(enabled_date_ : timestamp option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option) () =
  ({
     group_id = group_id_;
     name = name_;
     email = email_;
     state = state_;
     enabled_date = enabled_date_;
     disabled_date = disabled_date_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
   }
    : describe_group_response)

let make_describe_group_request ~organization_id:(organization_id_ : organization_id)
    ~group_id:(group_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; group_id = group_id_ } : describe_group_request)

let make_personal_access_token_configuration
    ?lifetime_in_days:(lifetime_in_days_ : personal_access_token_lifetime_in_days option)
    ~status:(status_ : personal_access_token_configuration_status) () =
  ({ status = status_; lifetime_in_days = lifetime_in_days_ } : personal_access_token_configuration)

let make_identity_center_configuration ~instance_arn:(instance_arn_ : instance_arn)
    ~application_arn:(application_arn_ : application_arn) () =
  ({ instance_arn = instance_arn_; application_arn = application_arn_ }
    : identity_center_configuration)

let make_describe_identity_provider_configuration_response
    ?authentication_mode:(authentication_mode_ : identity_provider_authentication_mode option)
    ?identity_center_configuration:
      (identity_center_configuration_ : identity_center_configuration option)
    ?personal_access_token_configuration:
      (personal_access_token_configuration_ : personal_access_token_configuration option) () =
  ({
     authentication_mode = authentication_mode_;
     identity_center_configuration = identity_center_configuration_;
     personal_access_token_configuration = personal_access_token_configuration_;
   }
    : describe_identity_provider_configuration_response)

let make_describe_identity_provider_configuration_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : describe_identity_provider_configuration_request)

let make_describe_inbound_dmarc_settings_response ?enforced:(enforced_ : boolean_ option) () =
  ({ enforced = enforced_ } : describe_inbound_dmarc_settings_response)

let make_describe_inbound_dmarc_settings_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : describe_inbound_dmarc_settings_request)

let make_describe_mailbox_export_job_response ?entity_id:(entity_id_ : work_mail_identifier option)
    ?description:(description_ : description option) ?role_arn:(role_arn_ : role_arn option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?s3_prefix:(s3_prefix_ : s3_object_key option) ?s3_path:(s3_path_ : s3_object_key option)
    ?estimated_progress:(estimated_progress_ : percentage option)
    ?state:(state_ : mailbox_export_job_state option)
    ?error_info:(error_info_ : mailbox_export_error_info option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option) () =
  ({
     entity_id = entity_id_;
     description = description_;
     role_arn = role_arn_;
     kms_key_arn = kms_key_arn_;
     s3_bucket_name = s3_bucket_name_;
     s3_prefix = s3_prefix_;
     s3_path = s3_path_;
     estimated_progress = estimated_progress_;
     state = state_;
     error_info = error_info_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : describe_mailbox_export_job_response)

let make_describe_mailbox_export_job_request ~job_id:(job_id_ : mailbox_export_job_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ job_id = job_id_; organization_id = organization_id_ } : describe_mailbox_export_job_request)

let make_describe_organization_response ?organization_id:(organization_id_ : organization_id option)
    ?alias:(alias_ : organization_name option) ?state:(state_ : string_ option)
    ?directory_id:(directory_id_ : string_ option)
    ?directory_type:(directory_type_ : string_ option)
    ?default_mail_domain:(default_mail_domain_ : string_ option)
    ?completed_date:(completed_date_ : timestamp option)
    ?error_message:(error_message_ : string_ option) ?ar_n:(ar_n_ : amazon_resource_name option)
    ?migration_admin:(migration_admin_ : work_mail_identifier option)
    ?interoperability_enabled:(interoperability_enabled_ : boolean_ option) () =
  ({
     organization_id = organization_id_;
     alias = alias_;
     state = state_;
     directory_id = directory_id_;
     directory_type = directory_type_;
     default_mail_domain = default_mail_domain_;
     completed_date = completed_date_;
     error_message = error_message_;
     ar_n = ar_n_;
     migration_admin = migration_admin_;
     interoperability_enabled = interoperability_enabled_;
   }
    : describe_organization_response)

let make_describe_organization_request ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : describe_organization_request)

let make_describe_resource_response ?resource_id:(resource_id_ : resource_id option)
    ?email:(email_ : email_address option) ?name:(name_ : resource_name option)
    ?type_:(type__ : resource_type option)
    ?booking_options:(booking_options_ : booking_options option)
    ?state:(state_ : entity_state option) ?enabled_date:(enabled_date_ : timestamp option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?description:(description_ : resource_description option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option) () =
  ({
     resource_id = resource_id_;
     email = email_;
     name = name_;
     type_ = type__;
     booking_options = booking_options_;
     state = state_;
     enabled_date = enabled_date_;
     disabled_date = disabled_date_;
     description = description_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
   }
    : describe_resource_response)

let make_describe_resource_request ~organization_id:(organization_id_ : organization_id)
    ~resource_id:(resource_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; resource_id = resource_id_ } : describe_resource_request)

let make_describe_user_response ?user_id:(user_id_ : work_mail_identifier option)
    ?name:(name_ : user_name option) ?email:(email_ : email_address option)
    ?display_name:(display_name_ : user_attribute option) ?state:(state_ : entity_state option)
    ?user_role:(user_role_ : user_role option) ?enabled_date:(enabled_date_ : timestamp option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?mailbox_provisioned_date:(mailbox_provisioned_date_ : timestamp option)
    ?mailbox_deprovisioned_date:(mailbox_deprovisioned_date_ : timestamp option)
    ?first_name:(first_name_ : user_attribute option)
    ?last_name:(last_name_ : user_attribute option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ?initials:(initials_ : user_attribute option) ?telephone:(telephone_ : user_attribute option)
    ?street:(street_ : user_attribute option) ?job_title:(job_title_ : user_attribute option)
    ?city:(city_ : user_attribute option) ?company:(company_ : user_attribute option)
    ?zip_code:(zip_code_ : user_attribute option) ?department:(department_ : user_attribute option)
    ?country:(country_ : user_attribute option) ?office:(office_ : user_attribute option)
    ?identity_provider_user_id:(identity_provider_user_id_ : identity_provider_user_id option)
    ?identity_provider_identity_store_id:
      (identity_provider_identity_store_id_ : identity_provider_identity_store_id option) () =
  ({
     user_id = user_id_;
     name = name_;
     email = email_;
     display_name = display_name_;
     state = state_;
     user_role = user_role_;
     enabled_date = enabled_date_;
     disabled_date = disabled_date_;
     mailbox_provisioned_date = mailbox_provisioned_date_;
     mailbox_deprovisioned_date = mailbox_deprovisioned_date_;
     first_name = first_name_;
     last_name = last_name_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
     initials = initials_;
     telephone = telephone_;
     street = street_;
     job_title = job_title_;
     city = city_;
     company = company_;
     zip_code = zip_code_;
     department = department_;
     country = country_;
     office = office_;
     identity_provider_user_id = identity_provider_user_id_;
     identity_provider_identity_store_id = identity_provider_identity_store_id_;
   }
    : describe_user_response)

let make_describe_user_request ~organization_id:(organization_id_ : organization_id)
    ~user_id:(user_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; user_id = user_id_ } : describe_user_request)

let make_disassociate_delegate_from_resource_response () = (() : unit)

let make_disassociate_delegate_from_resource_request
    ~organization_id:(organization_id_ : organization_id)
    ~resource_id:(resource_id_ : entity_identifier) ~entity_id:(entity_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; resource_id = resource_id_; entity_id = entity_id_ }
    : disassociate_delegate_from_resource_request)

let make_disassociate_member_from_group_response () = (() : unit)

let make_disassociate_member_from_group_request
    ~organization_id:(organization_id_ : organization_id) ~group_id:(group_id_ : entity_identifier)
    ~member_id:(member_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; group_id = group_id_; member_id = member_id_ }
    : disassociate_member_from_group_request)

let make_dns_record ?type_:(type__ : string_ option) ?hostname:(hostname_ : string_ option)
    ?value:(value_ : string_ option) () =
  ({ type_ = type__; hostname = hostname_; value = value_ } : dns_record)

let make_folder_configuration ?period:(period_ : retention_period option)
    ~name:(name_ : folder_name) ~action:(action_ : retention_action) () =
  ({ name = name_; action = action_; period = period_ } : folder_configuration)

let make_get_access_control_effect_response ?effect_:(effect__ : access_control_rule_effect option)
    ?matched_rules:(matched_rules_ : access_control_rule_name_list option) () =
  ({ effect_ = effect__; matched_rules = matched_rules_ } : get_access_control_effect_response)

let make_get_access_control_effect_request ?user_id:(user_id_ : work_mail_identifier option)
    ?impersonation_role_id:(impersonation_role_id_ : impersonation_role_id option)
    ~organization_id:(organization_id_ : organization_id) ~ip_address:(ip_address_ : ip_address)
    ~action:(action_ : access_control_rule_action) () =
  ({
     organization_id = organization_id_;
     ip_address = ip_address_;
     action = action_;
     user_id = user_id_;
     impersonation_role_id = impersonation_role_id_;
   }
    : get_access_control_effect_request)

let make_get_default_retention_policy_response ?id:(id_ : short_string option)
    ?name:(name_ : short_string option) ?description:(description_ : string_ option)
    ?folder_configurations:(folder_configurations_ : folder_configurations option) () =
  ({
     id = id_;
     name = name_;
     description = description_;
     folder_configurations = folder_configurations_;
   }
    : get_default_retention_policy_response)

let make_get_default_retention_policy_request ~organization_id:(organization_id_ : organization_id)
    () =
  ({ organization_id = organization_id_ } : get_default_retention_policy_request)

let make_get_impersonation_role_response
    ?impersonation_role_id:(impersonation_role_id_ : impersonation_role_id option)
    ?name:(name_ : impersonation_role_name option) ?type_:(type__ : impersonation_role_type option)
    ?description:(description_ : impersonation_role_description option)
    ?rules:(rules_ : impersonation_rule_list option)
    ?date_created:(date_created_ : timestamp option)
    ?date_modified:(date_modified_ : timestamp option) () =
  ({
     impersonation_role_id = impersonation_role_id_;
     name = name_;
     type_ = type__;
     description = description_;
     rules = rules_;
     date_created = date_created_;
     date_modified = date_modified_;
   }
    : get_impersonation_role_response)

let make_get_impersonation_role_request ~organization_id:(organization_id_ : organization_id)
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id) () =
  ({ organization_id = organization_id_; impersonation_role_id = impersonation_role_id_ }
    : get_impersonation_role_request)

let make_impersonation_matched_rule
    ?impersonation_rule_id:(impersonation_rule_id_ : impersonation_rule_id option)
    ?name:(name_ : impersonation_rule_name option) () =
  ({ impersonation_rule_id = impersonation_rule_id_; name = name_ } : impersonation_matched_rule)

let make_get_impersonation_role_effect_response ?type_:(type__ : impersonation_role_type option)
    ?effect_:(effect__ : access_effect option)
    ?matched_rules:(matched_rules_ : impersonation_matched_rule_list option) () =
  ({ type_ = type__; effect_ = effect__; matched_rules = matched_rules_ }
    : get_impersonation_role_effect_response)

let make_get_impersonation_role_effect_request ~organization_id:(organization_id_ : organization_id)
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id)
    ~target_user:(target_user_ : entity_identifier) () =
  ({
     organization_id = organization_id_;
     impersonation_role_id = impersonation_role_id_;
     target_user = target_user_;
   }
    : get_impersonation_role_effect_request)

let make_get_mail_domain_response ?records:(records_ : dns_records option)
    ?is_test_domain:(is_test_domain_ : boolean_ option) ?is_default:(is_default_ : boolean_ option)
    ?ownership_verification_status:
      (ownership_verification_status_ : dns_record_verification_status option)
    ?dkim_verification_status:(dkim_verification_status_ : dns_record_verification_status option) ()
    =
  ({
     records = records_;
     is_test_domain = is_test_domain_;
     is_default = is_default_;
     ownership_verification_status = ownership_verification_status_;
     dkim_verification_status = dkim_verification_status_;
   }
    : get_mail_domain_response)

let make_get_mail_domain_request ~organization_id:(organization_id_ : organization_id)
    ~domain_name:(domain_name_ : work_mail_domain_name) () =
  ({ organization_id = organization_id_; domain_name = domain_name_ } : get_mail_domain_request)

let make_get_mailbox_details_response ?mailbox_quota:(mailbox_quota_ : mailbox_quota option)
    ?mailbox_size:(mailbox_size_ : mailbox_size option) () =
  ({ mailbox_quota = mailbox_quota_; mailbox_size = mailbox_size_ } : get_mailbox_details_response)

let make_get_mailbox_details_request ~organization_id:(organization_id_ : organization_id)
    ~user_id:(user_id_ : entity_identifier) () =
  ({ organization_id = organization_id_; user_id = user_id_ } : get_mailbox_details_request)

let make_mobile_device_access_matched_rule
    ?mobile_device_access_rule_id:
      (mobile_device_access_rule_id_ : mobile_device_access_rule_id option)
    ?name:(name_ : mobile_device_access_rule_name option) () =
  ({ mobile_device_access_rule_id = mobile_device_access_rule_id_; name = name_ }
    : mobile_device_access_matched_rule)

let make_get_mobile_device_access_effect_response
    ?effect_:(effect__ : mobile_device_access_rule_effect option)
    ?matched_rules:(matched_rules_ : mobile_device_access_matched_rule_list option) () =
  ({ effect_ = effect__; matched_rules = matched_rules_ }
    : get_mobile_device_access_effect_response)

let make_get_mobile_device_access_effect_request ?device_type:(device_type_ : device_type option)
    ?device_model:(device_model_ : device_model option)
    ?device_operating_system:(device_operating_system_ : device_operating_system option)
    ?device_user_agent:(device_user_agent_ : device_user_agent option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     organization_id = organization_id_;
     device_type = device_type_;
     device_model = device_model_;
     device_operating_system = device_operating_system_;
     device_user_agent = device_user_agent_;
   }
    : get_mobile_device_access_effect_request)

let make_get_mobile_device_access_override_response
    ?user_id:(user_id_ : work_mail_identifier option) ?device_id:(device_id_ : device_id option)
    ?effect_:(effect__ : mobile_device_access_rule_effect option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ?date_created:(date_created_ : timestamp option)
    ?date_modified:(date_modified_ : timestamp option) () =
  ({
     user_id = user_id_;
     device_id = device_id_;
     effect_ = effect__;
     description = description_;
     date_created = date_created_;
     date_modified = date_modified_;
   }
    : get_mobile_device_access_override_response)

let make_get_mobile_device_access_override_request
    ~organization_id:(organization_id_ : organization_id) ~user_id:(user_id_ : entity_identifier)
    ~device_id:(device_id_ : device_id) () =
  ({ organization_id = organization_id_; user_id = user_id_; device_id = device_id_ }
    : get_mobile_device_access_override_request)

let make_get_personal_access_token_metadata_response
    ?personal_access_token_id:(personal_access_token_id_ : personal_access_token_id option)
    ?user_id:(user_id_ : work_mail_identifier option)
    ?name:(name_ : personal_access_token_name option)
    ?date_created:(date_created_ : timestamp option)
    ?date_last_used:(date_last_used_ : timestamp option)
    ?expires_time:(expires_time_ : timestamp option)
    ?scopes:(scopes_ : personal_access_token_scope_list option) () =
  ({
     personal_access_token_id = personal_access_token_id_;
     user_id = user_id_;
     name = name_;
     date_created = date_created_;
     date_last_used = date_last_used_;
     expires_time = expires_time_;
     scopes = scopes_;
   }
    : get_personal_access_token_metadata_response)

let make_get_personal_access_token_metadata_request
    ~organization_id:(organization_id_ : organization_id)
    ~personal_access_token_id:(personal_access_token_id_ : personal_access_token_id) () =
  ({ organization_id = organization_id_; personal_access_token_id = personal_access_token_id_ }
    : get_personal_access_token_metadata_request)

let make_group ?id:(id_ : work_mail_identifier option) ?email:(email_ : email_address option)
    ?name:(name_ : group_name option) ?state:(state_ : entity_state option)
    ?enabled_date:(enabled_date_ : timestamp option)
    ?disabled_date:(disabled_date_ : timestamp option) () =
  ({
     id = id_;
     email = email_;
     name = name_;
     state = state_;
     enabled_date = enabled_date_;
     disabled_date = disabled_date_;
   }
    : group)

let make_group_identifier ?group_id:(group_id_ : work_mail_identifier option)
    ?group_name:(group_name_ : group_name option) () =
  ({ group_id = group_id_; group_name = group_name_ } : group_identifier)

let make_impersonation_role
    ?impersonation_role_id:(impersonation_role_id_ : impersonation_role_id option)
    ?name:(name_ : impersonation_role_name option) ?type_:(type__ : impersonation_role_type option)
    ?date_created:(date_created_ : timestamp option)
    ?date_modified:(date_modified_ : timestamp option) () =
  ({
     impersonation_role_id = impersonation_role_id_;
     name = name_;
     type_ = type__;
     date_created = date_created_;
     date_modified = date_modified_;
   }
    : impersonation_role)

let make_mailbox_export_job ?job_id:(job_id_ : mailbox_export_job_id option)
    ?entity_id:(entity_id_ : work_mail_identifier option)
    ?description:(description_ : description option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?s3_path:(s3_path_ : s3_object_key option)
    ?estimated_progress:(estimated_progress_ : percentage option)
    ?state:(state_ : mailbox_export_job_state option) ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) () =
  ({
     job_id = job_id_;
     entity_id = entity_id_;
     description = description_;
     s3_bucket_name = s3_bucket_name_;
     s3_path = s3_path_;
     estimated_progress = estimated_progress_;
     state = state_;
     start_time = start_time_;
     end_time = end_time_;
   }
    : mailbox_export_job)

let make_list_access_control_rules_response ?rules:(rules_ : access_control_rules_list option) () =
  ({ rules = rules_ } : list_access_control_rules_response)

let make_list_access_control_rules_request ~organization_id:(organization_id_ : organization_id) ()
    =
  ({ organization_id = organization_id_ } : list_access_control_rules_request)

let make_list_aliases_response ?aliases:(aliases_ : aliases option)
    ?next_token:(next_token_ : next_token option) () =
  ({ aliases = aliases_; next_token = next_token_ } : list_aliases_response)

let make_list_aliases_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : work_mail_identifier) () =
  ({
     organization_id = organization_id_;
     entity_id = entity_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_aliases_request)

let make_list_availability_configurations_response
    ?availability_configurations:
      (availability_configurations_ : availability_configuration_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ availability_configurations = availability_configurations_; next_token = next_token_ }
    : list_availability_configurations_response)

let make_list_availability_configurations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_; max_results = max_results_; next_token = next_token_ }
    : list_availability_configurations_request)

let make_member ?id:(id_ : string_ option) ?name:(name_ : string_ option)
    ?type_:(type__ : member_type option) ?state:(state_ : entity_state option)
    ?enabled_date:(enabled_date_ : timestamp option)
    ?disabled_date:(disabled_date_ : timestamp option) () =
  ({
     id = id_;
     name = name_;
     type_ = type__;
     state = state_;
     enabled_date = enabled_date_;
     disabled_date = disabled_date_;
   }
    : member)

let make_list_group_members_response ?members:(members_ : members option)
    ?next_token:(next_token_ : next_token option) () =
  ({ members = members_; next_token = next_token_ } : list_group_members_response)

let make_list_group_members_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id) ~group_id:(group_id_ : entity_identifier)
    () =
  ({
     organization_id = organization_id_;
     group_id = group_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_group_members_request)

let make_list_groups_response ?groups:(groups_ : groups option)
    ?next_token:(next_token_ : next_token option) () =
  ({ groups = groups_; next_token = next_token_ } : list_groups_response)

let make_list_groups_filters ?name_prefix:(name_prefix_ : string_ option)
    ?primary_email_prefix:(primary_email_prefix_ : string_ option)
    ?state:(state_ : entity_state option) () =
  ({ name_prefix = name_prefix_; primary_email_prefix = primary_email_prefix_; state = state_ }
    : list_groups_filters)

let make_list_groups_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : list_groups_filters option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     organization_id = organization_id_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
   }
    : list_groups_request)

let make_list_groups_for_entity_response ?groups:(groups_ : group_identifiers option)
    ?next_token:(next_token_ : next_token option) () =
  ({ groups = groups_; next_token = next_token_ } : list_groups_for_entity_response)

let make_list_groups_for_entity_filters ?group_name_prefix:(group_name_prefix_ : string_ option) ()
    =
  ({ group_name_prefix = group_name_prefix_ } : list_groups_for_entity_filters)

let make_list_groups_for_entity_request ?filters:(filters_ : list_groups_for_entity_filters option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : entity_identifier) () =
  ({
     organization_id = organization_id_;
     entity_id = entity_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_groups_for_entity_request)

let make_list_impersonation_roles_response ?roles:(roles_ : impersonation_role_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ roles = roles_; next_token = next_token_ } : list_impersonation_roles_response)

let make_list_impersonation_roles_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_; next_token = next_token_; max_results = max_results_ }
    : list_impersonation_roles_request)

let make_mail_domain_summary ?domain_name:(domain_name_ : domain_name option)
    ?default_domain:(default_domain_ : boolean_ option) () =
  ({ domain_name = domain_name_; default_domain = default_domain_ } : mail_domain_summary)

let make_list_mail_domains_response ?mail_domains:(mail_domains_ : mail_domains option)
    ?next_token:(next_token_ : next_token option) () =
  ({ mail_domains = mail_domains_; next_token = next_token_ } : list_mail_domains_response)

let make_list_mail_domains_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_; max_results = max_results_; next_token = next_token_ }
    : list_mail_domains_request)

let make_list_mailbox_export_jobs_response ?jobs:(jobs_ : jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ jobs = jobs_; next_token = next_token_ } : list_mailbox_export_jobs_response)

let make_list_mailbox_export_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_; next_token = next_token_; max_results = max_results_ }
    : list_mailbox_export_jobs_request)

let make_permission ~grantee_id:(grantee_id_ : work_mail_identifier)
    ~grantee_type:(grantee_type_ : member_type)
    ~permission_values:(permission_values_ : permission_values) () =
  ({
     grantee_id = grantee_id_;
     grantee_type = grantee_type_;
     permission_values = permission_values_;
   }
    : permission)

let make_list_mailbox_permissions_response ?permissions:(permissions_ : permissions option)
    ?next_token:(next_token_ : next_token option) () =
  ({ permissions = permissions_; next_token = next_token_ } : list_mailbox_permissions_response)

let make_list_mailbox_permissions_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : entity_identifier) () =
  ({
     organization_id = organization_id_;
     entity_id = entity_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_mailbox_permissions_request)

let make_mobile_device_access_override ?user_id:(user_id_ : work_mail_identifier option)
    ?device_id:(device_id_ : device_id option)
    ?effect_:(effect__ : mobile_device_access_rule_effect option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ?date_created:(date_created_ : timestamp option)
    ?date_modified:(date_modified_ : timestamp option) () =
  ({
     user_id = user_id_;
     device_id = device_id_;
     effect_ = effect__;
     description = description_;
     date_created = date_created_;
     date_modified = date_modified_;
   }
    : mobile_device_access_override)

let make_list_mobile_device_access_overrides_response
    ?overrides:(overrides_ : mobile_device_access_overrides_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ overrides = overrides_; next_token = next_token_ }
    : list_mobile_device_access_overrides_response)

let make_list_mobile_device_access_overrides_request ?user_id:(user_id_ : entity_identifier option)
    ?device_id:(device_id_ : device_id option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     organization_id = organization_id_;
     user_id = user_id_;
     device_id = device_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_mobile_device_access_overrides_request)

let make_mobile_device_access_rule
    ?mobile_device_access_rule_id:
      (mobile_device_access_rule_id_ : mobile_device_access_rule_id option)
    ?name:(name_ : mobile_device_access_rule_name option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ?effect_:(effect__ : mobile_device_access_rule_effect option)
    ?device_types:(device_types_ : device_type_list option)
    ?not_device_types:(not_device_types_ : device_type_list option)
    ?device_models:(device_models_ : device_model_list option)
    ?not_device_models:(not_device_models_ : device_model_list option)
    ?device_operating_systems:(device_operating_systems_ : device_operating_system_list option)
    ?not_device_operating_systems:
      (not_device_operating_systems_ : device_operating_system_list option)
    ?device_user_agents:(device_user_agents_ : device_user_agent_list option)
    ?not_device_user_agents:(not_device_user_agents_ : device_user_agent_list option)
    ?date_created:(date_created_ : timestamp option)
    ?date_modified:(date_modified_ : timestamp option) () =
  ({
     mobile_device_access_rule_id = mobile_device_access_rule_id_;
     name = name_;
     description = description_;
     effect_ = effect__;
     device_types = device_types_;
     not_device_types = not_device_types_;
     device_models = device_models_;
     not_device_models = not_device_models_;
     device_operating_systems = device_operating_systems_;
     not_device_operating_systems = not_device_operating_systems_;
     device_user_agents = device_user_agents_;
     not_device_user_agents = not_device_user_agents_;
     date_created = date_created_;
     date_modified = date_modified_;
   }
    : mobile_device_access_rule)

let make_list_mobile_device_access_rules_response
    ?rules:(rules_ : mobile_device_access_rules_list option) () =
  ({ rules = rules_ } : list_mobile_device_access_rules_response)

let make_list_mobile_device_access_rules_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : list_mobile_device_access_rules_request)

let make_organization_summary ?organization_id:(organization_id_ : organization_id option)
    ?alias:(alias_ : organization_name option)
    ?default_mail_domain:(default_mail_domain_ : domain_name option)
    ?error_message:(error_message_ : string_ option) ?state:(state_ : string_ option) () =
  ({
     organization_id = organization_id_;
     alias = alias_;
     default_mail_domain = default_mail_domain_;
     error_message = error_message_;
     state = state_;
   }
    : organization_summary)

let make_list_organizations_response
    ?organization_summaries:(organization_summaries_ : organization_summaries option)
    ?next_token:(next_token_ : next_token option) () =
  ({ organization_summaries = organization_summaries_; next_token = next_token_ }
    : list_organizations_response)

let make_list_organizations_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_organizations_request)

let make_personal_access_token_summary
    ?personal_access_token_id:(personal_access_token_id_ : personal_access_token_id option)
    ?user_id:(user_id_ : work_mail_identifier option)
    ?name:(name_ : personal_access_token_name option)
    ?date_created:(date_created_ : timestamp option)
    ?date_last_used:(date_last_used_ : timestamp option)
    ?expires_time:(expires_time_ : timestamp option)
    ?scopes:(scopes_ : personal_access_token_scope_list option) () =
  ({
     personal_access_token_id = personal_access_token_id_;
     user_id = user_id_;
     name = name_;
     date_created = date_created_;
     date_last_used = date_last_used_;
     expires_time = expires_time_;
     scopes = scopes_;
   }
    : personal_access_token_summary)

let make_list_personal_access_tokens_response ?next_token:(next_token_ : next_token option)
    ?personal_access_token_summaries:
      (personal_access_token_summaries_ : personal_access_token_summary_list option) () =
  ({ next_token = next_token_; personal_access_token_summaries = personal_access_token_summaries_ }
    : list_personal_access_tokens_response)

let make_list_personal_access_tokens_request ?user_id:(user_id_ : entity_identifier option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     organization_id = organization_id_;
     user_id = user_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_personal_access_tokens_request)

let make_list_resource_delegates_response ?delegates:(delegates_ : resource_delegates option)
    ?next_token:(next_token_ : next_token option) () =
  ({ delegates = delegates_; next_token = next_token_ } : list_resource_delegates_response)

let make_list_resource_delegates_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id)
    ~resource_id:(resource_id_ : entity_identifier) () =
  ({
     organization_id = organization_id_;
     resource_id = resource_id_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_resource_delegates_request)

let make_resource ?id:(id_ : work_mail_identifier option) ?email:(email_ : email_address option)
    ?name:(name_ : resource_name option) ?type_:(type__ : resource_type option)
    ?state:(state_ : entity_state option) ?enabled_date:(enabled_date_ : timestamp option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?description:(description_ : resource_description option) () =
  ({
     id = id_;
     email = email_;
     name = name_;
     type_ = type__;
     state = state_;
     enabled_date = enabled_date_;
     disabled_date = disabled_date_;
     description = description_;
   }
    : resource)

let make_list_resources_response ?resources:(resources_ : resources option)
    ?next_token:(next_token_ : next_token option) () =
  ({ resources = resources_; next_token = next_token_ } : list_resources_response)

let make_list_resources_filters ?name_prefix:(name_prefix_ : string_ option)
    ?primary_email_prefix:(primary_email_prefix_ : string_ option)
    ?state:(state_ : entity_state option) () =
  ({ name_prefix = name_prefix_; primary_email_prefix = primary_email_prefix_; state = state_ }
    : list_resources_filters)

let make_list_resources_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : list_resources_filters option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     organization_id = organization_id_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
   }
    : list_resources_request)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_user ?id:(id_ : work_mail_identifier option) ?email:(email_ : email_address option)
    ?name:(name_ : user_name option) ?display_name:(display_name_ : string_ option)
    ?state:(state_ : entity_state option) ?user_role:(user_role_ : user_role option)
    ?enabled_date:(enabled_date_ : timestamp option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?identity_provider_user_id:(identity_provider_user_id_ : identity_provider_user_id option)
    ?identity_provider_identity_store_id:
      (identity_provider_identity_store_id_ : identity_provider_identity_store_id option) () =
  ({
     id = id_;
     email = email_;
     name = name_;
     display_name = display_name_;
     state = state_;
     user_role = user_role_;
     enabled_date = enabled_date_;
     disabled_date = disabled_date_;
     identity_provider_user_id = identity_provider_user_id_;
     identity_provider_identity_store_id = identity_provider_identity_store_id_;
   }
    : user)

let make_list_users_response ?users:(users_ : users option)
    ?next_token:(next_token_ : next_token option) () =
  ({ users = users_; next_token = next_token_ } : list_users_response)

let make_list_users_filters ?username_prefix:(username_prefix_ : string_ option)
    ?display_name_prefix:(display_name_prefix_ : user_attribute option)
    ?primary_email_prefix:(primary_email_prefix_ : string_ option)
    ?state:(state_ : entity_state option)
    ?identity_provider_user_id_prefix:
      (identity_provider_user_id_prefix_ : identity_provider_user_id_prefix option) () =
  ({
     username_prefix = username_prefix_;
     display_name_prefix = display_name_prefix_;
     primary_email_prefix = primary_email_prefix_;
     state = state_;
     identity_provider_user_id_prefix = identity_provider_user_id_prefix_;
   }
    : list_users_filters)

let make_list_users_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : list_users_filters option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     organization_id = organization_id_;
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
   }
    : list_users_request)

let make_put_access_control_rule_response () = (() : unit)

let make_put_access_control_rule_request ?ip_ranges:(ip_ranges_ : ip_range_list option)
    ?not_ip_ranges:(not_ip_ranges_ : ip_range_list option) ?actions:(actions_ : actions_list option)
    ?not_actions:(not_actions_ : actions_list option) ?user_ids:(user_ids_ : user_id_list option)
    ?not_user_ids:(not_user_ids_ : user_id_list option)
    ?impersonation_role_ids:(impersonation_role_ids_ : impersonation_role_id_list option)
    ?not_impersonation_role_ids:(not_impersonation_role_ids_ : impersonation_role_id_list option)
    ~name:(name_ : access_control_rule_name) ~effect_:(effect__ : access_control_rule_effect)
    ~description:(description_ : access_control_rule_description)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     name = name_;
     effect_ = effect__;
     description = description_;
     ip_ranges = ip_ranges_;
     not_ip_ranges = not_ip_ranges_;
     actions = actions_;
     not_actions = not_actions_;
     user_ids = user_ids_;
     not_user_ids = not_user_ids_;
     organization_id = organization_id_;
     impersonation_role_ids = impersonation_role_ids_;
     not_impersonation_role_ids = not_impersonation_role_ids_;
   }
    : put_access_control_rule_request)

let make_put_email_monitoring_configuration_response () = (() : unit)

let make_put_email_monitoring_configuration_request ?role_arn:(role_arn_ : role_arn option)
    ~organization_id:(organization_id_ : organization_id)
    ~log_group_arn:(log_group_arn_ : log_group_arn) () =
  ({ organization_id = organization_id_; role_arn = role_arn_; log_group_arn = log_group_arn_ }
    : put_email_monitoring_configuration_request)

let make_put_identity_provider_configuration_response () = (() : unit)

let make_put_identity_provider_configuration_request
    ~organization_id:(organization_id_ : organization_id)
    ~authentication_mode:(authentication_mode_ : identity_provider_authentication_mode)
    ~identity_center_configuration:(identity_center_configuration_ : identity_center_configuration)
    ~personal_access_token_configuration:
      (personal_access_token_configuration_ : personal_access_token_configuration) () =
  ({
     organization_id = organization_id_;
     authentication_mode = authentication_mode_;
     identity_center_configuration = identity_center_configuration_;
     personal_access_token_configuration = personal_access_token_configuration_;
   }
    : put_identity_provider_configuration_request)

let make_put_inbound_dmarc_settings_response () = (() : unit)

let make_put_inbound_dmarc_settings_request ~organization_id:(organization_id_ : organization_id)
    ~enforced:(enforced_ : boolean_object) () =
  ({ organization_id = organization_id_; enforced = enforced_ }
    : put_inbound_dmarc_settings_request)

let make_put_mailbox_permissions_response () = (() : unit)

let make_put_mailbox_permissions_request ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : entity_identifier) ~grantee_id:(grantee_id_ : entity_identifier)
    ~permission_values:(permission_values_ : permission_values) () =
  ({
     organization_id = organization_id_;
     entity_id = entity_id_;
     grantee_id = grantee_id_;
     permission_values = permission_values_;
   }
    : put_mailbox_permissions_request)

let make_put_mobile_device_access_override_response () = (() : unit)

let make_put_mobile_device_access_override_request
    ?description:(description_ : mobile_device_access_rule_description option)
    ~organization_id:(organization_id_ : organization_id) ~user_id:(user_id_ : entity_identifier)
    ~device_id:(device_id_ : device_id) ~effect_:(effect__ : mobile_device_access_rule_effect) () =
  ({
     organization_id = organization_id_;
     user_id = user_id_;
     device_id = device_id_;
     effect_ = effect__;
     description = description_;
   }
    : put_mobile_device_access_override_request)

let make_put_retention_policy_response () = (() : unit)

let make_put_retention_policy_request ?id:(id_ : short_string option)
    ?description:(description_ : policy_description option)
    ~organization_id:(organization_id_ : organization_id) ~name:(name_ : short_string)
    ~folder_configurations:(folder_configurations_ : folder_configurations) () =
  ({
     organization_id = organization_id_;
     id = id_;
     name = name_;
     description = description_;
     folder_configurations = folder_configurations_;
   }
    : put_retention_policy_request)

let make_register_mail_domain_response () = (() : unit)

let make_register_mail_domain_request
    ?client_token:(client_token_ : idempotency_client_token option)
    ~organization_id:(organization_id_ : organization_id)
    ~domain_name:(domain_name_ : work_mail_domain_name) () =
  ({ client_token = client_token_; organization_id = organization_id_; domain_name = domain_name_ }
    : register_mail_domain_request)

let make_register_to_work_mail_response () = (() : unit)

let make_register_to_work_mail_request ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : entity_identifier) ~email:(email_ : email_address) () =
  ({ organization_id = organization_id_; entity_id = entity_id_; email = email_ }
    : register_to_work_mail_request)

let make_reset_password_response () = (() : unit)

let make_reset_password_request ~organization_id:(organization_id_ : organization_id)
    ~user_id:(user_id_ : work_mail_identifier) ~password:(password_ : password) () =
  ({ organization_id = organization_id_; user_id = user_id_; password = password_ }
    : reset_password_request)

let make_start_mailbox_export_job_response ?job_id:(job_id_ : mailbox_export_job_id option) () =
  ({ job_id = job_id_ } : start_mailbox_export_job_response)

let make_start_mailbox_export_job_request ?description:(description_ : description option)
    ~client_token:(client_token_ : idempotency_client_token)
    ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : entity_identifier) ~role_arn:(role_arn_ : role_arn)
    ~kms_key_arn:(kms_key_arn_ : kms_key_arn) ~s3_bucket_name:(s3_bucket_name_ : s3_bucket_name)
    ~s3_prefix:(s3_prefix_ : s3_object_key) () =
  ({
     client_token = client_token_;
     organization_id = organization_id_;
     entity_id = entity_id_;
     description = description_;
     role_arn = role_arn_;
     kms_key_arn = kms_key_arn_;
     s3_bucket_name = s3_bucket_name_;
     s3_prefix = s3_prefix_;
   }
    : start_mailbox_export_job_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_test_availability_configuration_response ?test_passed:(test_passed_ : boolean_ option)
    ?failure_reason:(failure_reason_ : string_ option) () =
  ({ test_passed = test_passed_; failure_reason = failure_reason_ }
    : test_availability_configuration_response)

let make_test_availability_configuration_request ?domain_name:(domain_name_ : domain_name option)
    ?ews_provider:(ews_provider_ : ews_availability_provider option)
    ?lambda_provider:(lambda_provider_ : lambda_availability_provider option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     organization_id = organization_id_;
     domain_name = domain_name_;
     ews_provider = ews_provider_;
     lambda_provider = lambda_provider_;
   }
    : test_availability_configuration_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_update_availability_configuration_response () = (() : unit)

let make_update_availability_configuration_request
    ?ews_provider:(ews_provider_ : ews_availability_provider option)
    ?lambda_provider:(lambda_provider_ : lambda_availability_provider option)
    ~organization_id:(organization_id_ : organization_id) ~domain_name:(domain_name_ : domain_name)
    () =
  ({
     organization_id = organization_id_;
     domain_name = domain_name_;
     ews_provider = ews_provider_;
     lambda_provider = lambda_provider_;
   }
    : update_availability_configuration_request)

let make_update_default_mail_domain_response () = (() : unit)

let make_update_default_mail_domain_request ~organization_id:(organization_id_ : organization_id)
    ~domain_name:(domain_name_ : work_mail_domain_name) () =
  ({ organization_id = organization_id_; domain_name = domain_name_ }
    : update_default_mail_domain_request)

let make_update_group_response () = (() : unit)

let make_update_group_request
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_object option)
    ~organization_id:(organization_id_ : organization_id) ~group_id:(group_id_ : entity_identifier)
    () =
  ({
     organization_id = organization_id_;
     group_id = group_id_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
   }
    : update_group_request)

let make_update_impersonation_role_response () = (() : unit)

let make_update_impersonation_role_request
    ?description:(description_ : impersonation_role_description option)
    ~organization_id:(organization_id_ : organization_id)
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id)
    ~name:(name_ : impersonation_role_name) ~type_:(type__ : impersonation_role_type)
    ~rules:(rules_ : impersonation_rule_list) () =
  ({
     organization_id = organization_id_;
     impersonation_role_id = impersonation_role_id_;
     name = name_;
     type_ = type__;
     description = description_;
     rules = rules_;
   }
    : update_impersonation_role_request)

let make_update_mailbox_quota_response () = (() : unit)

let make_update_mailbox_quota_request ~organization_id:(organization_id_ : organization_id)
    ~user_id:(user_id_ : entity_identifier) ~mailbox_quota:(mailbox_quota_ : mailbox_quota) () =
  ({ organization_id = organization_id_; user_id = user_id_; mailbox_quota = mailbox_quota_ }
    : update_mailbox_quota_request)

let make_update_mobile_device_access_rule_response () = (() : unit)

let make_update_mobile_device_access_rule_request
    ?description:(description_ : mobile_device_access_rule_description option)
    ?device_types:(device_types_ : device_type_list option)
    ?not_device_types:(not_device_types_ : device_type_list option)
    ?device_models:(device_models_ : device_model_list option)
    ?not_device_models:(not_device_models_ : device_model_list option)
    ?device_operating_systems:(device_operating_systems_ : device_operating_system_list option)
    ?not_device_operating_systems:
      (not_device_operating_systems_ : device_operating_system_list option)
    ?device_user_agents:(device_user_agents_ : device_user_agent_list option)
    ?not_device_user_agents:(not_device_user_agents_ : device_user_agent_list option)
    ~organization_id:(organization_id_ : organization_id)
    ~mobile_device_access_rule_id:(mobile_device_access_rule_id_ : mobile_device_access_rule_id)
    ~name:(name_ : mobile_device_access_rule_name)
    ~effect_:(effect__ : mobile_device_access_rule_effect) () =
  ({
     organization_id = organization_id_;
     mobile_device_access_rule_id = mobile_device_access_rule_id_;
     name = name_;
     description = description_;
     effect_ = effect__;
     device_types = device_types_;
     not_device_types = not_device_types_;
     device_models = device_models_;
     not_device_models = not_device_models_;
     device_operating_systems = device_operating_systems_;
     not_device_operating_systems = not_device_operating_systems_;
     device_user_agents = device_user_agents_;
     not_device_user_agents = not_device_user_agents_;
   }
    : update_mobile_device_access_rule_request)

let make_update_primary_email_address_response () = (() : unit)

let make_update_primary_email_address_request ~organization_id:(organization_id_ : organization_id)
    ~entity_id:(entity_id_ : entity_identifier) ~email:(email_ : email_address) () =
  ({ organization_id = organization_id_; entity_id = entity_id_; email = email_ }
    : update_primary_email_address_request)

let make_update_resource_response () = (() : unit)

let make_update_resource_request ?name:(name_ : resource_name option)
    ?booking_options:(booking_options_ : booking_options option)
    ?description:(description_ : new_resource_description option)
    ?type_:(type__ : resource_type option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_object option)
    ~organization_id:(organization_id_ : organization_id)
    ~resource_id:(resource_id_ : entity_identifier) () =
  ({
     organization_id = organization_id_;
     resource_id = resource_id_;
     name = name_;
     booking_options = booking_options_;
     description = description_;
     type_ = type__;
     hidden_from_global_address_list = hidden_from_global_address_list_;
   }
    : update_resource_request)

let make_update_user_response () = (() : unit)

let make_update_user_request ?role:(role_ : user_role option)
    ?display_name:(display_name_ : user_attribute option)
    ?first_name:(first_name_ : user_attribute option)
    ?last_name:(last_name_ : user_attribute option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_object option)
    ?initials:(initials_ : user_attribute option) ?telephone:(telephone_ : user_attribute option)
    ?street:(street_ : user_attribute option) ?job_title:(job_title_ : user_attribute option)
    ?city:(city_ : user_attribute option) ?company:(company_ : user_attribute option)
    ?zip_code:(zip_code_ : user_attribute option) ?department:(department_ : user_attribute option)
    ?country:(country_ : user_attribute option) ?office:(office_ : user_attribute option)
    ?identity_provider_user_id:
      (identity_provider_user_id_ : identity_provider_user_id_for_update option)
    ~organization_id:(organization_id_ : organization_id) ~user_id:(user_id_ : entity_identifier) ()
    =
  ({
     organization_id = organization_id_;
     user_id = user_id_;
     role = role_;
     display_name = display_name_;
     first_name = first_name_;
     last_name = last_name_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
     initials = initials_;
     telephone = telephone_;
     street = street_;
     job_title = job_title_;
     city = city_;
     company = company_;
     zip_code = zip_code_;
     department = department_;
     country = country_;
     office = office_;
     identity_provider_user_id = identity_provider_user_id_;
   }
    : update_user_request)
