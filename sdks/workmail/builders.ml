open Smaws_Lib
open Types
let make_update_user_response () = (() : update_user_response)
let make_update_user_request ?office:(office_ : string option) 
  ?country:(country_ : string option) 
  ?department:(department_ : string option) 
  ?zip_code:(zip_code_ : string option)  ?company:(company_ : string option) 
  ?city:(city_ : string option)  ?job_title:(job_title_ : string option) 
  ?street:(street_ : string option)  ?telephone:(telephone_ : string option) 
  ?initials:(initials_ : string option) 
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ?last_name:(last_name_ : string option) 
  ?first_name:(first_name_ : string option) 
  ?display_name:(display_name_ : string option) 
  ?role:(role_ : user_role option)  ~user_id:(user_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
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
     organization_id = organization_id_
   } : update_user_request)
let make_update_resource_response () = (() : update_resource_response)
let make_booking_options
  ?auto_decline_conflicting_requests:(auto_decline_conflicting_requests_ :
                                       bool option)
   ?auto_decline_recurring_requests:(auto_decline_recurring_requests_ :
                                      bool option)
   ?auto_accept_requests:(auto_accept_requests_ : bool option)  () =
  ({
     auto_decline_conflicting_requests = auto_decline_conflicting_requests_;
     auto_decline_recurring_requests = auto_decline_recurring_requests_;
     auto_accept_requests = auto_accept_requests_
   } : booking_options)
let make_update_resource_request
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ?type_:(type__ : resource_type option) 
  ?description:(description_ : string option) 
  ?booking_options:(booking_options_ : booking_options option) 
  ?name:(name_ : string option)  ~resource_id:(resource_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     type_ = type__;
     description = description_;
     booking_options = booking_options_;
     name = name_;
     resource_id = resource_id_;
     organization_id = organization_id_
   } : update_resource_request)
let make_update_primary_email_address_response () =
  (() : update_primary_email_address_response)
let make_update_primary_email_address_request ~email:(email_ : string) 
  ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     email = email_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : update_primary_email_address_request)
let make_update_mobile_device_access_rule_response () =
  (() : update_mobile_device_access_rule_response)
let make_update_mobile_device_access_rule_request
  ?not_device_user_agents:(not_device_user_agents_ : string list option) 
  ?device_user_agents:(device_user_agents_ : string list option) 
  ?not_device_operating_systems:(not_device_operating_systems_ :
                                  string list option)
   ?device_operating_systems:(device_operating_systems_ : string list option)
   ?not_device_models:(not_device_models_ : string list option) 
  ?device_models:(device_models_ : string list option) 
  ?not_device_types:(not_device_types_ : string list option) 
  ?device_types:(device_types_ : string list option) 
  ?description:(description_ : string option) 
  ~effect_:(effect__ : mobile_device_access_rule_effect) 
  ~name:(name_ : string) 
  ~mobile_device_access_rule_id:(mobile_device_access_rule_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
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
     organization_id = organization_id_
   } : update_mobile_device_access_rule_request)
let make_update_mailbox_quota_response () =
  (() : update_mailbox_quota_response)
let make_update_mailbox_quota_request ~mailbox_quota:(mailbox_quota_ : int) 
  ~user_id:(user_id_ : string)  ~organization_id:(organization_id_ : string) 
  () =
  ({
     mailbox_quota = mailbox_quota_;
     user_id = user_id_;
     organization_id = organization_id_
   } : update_mailbox_quota_request)
let make_update_impersonation_role_response () =
  (() : update_impersonation_role_response)
let make_impersonation_rule
  ?not_target_users:(not_target_users_ : string list option) 
  ?target_users:(target_users_ : string list option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ~effect_:(effect__ : access_effect) 
  ~impersonation_rule_id:(impersonation_rule_id_ : string)  () =
  ({
     not_target_users = not_target_users_;
     target_users = target_users_;
     effect_ = effect__;
     description = description_;
     name = name_;
     impersonation_rule_id = impersonation_rule_id_
   } : impersonation_rule)
let make_update_impersonation_role_request
  ?description:(description_ : string option) 
  ~rules:(rules_ : impersonation_rule list) 
  ~type_:(type__ : impersonation_role_type)  ~name:(name_ : string) 
  ~impersonation_role_id:(impersonation_role_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     rules = rules_;
     description = description_;
     type_ = type__;
     name = name_;
     impersonation_role_id = impersonation_role_id_;
     organization_id = organization_id_
   } : update_impersonation_role_request)
let make_update_group_response () = (() : update_group_response)
let make_update_group_request
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ~group_id:(group_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     group_id = group_id_;
     organization_id = organization_id_
   } : update_group_request)
let make_update_default_mail_domain_response () =
  (() : update_default_mail_domain_response)
let make_update_default_mail_domain_request
  ~domain_name:(domain_name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ domain_name = domain_name_; organization_id = organization_id_ } : 
  update_default_mail_domain_request)
let make_update_availability_configuration_response () =
  (() : update_availability_configuration_response)
let make_ews_availability_provider ~ews_password:(ews_password_ : string) 
  ~ews_username:(ews_username_ : string) 
  ~ews_endpoint:(ews_endpoint_ : string)  () =
  ({
     ews_password = ews_password_;
     ews_username = ews_username_;
     ews_endpoint = ews_endpoint_
   } : ews_availability_provider)
let make_lambda_availability_provider ~lambda_arn:(lambda_arn_ : string)  ()
  = ({ lambda_arn = lambda_arn_ } : lambda_availability_provider)
let make_update_availability_configuration_request
  ?lambda_provider:(lambda_provider_ : lambda_availability_provider option) 
  ?ews_provider:(ews_provider_ : ews_availability_provider option) 
  ~domain_name:(domain_name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     lambda_provider = lambda_provider_;
     ews_provider = ews_provider_;
     domain_name = domain_name_;
     organization_id = organization_id_
   } : update_availability_configuration_request)
let make_untag_resource_response () = (() : untag_resource_response)
let make_untag_resource_request ~tag_keys:(tag_keys_ : string list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)
let make_test_availability_configuration_response
  ?failure_reason:(failure_reason_ : string option) 
  ?test_passed:(test_passed_ : bool option)  () =
  ({ failure_reason = failure_reason_; test_passed = test_passed_ } : 
  test_availability_configuration_response)
