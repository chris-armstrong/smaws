(** 
    WorkMail client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_update_user_response : unit -> unit
val make_update_user_request :
  ?identity_provider_user_id:identity_provider_user_id_for_update ->
    ?office:user_attribute ->
      ?country:user_attribute ->
        ?department:user_attribute ->
          ?zip_code:user_attribute ->
            ?company:user_attribute ->
              ?city:user_attribute ->
                ?job_title:user_attribute ->
                  ?street:user_attribute ->
                    ?telephone:user_attribute ->
                      ?initials:user_attribute ->
                        ?hidden_from_global_address_list:boolean_object ->
                          ?last_name:user_attribute ->
                            ?first_name:user_attribute ->
                              ?display_name:user_attribute ->
                                ?role:user_role ->
                                  user_id:entity_identifier ->
                                    organization_id:organization_id ->
                                      unit -> update_user_request
val make_update_resource_response : unit -> unit
val make_booking_options :
  ?auto_decline_conflicting_requests:boolean_ ->
    ?auto_decline_recurring_requests:boolean_ ->
      ?auto_accept_requests:boolean_ -> unit -> booking_options
val make_update_resource_request :
  ?hidden_from_global_address_list:boolean_object ->
    ?type_:resource_type ->
      ?description:new_resource_description ->
        ?booking_options:booking_options ->
          ?name:resource_name ->
            resource_id:entity_identifier ->
              organization_id:organization_id ->
                unit -> update_resource_request
val make_update_primary_email_address_response : unit -> unit
val make_update_primary_email_address_request :
  email:email_address ->
    entity_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> update_primary_email_address_request
val make_update_mobile_device_access_rule_response : unit -> unit
val make_update_mobile_device_access_rule_request :
  ?not_device_user_agents:device_user_agent_list ->
    ?device_user_agents:device_user_agent_list ->
      ?not_device_operating_systems:device_operating_system_list ->
        ?device_operating_systems:device_operating_system_list ->
          ?not_device_models:device_model_list ->
            ?device_models:device_model_list ->
              ?not_device_types:device_type_list ->
                ?device_types:device_type_list ->
                  ?description:mobile_device_access_rule_description ->
                    effect_:mobile_device_access_rule_effect ->
                      name:mobile_device_access_rule_name ->
                        mobile_device_access_rule_id:mobile_device_access_rule_id
                          ->
                          organization_id:organization_id ->
                            unit -> update_mobile_device_access_rule_request
val make_update_mailbox_quota_response : unit -> unit
val make_update_mailbox_quota_request :
  mailbox_quota:mailbox_quota ->
    user_id:entity_identifier ->
      organization_id:organization_id -> unit -> update_mailbox_quota_request
val make_update_impersonation_role_response : unit -> unit
val make_impersonation_rule :
  ?not_target_users:target_users ->
    ?target_users:target_users ->
      ?description:impersonation_rule_description ->
        ?name:impersonation_rule_name ->
          effect_:access_effect ->
            impersonation_rule_id:impersonation_rule_id ->
              unit -> impersonation_rule
val make_update_impersonation_role_request :
  ?description:impersonation_role_description ->
    rules:impersonation_rule_list ->
      type_:impersonation_role_type ->
        name:impersonation_role_name ->
          impersonation_role_id:impersonation_role_id ->
            organization_id:organization_id ->
              unit -> update_impersonation_role_request
val make_update_group_response : unit -> unit
val make_update_group_request :
  ?hidden_from_global_address_list:boolean_object ->
    group_id:entity_identifier ->
      organization_id:organization_id -> unit -> update_group_request
val make_update_default_mail_domain_response : unit -> unit
val make_update_default_mail_domain_request :
  domain_name:work_mail_domain_name ->
    organization_id:organization_id ->
      unit -> update_default_mail_domain_request
val make_update_availability_configuration_response : unit -> unit
val make_ews_availability_provider :
  ews_password:password ->
    ews_username:external_user_name ->
      ews_endpoint:url -> unit -> ews_availability_provider
val make_lambda_availability_provider :
  lambda_arn:lambda_arn -> unit -> lambda_availability_provider
val make_update_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
    ?ews_provider:ews_availability_provider ->
      domain_name:domain_name ->
        organization_id:organization_id ->
          unit -> update_availability_configuration_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_ar_n:amazon_resource_name -> unit -> untag_resource_request
val make_test_availability_configuration_response :
  ?failure_reason:string_ ->
    ?test_passed:boolean_ -> unit -> test_availability_configuration_response
val make_test_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
    ?ews_provider:ews_availability_provider ->
      ?domain_name:domain_name ->
        organization_id:organization_id ->
          unit -> test_availability_configuration_request
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_request :
  tags:tag_list ->
    resource_ar_n:amazon_resource_name -> unit -> tag_resource_request
val make_start_mailbox_export_job_response :
  ?job_id:mailbox_export_job_id -> unit -> start_mailbox_export_job_response
val make_start_mailbox_export_job_request :
  ?description:description ->
    s3_prefix:s3_object_key ->
      s3_bucket_name:s3_bucket_name ->
        kms_key_arn:kms_key_arn ->
          role_arn:role_arn ->
            entity_id:entity_identifier ->
              organization_id:organization_id ->
                client_token:idempotency_client_token ->
                  unit -> start_mailbox_export_job_request
val make_reset_password_response : unit -> unit
val make_reset_password_request :
  password:password ->
    user_id:work_mail_identifier ->
      organization_id:organization_id -> unit -> reset_password_request
val make_register_to_work_mail_response : unit -> unit
val make_register_to_work_mail_request :
  email:email_address ->
    entity_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> register_to_work_mail_request
val make_register_mail_domain_response : unit -> unit
val make_register_mail_domain_request :
  ?client_token:idempotency_client_token ->
    domain_name:work_mail_domain_name ->
      organization_id:organization_id -> unit -> register_mail_domain_request
val make_put_retention_policy_response : unit -> unit
val make_folder_configuration :
  ?period:retention_period ->
    action:retention_action ->
      name:folder_name -> unit -> folder_configuration
val make_put_retention_policy_request :
  ?description:policy_description ->
    ?id:short_string ->
      folder_configurations:folder_configurations ->
        name:short_string ->
          organization_id:organization_id ->
            unit -> put_retention_policy_request
val make_put_mobile_device_access_override_response : unit -> unit
val make_put_mobile_device_access_override_request :
  ?description:mobile_device_access_rule_description ->
    effect_:mobile_device_access_rule_effect ->
      device_id:device_id ->
        user_id:entity_identifier ->
          organization_id:organization_id ->
            unit -> put_mobile_device_access_override_request
val make_put_mailbox_permissions_response : unit -> unit
val make_put_mailbox_permissions_request :
  permission_values:permission_values ->
    grantee_id:entity_identifier ->
      entity_id:entity_identifier ->
        organization_id:organization_id ->
          unit -> put_mailbox_permissions_request
val make_put_inbound_dmarc_settings_response : unit -> unit
val make_put_inbound_dmarc_settings_request :
  enforced:boolean_object ->
    organization_id:organization_id ->
      unit -> put_inbound_dmarc_settings_request
val make_put_identity_provider_configuration_response : unit -> unit
val make_identity_center_configuration :
  application_arn:application_arn ->
    instance_arn:instance_arn -> unit -> identity_center_configuration
val make_personal_access_token_configuration :
  ?lifetime_in_days:personal_access_token_lifetime_in_days ->
    status:personal_access_token_configuration_status ->
      unit -> personal_access_token_configuration
val make_put_identity_provider_configuration_request :
  personal_access_token_configuration:personal_access_token_configuration ->
    identity_center_configuration:identity_center_configuration ->
      authentication_mode:identity_provider_authentication_mode ->
        organization_id:organization_id ->
          unit -> put_identity_provider_configuration_request
val make_put_email_monitoring_configuration_response : unit -> unit
val make_put_email_monitoring_configuration_request :
  log_group_arn:log_group_arn ->
    role_arn:role_arn ->
      organization_id:organization_id ->
        unit -> put_email_monitoring_configuration_request
val make_put_access_control_rule_response : unit -> unit
val make_put_access_control_rule_request :
  ?not_impersonation_role_ids:impersonation_role_id_list ->
    ?impersonation_role_ids:impersonation_role_id_list ->
      ?not_user_ids:user_id_list ->
        ?user_ids:user_id_list ->
          ?not_actions:actions_list ->
            ?actions:actions_list ->
              ?not_ip_ranges:ip_range_list ->
                ?ip_ranges:ip_range_list ->
                  organization_id:organization_id ->
                    description:access_control_rule_description ->
                      effect_:access_control_rule_effect ->
                        name:access_control_rule_name ->
                          unit -> put_access_control_rule_request
val make_user :
  ?identity_provider_identity_store_id:identity_provider_identity_store_id ->
    ?identity_provider_user_id:identity_provider_user_id ->
      ?disabled_date:timestamp ->
        ?enabled_date:timestamp ->
          ?user_role:user_role ->
            ?state:entity_state ->
              ?display_name:string_ ->
                ?name:user_name ->
                  ?email:email_address ->
                    ?id:work_mail_identifier -> unit -> user
val make_list_users_response :
  ?next_token:next_token -> ?users:users -> unit -> list_users_response
val make_list_users_filters :
  ?identity_provider_user_id_prefix:identity_provider_user_id_prefix ->
    ?state:entity_state ->
      ?primary_email_prefix:string_ ->
        ?display_name_prefix:user_attribute ->
          ?username_prefix:string_ -> unit -> list_users_filters
val make_list_users_request :
  ?filters:list_users_filters ->
    ?max_results:max_results ->
      ?next_token:next_token ->
        organization_id:organization_id -> unit -> list_users_request
val make_list_tags_for_resource_response :
  ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name ->
    unit -> list_tags_for_resource_request
val make_resource :
  ?description:resource_description ->
    ?disabled_date:timestamp ->
      ?enabled_date:timestamp ->
        ?state:entity_state ->
          ?type_:resource_type ->
            ?name:resource_name ->
              ?email:email_address ->
                ?id:work_mail_identifier -> unit -> resource
val make_list_resources_response :
  ?next_token:next_token ->
    ?resources:resources -> unit -> list_resources_response
val make_list_resources_filters :
  ?state:entity_state ->
    ?primary_email_prefix:string_ ->
      ?name_prefix:string_ -> unit -> list_resources_filters
val make_list_resources_request :
  ?filters:list_resources_filters ->
    ?max_results:max_results ->
      ?next_token:next_token ->
        organization_id:organization_id -> unit -> list_resources_request
val make_delegate : type_:member_type -> id:string_ -> unit -> delegate
val make_list_resource_delegates_response :
  ?next_token:next_token ->
    ?delegates:resource_delegates -> unit -> list_resource_delegates_response
val make_list_resource_delegates_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      resource_id:entity_identifier ->
        organization_id:organization_id ->
          unit -> list_resource_delegates_request
val make_personal_access_token_summary :
  ?scopes:personal_access_token_scope_list ->
    ?expires_time:timestamp ->
      ?date_last_used:timestamp ->
        ?date_created:timestamp ->
          ?name:personal_access_token_name ->
            ?user_id:work_mail_identifier ->
              ?personal_access_token_id:personal_access_token_id ->
                unit -> personal_access_token_summary
val make_list_personal_access_tokens_response :
  ?personal_access_token_summaries:personal_access_token_summary_list ->
    ?next_token:next_token -> unit -> list_personal_access_tokens_response
val make_list_personal_access_tokens_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?user_id:entity_identifier ->
        organization_id:organization_id ->
          unit -> list_personal_access_tokens_request
val make_organization_summary :
  ?state:string_ ->
    ?error_message:string_ ->
      ?default_mail_domain:domain_name ->
        ?alias:organization_name ->
          ?organization_id:organization_id -> unit -> organization_summary
val make_list_organizations_response :
  ?next_token:next_token ->
    ?organization_summaries:organization_summaries ->
      unit -> list_organizations_response
val make_list_organizations_request :
  ?max_results:max_results ->
    ?next_token:next_token -> unit -> list_organizations_request
val make_mobile_device_access_rule :
  ?date_modified:timestamp ->
    ?date_created:timestamp ->
      ?not_device_user_agents:device_user_agent_list ->
        ?device_user_agents:device_user_agent_list ->
          ?not_device_operating_systems:device_operating_system_list ->
            ?device_operating_systems:device_operating_system_list ->
              ?not_device_models:device_model_list ->
                ?device_models:device_model_list ->
                  ?not_device_types:device_type_list ->
                    ?device_types:device_type_list ->
                      ?effect_:mobile_device_access_rule_effect ->
                        ?description:mobile_device_access_rule_description ->
                          ?name:mobile_device_access_rule_name ->
                            ?mobile_device_access_rule_id:mobile_device_access_rule_id
                              -> unit -> mobile_device_access_rule
val make_list_mobile_device_access_rules_response :
  ?rules:mobile_device_access_rules_list ->
    unit -> list_mobile_device_access_rules_response
val make_list_mobile_device_access_rules_request :
  organization_id:organization_id ->
    unit -> list_mobile_device_access_rules_request
val make_mobile_device_access_override :
  ?date_modified:timestamp ->
    ?date_created:timestamp ->
      ?description:mobile_device_access_rule_description ->
        ?effect_:mobile_device_access_rule_effect ->
          ?device_id:device_id ->
            ?user_id:work_mail_identifier ->
              unit -> mobile_device_access_override
val make_list_mobile_device_access_overrides_response :
  ?next_token:next_token ->
    ?overrides:mobile_device_access_overrides_list ->
      unit -> list_mobile_device_access_overrides_response
val make_list_mobile_device_access_overrides_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?device_id:device_id ->
        ?user_id:entity_identifier ->
          organization_id:organization_id ->
            unit -> list_mobile_device_access_overrides_request
val make_mail_domain_summary :
  ?default_domain:boolean_ ->
    ?domain_name:domain_name -> unit -> mail_domain_summary
val make_list_mail_domains_response :
  ?next_token:next_token ->
    ?mail_domains:mail_domains -> unit -> list_mail_domains_response
val make_list_mail_domains_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      organization_id:organization_id -> unit -> list_mail_domains_request
val make_permission :
  permission_values:permission_values ->
    grantee_type:member_type ->
      grantee_id:work_mail_identifier -> unit -> permission
val make_list_mailbox_permissions_response :
  ?next_token:next_token ->
    ?permissions:permissions -> unit -> list_mailbox_permissions_response
val make_list_mailbox_permissions_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      entity_id:entity_identifier ->
        organization_id:organization_id ->
          unit -> list_mailbox_permissions_request
val make_mailbox_export_job :
  ?end_time:timestamp ->
    ?start_time:timestamp ->
      ?state:mailbox_export_job_state ->
        ?estimated_progress:percentage ->
          ?s3_path:s3_object_key ->
            ?s3_bucket_name:s3_bucket_name ->
              ?description:description ->
                ?entity_id:work_mail_identifier ->
                  ?job_id:mailbox_export_job_id -> unit -> mailbox_export_job
val make_list_mailbox_export_jobs_response :
  ?next_token:next_token ->
    ?jobs:jobs -> unit -> list_mailbox_export_jobs_response
val make_list_mailbox_export_jobs_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      organization_id:organization_id ->
        unit -> list_mailbox_export_jobs_request
val make_impersonation_role :
  ?date_modified:timestamp ->
    ?date_created:timestamp ->
      ?type_:impersonation_role_type ->
        ?name:impersonation_role_name ->
          ?impersonation_role_id:impersonation_role_id ->
            unit -> impersonation_role
val make_list_impersonation_roles_response :
  ?next_token:next_token ->
    ?roles:impersonation_role_list ->
      unit -> list_impersonation_roles_response
val make_list_impersonation_roles_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      organization_id:organization_id ->
        unit -> list_impersonation_roles_request
val make_group_identifier :
  ?group_name:group_name ->
    ?group_id:work_mail_identifier -> unit -> group_identifier
val make_list_groups_for_entity_response :
  ?next_token:next_token ->
    ?groups:group_identifiers -> unit -> list_groups_for_entity_response
val make_list_groups_for_entity_filters :
  ?group_name_prefix:string_ -> unit -> list_groups_for_entity_filters
val make_list_groups_for_entity_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:list_groups_for_entity_filters ->
        entity_id:entity_identifier ->
          organization_id:organization_id ->
            unit -> list_groups_for_entity_request
val make_group :
  ?disabled_date:timestamp ->
    ?enabled_date:timestamp ->
      ?state:entity_state ->
        ?name:group_name ->
          ?email:email_address -> ?id:work_mail_identifier -> unit -> group
val make_list_groups_response :
  ?next_token:next_token -> ?groups:groups -> unit -> list_groups_response
val make_list_groups_filters :
  ?state:entity_state ->
    ?primary_email_prefix:string_ ->
      ?name_prefix:string_ -> unit -> list_groups_filters
val make_list_groups_request :
  ?filters:list_groups_filters ->
    ?max_results:max_results ->
      ?next_token:next_token ->
        organization_id:organization_id -> unit -> list_groups_request
val make_member :
  ?disabled_date:timestamp ->
    ?enabled_date:timestamp ->
      ?state:entity_state ->
        ?type_:member_type -> ?name:string_ -> ?id:string_ -> unit -> member
val make_list_group_members_response :
  ?next_token:next_token ->
    ?members:members -> unit -> list_group_members_response
val make_list_group_members_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      group_id:entity_identifier ->
        organization_id:organization_id -> unit -> list_group_members_request
val make_redacted_ews_availability_provider :
  ?ews_username:external_user_name ->
    ?ews_endpoint:url -> unit -> redacted_ews_availability_provider
val make_availability_configuration :
  ?date_modified:timestamp ->
    ?date_created:timestamp ->
      ?lambda_provider:lambda_availability_provider ->
        ?ews_provider:redacted_ews_availability_provider ->
          ?provider_type:availability_provider_type ->
            ?domain_name:domain_name -> unit -> availability_configuration
val make_list_availability_configurations_response :
  ?next_token:next_token ->
    ?availability_configurations:availability_configuration_list ->
      unit -> list_availability_configurations_response
val make_list_availability_configurations_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      organization_id:organization_id ->
        unit -> list_availability_configurations_request
val make_list_aliases_response :
  ?next_token:next_token -> ?aliases:aliases -> unit -> list_aliases_response
val make_list_aliases_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      entity_id:work_mail_identifier ->
        organization_id:organization_id -> unit -> list_aliases_request
val make_access_control_rule :
  ?not_impersonation_role_ids:impersonation_role_id_list ->
    ?impersonation_role_ids:impersonation_role_id_list ->
      ?date_modified:timestamp ->
        ?date_created:timestamp ->
          ?not_user_ids:user_id_list ->
            ?user_ids:user_id_list ->
              ?not_actions:actions_list ->
                ?actions:actions_list ->
                  ?not_ip_ranges:ip_range_list ->
                    ?ip_ranges:ip_range_list ->
                      ?description:access_control_rule_description ->
                        ?effect_:access_control_rule_effect ->
                          ?name:access_control_rule_name ->
                            unit -> access_control_rule
val make_list_access_control_rules_response :
  ?rules:access_control_rules_list ->
    unit -> list_access_control_rules_response
val make_list_access_control_rules_request :
  organization_id:organization_id ->
    unit -> list_access_control_rules_request
val make_get_personal_access_token_metadata_response :
  ?scopes:personal_access_token_scope_list ->
    ?expires_time:timestamp ->
      ?date_last_used:timestamp ->
        ?date_created:timestamp ->
          ?name:personal_access_token_name ->
            ?user_id:work_mail_identifier ->
              ?personal_access_token_id:personal_access_token_id ->
                unit -> get_personal_access_token_metadata_response
val make_get_personal_access_token_metadata_request :
  personal_access_token_id:personal_access_token_id ->
    organization_id:organization_id ->
      unit -> get_personal_access_token_metadata_request
val make_get_mobile_device_access_override_response :
  ?date_modified:timestamp ->
    ?date_created:timestamp ->
      ?description:mobile_device_access_rule_description ->
        ?effect_:mobile_device_access_rule_effect ->
          ?device_id:device_id ->
            ?user_id:work_mail_identifier ->
              unit -> get_mobile_device_access_override_response
val make_get_mobile_device_access_override_request :
  device_id:device_id ->
    user_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> get_mobile_device_access_override_request
val make_mobile_device_access_matched_rule :
  ?name:mobile_device_access_rule_name ->
    ?mobile_device_access_rule_id:mobile_device_access_rule_id ->
      unit -> mobile_device_access_matched_rule
val make_get_mobile_device_access_effect_response :
  ?matched_rules:mobile_device_access_matched_rule_list ->
    ?effect_:mobile_device_access_rule_effect ->
      unit -> get_mobile_device_access_effect_response
val make_get_mobile_device_access_effect_request :
  ?device_user_agent:device_user_agent ->
    ?device_operating_system:device_operating_system ->
      ?device_model:device_model ->
        ?device_type:device_type ->
          organization_id:organization_id ->
            unit -> get_mobile_device_access_effect_request
val make_dns_record :
  ?value:string_ -> ?hostname:string_ -> ?type_:string_ -> unit -> dns_record
val make_get_mail_domain_response :
  ?dkim_verification_status:dns_record_verification_status ->
    ?ownership_verification_status:dns_record_verification_status ->
      ?is_default:boolean_ ->
        ?is_test_domain:boolean_ ->
          ?records:dns_records -> unit -> get_mail_domain_response
val make_get_mail_domain_request :
  domain_name:work_mail_domain_name ->
    organization_id:organization_id -> unit -> get_mail_domain_request
val make_get_mailbox_details_response :
  ?mailbox_size:mailbox_size ->
    ?mailbox_quota:mailbox_quota -> unit -> get_mailbox_details_response
val make_get_mailbox_details_request :
  user_id:entity_identifier ->
    organization_id:organization_id -> unit -> get_mailbox_details_request
val make_impersonation_matched_rule :
  ?name:impersonation_rule_name ->
    ?impersonation_rule_id:impersonation_rule_id ->
      unit -> impersonation_matched_rule
val make_get_impersonation_role_effect_response :
  ?matched_rules:impersonation_matched_rule_list ->
    ?effect_:access_effect ->
      ?type_:impersonation_role_type ->
        unit -> get_impersonation_role_effect_response
val make_get_impersonation_role_effect_request :
  target_user:entity_identifier ->
    impersonation_role_id:impersonation_role_id ->
      organization_id:organization_id ->
        unit -> get_impersonation_role_effect_request
val make_get_impersonation_role_response :
  ?date_modified:timestamp ->
    ?date_created:timestamp ->
      ?rules:impersonation_rule_list ->
        ?description:impersonation_role_description ->
          ?type_:impersonation_role_type ->
            ?name:impersonation_role_name ->
              ?impersonation_role_id:impersonation_role_id ->
                unit -> get_impersonation_role_response
val make_get_impersonation_role_request :
  impersonation_role_id:impersonation_role_id ->
    organization_id:organization_id -> unit -> get_impersonation_role_request
val make_get_default_retention_policy_response :
  ?folder_configurations:folder_configurations ->
    ?description:string_ ->
      ?name:short_string ->
        ?id:short_string -> unit -> get_default_retention_policy_response
val make_get_default_retention_policy_request :
  organization_id:organization_id ->
    unit -> get_default_retention_policy_request
val make_get_access_control_effect_response :
  ?matched_rules:access_control_rule_name_list ->
    ?effect_:access_control_rule_effect ->
      unit -> get_access_control_effect_response
val make_get_access_control_effect_request :
  ?impersonation_role_id:impersonation_role_id ->
    ?user_id:work_mail_identifier ->
      action:access_control_rule_action ->
        ip_address:ip_address ->
          organization_id:organization_id ->
            unit -> get_access_control_effect_request
val make_disassociate_member_from_group_response : unit -> unit
val make_disassociate_member_from_group_request :
  member_id:entity_identifier ->
    group_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> disassociate_member_from_group_request
val make_disassociate_delegate_from_resource_response : unit -> unit
val make_disassociate_delegate_from_resource_request :
  entity_id:entity_identifier ->
    resource_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> disassociate_delegate_from_resource_request
val make_describe_user_response :
  ?identity_provider_identity_store_id:identity_provider_identity_store_id ->
    ?identity_provider_user_id:identity_provider_user_id ->
      ?office:user_attribute ->
        ?country:user_attribute ->
          ?department:user_attribute ->
            ?zip_code:user_attribute ->
              ?company:user_attribute ->
                ?city:user_attribute ->
                  ?job_title:user_attribute ->
                    ?street:user_attribute ->
                      ?telephone:user_attribute ->
                        ?initials:user_attribute ->
                          ?hidden_from_global_address_list:boolean_ ->
                            ?last_name:user_attribute ->
                              ?first_name:user_attribute ->
                                ?mailbox_deprovisioned_date:timestamp ->
                                  ?mailbox_provisioned_date:timestamp ->
                                    ?disabled_date:timestamp ->
                                      ?enabled_date:timestamp ->
                                        ?user_role:user_role ->
                                          ?state:entity_state ->
                                            ?display_name:user_attribute ->
                                              ?email:email_address ->
                                                ?name:user_name ->
                                                  ?user_id:work_mail_identifier
                                                    ->
                                                    unit ->
                                                      describe_user_response
val make_describe_user_request :
  user_id:entity_identifier ->
    organization_id:organization_id -> unit -> describe_user_request
val make_describe_resource_response :
  ?hidden_from_global_address_list:boolean_ ->
    ?description:resource_description ->
      ?disabled_date:timestamp ->
        ?enabled_date:timestamp ->
          ?state:entity_state ->
            ?booking_options:booking_options ->
              ?type_:resource_type ->
                ?name:resource_name ->
                  ?email:email_address ->
                    ?resource_id:resource_id ->
                      unit -> describe_resource_response
val make_describe_resource_request :
  resource_id:entity_identifier ->
    organization_id:organization_id -> unit -> describe_resource_request
val make_describe_organization_response :
  ?interoperability_enabled:boolean_ ->
    ?migration_admin:work_mail_identifier ->
      ?ar_n:amazon_resource_name ->
        ?error_message:string_ ->
          ?completed_date:timestamp ->
            ?default_mail_domain:string_ ->
              ?directory_type:string_ ->
                ?directory_id:string_ ->
                  ?state:string_ ->
                    ?alias:organization_name ->
                      ?organization_id:organization_id ->
                        unit -> describe_organization_response
val make_describe_organization_request :
  organization_id:organization_id -> unit -> describe_organization_request
val make_describe_mailbox_export_job_response :
  ?end_time:timestamp ->
    ?start_time:timestamp ->
      ?error_info:mailbox_export_error_info ->
        ?state:mailbox_export_job_state ->
          ?estimated_progress:percentage ->
            ?s3_path:s3_object_key ->
              ?s3_prefix:s3_object_key ->
                ?s3_bucket_name:s3_bucket_name ->
                  ?kms_key_arn:kms_key_arn ->
                    ?role_arn:role_arn ->
                      ?description:description ->
                        ?entity_id:work_mail_identifier ->
                          unit -> describe_mailbox_export_job_response
val make_describe_mailbox_export_job_request :
  organization_id:organization_id ->
    job_id:mailbox_export_job_id ->
      unit -> describe_mailbox_export_job_request
val make_describe_inbound_dmarc_settings_response :
  ?enforced:boolean_ -> unit -> describe_inbound_dmarc_settings_response
val make_describe_inbound_dmarc_settings_request :
  organization_id:organization_id ->
    unit -> describe_inbound_dmarc_settings_request
val make_describe_identity_provider_configuration_response :
  ?personal_access_token_configuration:personal_access_token_configuration ->
    ?identity_center_configuration:identity_center_configuration ->
      ?authentication_mode:identity_provider_authentication_mode ->
        unit -> describe_identity_provider_configuration_response
val make_describe_identity_provider_configuration_request :
  organization_id:organization_id ->
    unit -> describe_identity_provider_configuration_request
val make_describe_group_response :
  ?hidden_from_global_address_list:boolean_ ->
    ?disabled_date:timestamp ->
      ?enabled_date:timestamp ->
        ?state:entity_state ->
          ?email:email_address ->
            ?name:group_name ->
              ?group_id:work_mail_identifier ->
                unit -> describe_group_response
val make_describe_group_request :
  group_id:entity_identifier ->
    organization_id:organization_id -> unit -> describe_group_request
val make_describe_entity_response :
  ?type_:entity_type ->
    ?name:string_ ->
      ?entity_id:work_mail_identifier -> unit -> describe_entity_response
val make_describe_entity_request :
  email:email_address ->
    organization_id:organization_id -> unit -> describe_entity_request
val make_describe_email_monitoring_configuration_response :
  ?log_group_arn:log_group_arn ->
    ?role_arn:role_arn ->
      unit -> describe_email_monitoring_configuration_response
val make_describe_email_monitoring_configuration_request :
  organization_id:organization_id ->
    unit -> describe_email_monitoring_configuration_request
val make_deregister_mail_domain_response : unit -> unit
val make_deregister_mail_domain_request :
  domain_name:work_mail_domain_name ->
    organization_id:organization_id -> unit -> deregister_mail_domain_request
val make_deregister_from_work_mail_response : unit -> unit
val make_deregister_from_work_mail_request :
  entity_id:entity_identifier ->
    organization_id:organization_id ->
      unit -> deregister_from_work_mail_request
val make_delete_user_response : unit -> unit
val make_delete_user_request :
  user_id:entity_identifier ->
    organization_id:organization_id -> unit -> delete_user_request
val make_delete_retention_policy_response : unit -> unit
val make_delete_retention_policy_request :
  id:short_string ->
    organization_id:organization_id ->
      unit -> delete_retention_policy_request
val make_delete_resource_response : unit -> unit
val make_delete_resource_request :
  resource_id:entity_identifier ->
    organization_id:organization_id -> unit -> delete_resource_request
val make_delete_personal_access_token_response : unit -> unit
val make_delete_personal_access_token_request :
  personal_access_token_id:personal_access_token_id ->
    organization_id:organization_id ->
      unit -> delete_personal_access_token_request
val make_delete_organization_response :
  ?state:string_ ->
    ?organization_id:organization_id -> unit -> delete_organization_response
val make_delete_organization_request :
  ?delete_identity_center_application:boolean_ ->
    ?force_delete:boolean_ ->
      ?client_token:idempotency_client_token ->
        delete_directory:boolean_ ->
          organization_id:organization_id ->
            unit -> delete_organization_request
val make_delete_mobile_device_access_rule_response : unit -> unit
val make_delete_mobile_device_access_rule_request :
  mobile_device_access_rule_id:mobile_device_access_rule_id ->
    organization_id:organization_id ->
      unit -> delete_mobile_device_access_rule_request
val make_delete_mobile_device_access_override_response : unit -> unit
val make_delete_mobile_device_access_override_request :
  device_id:device_id ->
    user_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> delete_mobile_device_access_override_request
val make_delete_mailbox_permissions_response : unit -> unit
val make_delete_mailbox_permissions_request :
  grantee_id:entity_identifier ->
    entity_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> delete_mailbox_permissions_request
val make_delete_impersonation_role_response : unit -> unit
val make_delete_impersonation_role_request :
  impersonation_role_id:impersonation_role_id ->
    organization_id:organization_id ->
      unit -> delete_impersonation_role_request
val make_delete_identity_provider_configuration_response : unit -> unit
val make_delete_identity_provider_configuration_request :
  organization_id:organization_id ->
    unit -> delete_identity_provider_configuration_request
val make_delete_identity_center_application_response : unit -> unit
val make_delete_identity_center_application_request :
  application_arn:application_arn ->
    unit -> delete_identity_center_application_request
val make_delete_group_response : unit -> unit
val make_delete_group_request :
  group_id:entity_identifier ->
    organization_id:organization_id -> unit -> delete_group_request
val make_delete_email_monitoring_configuration_response : unit -> unit
val make_delete_email_monitoring_configuration_request :
  organization_id:organization_id ->
    unit -> delete_email_monitoring_configuration_request
val make_delete_availability_configuration_response : unit -> unit
val make_delete_availability_configuration_request :
  domain_name:domain_name ->
    organization_id:organization_id ->
      unit -> delete_availability_configuration_request
val make_delete_alias_response : unit -> unit
val make_delete_alias_request :
  alias:email_address ->
    entity_id:work_mail_identifier ->
      organization_id:organization_id -> unit -> delete_alias_request
val make_delete_access_control_rule_response : unit -> unit
val make_delete_access_control_rule_request :
  name:access_control_rule_name ->
    organization_id:organization_id ->
      unit -> delete_access_control_rule_request
val make_create_user_response :
  ?user_id:work_mail_identifier -> unit -> create_user_response
val make_create_user_request :
  ?identity_provider_user_id:identity_provider_user_id ->
    ?hidden_from_global_address_list:boolean_ ->
      ?last_name:user_attribute ->
        ?first_name:user_attribute ->
          ?role:user_role ->
            ?password:password ->
              display_name:user_attribute ->
                name:user_name ->
                  organization_id:organization_id ->
                    unit -> create_user_request
val make_create_resource_response :
  ?resource_id:resource_id -> unit -> create_resource_response
val make_create_resource_request :
  ?hidden_from_global_address_list:boolean_ ->
    ?description:resource_description ->
      type_:resource_type ->
        name:resource_name ->
          organization_id:organization_id -> unit -> create_resource_request
val make_create_organization_response :
  ?organization_id:organization_id -> unit -> create_organization_response
val make_domain :
  ?hosted_zone_id:hosted_zone_id -> domain_name:domain_name -> unit -> domain
val make_create_organization_request :
  ?enable_interoperability:boolean_ ->
    ?kms_key_arn:kms_key_arn ->
      ?domains:domains ->
        ?client_token:idempotency_client_token ->
          ?directory_id:directory_id ->
            alias:organization_name -> unit -> create_organization_request
val make_create_mobile_device_access_rule_response :
  ?mobile_device_access_rule_id:mobile_device_access_rule_id ->
    unit -> create_mobile_device_access_rule_response
val make_create_mobile_device_access_rule_request :
  ?not_device_user_agents:device_user_agent_list ->
    ?device_user_agents:device_user_agent_list ->
      ?not_device_operating_systems:device_operating_system_list ->
        ?device_operating_systems:device_operating_system_list ->
          ?not_device_models:device_model_list ->
            ?device_models:device_model_list ->
              ?not_device_types:device_type_list ->
                ?device_types:device_type_list ->
                  ?description:mobile_device_access_rule_description ->
                    ?client_token:idempotency_client_token ->
                      effect_:mobile_device_access_rule_effect ->
                        name:mobile_device_access_rule_name ->
                          organization_id:organization_id ->
                            unit -> create_mobile_device_access_rule_request
val make_create_impersonation_role_response :
  ?impersonation_role_id:impersonation_role_id ->
    unit -> create_impersonation_role_response
val make_create_impersonation_role_request :
  ?description:impersonation_role_description ->
    ?client_token:idempotency_client_token ->
      rules:impersonation_rule_list ->
        type_:impersonation_role_type ->
          name:impersonation_role_name ->
            organization_id:organization_id ->
              unit -> create_impersonation_role_request
val make_create_identity_center_application_response :
  ?application_arn:application_arn ->
    unit -> create_identity_center_application_response
val make_create_identity_center_application_request :
  ?client_token:idempotency_client_token ->
    instance_arn:instance_arn ->
      name:identity_center_application_name ->
        unit -> create_identity_center_application_request
val make_create_group_response :
  ?group_id:work_mail_identifier -> unit -> create_group_response
val make_create_group_request :
  ?hidden_from_global_address_list:boolean_ ->
    name:group_name ->
      organization_id:organization_id -> unit -> create_group_request
val make_create_availability_configuration_response : unit -> unit
val make_create_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
    ?ews_provider:ews_availability_provider ->
      ?client_token:idempotency_client_token ->
        domain_name:domain_name ->
          organization_id:organization_id ->
            unit -> create_availability_configuration_request
val make_create_alias_response : unit -> unit
val make_create_alias_request :
  alias:email_address ->
    entity_id:work_mail_identifier ->
      organization_id:organization_id -> unit -> create_alias_request
val make_cancel_mailbox_export_job_response : unit -> unit
val make_cancel_mailbox_export_job_request :
  organization_id:organization_id ->
    job_id:mailbox_export_job_id ->
      client_token:idempotency_client_token ->
        unit -> cancel_mailbox_export_job_request
val make_assume_impersonation_role_response :
  ?expires_in:expires_in ->
    ?token:impersonation_token -> unit -> assume_impersonation_role_response
val make_assume_impersonation_role_request :
  impersonation_role_id:impersonation_role_id ->
    organization_id:organization_id ->
      unit -> assume_impersonation_role_request
val make_associate_member_to_group_response : unit -> unit
val make_associate_member_to_group_request :
  member_id:entity_identifier ->
    group_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> associate_member_to_group_request
val make_associate_delegate_to_resource_response : unit -> unit
val make_associate_delegate_to_resource_request :
  entity_id:entity_identifier ->
    resource_id:entity_identifier ->
      organization_id:organization_id ->
        unit -> associate_delegate_to_resource_request
(** {1:operations Operations} *)

module AssociateDelegateToResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_delegate_to_resource_request ->
        (associate_delegate_to_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Adds a member (user or group) to the resource's set of delegates.\n"]
module AssociateMemberToGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_member_to_group_request ->
        (associate_member_to_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Adds a member (user or group) to the group's set.\n"]
module AssumeImpersonationRole :
sig
  val request :
    Smaws_Lib.Context.t ->
      assume_impersonation_role_request ->
        (assume_impersonation_role_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Assumes an impersonation role for the given WorkMail organization. This method returns an authentication token you can use to make impersonated calls.\n"]
module CancelMailboxExportJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_mailbox_export_job_request ->
        (cancel_mailbox_export_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Cancels a mailbox export job.\n\n  If the mailbox export job is near completion, it might not be possible to cancel it.\n  \n   "]
module CreateAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (create_alias_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EmailAddressInUseException of email_address_in_use_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `MailDomainNotFoundException of mail_domain_not_found_exception 
          | `MailDomainStateException of mail_domain_state_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Adds an alias to the set of a given member (user or group) of WorkMail.\n"]
module CreateAvailabilityConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_availability_configuration_request ->
        (create_availability_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NameAvailabilityException of name_availability_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Creates an [AvailabilityConfiguration] for the given WorkMail organization and domain.\n"]
module CreateGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_group_request ->
        (create_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NameAvailabilityException of name_availability_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ReservedNameException of reserved_name_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Creates a group that can be used in WorkMail by calling the [RegisterToWorkMail] operation.\n"]
module CreateIdentityCenterApplication :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_identity_center_application_request ->
        (create_identity_center_application_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception ])
          result
end[@@ocaml.doc
     " Creates the WorkMail application in IAM Identity Center that can be used later in the WorkMail - IdC integration. For more information, see PutIdentityProviderConfiguration. This action does not affect the authentication settings for any WorkMail organizations. \n"]
module CreateImpersonationRole :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_impersonation_role_request ->
        (create_impersonation_role_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Creates an impersonation role for the given WorkMail organization.\n\n  {i Idempotency} ensures that an API request completes no more than one time. With an idempotent request, if the original request completes successfully, any subsequent retries also complete successfully without performing any further actions.\n "]
module CreateMobileDeviceAccessRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_mobile_device_access_rule_request ->
        (create_mobile_device_access_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Creates a new mobile device access rule for the specified WorkMail organization.\n"]
module CreateOrganization :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_organization_request ->
        (create_organization_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryInUseException of directory_in_use_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `NameAvailabilityException of name_availability_exception ])
          result
end[@@ocaml.doc
     "Creates a new WorkMail organization. Optionally, you can choose to associate an existing AWS Directory Service directory with your organization. If an AWS Directory Service directory ID is specified, the organization alias must match the directory alias. If you choose not to associate an existing directory with your organization, then we create a new WorkMail directory for you. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_new_organization.html}Adding an organization} in the {i WorkMail Administrator Guide}.\n\n You can associate multiple email domains with an organization, then choose your default email domain from the WorkMail console. You can also associate a domain that is managed in an Amazon Route 53 public hosted zone. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html}Adding a domain} and {{:https://docs.aws.amazon.com/workmail/latest/adminguide/default_domain.html}Choosing the default domain} in the {i WorkMail Administrator Guide}.\n \n  Optionally, you can use a customer managed key from AWS Key Management Service (AWS KMS) to encrypt email for your organization. If you don't associate an AWS KMS key, WorkMail creates a default, AWS managed key for you.\n  "]
module CreateResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_resource_request ->
        (create_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `NameAvailabilityException of name_availability_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ReservedNameException of reserved_name_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Creates a new WorkMail resource.\n"]
module CreateUser :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_user_request ->
        (create_user_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidPasswordException of invalid_password_exception 
          | `NameAvailabilityException of name_availability_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ReservedNameException of reserved_name_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Creates a user who can be used in WorkMail by calling the [RegisterToWorkMail] operation.\n"]
module DeleteAccessControlRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_control_rule_request ->
        (delete_access_control_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Deletes an access control rule for the specified WorkMail organization.\n\n  Deleting already deleted and non-existing rules does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.\n  \n   "]
module DeleteAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alias_request ->
        (delete_alias_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Remove one or more specified aliases from a set of aliases for a given user.\n"]
module DeleteAvailabilityConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_availability_configuration_request ->
        (delete_availability_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Deletes the [AvailabilityConfiguration] for the given WorkMail organization and domain.\n"]
module DeleteEmailMonitoringConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_email_monitoring_configuration_request ->
        (delete_email_monitoring_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Deletes the email monitoring configuration for a specified organization.\n"]
module DeleteGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_group_request ->
        (delete_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Deletes a group from WorkMail.\n"]
module DeleteIdentityCenterApplication :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identity_center_application_request ->
        (delete_identity_center_application_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     " Deletes the IAM Identity Center application from WorkMail. This action does not affect the authentication settings for any WorkMail organizations. \n"]
module DeleteIdentityProviderConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_identity_provider_configuration_request ->
        (delete_identity_provider_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     " Disables the integration between IdC and WorkMail. Authentication will continue with the directory as it was before the IdC integration. You might have to reset your directory passwords and reconfigure your desktop and mobile email clients. \n"]
module DeleteImpersonationRole :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_impersonation_role_request ->
        (delete_impersonation_role_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Deletes an impersonation role for the given WorkMail organization.\n"]
module DeleteMailboxPermissions :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mailbox_permissions_request ->
        (delete_mailbox_permissions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Deletes permissions granted to a member (user or group).\n"]
module DeleteMobileDeviceAccessOverride :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mobile_device_access_override_request ->
        (delete_mobile_device_access_override_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Deletes the mobile device access override for the given WorkMail organization, user, and device.\n\n  Deleting already deleted and non-existing overrides does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.\n  \n   "]
module DeleteMobileDeviceAccessRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mobile_device_access_rule_request ->
        (delete_mobile_device_access_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Deletes a mobile device access rule for the specified WorkMail organization.\n\n  Deleting already deleted and non-existing rules does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.\n  \n   "]
module DeleteOrganization :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_request ->
        (delete_organization_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Deletes an WorkMail organization and all underlying AWS resources managed by WorkMail as part of the organization. You can choose whether to delete the associated directory. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/remove_organization.html}Removing an organization} in the {i WorkMail Administrator Guide}.\n"]
module DeletePersonalAccessToken :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_personal_access_token_request ->
        (delete_personal_access_token_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     " Deletes the Personal Access Token from the provided WorkMail Organization. \n"]
module DeleteResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_request ->
        (delete_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Deletes the specified resource.\n"]
module DeleteRetentionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_retention_policy_request ->
        (delete_retention_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Deletes the specified retention policy from the specified organization.\n"]
module DeleteUser :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_user_request ->
        (delete_user_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Deletes a user from WorkMail and all subsequent systems. Before you can delete a user, the user state must be [DISABLED]. Use the [DescribeUser] action to confirm the user state.\n\n Deleting a user is permanent and cannot be undone. WorkMail archives user mailboxes for 30 days before they are permanently removed.\n "]
module DeregisterFromWorkMail :
sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_from_work_mail_request ->
        (deregister_from_work_mail_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Mark a user, group, or resource as no longer used in WorkMail. This action disassociates the mailbox and schedules it for clean-up. WorkMail keeps mailboxes for 30 days before they are permanently removed. The functionality in the console is {i Disable}.\n"]
module DeregisterMailDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_mail_domain_request ->
        (deregister_mail_domain_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidCustomSesConfigurationException of
              invalid_custom_ses_configuration_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `MailDomainInUseException of mail_domain_in_use_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Removes a domain from WorkMail, stops email routing to WorkMail, and removes the authorization allowing WorkMail use. SES keeps the domain because other applications may use it. You must first remove any email address used by WorkMail entities before you remove the domain.\n"]
module DescribeEmailMonitoringConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_email_monitoring_configuration_request ->
        (describe_email_monitoring_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Describes the current email monitoring configuration for a specified organization.\n"]
module DescribeEntity :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_entity_request ->
        (describe_entity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Returns basic details about an entity in WorkMail. \n"]
module DescribeGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_group_request ->
        (describe_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Returns the data available for the group.\n"]
module DescribeIdentityProviderConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_identity_provider_configuration_request ->
        (describe_identity_provider_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     " Returns detailed information on the current IdC setup for the WorkMail organization. \n"]
module DescribeInboundDmarcSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_inbound_dmarc_settings_request ->
        (describe_inbound_dmarc_settings_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Lists the settings in a DMARC policy for a specified organization.\n"]
module DescribeMailboxExportJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_mailbox_export_job_request ->
        (describe_mailbox_export_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Describes the current status of a mailbox export job.\n"]
module DescribeOrganization :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_request ->
        (describe_organization_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception ])
          result
end[@@ocaml.doc
     "Provides more information regarding a given organization based on its identifier.\n"]
module DescribeResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_resource_request ->
        (describe_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Returns the data available for the resource.\n"]
module DescribeUser :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_user_request ->
        (describe_user_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Provides information regarding the user.\n"]
module DisassociateDelegateFromResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_delegate_from_resource_request ->
        (disassociate_delegate_from_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Removes a member from the resource's set of delegates.\n"]
module DisassociateMemberFromGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_member_from_group_request ->
        (disassociate_member_from_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Removes a member from a group.\n"]
module GetAccessControlEffect :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_control_effect_request ->
        (get_access_control_effect_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Gets the effects of an organization's access control rules as they apply to a specified IPv4 address, access protocol action, and user ID or impersonation role ID. You must provide either the user ID or impersonation role ID. Impersonation role ID can only be used with Action EWS.\n"]
module GetDefaultRetentionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_default_retention_policy_request ->
        (get_default_retention_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Gets the default retention policy details for the specified organization.\n"]
module GetImpersonationRole :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_impersonation_role_request ->
        (get_impersonation_role_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Gets the impersonation role details for the given WorkMail organization.\n"]
module GetImpersonationRoleEffect :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_impersonation_role_effect_request ->
        (get_impersonation_role_effect_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Tests whether the given impersonation role can impersonate a target user.\n"]
module GetMailboxDetails :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_mailbox_details_request ->
        (get_mailbox_details_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Requests a user's mailbox details for a specified organization and user.\n"]
module GetMailDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_mail_domain_request ->
        (get_mail_domain_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `MailDomainNotFoundException of mail_domain_not_found_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Gets details for a mail domain, including domain records required to configure your domain with recommended security.\n"]
module GetMobileDeviceAccessEffect :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_device_access_effect_request ->
        (get_mobile_device_access_effect_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Simulates the effect of the mobile device access rules for the given attributes of a sample access event. Use this method to test the effects of the current set of mobile device access rules for the WorkMail organization for a particular user's attributes.\n"]
module GetMobileDeviceAccessOverride :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_device_access_override_request ->
        (get_mobile_device_access_override_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Gets the mobile device access override for the given WorkMail organization, user, and device.\n"]
module GetPersonalAccessTokenMetadata :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_personal_access_token_metadata_request ->
        (get_personal_access_token_metadata_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     " Requests details of a specific Personal Access Token within the WorkMail organization. \n"]
module ListAccessControlRules :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_control_rules_request ->
        (list_access_control_rules_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Lists the access control rules for the specified organization.\n"]
module ListAliases :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_aliases_request ->
        (list_aliases_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Creates a paginated call to list the aliases associated with a given entity.\n"]
module ListAvailabilityConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_availability_configurations_request ->
        (list_availability_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "List all the [AvailabilityConfiguration]'s for the given WorkMail organization.\n"]
module ListGroupMembers :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_group_members_request ->
        (list_group_members_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Returns an overview of the members of a group. Users and groups can be members of a group.\n"]
module ListGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_request ->
        (list_groups_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Returns summaries of the organization's groups.\n"]
module ListGroupsForEntity :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_for_entity_request ->
        (list_groups_for_entity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Returns all the groups to which an entity belongs.\n"]
module ListImpersonationRoles :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_impersonation_roles_request ->
        (list_impersonation_roles_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Lists all the impersonation roles for the given WorkMail organization.\n"]
module ListMailboxExportJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_mailbox_export_jobs_request ->
        (list_mailbox_export_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Lists the mailbox export jobs started for the specified organization within the last seven days.\n"]
module ListMailboxPermissions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_mailbox_permissions_request ->
        (list_mailbox_permissions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Lists the mailbox permissions associated with a user, group, or resource mailbox.\n"]
module ListMailDomains :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_mail_domains_request ->
        (list_mail_domains_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Lists the mail domains in a given WorkMail organization.\n"]
module ListMobileDeviceAccessOverrides :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_device_access_overrides_request ->
        (list_mobile_device_access_overrides_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Lists all the mobile device access overrides for any given combination of WorkMail organization, user, or device.\n"]
module ListMobileDeviceAccessRules :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_device_access_rules_request ->
        (list_mobile_device_access_rules_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Lists the mobile device access rules for the specified WorkMail organization.\n"]
module ListOrganizations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_organizations_request ->
        (list_organizations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception ])
          result
end[@@ocaml.doc "Returns summaries of the customer's organizations.\n"]
module ListPersonalAccessTokens :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_personal_access_tokens_request ->
        (list_personal_access_tokens_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc " Returns a summary of your Personal Access Tokens. \n"]
module ListResourceDelegates :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_delegates_request ->
        (list_resource_delegates_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Lists the delegates associated with a resource. Users and groups can be resource delegates and answer requests on behalf of the resource.\n"]
module ListResources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_request ->
        (list_resources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Returns summaries of the organization's resources.\n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the tags applied to an WorkMail organization resource.\n"]
module ListUsers :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_users_request ->
        (list_users_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Returns summaries of the organization's users.\n"]
module PutAccessControlRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_access_control_rule_request ->
        (put_access_control_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Adds a new access control rule for the specified organization. The rule allows or denies access to the organization for the specified IPv4 addresses, access protocol actions, user IDs and impersonation IDs. Adding a new rule with the same name as an existing rule replaces the older rule.\n"]
module PutEmailMonitoringConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_email_monitoring_configuration_request ->
        (put_email_monitoring_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates or updates the email monitoring configuration for a specified organization.\n"]
module PutIdentityProviderConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_identity_provider_configuration_request ->
        (put_identity_provider_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     " Enables integration between IAM Identity Center (IdC) and WorkMail to proxy authentication requests for mailbox users. You can connect your IdC directory or your external directory to WorkMail through IdC and manage access to WorkMail mailboxes in a single place. For enhanced protection, you could enable Multifactor Authentication (MFA) and Personal Access Tokens. \n"]
module PutInboundDmarcSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_inbound_dmarc_settings_request ->
        (put_inbound_dmarc_settings_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Enables or disables a DMARC policy for a given organization.\n"]
module PutMailboxPermissions :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_mailbox_permissions_request ->
        (put_mailbox_permissions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Sets permissions for a user, group, or resource. This replaces any pre-existing permissions.\n"]
module PutMobileDeviceAccessOverride :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_mobile_device_access_override_request ->
        (put_mobile_device_access_override_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Creates or updates a mobile device access override for the given WorkMail organization, user, and device.\n"]
module PutRetentionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_retention_policy_request ->
        (put_retention_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc "Puts a retention policy to the specified organization.\n"]
module RegisterMailDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_mail_domain_request ->
        (register_mail_domain_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `MailDomainInUseException of mail_domain_in_use_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Registers a new domain in WorkMail and SES, and configures it for use by WorkMail. Emails received by SES for this domain are routed to the specified WorkMail organization, and WorkMail has permanent permission to use the specified domain for sending your users' emails.\n"]
module RegisterToWorkMail :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_to_work_mail_request ->
        (register_to_work_mail_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EmailAddressInUseException of email_address_in_use_exception 
          | `EntityAlreadyRegisteredException of
              entity_already_registered_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `MailDomainNotFoundException of mail_domain_not_found_exception 
          | `MailDomainStateException of mail_domain_state_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Registers an existing and disabled user, group, or resource for WorkMail use by associating a mailbox and calendaring capabilities. It performs no change if the user, group, or resource is enabled and fails if the user, group, or resource is deleted. This operation results in the accumulation of costs. For more information, see {{:https://aws.amazon.com/workmail/pricing}Pricing}. The equivalent console functionality for this operation is {i Enable}.\n\n Users can either be created by calling the [CreateUser] API operation or they can be synchronized from your directory. For more information, see [DeregisterFromWorkMail].\n "]
module ResetPassword :
sig
  val request :
    Smaws_Lib.Context.t ->
      reset_password_request ->
        (reset_password_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidPasswordException of invalid_password_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Allows the administrator to reset the password for a user.\n"]
module StartMailboxExportJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_mailbox_export_job_request ->
        (start_mailbox_export_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Starts a mailbox export job to export MIME-format email messages and calendar items from the specified mailbox to the specified Amazon Simple Storage Service (Amazon S3) bucket. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/mail-export.html}Exporting mailbox content} in the {i WorkMail Administrator Guide}.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `TooManyTagsException of too_many_tags_exception ]) result
end[@@ocaml.doc
     "Applies the specified tags to the specified WorkMailorganization resource.\n"]
module TestAvailabilityConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      test_availability_configuration_request ->
        (test_availability_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Performs a test on an availability provider to ensure that access is allowed. For EWS, it verifies the provided credentials can be used to successfully log in. For Lambda, it verifies that the Lambda function can be invoked and that the resource access policy was configured to deny anonymous access. An anonymous invocation is one done without providing either a [SourceArn] or [SourceAccount] header.\n\n  The request must contain either one provider definition ([EwsProvider] or [LambdaProvider]) or the [DomainName] parameter. If the [DomainName] parameter is provided, the configuration stored under the [DomainName] will be tested.\n  \n   "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Untags the specified tags from the specified WorkMail organization resource.\n"]
module UpdateAvailabilityConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_availability_configuration_request ->
        (update_availability_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates an existing [AvailabilityConfiguration] for the given WorkMail organization and domain.\n"]
module UpdateDefaultMailDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_default_mail_domain_request ->
        (update_default_mail_domain_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidParameterException of invalid_parameter_exception 
          | `MailDomainNotFoundException of mail_domain_not_found_exception 
          | `MailDomainStateException of mail_domain_state_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Updates the default mail domain for an organization. The default mail domain is used by the WorkMail AWS Console to suggest an email address when enabling a mail user. You can only have one default domain.\n"]
module UpdateGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_group_request ->
        (update_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc "Updates attributes in a group.\n"]
module UpdateImpersonationRole :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_impersonation_role_request ->
        (update_impersonation_role_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates an impersonation role for the given WorkMail organization.\n"]
module UpdateMailboxQuota :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_mailbox_quota_request ->
        (update_mailbox_quota_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Updates a user's current mailbox quota for a specified organization and user.\n"]
module UpdateMobileDeviceAccessRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_mobile_device_access_rule_request ->
        (update_mobile_device_access_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `EntityNotFoundException of entity_not_found_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception ])
          result
end[@@ocaml.doc
     "Updates a mobile device access rule for the specified WorkMail organization.\n"]
module UpdatePrimaryEmailAddress :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_primary_email_address_request ->
        (update_primary_email_address_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EmailAddressInUseException of email_address_in_use_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `MailDomainNotFoundException of mail_domain_not_found_exception 
          | `MailDomainStateException of mail_domain_state_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Updates the primary email for a user, group, or resource. The current email is moved into the list of aliases (or swapped between an existing alias and the current primary email), and the email provided in the input is promoted as the primary.\n"]
module UpdateResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_resource_request ->
        (update_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EmailAddressInUseException of email_address_in_use_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidConfigurationException of invalid_configuration_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `MailDomainNotFoundException of mail_domain_not_found_exception 
          | `MailDomainStateException of mail_domain_state_exception 
          | `NameAvailabilityException of name_availability_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Updates data for the resource. To have the latest information, it must be preceded by a [DescribeResource] call. The dataset in the request should be the one expected when performing another [DescribeResource] call.\n"]
module UpdateUser :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_user_request ->
        (update_user_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DirectoryServiceAuthenticationFailedException of
              directory_service_authentication_failed_exception 
          | `DirectoryUnavailableException of directory_unavailable_exception 
          | `EntityNotFoundException of entity_not_found_exception 
          | `EntityStateException of entity_state_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OrganizationNotFoundException of
              organization_not_found_exception 
          | `OrganizationStateException of organization_state_exception 
          | `UnsupportedOperationException of unsupported_operation_exception ])
          result
end[@@ocaml.doc
     "Updates data for the user. To have the latest information, it must be preceded by a [DescribeUser] call. The dataset in the request should be the one expected when performing another [DescribeUser] call.\n"](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
