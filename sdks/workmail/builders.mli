open Types

val make_access_control_rule :
  ?name:access_control_rule_name ->
  ?effect_:access_control_rule_effect ->
  ?description:access_control_rule_description ->
  ?ip_ranges:ip_range_list ->
  ?not_ip_ranges:ip_range_list ->
  ?actions:actions_list ->
  ?not_actions:actions_list ->
  ?user_ids:user_id_list ->
  ?not_user_ids:user_id_list ->
  ?date_created:timestamp ->
  ?date_modified:timestamp ->
  ?impersonation_role_ids:impersonation_role_id_list ->
  ?not_impersonation_role_ids:impersonation_role_id_list ->
  unit ->
  access_control_rule

val make_associate_delegate_to_resource_response : unit -> unit

val make_associate_delegate_to_resource_request :
  organization_id:organization_id ->
  resource_id:entity_identifier ->
  entity_id:entity_identifier ->
  unit ->
  associate_delegate_to_resource_request

val make_associate_member_to_group_response : unit -> unit

val make_associate_member_to_group_request :
  organization_id:organization_id ->
  group_id:entity_identifier ->
  member_id:entity_identifier ->
  unit ->
  associate_member_to_group_request

val make_assume_impersonation_role_response :
  ?token:impersonation_token -> ?expires_in:expires_in -> unit -> assume_impersonation_role_response

val make_assume_impersonation_role_request :
  organization_id:organization_id ->
  impersonation_role_id:impersonation_role_id ->
  unit ->
  assume_impersonation_role_request

val make_lambda_availability_provider :
  lambda_arn:lambda_arn -> unit -> lambda_availability_provider

val make_redacted_ews_availability_provider :
  ?ews_endpoint:url ->
  ?ews_username:external_user_name ->
  unit ->
  redacted_ews_availability_provider

val make_availability_configuration :
  ?domain_name:domain_name ->
  ?provider_type:availability_provider_type ->
  ?ews_provider:redacted_ews_availability_provider ->
  ?lambda_provider:lambda_availability_provider ->
  ?date_created:timestamp ->
  ?date_modified:timestamp ->
  unit ->
  availability_configuration

val make_booking_options :
  ?auto_accept_requests:boolean_ ->
  ?auto_decline_recurring_requests:boolean_ ->
  ?auto_decline_conflicting_requests:boolean_ ->
  unit ->
  booking_options

val make_cancel_mailbox_export_job_response : unit -> unit

val make_cancel_mailbox_export_job_request :
  client_token:idempotency_client_token ->
  job_id:mailbox_export_job_id ->
  organization_id:organization_id ->
  unit ->
  cancel_mailbox_export_job_request

val make_create_alias_response : unit -> unit

val make_create_alias_request :
  organization_id:organization_id ->
  entity_id:work_mail_identifier ->
  alias:email_address ->
  unit ->
  create_alias_request

val make_create_availability_configuration_response : unit -> unit

val make_ews_availability_provider :
  ews_endpoint:url ->
  ews_username:external_user_name ->
  ews_password:password ->
  unit ->
  ews_availability_provider

val make_create_availability_configuration_request :
  ?client_token:idempotency_client_token ->
  ?ews_provider:ews_availability_provider ->
  ?lambda_provider:lambda_availability_provider ->
  organization_id:organization_id ->
  domain_name:domain_name ->
  unit ->
  create_availability_configuration_request

val make_create_group_response : ?group_id:work_mail_identifier -> unit -> create_group_response

val make_create_group_request :
  ?hidden_from_global_address_list:boolean_ ->
  organization_id:organization_id ->
  name:group_name ->
  unit ->
  create_group_request

val make_create_identity_center_application_response :
  ?application_arn:application_arn -> unit -> create_identity_center_application_response

val make_create_identity_center_application_request :
  ?client_token:idempotency_client_token ->
  name:identity_center_application_name ->
  instance_arn:instance_arn ->
  unit ->
  create_identity_center_application_request

val make_create_impersonation_role_response :
  ?impersonation_role_id:impersonation_role_id -> unit -> create_impersonation_role_response

val make_impersonation_rule :
  ?name:impersonation_rule_name ->
  ?description:impersonation_rule_description ->
  ?target_users:target_users ->
  ?not_target_users:target_users ->
  impersonation_rule_id:impersonation_rule_id ->
  effect_:access_effect ->
  unit ->
  impersonation_rule

val make_create_impersonation_role_request :
  ?client_token:idempotency_client_token ->
  ?description:impersonation_role_description ->
  organization_id:organization_id ->
  name:impersonation_role_name ->
  type_:impersonation_role_type ->
  rules:impersonation_rule_list ->
  unit ->
  create_impersonation_role_request

val make_create_mobile_device_access_rule_response :
  ?mobile_device_access_rule_id:mobile_device_access_rule_id ->
  unit ->
  create_mobile_device_access_rule_response