let make_test_availability_configuration_request
  ?lambda_provider:(lambda_provider_ : lambda_availability_provider option) 
  ?ews_provider:(ews_provider_ : ews_availability_provider option) 
  ?domain_name:(domain_name_ : string option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     lambda_provider = lambda_provider_;
     ews_provider = ews_provider_;
     domain_name = domain_name_;
     organization_id = organization_id_
   } : test_availability_configuration_request)
let make_tag_resource_response () = (() : tag_resource_response)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_request ~tags:(tags_ : tag list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)
let make_start_mailbox_export_job_response ?job_id:(job_id_ : string option) 
  () = ({ job_id = job_id_ } : start_mailbox_export_job_response)
let make_start_mailbox_export_job_request
  ?description:(description_ : string option) 
  ~s3_prefix:(s3_prefix_ : string) 
  ~s3_bucket_name:(s3_bucket_name_ : string) 
  ~kms_key_arn:(kms_key_arn_ : string)  ~role_arn:(role_arn_ : string) 
  ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string) 
  ~client_token:(client_token_ : string)  () =
  ({
     s3_prefix = s3_prefix_;
     s3_bucket_name = s3_bucket_name_;
     kms_key_arn = kms_key_arn_;
     role_arn = role_arn_;
     description = description_;
     entity_id = entity_id_;
     organization_id = organization_id_;
     client_token = client_token_
   } : start_mailbox_export_job_request)
let make_reset_password_response () = (() : reset_password_response)
let make_reset_password_request ~password:(password_ : string) 
  ~user_id:(user_id_ : string)  ~organization_id:(organization_id_ : string) 
  () =
  ({
     password = password_;
     user_id = user_id_;
     organization_id = organization_id_
   } : reset_password_request)
let make_register_to_work_mail_response () =
  (() : register_to_work_mail_response)
let make_register_to_work_mail_request ~email:(email_ : string) 
  ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     email = email_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : register_to_work_mail_request)
let make_register_mail_domain_response () =
  (() : register_mail_domain_response)
let make_register_mail_domain_request
  ?client_token:(client_token_ : string option) 
  ~domain_name:(domain_name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     domain_name = domain_name_;
     organization_id = organization_id_;
     client_token = client_token_
   } : register_mail_domain_request)
let make_put_retention_policy_response () =
  (() : put_retention_policy_response)
let make_folder_configuration ?period:(period_ : int option) 
  ~action:(action_ : retention_action)  ~name:(name_ : folder_name)  () =
  ({ period = period_; action = action_; name = name_ } : folder_configuration)
let make_put_retention_policy_request
  ?description:(description_ : string option)  ?id:(id_ : string option) 
  ~folder_configurations:(folder_configurations_ : folder_configuration list)
   ~name:(name_ : string)  ~organization_id:(organization_id_ : string)  () =
  ({
     folder_configurations = folder_configurations_;
     description = description_;
     name = name_;
     id = id_;
     organization_id = organization_id_
   } : put_retention_policy_request)
let make_put_mobile_device_access_override_response () =
  (() : put_mobile_device_access_override_response)
let make_put_mobile_device_access_override_request
  ?description:(description_ : string option) 
  ~effect_:(effect__ : mobile_device_access_rule_effect) 
  ~device_id:(device_id_ : string)  ~user_id:(user_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     description = description_;
     effect_ = effect__;
     device_id = device_id_;
     user_id = user_id_;
     organization_id = organization_id_
   } : put_mobile_device_access_override_request)
let make_put_mailbox_permissions_response () =
  (() : put_mailbox_permissions_response)
let make_put_mailbox_permissions_request
  ~permission_values:(permission_values_ : permission_type list) 
  ~grantee_id:(grantee_id_ : string)  ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     permission_values = permission_values_;
     grantee_id = grantee_id_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : put_mailbox_permissions_request)
let make_put_inbound_dmarc_settings_response () =
  (() : put_inbound_dmarc_settings_response)
let make_put_inbound_dmarc_settings_request ~enforced:(enforced_ : bool) 
  ~organization_id:(organization_id_ : string)  () =
  ({ enforced = enforced_; organization_id = organization_id_ } : put_inbound_dmarc_settings_request)
let make_put_email_monitoring_configuration_response () =
  (() : put_email_monitoring_configuration_response)
let make_put_email_monitoring_configuration_request
  ~log_group_arn:(log_group_arn_ : string)  ~role_arn:(role_arn_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     log_group_arn = log_group_arn_;
     role_arn = role_arn_;
     organization_id = organization_id_
   } : put_email_monitoring_configuration_request)
let make_put_access_control_rule_response () =
  (() : put_access_control_rule_response)
let make_put_access_control_rule_request
  ?not_impersonation_role_ids:(not_impersonation_role_ids_ :
                                string list option)
   ?impersonation_role_ids:(impersonation_role_ids_ : string list option) 
  ?not_user_ids:(not_user_ids_ : string list option) 
  ?user_ids:(user_ids_ : string list option) 
  ?not_actions:(not_actions_ : string list option) 
  ?actions:(actions_ : string list option) 
  ?not_ip_ranges:(not_ip_ranges_ : string list option) 
  ?ip_ranges:(ip_ranges_ : string list option) 
  ~organization_id:(organization_id_ : string) 
  ~description:(description_ : string) 
  ~effect_:(effect__ : access_control_rule_effect)  ~name:(name_ : string) 
  () =
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
     name = name_
   } : put_access_control_rule_request)
let make_user ?disabled_date:(disabled_date_ : CoreTypes.Timestamp.t option) 
  ?enabled_date:(enabled_date_ : CoreTypes.Timestamp.t option) 
  ?user_role:(user_role_ : user_role option) 
  ?state:(state_ : entity_state option) 
  ?display_name:(display_name_ : string option) 
  ?name:(name_ : string option)  ?email:(email_ : string option) 
  ?id:(id_ : string option)  () =
  ({
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     user_role = user_role_;
     state = state_;
     display_name = display_name_;
     name = name_;
     email = email_;
     id = id_
   } : user)
let make_list_users_response ?next_token:(next_token_ : string option) 
  ?users:(users_ : user list option)  () =
  ({ next_token = next_token_; users = users_ } : list_users_response)
let make_list_users_filters ?state:(state_ : entity_state option) 
  ?primary_email_prefix:(primary_email_prefix_ : string option) 
  ?display_name_prefix:(display_name_prefix_ : string option) 
  ?username_prefix:(username_prefix_ : string option)  () =
  ({
     state = state_;
     primary_email_prefix = primary_email_prefix_;
     display_name_prefix = display_name_prefix_;
     username_prefix = username_prefix_
   } : list_users_filters)
