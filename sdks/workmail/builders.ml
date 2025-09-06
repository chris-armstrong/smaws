open Types

let make_update_user_response () = (() : unit)

let make_update_user_request
    ?identity_provider_user_id:
      (identity_provider_user_id_ : identity_provider_user_id_for_update option)
    ?office:(office_ : user_attribute option) ?country:(country_ : user_attribute option)
    ?department:(department_ : user_attribute option) ?zip_code:(zip_code_ : user_attribute option)
    ?company:(company_ : user_attribute option) ?city:(city_ : user_attribute option)
    ?job_title:(job_title_ : user_attribute option) ?street:(street_ : user_attribute option)
    ?telephone:(telephone_ : user_attribute option) ?initials:(initials_ : user_attribute option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_object option)
    ?last_name:(last_name_ : user_attribute option)
    ?first_name:(first_name_ : user_attribute option)
    ?display_name:(display_name_ : user_attribute option) ?role:(role_ : user_role option)
    ~user_id:(user_id_ : entity_identifier) ~organization_id:(organization_id_ : organization_id) ()
    =
  ({
     identity_provider_user_id = identity_provider_user_id_;
     office = office_;
     country = country_;
     department = department_;
     zip_code = zip_code_;
     company = company_;
     city = city_;
     job_title = job_title_;
     street = street_;
     telephone = telephone_;
     initials = initials_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
     last_name = last_name_;
     first_name = first_name_;
     display_name = display_name_;
     role = role_;
     user_id = user_id_;
     organization_id = organization_id_;
   }
    : update_user_request)

let make_update_resource_response () = (() : unit)

let make_booking_options
    ?auto_decline_conflicting_requests:(auto_decline_conflicting_requests_ : boolean_ option)
    ?auto_decline_recurring_requests:(auto_decline_recurring_requests_ : boolean_ option)
    ?auto_accept_requests:(auto_accept_requests_ : boolean_ option) () =
  ({
     auto_decline_conflicting_requests = auto_decline_conflicting_requests_;
     auto_decline_recurring_requests = auto_decline_recurring_requests_;
     auto_accept_requests = auto_accept_requests_;
   }
    : booking_options)

let make_update_resource_request
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_object option)
    ?type_:(type__ : resource_type option)
    ?description:(description_ : new_resource_description option)
    ?booking_options:(booking_options_ : booking_options option)
    ?name:(name_ : resource_name option) ~resource_id:(resource_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     type_ = type__;
     description = description_;
     booking_options = booking_options_;
     name = name_;
     resource_id = resource_id_;
     organization_id = organization_id_;
   }
    : update_resource_request)

let make_update_primary_email_address_response () = (() : unit)

let make_update_primary_email_address_request ~email:(email_ : email_address)
    ~entity_id:(entity_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ email = email_; entity_id = entity_id_; organization_id = organization_id_ }
    : update_primary_email_address_request)

let make_update_mobile_device_access_rule_response () = (() : unit)

let make_update_mobile_device_access_rule_request
    ?not_device_user_agents:(not_device_user_agents_ : device_user_agent_list option)
    ?device_user_agents:(device_user_agents_ : device_user_agent_list option)
    ?not_device_operating_systems:
      (not_device_operating_systems_ : device_operating_system_list option)
    ?device_operating_systems:(device_operating_systems_ : device_operating_system_list option)
    ?not_device_models:(not_device_models_ : device_model_list option)
    ?device_models:(device_models_ : device_model_list option)
    ?not_device_types:(not_device_types_ : device_type_list option)
    ?device_types:(device_types_ : device_type_list option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ~effect_:(effect__ : mobile_device_access_rule_effect)
    ~name:(name_ : mobile_device_access_rule_name)
    ~mobile_device_access_rule_id:(mobile_device_access_rule_id_ : mobile_device_access_rule_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     not_device_user_agents = not_device_user_agents_;
     device_user_agents = device_user_agents_;
     not_device_operating_systems = not_device_operating_systems_;
     device_operating_systems = device_operating_systems_;
     not_device_models = not_device_models_;
     device_models = device_models_;
     not_device_types = not_device_types_;
     device_types = device_types_;
     effect_ = effect__;
     description = description_;
     name = name_;
     mobile_device_access_rule_id = mobile_device_access_rule_id_;
     organization_id = organization_id_;
   }
    : update_mobile_device_access_rule_request)

let make_update_mailbox_quota_response () = (() : unit)

let make_update_mailbox_quota_request ~mailbox_quota:(mailbox_quota_ : mailbox_quota)
    ~user_id:(user_id_ : entity_identifier) ~organization_id:(organization_id_ : organization_id) ()
    =
  ({ mailbox_quota = mailbox_quota_; user_id = user_id_; organization_id = organization_id_ }
    : update_mailbox_quota_request)

let make_update_impersonation_role_response () = (() : unit)

let make_impersonation_rule ?not_target_users:(not_target_users_ : target_users option)
    ?target_users:(target_users_ : target_users option)
    ?description:(description_ : impersonation_rule_description option)
    ?name:(name_ : impersonation_rule_name option) ~effect_:(effect__ : access_effect)
    ~impersonation_rule_id:(impersonation_rule_id_ : impersonation_rule_id) () =
  ({
     not_target_users = not_target_users_;
     target_users = target_users_;
     effect_ = effect__;
     description = description_;
     name = name_;
     impersonation_rule_id = impersonation_rule_id_;
   }
    : impersonation_rule)

let make_update_impersonation_role_request
    ?description:(description_ : impersonation_role_description option)
    ~rules:(rules_ : impersonation_rule_list) ~type_:(type__ : impersonation_role_type)
    ~name:(name_ : impersonation_role_name)
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     rules = rules_;
     description = description_;
     type_ = type__;
     name = name_;
     impersonation_role_id = impersonation_role_id_;
     organization_id = organization_id_;
   }
    : update_impersonation_role_request)

let make_update_group_response () = (() : unit)

let make_update_group_request
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_object option)
    ~group_id:(group_id_ : entity_identifier) ~organization_id:(organization_id_ : organization_id)
    () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     group_id = group_id_;
     organization_id = organization_id_;
   }
    : update_group_request)

let make_update_default_mail_domain_response () = (() : unit)

let make_update_default_mail_domain_request ~domain_name:(domain_name_ : work_mail_domain_name)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ domain_name = domain_name_; organization_id = organization_id_ }
    : update_default_mail_domain_request)

let make_update_availability_configuration_response () = (() : unit)

let make_ews_availability_provider ~ews_password:(ews_password_ : password)
    ~ews_username:(ews_username_ : external_user_name) ~ews_endpoint:(ews_endpoint_ : url) () =
  ({ ews_password = ews_password_; ews_username = ews_username_; ews_endpoint = ews_endpoint_ }
    : ews_availability_provider)

let make_lambda_availability_provider ~lambda_arn:(lambda_arn_ : lambda_arn) () =
  ({ lambda_arn = lambda_arn_ } : lambda_availability_provider)