val make_create_mobile_device_access_rule_request :
  ?client_token:idempotency_client_token ->
  ?description:mobile_device_access_rule_description ->
  ?device_types:device_type_list ->
  ?not_device_types:device_type_list ->
  ?device_models:device_model_list ->
  ?not_device_models:device_model_list ->
  ?device_operating_systems:device_operating_system_list ->
  ?not_device_operating_systems:device_operating_system_list ->
  ?device_user_agents:device_user_agent_list ->
  ?not_device_user_agents:device_user_agent_list ->
  organization_id:organization_id ->
  name:mobile_device_access_rule_name ->
  effect_:mobile_device_access_rule_effect ->
  unit ->
  create_mobile_device_access_rule_request

val make_create_organization_response :
  ?organization_id:organization_id -> unit -> create_organization_response

val make_domain : ?hosted_zone_id:hosted_zone_id -> domain_name:domain_name -> unit -> domain

val make_create_organization_request :
  ?directory_id:directory_id ->
  ?client_token:idempotency_client_token ->
  ?domains:domains ->
  ?kms_key_arn:kms_key_arn ->
  ?enable_interoperability:boolean_ ->
  alias:organization_name ->
  unit ->
  create_organization_request

val make_create_resource_response : ?resource_id:resource_id -> unit -> create_resource_response

val make_create_resource_request :
  ?description:resource_description ->
  ?hidden_from_global_address_list:boolean_ ->
  organization_id:organization_id ->
  name:resource_name ->
  type_:resource_type ->
  unit ->
  create_resource_request

val make_create_user_response : ?user_id:work_mail_identifier -> unit -> create_user_response

val make_create_user_request :
  ?password:password ->
  ?role:user_role ->
  ?first_name:user_attribute ->
  ?last_name:user_attribute ->
  ?hidden_from_global_address_list:boolean_ ->
  ?identity_provider_user_id:identity_provider_user_id ->
  organization_id:organization_id ->
  name:user_name ->
  display_name:user_attribute ->
  unit ->
  create_user_request

val make_delegate : id:string_ -> type_:member_type -> unit -> delegate
val make_delete_access_control_rule_response : unit -> unit

val make_delete_access_control_rule_request :
  organization_id:organization_id ->
  name:access_control_rule_name ->
  unit ->
  delete_access_control_rule_request

val make_delete_alias_response : unit -> unit

val make_delete_alias_request :
  organization_id:organization_id ->
  entity_id:work_mail_identifier ->
  alias:email_address ->
  unit ->
  delete_alias_request

val make_delete_availability_configuration_response : unit -> unit

val make_delete_availability_configuration_request :
  organization_id:organization_id ->
  domain_name:domain_name ->
  unit ->
  delete_availability_configuration_request

val make_delete_email_monitoring_configuration_response : unit -> unit

val make_delete_email_monitoring_configuration_request :
  organization_id:organization_id -> unit -> delete_email_monitoring_configuration_request

val make_delete_group_response : unit -> unit

val make_delete_group_request :
  organization_id:organization_id -> group_id:entity_identifier -> unit -> delete_group_request

val make_delete_identity_center_application_response : unit -> unit

val make_delete_identity_center_application_request :
  application_arn:application_arn -> unit -> delete_identity_center_application_request

val make_delete_identity_provider_configuration_response : unit -> unit

val make_delete_identity_provider_configuration_request :
  organization_id:organization_id -> unit -> delete_identity_provider_configuration_request

val make_delete_impersonation_role_response : unit -> unit

val make_delete_impersonation_role_request :
  organization_id:organization_id ->
  impersonation_role_id:impersonation_role_id ->
  unit ->
  delete_impersonation_role_request

val make_delete_mailbox_permissions_response : unit -> unit

val make_delete_mailbox_permissions_request :
  organization_id:organization_id ->
  entity_id:entity_identifier ->
  grantee_id:entity_identifier ->
  unit ->
  delete_mailbox_permissions_request

val make_delete_mobile_device_access_override_response : unit -> unit

val make_delete_mobile_device_access_override_request :
  organization_id:organization_id ->
  user_id:entity_identifier ->
  device_id:device_id ->
  unit ->
  delete_mobile_device_access_override_request

val make_delete_mobile_device_access_rule_response : unit -> unit

val make_delete_mobile_device_access_rule_request :
  organization_id:organization_id ->
  mobile_device_access_rule_id:mobile_device_access_rule_id ->
  unit ->
  delete_mobile_device_access_rule_request

val make_delete_organization_response :
  ?organization_id:organization_id -> ?state:string_ -> unit -> delete_organization_response