let make_list_users_request ?filters:(filters_ : list_users_filters option) 
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     organization_id = organization_id_
   } : list_users_request)
let make_list_tags_for_resource_response ?tags:(tags_ : tag list option)  ()
  = ({ tags = tags_ } : list_tags_for_resource_response)
let make_list_tags_for_resource_request
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)
let make_resource ?description:(description_ : string option) 
  ?disabled_date:(disabled_date_ : CoreTypes.Timestamp.t option) 
  ?enabled_date:(enabled_date_ : CoreTypes.Timestamp.t option) 
  ?state:(state_ : entity_state option) 
  ?type_:(type__ : resource_type option)  ?name:(name_ : string option) 
  ?email:(email_ : string option)  ?id:(id_ : string option)  () =
  ({
     description = description_;
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     type_ = type__;
     name = name_;
     email = email_;
     id = id_
   } : resource)
let make_list_resources_response ?next_token:(next_token_ : string option) 
  ?resources:(resources_ : resource list option)  () =
  ({ next_token = next_token_; resources = resources_ } : list_resources_response)
let make_list_resources_filters ?state:(state_ : entity_state option) 
  ?primary_email_prefix:(primary_email_prefix_ : string option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({
     state = state_;
     primary_email_prefix = primary_email_prefix_;
     name_prefix = name_prefix_
   } : list_resources_filters)
let make_list_resources_request
  ?filters:(filters_ : list_resources_filters option) 
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     organization_id = organization_id_
   } : list_resources_request)
let make_delegate ~type_:(type__ : member_type)  ~id:(id_ : string)  () =
  ({ type_ = type__; id = id_ } : delegate)
let make_list_resource_delegates_response
  ?next_token:(next_token_ : string option) 
  ?delegates:(delegates_ : delegate list option)  () =
  ({ next_token = next_token_; delegates = delegates_ } : list_resource_delegates_response)
let make_list_resource_delegates_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~resource_id:(resource_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     resource_id = resource_id_;
     organization_id = organization_id_
   } : list_resource_delegates_request)
let make_organization_summary ?state:(state_ : string option) 
  ?error_message:(error_message_ : string option) 
  ?default_mail_domain:(default_mail_domain_ : string option) 
  ?alias:(alias_ : string option) 
  ?organization_id:(organization_id_ : string option)  () =
  ({
     state = state_;
     error_message = error_message_;
     default_mail_domain = default_mail_domain_;
     alias = alias_;
     organization_id = organization_id_
   } : organization_summary)
let make_list_organizations_response
  ?next_token:(next_token_ : string option) 
  ?organization_summaries:(organization_summaries_ :
                            organization_summary list option)
   () =
  ({
     next_token = next_token_;
     organization_summaries = organization_summaries_
   } : list_organizations_response)
let make_list_organizations_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  () =
  ({ max_results = max_results_; next_token = next_token_ } : list_organizations_request)
let make_mobile_device_access_rule
  ?date_modified:(date_modified_ : CoreTypes.Timestamp.t option) 
  ?date_created:(date_created_ : CoreTypes.Timestamp.t option) 
  ?not_device_user_agents:(not_device_user_agents_ : string list option) 
  ?device_user_agents:(device_user_agents_ : string list option) 
  ?not_device_operating_systems:(not_device_operating_systems_ :
                                  string list option)
   ?device_operating_systems:(device_operating_systems_ : string list option)
   ?not_device_models:(not_device_models_ : string list option) 
  ?device_models:(device_models_ : string list option) 
  ?not_device_types:(not_device_types_ : string list option) 
  ?device_types:(device_types_ : string list option) 
  ?effect_:(effect__ : mobile_device_access_rule_effect option) 
  ?description:(description_ : string option)  ?name:(name_ : string option) 
  ?mobile_device_access_rule_id:(mobile_device_access_rule_id_ :
                                  string option)
   () =
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
     mobile_device_access_rule_id = mobile_device_access_rule_id_
   } : mobile_device_access_rule)
let make_list_mobile_device_access_rules_response
  ?rules:(rules_ : mobile_device_access_rule list option)  () =
  ({ rules = rules_ } : list_mobile_device_access_rules_response)
let make_list_mobile_device_access_rules_request
  ~organization_id:(organization_id_ : string)  () =
  ({ organization_id = organization_id_ } : list_mobile_device_access_rules_request)
let make_mobile_device_access_override
  ?date_modified:(date_modified_ : CoreTypes.Timestamp.t option) 
  ?date_created:(date_created_ : CoreTypes.Timestamp.t option) 
  ?description:(description_ : string option) 
  ?effect_:(effect__ : mobile_device_access_rule_effect option) 
  ?device_id:(device_id_ : string option) 
  ?user_id:(user_id_ : string option)  () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     description = description_;
     effect_ = effect__;
     device_id = device_id_;
     user_id = user_id_
   } : mobile_device_access_override)
let make_list_mobile_device_access_overrides_response
  ?next_token:(next_token_ : string option) 
  ?overrides:(overrides_ : mobile_device_access_override list option)  () =
  ({ next_token = next_token_; overrides = overrides_ } : list_mobile_device_access_overrides_response)
let make_list_mobile_device_access_overrides_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?device_id:(device_id_ : string option) 
  ?user_id:(user_id_ : string option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     device_id = device_id_;
     user_id = user_id_;
     organization_id = organization_id_
   } : list_mobile_device_access_overrides_request)
let make_mail_domain_summary ?default_domain:(default_domain_ : bool option) 
  ?domain_name:(domain_name_ : string option)  () =
  ({ default_domain = default_domain_; domain_name = domain_name_ } : 
  mail_domain_summary)
let make_list_mail_domains_response ?next_token:(next_token_ : string option)
   ?mail_domains:(mail_domains_ : mail_domain_summary list option)  () =
  ({ next_token = next_token_; mail_domains = mail_domains_ } : list_mail_domains_response)
let make_list_mail_domains_request ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     organization_id = organization_id_
   } : list_mail_domains_request)
let make_permission
  ~permission_values:(permission_values_ : permission_type list) 
  ~grantee_type:(grantee_type_ : member_type) 
  ~grantee_id:(grantee_id_ : string)  () =
  ({
     permission_values = permission_values_;
     grantee_type = grantee_type_;
     grantee_id = grantee_id_
   } : permission)