let make_update_availability_configuration_request
    ?lambda_provider:(lambda_provider_ : lambda_availability_provider option)
    ?ews_provider:(ews_provider_ : ews_availability_provider option)
    ~domain_name:(domain_name_ : domain_name) ~organization_id:(organization_id_ : organization_id)
    () =
  ({
     lambda_provider = lambda_provider_;
     ews_provider = ews_provider_;
     domain_name = domain_name_;
     organization_id = organization_id_;
   }
    : update_availability_configuration_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_test_availability_configuration_response ?failure_reason:(failure_reason_ : string_ option)
    ?test_passed:(test_passed_ : boolean_ option) () =
  ({ failure_reason = failure_reason_; test_passed = test_passed_ }
    : test_availability_configuration_response)

let make_test_availability_configuration_request
    ?lambda_provider:(lambda_provider_ : lambda_availability_provider option)
    ?ews_provider:(ews_provider_ : ews_availability_provider option)
    ?domain_name:(domain_name_ : domain_name option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     lambda_provider = lambda_provider_;
     ews_provider = ews_provider_;
     domain_name = domain_name_;
     organization_id = organization_id_;
   }
    : test_availability_configuration_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_start_mailbox_export_job_response ?job_id:(job_id_ : mailbox_export_job_id option) () =
  ({ job_id = job_id_ } : start_mailbox_export_job_response)

let make_start_mailbox_export_job_request ?description:(description_ : description option)
    ~s3_prefix:(s3_prefix_ : s3_object_key) ~s3_bucket_name:(s3_bucket_name_ : s3_bucket_name)
    ~kms_key_arn:(kms_key_arn_ : kms_key_arn) ~role_arn:(role_arn_ : role_arn)
    ~entity_id:(entity_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id)
    ~client_token:(client_token_ : idempotency_client_token) () =
  ({
     s3_prefix = s3_prefix_;
     s3_bucket_name = s3_bucket_name_;
     kms_key_arn = kms_key_arn_;
     role_arn = role_arn_;
     description = description_;
     entity_id = entity_id_;
     organization_id = organization_id_;
     client_token = client_token_;
   }
    : start_mailbox_export_job_request)

let make_reset_password_response () = (() : unit)

let make_reset_password_request ~password:(password_ : password)
    ~user_id:(user_id_ : work_mail_identifier) ~organization_id:(organization_id_ : organization_id)
    () =
  ({ password = password_; user_id = user_id_; organization_id = organization_id_ }
    : reset_password_request)

let make_register_to_work_mail_response () = (() : unit)

let make_register_to_work_mail_request ~email:(email_ : email_address)
    ~entity_id:(entity_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ email = email_; entity_id = entity_id_; organization_id = organization_id_ }
    : register_to_work_mail_request)

let make_register_mail_domain_response () = (() : unit)

let make_register_mail_domain_request
    ?client_token:(client_token_ : idempotency_client_token option)
    ~domain_name:(domain_name_ : work_mail_domain_name)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ domain_name = domain_name_; organization_id = organization_id_; client_token = client_token_ }
    : register_mail_domain_request)

let make_put_retention_policy_response () = (() : unit)

let make_folder_configuration ?period:(period_ : retention_period option)
    ~action:(action_ : retention_action) ~name:(name_ : folder_name) () =
  ({ period = period_; action = action_; name = name_ } : folder_configuration)

let make_put_retention_policy_request ?description:(description_ : policy_description option)
    ?id:(id_ : short_string option)
    ~folder_configurations:(folder_configurations_ : folder_configurations)
    ~name:(name_ : short_string) ~organization_id:(organization_id_ : organization_id) () =
  ({
     folder_configurations = folder_configurations_;
     description = description_;
     name = name_;
     id = id_;
     organization_id = organization_id_;
   }
    : put_retention_policy_request)

let make_put_mobile_device_access_override_response () = (() : unit)

let make_put_mobile_device_access_override_request
    ?description:(description_ : mobile_device_access_rule_description option)
    ~effect_:(effect__ : mobile_device_access_rule_effect) ~device_id:(device_id_ : device_id)
    ~user_id:(user_id_ : entity_identifier) ~organization_id:(organization_id_ : organization_id) ()
    =
  ({
     description = description_;
     effect_ = effect__;
     device_id = device_id_;
     user_id = user_id_;
     organization_id = organization_id_;
   }
    : put_mobile_device_access_override_request)

let make_put_mailbox_permissions_response () = (() : unit)

let make_put_mailbox_permissions_request ~permission_values:(permission_values_ : permission_values)
    ~grantee_id:(grantee_id_ : entity_identifier) ~entity_id:(entity_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     permission_values = permission_values_;
     grantee_id = grantee_id_;
     entity_id = entity_id_;
     organization_id = organization_id_;
   }
    : put_mailbox_permissions_request)

let make_put_inbound_dmarc_settings_response () = (() : unit)

let make_put_inbound_dmarc_settings_request ~enforced:(enforced_ : boolean_object)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ enforced = enforced_; organization_id = organization_id_ }
    : put_inbound_dmarc_settings_request)

let make_put_identity_provider_configuration_response () = (() : unit)

let make_identity_center_configuration ~application_arn:(application_arn_ : application_arn)
    ~instance_arn:(instance_arn_ : instance_arn) () =
  ({ application_arn = application_arn_; instance_arn = instance_arn_ }
    : identity_center_configuration)

let make_personal_access_token_configuration
    ?lifetime_in_days:(lifetime_in_days_ : personal_access_token_lifetime_in_days option)
    ~status:(status_ : personal_access_token_configuration_status) () =
  ({ lifetime_in_days = lifetime_in_days_; status = status_ } : personal_access_token_configuration)

let make_put_identity_provider_configuration_request
    ~personal_access_token_configuration:
      (personal_access_token_configuration_ : personal_access_token_configuration)
    ~identity_center_configuration:(identity_center_configuration_ : identity_center_configuration)
    ~authentication_mode:(authentication_mode_ : identity_provider_authentication_mode)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     personal_access_token_configuration = personal_access_token_configuration_;
     identity_center_configuration = identity_center_configuration_;
     authentication_mode = authentication_mode_;
     organization_id = organization_id_;
   }
    : put_identity_provider_configuration_request)

let make_put_email_monitoring_configuration_response () = (() : unit)

let make_put_email_monitoring_configuration_request ~log_group_arn:(log_group_arn_ : log_group_arn)
    ~role_arn:(role_arn_ : role_arn) ~organization_id:(organization_id_ : organization_id) () =
  ({ log_group_arn = log_group_arn_; role_arn = role_arn_; organization_id = organization_id_ }
    : put_email_monitoring_configuration_request)

let make_put_access_control_rule_response () = (() : unit)

let make_put_access_control_rule_request
    ?not_impersonation_role_ids:(not_impersonation_role_ids_ : impersonation_role_id_list option)
    ?impersonation_role_ids:(impersonation_role_ids_ : impersonation_role_id_list option)
    ?not_user_ids:(not_user_ids_ : user_id_list option) ?user_ids:(user_ids_ : user_id_list option)
    ?not_actions:(not_actions_ : actions_list option) ?actions:(actions_ : actions_list option)
    ?not_ip_ranges:(not_ip_ranges_ : ip_range_list option)
    ?ip_ranges:(ip_ranges_ : ip_range_list option)
    ~organization_id:(organization_id_ : organization_id)
    ~description:(description_ : access_control_rule_description)
    ~effect_:(effect__ : access_control_rule_effect) ~name:(name_ : access_control_rule_name) () =
  ({
     not_impersonation_role_ids = not_impersonation_role_ids_;
     impersonation_role_ids = impersonation_role_ids_;
     organization_id = organization_id_;
     not_user_ids = not_user_ids_;
     user_ids = user_ids_;
     not_actions = not_actions_;
     actions = actions_;
     not_ip_ranges = not_ip_ranges_;
     ip_ranges = ip_ranges_;
     description = description_;
     effect_ = effect__;
     name = name_;
   }
    : put_access_control_rule_request)