val make_delete_organization_request :
  ?client_token:idempotency_client_token ->
  ?force_delete:boolean_ ->
  ?delete_identity_center_application:boolean_ ->
  organization_id:organization_id ->
  delete_directory:boolean_ ->
  unit ->
  delete_organization_request

val make_delete_personal_access_token_response : unit -> unit

val make_delete_personal_access_token_request :
  organization_id:organization_id ->
  personal_access_token_id:personal_access_token_id ->
  unit ->
  delete_personal_access_token_request

val make_delete_resource_response : unit -> unit

val make_delete_resource_request :
  organization_id:organization_id ->
  resource_id:entity_identifier ->
  unit ->
  delete_resource_request

val make_delete_retention_policy_response : unit -> unit

val make_delete_retention_policy_request :
  organization_id:organization_id -> id:short_string -> unit -> delete_retention_policy_request

val make_delete_user_response : unit -> unit

val make_delete_user_request :
  organization_id:organization_id -> user_id:entity_identifier -> unit -> delete_user_request

val make_deregister_from_work_mail_response : unit -> unit

val make_deregister_from_work_mail_request :
  organization_id:organization_id ->
  entity_id:entity_identifier ->
  unit ->
  deregister_from_work_mail_request

val make_deregister_mail_domain_response : unit -> unit

val make_deregister_mail_domain_request :
  organization_id:organization_id ->
  domain_name:work_mail_domain_name ->
  unit ->
  deregister_mail_domain_request

val make_describe_email_monitoring_configuration_response :
  ?role_arn:role_arn ->
  ?log_group_arn:log_group_arn ->
  unit ->
  describe_email_monitoring_configuration_response

val make_describe_email_monitoring_configuration_request :
  organization_id:organization_id -> unit -> describe_email_monitoring_configuration_request

val make_describe_entity_response :
  ?entity_id:work_mail_identifier ->
  ?name:string_ ->
  ?type_:entity_type ->
  unit ->
  describe_entity_response

val make_describe_entity_request :
  organization_id:organization_id -> email:email_address -> unit -> describe_entity_request

val make_describe_group_response :
  ?group_id:work_mail_identifier ->
  ?name:group_name ->
  ?email:email_address ->
  ?state:entity_state ->
  ?enabled_date:timestamp ->
  ?disabled_date:timestamp ->
  ?hidden_from_global_address_list:boolean_ ->
  unit ->
  describe_group_response

val make_describe_group_request :
  organization_id:organization_id -> group_id:entity_identifier -> unit -> describe_group_request

val make_personal_access_token_configuration :
  ?lifetime_in_days:personal_access_token_lifetime_in_days ->
  status:personal_access_token_configuration_status ->
  unit ->
  personal_access_token_configuration

val make_identity_center_configuration :
  instance_arn:instance_arn ->
  application_arn:application_arn ->
  unit ->
  identity_center_configuration

val make_describe_identity_provider_configuration_response :
  ?authentication_mode:identity_provider_authentication_mode ->
  ?identity_center_configuration:identity_center_configuration ->
  ?personal_access_token_configuration:personal_access_token_configuration ->
  unit ->
  describe_identity_provider_configuration_response

val make_describe_identity_provider_configuration_request :
  organization_id:organization_id -> unit -> describe_identity_provider_configuration_request

val make_describe_inbound_dmarc_settings_response :
  ?enforced:boolean_ -> unit -> describe_inbound_dmarc_settings_response

val make_describe_inbound_dmarc_settings_request :
  organization_id:organization_id -> unit -> describe_inbound_dmarc_settings_request

val make_describe_mailbox_export_job_response :
  ?entity_id:work_mail_identifier ->
  ?description:description ->
  ?role_arn:role_arn ->
  ?kms_key_arn:kms_key_arn ->
  ?s3_bucket_name:s3_bucket_name ->
  ?s3_prefix:s3_object_key ->
  ?s3_path:s3_object_key ->
  ?estimated_progress:percentage ->
  ?state:mailbox_export_job_state ->
  ?error_info:mailbox_export_error_info ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  unit ->
  describe_mailbox_export_job_response

val make_describe_mailbox_export_job_request :
  job_id:mailbox_export_job_id ->
  organization_id:organization_id ->
  unit ->
  describe_mailbox_export_job_request

val make_describe_organization_response :
  ?organization_id:organization_id ->
  ?alias:organization_name ->
  ?state:string_ ->
  ?directory_id:string_ ->
  ?directory_type:string_ ->
  ?default_mail_domain:string_ ->
  ?completed_date:timestamp ->
  ?error_message:string_ ->
  ?ar_n:amazon_resource_name ->
  ?migration_admin:work_mail_identifier ->
  ?interoperability_enabled:boolean_ ->
  unit ->
  describe_organization_response

val make_describe_organization_request :
  organization_id:organization_id -> unit -> describe_organization_request