let make_list_mailbox_permissions_response
  ?next_token:(next_token_ : string option) 
  ?permissions:(permissions_ : permission list option)  () =
  ({ next_token = next_token_; permissions = permissions_ } : list_mailbox_permissions_response)
let make_list_mailbox_permissions_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~entity_id:(entity_id_ : string)
   ~organization_id:(organization_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : list_mailbox_permissions_request)
let make_mailbox_export_job
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?state:(state_ : mailbox_export_job_state option) 
  ?estimated_progress:(estimated_progress_ : int option) 
  ?s3_path:(s3_path_ : string option) 
  ?s3_bucket_name:(s3_bucket_name_ : string option) 
  ?description:(description_ : string option) 
  ?entity_id:(entity_id_ : string option)  ?job_id:(job_id_ : string option) 
  () =
  ({
     end_time = end_time_;
     start_time = start_time_;
     state = state_;
     estimated_progress = estimated_progress_;
     s3_path = s3_path_;
     s3_bucket_name = s3_bucket_name_;
     description = description_;
     entity_id = entity_id_;
     job_id = job_id_
   } : mailbox_export_job)
let make_list_mailbox_export_jobs_response
  ?next_token:(next_token_ : string option) 
  ?jobs:(jobs_ : mailbox_export_job list option)  () =
  ({ next_token = next_token_; jobs = jobs_ } : list_mailbox_export_jobs_response)
let make_list_mailbox_export_jobs_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     organization_id = organization_id_
   } : list_mailbox_export_jobs_request)
let make_impersonation_role
  ?date_modified:(date_modified_ : CoreTypes.Timestamp.t option) 
  ?date_created:(date_created_ : CoreTypes.Timestamp.t option) 
  ?type_:(type__ : impersonation_role_type option) 
  ?name:(name_ : string option) 
  ?impersonation_role_id:(impersonation_role_id_ : string option)  () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     type_ = type__;
     name = name_;
     impersonation_role_id = impersonation_role_id_
   } : impersonation_role)
let make_list_impersonation_roles_response
  ?next_token:(next_token_ : string option) 
  ?roles:(roles_ : impersonation_role list option)  () =
  ({ next_token = next_token_; roles = roles_ } : list_impersonation_roles_response)
let make_list_impersonation_roles_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     organization_id = organization_id_
   } : list_impersonation_roles_request)
let make_group_identifier ?group_name:(group_name_ : string option) 
  ?group_id:(group_id_ : string option)  () =
  ({ group_name = group_name_; group_id = group_id_ } : group_identifier)
let make_list_groups_for_entity_response
  ?next_token:(next_token_ : string option) 
  ?groups:(groups_ : group_identifier list option)  () =
  ({ next_token = next_token_; groups = groups_ } : list_groups_for_entity_response)
let make_list_groups_for_entity_filters
  ?group_name_prefix:(group_name_prefix_ : string option)  () =
  ({ group_name_prefix = group_name_prefix_ } : list_groups_for_entity_filters)
let make_list_groups_for_entity_request
  ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ?filters:(filters_ : list_groups_for_entity_filters option) 
  ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : list_groups_for_entity_request)
let make_group ?disabled_date:(disabled_date_ : CoreTypes.Timestamp.t option)
   ?enabled_date:(enabled_date_ : CoreTypes.Timestamp.t option) 
  ?state:(state_ : entity_state option)  ?name:(name_ : string option) 
  ?email:(email_ : string option)  ?id:(id_ : string option)  () =
  ({
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     name = name_;
     email = email_;
     id = id_
   } : group)
let make_list_groups_response ?next_token:(next_token_ : string option) 
  ?groups:(groups_ : group list option)  () =
  ({ next_token = next_token_; groups = groups_ } : list_groups_response)
let make_list_groups_filters ?state:(state_ : entity_state option) 
  ?primary_email_prefix:(primary_email_prefix_ : string option) 
  ?name_prefix:(name_prefix_ : string option)  () =
  ({
     state = state_;
     primary_email_prefix = primary_email_prefix_;
     name_prefix = name_prefix_
   } : list_groups_filters)
let make_list_groups_request ?filters:(filters_ : list_groups_filters option)
   ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
     organization_id = organization_id_
   } : list_groups_request)
let make_member
  ?disabled_date:(disabled_date_ : CoreTypes.Timestamp.t option) 
  ?enabled_date:(enabled_date_ : CoreTypes.Timestamp.t option) 
  ?state:(state_ : entity_state option)  ?type_:(type__ : member_type option)
   ?name:(name_ : string option)  ?id:(id_ : string option)  () =
  ({
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     type_ = type__;
     name = name_;
     id = id_
   } : member)
let make_list_group_members_response
  ?next_token:(next_token_ : string option) 
  ?members:(members_ : member list option)  () =
  ({ next_token = next_token_; members = members_ } : list_group_members_response)
let make_list_group_members_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~group_id:(group_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     group_id = group_id_;
     organization_id = organization_id_
   } : list_group_members_request)
let make_redacted_ews_availability_provider
  ?ews_username:(ews_username_ : string option) 
  ?ews_endpoint:(ews_endpoint_ : string option)  () =
  ({ ews_username = ews_username_; ews_endpoint = ews_endpoint_ } : redacted_ews_availability_provider)
let make_availability_configuration
  ?date_modified:(date_modified_ : CoreTypes.Timestamp.t option) 
  ?date_created:(date_created_ : CoreTypes.Timestamp.t option) 
  ?lambda_provider:(lambda_provider_ : lambda_availability_provider option) 
  ?ews_provider:(ews_provider_ : redacted_ews_availability_provider option) 
  ?provider_type:(provider_type_ : availability_provider_type option) 
  ?domain_name:(domain_name_ : string option)  () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     lambda_provider = lambda_provider_;
     ews_provider = ews_provider_;
     provider_type = provider_type_;
     domain_name = domain_name_
   } : availability_configuration)
let make_list_availability_configurations_response
  ?next_token:(next_token_ : string option) 
  ?availability_configurations:(availability_configurations_ :
                                 availability_configuration list option)
   () =
  ({
     next_token = next_token_;
     availability_configurations = availability_configurations_
   } : list_availability_configurations_response)
let make_list_availability_configurations_request
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     organization_id = organization_id_
   } : list_availability_configurations_request)
