(** 
    WorkMail client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
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
  organization_id: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_update_user_response : unit -> update_user_response
val make_update_user_request :
  ?office:string ->
    ?country:string ->
      ?department:string ->
        ?zip_code:string ->
          ?company:string ->
            ?city:string ->
              ?job_title:string ->
                ?street:string ->
                  ?telephone:string ->
                    ?initials:string ->
                      ?hidden_from_global_address_list:bool ->
                        ?last_name:string ->
                          ?first_name:string ->
                            ?display_name:string ->
                              ?role:user_role ->
                                user_id:string ->
                                  organization_id:string ->
                                    unit -> update_user_request
val make_update_resource_response : unit -> update_resource_response
val make_booking_options :
  ?auto_decline_conflicting_requests:bool ->
    ?auto_decline_recurring_requests:bool ->
      ?auto_accept_requests:bool -> unit -> booking_options
val make_update_resource_request :
  ?hidden_from_global_address_list:bool ->
    ?type_:resource_type ->
      ?description:string ->
        ?booking_options:booking_options ->
          ?name:string ->
            resource_id:string ->
              organization_id:string -> unit -> update_resource_request
val make_update_primary_email_address_response :
  unit -> update_primary_email_address_response
val make_update_primary_email_address_request :
  email:string ->
    entity_id:string ->
      organization_id:string -> unit -> update_primary_email_address_request
val make_update_mobile_device_access_rule_response :
  unit -> update_mobile_device_access_rule_response
val make_update_mobile_device_access_rule_request :
  ?not_device_user_agents:string list ->
    ?device_user_agents:string list ->
      ?not_device_operating_systems:string list ->
        ?device_operating_systems:string list ->
          ?not_device_models:string list ->
            ?device_models:string list ->
              ?not_device_types:string list ->
                ?device_types:string list ->
                  ?description:string ->
                    effect_:mobile_device_access_rule_effect ->
                      name:string ->
                        mobile_device_access_rule_id:string ->
                          organization_id:string ->
                            unit -> update_mobile_device_access_rule_request
val make_update_mailbox_quota_response :
  unit -> update_mailbox_quota_response
val make_update_mailbox_quota_request :
  mailbox_quota:int ->
    user_id:string ->
      organization_id:string -> unit -> update_mailbox_quota_request
val make_update_impersonation_role_response :
  unit -> update_impersonation_role_response
val make_impersonation_rule :
  ?not_target_users:string list ->
    ?target_users:string list ->
      ?description:string ->
        ?name:string ->
          effect_:access_effect ->
            impersonation_rule_id:string -> unit -> impersonation_rule
val make_update_impersonation_role_request :
  ?description:string ->
    rules:impersonation_rule list ->
      type_:impersonation_role_type ->
        name:string ->
          impersonation_role_id:string ->
            organization_id:string ->
              unit -> update_impersonation_role_request
val make_update_group_response : unit -> update_group_response
val make_update_group_request :
  ?hidden_from_global_address_list:bool ->
    group_id:string -> organization_id:string -> unit -> update_group_request
val make_update_default_mail_domain_response :
  unit -> update_default_mail_domain_response
val make_update_default_mail_domain_request :
  domain_name:string ->
    organization_id:string -> unit -> update_default_mail_domain_request
val make_update_availability_configuration_response :
  unit -> update_availability_configuration_response
val make_ews_availability_provider :
  ews_password:string ->
    ews_username:string ->
      ews_endpoint:string -> unit -> ews_availability_provider
val make_lambda_availability_provider :
  lambda_arn:string -> unit -> lambda_availability_provider
val make_update_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
    ?ews_provider:ews_availability_provider ->
      domain_name:string ->
        organization_id:string ->
          unit -> update_availability_configuration_request
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_test_availability_configuration_response :
  ?failure_reason:string ->
    ?test_passed:bool -> unit -> test_availability_configuration_response
val make_test_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
    ?ews_provider:ews_availability_provider ->
      ?domain_name:string ->
        organization_id:string ->
          unit -> test_availability_configuration_request
val make_tag_resource_response : unit -> tag_resource_response
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_start_mailbox_export_job_response :
  ?job_id:string -> unit -> start_mailbox_export_job_response
val make_start_mailbox_export_job_request :
  ?description:string ->
    s3_prefix:string ->
      s3_bucket_name:string ->
        kms_key_arn:string ->
          role_arn:string ->
            entity_id:string ->
              organization_id:string ->
                client_token:string ->
                  unit -> start_mailbox_export_job_request
val make_reset_password_response : unit -> reset_password_response
val make_reset_password_request :
  password:string ->
    user_id:string ->
      organization_id:string -> unit -> reset_password_request
val make_register_to_work_mail_response :
  unit -> register_to_work_mail_response
val make_register_to_work_mail_request :
  email:string ->
    entity_id:string ->
      organization_id:string -> unit -> register_to_work_mail_request
val make_register_mail_domain_response :
  unit -> register_mail_domain_response
val make_register_mail_domain_request :
  ?client_token:string ->
    domain_name:string ->
      organization_id:string -> unit -> register_mail_domain_request
val make_put_retention_policy_response :
  unit -> put_retention_policy_response
val make_folder_configuration :
  ?period:int ->
    action:retention_action ->
      name:folder_name -> unit -> folder_configuration
val make_put_retention_policy_request :
  ?description:string ->
    ?id:string ->
      folder_configurations:folder_configuration list ->
        name:string ->
          organization_id:string -> unit -> put_retention_policy_request
val make_put_mobile_device_access_override_response :
  unit -> put_mobile_device_access_override_response
val make_put_mobile_device_access_override_request :
  ?description:string ->
    effect_:mobile_device_access_rule_effect ->
      device_id:string ->
        user_id:string ->
          organization_id:string ->
            unit -> put_mobile_device_access_override_request
val make_put_mailbox_permissions_response :
  unit -> put_mailbox_permissions_response
val make_put_mailbox_permissions_request :
  permission_values:permission_type list ->
    grantee_id:string ->
      entity_id:string ->
        organization_id:string -> unit -> put_mailbox_permissions_request
val make_put_inbound_dmarc_settings_response :
  unit -> put_inbound_dmarc_settings_response
val make_put_inbound_dmarc_settings_request :
  enforced:bool ->
    organization_id:string -> unit -> put_inbound_dmarc_settings_request
val make_put_email_monitoring_configuration_response :
  unit -> put_email_monitoring_configuration_response
val make_put_email_monitoring_configuration_request :
  log_group_arn:string ->
    role_arn:string ->
      organization_id:string ->
        unit -> put_email_monitoring_configuration_request
val make_put_access_control_rule_response :
  unit -> put_access_control_rule_response
val make_put_access_control_rule_request :
  ?not_impersonation_role_ids:string list ->
    ?impersonation_role_ids:string list ->
      ?not_user_ids:string list ->
        ?user_ids:string list ->
          ?not_actions:string list ->
            ?actions:string list ->
              ?not_ip_ranges:string list ->
                ?ip_ranges:string list ->
                  organization_id:string ->
                    description:string ->
                      effect_:access_control_rule_effect ->
                        name:string ->
                          unit -> put_access_control_rule_request
val make_user :
  ?disabled_date:CoreTypes.Timestamp.t ->
    ?enabled_date:CoreTypes.Timestamp.t ->
      ?user_role:user_role ->
        ?state:entity_state ->
          ?display_name:string ->
            ?name:string -> ?email:string -> ?id:string -> unit -> user
val make_list_users_response :
  ?next_token:string -> ?users:user list -> unit -> list_users_response
val make_list_users_filters :
  ?state:entity_state ->
    ?primary_email_prefix:string ->
      ?display_name_prefix:string ->
        ?username_prefix:string -> unit -> list_users_filters
val make_list_users_request :
  ?filters:list_users_filters ->
    ?max_results:int ->
      ?next_token:string ->
        organization_id:string -> unit -> list_users_request
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_resource :
  ?description:string ->
    ?disabled_date:CoreTypes.Timestamp.t ->
      ?enabled_date:CoreTypes.Timestamp.t ->
        ?state:entity_state ->
          ?type_:resource_type ->
            ?name:string -> ?email:string -> ?id:string -> unit -> resource
val make_list_resources_response :
  ?next_token:string ->
    ?resources:resource list -> unit -> list_resources_response
val make_list_resources_filters :
  ?state:entity_state ->
    ?primary_email_prefix:string ->
      ?name_prefix:string -> unit -> list_resources_filters
val make_list_resources_request :
  ?filters:list_resources_filters ->
    ?max_results:int ->
      ?next_token:string ->
        organization_id:string -> unit -> list_resources_request
val make_delegate : type_:member_type -> id:string -> unit -> delegate
val make_list_resource_delegates_response :
  ?next_token:string ->
    ?delegates:delegate list -> unit -> list_resource_delegates_response
val make_list_resource_delegates_request :
  ?max_results:int ->
    ?next_token:string ->
      resource_id:string ->
        organization_id:string -> unit -> list_resource_delegates_request
val make_organization_summary :
  ?state:string ->
    ?error_message:string ->
      ?default_mail_domain:string ->
        ?alias:string ->
          ?organization_id:string -> unit -> organization_summary
val make_list_organizations_response :
  ?next_token:string ->
    ?organization_summaries:organization_summary list ->
      unit -> list_organizations_response
val make_list_organizations_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_organizations_request
val make_mobile_device_access_rule :
  ?date_modified:CoreTypes.Timestamp.t ->
    ?date_created:CoreTypes.Timestamp.t ->
      ?not_device_user_agents:string list ->
        ?device_user_agents:string list ->
          ?not_device_operating_systems:string list ->
            ?device_operating_systems:string list ->
              ?not_device_models:string list ->
                ?device_models:string list ->
                  ?not_device_types:string list ->
                    ?device_types:string list ->
                      ?effect_:mobile_device_access_rule_effect ->
                        ?description:string ->
                          ?name:string ->
                            ?mobile_device_access_rule_id:string ->
                              unit -> mobile_device_access_rule
val make_list_mobile_device_access_rules_response :
  ?rules:mobile_device_access_rule list ->
    unit -> list_mobile_device_access_rules_response
val make_list_mobile_device_access_rules_request :
  organization_id:string -> unit -> list_mobile_device_access_rules_request
val make_mobile_device_access_override :
  ?date_modified:CoreTypes.Timestamp.t ->
    ?date_created:CoreTypes.Timestamp.t ->
      ?description:string ->
        ?effect_:mobile_device_access_rule_effect ->
          ?device_id:string ->
            ?user_id:string -> unit -> mobile_device_access_override
val make_list_mobile_device_access_overrides_response :
  ?next_token:string ->
    ?overrides:mobile_device_access_override list ->
      unit -> list_mobile_device_access_overrides_response
val make_list_mobile_device_access_overrides_request :
  ?max_results:int ->
    ?next_token:string ->
      ?device_id:string ->
        ?user_id:string ->
          organization_id:string ->
            unit -> list_mobile_device_access_overrides_request
val make_mail_domain_summary :
  ?default_domain:bool -> ?domain_name:string -> unit -> mail_domain_summary
val make_list_mail_domains_response :
  ?next_token:string ->
    ?mail_domains:mail_domain_summary list ->
      unit -> list_mail_domains_response
val make_list_mail_domains_request :
  ?next_token:string ->
    ?max_results:int ->
      organization_id:string -> unit -> list_mail_domains_request
val make_permission :
  permission_values:permission_type list ->
    grantee_type:member_type -> grantee_id:string -> unit -> permission
val make_list_mailbox_permissions_response :
  ?next_token:string ->
    ?permissions:permission list -> unit -> list_mailbox_permissions_response
val make_list_mailbox_permissions_request :
  ?max_results:int ->
    ?next_token:string ->
      entity_id:string ->
        organization_id:string -> unit -> list_mailbox_permissions_request
val make_mailbox_export_job :
  ?end_time:CoreTypes.Timestamp.t ->
    ?start_time:CoreTypes.Timestamp.t ->
      ?state:mailbox_export_job_state ->
        ?estimated_progress:int ->
          ?s3_path:string ->
            ?s3_bucket_name:string ->
              ?description:string ->
                ?entity_id:string ->
                  ?job_id:string -> unit -> mailbox_export_job
val make_list_mailbox_export_jobs_response :
  ?next_token:string ->
    ?jobs:mailbox_export_job list ->
      unit -> list_mailbox_export_jobs_response
val make_list_mailbox_export_jobs_request :
  ?max_results:int ->
    ?next_token:string ->
      organization_id:string -> unit -> list_mailbox_export_jobs_request
val make_impersonation_role :
  ?date_modified:CoreTypes.Timestamp.t ->
    ?date_created:CoreTypes.Timestamp.t ->
      ?type_:impersonation_role_type ->
        ?name:string ->
          ?impersonation_role_id:string -> unit -> impersonation_role
val make_list_impersonation_roles_response :
  ?next_token:string ->
    ?roles:impersonation_role list ->
      unit -> list_impersonation_roles_response
val make_list_impersonation_roles_request :
  ?max_results:int ->
    ?next_token:string ->
      organization_id:string -> unit -> list_impersonation_roles_request
val make_group_identifier :
  ?group_name:string -> ?group_id:string -> unit -> group_identifier
val make_list_groups_for_entity_response :
  ?next_token:string ->
    ?groups:group_identifier list -> unit -> list_groups_for_entity_response
val make_list_groups_for_entity_filters :
  ?group_name_prefix:string -> unit -> list_groups_for_entity_filters
val make_list_groups_for_entity_request :
  ?max_results:int ->
    ?next_token:string ->
      ?filters:list_groups_for_entity_filters ->
        entity_id:string ->
          organization_id:string -> unit -> list_groups_for_entity_request
val make_group :
  ?disabled_date:CoreTypes.Timestamp.t ->
    ?enabled_date:CoreTypes.Timestamp.t ->
      ?state:entity_state ->
        ?name:string -> ?email:string -> ?id:string -> unit -> group
val make_list_groups_response :
  ?next_token:string -> ?groups:group list -> unit -> list_groups_response
val make_list_groups_filters :
  ?state:entity_state ->
    ?primary_email_prefix:string ->
      ?name_prefix:string -> unit -> list_groups_filters
val make_list_groups_request :
  ?filters:list_groups_filters ->
    ?max_results:int ->
      ?next_token:string ->
        organization_id:string -> unit -> list_groups_request
val make_member :
  ?disabled_date:CoreTypes.Timestamp.t ->
    ?enabled_date:CoreTypes.Timestamp.t ->
      ?state:entity_state ->
        ?type_:member_type -> ?name:string -> ?id:string -> unit -> member
val make_list_group_members_response :
  ?next_token:string ->
    ?members:member list -> unit -> list_group_members_response
val make_list_group_members_request :
  ?max_results:int ->
    ?next_token:string ->
      group_id:string ->
        organization_id:string -> unit -> list_group_members_request
val make_redacted_ews_availability_provider :
  ?ews_username:string ->
    ?ews_endpoint:string -> unit -> redacted_ews_availability_provider
val make_availability_configuration :
  ?date_modified:CoreTypes.Timestamp.t ->
    ?date_created:CoreTypes.Timestamp.t ->
      ?lambda_provider:lambda_availability_provider ->
        ?ews_provider:redacted_ews_availability_provider ->
          ?provider_type:availability_provider_type ->
            ?domain_name:string -> unit -> availability_configuration
val make_list_availability_configurations_response :
  ?next_token:string ->
    ?availability_configurations:availability_configuration list ->
      unit -> list_availability_configurations_response
val make_list_availability_configurations_request :
  ?next_token:string ->
    ?max_results:int ->
      organization_id:string ->
        unit -> list_availability_configurations_request
val make_list_aliases_response :
  ?next_token:string -> ?aliases:string list -> unit -> list_aliases_response
val make_list_aliases_request :
  ?max_results:int ->
    ?next_token:string ->
      entity_id:string ->
        organization_id:string -> unit -> list_aliases_request
val make_access_control_rule :
  ?not_impersonation_role_ids:string list ->
    ?impersonation_role_ids:string list ->
      ?date_modified:CoreTypes.Timestamp.t ->
        ?date_created:CoreTypes.Timestamp.t ->
          ?not_user_ids:string list ->
            ?user_ids:string list ->
              ?not_actions:string list ->
                ?actions:string list ->
                  ?not_ip_ranges:string list ->
                    ?ip_ranges:string list ->
                      ?description:string ->
                        ?effect_:access_control_rule_effect ->
                          ?name:string -> unit -> access_control_rule
val make_list_access_control_rules_response :
  ?rules:access_control_rule list ->
    unit -> list_access_control_rules_response
val make_list_access_control_rules_request :
  organization_id:string -> unit -> list_access_control_rules_request
val make_get_mobile_device_access_override_response :
  ?date_modified:CoreTypes.Timestamp.t ->
    ?date_created:CoreTypes.Timestamp.t ->
      ?description:string ->
        ?effect_:mobile_device_access_rule_effect ->
          ?device_id:string ->
            ?user_id:string ->
              unit -> get_mobile_device_access_override_response
val make_get_mobile_device_access_override_request :
  device_id:string ->
    user_id:string ->
      organization_id:string ->
        unit -> get_mobile_device_access_override_request
val make_mobile_device_access_matched_rule :
  ?name:string ->
    ?mobile_device_access_rule_id:string ->
      unit -> mobile_device_access_matched_rule
val make_get_mobile_device_access_effect_response :
  ?matched_rules:mobile_device_access_matched_rule list ->
    ?effect_:mobile_device_access_rule_effect ->
      unit -> get_mobile_device_access_effect_response
val make_get_mobile_device_access_effect_request :
  ?device_user_agent:string ->
    ?device_operating_system:string ->
      ?device_model:string ->
        ?device_type:string ->
          organization_id:string ->
            unit -> get_mobile_device_access_effect_request
val make_dns_record :
  ?value:string -> ?hostname:string -> ?type_:string -> unit -> dns_record
val make_get_mail_domain_response :
  ?dkim_verification_status:dns_record_verification_status ->
    ?ownership_verification_status:dns_record_verification_status ->
      ?is_default:bool ->
        ?is_test_domain:bool ->
          ?records:dns_record list -> unit -> get_mail_domain_response
val make_get_mail_domain_request :
  domain_name:string ->
    organization_id:string -> unit -> get_mail_domain_request
val make_get_mailbox_details_response :
  ?mailbox_size:float ->
    ?mailbox_quota:int -> unit -> get_mailbox_details_response
val make_get_mailbox_details_request :
  user_id:string ->
    organization_id:string -> unit -> get_mailbox_details_request
val make_impersonation_matched_rule :
  ?name:string ->
    ?impersonation_rule_id:string -> unit -> impersonation_matched_rule
val make_get_impersonation_role_effect_response :
  ?matched_rules:impersonation_matched_rule list ->
    ?effect_:access_effect ->
      ?type_:impersonation_role_type ->
        unit -> get_impersonation_role_effect_response
val make_get_impersonation_role_effect_request :
  target_user:string ->
    impersonation_role_id:string ->
      organization_id:string -> unit -> get_impersonation_role_effect_request
val make_get_impersonation_role_response :
  ?date_modified:CoreTypes.Timestamp.t ->
    ?date_created:CoreTypes.Timestamp.t ->
      ?rules:impersonation_rule list ->
        ?description:string ->
          ?type_:impersonation_role_type ->
            ?name:string ->
              ?impersonation_role_id:string ->
                unit -> get_impersonation_role_response
val make_get_impersonation_role_request :
  impersonation_role_id:string ->
    organization_id:string -> unit -> get_impersonation_role_request
val make_get_default_retention_policy_response :
  ?folder_configurations:folder_configuration list ->
    ?description:string ->
      ?name:string ->
        ?id:string -> unit -> get_default_retention_policy_response
val make_get_default_retention_policy_request :
  organization_id:string -> unit -> get_default_retention_policy_request
val make_get_access_control_effect_response :
  ?matched_rules:string list ->
    ?effect_:access_control_rule_effect ->
      unit -> get_access_control_effect_response
val make_get_access_control_effect_request :
  ?impersonation_role_id:string ->
    ?user_id:string ->
      action:string ->
        ip_address:string ->
          organization_id:string -> unit -> get_access_control_effect_request
val make_disassociate_member_from_group_response :
  unit -> disassociate_member_from_group_response
val make_disassociate_member_from_group_request :
  member_id:string ->
    group_id:string ->
      organization_id:string ->
        unit -> disassociate_member_from_group_request
val make_disassociate_delegate_from_resource_response :
  unit -> disassociate_delegate_from_resource_response
val make_disassociate_delegate_from_resource_request :
  entity_id:string ->
    resource_id:string ->
      organization_id:string ->
        unit -> disassociate_delegate_from_resource_request
val make_describe_user_response :
  ?office:string ->
    ?country:string ->
      ?department:string ->
        ?zip_code:string ->
          ?company:string ->
            ?city:string ->
              ?job_title:string ->
                ?street:string ->
                  ?telephone:string ->
                    ?initials:string ->
                      ?hidden_from_global_address_list:bool ->
                        ?last_name:string ->
                          ?first_name:string ->
                            ?mailbox_deprovisioned_date:CoreTypes.Timestamp.t
                              ->
                              ?mailbox_provisioned_date:CoreTypes.Timestamp.t
                                ->
                                ?disabled_date:CoreTypes.Timestamp.t ->
                                  ?enabled_date:CoreTypes.Timestamp.t ->
                                    ?user_role:user_role ->
                                      ?state:entity_state ->
                                        ?display_name:string ->
                                          ?email:string ->
                                            ?name:string ->
                                              ?user_id:string ->
                                                unit ->
                                                  describe_user_response
val make_describe_user_request :
  user_id:string -> organization_id:string -> unit -> describe_user_request
val make_describe_resource_response :
  ?hidden_from_global_address_list:bool ->
    ?description:string ->
      ?disabled_date:CoreTypes.Timestamp.t ->
        ?enabled_date:CoreTypes.Timestamp.t ->
          ?state:entity_state ->
            ?booking_options:booking_options ->
              ?type_:resource_type ->
                ?name:string ->
                  ?email:string ->
                    ?resource_id:string -> unit -> describe_resource_response
val make_describe_resource_request :
  resource_id:string ->
    organization_id:string -> unit -> describe_resource_request
val make_describe_organization_response :
  ?interoperability_enabled:bool ->
    ?migration_admin:string ->
      ?ar_n:string ->
        ?error_message:string ->
          ?completed_date:CoreTypes.Timestamp.t ->
            ?default_mail_domain:string ->
              ?directory_type:string ->
                ?directory_id:string ->
                  ?state:string ->
                    ?alias:string ->
                      ?organization_id:string ->
                        unit -> describe_organization_response
val make_describe_organization_request :
  organization_id:string -> unit -> describe_organization_request
val make_describe_mailbox_export_job_response :
  ?end_time:CoreTypes.Timestamp.t ->
    ?start_time:CoreTypes.Timestamp.t ->
      ?error_info:string ->
        ?state:mailbox_export_job_state ->
          ?estimated_progress:int ->
            ?s3_path:string ->
              ?s3_prefix:string ->
                ?s3_bucket_name:string ->
                  ?kms_key_arn:string ->
                    ?role_arn:string ->
                      ?description:string ->
                        ?entity_id:string ->
                          unit -> describe_mailbox_export_job_response
val make_describe_mailbox_export_job_request :
  organization_id:string ->
    job_id:string -> unit -> describe_mailbox_export_job_request
val make_describe_inbound_dmarc_settings_response :
  ?enforced:bool -> unit -> describe_inbound_dmarc_settings_response
val make_describe_inbound_dmarc_settings_request :
  organization_id:string -> unit -> describe_inbound_dmarc_settings_request
val make_describe_group_response :
  ?hidden_from_global_address_list:bool ->
    ?disabled_date:CoreTypes.Timestamp.t ->
      ?enabled_date:CoreTypes.Timestamp.t ->
        ?state:entity_state ->
          ?email:string ->
            ?name:string ->
              ?group_id:string -> unit -> describe_group_response
val make_describe_group_request :
  group_id:string -> organization_id:string -> unit -> describe_group_request
val make_describe_entity_response :
  ?type_:entity_type ->
    ?name:string -> ?entity_id:string -> unit -> describe_entity_response
val make_describe_entity_request :
  email:string -> organization_id:string -> unit -> describe_entity_request
val make_describe_email_monitoring_configuration_response :
  ?log_group_arn:string ->
    ?role_arn:string ->
      unit -> describe_email_monitoring_configuration_response
val make_describe_email_monitoring_configuration_request :
  organization_id:string ->
    unit -> describe_email_monitoring_configuration_request
val make_deregister_mail_domain_response :
  unit -> deregister_mail_domain_response
val make_deregister_mail_domain_request :
  domain_name:string ->
    organization_id:string -> unit -> deregister_mail_domain_request
val make_deregister_from_work_mail_response :
  unit -> deregister_from_work_mail_response
val make_deregister_from_work_mail_request :
  entity_id:string ->
    organization_id:string -> unit -> deregister_from_work_mail_request
val make_delete_user_response : unit -> delete_user_response
val make_delete_user_request :
  user_id:string -> organization_id:string -> unit -> delete_user_request
val make_delete_retention_policy_response :
  unit -> delete_retention_policy_response
val make_delete_retention_policy_request :
  id:string ->
    organization_id:string -> unit -> delete_retention_policy_request
val make_delete_resource_response : unit -> delete_resource_response
val make_delete_resource_request :
  resource_id:string ->
    organization_id:string -> unit -> delete_resource_request
val make_delete_organization_response :
  ?state:string ->
    ?organization_id:string -> unit -> delete_organization_response
val make_delete_organization_request :
  ?force_delete:bool ->
    ?client_token:string ->
      delete_directory:bool ->
        organization_id:string -> unit -> delete_organization_request
val make_delete_mobile_device_access_rule_response :
  unit -> delete_mobile_device_access_rule_response
val make_delete_mobile_device_access_rule_request :
  mobile_device_access_rule_id:string ->
    organization_id:string ->
      unit -> delete_mobile_device_access_rule_request
val make_delete_mobile_device_access_override_response :
  unit -> delete_mobile_device_access_override_response
val make_delete_mobile_device_access_override_request :
  device_id:string ->
    user_id:string ->
      organization_id:string ->
        unit -> delete_mobile_device_access_override_request
val make_delete_mailbox_permissions_response :
  unit -> delete_mailbox_permissions_response
val make_delete_mailbox_permissions_request :
  grantee_id:string ->
    entity_id:string ->
      organization_id:string -> unit -> delete_mailbox_permissions_request
val make_delete_impersonation_role_response :
  unit -> delete_impersonation_role_response
val make_delete_impersonation_role_request :
  impersonation_role_id:string ->
    organization_id:string -> unit -> delete_impersonation_role_request
val make_delete_group_response : unit -> delete_group_response
val make_delete_group_request :
  group_id:string -> organization_id:string -> unit -> delete_group_request
val make_delete_email_monitoring_configuration_response :
  unit -> delete_email_monitoring_configuration_response
val make_delete_email_monitoring_configuration_request :
  organization_id:string ->
    unit -> delete_email_monitoring_configuration_request
val make_delete_availability_configuration_response :
  unit -> delete_availability_configuration_response
val make_delete_availability_configuration_request :
  domain_name:string ->
    organization_id:string ->
      unit -> delete_availability_configuration_request
val make_delete_alias_response : unit -> delete_alias_response
val make_delete_alias_request :
  alias:string ->
    entity_id:string ->
      organization_id:string -> unit -> delete_alias_request
val make_delete_access_control_rule_response :
  unit -> delete_access_control_rule_response
val make_delete_access_control_rule_request :
  name:string ->
    organization_id:string -> unit -> delete_access_control_rule_request
val make_create_user_response :
  ?user_id:string -> unit -> create_user_response
val make_create_user_request :
  ?hidden_from_global_address_list:bool ->
    ?last_name:string ->
      ?first_name:string ->
        ?role:user_role ->
          ?password:string ->
            display_name:string ->
              name:string ->
                organization_id:string -> unit -> create_user_request
val make_create_resource_response :
  ?resource_id:string -> unit -> create_resource_response
val make_create_resource_request :
  ?hidden_from_global_address_list:bool ->
    ?description:string ->
      type_:resource_type ->
        name:string ->
          organization_id:string -> unit -> create_resource_request
val make_create_organization_response :
  ?organization_id:string -> unit -> create_organization_response
val make_domain :
  ?hosted_zone_id:string -> domain_name:string -> unit -> domain
val make_create_organization_request :
  ?enable_interoperability:bool ->
    ?kms_key_arn:string ->
      ?domains:domain list ->
        ?client_token:string ->
          ?directory_id:string ->
            alias:string -> unit -> create_organization_request
val make_create_mobile_device_access_rule_response :
  ?mobile_device_access_rule_id:string ->
    unit -> create_mobile_device_access_rule_response
val make_create_mobile_device_access_rule_request :
  ?not_device_user_agents:string list ->
    ?device_user_agents:string list ->
      ?not_device_operating_systems:string list ->
        ?device_operating_systems:string list ->
          ?not_device_models:string list ->
            ?device_models:string list ->
              ?not_device_types:string list ->
                ?device_types:string list ->
                  ?description:string ->
                    ?client_token:string ->
                      effect_:mobile_device_access_rule_effect ->
                        name:string ->
                          organization_id:string ->
                            unit -> create_mobile_device_access_rule_request
val make_create_impersonation_role_response :
  ?impersonation_role_id:string -> unit -> create_impersonation_role_response
val make_create_impersonation_role_request :
  ?description:string ->
    ?client_token:string ->
      rules:impersonation_rule list ->
        type_:impersonation_role_type ->
          name:string ->
            organization_id:string ->
              unit -> create_impersonation_role_request
val make_create_group_response :
  ?group_id:string -> unit -> create_group_response
val make_create_group_request :
  ?hidden_from_global_address_list:bool ->
    name:string -> organization_id:string -> unit -> create_group_request
val make_create_availability_configuration_response :
  unit -> create_availability_configuration_response
val make_create_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
    ?ews_provider:ews_availability_provider ->
      ?client_token:string ->
        domain_name:string ->
          organization_id:string ->
            unit -> create_availability_configuration_request
val make_create_alias_response : unit -> create_alias_response
val make_create_alias_request :
  alias:string ->
    entity_id:string ->
      organization_id:string -> unit -> create_alias_request
val make_cancel_mailbox_export_job_response :
  unit -> cancel_mailbox_export_job_response
val make_cancel_mailbox_export_job_request :
  organization_id:string ->
    job_id:string ->
      client_token:string -> unit -> cancel_mailbox_export_job_request
val make_assume_impersonation_role_response :
  ?expires_in:int ->
    ?token:string -> unit -> assume_impersonation_role_response
val make_assume_impersonation_role_request :
  impersonation_role_id:string ->
    organization_id:string -> unit -> assume_impersonation_role_request
val make_associate_member_to_group_response :
  unit -> associate_member_to_group_response
val make_associate_member_to_group_request :
  member_id:string ->
    group_id:string ->
      organization_id:string -> unit -> associate_member_to_group_request
val make_associate_delegate_to_resource_response :
  unit -> associate_delegate_to_resource_response
val make_associate_delegate_to_resource_request :
  entity_id:string ->
    resource_id:string ->
      organization_id:string ->
        unit -> associate_delegate_to_resource_request(** {1:operations Operations} *)

module AssociateDelegateToResource : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_delegate_to_resource_request ->
        (associate_delegate_to_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Adds a member (user or group) to the resource's set of delegates.
 *)

  
end

module AssociateMemberToGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_member_to_group_request ->
        (associate_member_to_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Adds a member (user or group) to the group's set.
 *)

  
end

module AssumeImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      assume_impersonation_role_request ->
        (assume_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Assumes an impersonation role for the given WorkMail organization. This method returns an authentication token you can use to make impersonated calls.
 *)

  
end

module CancelMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_mailbox_export_job_request ->
        (cancel_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Cancels a mailbox export job.

  If the mailbox export job is near completion, it might not be possible to cancel it.
  
    *)

  
end

module CreateAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_alias_request ->
        (create_alias_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Adds an alias to the set of a given member (user or group) of WorkMail.
 *)

  
end

module CreateAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      create_availability_configuration_request ->
        (create_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Creates an [AvailabilityConfiguration] for the given WorkMail organization and domain.
 *)

  
end

module CreateGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_group_request ->
        (create_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Creates a group that can be used in WorkMail by calling the [RegisterToWorkMail] operation.
 *)

  
end

module CreateImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      create_impersonation_role_request ->
        (create_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Creates an impersonation role for the given WorkMail organization.

  {i Idempotency} ensures that an API request completes no more than one time. With an idempotent request, if the original request completes successfully, any subsequent retries also complete successfully without performing any further actions.
  *)

  
end

module CreateMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      create_mobile_device_access_rule_request ->
        (create_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Creates a new mobile device access rule for the specified WorkMail organization.
 *)

  
end

module CreateOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      create_organization_request ->
        (create_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryInUseException of directory_in_use_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `NameAvailabilityException of name_availability_exception
            
        ]
      ) result
  (** Creates a new WorkMail organization. Optionally, you can choose to associate an existing AWS Directory Service directory with your organization. If an AWS Directory Service directory ID is specified, the organization alias must match the directory alias. If you choose not to associate an existing directory with your organization, then we create a new WorkMail directory for you. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_new_organization.html}Adding an organization} in the {i WorkMail Administrator Guide}.

 You can associate multiple email domains with an organization, then choose your default email domain from the WorkMail console. You can also associate a domain that is managed in an Amazon Route 53 public hosted zone. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html}Adding a domain} and {{:https://docs.aws.amazon.com/workmail/latest/adminguide/default_domain.html}Choosing the default domain} in the {i WorkMail Administrator Guide}.
 
  Optionally, you can use a customer managed key from AWS Key Management Service (AWS KMS) to encrypt email for your organization. If you don't associate an AWS KMS key, WorkMail creates a default, AWS managed key for you.
   *)

  
end

module CreateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      create_resource_request ->
        (create_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Creates a new WorkMail resource.
 *)

  
end

module CreateUser : sig
  val request :
    Smaws_Lib.Context.t ->
      create_user_request ->
        (create_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidPasswordException of invalid_password_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ReservedNameException of reserved_name_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Creates a user who can be used in WorkMail by calling the [RegisterToWorkMail] operation.
 *)

  
end

module DeleteAccessControlRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_control_rule_request ->
        (delete_access_control_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes an access control rule for the specified WorkMail organization.

  Deleting already deleted and non-existing rules does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.
  
    *)

  
end

module DeleteAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_alias_request ->
        (delete_alias_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Remove one or more specified aliases from a set of aliases for a given user.
 *)

  
end

module DeleteAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_availability_configuration_request ->
        (delete_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes the [AvailabilityConfiguration] for the given WorkMail organization and domain.
 *)

  
end

module DeleteEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_email_monitoring_configuration_request ->
        (delete_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes the email monitoring configuration for a specified organization.
 *)

  
end

module DeleteGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_group_request ->
        (delete_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Deletes a group from WorkMail.
 *)

  
end

module DeleteImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_impersonation_role_request ->
        (delete_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes an impersonation role for the given WorkMail organization.
 *)

  
end

module DeleteMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mailbox_permissions_request ->
        (delete_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes permissions granted to a member (user or group).
 *)

  
end

module DeleteMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mobile_device_access_override_request ->
        (delete_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes the mobile device access override for the given WorkMail organization, user, and device.

  Deleting already deleted and non-existing overrides does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.
  
    *)

  
end

module DeleteMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_mobile_device_access_rule_request ->
        (delete_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes a mobile device access rule for the specified WorkMail organization.

  Deleting already deleted and non-existing rules does not produce an error. In those cases, the service sends back an HTTP 200 response with an empty HTTP body.
  
    *)

  
end

module DeleteOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_organization_request ->
        (delete_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes an WorkMail organization and all underlying AWS resources managed by WorkMail as part of the organization. You can choose whether to delete the associated directory. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/remove_organization.html}Removing an organization} in the {i WorkMail Administrator Guide}.
 *)

  
end

module DeleteResource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_request ->
        (delete_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Deletes the specified resource.
 *)

  
end

module DeleteRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_retention_policy_request ->
        (delete_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Deletes the specified retention policy from the specified organization.
 *)

  
end

module DeleteUser : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_user_request ->
        (delete_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Deletes a user from WorkMail and all subsequent systems. Before you can delete a user, the user state must be [DISABLED]. Use the [DescribeUser] action to confirm the user state.

 Deleting a user is permanent and cannot be undone. WorkMail archives user mailboxes for 30 days before they are permanently removed.
  *)

  
end

module DeregisterFromWorkMail : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_from_work_mail_request ->
        (deregister_from_work_mail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Mark a user, group, or resource as no longer used in WorkMail. This action disassociates the mailbox and schedules it for clean-up. WorkMail keeps mailboxes for 30 days before they are permanently removed. The functionality in the console is {i Disable}.
 *)

  
end

module DeregisterMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_mail_domain_request ->
        (deregister_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidCustomSesConfigurationException of invalid_custom_ses_configuration_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainInUseException of mail_domain_in_use_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Removes a domain from WorkMail, stops email routing to WorkMail, and removes the authorization allowing WorkMail use. SES keeps the domain because other applications may use it. You must first remove any email address used by WorkMail entities before you remove the domain.
 *)

  
end

module DescribeEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_email_monitoring_configuration_request ->
        (describe_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Describes the current email monitoring configuration for a specified organization.
 *)

  
end

module DescribeEntity : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_entity_request ->
        (describe_entity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Returns basic details about an entity in WorkMail. 
 *)

  
end

module DescribeGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_group_request ->
        (describe_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Returns the data available for the group.
 *)

  
end

module DescribeInboundDmarcSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_inbound_dmarc_settings_request ->
        (describe_inbound_dmarc_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Lists the settings in a DMARC policy for a specified organization.
 *)

  
end

module DescribeMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_mailbox_export_job_request ->
        (describe_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Describes the current status of a mailbox export job.
 *)

  
end

module DescribeOrganization : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_organization_request ->
        (describe_organization_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            
        ]
      ) result
  (** Provides more information regarding a given organization based on its identifier.
 *)

  
end

module DescribeResource : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_resource_request ->
        (describe_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Returns the data available for the resource.
 *)

  
end

module DescribeUser : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_user_request ->
        (describe_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Provides information regarding the user.
 *)

  
end

module DisassociateDelegateFromResource : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_delegate_from_resource_request ->
        (disassociate_delegate_from_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Removes a member from the resource's set of delegates.
 *)

  
end

module DisassociateMemberFromGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_member_from_group_request ->
        (disassociate_member_from_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Removes a member from a group.
 *)

  
end

module GetAccessControlEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_access_control_effect_request ->
        (get_access_control_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Gets the effects of an organization's access control rules as they apply to a specified IPv4 address, access protocol action, and user ID or impersonation role ID. You must provide either the user ID or impersonation role ID. Impersonation role ID can only be used with Action EWS.
 *)

  
end

module GetDefaultRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_default_retention_policy_request ->
        (get_default_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Gets the default retention policy details for the specified organization.
 *)

  
end

module GetImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      get_impersonation_role_request ->
        (get_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Gets the impersonation role details for the given WorkMail organization.
 *)

  
end

module GetImpersonationRoleEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_impersonation_role_effect_request ->
        (get_impersonation_role_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Tests whether the given impersonation role can impersonate a target user.
 *)

  
end

module GetMailboxDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mailbox_details_request ->
        (get_mailbox_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Requests a user's mailbox details for a specified organization and user.
 *)

  
end

module GetMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mail_domain_request ->
        (get_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Gets details for a mail domain, including domain records required to configure your domain with recommended security.
 *)

  
end

module GetMobileDeviceAccessEffect : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_device_access_effect_request ->
        (get_mobile_device_access_effect_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Simulates the effect of the mobile device access rules for the given attributes of a sample access event. Use this method to test the effects of the current set of mobile device access rules for the WorkMail organization for a particular user's attributes.
 *)

  
end

module GetMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_device_access_override_request ->
        (get_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Gets the mobile device access override for the given WorkMail organization, user, and device.
 *)

  
end

module ListAccessControlRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_control_rules_request ->
        (list_access_control_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Lists the access control rules for the specified organization.
 *)

  
end

module ListAliases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_aliases_request ->
        (list_aliases_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Creates a paginated call to list the aliases associated with a given entity.
 *)

  
end

module ListAvailabilityConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_availability_configurations_request ->
        (list_availability_configurations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** List all the [AvailabilityConfiguration]'s for the given WorkMail organization.
 *)

  
end

module ListGroupMembers : sig
  val request :
    Smaws_Lib.Context.t ->
      list_group_members_request ->
        (list_group_members_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Returns an overview of the members of a group. Users and groups can be members of a group.
 *)

  
end

module ListGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_request ->
        (list_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Returns summaries of the organization's groups.
 *)

  
end

module ListGroupsForEntity : sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_for_entity_request ->
        (list_groups_for_entity_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Returns all the groups to which an entity belongs.
 *)

  
end

module ListImpersonationRoles : sig
  val request :
    Smaws_Lib.Context.t ->
      list_impersonation_roles_request ->
        (list_impersonation_roles_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Lists all the impersonation roles for the given WorkMail organization.
 *)

  
end

module ListMailboxExportJobs : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mailbox_export_jobs_request ->
        (list_mailbox_export_jobs_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Lists the mailbox export jobs started for the specified organization within the last seven days.
 *)

  
end

module ListMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mailbox_permissions_request ->
        (list_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Lists the mailbox permissions associated with a user, group, or resource mailbox.
 *)

  
end

module ListMailDomains : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mail_domains_request ->
        (list_mail_domains_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Lists the mail domains in a given WorkMail organization.
 *)

  
end

module ListMobileDeviceAccessOverrides : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_device_access_overrides_request ->
        (list_mobile_device_access_overrides_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Lists all the mobile device access overrides for any given combination of WorkMail organization, user, or device.
 *)

  
end

module ListMobileDeviceAccessRules : sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_device_access_rules_request ->
        (list_mobile_device_access_rules_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Lists the mobile device access rules for the specified WorkMail organization.
 *)

  
end

module ListOrganizations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_organizations_request ->
        (list_organizations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            
        ]
      ) result
  (** Returns summaries of the customer's organizations.
 *)

  
end

module ListResourceDelegates : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resource_delegates_request ->
        (list_resource_delegates_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Lists the delegates associated with a resource. Users and groups can be resource delegates and answer requests on behalf of the resource.
 *)

  
end

module ListResources : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_request ->
        (list_resources_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Returns summaries of the organization's resources.
 *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Lists the tags applied to an WorkMail organization resource.
 *)

  
end

module ListUsers : sig
  val request :
    Smaws_Lib.Context.t ->
      list_users_request ->
        (list_users_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Returns summaries of the organization's users.
 *)

  
end

module PutAccessControlRule : sig
  val request :
    Smaws_Lib.Context.t ->
      put_access_control_rule_request ->
        (put_access_control_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Adds a new access control rule for the specified organization. The rule allows or denies access to the organization for the specified IPv4 addresses, access protocol actions, user IDs and impersonation IDs. Adding a new rule with the same name as an existing rule replaces the older rule.
 *)

  
end

module PutEmailMonitoringConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      put_email_monitoring_configuration_request ->
        (put_email_monitoring_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Creates or updates the email monitoring configuration for a specified organization.
 *)

  
end

module PutInboundDmarcSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      put_inbound_dmarc_settings_request ->
        (put_inbound_dmarc_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Enables or disables a DMARC policy for a given organization.
 *)

  
end

module PutMailboxPermissions : sig
  val request :
    Smaws_Lib.Context.t ->
      put_mailbox_permissions_request ->
        (put_mailbox_permissions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Sets permissions for a user, group, or resource. This replaces any pre-existing permissions.
 *)

  
end

module PutMobileDeviceAccessOverride : sig
  val request :
    Smaws_Lib.Context.t ->
      put_mobile_device_access_override_request ->
        (put_mobile_device_access_override_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Creates or updates a mobile device access override for the given WorkMail organization, user, and device.
 *)

  
end

module PutRetentionPolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_retention_policy_request ->
        (put_retention_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Puts a retention policy to the specified organization.
 *)

  
end

module RegisterMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      register_mail_domain_request ->
        (register_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `MailDomainInUseException of mail_domain_in_use_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Registers a new domain in WorkMail and SES, and configures it for use by WorkMail. Emails received by SES for this domain are routed to the specified WorkMail organization, and WorkMail has permanent permission to use the specified domain for sending your users' emails.
 *)

  
end

module RegisterToWorkMail : sig
  val request :
    Smaws_Lib.Context.t ->
      register_to_work_mail_request ->
        (register_to_work_mail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityAlreadyRegisteredException of entity_already_registered_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Registers an existing and disabled user, group, or resource for WorkMail use by associating a mailbox and calendaring capabilities. It performs no change if the user, group, or resource is enabled and fails if the user, group, or resource is deleted. This operation results in the accumulation of costs. For more information, see {{:https://aws.amazon.com/workmail/pricing}Pricing}. The equivalent console functionality for this operation is {i Enable}.

 Users can either be created by calling the [CreateUser] API operation or they can be synchronized from your directory. For more information, see [DeregisterFromWorkMail].
  *)

  
end

module ResetPassword : sig
  val request :
    Smaws_Lib.Context.t ->
      reset_password_request ->
        (reset_password_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidPasswordException of invalid_password_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Allows the administrator to reset the password for a user.
 *)

  
end

module StartMailboxExportJob : sig
  val request :
    Smaws_Lib.Context.t ->
      start_mailbox_export_job_request ->
        (start_mailbox_export_job_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Starts a mailbox export job to export MIME-format email messages and calendar items from the specified mailbox to the specified Amazon Simple Storage Service (Amazon S3) bucket. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/mail-export.html}Exporting mailbox content} in the {i WorkMail Administrator Guide}.
 *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** Applies the specified tags to the specified WorkMailorganization resource.
 *)

  
end

module TestAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      test_availability_configuration_request ->
        (test_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Performs a test on an availability provider to ensure that access is allowed. For EWS, it verifies the provided credentials can be used to successfully log in. For Lambda, it verifies that the Lambda function can be invoked and that the resource access policy was configured to deny anonymous access. An anonymous invocation is one done without providing either a [SourceArn] or [SourceAccount] header.

  The request must contain either one provider definition ([EwsProvider] or [LambdaProvider]) or the [DomainName] parameter. If the [DomainName] parameter is provided, the configuration stored under the [DomainName] will be tested.
  
    *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Untags the specified tags from the specified WorkMail organization resource.
 *)

  
end

module UpdateAvailabilityConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_availability_configuration_request ->
        (update_availability_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Updates an existing [AvailabilityConfiguration] for the given WorkMail organization and domain.
 *)

  
end

module UpdateDefaultMailDomain : sig
  val request :
    Smaws_Lib.Context.t ->
      update_default_mail_domain_request ->
        (update_default_mail_domain_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Updates the default mail domain for an organization. The default mail domain is used by the WorkMail AWS Console to suggest an email address when enabling a mail user. You can only have one default domain.
 *)

  
end

module UpdateGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_group_request ->
        (update_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Updates attibutes in a group.
 *)

  
end

module UpdateImpersonationRole : sig
  val request :
    Smaws_Lib.Context.t ->
      update_impersonation_role_request ->
        (update_impersonation_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitExceededException of limit_exceeded_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Updates an impersonation role for the given WorkMail organization.
 *)

  
end

module UpdateMailboxQuota : sig
  val request :
    Smaws_Lib.Context.t ->
      update_mailbox_quota_request ->
        (update_mailbox_quota_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Updates a user's current mailbox quota for a specified organization and user.
 *)

  
end

module UpdateMobileDeviceAccessRule : sig
  val request :
    Smaws_Lib.Context.t ->
      update_mobile_device_access_rule_request ->
        (update_mobile_device_access_rule_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EntityNotFoundException of entity_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            
        ]
      ) result
  (** Updates a mobile device access rule for the specified WorkMail organization.
 *)

  