let make_user
    ?identity_provider_identity_store_id:
      (identity_provider_identity_store_id_ : identity_provider_identity_store_id option)
    ?identity_provider_user_id:(identity_provider_user_id_ : identity_provider_user_id option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?enabled_date:(enabled_date_ : timestamp option) ?user_role:(user_role_ : user_role option)
    ?state:(state_ : entity_state option) ?display_name:(display_name_ : string_ option)
    ?name:(name_ : user_name option) ?email:(email_ : email_address option)
    ?id:(id_ : work_mail_identifier option) () =
  ({
     identity_provider_identity_store_id = identity_provider_identity_store_id_;
     identity_provider_user_id = identity_provider_user_id_;
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     user_role = user_role_;
     state = state_;
     display_name = display_name_;
     name = name_;
     email = email_;
     id = id_;
   }
    : user)

let make_list_users_response ?next_token:(next_token_ : next_token option)
    ?users:(users_ : users option) () =
  ({ next_token = next_token_; users = users_ } : list_users_response)

let make_list_users_filters
    ?identity_provider_user_id_prefix:
      (identity_provider_user_id_prefix_ : identity_provider_user_id_prefix option)
    ?state:(state_ : entity_state option)
    ?primary_email_prefix:(primary_email_prefix_ : string_ option)
    ?display_name_prefix:(display_name_prefix_ : user_attribute option)
    ?username_prefix:(username_prefix_ : string_ option) () =
  ({
     identity_provider_user_id_prefix = identity_provider_user_id_prefix_;
     state = state_;
     primary_email_prefix = primary_email_prefix_;
     display_name_prefix = display_name_prefix_;
     username_prefix = username_prefix_;
   }
    : list_users_filters)

let make_list_users_request ?filters:(filters_ : list_users_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     organization_id = organization_id_;
   }
    : list_users_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_resource ?description:(description_ : resource_description option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?enabled_date:(enabled_date_ : timestamp option) ?state:(state_ : entity_state option)
    ?type_:(type__ : resource_type option) ?name:(name_ : resource_name option)
    ?email:(email_ : email_address option) ?id:(id_ : work_mail_identifier option) () =
  ({
     description = description_;
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     type_ = type__;
     name = name_;
     email = email_;
     id = id_;
   }
    : resource)

let make_list_resources_response ?next_token:(next_token_ : next_token option)
    ?resources:(resources_ : resources option) () =
  ({ next_token = next_token_; resources = resources_ } : list_resources_response)

let make_list_resources_filters ?state:(state_ : entity_state option)
    ?primary_email_prefix:(primary_email_prefix_ : string_ option)
    ?name_prefix:(name_prefix_ : string_ option) () =
  ({ state = state_; primary_email_prefix = primary_email_prefix_; name_prefix = name_prefix_ }
    : list_resources_filters)

let make_list_resources_request ?filters:(filters_ : list_resources_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     organization_id = organization_id_;
   }
    : list_resources_request)

let make_delegate ~type_:(type__ : member_type) ~id:(id_ : string_) () =
  ({ type_ = type__; id = id_ } : delegate)

let make_list_resource_delegates_response ?next_token:(next_token_ : next_token option)
    ?delegates:(delegates_ : resource_delegates option) () =
  ({ next_token = next_token_; delegates = delegates_ } : list_resource_delegates_response)

let make_list_resource_delegates_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~resource_id:(resource_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_id = resource_id_;
     organization_id = organization_id_;
   }
    : list_resource_delegates_request)

let make_personal_access_token_summary ?scopes:(scopes_ : personal_access_token_scope_list option)
    ?expires_time:(expires_time_ : timestamp option)
    ?date_last_used:(date_last_used_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?name:(name_ : personal_access_token_name option)
    ?user_id:(user_id_ : work_mail_identifier option)
    ?personal_access_token_id:(personal_access_token_id_ : personal_access_token_id option) () =
  ({
     scopes = scopes_;
     expires_time = expires_time_;
     date_last_used = date_last_used_;
     date_created = date_created_;
     name = name_;
     user_id = user_id_;
     personal_access_token_id = personal_access_token_id_;
   }
    : personal_access_token_summary)

let make_list_personal_access_tokens_response
    ?personal_access_token_summaries:
      (personal_access_token_summaries_ : personal_access_token_summary_list option)
    ?next_token:(next_token_ : next_token option) () =
  ({ personal_access_token_summaries = personal_access_token_summaries_; next_token = next_token_ }
    : list_personal_access_tokens_response)

let make_list_personal_access_tokens_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?user_id:(user_id_ : entity_identifier option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     user_id = user_id_;
     organization_id = organization_id_;
   }
    : list_personal_access_tokens_request)

let make_organization_summary ?state:(state_ : string_ option)
    ?error_message:(error_message_ : string_ option)
    ?default_mail_domain:(default_mail_domain_ : domain_name option)
    ?alias:(alias_ : organization_name option)
    ?organization_id:(organization_id_ : organization_id option) () =
  ({
     state = state_;
     error_message = error_message_;
     default_mail_domain = default_mail_domain_;
     alias = alias_;
     organization_id = organization_id_;
   }
    : organization_summary)

let make_list_organizations_response ?next_token:(next_token_ : next_token option)
    ?organization_summaries:(organization_summaries_ : organization_summaries option) () =
  ({ next_token = next_token_; organization_summaries = organization_summaries_ }
    : list_organizations_response)

let make_list_organizations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_organizations_request)

let make_mobile_device_access_rule ?date_modified:(date_modified_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?not_device_user_agents:(not_device_user_agents_ : device_user_agent_list option)
    ?device_user_agents:(device_user_agents_ : device_user_agent_list option)
    ?not_device_operating_systems:
      (not_device_operating_systems_ : device_operating_system_list option)
    ?device_operating_systems:(device_operating_systems_ : device_operating_system_list option)
    ?not_device_models:(not_device_models_ : device_model_list option)
    ?device_models:(device_models_ : device_model_list option)
    ?not_device_types:(not_device_types_ : device_type_list option)
    ?device_types:(device_types_ : device_type_list option)
    ?effect_:(effect__ : mobile_device_access_rule_effect option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ?name:(name_ : mobile_device_access_rule_name option)
    ?mobile_device_access_rule_id:
      (mobile_device_access_rule_id_ : mobile_device_access_rule_id option) () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     not_device_user_agents = not_device_user_agents_;
     device_user_agents = device_user_agents_;
     not_device_operating_systems = not_device_operating_systems_;
     device_operating_systems = device_operating_systems_;
     not_device_models = not_device_models_;
     device_models = device_models_;
     not_device_types = not_device_types_;
     device_types = device_types_;
     effect_ = effect__;
     description = description_;
     name = name_;
     mobile_device_access_rule_id = mobile_device_access_rule_id_;
   }
    : mobile_device_access_rule)

let make_list_mobile_device_access_rules_response
    ?rules:(rules_ : mobile_device_access_rules_list option) () =
  ({ rules = rules_ } : list_mobile_device_access_rules_response)

let make_list_mobile_device_access_rules_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : list_mobile_device_access_rules_request)

let make_mobile_device_access_override ?date_modified:(date_modified_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ?effect_:(effect__ : mobile_device_access_rule_effect option)
    ?device_id:(device_id_ : device_id option) ?user_id:(user_id_ : work_mail_identifier option) ()
    =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     description = description_;
     effect_ = effect__;
     device_id = device_id_;
     user_id = user_id_;
   }
    : mobile_device_access_override)

let make_list_mobile_device_access_overrides_response ?next_token:(next_token_ : next_token option)
    ?overrides:(overrides_ : mobile_device_access_overrides_list option) () =
  ({ next_token = next_token_; overrides = overrides_ }
    : list_mobile_device_access_overrides_response)

let make_list_mobile_device_access_overrides_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?device_id:(device_id_ : device_id option) ?user_id:(user_id_ : entity_identifier option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     device_id = device_id_;
     user_id = user_id_;
     organization_id = organization_id_;
   }
    : list_mobile_device_access_overrides_request)