val make_describe_resource_response :
  ?resource_id:resource_id ->
  ?email:email_address ->
  ?name:resource_name ->
  ?type_:resource_type ->
  ?booking_options:booking_options ->
  ?state:entity_state ->
  ?enabled_date:timestamp ->
  ?disabled_date:timestamp ->
  ?description:resource_description ->
  ?hidden_from_global_address_list:boolean_ ->
  unit ->
  describe_resource_response

val make_describe_resource_request :
  organization_id:organization_id ->
  resource_id:entity_identifier ->
  unit ->
  describe_resource_request

val make_describe_user_response :
  ?user_id:work_mail_identifier ->
  ?name:user_name ->
  ?email:email_address ->
  ?display_name:user_attribute ->
  ?state:entity_state ->
  ?user_role:user_role ->
  ?enabled_date:timestamp ->
  ?disabled_date:timestamp ->
  ?mailbox_provisioned_date:timestamp ->
  ?mailbox_deprovisioned_date:timestamp ->
  ?first_name:user_attribute ->
  ?last_name:user_attribute ->
  ?hidden_from_global_address_list:boolean_ ->
  ?initials:user_attribute ->
  ?telephone:user_attribute ->
  ?street:user_attribute ->
  ?job_title:user_attribute ->
  ?city:user_attribute ->
  ?company:user_attribute ->
  ?zip_code:user_attribute ->
  ?department:user_attribute ->
  ?country:user_attribute ->
  ?office:user_attribute ->
  ?identity_provider_user_id:identity_provider_user_id ->
  ?identity_provider_identity_store_id:identity_provider_identity_store_id ->
  unit ->
  describe_user_response

val make_describe_user_request :
  organization_id:organization_id -> user_id:entity_identifier -> unit -> describe_user_request

val make_disassociate_delegate_from_resource_response : unit -> unit

val make_disassociate_delegate_from_resource_request :
  organization_id:organization_id ->
  resource_id:entity_identifier ->
  entity_id:entity_identifier ->
  unit ->
  disassociate_delegate_from_resource_request

val make_disassociate_member_from_group_response : unit -> unit

val make_disassociate_member_from_group_request :
  organization_id:organization_id ->
  group_id:entity_identifier ->
  member_id:entity_identifier ->
  unit ->
  disassociate_member_from_group_request

val make_dns_record : ?type_:string_ -> ?hostname:string_ -> ?value:string_ -> unit -> dns_record

val make_folder_configuration :
  ?period:retention_period ->
  name:folder_name ->
  action:retention_action ->
  unit ->
  folder_configuration

val make_get_access_control_effect_response :
  ?effect_:access_control_rule_effect ->
  ?matched_rules:access_control_rule_name_list ->
  unit ->
  get_access_control_effect_response

val make_get_access_control_effect_request :
  ?user_id:work_mail_identifier ->
  ?impersonation_role_id:impersonation_role_id ->
  organization_id:organization_id ->
  ip_address:ip_address ->
  action:access_control_rule_action ->
  unit ->
  get_access_control_effect_request

val make_get_default_retention_policy_response :
  ?id:short_string ->
  ?name:short_string ->
  ?description:string_ ->
  ?folder_configurations:folder_configurations ->
  unit ->
  get_default_retention_policy_response

val make_get_default_retention_policy_request :
  organization_id:organization_id -> unit -> get_default_retention_policy_request

val make_get_impersonation_role_response :
  ?impersonation_role_id:impersonation_role_id ->
  ?name:impersonation_role_name ->
  ?type_:impersonation_role_type ->
  ?description:impersonation_role_description ->
  ?rules:impersonation_rule_list ->
  ?date_created:timestamp ->
  ?date_modified:timestamp ->
  unit ->
  get_impersonation_role_response

val make_get_impersonation_role_request :
  organization_id:organization_id ->
  impersonation_role_id:impersonation_role_id ->
  unit ->
  get_impersonation_role_request

val make_impersonation_matched_rule :
  ?impersonation_rule_id:impersonation_rule_id ->
  ?name:impersonation_rule_name ->
  unit ->
  impersonation_matched_rule

val make_get_impersonation_role_effect_response :
  ?type_:impersonation_role_type ->
  ?effect_:access_effect ->
  ?matched_rules:impersonation_matched_rule_list ->
  unit ->
  get_impersonation_role_effect_response

val make_get_impersonation_role_effect_request :
  organization_id:organization_id ->
  impersonation_role_id:impersonation_role_id ->
  target_user:entity_identifier ->
  unit ->
  get_impersonation_role_effect_request

val make_get_mail_domain_response :
  ?records:dns_records ->
  ?is_test_domain:boolean_ ->
  ?is_default:boolean_ ->
  ?ownership_verification_status:dns_record_verification_status ->
  ?dkim_verification_status:dns_record_verification_status ->
  unit ->
  get_mail_domain_response

