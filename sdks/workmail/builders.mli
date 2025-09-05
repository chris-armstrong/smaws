open Types
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