let make_mail_domain_summary ?default_domain:(default_domain_ : boolean_ option)
    ?domain_name:(domain_name_ : domain_name option) () =
  ({ default_domain = default_domain_; domain_name = domain_name_ } : mail_domain_summary)

let make_list_mail_domains_response ?next_token:(next_token_ : next_token option)
    ?mail_domains:(mail_domains_ : mail_domains option) () =
  ({ next_token = next_token_; mail_domains = mail_domains_ } : list_mail_domains_response)

let make_list_mail_domains_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ next_token = next_token_; max_results = max_results_; organization_id = organization_id_ }
    : list_mail_domains_request)

let make_permission ~permission_values:(permission_values_ : permission_values)
    ~grantee_type:(grantee_type_ : member_type) ~grantee_id:(grantee_id_ : work_mail_identifier) ()
    =
  ({
     permission_values = permission_values_;
     grantee_type = grantee_type_;
     grantee_id = grantee_id_;
   }
    : permission)

let make_list_mailbox_permissions_response ?next_token:(next_token_ : next_token option)
    ?permissions:(permissions_ : permissions option) () =
  ({ next_token = next_token_; permissions = permissions_ } : list_mailbox_permissions_response)

let make_list_mailbox_permissions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~entity_id:(entity_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     entity_id = entity_id_;
     organization_id = organization_id_;
   }
    : list_mailbox_permissions_request)

let make_mailbox_export_job ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ?state:(state_ : mailbox_export_job_state option)
    ?estimated_progress:(estimated_progress_ : percentage option)
    ?s3_path:(s3_path_ : s3_object_key option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?description:(description_ : description option)
    ?entity_id:(entity_id_ : work_mail_identifier option)
    ?job_id:(job_id_ : mailbox_export_job_id option) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     state = state_;
     estimated_progress = estimated_progress_;
     s3_path = s3_path_;
     s3_bucket_name = s3_bucket_name_;
     description = description_;
     entity_id = entity_id_;
     job_id = job_id_;
   }
    : mailbox_export_job)

let make_list_mailbox_export_jobs_response ?next_token:(next_token_ : next_token option)
    ?jobs:(jobs_ : jobs option) () =
  ({ next_token = next_token_; jobs = jobs_ } : list_mailbox_export_jobs_response)

let make_list_mailbox_export_jobs_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ max_results = max_results_; next_token = next_token_; organization_id = organization_id_ }
    : list_mailbox_export_jobs_request)

let make_impersonation_role ?date_modified:(date_modified_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?type_:(type__ : impersonation_role_type option) ?name:(name_ : impersonation_role_name option)
    ?impersonation_role_id:(impersonation_role_id_ : impersonation_role_id option) () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     type_ = type__;
     name = name_;
     impersonation_role_id = impersonation_role_id_;
   }
    : impersonation_role)

let make_list_impersonation_roles_response ?next_token:(next_token_ : next_token option)
    ?roles:(roles_ : impersonation_role_list option) () =
  ({ next_token = next_token_; roles = roles_ } : list_impersonation_roles_response)

let make_list_impersonation_roles_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ max_results = max_results_; next_token = next_token_; organization_id = organization_id_ }
    : list_impersonation_roles_request)

let make_group_identifier ?group_name:(group_name_ : group_name option)
    ?group_id:(group_id_ : work_mail_identifier option) () =
  ({ group_name = group_name_; group_id = group_id_ } : group_identifier)

let make_list_groups_for_entity_response ?next_token:(next_token_ : next_token option)
    ?groups:(groups_ : group_identifiers option) () =
  ({ next_token = next_token_; groups = groups_ } : list_groups_for_entity_response)

let make_list_groups_for_entity_filters ?group_name_prefix:(group_name_prefix_ : string_ option) ()
    =
  ({ group_name_prefix = group_name_prefix_ } : list_groups_for_entity_filters)

let make_list_groups_for_entity_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : list_groups_for_entity_filters option)
    ~entity_id:(entity_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     entity_id = entity_id_;
     organization_id = organization_id_;
   }
    : list_groups_for_entity_request)

let make_group ?disabled_date:(disabled_date_ : timestamp option)
    ?enabled_date:(enabled_date_ : timestamp option) ?state:(state_ : entity_state option)
    ?name:(name_ : group_name option) ?email:(email_ : email_address option)
    ?id:(id_ : work_mail_identifier option) () =
  ({
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     name = name_;
     email = email_;
     id = id_;
   }
    : group)

let make_list_groups_response ?next_token:(next_token_ : next_token option)
    ?groups:(groups_ : groups option) () =
  ({ next_token = next_token_; groups = groups_ } : list_groups_response)

let make_list_groups_filters ?state:(state_ : entity_state option)
    ?primary_email_prefix:(primary_email_prefix_ : string_ option)
    ?name_prefix:(name_prefix_ : string_ option) () =
  ({ state = state_; primary_email_prefix = primary_email_prefix_; name_prefix = name_prefix_ }
    : list_groups_filters)

let make_list_groups_request ?filters:(filters_ : list_groups_filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     organization_id = organization_id_;
   }
    : list_groups_request)

let make_member ?disabled_date:(disabled_date_ : timestamp option)
    ?enabled_date:(enabled_date_ : timestamp option) ?state:(state_ : entity_state option)
    ?type_:(type__ : member_type option) ?name:(name_ : string_ option) ?id:(id_ : string_ option)
    () =
  ({
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     type_ = type__;
     name = name_;
     id = id_;
   }
    : member)

let make_list_group_members_response ?next_token:(next_token_ : next_token option)
    ?members:(members_ : members option) () =
  ({ next_token = next_token_; members = members_ } : list_group_members_response)

let make_list_group_members_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~group_id:(group_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     group_id = group_id_;
     organization_id = organization_id_;
   }
    : list_group_members_request)

let make_redacted_ews_availability_provider
    ?ews_username:(ews_username_ : external_user_name option)
    ?ews_endpoint:(ews_endpoint_ : url option) () =
  ({ ews_username = ews_username_; ews_endpoint = ews_endpoint_ }
    : redacted_ews_availability_provider)

let make_availability_configuration ?date_modified:(date_modified_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?lambda_provider:(lambda_provider_ : lambda_availability_provider option)
    ?ews_provider:(ews_provider_ : redacted_ews_availability_provider option)
    ?provider_type:(provider_type_ : availability_provider_type option)
    ?domain_name:(domain_name_ : domain_name option) () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     lambda_provider = lambda_provider_;
     ews_provider = ews_provider_;
     provider_type = provider_type_;
     domain_name = domain_name_;
   }
    : availability_configuration)

let make_list_availability_configurations_response ?next_token:(next_token_ : next_token option)
    ?availability_configurations:
      (availability_configurations_ : availability_configuration_list option) () =
  ({ next_token = next_token_; availability_configurations = availability_configurations_ }
    : list_availability_configurations_response)

let make_list_availability_configurations_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ next_token = next_token_; max_results = max_results_; organization_id = organization_id_ }
    : list_availability_configurations_request)

let make_list_aliases_response ?next_token:(next_token_ : next_token option)
    ?aliases:(aliases_ : aliases option) () =
  ({ next_token = next_token_; aliases = aliases_ } : list_aliases_response)

let make_list_aliases_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ~entity_id:(entity_id_ : work_mail_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     entity_id = entity_id_;
     organization_id = organization_id_;
   }
    : list_aliases_request)