val make_get_mail_domain_request :
  organization_id:organization_id ->
  domain_name:work_mail_domain_name ->
  unit ->
  get_mail_domain_request

val make_get_mailbox_details_response :
  ?mailbox_quota:mailbox_quota -> ?mailbox_size:mailbox_size -> unit -> get_mailbox_details_response

val make_get_mailbox_details_request :
  organization_id:organization_id ->
  user_id:entity_identifier ->
  unit ->
  get_mailbox_details_request

val make_mobile_device_access_matched_rule :
  ?mobile_device_access_rule_id:mobile_device_access_rule_id ->
  ?name:mobile_device_access_rule_name ->
  unit ->
  mobile_device_access_matched_rule

val make_get_mobile_device_access_effect_response :
  ?effect_:mobile_device_access_rule_effect ->
  ?matched_rules:mobile_device_access_matched_rule_list ->
  unit ->
  get_mobile_device_access_effect_response

val make_get_mobile_device_access_effect_request :
  ?device_type:device_type ->
  ?device_model:device_model ->
  ?device_operating_system:device_operating_system ->
  ?device_user_agent:device_user_agent ->
  organization_id:organization_id ->
  unit ->
  get_mobile_device_access_effect_request

val make_get_mobile_device_access_override_response :
  ?user_id:work_mail_identifier ->
  ?device_id:device_id ->
  ?effect_:mobile_device_access_rule_effect ->
  ?description:mobile_device_access_rule_description ->
  ?date_created:timestamp ->
  ?date_modified:timestamp ->
  unit ->
  get_mobile_device_access_override_response

val make_get_mobile_device_access_override_request :
  organization_id:organization_id ->
  user_id:entity_identifier ->
  device_id:device_id ->
  unit ->
  get_mobile_device_access_override_request

val make_get_personal_access_token_metadata_response :
  ?personal_access_token_id:personal_access_token_id ->
  ?user_id:work_mail_identifier ->
  ?name:personal_access_token_name ->
  ?date_created:timestamp ->
  ?date_last_used:timestamp ->
  ?expires_time:timestamp ->
  ?scopes:personal_access_token_scope_list ->
  unit ->
  get_personal_access_token_metadata_response

val make_get_personal_access_token_metadata_request :
  organization_id:organization_id ->
  personal_access_token_id:personal_access_token_id ->
  unit ->
  get_personal_access_token_metadata_request

val make_group :
  ?id:work_mail_identifier ->
  ?email:email_address ->
  ?name:group_name ->
  ?state:entity_state ->
  ?enabled_date:timestamp ->
  ?disabled_date:timestamp ->
  unit ->
  group

val make_group_identifier :
  ?group_id:work_mail_identifier -> ?group_name:group_name -> unit -> group_identifier

val make_impersonation_role :
  ?impersonation_role_id:impersonation_role_id ->
  ?name:impersonation_role_name ->
  ?type_:impersonation_role_type ->
  ?date_created:timestamp ->
  ?date_modified:timestamp ->
  unit ->
  impersonation_role

val make_mailbox_export_job :
  ?job_id:mailbox_export_job_id ->
  ?entity_id:work_mail_identifier ->
  ?description:description ->
  ?s3_bucket_name:s3_bucket_name ->
  ?s3_path:s3_object_key ->
  ?estimated_progress:percentage ->
  ?state:mailbox_export_job_state ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  unit ->
  mailbox_export_job

val make_list_access_control_rules_response :
  ?rules:access_control_rules_list -> unit -> list_access_control_rules_response

val make_list_access_control_rules_request :
  organization_id:organization_id -> unit -> list_access_control_rules_request

val make_list_aliases_response :
  ?aliases:aliases -> ?next_token:next_token -> unit -> list_aliases_response

val make_list_aliases_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  entity_id:work_mail_identifier ->
  unit ->
  list_aliases_request

val make_list_availability_configurations_response :
  ?availability_configurations:availability_configuration_list ->
  ?next_token:next_token ->
  unit ->
  list_availability_configurations_response

val make_list_availability_configurations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  organization_id:organization_id ->
  unit ->
  list_availability_configurations_request

val make_member :
  ?id:string_ ->
  ?name:string_ ->
  ?type_:member_type ->
  ?state:entity_state ->
  ?enabled_date:timestamp ->
  ?disabled_date:timestamp ->
  unit ->
  member

val make_list_group_members_response :
  ?members:members -> ?next_token:next_token -> unit -> list_group_members_response

val make_list_group_members_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  group_id:entity_identifier ->
  unit ->
  list_group_members_request

val make_list_groups_response :
  ?groups:groups -> ?next_token:next_token -> unit -> list_groups_response

val make_list_groups_filters :
  ?name_prefix:string_ ->
  ?primary_email_prefix:string_ ->
  ?state:entity_state ->
  unit ->
  list_groups_filters