let make_list_aliases_response ?next_token:(next_token_ : string option) 
  ?aliases:(aliases_ : string list option)  () =
  ({ next_token = next_token_; aliases = aliases_ } : list_aliases_response)
let make_list_aliases_request ?max_results:(max_results_ : int option) 
  ?next_token:(next_token_ : string option)  ~entity_id:(entity_id_ : string)
   ~organization_id:(organization_id_ : string)  () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : list_aliases_request)
let make_access_control_rule
  ?not_impersonation_role_ids:(not_impersonation_role_ids_ :
                                string list option)
   ?impersonation_role_ids:(impersonation_role_ids_ : string list option) 
  ?date_modified:(date_modified_ : CoreTypes.Timestamp.t option) 
  ?date_created:(date_created_ : CoreTypes.Timestamp.t option) 
  ?not_user_ids:(not_user_ids_ : string list option) 
  ?user_ids:(user_ids_ : string list option) 
  ?not_actions:(not_actions_ : string list option) 
  ?actions:(actions_ : string list option) 
  ?not_ip_ranges:(not_ip_ranges_ : string list option) 
  ?ip_ranges:(ip_ranges_ : string list option) 
  ?description:(description_ : string option) 
  ?effect_:(effect__ : access_control_rule_effect option) 
  ?name:(name_ : string option)  () =
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
     name = name_
   } : access_control_rule)
let make_list_access_control_rules_response
  ?rules:(rules_ : access_control_rule list option)  () =
  ({ rules = rules_ } : list_access_control_rules_response)
let make_list_access_control_rules_request
  ~organization_id:(organization_id_ : string)  () =
  ({ organization_id = organization_id_ } : list_access_control_rules_request)
let make_get_mobile_device_access_override_response
  ?date_modified:(date_modified_ : CoreTypes.Timestamp.t option) 
  ?date_created:(date_created_ : CoreTypes.Timestamp.t option) 
  ?description:(description_ : string option) 
  ?effect_:(effect__ : mobile_device_access_rule_effect option) 
  ?device_id:(device_id_ : string option) 
  ?user_id:(user_id_ : string option)  () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     description = description_;
     effect_ = effect__;
     device_id = device_id_;
     user_id = user_id_
   } : get_mobile_device_access_override_response)
let make_get_mobile_device_access_override_request
  ~device_id:(device_id_ : string)  ~user_id:(user_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     device_id = device_id_;
     user_id = user_id_;
     organization_id = organization_id_
   } : get_mobile_device_access_override_request)
let make_mobile_device_access_matched_rule ?name:(name_ : string option) 
  ?mobile_device_access_rule_id:(mobile_device_access_rule_id_ :
                                  string option)
   () =
  ({
     name = name_;
     mobile_device_access_rule_id = mobile_device_access_rule_id_
   } : mobile_device_access_matched_rule)
let make_get_mobile_device_access_effect_response
  ?matched_rules:(matched_rules_ :
                   mobile_device_access_matched_rule list option)
   ?effect_:(effect__ : mobile_device_access_rule_effect option)  () =
  ({ matched_rules = matched_rules_; effect_ = effect__ } : get_mobile_device_access_effect_response)
let make_get_mobile_device_access_effect_request
  ?device_user_agent:(device_user_agent_ : string option) 
  ?device_operating_system:(device_operating_system_ : string option) 
  ?device_model:(device_model_ : string option) 
  ?device_type:(device_type_ : string option) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     device_user_agent = device_user_agent_;
     device_operating_system = device_operating_system_;
     device_model = device_model_;
     device_type = device_type_;
     organization_id = organization_id_
   } : get_mobile_device_access_effect_request)
let make_dns_record ?value:(value_ : string option) 
  ?hostname:(hostname_ : string option)  ?type_:(type__ : string option)  ()
  = ({ value = value_; hostname = hostname_; type_ = type__ } : dns_record)
let make_get_mail_domain_response
  ?dkim_verification_status:(dkim_verification_status_ :
                              dns_record_verification_status option)
   ?ownership_verification_status:(ownership_verification_status_ :
                                    dns_record_verification_status option)
   ?is_default:(is_default_ : bool option) 
  ?is_test_domain:(is_test_domain_ : bool option) 
  ?records:(records_ : dns_record list option)  () =
  ({
     dkim_verification_status = dkim_verification_status_;
     ownership_verification_status = ownership_verification_status_;
     is_default = is_default_;
     is_test_domain = is_test_domain_;
     records = records_
   } : get_mail_domain_response)
let make_get_mail_domain_request ~domain_name:(domain_name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ domain_name = domain_name_; organization_id = organization_id_ } : 
  get_mail_domain_request)
let make_get_mailbox_details_response
  ?mailbox_size:(mailbox_size_ : float option) 
  ?mailbox_quota:(mailbox_quota_ : int option)  () =
  ({ mailbox_size = mailbox_size_; mailbox_quota = mailbox_quota_ } : 
  get_mailbox_details_response)
let make_get_mailbox_details_request ~user_id:(user_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ user_id = user_id_; organization_id = organization_id_ } : get_mailbox_details_request)
let make_impersonation_matched_rule ?name:(name_ : string option) 
  ?impersonation_rule_id:(impersonation_rule_id_ : string option)  () =
  ({ name = name_; impersonation_rule_id = impersonation_rule_id_ } : 
  impersonation_matched_rule)
let make_get_impersonation_role_effect_response
  ?matched_rules:(matched_rules_ : impersonation_matched_rule list option) 
  ?effect_:(effect__ : access_effect option) 
  ?type_:(type__ : impersonation_role_type option)  () =
  ({ matched_rules = matched_rules_; effect_ = effect__; type_ = type__ } : 
  get_impersonation_role_effect_response)
let make_get_impersonation_role_effect_request
  ~target_user:(target_user_ : string) 
  ~impersonation_role_id:(impersonation_role_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     target_user = target_user_;
     impersonation_role_id = impersonation_role_id_;
     organization_id = organization_id_
   } : get_impersonation_role_effect_request)