let make_access_control_rule
    ?not_impersonation_role_ids:(not_impersonation_role_ids_ : impersonation_role_id_list option)
    ?impersonation_role_ids:(impersonation_role_ids_ : impersonation_role_id_list option)
    ?date_modified:(date_modified_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?not_user_ids:(not_user_ids_ : user_id_list option) ?user_ids:(user_ids_ : user_id_list option)
    ?not_actions:(not_actions_ : actions_list option) ?actions:(actions_ : actions_list option)
    ?not_ip_ranges:(not_ip_ranges_ : ip_range_list option)
    ?ip_ranges:(ip_ranges_ : ip_range_list option)
    ?description:(description_ : access_control_rule_description option)
    ?effect_:(effect__ : access_control_rule_effect option)
    ?name:(name_ : access_control_rule_name option) () =
  ({
     not_impersonation_role_ids = not_impersonation_role_ids_;
     impersonation_role_ids = impersonation_role_ids_;
     date_modified = date_modified_;
     date_created = date_created_;
     not_user_ids = not_user_ids_;
     user_ids = user_ids_;
     not_actions = not_actions_;
     actions = actions_;
     not_ip_ranges = not_ip_ranges_;
     ip_ranges = ip_ranges_;
     description = description_;
     effect_ = effect__;
     name = name_;
   }
    : access_control_rule)

let make_list_access_control_rules_response ?rules:(rules_ : access_control_rules_list option) () =
  ({ rules = rules_ } : list_access_control_rules_response)

let make_list_access_control_rules_request ~organization_id:(organization_id_ : organization_id) ()
    =
  ({ organization_id = organization_id_ } : list_access_control_rules_request)

let make_get_personal_access_token_metadata_response
    ?scopes:(scopes_ : personal_access_token_scope_list option)
    ?expires_time:(expires_time_ : timestamp option)
    ?date_last_used:(date_last_used_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?name:(name_ : personal_access_token_name option)
    ?user_id:(user_id_ : work_mail_identifier option)
    ?personal_access_token_id:(personal_access_token_id_ : personal_access_token_id option) () =
  ({
     scopes = scopes_;
     expires_time = expires_time_;
     date_last_used = date_last_used_;
     date_created = date_created_;
     name = name_;
     user_id = user_id_;
     personal_access_token_id = personal_access_token_id_;
   }
    : get_personal_access_token_metadata_response)

let make_get_personal_access_token_metadata_request
    ~personal_access_token_id:(personal_access_token_id_ : personal_access_token_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ personal_access_token_id = personal_access_token_id_; organization_id = organization_id_ }
    : get_personal_access_token_metadata_request)

let make_get_mobile_device_access_override_response
    ?date_modified:(date_modified_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ?effect_:(effect__ : mobile_device_access_rule_effect option)
    ?device_id:(device_id_ : device_id option) ?user_id:(user_id_ : work_mail_identifier option) ()
    =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     description = description_;
     effect_ = effect__;
     device_id = device_id_;
     user_id = user_id_;
   }
    : get_mobile_device_access_override_response)

let make_get_mobile_device_access_override_request ~device_id:(device_id_ : device_id)
    ~user_id:(user_id_ : entity_identifier) ~organization_id:(organization_id_ : organization_id) ()
    =
  ({ device_id = device_id_; user_id = user_id_; organization_id = organization_id_ }
    : get_mobile_device_access_override_request)

let make_mobile_device_access_matched_rule ?name:(name_ : mobile_device_access_rule_name option)
    ?mobile_device_access_rule_id:
      (mobile_device_access_rule_id_ : mobile_device_access_rule_id option) () =
  ({ name = name_; mobile_device_access_rule_id = mobile_device_access_rule_id_ }
    : mobile_device_access_matched_rule)

let make_get_mobile_device_access_effect_response
    ?matched_rules:(matched_rules_ : mobile_device_access_matched_rule_list option)
    ?effect_:(effect__ : mobile_device_access_rule_effect option) () =
  ({ matched_rules = matched_rules_; effect_ = effect__ }
    : get_mobile_device_access_effect_response)

let make_get_mobile_device_access_effect_request
    ?device_user_agent:(device_user_agent_ : device_user_agent option)
    ?device_operating_system:(device_operating_system_ : device_operating_system option)
    ?device_model:(device_model_ : device_model option)
    ?device_type:(device_type_ : device_type option)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     device_user_agent = device_user_agent_;
     device_operating_system = device_operating_system_;
     device_model = device_model_;
     device_type = device_type_;
     organization_id = organization_id_;
   }
    : get_mobile_device_access_effect_request)

let make_dns_record ?value:(value_ : string_ option) ?hostname:(hostname_ : string_ option)
    ?type_:(type__ : string_ option) () =
  ({ value = value_; hostname = hostname_; type_ = type__ } : dns_record)

let make_get_mail_domain_response
    ?dkim_verification_status:(dkim_verification_status_ : dns_record_verification_status option)
    ?ownership_verification_status:
      (ownership_verification_status_ : dns_record_verification_status option)
    ?is_default:(is_default_ : boolean_ option) ?is_test_domain:(is_test_domain_ : boolean_ option)
    ?records:(records_ : dns_records option) () =
  ({
     dkim_verification_status = dkim_verification_status_;
     ownership_verification_status = ownership_verification_status_;
     is_default = is_default_;
     is_test_domain = is_test_domain_;
     records = records_;
   }
    : get_mail_domain_response)

let make_get_mail_domain_request ~domain_name:(domain_name_ : work_mail_domain_name)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ domain_name = domain_name_; organization_id = organization_id_ } : get_mail_domain_request)

let make_get_mailbox_details_response ?mailbox_size:(mailbox_size_ : mailbox_size option)
    ?mailbox_quota:(mailbox_quota_ : mailbox_quota option) () =
  ({ mailbox_size = mailbox_size_; mailbox_quota = mailbox_quota_ } : get_mailbox_details_response)

let make_get_mailbox_details_request ~user_id:(user_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ user_id = user_id_; organization_id = organization_id_ } : get_mailbox_details_request)

let make_impersonation_matched_rule ?name:(name_ : impersonation_rule_name option)
    ?impersonation_rule_id:(impersonation_rule_id_ : impersonation_rule_id option) () =
  ({ name = name_; impersonation_rule_id = impersonation_rule_id_ } : impersonation_matched_rule)

let make_get_impersonation_role_effect_response
    ?matched_rules:(matched_rules_ : impersonation_matched_rule_list option)
    ?effect_:(effect__ : access_effect option) ?type_:(type__ : impersonation_role_type option) () =
  ({ matched_rules = matched_rules_; effect_ = effect__; type_ = type__ }
    : get_impersonation_role_effect_response)

let make_get_impersonation_role_effect_request ~target_user:(target_user_ : entity_identifier)
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     target_user = target_user_;
     impersonation_role_id = impersonation_role_id_;
     organization_id = organization_id_;
   }
    : get_impersonation_role_effect_request)

let make_get_impersonation_role_response ?date_modified:(date_modified_ : timestamp option)
    ?date_created:(date_created_ : timestamp option)
    ?rules:(rules_ : impersonation_rule_list option)
    ?description:(description_ : impersonation_role_description option)
    ?type_:(type__ : impersonation_role_type option) ?name:(name_ : impersonation_role_name option)
    ?impersonation_role_id:(impersonation_role_id_ : impersonation_role_id option) () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     rules = rules_;
     description = description_;
     type_ = type__;
     name = name_;
     impersonation_role_id = impersonation_role_id_;
   }
    : get_impersonation_role_response)

let make_get_impersonation_role_request
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ impersonation_role_id = impersonation_role_id_; organization_id = organization_id_ }
    : get_impersonation_role_request)

