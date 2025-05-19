open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "workmail";
      endpointPrefix = "workmail";
      version = "2017-10-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec unsupported_operation_exception = {
  message: string option }[@@ocaml.doc
                            "You can't perform a write operation against a read-only directory.\n"]
type nonrec organization_state_exception = {
  message: string option }[@@ocaml.doc
                            "The organization must have a valid state to perform certain operations on the organization or its members.\n"]
type nonrec organization_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "An operation received a valid organization identifier that either doesn't belong or exist in the system.\n"]
type nonrec invalid_parameter_exception = {
  message: string option }[@@ocaml.doc
                            "One or more of the input parameters don't match the service's restrictions.\n"]
type nonrec entity_state_exception = {
  message: string option }[@@ocaml.doc
                            "You are performing an operation on a user, group, or resource that isn't in the expected state, such as trying to delete an active user.\n"]
type nonrec entity_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The identifier supplied for the user, group, or resource does not exist in your organization.\n"]
type nonrec directory_unavailable_exception = {
  message: string option }[@@ocaml.doc
                            "The directory is unavailable. It might be located in another Region or deleted.\n"]
type nonrec directory_service_authentication_failed_exception =
  {
  message: string option }[@@ocaml.doc
                            "The directory service doesn't recognize the credentials supplied by WorkMail.\n"]
type nonrec update_user_response = unit
type nonrec user_role =
  | REMOTE_USER 
  | SYSTEM_USER 
  | RESOURCE 
  | USER [@@ocaml.doc ""]