end

module UpdatePrimaryEmailAddress : sig
  val request :
    Smaws_Lib.Context.t ->
      update_primary_email_address_request ->
        (update_primary_email_address_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Updates the primary email for a user, group, or resource. The current email is moved into the list of aliases (or swapped between an existing alias and the current primary email), and the email provided in the input is promoted as the primary.
 *)

  
end

module UpdateResource : sig
  val request :
    Smaws_Lib.Context.t ->
      update_resource_request ->
        (update_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryUnavailableException of directory_unavailable_exception
            | `EmailAddressInUseException of email_address_in_use_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidConfigurationException of invalid_configuration_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `MailDomainNotFoundException of mail_domain_not_found_exception
            | `MailDomainStateException of mail_domain_state_exception
            | `NameAvailabilityException of name_availability_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Updates data for the resource. To have the latest information, it must be preceded by a [DescribeResource] call. The dataset in the request should be the one expected when performing another [DescribeResource] call.
 *)

  
end

module UpdateUser : sig
  val request :
    Smaws_Lib.Context.t ->
      update_user_request ->
        (update_user_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DirectoryServiceAuthenticationFailedException of directory_service_authentication_failed_exception
            | `DirectoryUnavailableException of directory_unavailable_exception
            | `EntityNotFoundException of entity_not_found_exception
            | `EntityStateException of entity_state_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OrganizationNotFoundException of organization_not_found_exception
            | `OrganizationStateException of organization_state_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** Updates data for the user. To have the latest information, it must be preceded by a [DescribeUser] call. The dataset in the request should be the one expected when performing another [DescribeUser] call.
 *)

  
end