let make_get_default_retention_policy_response
    ?folder_configurations:(folder_configurations_ : folder_configurations option)
    ?description:(description_ : string_ option) ?name:(name_ : short_string option)
    ?id:(id_ : short_string option) () =
  ({
     folder_configurations = folder_configurations_;
     description = description_;
     name = name_;
     id = id_;
   }
    : get_default_retention_policy_response)

let make_get_default_retention_policy_request ~organization_id:(organization_id_ : organization_id)
    () =
  ({ organization_id = organization_id_ } : get_default_retention_policy_request)

let make_get_access_control_effect_response
    ?matched_rules:(matched_rules_ : access_control_rule_name_list option)
    ?effect_:(effect__ : access_control_rule_effect option) () =
  ({ matched_rules = matched_rules_; effect_ = effect__ } : get_access_control_effect_response)

let make_get_access_control_effect_request
    ?impersonation_role_id:(impersonation_role_id_ : impersonation_role_id option)
    ?user_id:(user_id_ : work_mail_identifier option) ~action:(action_ : access_control_rule_action)
    ~ip_address:(ip_address_ : ip_address) ~organization_id:(organization_id_ : organization_id) ()
    =
  ({
     impersonation_role_id = impersonation_role_id_;
     user_id = user_id_;
     action = action_;
     ip_address = ip_address_;
     organization_id = organization_id_;
   }
    : get_access_control_effect_request)

let make_disassociate_member_from_group_response () = (() : unit)

let make_disassociate_member_from_group_request ~member_id:(member_id_ : entity_identifier)
    ~group_id:(group_id_ : entity_identifier) ~organization_id:(organization_id_ : organization_id)
    () =
  ({ member_id = member_id_; group_id = group_id_; organization_id = organization_id_ }
    : disassociate_member_from_group_request)

let make_disassociate_delegate_from_resource_response () = (() : unit)

let make_disassociate_delegate_from_resource_request ~entity_id:(entity_id_ : entity_identifier)
    ~resource_id:(resource_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ entity_id = entity_id_; resource_id = resource_id_; organization_id = organization_id_ }
    : disassociate_delegate_from_resource_request)

let make_describe_user_response
    ?identity_provider_identity_store_id:
      (identity_provider_identity_store_id_ : identity_provider_identity_store_id option)
    ?identity_provider_user_id:(identity_provider_user_id_ : identity_provider_user_id option)
    ?office:(office_ : user_attribute option) ?country:(country_ : user_attribute option)
    ?department:(department_ : user_attribute option) ?zip_code:(zip_code_ : user_attribute option)
    ?company:(company_ : user_attribute option) ?city:(city_ : user_attribute option)
    ?job_title:(job_title_ : user_attribute option) ?street:(street_ : user_attribute option)
    ?telephone:(telephone_ : user_attribute option) ?initials:(initials_ : user_attribute option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ?last_name:(last_name_ : user_attribute option)
    ?first_name:(first_name_ : user_attribute option)
    ?mailbox_deprovisioned_date:(mailbox_deprovisioned_date_ : timestamp option)
    ?mailbox_provisioned_date:(mailbox_provisioned_date_ : timestamp option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?enabled_date:(enabled_date_ : timestamp option) ?user_role:(user_role_ : user_role option)
    ?state:(state_ : entity_state option) ?display_name:(display_name_ : user_attribute option)
    ?email:(email_ : email_address option) ?name:(name_ : user_name option)
    ?user_id:(user_id_ : work_mail_identifier option) () =
  ({
     identity_provider_identity_store_id = identity_provider_identity_store_id_;
     identity_provider_user_id = identity_provider_user_id_;
     office = office_;
     country = country_;
     department = department_;
     zip_code = zip_code_;
     company = company_;
     city = city_;
     job_title = job_title_;
     street = street_;
     telephone = telephone_;
     initials = initials_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
     last_name = last_name_;
     first_name = first_name_;
     mailbox_deprovisioned_date = mailbox_deprovisioned_date_;
     mailbox_provisioned_date = mailbox_provisioned_date_;
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     user_role = user_role_;
     state = state_;
     display_name = display_name_;
     email = email_;
     name = name_;
     user_id = user_id_;
   }
    : describe_user_response)

let make_describe_user_request ~user_id:(user_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ user_id = user_id_; organization_id = organization_id_ } : describe_user_request)

let make_describe_resource_response
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ?description:(description_ : resource_description option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?enabled_date:(enabled_date_ : timestamp option) ?state:(state_ : entity_state option)
    ?booking_options:(booking_options_ : booking_options option)
    ?type_:(type__ : resource_type option) ?name:(name_ : resource_name option)
    ?email:(email_ : email_address option) ?resource_id:(resource_id_ : resource_id option) () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     description = description_;
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     booking_options = booking_options_;
     type_ = type__;
     name = name_;
     email = email_;
     resource_id = resource_id_;
   }
    : describe_resource_response)

let make_describe_resource_request ~resource_id:(resource_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ resource_id = resource_id_; organization_id = organization_id_ } : describe_resource_request)

let make_describe_organization_response
    ?interoperability_enabled:(interoperability_enabled_ : boolean_ option)
    ?migration_admin:(migration_admin_ : work_mail_identifier option)
    ?ar_n:(ar_n_ : amazon_resource_name option) ?error_message:(error_message_ : string_ option)
    ?completed_date:(completed_date_ : timestamp option)
    ?default_mail_domain:(default_mail_domain_ : string_ option)
    ?directory_type:(directory_type_ : string_ option)
    ?directory_id:(directory_id_ : string_ option) ?state:(state_ : string_ option)
    ?alias:(alias_ : organization_name option)
    ?organization_id:(organization_id_ : organization_id option) () =
  ({
     interoperability_enabled = interoperability_enabled_;
     migration_admin = migration_admin_;
     ar_n = ar_n_;
     error_message = error_message_;
     completed_date = completed_date_;
     default_mail_domain = default_mail_domain_;
     directory_type = directory_type_;
     directory_id = directory_id_;
     state = state_;
     alias = alias_;
     organization_id = organization_id_;
   }
    : describe_organization_response)

let make_describe_organization_request ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : describe_organization_request)

let make_describe_mailbox_export_job_response ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?error_info:(error_info_ : mailbox_export_error_info option)
    ?state:(state_ : mailbox_export_job_state option)
    ?estimated_progress:(estimated_progress_ : percentage option)
    ?s3_path:(s3_path_ : s3_object_key option) ?s3_prefix:(s3_prefix_ : s3_object_key option)
    ?s3_bucket_name:(s3_bucket_name_ : s3_bucket_name option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?role_arn:(role_arn_ : role_arn option)
    ?description:(description_ : description option)
    ?entity_id:(entity_id_ : work_mail_identifier option) () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     error_info = error_info_;
     state = state_;
     estimated_progress = estimated_progress_;
     s3_path = s3_path_;
     s3_prefix = s3_prefix_;
     s3_bucket_name = s3_bucket_name_;
     kms_key_arn = kms_key_arn_;
     role_arn = role_arn_;
     description = description_;
     entity_id = entity_id_;
   }
    : describe_mailbox_export_job_response)

let make_describe_mailbox_export_job_request ~organization_id:(organization_id_ : organization_id)
    ~job_id:(job_id_ : mailbox_export_job_id) () =
  ({ organization_id = organization_id_; job_id = job_id_ } : describe_mailbox_export_job_request)

let make_describe_inbound_dmarc_settings_response ?enforced:(enforced_ : boolean_ option) () =
  ({ enforced = enforced_ } : describe_inbound_dmarc_settings_response)

let make_describe_inbound_dmarc_settings_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : describe_inbound_dmarc_settings_request)