val make_list_groups_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:list_groups_filters ->
  organization_id:organization_id ->
  unit ->
  list_groups_request

val make_list_groups_for_entity_response :
  ?groups:group_identifiers -> ?next_token:next_token -> unit -> list_groups_for_entity_response

val make_list_groups_for_entity_filters :
  ?group_name_prefix:string_ -> unit -> list_groups_for_entity_filters

val make_list_groups_for_entity_request :
  ?filters:list_groups_for_entity_filters ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  entity_id:entity_identifier ->
  unit ->
  list_groups_for_entity_request

val make_list_impersonation_roles_response :
  ?roles:impersonation_role_list ->
  ?next_token:next_token ->
  unit ->
  list_impersonation_roles_response

val make_list_impersonation_roles_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  unit ->
  list_impersonation_roles_request

val make_mail_domain_summary :
  ?domain_name:domain_name -> ?default_domain:boolean_ -> unit -> mail_domain_summary

val make_list_mail_domains_response :
  ?mail_domains:mail_domains -> ?next_token:next_token -> unit -> list_mail_domains_response

val make_list_mail_domains_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  organization_id:organization_id ->
  unit ->
  list_mail_domains_request

val make_list_mailbox_export_jobs_response :
  ?jobs:jobs -> ?next_token:next_token -> unit -> list_mailbox_export_jobs_response

val make_list_mailbox_export_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  unit ->
  list_mailbox_export_jobs_request

val make_permission :
  grantee_id:work_mail_identifier ->
  grantee_type:member_type ->
  permission_values:permission_values ->
  unit ->
  permission

val make_list_mailbox_permissions_response :
  ?permissions:permissions -> ?next_token:next_token -> unit -> list_mailbox_permissions_response

val make_list_mailbox_permissions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  entity_id:entity_identifier ->
  unit ->
  list_mailbox_permissions_request

val make_mobile_device_access_override :
  ?user_id:work_mail_identifier ->
  ?device_id:device_id ->
  ?effect_:mobile_device_access_rule_effect ->
  ?description:mobile_device_access_rule_description ->
  ?date_created:timestamp ->
  ?date_modified:timestamp ->
  unit ->
  mobile_device_access_override

val make_list_mobile_device_access_overrides_response :
  ?overrides:mobile_device_access_overrides_list ->
  ?next_token:next_token ->
  unit ->
  list_mobile_device_access_overrides_response

val make_list_mobile_device_access_overrides_request :
  ?user_id:entity_identifier ->
  ?device_id:device_id ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  unit ->
  list_mobile_device_access_overrides_request

val make_mobile_device_access_rule :
  ?mobile_device_access_rule_id:mobile_device_access_rule_id ->
  ?name:mobile_device_access_rule_name ->
  ?description:mobile_device_access_rule_description ->
  ?effect_:mobile_device_access_rule_effect ->
  ?device_types:device_type_list ->
  ?not_device_types:device_type_list ->
  ?device_models:device_model_list ->
  ?not_device_models:device_model_list ->
  ?device_operating_systems:device_operating_system_list ->
  ?not_device_operating_systems:device_operating_system_list ->
  ?device_user_agents:device_user_agent_list ->
  ?not_device_user_agents:device_user_agent_list ->
  ?date_created:timestamp ->
  ?date_modified:timestamp ->
  unit ->
  mobile_device_access_rule

val make_list_mobile_device_access_rules_response :
  ?rules:mobile_device_access_rules_list -> unit -> list_mobile_device_access_rules_response

val make_list_mobile_device_access_rules_request :
  organization_id:organization_id -> unit -> list_mobile_device_access_rules_request

val make_organization_summary :
  ?organization_id:organization_id ->
  ?alias:organization_name ->
  ?default_mail_domain:domain_name ->
  ?error_message:string_ ->
  ?state:string_ ->
  unit ->
  organization_summary

val make_list_organizations_response :
  ?organization_summaries:organization_summaries ->
  ?next_token:next_token ->
  unit ->
  list_organizations_response

val make_list_organizations_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_organizations_request

val make_personal_access_token_summary :
  ?personal_access_token_id:personal_access_token_id ->
  ?user_id:work_mail_identifier ->
  ?name:personal_access_token_name ->
  ?date_created:timestamp ->
  ?date_last_used:timestamp ->
  ?expires_time:timestamp ->
  ?scopes:personal_access_token_scope_list ->
  unit ->
  personal_access_token_summary

val make_list_personal_access_tokens_response :
  ?next_token:next_token ->
  ?personal_access_token_summaries:personal_access_token_summary_list ->
  unit ->
  list_personal_access_tokens_response

val make_list_personal_access_tokens_request :
  ?user_id:entity_identifier ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  unit ->
  list_personal_access_tokens_request