let make_get_impersonation_role_response
  ?date_modified:(date_modified_ : CoreTypes.Timestamp.t option) 
  ?date_created:(date_created_ : CoreTypes.Timestamp.t option) 
  ?rules:(rules_ : impersonation_rule list option) 
  ?description:(description_ : string option) 
  ?type_:(type__ : impersonation_role_type option) 
  ?name:(name_ : string option) 
  ?impersonation_role_id:(impersonation_role_id_ : string option)  () =
  ({
     date_modified = date_modified_;
     date_created = date_created_;
     rules = rules_;
     description = description_;
     type_ = type__;
     name = name_;
     impersonation_role_id = impersonation_role_id_
   } : get_impersonation_role_response)
let make_get_impersonation_role_request
  ~impersonation_role_id:(impersonation_role_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     impersonation_role_id = impersonation_role_id_;
     organization_id = organization_id_
   } : get_impersonation_role_request)
let make_get_default_retention_policy_response
  ?folder_configurations:(folder_configurations_ :
                           folder_configuration list option)
   ?description:(description_ : string option)  ?name:(name_ : string option)
   ?id:(id_ : string option)  () =
  ({
     folder_configurations = folder_configurations_;
     description = description_;
     name = name_;
     id = id_
   } : get_default_retention_policy_response)
let make_get_default_retention_policy_request
  ~organization_id:(organization_id_ : string)  () =
  ({ organization_id = organization_id_ } : get_default_retention_policy_request)
let make_get_access_control_effect_response
  ?matched_rules:(matched_rules_ : string list option) 
  ?effect_:(effect__ : access_control_rule_effect option)  () =
  ({ matched_rules = matched_rules_; effect_ = effect__ } : get_access_control_effect_response)
let make_get_access_control_effect_request
  ?impersonation_role_id:(impersonation_role_id_ : string option) 
  ?user_id:(user_id_ : string option)  ~action:(action_ : string) 
  ~ip_address:(ip_address_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     impersonation_role_id = impersonation_role_id_;
     user_id = user_id_;
     action = action_;
     ip_address = ip_address_;
     organization_id = organization_id_
   } : get_access_control_effect_request)
let make_disassociate_member_from_group_response () =
  (() : disassociate_member_from_group_response)
let make_disassociate_member_from_group_request
  ~member_id:(member_id_ : string)  ~group_id:(group_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     member_id = member_id_;
     group_id = group_id_;
     organization_id = organization_id_
   } : disassociate_member_from_group_request)
let make_disassociate_delegate_from_resource_response () =
  (() : disassociate_delegate_from_resource_response)
let make_disassociate_delegate_from_resource_request
  ~entity_id:(entity_id_ : string)  ~resource_id:(resource_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     entity_id = entity_id_;
     resource_id = resource_id_;
     organization_id = organization_id_
   } : disassociate_delegate_from_resource_request)
let make_describe_user_response ?office:(office_ : string option) 
  ?country:(country_ : string option) 
  ?department:(department_ : string option) 
  ?zip_code:(zip_code_ : string option)  ?company:(company_ : string option) 
  ?city:(city_ : string option)  ?job_title:(job_title_ : string option) 
  ?street:(street_ : string option)  ?telephone:(telephone_ : string option) 
  ?initials:(initials_ : string option) 
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ?last_name:(last_name_ : string option) 
  ?first_name:(first_name_ : string option) 
  ?mailbox_deprovisioned_date:(mailbox_deprovisioned_date_ :
                                CoreTypes.Timestamp.t option)
   ?mailbox_provisioned_date:(mailbox_provisioned_date_ :
                               CoreTypes.Timestamp.t option)
   ?disabled_date:(disabled_date_ : CoreTypes.Timestamp.t option) 
  ?enabled_date:(enabled_date_ : CoreTypes.Timestamp.t option) 
  ?user_role:(user_role_ : user_role option) 
  ?state:(state_ : entity_state option) 
  ?display_name:(display_name_ : string option) 
  ?email:(email_ : string option)  ?name:(name_ : string option) 
  ?user_id:(user_id_ : string option)  () =
  ({
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
     user_id = user_id_
   } : describe_user_response)
let make_describe_user_request ~user_id:(user_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ user_id = user_id_; organization_id = organization_id_ } : describe_user_request)
let make_describe_resource_response
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ?description:(description_ : string option) 
  ?disabled_date:(disabled_date_ : CoreTypes.Timestamp.t option) 
  ?enabled_date:(enabled_date_ : CoreTypes.Timestamp.t option) 
  ?state:(state_ : entity_state option) 
  ?booking_options:(booking_options_ : booking_options option) 
  ?type_:(type__ : resource_type option)  ?name:(name_ : string option) 
  ?email:(email_ : string option) 
  ?resource_id:(resource_id_ : string option)  () =
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
     resource_id = resource_id_
   } : describe_resource_response)
let make_describe_resource_request ~resource_id:(resource_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ resource_id = resource_id_; organization_id = organization_id_ } : 
  describe_resource_request)
let make_describe_organization_response
  ?interoperability_enabled:(interoperability_enabled_ : bool option) 
  ?migration_admin:(migration_admin_ : string option) 
  ?ar_n:(ar_n_ : string option) 
  ?error_message:(error_message_ : string option) 
  ?completed_date:(completed_date_ : CoreTypes.Timestamp.t option) 
  ?default_mail_domain:(default_mail_domain_ : string option) 
  ?directory_type:(directory_type_ : string option) 
  ?directory_id:(directory_id_ : string option) 
  ?state:(state_ : string option)  ?alias:(alias_ : string option) 
  ?organization_id:(organization_id_ : string option)  () =
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
     organization_id = organization_id_
   } : describe_organization_response)
let make_describe_organization_request
  ~organization_id:(organization_id_ : string)  () =
  ({ organization_id = organization_id_ } : describe_organization_request)
let make_describe_mailbox_export_job_response
  ?end_time:(end_time_ : CoreTypes.Timestamp.t option) 
  ?start_time:(start_time_ : CoreTypes.Timestamp.t option) 
  ?error_info:(error_info_ : string option) 
  ?state:(state_ : mailbox_export_job_state option) 
  ?estimated_progress:(estimated_progress_ : int option) 
  ?s3_path:(s3_path_ : string option) 
  ?s3_prefix:(s3_prefix_ : string option) 
  ?s3_bucket_name:(s3_bucket_name_ : string option) 
  ?kms_key_arn:(kms_key_arn_ : string option) 
  ?role_arn:(role_arn_ : string option) 
  ?description:(description_ : string option) 
  ?entity_id:(entity_id_ : string option)  () =
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
     entity_id = entity_id_
   } : describe_mailbox_export_job_response)