let make_describe_identity_provider_configuration_response
    ?personal_access_token_configuration:
      (personal_access_token_configuration_ : personal_access_token_configuration option)
    ?identity_center_configuration:
      (identity_center_configuration_ : identity_center_configuration option)
    ?authentication_mode:(authentication_mode_ : identity_provider_authentication_mode option) () =
  ({
     personal_access_token_configuration = personal_access_token_configuration_;
     identity_center_configuration = identity_center_configuration_;
     authentication_mode = authentication_mode_;
   }
    : describe_identity_provider_configuration_response)

let make_describe_identity_provider_configuration_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : describe_identity_provider_configuration_request)

let make_describe_group_response
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ?disabled_date:(disabled_date_ : timestamp option)
    ?enabled_date:(enabled_date_ : timestamp option) ?state:(state_ : entity_state option)
    ?email:(email_ : email_address option) ?name:(name_ : group_name option)
    ?group_id:(group_id_ : work_mail_identifier option) () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     email = email_;
     name = name_;
     group_id = group_id_;
   }
    : describe_group_response)

let make_describe_group_request ~group_id:(group_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ group_id = group_id_; organization_id = organization_id_ } : describe_group_request)

let make_describe_entity_response ?type_:(type__ : entity_type option)
    ?name:(name_ : string_ option) ?entity_id:(entity_id_ : work_mail_identifier option) () =
  ({ type_ = type__; name = name_; entity_id = entity_id_ } : describe_entity_response)

let make_describe_entity_request ~email:(email_ : email_address)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ email = email_; organization_id = organization_id_ } : describe_entity_request)

let make_describe_email_monitoring_configuration_response
    ?log_group_arn:(log_group_arn_ : log_group_arn option) ?role_arn:(role_arn_ : role_arn option)
    () =
  ({ log_group_arn = log_group_arn_; role_arn = role_arn_ }
    : describe_email_monitoring_configuration_response)

let make_describe_email_monitoring_configuration_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : describe_email_monitoring_configuration_request)

let make_deregister_mail_domain_response () = (() : unit)

let make_deregister_mail_domain_request ~domain_name:(domain_name_ : work_mail_domain_name)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ domain_name = domain_name_; organization_id = organization_id_ }
    : deregister_mail_domain_request)

let make_deregister_from_work_mail_response () = (() : unit)

let make_deregister_from_work_mail_request ~entity_id:(entity_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ entity_id = entity_id_; organization_id = organization_id_ }
    : deregister_from_work_mail_request)

let make_delete_user_response () = (() : unit)

let make_delete_user_request ~user_id:(user_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ user_id = user_id_; organization_id = organization_id_ } : delete_user_request)

let make_delete_retention_policy_response () = (() : unit)

let make_delete_retention_policy_request ~id:(id_ : short_string)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ id = id_; organization_id = organization_id_ } : delete_retention_policy_request)

let make_delete_resource_response () = (() : unit)

let make_delete_resource_request ~resource_id:(resource_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ resource_id = resource_id_; organization_id = organization_id_ } : delete_resource_request)

let make_delete_personal_access_token_response () = (() : unit)

let make_delete_personal_access_token_request
    ~personal_access_token_id:(personal_access_token_id_ : personal_access_token_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ personal_access_token_id = personal_access_token_id_; organization_id = organization_id_ }
    : delete_personal_access_token_request)

let make_delete_organization_response ?state:(state_ : string_ option)
    ?organization_id:(organization_id_ : organization_id option) () =
  ({ state = state_; organization_id = organization_id_ } : delete_organization_response)

let make_delete_organization_request
    ?delete_identity_center_application:(delete_identity_center_application_ : boolean_ option)
    ?force_delete:(force_delete_ : boolean_ option)
    ?client_token:(client_token_ : idempotency_client_token option)
    ~delete_directory:(delete_directory_ : boolean_)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     delete_identity_center_application = delete_identity_center_application_;
     force_delete = force_delete_;
     delete_directory = delete_directory_;
     organization_id = organization_id_;
     client_token = client_token_;
   }
    : delete_organization_request)

let make_delete_mobile_device_access_rule_response () = (() : unit)

let make_delete_mobile_device_access_rule_request
    ~mobile_device_access_rule_id:(mobile_device_access_rule_id_ : mobile_device_access_rule_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     mobile_device_access_rule_id = mobile_device_access_rule_id_;
     organization_id = organization_id_;
   }
    : delete_mobile_device_access_rule_request)

let make_delete_mobile_device_access_override_response () = (() : unit)

let make_delete_mobile_device_access_override_request ~device_id:(device_id_ : device_id)
    ~user_id:(user_id_ : entity_identifier) ~organization_id:(organization_id_ : organization_id) ()
    =
  ({ device_id = device_id_; user_id = user_id_; organization_id = organization_id_ }
    : delete_mobile_device_access_override_request)

let make_delete_mailbox_permissions_response () = (() : unit)

let make_delete_mailbox_permissions_request ~grantee_id:(grantee_id_ : entity_identifier)
    ~entity_id:(entity_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ grantee_id = grantee_id_; entity_id = entity_id_; organization_id = organization_id_ }
    : delete_mailbox_permissions_request)

let make_delete_impersonation_role_response () = (() : unit)

let make_delete_impersonation_role_request
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ impersonation_role_id = impersonation_role_id_; organization_id = organization_id_ }
    : delete_impersonation_role_request)

let make_delete_identity_provider_configuration_response () = (() : unit)

let make_delete_identity_provider_configuration_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : delete_identity_provider_configuration_request)

let make_delete_identity_center_application_response () = (() : unit)

let make_delete_identity_center_application_request
    ~application_arn:(application_arn_ : application_arn) () =
  ({ application_arn = application_arn_ } : delete_identity_center_application_request)

let make_delete_group_response () = (() : unit)

let make_delete_group_request ~group_id:(group_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ group_id = group_id_; organization_id = organization_id_ } : delete_group_request)

let make_delete_email_monitoring_configuration_response () = (() : unit)

let make_delete_email_monitoring_configuration_request
    ~organization_id:(organization_id_ : organization_id) () =
  ({ organization_id = organization_id_ } : delete_email_monitoring_configuration_request)

let make_delete_availability_configuration_response () = (() : unit)

let make_delete_availability_configuration_request ~domain_name:(domain_name_ : domain_name)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ domain_name = domain_name_; organization_id = organization_id_ }
    : delete_availability_configuration_request)

let make_delete_alias_response () = (() : unit)

let make_delete_alias_request ~alias:(alias_ : email_address)
    ~entity_id:(entity_id_ : work_mail_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ alias = alias_; entity_id = entity_id_; organization_id = organization_id_ }
    : delete_alias_request)

let make_delete_access_control_rule_response () = (() : unit)

let make_delete_access_control_rule_request ~name:(name_ : access_control_rule_name)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ name = name_; organization_id = organization_id_ } : delete_access_control_rule_request)

let make_create_user_response ?user_id:(user_id_ : work_mail_identifier option) () =
  ({ user_id = user_id_ } : create_user_response)

let make_create_user_request
    ?identity_provider_user_id:(identity_provider_user_id_ : identity_provider_user_id option)
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ?last_name:(last_name_ : user_attribute option)
    ?first_name:(first_name_ : user_attribute option) ?role:(role_ : user_role option)
    ?password:(password_ : password option) ~display_name:(display_name_ : user_attribute)
    ~name:(name_ : user_name) ~organization_id:(organization_id_ : organization_id) () =
  ({
     identity_provider_user_id = identity_provider_user_id_;
     hidden_from_global_address_list = hidden_from_global_address_list_;
     last_name = last_name_;
     first_name = first_name_;
     role = role_;
     password = password_;
     display_name = display_name_;
     name = name_;
     organization_id = organization_id_;
   }
    : create_user_request)