val make_list_resource_delegates_response :
  ?delegates:resource_delegates ->
  ?next_token:next_token ->
  unit ->
  list_resource_delegates_response

val make_list_resource_delegates_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  organization_id:organization_id ->
  resource_id:entity_identifier ->
  unit ->
  list_resource_delegates_request

val make_resource :
  ?id:work_mail_identifier ->
  ?email:email_address ->
  ?name:resource_name ->
  ?type_:resource_type ->
  ?state:entity_state ->
  ?enabled_date:timestamp ->
  ?disabled_date:timestamp ->
  ?description:resource_description ->
  unit ->
  resource

val make_list_resources_response :
  ?resources:resources -> ?next_token:next_token -> unit -> list_resources_response

val make_list_resources_filters :
  ?name_prefix:string_ ->
  ?primary_email_prefix:string_ ->
  ?state:entity_state ->
  unit ->
  list_resources_filters

val make_list_resources_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:list_resources_filters ->
  organization_id:organization_id ->
  unit ->
  list_resources_request

val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_user :
  ?id:work_mail_identifier ->
  ?email:email_address ->
  ?name:user_name ->
  ?display_name:string_ ->
  ?state:entity_state ->
  ?user_role:user_role ->
  ?enabled_date:timestamp ->
  ?disabled_date:timestamp ->
  ?identity_provider_user_id:identity_provider_user_id ->
  ?identity_provider_identity_store_id:identity_provider_identity_store_id ->
  unit ->
  user

val make_list_users_response : ?users:users -> ?next_token:next_token -> unit -> list_users_response

val make_list_users_filters :
  ?username_prefix:string_ ->
  ?display_name_prefix:user_attribute ->
  ?primary_email_prefix:string_ ->
  ?state:entity_state ->
  ?identity_provider_user_id_prefix:identity_provider_user_id_prefix ->
  unit ->
  list_users_filters

val make_list_users_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:list_users_filters ->
  organization_id:organization_id ->
  unit ->
  list_users_request

val make_put_access_control_rule_response : unit -> unit

val make_put_access_control_rule_request :
  ?ip_ranges:ip_range_list ->
  ?not_ip_ranges:ip_range_list ->
  ?actions:actions_list ->
  ?not_actions:actions_list ->
  ?user_ids:user_id_list ->
  ?not_user_ids:user_id_list ->
  ?impersonation_role_ids:impersonation_role_id_list ->
  ?not_impersonation_role_ids:impersonation_role_id_list ->
  name:access_control_rule_name ->
  effect_:access_control_rule_effect ->
  description:access_control_rule_description ->
  organization_id:organization_id ->
  unit ->
  put_access_control_rule_request

val make_put_email_monitoring_configuration_response : unit -> unit

val make_put_email_monitoring_configuration_request :
  ?role_arn:role_arn ->
  organization_id:organization_id ->
  log_group_arn:log_group_arn ->
  unit ->
  put_email_monitoring_configuration_request

val make_put_identity_provider_configuration_response : unit -> unit

val make_put_identity_provider_configuration_request :
  organization_id:organization_id ->
  authentication_mode:identity_provider_authentication_mode ->
  identity_center_configuration:identity_center_configuration ->
  personal_access_token_configuration:personal_access_token_configuration ->
  unit ->
  put_identity_provider_configuration_request

val make_put_inbound_dmarc_settings_response : unit -> unit

val make_put_inbound_dmarc_settings_request :
  organization_id:organization_id ->
  enforced:boolean_object ->
  unit ->
  put_inbound_dmarc_settings_request

val make_put_mailbox_permissions_response : unit -> unit

val make_put_mailbox_permissions_request :
  organization_id:organization_id ->
  entity_id:entity_identifier ->
  grantee_id:entity_identifier ->
  permission_values:permission_values ->
  unit ->
  put_mailbox_permissions_request

val make_put_mobile_device_access_override_response : unit -> unit

val make_put_mobile_device_access_override_request :
  ?description:mobile_device_access_rule_description ->
  organization_id:organization_id ->
  user_id:entity_identifier ->
  device_id:device_id ->
  effect_:mobile_device_access_rule_effect ->
  unit ->
  put_mobile_device_access_override_request

val make_put_retention_policy_response : unit -> unit

val make_put_retention_policy_request :
  ?id:short_string ->
  ?description:policy_description ->
  organization_id:organization_id ->
  name:short_string ->
  folder_configurations:folder_configurations ->
  unit ->
  put_retention_policy_request

val make_register_mail_domain_response : unit -> unit

val make_register_mail_domain_request :
  ?client_token:idempotency_client_token ->
  organization_id:organization_id ->
  domain_name:work_mail_domain_name ->
  unit ->
  register_mail_domain_request

val make_register_to_work_mail_response : unit -> unit