let make_describe_mailbox_export_job_request
  ~organization_id:(organization_id_ : string)  ~job_id:(job_id_ : string) 
  () =
  ({ organization_id = organization_id_; job_id = job_id_ } : describe_mailbox_export_job_request)
let make_describe_inbound_dmarc_settings_response
  ?enforced:(enforced_ : bool option)  () =
  ({ enforced = enforced_ } : describe_inbound_dmarc_settings_response)
let make_describe_inbound_dmarc_settings_request
  ~organization_id:(organization_id_ : string)  () =
  ({ organization_id = organization_id_ } : describe_inbound_dmarc_settings_request)
let make_describe_group_response
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ?disabled_date:(disabled_date_ : CoreTypes.Timestamp.t option) 
  ?enabled_date:(enabled_date_ : CoreTypes.Timestamp.t option) 
  ?state:(state_ : entity_state option)  ?email:(email_ : string option) 
  ?name:(name_ : string option)  ?group_id:(group_id_ : string option)  () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     disabled_date = disabled_date_;
     enabled_date = enabled_date_;
     state = state_;
     email = email_;
     name = name_;
     group_id = group_id_
   } : describe_group_response)
let make_describe_group_request ~group_id:(group_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ group_id = group_id_; organization_id = organization_id_ } : describe_group_request)
let make_describe_entity_response ?type_:(type__ : entity_type option) 
  ?name:(name_ : string option)  ?entity_id:(entity_id_ : string option)  ()
  =
  ({ type_ = type__; name = name_; entity_id = entity_id_ } : describe_entity_response)
let make_describe_entity_request ~email:(email_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ email = email_; organization_id = organization_id_ } : describe_entity_request)
let make_describe_email_monitoring_configuration_response
  ?log_group_arn:(log_group_arn_ : string option) 
  ?role_arn:(role_arn_ : string option)  () =
  ({ log_group_arn = log_group_arn_; role_arn = role_arn_ } : describe_email_monitoring_configuration_response)
let make_describe_email_monitoring_configuration_request
  ~organization_id:(organization_id_ : string)  () =
  ({ organization_id = organization_id_ } : describe_email_monitoring_configuration_request)
let make_deregister_mail_domain_response () =
  (() : deregister_mail_domain_response)
let make_deregister_mail_domain_request ~domain_name:(domain_name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ domain_name = domain_name_; organization_id = organization_id_ } : 
  deregister_mail_domain_request)
let make_deregister_from_work_mail_response () =
  (() : deregister_from_work_mail_response)
let make_deregister_from_work_mail_request ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ entity_id = entity_id_; organization_id = organization_id_ } : deregister_from_work_mail_request)
let make_delete_user_response () = (() : delete_user_response)
let make_delete_user_request ~user_id:(user_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ user_id = user_id_; organization_id = organization_id_ } : delete_user_request)
let make_delete_retention_policy_response () =
  (() : delete_retention_policy_response)
let make_delete_retention_policy_request ~id:(id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ id = id_; organization_id = organization_id_ } : delete_retention_policy_request)
let make_delete_resource_response () = (() : delete_resource_response)
let make_delete_resource_request ~resource_id:(resource_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ resource_id = resource_id_; organization_id = organization_id_ } : 
  delete_resource_request)
let make_delete_organization_response ?state:(state_ : string option) 
  ?organization_id:(organization_id_ : string option)  () =
  ({ state = state_; organization_id = organization_id_ } : delete_organization_response)
let make_delete_organization_request
  ?force_delete:(force_delete_ : bool option) 
  ?client_token:(client_token_ : string option) 
  ~delete_directory:(delete_directory_ : bool) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     force_delete = force_delete_;
     delete_directory = delete_directory_;
     organization_id = organization_id_;
     client_token = client_token_
   } : delete_organization_request)
let make_delete_mobile_device_access_rule_response () =
  (() : delete_mobile_device_access_rule_response)
let make_delete_mobile_device_access_rule_request
  ~mobile_device_access_rule_id:(mobile_device_access_rule_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     mobile_device_access_rule_id = mobile_device_access_rule_id_;
     organization_id = organization_id_
   } : delete_mobile_device_access_rule_request)
let make_delete_mobile_device_access_override_response () =
  (() : delete_mobile_device_access_override_response)
let make_delete_mobile_device_access_override_request
  ~device_id:(device_id_ : string)  ~user_id:(user_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     device_id = device_id_;
     user_id = user_id_;
     organization_id = organization_id_
   } : delete_mobile_device_access_override_request)
let make_delete_mailbox_permissions_response () =
  (() : delete_mailbox_permissions_response)
let make_delete_mailbox_permissions_request
  ~grantee_id:(grantee_id_ : string)  ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     grantee_id = grantee_id_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : delete_mailbox_permissions_request)
let make_delete_impersonation_role_response () =
  (() : delete_impersonation_role_response)
let make_delete_impersonation_role_request
  ~impersonation_role_id:(impersonation_role_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     impersonation_role_id = impersonation_role_id_;
     organization_id = organization_id_
   } : delete_impersonation_role_request)
let make_delete_group_response () = (() : delete_group_response)
let make_delete_group_request ~group_id:(group_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ group_id = group_id_; organization_id = organization_id_ } : delete_group_request)
let make_delete_email_monitoring_configuration_response () =
  (() : delete_email_monitoring_configuration_response)
let make_delete_email_monitoring_configuration_request
  ~organization_id:(organization_id_ : string)  () =
  ({ organization_id = organization_id_ } : delete_email_monitoring_configuration_request)
let make_delete_availability_configuration_response () =
  (() : delete_availability_configuration_response)
let make_delete_availability_configuration_request
  ~domain_name:(domain_name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ domain_name = domain_name_; organization_id = organization_id_ } : 
  delete_availability_configuration_request)
let make_delete_alias_response () = (() : delete_alias_response)
let make_delete_alias_request ~alias:(alias_ : string) 
  ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     alias = alias_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : delete_alias_request)
let make_delete_access_control_rule_response () =
  (() : delete_access_control_rule_response)
let make_delete_access_control_rule_request ~name:(name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({ name = name_; organization_id = organization_id_ } : delete_access_control_rule_request)
let make_create_user_response ?user_id:(user_id_ : string option)  () =
  ({ user_id = user_id_ } : create_user_response)
let make_create_user_request
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ?last_name:(last_name_ : string option) 
  ?first_name:(first_name_ : string option)  ?role:(role_ : user_role option)
   ?password:(password_ : string option) 
  ~display_name:(display_name_ : string)  ~name:(name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     last_name = last_name_;
     first_name = first_name_;
     role = role_;
     password = password_;
     display_name = display_name_;
     name = name_;
     organization_id = organization_id_
   } : create_user_request)