type nonrec update_user_request =
  {
  office: string option ;
  country: string option ;
  department: string option ;
  zip_code: string option ;
  company: string option ;
  city: string option ;
  job_title: string option ;
  street: string option ;
  telephone: string option ;
  initials: string option ;
  hidden_from_global_address_list: bool option ;
  last_name: string option ;
  first_name: string option ;
  display_name: string option ;
  role: user_role option ;
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec name_availability_exception = {
  message: string option }[@@ocaml.doc
                            "The user, group, or resource name isn't unique in WorkMail.\n"]
type nonrec mail_domain_state_exception = {
  message: string option }[@@ocaml.doc
                            "After a domain has been added to the organization, it must be verified. The domain is not yet verified.\n"]
type nonrec mail_domain_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The domain specified is not found in your organization.\n"]
type nonrec invalid_configuration_exception = {
  message: string option }[@@ocaml.doc
                            "The configuration for a resource isn't valid. A resource must either be able to auto-respond to requests or have at least one delegate associated that can do so on its behalf.\n"]
type nonrec email_address_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The email address that you're trying to assign is already created for a different user, group, or resource.\n"]
type nonrec update_resource_response = unit
type nonrec booking_options =
  {
  auto_decline_conflicting_requests: bool option ;
  auto_decline_recurring_requests: bool option ;
  auto_accept_requests: bool option }[@@ocaml.doc
                                       "At least one delegate must be associated to the resource to disable automatic replies from the resource.\n"]
type nonrec resource_type =
  | EQUIPMENT 
  | ROOM [@@ocaml.doc ""]
type nonrec update_resource_request =
  {
  hidden_from_global_address_list: bool option ;
  type_: resource_type option ;
  description: string option ;
  booking_options: booking_options option ;
  name: string option ;
  resource_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec update_primary_email_address_response = unit
type nonrec update_primary_email_address_request =
  {
  email: string ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec update_mobile_device_access_rule_response = unit
type nonrec mobile_device_access_rule_effect =
  | DENY 
  | ALLOW [@@ocaml.doc ""]
type nonrec update_mobile_device_access_rule_request =
  {
  not_device_user_agents: string list option ;
  device_user_agents: string list option ;
  not_device_operating_systems: string list option ;
  device_operating_systems: string list option ;
  not_device_models: string list option ;
  device_models: string list option ;
  not_device_types: string list option ;
  device_types: string list option ;
  effect_: mobile_device_access_rule_effect ;
  description: string option ;
  name: string ;
  mobile_device_access_rule_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec update_mailbox_quota_response = unit
type nonrec update_mailbox_quota_request =
  {
  mailbox_quota: int ;
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc "The resource cannot be found.\n"]
type nonrec limit_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The request exceeds the limit of the resource.\n"]
type nonrec update_impersonation_role_response = unit
type nonrec impersonation_role_type =
  | READ_ONLY 
  | FULL_ACCESS [@@ocaml.doc ""]
type nonrec access_effect =
  | DENY 
  | ALLOW [@@ocaml.doc ""]
type nonrec impersonation_rule =
  {
  not_target_users: string list option ;
  target_users: string list option ;
  effect_: access_effect ;
  description: string option ;
  name: string option ;
  impersonation_rule_id: string }[@@ocaml.doc
                                   "The rules for the given impersonation role.\n"]
type nonrec update_impersonation_role_request =
  {
  rules: impersonation_rule list ;
  description: string option ;
  type_: impersonation_role_type ;
  name: string ;
  impersonation_role_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec update_group_response = unit
type nonrec update_group_request =
  {
  hidden_from_global_address_list: bool option ;
  group_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec update_default_mail_domain_response = unit
type nonrec update_default_mail_domain_request =
  {
  domain_name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec update_availability_configuration_response = unit
type nonrec ews_availability_provider =
  {
  ews_password: string ;
  ews_username: string ;
  ews_endpoint: string }[@@ocaml.doc
                          "Describes an EWS based availability provider. This is only used as input to the service.\n"]
type nonrec lambda_availability_provider = {
  lambda_arn: string }[@@ocaml.doc
                        "Describes a Lambda based availability provider.\n"]
type nonrec update_availability_configuration_request =
  {
  lambda_provider: lambda_availability_provider option ;
  ews_provider: ews_availability_provider option ;
  domain_name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec test_availability_configuration_response =
  {
  failure_reason: string option ;
  test_passed: bool option }[@@ocaml.doc ""]
type nonrec test_availability_configuration_request =
  {
  lambda_provider: lambda_availability_provider option ;
  ews_provider: ews_availability_provider option ;
  domain_name: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec too_many_tags_exception = {
  message: string option }[@@ocaml.doc
                            "The resource can have up to 50 user-applied tags.\n"]
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc "Describes a tag applied to a resource.\n"]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec start_mailbox_export_job_response = {
  job_id: string option }[@@ocaml.doc ""]
type nonrec start_mailbox_export_job_request =
  {
  s3_prefix: string ;
  s3_bucket_name: string ;
  kms_key_arn: string ;
  role_arn: string ;
  description: string option ;
  entity_id: string ;
  organization_id: string ;
  client_token: string }[@@ocaml.doc ""]
type nonrec invalid_password_exception = {
  message: string option }[@@ocaml.doc
                            "The supplied password doesn't match the minimum security constraints, such as length or use of special characters.\n"]
type nonrec reset_password_response = unit
type nonrec reset_password_request =
  {
  password: string ;
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec entity_already_registered_exception = {
  message: string option }[@@ocaml.doc
                            "The user, group, or resource that you're trying to register is already registered.\n"]
type nonrec register_to_work_mail_response = unit
type nonrec register_to_work_mail_request =
  {
  email: string ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec mail_domain_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The domain you're trying to change is in use by another user or organization in your account. See the error message for details.\n"]
type nonrec register_mail_domain_response = unit
type nonrec register_mail_domain_request =
  {
  domain_name: string ;
  organization_id: string ;
  client_token: string option }[@@ocaml.doc ""]
type nonrec put_retention_policy_response = unit
type nonrec folder_name =
  | JUNK_EMAIL 
  | DRAFTS 
  | SENT_ITEMS 
  | DELETED_ITEMS 
  | INBOX [@@ocaml.doc ""]
type nonrec retention_action =
  | PERMANENTLY_DELETE 
  | DELETE 
  | NONE [@@ocaml.doc ""]
type nonrec folder_configuration =
  {
  period: int option ;
  action: retention_action ;
  name: folder_name }[@@ocaml.doc
                       "The configuration applied to an organization's folders by its retention policy.\n"]
type nonrec put_retention_policy_request =
  {
  folder_configurations: folder_configuration list ;
  description: string option ;
  name: string ;
  id: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec put_mobile_device_access_override_response = unit
type nonrec put_mobile_device_access_override_request =
  {
  description: string option ;
  effect_: mobile_device_access_rule_effect ;
  device_id: string ;
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec put_mailbox_permissions_response = unit
type nonrec permission_type =
  | SEND_ON_BEHALF 
  | SEND_AS 
  | FULL_ACCESS [@@ocaml.doc ""]
type nonrec put_mailbox_permissions_request =
  {
  permission_values: permission_type list ;
  grantee_id: string ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec put_inbound_dmarc_settings_response = unit
type nonrec put_inbound_dmarc_settings_request =
  {
  enforced: bool ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec put_email_monitoring_configuration_response = unit
type nonrec put_email_monitoring_configuration_request =
  {
  log_group_arn: string ;
  role_arn: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec put_access_control_rule_response = unit
type nonrec access_control_rule_effect =
  | DENY 
  | ALLOW [@@ocaml.doc ""]
type nonrec put_access_control_rule_request =
  {
  not_impersonation_role_ids: string list option ;
  impersonation_role_ids: string list option ;
  organization_id: string ;
  not_user_ids: string list option ;
  user_ids: string list option ;
  not_actions: string list option ;
  actions: string list option ;
  not_ip_ranges: string list option ;
  ip_ranges: string list option ;
  description: string ;
  effect_: access_control_rule_effect ;
  name: string }[@@ocaml.doc ""]
type nonrec entity_state =
  | DELETED 
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec user =
  {
  disabled_date: CoreTypes.Timestamp.t option ;
  enabled_date: CoreTypes.Timestamp.t option ;
  user_role: user_role option ;
  state: entity_state option ;
  display_name: string option ;
  name: string option ;
  email: string option ;
  id: string option }[@@ocaml.doc
                       "The representation of an WorkMail user.\n"]
type nonrec list_users_response =
  {
  next_token: string option ;
  users: user list option }[@@ocaml.doc ""]
type nonrec list_users_filters =
  {
  state: entity_state option ;
  primary_email_prefix: string option ;
  display_name_prefix: string option ;
  username_prefix: string option }[@@ocaml.doc
                                    " Filtering options for {i ListUsers} operation. This is only used as input to Operation.\n"]
type nonrec list_users_request =
  {
  filters: list_users_filters option ;
  max_results: int option ;
  next_token: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec resource =
  {
  description: string option ;
  disabled_date: CoreTypes.Timestamp.t option ;
  enabled_date: CoreTypes.Timestamp.t option ;
  state: entity_state option ;
  type_: resource_type option ;
  name: string option ;
  email: string option ;
  id: string option }[@@ocaml.doc "The representation of a resource.\n"]
type nonrec list_resources_response =
  {
  next_token: string option ;
  resources: resource list option }[@@ocaml.doc ""]
type nonrec list_resources_filters =
  {
  state: entity_state option ;
  primary_email_prefix: string option ;
  name_prefix: string option }[@@ocaml.doc
                                "Filtering options for {i ListResources} operation. This is only used as input to Operation.\n"]
type nonrec list_resources_request =
  {
  filters: list_resources_filters option ;
  max_results: int option ;
  next_token: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec member_type =
  | USER 
  | GROUP [@@ocaml.doc ""]
type nonrec delegate = {
  type_: member_type ;
  id: string }[@@ocaml.doc
                "The name of the attribute, which is one of the values defined in the UserAttribute enumeration.\n"]
type nonrec list_resource_delegates_response =
  {
  next_token: string option ;
  delegates: delegate list option }[@@ocaml.doc ""]
type nonrec list_resource_delegates_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec organization_summary =
  {
  state: string option ;
  error_message: string option ;
  default_mail_domain: string option ;
  alias: string option ;
  organization_id: string option }[@@ocaml.doc
                                    "The representation of an organization.\n"]
type nonrec list_organizations_response =
  {
  next_token: string option ;
  organization_summaries: organization_summary list option }[@@ocaml.doc ""]
type nonrec list_organizations_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec mobile_device_access_rule =
  {
  date_modified: CoreTypes.Timestamp.t option ;
  date_created: CoreTypes.Timestamp.t option ;
  not_device_user_agents: string list option ;
  device_user_agents: string list option ;
  not_device_operating_systems: string list option ;
  device_operating_systems: string list option ;
  not_device_models: string list option ;
  device_models: string list option ;
  not_device_types: string list option ;
  device_types: string list option ;
  effect_: mobile_device_access_rule_effect option ;
  description: string option ;
  name: string option ;
  mobile_device_access_rule_id: string option }[@@ocaml.doc
                                                 "A rule that controls access to mobile devices for an WorkMail group.\n"]
type nonrec list_mobile_device_access_rules_response =
  {
  rules: mobile_device_access_rule list option }[@@ocaml.doc ""]
type nonrec list_mobile_device_access_rules_request =
  {
  organization_id: string }[@@ocaml.doc ""]
type nonrec mobile_device_access_override =
  {
  date_modified: CoreTypes.Timestamp.t option ;
  date_created: CoreTypes.Timestamp.t option ;
  description: string option ;
  effect_: mobile_device_access_rule_effect option ;
  device_id: string option ;
  user_id: string option }[@@ocaml.doc "The override object.\n"]
type nonrec list_mobile_device_access_overrides_response =
  {
  next_token: string option ;
  overrides: mobile_device_access_override list option }[@@ocaml.doc ""]
type nonrec list_mobile_device_access_overrides_request =
  {
  max_results: int option ;
  next_token: string option ;
  device_id: string option ;
  user_id: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec mail_domain_summary =
  {
  default_domain: bool option ;
  domain_name: string option }[@@ocaml.doc "The data for a given domain.\n"]
type nonrec list_mail_domains_response =
  {
  next_token: string option ;
  mail_domains: mail_domain_summary list option }[@@ocaml.doc ""]
type nonrec list_mail_domains_request =
  {
  next_token: string option ;
  max_results: int option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec permission =
  {
  permission_values: permission_type list ;
  grantee_type: member_type ;
  grantee_id: string }[@@ocaml.doc
                        "Permission granted to a user, group, or resource to access a certain aspect of another user, group, or resource mailbox.\n"]
type nonrec list_mailbox_permissions_response =
  {
  next_token: string option ;
  permissions: permission list option }[@@ocaml.doc ""]
type nonrec list_mailbox_permissions_request =
  {
  max_results: int option ;
  next_token: string option ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec mailbox_export_job_state =
  | CANCELLED 
  | FAILED 
  | COMPLETED 
  | RUNNING [@@ocaml.doc ""]
type nonrec mailbox_export_job =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  state: mailbox_export_job_state option ;
  estimated_progress: int option ;
  s3_path: string option ;
  s3_bucket_name: string option ;
  description: string option ;
  entity_id: string option ;
  job_id: string option }[@@ocaml.doc
                           "The details of a mailbox export job, including the user or resource ID associated with the mailbox and the S3 bucket that the mailbox contents are exported to.\n"]
type nonrec list_mailbox_export_jobs_response =
  {
  next_token: string option ;
  jobs: mailbox_export_job list option }[@@ocaml.doc ""]
type nonrec list_mailbox_export_jobs_request =
  {
  max_results: int option ;
  next_token: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec impersonation_role =
  {
  date_modified: CoreTypes.Timestamp.t option ;
  date_created: CoreTypes.Timestamp.t option ;
  type_: impersonation_role_type option ;
  name: string option ;
  impersonation_role_id: string option }[@@ocaml.doc
                                          "An impersonation role for the given WorkMail organization.\n"]
type nonrec list_impersonation_roles_response =
  {
  next_token: string option ;
  roles: impersonation_role list option }[@@ocaml.doc ""]
type nonrec list_impersonation_roles_request =
  {
  max_results: int option ;
  next_token: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec group_identifier =
  {
  group_name: string option ;
  group_id: string option }[@@ocaml.doc
                             "The identifier that contains the Group ID and name of a group.\n"]
type nonrec list_groups_for_entity_response =
  {
  next_token: string option ;
  groups: group_identifier list option }[@@ocaml.doc ""]
type nonrec list_groups_for_entity_filters =
  {
  group_name_prefix: string option }[@@ocaml.doc
                                      " Filtering options for {i ListGroupsForEntity} operation. This is only used as input to Operation.\n"]
type nonrec list_groups_for_entity_request =
  {
  max_results: int option ;
  next_token: string option ;
  filters: list_groups_for_entity_filters option ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec group =
  {
  disabled_date: CoreTypes.Timestamp.t option ;
  enabled_date: CoreTypes.Timestamp.t option ;
  state: entity_state option ;
  name: string option ;
  email: string option ;
  id: string option }[@@ocaml.doc
                       "The representation of an WorkMail group.\n"]
type nonrec list_groups_response =
  {
  next_token: string option ;
  groups: group list option }[@@ocaml.doc ""]
type nonrec list_groups_filters =
  {
  state: entity_state option ;
  primary_email_prefix: string option ;
  name_prefix: string option }[@@ocaml.doc
                                " Filtering options for {i ListGroups} operation. This is only used as input to Operation.\n"]
type nonrec list_groups_request =
  {
  filters: list_groups_filters option ;
  max_results: int option ;
  next_token: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec member =
  {
  disabled_date: CoreTypes.Timestamp.t option ;
  enabled_date: CoreTypes.Timestamp.t option ;
  state: entity_state option ;
  type_: member_type option ;
  name: string option ;
  id: string option }[@@ocaml.doc "The representation of a user or group.\n"]
type nonrec list_group_members_response =
  {
  next_token: string option ;
  members: member list option }[@@ocaml.doc ""]
type nonrec list_group_members_request =
  {
  max_results: int option ;
  next_token: string option ;
  group_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec availability_provider_type =
  | LAMBDA 
  | EWS [@@ocaml.doc ""]
type nonrec redacted_ews_availability_provider =
  {
  ews_username: string option ;
  ews_endpoint: string option }[@@ocaml.doc
                                 "Describes an EWS based availability provider when returned from the service. It does not contain the password of the endpoint.\n"]
type nonrec availability_configuration =
  {
  date_modified: CoreTypes.Timestamp.t option ;
  date_created: CoreTypes.Timestamp.t option ;
  lambda_provider: lambda_availability_provider option ;
  ews_provider: redacted_ews_availability_provider option ;
  provider_type: availability_provider_type option ;
  domain_name: string option }[@@ocaml.doc
                                "List all the [AvailabilityConfiguration]'s for the given WorkMail organization.\n"]
type nonrec list_availability_configurations_response =
  {
  next_token: string option ;
  availability_configurations: availability_configuration list option }
[@@ocaml.doc ""]
type nonrec list_availability_configurations_request =
  {
  next_token: string option ;
  max_results: int option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec list_aliases_response =
  {
  next_token: string option ;
  aliases: string list option }[@@ocaml.doc ""]
type nonrec list_aliases_request =
  {
  max_results: int option ;
  next_token: string option ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec access_control_rule =
  {
  not_impersonation_role_ids: string list option ;
  impersonation_role_ids: string list option ;
  date_modified: CoreTypes.Timestamp.t option ;
  date_created: CoreTypes.Timestamp.t option ;
  not_user_ids: string list option ;
  user_ids: string list option ;
  not_actions: string list option ;
  actions: string list option ;
  not_ip_ranges: string list option ;
  ip_ranges: string list option ;
  description: string option ;
  effect_: access_control_rule_effect option ;
  name: string option }[@@ocaml.doc
                         "A rule that controls access to an WorkMail organization.\n"]
type nonrec list_access_control_rules_response =
  {
  rules: access_control_rule list option }[@@ocaml.doc ""]
type nonrec list_access_control_rules_request = {
  organization_id: string }[@@ocaml.doc ""]
type nonrec get_mobile_device_access_override_response =
  {
  date_modified: CoreTypes.Timestamp.t option ;
  date_created: CoreTypes.Timestamp.t option ;
  description: string option ;
  effect_: mobile_device_access_rule_effect option ;
  device_id: string option ;
  user_id: string option }[@@ocaml.doc ""]
type nonrec get_mobile_device_access_override_request =
  {
  device_id: string ;
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec mobile_device_access_matched_rule =
  {
  name: string option ;
  mobile_device_access_rule_id: string option }[@@ocaml.doc
                                                 "The rule that a simulated user matches.\n"]
type nonrec get_mobile_device_access_effect_response =
  {
  matched_rules: mobile_device_access_matched_rule list option ;
  effect_: mobile_device_access_rule_effect option }[@@ocaml.doc ""]
type nonrec get_mobile_device_access_effect_request =
  {
  device_user_agent: string option ;
  device_operating_system: string option ;
  device_model: string option ;
  device_type: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec dns_record =
  {
  value: string option ;
  hostname: string option ;
  type_: string option }[@@ocaml.doc
                          "A DNS record uploaded to your DNS provider.\n"]
type nonrec dns_record_verification_status =
  | FAILED 
  | VERIFIED 
  | PENDING [@@ocaml.doc ""]
type nonrec get_mail_domain_response =
  {
  dkim_verification_status: dns_record_verification_status option ;
  ownership_verification_status: dns_record_verification_status option ;
  is_default: bool option ;
  is_test_domain: bool option ;
  records: dns_record list option }[@@ocaml.doc ""]
type nonrec get_mail_domain_request =
  {
  domain_name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec get_mailbox_details_response =
  {
  mailbox_size: float option ;
  mailbox_quota: int option }[@@ocaml.doc ""]
type nonrec get_mailbox_details_request =
  {
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec impersonation_matched_rule =
  {
  name: string option ;
  impersonation_rule_id: string option }[@@ocaml.doc
                                          "The impersonation rule that matched the input.\n"]
type nonrec get_impersonation_role_effect_response =
  {
  matched_rules: impersonation_matched_rule list option ;
  effect_: access_effect option ;
  type_: impersonation_role_type option }[@@ocaml.doc ""]
type nonrec get_impersonation_role_effect_request =
  {
  target_user: string ;
  impersonation_role_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec get_impersonation_role_response =
  {
  date_modified: CoreTypes.Timestamp.t option ;
  date_created: CoreTypes.Timestamp.t option ;
  rules: impersonation_rule list option ;
  description: string option ;
  type_: impersonation_role_type option ;
  name: string option ;
  impersonation_role_id: string option }[@@ocaml.doc ""]
type nonrec get_impersonation_role_request =
  {
  impersonation_role_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec get_default_retention_policy_response =
  {
  folder_configurations: folder_configuration list option ;
  description: string option ;
  name: string option ;
  id: string option }[@@ocaml.doc ""]
type nonrec get_default_retention_policy_request = {
  organization_id: string }[@@ocaml.doc ""]
type nonrec get_access_control_effect_response =
  {
  matched_rules: string list option ;
  effect_: access_control_rule_effect option }[@@ocaml.doc ""]
type nonrec get_access_control_effect_request =
  {
  impersonation_role_id: string option ;
  user_id: string option ;
  action: string ;
  ip_address: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec disassociate_member_from_group_response = unit
type nonrec disassociate_member_from_group_request =
  {
  member_id: string ;
  group_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec disassociate_delegate_from_resource_response = unit
type nonrec disassociate_delegate_from_resource_request =
  {
  entity_id: string ;
  resource_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec describe_user_response =
  {
  office: string option ;
  country: string option ;
  department: string option ;
  zip_code: string option ;
  company: string option ;
  city: string option ;
  job_title: string option ;
  street: string option ;
  telephone: string option ;
  initials: string option ;
  hidden_from_global_address_list: bool option ;
  last_name: string option ;
  first_name: string option ;
  mailbox_deprovisioned_date: CoreTypes.Timestamp.t option ;
  mailbox_provisioned_date: CoreTypes.Timestamp.t option ;
  disabled_date: CoreTypes.Timestamp.t option ;
  enabled_date: CoreTypes.Timestamp.t option ;
  user_role: user_role option ;
  state: entity_state option ;
  display_name: string option ;
  email: string option ;
  name: string option ;
  user_id: string option }[@@ocaml.doc ""]
type nonrec describe_user_request =
  {
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec describe_resource_response =
  {
  hidden_from_global_address_list: bool option ;
  description: string option ;
  disabled_date: CoreTypes.Timestamp.t option ;
  enabled_date: CoreTypes.Timestamp.t option ;
  state: entity_state option ;
  booking_options: booking_options option ;
  type_: resource_type option ;
  name: string option ;
  email: string option ;
  resource_id: string option }[@@ocaml.doc ""]
type nonrec describe_resource_request =
  {
  resource_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec describe_organization_response =
  {
  interoperability_enabled: bool option ;
  migration_admin: string option ;
  ar_n: string option ;
  error_message: string option ;
  completed_date: CoreTypes.Timestamp.t option ;
  default_mail_domain: string option ;
  directory_type: string option ;
  directory_id: string option ;
  state: string option ;
  alias: string option ;
  organization_id: string option }[@@ocaml.doc ""]
type nonrec describe_organization_request = {
  organization_id: string }[@@ocaml.doc ""]
type nonrec describe_mailbox_export_job_response =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  error_info: string option ;
  state: mailbox_export_job_state option ;
  estimated_progress: int option ;
  s3_path: string option ;
  s3_prefix: string option ;
  s3_bucket_name: string option ;
  kms_key_arn: string option ;
  role_arn: string option ;
  description: string option ;
  entity_id: string option }[@@ocaml.doc ""]
type nonrec describe_mailbox_export_job_request =
  {
  organization_id: string ;
  job_id: string }[@@ocaml.doc ""]
type nonrec describe_inbound_dmarc_settings_response =
  {
  enforced: bool option }[@@ocaml.doc ""]
type nonrec describe_inbound_dmarc_settings_request =
  {
  organization_id: string }[@@ocaml.doc ""]
type nonrec describe_group_response =
  {
  hidden_from_global_address_list: bool option ;
  disabled_date: CoreTypes.Timestamp.t option ;
  enabled_date: CoreTypes.Timestamp.t option ;
  state: entity_state option ;
  email: string option ;
  name: string option ;
  group_id: string option }[@@ocaml.doc ""]
type nonrec describe_group_request =
  {
  group_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec entity_type =
  | RESOURCE 
  | USER 
  | GROUP [@@ocaml.doc ""]
type nonrec describe_entity_response =
  {
  type_: entity_type option ;
  name: string option ;
  entity_id: string option }[@@ocaml.doc ""]
type nonrec describe_entity_request =
  {
  email: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec describe_email_monitoring_configuration_response =
  {
  log_group_arn: string option ;
  role_arn: string option }[@@ocaml.doc ""]
type nonrec describe_email_monitoring_configuration_request =
  {
  organization_id: string }[@@ocaml.doc ""]
type nonrec invalid_custom_ses_configuration_exception =
  {
  message: string option }[@@ocaml.doc
                            "You SES configuration has customizations that WorkMail cannot save. The error message lists the invalid setting. For examples of invalid settings, refer to {{:https://docs.aws.amazon.com/ses/latest/APIReference/API_CreateReceiptRule.html}CreateReceiptRule}.\n"]
type nonrec deregister_mail_domain_response = unit
type nonrec deregister_mail_domain_request =
  {
  domain_name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec deregister_from_work_mail_response = unit
type nonrec deregister_from_work_mail_request =
  {
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_user_response = unit
type nonrec delete_user_request = {
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_retention_policy_response = unit
type nonrec delete_retention_policy_request =
  {
  id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_resource_response = unit
type nonrec delete_resource_request =
  {
  resource_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_organization_response =
  {
  state: string option ;
  organization_id: string option }[@@ocaml.doc ""]
type nonrec delete_organization_request =
  {
  force_delete: bool option ;
  delete_directory: bool ;
  organization_id: string ;
  client_token: string option }[@@ocaml.doc ""]
type nonrec delete_mobile_device_access_rule_response = unit
type nonrec delete_mobile_device_access_rule_request =
  {
  mobile_device_access_rule_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_mobile_device_access_override_response = unit
type nonrec delete_mobile_device_access_override_request =
  {
  device_id: string ;
  user_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_mailbox_permissions_response = unit
type nonrec delete_mailbox_permissions_request =
  {
  grantee_id: string ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_impersonation_role_response = unit
type nonrec delete_impersonation_role_request =
  {
  impersonation_role_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_group_response = unit
type nonrec delete_group_request =
  {
  group_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_email_monitoring_configuration_response = unit
type nonrec delete_email_monitoring_configuration_request =
  {
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_availability_configuration_response = unit
type nonrec delete_availability_configuration_request =
  {
  domain_name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_alias_response = unit
type nonrec delete_alias_request =
  {
  alias: string ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec delete_access_control_rule_response = unit
type nonrec delete_access_control_rule_request =
  {
  name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec reserved_name_exception = {
  message: string option }[@@ocaml.doc
                            "This user, group, or resource name is not allowed in WorkMail.\n"]
type nonrec create_user_response = {
  user_id: string option }[@@ocaml.doc ""]
type nonrec create_user_request =
  {
  hidden_from_global_address_list: bool option ;
  last_name: string option ;
  first_name: string option ;
  role: user_role option ;
  password: string option ;
  display_name: string ;
  name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec create_resource_response = {
  resource_id: string option }[@@ocaml.doc ""]
type nonrec create_resource_request =
  {
  hidden_from_global_address_list: bool option ;
  description: string option ;
  type_: resource_type ;
  name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec directory_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The directory is already in use by another WorkMail organization in the same account and Region.\n"]
type nonrec create_organization_response = {
  organization_id: string option }[@@ocaml.doc ""]
type nonrec domain = {
  hosted_zone_id: string option ;
  domain_name: string }[@@ocaml.doc
                         "The domain to associate with an WorkMail organization.\n\n When you configure a domain hosted in Amazon Route 53 (Route 53), all recommended DNS records are added to the organization when you create it. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html}Adding a domain} in the {i WorkMail Administrator Guide}.\n "]
type nonrec create_organization_request =
  {
  enable_interoperability: bool option ;
  kms_key_arn: string option ;
  domains: domain list option ;
  client_token: string option ;
  alias: string ;
  directory_id: string option }[@@ocaml.doc ""]
type nonrec create_mobile_device_access_rule_response =
  {
  mobile_device_access_rule_id: string option }[@@ocaml.doc ""]
type nonrec create_mobile_device_access_rule_request =
  {
  not_device_user_agents: string list option ;
  device_user_agents: string list option ;
  not_device_operating_systems: string list option ;
  device_operating_systems: string list option ;
  not_device_models: string list option ;
  device_models: string list option ;
  not_device_types: string list option ;
  device_types: string list option ;
  effect_: mobile_device_access_rule_effect ;
  description: string option ;
  name: string ;
  client_token: string option ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec create_impersonation_role_response =
  {
  impersonation_role_id: string option }[@@ocaml.doc ""]
type nonrec create_impersonation_role_request =
  {
  rules: impersonation_rule list ;
  description: string option ;
  type_: impersonation_role_type ;
  name: string ;
  organization_id: string ;
  client_token: string option }[@@ocaml.doc ""]
type nonrec create_group_response = {
  group_id: string option }[@@ocaml.doc ""]
type nonrec create_group_request =
  {
  hidden_from_global_address_list: bool option ;
  name: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec create_availability_configuration_response = unit
type nonrec create_availability_configuration_request =
  {
  lambda_provider: lambda_availability_provider option ;
  ews_provider: ews_availability_provider option ;
  domain_name: string ;
  organization_id: string ;
  client_token: string option }[@@ocaml.doc ""]
type nonrec create_alias_response = unit
type nonrec create_alias_request =
  {
  alias: string ;
  entity_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec cancel_mailbox_export_job_response = unit
type nonrec cancel_mailbox_export_job_request =
  {
  organization_id: string ;
  job_id: string ;
  client_token: string }[@@ocaml.doc ""]
type nonrec assume_impersonation_role_response =
  {
  expires_in: int option ;
  token: string option }[@@ocaml.doc ""]
type nonrec assume_impersonation_role_request =
  {
  impersonation_role_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec associate_member_to_group_response = unit
type nonrec associate_member_to_group_request =
  {
  member_id: string ;
  group_id: string ;
  organization_id: string }[@@ocaml.doc ""]
type nonrec associate_delegate_to_resource_response = unit
type nonrec associate_delegate_to_resource_request =
  {
  entity_id: string ;
  resource_id: string ;
  organization_id: string }[@@ocaml.doc ""]