val make_register_to_work_mail_request :
  organization_id:organization_id ->
  entity_id:entity_identifier ->
  email:email_address ->
  unit ->
  register_to_work_mail_request

val make_reset_password_response : unit -> unit

val make_reset_password_request :
  organization_id:organization_id ->
  user_id:work_mail_identifier ->
  password:password ->
  unit ->
  reset_password_request

val make_start_mailbox_export_job_response :
  ?job_id:mailbox_export_job_id -> unit -> start_mailbox_export_job_response

val make_start_mailbox_export_job_request :
  ?description:description ->
  client_token:idempotency_client_token ->
  organization_id:organization_id ->
  entity_id:entity_identifier ->
  role_arn:role_arn ->
  kms_key_arn:kms_key_arn ->
  s3_bucket_name:s3_bucket_name ->
  s3_prefix:s3_object_key ->
  unit ->
  start_mailbox_export_job_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_test_availability_configuration_response :
  ?test_passed:boolean_ ->
  ?failure_reason:string_ ->
  unit ->
  test_availability_configuration_response

val make_test_availability_configuration_request :
  ?domain_name:domain_name ->
  ?ews_provider:ews_availability_provider ->
  ?lambda_provider:lambda_availability_provider ->
  organization_id:organization_id ->
  unit ->
  test_availability_configuration_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_update_availability_configuration_response : unit -> unit

val make_update_availability_configuration_request :
  ?ews_provider:ews_availability_provider ->
  ?lambda_provider:lambda_availability_provider ->
  organization_id:organization_id ->
  domain_name:domain_name ->
  unit ->
  update_availability_configuration_request

val make_update_default_mail_domain_response : unit -> unit

val make_update_default_mail_domain_request :
  organization_id:organization_id ->
  domain_name:work_mail_domain_name ->
  unit ->
  update_default_mail_domain_request

val make_update_group_response : unit -> unit

val make_update_group_request :
  ?hidden_from_global_address_list:boolean_object ->
  organization_id:organization_id ->
  group_id:entity_identifier ->
  unit ->
  update_group_request

val make_update_impersonation_role_response : unit -> unit

val make_update_impersonation_role_request :
  ?description:impersonation_role_description ->
  organization_id:organization_id ->
  impersonation_role_id:impersonation_role_id ->
  name:impersonation_role_name ->
  type_:impersonation_role_type ->
  rules:impersonation_rule_list ->
  unit ->
  update_impersonation_role_request

val make_update_mailbox_quota_response : unit -> unit

val make_update_mailbox_quota_request :
  organization_id:organization_id ->
  user_id:entity_identifier ->
  mailbox_quota:mailbox_quota ->
  unit ->
  update_mailbox_quota_request

val make_update_mobile_device_access_rule_response : unit -> unit

val make_update_mobile_device_access_rule_request :
  ?description:mobile_device_access_rule_description ->
  ?device_types:device_type_list ->
  ?not_device_types:device_type_list ->
  ?device_models:device_model_list ->
  ?not_device_models:device_model_list ->
  ?device_operating_systems:device_operating_system_list ->
  ?not_device_operating_systems:device_operating_system_list ->
  ?device_user_agents:device_user_agent_list ->
  ?not_device_user_agents:device_user_agent_list ->
  organization_id:organization_id ->
  mobile_device_access_rule_id:mobile_device_access_rule_id ->
  name:mobile_device_access_rule_name ->
  effect_:mobile_device_access_rule_effect ->
  unit ->
  update_mobile_device_access_rule_request

val make_update_primary_email_address_response : unit -> unit

val make_update_primary_email_address_request :
  organization_id:organization_id ->
  entity_id:entity_identifier ->
  email:email_address ->
  unit ->
  update_primary_email_address_request

val make_update_resource_response : unit -> unit

val make_update_resource_request :
  ?name:resource_name ->
  ?booking_options:booking_options ->
  ?description:new_resource_description ->
  ?type_:resource_type ->
  ?hidden_from_global_address_list:boolean_object ->
  organization_id:organization_id ->
  resource_id:entity_identifier ->
  unit ->
  update_resource_request

val make_update_user_response : unit -> unit

val make_update_user_request :
  ?role:user_role ->
  ?display_name:user_attribute ->
  ?first_name:user_attribute ->
  ?last_name:user_attribute ->
  ?hidden_from_global_address_list:boolean_object ->
  ?initials:user_attribute ->
  ?telephone:user_attribute ->
  ?street:user_attribute ->
  ?job_title:user_attribute ->
  ?city:user_attribute ->
  ?company:user_attribute ->
  ?zip_code:user_attribute ->
  ?department:user_attribute ->
  ?country:user_attribute ->
  ?office:user_attribute ->
  ?identity_provider_user_id:identity_provider_user_id_for_update ->
  organization_id:organization_id ->
  user_id:entity_identifier ->
  unit ->
  update_user_request