let make_create_resource_response ?resource_id:(resource_id_ : string option)
   () = ({ resource_id = resource_id_ } : create_resource_response)
let make_create_resource_request
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ?description:(description_ : string option) 
  ~type_:(type__ : resource_type)  ~name:(name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     description = description_;
     type_ = type__;
     name = name_;
     organization_id = organization_id_
   } : create_resource_request)
let make_create_organization_response
  ?organization_id:(organization_id_ : string option)  () =
  ({ organization_id = organization_id_ } : create_organization_response)
let make_domain ?hosted_zone_id:(hosted_zone_id_ : string option) 
  ~domain_name:(domain_name_ : string)  () =
  ({ hosted_zone_id = hosted_zone_id_; domain_name = domain_name_ } : 
  domain)
let make_create_organization_request
  ?enable_interoperability:(enable_interoperability_ : bool option) 
  ?kms_key_arn:(kms_key_arn_ : string option) 
  ?domains:(domains_ : domain list option) 
  ?client_token:(client_token_ : string option) 
  ?directory_id:(directory_id_ : string option)  ~alias:(alias_ : string)  ()
  =
  ({
     enable_interoperability = enable_interoperability_;
     kms_key_arn = kms_key_arn_;
     domains = domains_;
     client_token = client_token_;
     alias = alias_;
     directory_id = directory_id_
   } : create_organization_request)
let make_create_mobile_device_access_rule_response
  ?mobile_device_access_rule_id:(mobile_device_access_rule_id_ :
                                  string option)
   () =
  ({ mobile_device_access_rule_id = mobile_device_access_rule_id_ } : 
  create_mobile_device_access_rule_response)
let make_create_mobile_device_access_rule_request
  ?not_device_user_agents:(not_device_user_agents_ : string list option) 
  ?device_user_agents:(device_user_agents_ : string list option) 
  ?not_device_operating_systems:(not_device_operating_systems_ :
                                  string list option)
   ?device_operating_systems:(device_operating_systems_ : string list option)
   ?not_device_models:(not_device_models_ : string list option) 
  ?device_models:(device_models_ : string list option) 
  ?not_device_types:(not_device_types_ : string list option) 
  ?device_types:(device_types_ : string list option) 
  ?description:(description_ : string option) 
  ?client_token:(client_token_ : string option) 
  ~effect_:(effect__ : mobile_device_access_rule_effect) 
  ~name:(name_ : string)  ~organization_id:(organization_id_ : string)  () =
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
     organization_id = organization_id_
   } : create_mobile_device_access_rule_request)
let make_create_impersonation_role_response
  ?impersonation_role_id:(impersonation_role_id_ : string option)  () =
  ({ impersonation_role_id = impersonation_role_id_ } : create_impersonation_role_response)
let make_create_impersonation_role_request
  ?description:(description_ : string option) 
  ?client_token:(client_token_ : string option) 
  ~rules:(rules_ : impersonation_rule list) 
  ~type_:(type__ : impersonation_role_type)  ~name:(name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     rules = rules_;
     description = description_;
     type_ = type__;
     name = name_;
     organization_id = organization_id_;
     client_token = client_token_
   } : create_impersonation_role_request)
let make_create_group_response ?group_id:(group_id_ : string option)  () =
  ({ group_id = group_id_ } : create_group_response)
let make_create_group_request
  ?hidden_from_global_address_list:(hidden_from_global_address_list_ :
                                     bool option)
   ~name:(name_ : string)  ~organization_id:(organization_id_ : string)  () =
  ({
     hidden_from_global_address_list = hidden_from_global_address_list_;
     name = name_;
     organization_id = organization_id_
   } : create_group_request)
let make_create_availability_configuration_response () =
  (() : create_availability_configuration_response)
let make_create_availability_configuration_request
  ?lambda_provider:(lambda_provider_ : lambda_availability_provider option) 
  ?ews_provider:(ews_provider_ : ews_availability_provider option) 
  ?client_token:(client_token_ : string option) 
  ~domain_name:(domain_name_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     lambda_provider = lambda_provider_;
     ews_provider = ews_provider_;
     domain_name = domain_name_;
     organization_id = organization_id_;
     client_token = client_token_
   } : create_availability_configuration_request)
let make_create_alias_response () = (() : create_alias_response)
let make_create_alias_request ~alias:(alias_ : string) 
  ~entity_id:(entity_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     alias = alias_;
     entity_id = entity_id_;
     organization_id = organization_id_
   } : create_alias_request)
let make_cancel_mailbox_export_job_response () =
  (() : cancel_mailbox_export_job_response)
let make_cancel_mailbox_export_job_request
  ~organization_id:(organization_id_ : string)  ~job_id:(job_id_ : string) 
  ~client_token:(client_token_ : string)  () =
  ({
     organization_id = organization_id_;
     job_id = job_id_;
     client_token = client_token_
   } : cancel_mailbox_export_job_request)
let make_assume_impersonation_role_response
  ?expires_in:(expires_in_ : int option)  ?token:(token_ : string option)  ()
  =
  ({ expires_in = expires_in_; token = token_ } : assume_impersonation_role_response)
let make_assume_impersonation_role_request
  ~impersonation_role_id:(impersonation_role_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     impersonation_role_id = impersonation_role_id_;
     organization_id = organization_id_
   } : assume_impersonation_role_request)
let make_associate_member_to_group_response () =
  (() : associate_member_to_group_response)
let make_associate_member_to_group_request ~member_id:(member_id_ : string) 
  ~group_id:(group_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     member_id = member_id_;
     group_id = group_id_;
     organization_id = organization_id_
   } : associate_member_to_group_request)
let make_associate_delegate_to_resource_response () =
  (() : associate_delegate_to_resource_response)
let make_associate_delegate_to_resource_request
  ~entity_id:(entity_id_ : string)  ~resource_id:(resource_id_ : string) 
  ~organization_id:(organization_id_ : string)  () =
  ({
     entity_id = entity_id_;
     resource_id = resource_id_;
     organization_id = organization_id_
   } : associate_delegate_to_resource_request)