let make_create_resource_response ?resource_id:(resource_id_ : resource_id option) () =
  ({ resource_id = resource_id_ } : create_resource_response)

let make_create_resource_request
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ?description:(description_ : resource_description option) ~type_:(type__ : resource_type)
    ~name:(name_ : resource_name) ~organization_id:(organization_id_ : organization_id) () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     description = description_;
     type_ = type__;
     name = name_;
     organization_id = organization_id_;
   }
    : create_resource_request)

let make_create_organization_response ?organization_id:(organization_id_ : organization_id option)
    () =
  ({ organization_id = organization_id_ } : create_organization_response)

let make_domain ?hosted_zone_id:(hosted_zone_id_ : hosted_zone_id option)
    ~domain_name:(domain_name_ : domain_name) () =
  ({ hosted_zone_id = hosted_zone_id_; domain_name = domain_name_ } : domain)

let make_create_organization_request
    ?enable_interoperability:(enable_interoperability_ : boolean_ option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?domains:(domains_ : domains option)
    ?client_token:(client_token_ : idempotency_client_token option)
    ?directory_id:(directory_id_ : directory_id option) ~alias:(alias_ : organization_name) () =
  ({
     enable_interoperability = enable_interoperability_;
     kms_key_arn = kms_key_arn_;
     domains = domains_;
     client_token = client_token_;
     alias = alias_;
     directory_id = directory_id_;
   }
    : create_organization_request)

let make_create_mobile_device_access_rule_response
    ?mobile_device_access_rule_id:
      (mobile_device_access_rule_id_ : mobile_device_access_rule_id option) () =
  ({ mobile_device_access_rule_id = mobile_device_access_rule_id_ }
    : create_mobile_device_access_rule_response)

let make_create_mobile_device_access_rule_request
    ?not_device_user_agents:(not_device_user_agents_ : device_user_agent_list option)
    ?device_user_agents:(device_user_agents_ : device_user_agent_list option)
    ?not_device_operating_systems:
      (not_device_operating_systems_ : device_operating_system_list option)
    ?device_operating_systems:(device_operating_systems_ : device_operating_system_list option)
    ?not_device_models:(not_device_models_ : device_model_list option)
    ?device_models:(device_models_ : device_model_list option)
    ?not_device_types:(not_device_types_ : device_type_list option)
    ?device_types:(device_types_ : device_type_list option)
    ?description:(description_ : mobile_device_access_rule_description option)
    ?client_token:(client_token_ : idempotency_client_token option)
    ~effect_:(effect__ : mobile_device_access_rule_effect)
    ~name:(name_ : mobile_device_access_rule_name)
    ~organization_id:(organization_id_ : organization_id) () =
  ({
     not_device_user_agents = not_device_user_agents_;
     device_user_agents = device_user_agents_;
     not_device_operating_systems = not_device_operating_systems_;
     device_operating_systems = device_operating_systems_;
     not_device_models = not_device_models_;
     device_models = device_models_;
     not_device_types = not_device_types_;
     device_types = device_types_;
     effect_ = effect__;
     description = description_;
     name = name_;
     client_token = client_token_;
     organization_id = organization_id_;
   }
    : create_mobile_device_access_rule_request)

let make_create_impersonation_role_response
    ?impersonation_role_id:(impersonation_role_id_ : impersonation_role_id option) () =
  ({ impersonation_role_id = impersonation_role_id_ } : create_impersonation_role_response)

let make_create_impersonation_role_request
    ?description:(description_ : impersonation_role_description option)
    ?client_token:(client_token_ : idempotency_client_token option)
    ~rules:(rules_ : impersonation_rule_list) ~type_:(type__ : impersonation_role_type)
    ~name:(name_ : impersonation_role_name) ~organization_id:(organization_id_ : organization_id) ()
    =
  ({
     rules = rules_;
     description = description_;
     type_ = type__;
     name = name_;
     organization_id = organization_id_;
     client_token = client_token_;
   }
    : create_impersonation_role_request)

let make_create_identity_center_application_response
    ?application_arn:(application_arn_ : application_arn option) () =
  ({ application_arn = application_arn_ } : create_identity_center_application_response)

let make_create_identity_center_application_request
    ?client_token:(client_token_ : idempotency_client_token option)
    ~instance_arn:(instance_arn_ : instance_arn) ~name:(name_ : identity_center_application_name) ()
    =
  ({ client_token = client_token_; instance_arn = instance_arn_; name = name_ }
    : create_identity_center_application_request)

let make_create_group_response ?group_id:(group_id_ : work_mail_identifier option) () =
  ({ group_id = group_id_ } : create_group_response)

let make_create_group_request
    ?hidden_from_global_address_list:(hidden_from_global_address_list_ : boolean_ option)
    ~name:(name_ : group_name) ~organization_id:(organization_id_ : organization_id) () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     name = name_;
     organization_id = organization_id_;
   }
    : create_group_request)

let make_create_availability_configuration_response () = (() : unit)

let make_create_availability_configuration_request
    ?lambda_provider:(lambda_provider_ : lambda_availability_provider option)
    ?ews_provider:(ews_provider_ : ews_availability_provider option)
    ?client_token:(client_token_ : idempotency_client_token option)
    ~domain_name:(domain_name_ : domain_name) ~organization_id:(organization_id_ : organization_id)
    () =
  ({
     lambda_provider = lambda_provider_;
     ews_provider = ews_provider_;
     domain_name = domain_name_;
     organization_id = organization_id_;
     client_token = client_token_;
   }
    : create_availability_configuration_request)

let make_create_alias_response () = (() : unit)

let make_create_alias_request ~alias:(alias_ : email_address)
    ~entity_id:(entity_id_ : work_mail_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ alias = alias_; entity_id = entity_id_; organization_id = organization_id_ }
    : create_alias_request)

let make_cancel_mailbox_export_job_response () = (() : unit)

let make_cancel_mailbox_export_job_request ~organization_id:(organization_id_ : organization_id)
    ~job_id:(job_id_ : mailbox_export_job_id)
    ~client_token:(client_token_ : idempotency_client_token) () =
  ({ organization_id = organization_id_; job_id = job_id_; client_token = client_token_ }
    : cancel_mailbox_export_job_request)

let make_assume_impersonation_role_response ?expires_in:(expires_in_ : expires_in option)
    ?token:(token_ : impersonation_token option) () =
  ({ expires_in = expires_in_; token = token_ } : assume_impersonation_role_response)

let make_assume_impersonation_role_request
    ~impersonation_role_id:(impersonation_role_id_ : impersonation_role_id)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ impersonation_role_id = impersonation_role_id_; organization_id = organization_id_ }
    : assume_impersonation_role_request)

let make_associate_member_to_group_response () = (() : unit)

let make_associate_member_to_group_request ~member_id:(member_id_ : entity_identifier)
    ~group_id:(group_id_ : entity_identifier) ~organization_id:(organization_id_ : organization_id)
    () =
  ({ member_id = member_id_; group_id = group_id_; organization_id = organization_id_ }
    : associate_member_to_group_request)

let make_associate_delegate_to_resource_response () = (() : unit)

let make_associate_delegate_to_resource_request ~entity_id:(entity_id_ : entity_identifier)
    ~resource_id:(resource_id_ : entity_identifier)
    ~organization_id:(organization_id_ : organization_id) () =
  ({ entity_id = entity_id_; resource_id = resource_id_; organization_id = organization_id_ }
    : associate_delegate_to_resource_request)
