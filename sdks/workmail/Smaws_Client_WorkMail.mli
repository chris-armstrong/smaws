(** 
    WorkMail client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec unsupported_operation_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You can't perform a write operation against a read-only directory.\n"]
type nonrec organization_state_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The organization must have a valid state to perform certain operations on the organization or its members.\n"]
type nonrec organization_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "An operation received a valid organization identifier that either doesn't belong or exist in the system.\n"]
type nonrec invalid_parameter_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "One or more of the input parameters don't match the service's restrictions.\n"]
type nonrec entity_state_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You are performing an operation on a user, group, or resource that isn't in the expected state, such as trying to delete an active user.\n"]
type nonrec entity_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The identifier supplied for the user, group, or resource does not exist in your organization.\n"]
type nonrec directory_unavailable_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The directory is unavailable. It might be located in another Region or deleted.\n"]
type nonrec directory_service_authentication_failed_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The directory service doesn't recognize the credentials supplied by WorkMail.\n"]
type nonrec user_role =
  | REMOTE_USER [@ocaml.doc ""]
  | SYSTEM_USER [@ocaml.doc ""]
  | RESOURCE [@ocaml.doc ""]
  | USER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_user_request =
  {
  identity_provider_user_id: string option
    [@ocaml.doc
      "User ID from the IAM Identity Center. If this parameter is empty it will be updated automatically when the user logs in for the first time to the mailbox associated with WorkMail.\n"];
  office: string option [@ocaml.doc "Updates the user's office.\n"];
  country: string option [@ocaml.doc "Updates the user's country.\n"];
  department: string option [@ocaml.doc "Updates the user's department.\n"];
  zip_code: string option [@ocaml.doc "Updates the user's zip code.\n"];
  company: string option [@ocaml.doc "Updates the user's company.\n"];
  city: string option [@ocaml.doc "Updates the user's city.\n"];
  job_title: string option [@ocaml.doc "Updates the user's job title.\n"];
  street: string option [@ocaml.doc "Updates the user's street address.\n"];
  telephone: string option
    [@ocaml.doc "Updates the user's contact details.\n"];
  initials: string option [@ocaml.doc "Updates the user's initials.\n"];
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If enabled, the user is hidden from the global address list.\n"];
  last_name: string option [@ocaml.doc "Updates the user's last name.\n"];
  first_name: string option [@ocaml.doc "Updates the user's first name.\n"];
  display_name: string option
    [@ocaml.doc "Updates the display name of the user.\n"];
  role: user_role option
    [@ocaml.doc
      "Updates the user role.\n\n You cannot pass {i SYSTEM_USER} or {i RESOURCE}.\n "];
  user_id: string
    [@ocaml.doc
      "The identifier for the user to be updated.\n\n The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: user\\@domain.tld\n            \n             }\n        {-  User name: user\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the user exists.\n"]}
[@@ocaml.doc ""]
type nonrec name_availability_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The user, group, or resource name isn't unique in WorkMail.\n"]
type nonrec mail_domain_state_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "After a domain has been added to the organization, it must be verified. The domain is not yet verified.\n"]
type nonrec mail_domain_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The domain specified is not found in your organization.\n"]
type nonrec invalid_configuration_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The configuration for a resource isn't valid. A resource must either be able to auto-respond to requests or have at least one delegate associated that can do so on its behalf.\n"]
type nonrec email_address_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The email address that you're trying to assign is already created for a different user, group, or resource.\n"]
type nonrec booking_options =
  {
  auto_decline_conflicting_requests: bool option
    [@ocaml.doc
      "The resource's ability to automatically decline any conflicting requests.\n"];
  auto_decline_recurring_requests: bool option
    [@ocaml.doc
      "The resource's ability to automatically decline any recurring requests.\n"];
  auto_accept_requests: bool option
    [@ocaml.doc
      "The resource's ability to automatically reply to requests. If disabled, delegates must be associated to the resource.\n"]}
[@@ocaml.doc
  "At least one delegate must be associated to the resource to disable automatic replies from the resource.\n"]
type nonrec resource_type =
  | EQUIPMENT [@ocaml.doc ""]
  | ROOM [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_resource_request =
  {
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If enabled, the resource is hidden from the global address list.\n"];
  type_: resource_type option [@ocaml.doc "Updates the resource type.\n"];
  description: string option
    [@ocaml.doc "Updates the resource description.\n"];
  booking_options: booking_options option
    [@ocaml.doc "The resource's booking options to be updated.\n"];
  name: string option
    [@ocaml.doc "The name of the resource to be updated.\n"];
  resource_id: string
    [@ocaml.doc
      "The identifier of the resource to be updated.\n\n The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Resource ID: r-0123456789a0123456789b0123456789\n            \n             }\n        {-  Email address: resource\\@domain.tld\n            \n             }\n        {-  Resource name: resource\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier associated with the organization for which the resource is updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_primary_email_address_request =
  {
  email: string
    [@ocaml.doc "The value of the email to be updated as primary.\n"];
  entity_id: string
    [@ocaml.doc
      "The user, group, or resource to update.\n\n The identifier can accept {i UseriD, ResourceId, or GroupId}, {i Username, Resourcename, or Groupname}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity name: entity\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The organization that contains the user, group, or resource to update.\n"]}
[@@ocaml.doc ""]
type nonrec mobile_device_access_rule_effect =
  | DENY [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_mobile_device_access_rule_request =
  {
  not_device_user_agents: string list option
    [@ocaml.doc
      "User agents that the updated rule {b will not} match. All other user agents will match.\n"];
  device_user_agents: string list option
    [@ocaml.doc "User agents that the updated rule will match.\n"];
  not_device_operating_systems: string list option
    [@ocaml.doc
      "Device operating systems that the updated rule {b will not} match. All other device operating systems will match.\n"];
  device_operating_systems: string list option
    [@ocaml.doc
      "Device operating systems that the updated rule will match.\n"];
  not_device_models: string list option
    [@ocaml.doc
      "Device models that the updated rule {b will not} match. All other device models will match.\n"];
  device_models: string list option
    [@ocaml.doc "Device models that the updated rule will match.\n"];
  not_device_types: string list option
    [@ocaml.doc
      "Device types that the updated rule {b will not} match. All other device types will match.\n"];
  device_types: string list option
    [@ocaml.doc "Device types that the updated rule will match.\n"];
  effect_: mobile_device_access_rule_effect
    [@ocaml.doc
      "The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].\n"];
  description: string option [@ocaml.doc "The updated rule description.\n"];
  name: string [@ocaml.doc "The updated rule name.\n"];
  mobile_device_access_rule_id: string
    [@ocaml.doc "The identifier of the rule to be updated.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization under which the rule will be updated.\n"]}
[@@ocaml.doc ""]
type nonrec update_mailbox_quota_request =
  {
  mailbox_quota: int
    [@ocaml.doc
      "The updated mailbox quota, in MB, for the specified user.\n"];
  user_id: string
    [@ocaml.doc
      "The identifer for the user for whom to update the mailbox quota.\n\n The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: user\\@domain.tld\n            \n             }\n        {-  User name: user\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization that contains the user for whom to update the mailbox quota.\n"]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The resource cannot be found.\n"]
type nonrec limit_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request exceeds the limit of the resource.\n"]
type nonrec impersonation_role_type =
  | READ_ONLY [@ocaml.doc ""]
  | FULL_ACCESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec access_effect =
  | DENY [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec impersonation_rule =
  {
  not_target_users: string list option
    [@ocaml.doc "A list of user IDs that don't match the rule.\n"];
  target_users: string list option
    [@ocaml.doc "A list of user IDs that match the rule.\n"];
  effect_: access_effect
    [@ocaml.doc
      "The effect of the rule when it matches the input. Allowed effect values are [ALLOW] or [DENY].\n"];
  description: string option [@ocaml.doc "The rule description.\n"];
  name: string option [@ocaml.doc "The rule name.\n"];
  impersonation_rule_id: string [@ocaml.doc "The identifier of the rule.\n"]}
[@@ocaml.doc "The rules for the given impersonation role.\n"]
type nonrec update_impersonation_role_request =
  {
  rules: impersonation_rule list [@ocaml.doc "The updated list of rules.\n"];
  description: string option
    [@ocaml.doc "The updated impersonation role description.\n"];
  type_: impersonation_role_type
    [@ocaml.doc "The updated impersonation role type.\n"];
  name: string [@ocaml.doc "The updated impersonation role name.\n"];
  impersonation_role_id: string
    [@ocaml.doc "The ID of the impersonation role to update.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization that contains the impersonation role to update.\n"]}
[@@ocaml.doc ""]
type nonrec update_group_request =
  {
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If enabled, the group is hidden from the global address list.\n"];
  group_id: string
    [@ocaml.doc
      "The identifier for the group to be updated.\n\n The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: group\\@domain.tld\n            \n             }\n        {-  Group name: group\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the group exists.\n"]}
[@@ocaml.doc ""]
type nonrec update_default_mail_domain_request =
  {
  domain_name: string
    [@ocaml.doc "The domain name that will become the default domain.\n"];
  organization_id: string
    [@ocaml.doc "The WorkMail organization for which to list domains.\n"]}
[@@ocaml.doc ""]
type nonrec ews_availability_provider =
  {
  ews_password: string
    [@ocaml.doc "The password used to authenticate the remote EWS server.\n"];
  ews_username: string
    [@ocaml.doc "The username used to authenticate the remote EWS server.\n"];
  ews_endpoint: string
    [@ocaml.doc "The endpoint of the remote EWS server.\n"]}[@@ocaml.doc
                                                              "Describes an EWS based availability provider. This is only used as input to the service.\n"]
type nonrec lambda_availability_provider =
  {
  lambda_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Lambda that acts as the availability provider.\n"]}
[@@ocaml.doc "Describes a Lambda based availability provider.\n"]
type nonrec update_availability_configuration_request =
  {
  lambda_provider: lambda_availability_provider option
    [@ocaml.doc
      "The Lambda availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider]. The previously stored provider will be overridden by the one provided.\n"];
  ews_provider: ews_availability_provider option
    [@ocaml.doc
      "The EWS availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider]. The previously stored provider will be overridden by the one provided.\n"];
  domain_name: string
    [@ocaml.doc
      "The domain to which the provider applies the availability configuration.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization for which the [AvailabilityConfiguration] will be updated.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list [@ocaml.doc "The tag keys.\n"];
  resource_ar_n: string [@ocaml.doc "The resource ARN.\n"]}[@@ocaml.doc ""]
type nonrec test_availability_configuration_response =
  {
  failure_reason: string option
    [@ocaml.doc
      "String containing the reason for a failed test if [TestPassed] is false.\n"];
  test_passed: bool option
    [@ocaml.doc "Boolean indicating whether the test passed or failed.\n"]}
[@@ocaml.doc ""]
type nonrec test_availability_configuration_request =
  {
  lambda_provider: lambda_availability_provider option [@ocaml.doc ""];
  ews_provider: ews_availability_provider option [@ocaml.doc ""];
  domain_name: string option
    [@ocaml.doc
      "The domain to which the provider applies. If this field is provided, a stored availability provider associated to this domain name will be tested.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization where the availability provider will be tested.\n"]}
[@@ocaml.doc ""]
type nonrec too_many_tags_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The resource can have up to 50 user-applied tags.\n"]
type nonrec tag =
  {
  value: string [@ocaml.doc "The value of the tag.\n"];
  key: string [@ocaml.doc "The key of the tag.\n"]}[@@ocaml.doc
                                                     "Describes a tag applied to a resource.\n"]
type nonrec tag_resource_request =
  {
  tags: tag list [@ocaml.doc "The tag key-value pairs.\n"];
  resource_ar_n: string [@ocaml.doc "The resource ARN.\n"]}[@@ocaml.doc ""]
type nonrec start_mailbox_export_job_response =
  {
  job_id: string option [@ocaml.doc "The job ID.\n"]}[@@ocaml.doc ""]
type nonrec start_mailbox_export_job_request =
  {
  s3_prefix: string [@ocaml.doc "The S3 bucket prefix.\n"];
  s3_bucket_name: string [@ocaml.doc "The name of the S3 bucket.\n"];
  kms_key_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key that encrypts the exported mailbox content.\n"];
  role_arn: string
    [@ocaml.doc
      "The ARN of the AWS Identity and Access Management (IAM) role that grants write permission to the S3 bucket.\n"];
  description: string option
    [@ocaml.doc "The mailbox export job description.\n"];
  entity_id: string
    [@ocaml.doc
      "The identifier of the user or resource associated with the mailbox.\n\n The identifier can accept {i UserId or ResourceId}, {i Username or Resourcename}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789 , or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity name: entity\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc "The identifier associated with the organization.\n"];
  client_token: string
    [@ocaml.doc "The idempotency token for the client request.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec invalid_password_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The supplied password doesn't match the minimum security constraints, such as length or use of special characters.\n"]
type nonrec reset_password_request =
  {
  password: string [@ocaml.doc "The new password for the user.\n"];
  user_id: string
    [@ocaml.doc
      "The identifier of the user for whom the password is reset.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier of the organization that contains the user for which the password is reset.\n"]}
[@@ocaml.doc ""]
type nonrec entity_already_registered_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The user, group, or resource that you're trying to register is already registered.\n"]
type nonrec register_to_work_mail_request =
  {
  email: string
    [@ocaml.doc
      "The email for the user, group, or resource to be updated.\n"];
  entity_id: string
    [@ocaml.doc
      "The identifier for the user, group, or resource to be updated.\n\n The identifier can accept {i UserId, ResourceId, or GroupId}, or {i Username, Resourcename, or Groupname}. The following identity formats are available:\n \n  {ul\n        {-  Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Entity name: entity\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the user, group, or resource exists.\n"]}
[@@ocaml.doc ""]
type nonrec mail_domain_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The domain you're trying to change is in use by another user or organization in your account. See the error message for details.\n"]
type nonrec register_mail_domain_request =
  {
  domain_name: string
    [@ocaml.doc
      "The name of the mail domain to create in WorkMail and SES.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization under which you're creating the domain.\n"];
  client_token: string option
    [@ocaml.doc "Idempotency token used when retrying requests.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec folder_name =
  | JUNK_EMAIL [@ocaml.doc ""]
  | DRAFTS [@ocaml.doc ""]
  | SENT_ITEMS [@ocaml.doc ""]
  | DELETED_ITEMS [@ocaml.doc ""]
  | INBOX [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec retention_action =
  | PERMANENTLY_DELETE [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
  | NONE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec folder_configuration =
  {
  period: int option
    [@ocaml.doc
      "The number of days for which the folder-configuration action applies.\n"];
  action: retention_action
    [@ocaml.doc
      "The action to take on the folder contents at the end of the folder configuration period.\n"];
  name: folder_name [@ocaml.doc "The folder name.\n"]}[@@ocaml.doc
                                                        "The configuration applied to an organization's folders by its retention policy.\n"]
type nonrec put_retention_policy_request =
  {
  folder_configurations: folder_configuration list
    [@ocaml.doc "The retention policy folder configurations.\n"];
  description: string option
    [@ocaml.doc "The retention policy description.\n"];
  name: string [@ocaml.doc "The retention policy name.\n"];
  id: string option [@ocaml.doc "The retention policy ID.\n"];
  organization_id: string [@ocaml.doc "The organization ID.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec put_mobile_device_access_override_request =
  {
  description: string option [@ocaml.doc "A description of the override.\n"];
  effect_: mobile_device_access_rule_effect
    [@ocaml.doc "The effect of the override, [ALLOW] or [DENY].\n"];
  device_id: string
    [@ocaml.doc
      "The mobile device for which you create the override. [DeviceId] is case insensitive.\n"];
  user_id: string
    [@ocaml.doc
      "The WorkMail user for which you create the override. Accepts the following types of user identities:\n\n {ul\n       {-  User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234] \n           \n            }\n       {-  Email address: [user@domain.tld] \n           \n            }\n       {-  User name: [user] \n           \n            }\n       }\n  "];
  organization_id: string
    [@ocaml.doc
      "Identifies the WorkMail organization for which you create the override.\n"]}
[@@ocaml.doc ""]
type nonrec permission_type =
  | SEND_ON_BEHALF [@ocaml.doc ""]
  | SEND_AS [@ocaml.doc ""]
  | FULL_ACCESS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec put_mailbox_permissions_request =
  {
  permission_values: permission_type list
    [@ocaml.doc
      "The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other folder-level permissions set on the mailbox.\n"];
  grantee_id: string
    [@ocaml.doc
      "The identifier of the user, group, or resource to which to grant the permissions.\n\n The identifier can be {i UserId, ResourceID, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.\n \n  {ul\n        {-  Grantee ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: grantee\\@domain.tld\n            \n             }\n        {-  Grantee name: grantee\n            \n             }\n        }\n  "];
  entity_id: string
    [@ocaml.doc
      "The identifier of the user or resource for which to update mailbox permissions.\n\n The identifier can be {i UserId, ResourceID, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.\n \n  {ul\n        {-  Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity name: entity\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier of the organization under which the user, group, or resource exists.\n"]}
[@@ocaml.doc ""]
type nonrec put_inbound_dmarc_settings_request =
  {
  enforced: bool
    [@ocaml.doc "Enforces or suspends a policy after it's applied.\n"];
  organization_id: string
    [@ocaml.doc
      "The ID of the organization that you are applying the DMARC policy to.\n"]}
[@@ocaml.doc ""]
type nonrec identity_provider_authentication_mode =
  | IDENTITY_PROVIDER_AND_DIRECTORY [@ocaml.doc ""]
  | IDENTITY_PROVIDER_ONLY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec identity_center_configuration =
  {
  application_arn: string
    [@ocaml.doc
      " The Amazon Resource Name (ARN) of IAMIdentity Center Application for WorkMail. Must be created by the WorkMail API, see CreateIdentityCenterApplication.\n"];
  instance_arn: string
    [@ocaml.doc
      " The Amazon Resource Name (ARN) of the of IAM Identity Center instance. Must be in the same AWS account and region as WorkMail organization.\n"]}
[@@ocaml.doc " The IAM Identity Center configuration. \n"]
type nonrec personal_access_token_configuration_status =
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec personal_access_token_configuration =
  {
  lifetime_in_days: int option
    [@ocaml.doc
      " The validity of the Personal Access Token status in days. \n"];
  status: personal_access_token_configuration_status
    [@ocaml.doc
      " The status of the Personal Access Token allowed for the organization. \n\n {ul\n       {-   {i Active} - Mailbox users can login to the web application and choose {i Settings} to see the new {i Personal Access Tokens} page to create and delete the Personal Access Tokens. Mailbox users can use the Personal Access Tokens to set up mailbox connection from desktop or mobile email clients.\n           \n            }\n       {-   {i Inactive} - Personal Access Tokens are disabled for your organization. Mailbox users can\226\128\153t create, list, or delete Personal Access Tokens and can\226\128\153t use them to connect to their mailboxes from desktop or mobile email clients.\n           \n            }\n       }\n  "]}
[@@ocaml.doc " Displays the Personal Access Token status. \n"]
type nonrec put_identity_provider_configuration_request =
  {
  personal_access_token_configuration: personal_access_token_configuration
    [@ocaml.doc
      " The details of the Personal Access Token configuration. \n"];
  identity_center_configuration: identity_center_configuration
    [@ocaml.doc " The details of the IAM Identity Center configuration.\n"];
  authentication_mode: identity_provider_authentication_mode
    [@ocaml.doc " The authentication mode used in WorkMail.\n"];
  organization_id: string
    [@ocaml.doc " The ID of the WorkMail Organization. \n"]}[@@ocaml.doc ""]
type nonrec put_email_monitoring_configuration_request =
  {
  log_group_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email monitoring configuration.\n"];
  role_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring configuration.\n"];
  organization_id: string
    [@ocaml.doc
      "The ID of the organization for which the email monitoring configuration is set.\n"]}
[@@ocaml.doc ""]
type nonrec access_control_rule_effect =
  | DENY [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec put_access_control_rule_request =
  {
  not_impersonation_role_ids: string list option
    [@ocaml.doc "Impersonation role IDs to exclude from the rule.\n"];
  impersonation_role_ids: string list option
    [@ocaml.doc "Impersonation role IDs to include in the rule.\n"];
  organization_id: string
    [@ocaml.doc "The identifier of the organization.\n"];
  not_user_ids: string list option
    [@ocaml.doc "User IDs to exclude from the rule.\n"];
  user_ids: string list option
    [@ocaml.doc "User IDs to include in the rule.\n"];
  not_actions: string list option
    [@ocaml.doc
      "Access protocol actions to exclude from the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"];
  actions: string list option
    [@ocaml.doc
      "Access protocol actions to include in the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"];
  not_ip_ranges: string list option
    [@ocaml.doc "IPv4 CIDR ranges to exclude from the rule.\n"];
  ip_ranges: string list option
    [@ocaml.doc "IPv4 CIDR ranges to include in the rule.\n"];
  description: string [@ocaml.doc "The rule description.\n"];
  effect_: access_control_rule_effect [@ocaml.doc "The rule effect.\n"];
  name: string [@ocaml.doc "The rule name.\n"]}[@@ocaml.doc ""]
type nonrec entity_state =
  | DELETED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec user =
  {
  identity_provider_identity_store_id: string option
    [@ocaml.doc
      "Identity store ID from the IAM Identity Center. If this parameter is empty it will be updated automatically when the user logs in for the first time to the mailbox associated with WorkMail.\n"];
  identity_provider_user_id: string option
    [@ocaml.doc
      "User ID from the IAM Identity Center. If this parameter is empty it will be updated automatically when the user logs in for the first time to the mailbox associated with WorkMail.\n"];
  disabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date indicating when the user was disabled from WorkMail use.\n"];
  enabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date indicating when the user was enabled for WorkMail use.\n"];
  user_role: user_role option [@ocaml.doc "The role of the user.\n"];
  state: entity_state option
    [@ocaml.doc
      "The state of the user, which can be ENABLED, DISABLED, or DELETED.\n"];
  display_name: string option [@ocaml.doc "The display name of the user.\n"];
  name: string option [@ocaml.doc "The name of the user.\n"];
  email: string option [@ocaml.doc "The email of the user.\n"];
  id: string option [@ocaml.doc "The identifier of the user.\n"]}[@@ocaml.doc
                                                                   "The representation of an WorkMail user.\n"]
type nonrec list_users_response =
  {
  next_token: string option
    [@ocaml.doc
      " The token to use to retrieve the next page of results. This value is `null` when there are no more results to return.\n"];
  users: user list option
    [@ocaml.doc "The overview of users for an organization.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec list_users_filters =
  {
  identity_provider_user_id_prefix: string option
    [@ocaml.doc
      "Filters only users with the ID from the IAM Identity Center.\n"];
  state: entity_state option
    [@ocaml.doc "Filters only users with the provided state.\n"];
  primary_email_prefix: string option
    [@ocaml.doc "Filters only users with the provided email prefix.\n"];
  display_name_prefix: string option
    [@ocaml.doc
      "Filters only users with the provided display name prefix.\n"];
  username_prefix: string option
    [@ocaml.doc "Filters only users with the provided username prefix.\n"]}
[@@ocaml.doc
  " Filtering options for {i ListUsers} operation. This is only used as input to Operation.\n"]
type nonrec list_users_request =
  {
  filters: list_users_filters option
    [@ocaml.doc
      "Limit the user search results based on the filter criteria. You can only use one filter per request.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the users exist.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option [@ocaml.doc "A list of tag key-value pairs.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string [@ocaml.doc "The resource ARN.\n"]}[@@ocaml.doc ""]
type nonrec resource =
  {
  description: string option [@ocaml.doc "Resource description.\n"];
  disabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date indicating when the resource was disabled from WorkMail use.\n"];
  enabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date indicating when the resource was enabled for WorkMail use.\n"];
  state: entity_state option
    [@ocaml.doc
      "The state of the resource, which can be ENABLED, DISABLED, or DELETED.\n"];
  type_: resource_type option
    [@ocaml.doc "The type of the resource: equipment or room.\n"];
  name: string option [@ocaml.doc "The name of the resource.\n"];
  email: string option [@ocaml.doc "The email of the resource.\n"];
  id: string option [@ocaml.doc "The identifier of the resource.\n"]}
[@@ocaml.doc "The representation of a resource.\n"]
type nonrec list_resources_response =
  {
  next_token: string option
    [@ocaml.doc
      " The token used to paginate through all the organization's resources. While results are still available, it has an associated value. When the last page is reached, the token is empty.\n"];
  resources: resource list option
    [@ocaml.doc "One page of the organization's resource representation.\n"]}
[@@ocaml.doc ""]
type nonrec list_resources_filters =
  {
  state: entity_state option
    [@ocaml.doc "Filters only resource with the provided state.\n"];
  primary_email_prefix: string option
    [@ocaml.doc
      "Filters only resource with the provided primary email prefix.\n"];
  name_prefix: string option
    [@ocaml.doc
      "Filters only resource that start with the entered name prefix .\n"]}
[@@ocaml.doc
  "Filtering options for {i ListResources} operation. This is only used as input to Operation.\n"]
type nonrec list_resources_request =
  {
  filters: list_resources_filters option
    [@ocaml.doc
      "Limit the resource search results based on the filter criteria. You can only use one filter per request.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the resources exist.\n"]}
[@@ocaml.doc ""]
type nonrec member_type =
  | USER [@ocaml.doc ""]
  | GROUP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec delegate =
  {
  type_: member_type
    [@ocaml.doc "The type of the delegate: user or group.\n"];
  id: string
    [@ocaml.doc
      "The identifier for the user or group associated as the resource's delegate.\n"]}
[@@ocaml.doc
  "The name of the attribute, which is one of the values defined in the UserAttribute enumeration.\n"]
type nonrec list_resource_delegates_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token used to paginate through the delegates associated with a resource. While results are still available, it has an associated value. When the last page is reached, the token is empty.\n"];
  delegates: delegate list option
    [@ocaml.doc "One page of the resource's delegates.\n"]}[@@ocaml.doc ""]
type nonrec list_resource_delegates_request =
  {
  max_results: int option
    [@ocaml.doc "The number of maximum results in a page.\n"];
  next_token: string option
    [@ocaml.doc
      "The token used to paginate through the delegates associated with a resource.\n"];
  resource_id: string
    [@ocaml.doc
      "The identifier for the resource whose delegates are listed.\n\n The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Resource ID: r-0123456789a0123456789b0123456789\n            \n             }\n        {-  Email address: resource\\@domain.tld\n            \n             }\n        {-  Resource name: resource\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization that contains the resource for which delegates are listed.\n"]}
[@@ocaml.doc ""]
type nonrec personal_access_token_summary =
  {
  scopes: string list option
    [@ocaml.doc
      " Lists all the Personal Access Token permissions for a mailbox. \n"];
  expires_time: CoreTypes.Timestamp.t option
    [@ocaml.doc " The date when the Personal Access Token will expire. \n"];
  date_last_used: CoreTypes.Timestamp.t option
    [@ocaml.doc " The date when the Personal Access Token was last used. \n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc " The date when the Personal Access Token was created. \n"];
  name: string option
    [@ocaml.doc " The name of the Personal Access Token. \n"];
  user_id: string option
    [@ocaml.doc
      " The user ID of the WorkMail user associated with the Personal Access Token. \n"];
  personal_access_token_id: string option
    [@ocaml.doc " The ID of the Personal Access Token. \n"]}[@@ocaml.doc
                                                              " The summary of the Personal Access Token. \n"]
type nonrec list_personal_access_tokens_response =
  {
  personal_access_token_summaries: personal_access_token_summary list option
    [@ocaml.doc
      " Lists all the personal tokens in an organization or user, if user ID is provided. \n"];
  next_token: string option
    [@ocaml.doc
      " The token from the previous response to query the next page.\n"]}
[@@ocaml.doc ""]
type nonrec list_personal_access_tokens_request =
  {
  max_results: int option
    [@ocaml.doc
      " The maximum amount of items that should be returned in a response. \n"];
  next_token: string option
    [@ocaml.doc
      " The token from the previous response to query the next page.\n"];
  user_id: string option [@ocaml.doc " The WorkMail User ID. \n"];
  organization_id: string [@ocaml.doc " The Organization ID. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec organization_summary =
  {
  state: string option
    [@ocaml.doc "The state associated with the organization.\n"];
  error_message: string option
    [@ocaml.doc
      "The error message associated with the organization. It is only present if unexpected behavior has occurred with regards to the organization. It provides insight or solutions regarding unexpected behavior.\n"];
  default_mail_domain: string option
    [@ocaml.doc
      "The default email domain associated with the organization.\n"];
  alias: string option
    [@ocaml.doc "The alias associated with the organization.\n"];
  organization_id: string option
    [@ocaml.doc "The identifier associated with the organization.\n"]}
[@@ocaml.doc "The representation of an organization.\n"]
type nonrec list_organizations_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The value is \"null\" when there are no more results to return.\n"];
  organization_summaries: organization_summary list option
    [@ocaml.doc
      "The overview of owned organizations presented as a list of organization summaries.\n"]}
[@@ocaml.doc ""]
type nonrec list_organizations_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"]}
[@@ocaml.doc ""]
type nonrec mobile_device_access_rule =
  {
  date_modified: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time at which an access rule was modified.\n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time at which an access rule was created.\n"];
  not_device_user_agents: string list option
    [@ocaml.doc
      "Device user agents that a rule {b will not} match. All other device user agents will match.\n"];
  device_user_agents: string list option
    [@ocaml.doc "Device user agents that a rule will match.\n"];
  not_device_operating_systems: string list option
    [@ocaml.doc
      "Device operating systems that a rule {b will not} match. All other device types will match.\n"];
  device_operating_systems: string list option
    [@ocaml.doc "Device operating systems that a rule will match.\n"];
  not_device_models: string list option
    [@ocaml.doc
      "Device models that a rule {b will not} match. All other device models will match.\n"];
  device_models: string list option
    [@ocaml.doc "Device models that a rule will match.\n"];
  not_device_types: string list option
    [@ocaml.doc
      "Device types that a rule {b will not} match. All other device types will match.\n"];
  device_types: string list option
    [@ocaml.doc "Device types that a rule will match.\n"];
  effect_: mobile_device_access_rule_effect option
    [@ocaml.doc
      "The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].\n"];
  description: string option
    [@ocaml.doc "The description of a mobile access rule.\n"];
  name: string option [@ocaml.doc "The name of a mobile access rule.\n"];
  mobile_device_access_rule_id: string option
    [@ocaml.doc "The ID assigned to a mobile access rule.\n"]}[@@ocaml.doc
                                                                "A rule that controls access to mobile devices for an WorkMail group.\n"]
type nonrec list_mobile_device_access_rules_response =
  {
  rules: mobile_device_access_rule list option
    [@ocaml.doc
      "The list of mobile device access rules that exist under the specified WorkMail organization.\n"]}
[@@ocaml.doc ""]
type nonrec list_mobile_device_access_rules_request =
  {
  organization_id: string
    [@ocaml.doc "The WorkMail organization for which to list the rules.\n"]}
[@@ocaml.doc ""]
type nonrec mobile_device_access_override =
  {
  date_modified: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date the override was last modified.\n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date the override was first created.\n"];
  description: string option [@ocaml.doc "A description of the override.\n"];
  effect_: mobile_device_access_rule_effect option
    [@ocaml.doc "The effect of the override, [ALLOW] or [DENY].\n"];
  device_id: string option
    [@ocaml.doc "The device to which the override applies.\n"];
  user_id: string option
    [@ocaml.doc "The WorkMail user to which the access override applies.\n"]}
[@@ocaml.doc "The override object.\n"]
type nonrec list_mobile_device_access_overrides_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The value is \226\128\156null\226\128\157 when there are no more results to return.\n"];
  overrides: mobile_device_access_override list option
    [@ocaml.doc
      "The list of mobile device access overrides that exist for the specified WorkMail organization and user.\n"]}
[@@ocaml.doc ""]
type nonrec list_mobile_device_access_overrides_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not require a token.\n"];
  device_id: string option
    [@ocaml.doc "The mobile device to which the access override applies.\n"];
  user_id: string option
    [@ocaml.doc
      "The WorkMail user under which you list the mobile device access overrides. Accepts the following types of user identities:\n\n {ul\n       {-  User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234] \n           \n            }\n       {-  Email address: [user@domain.tld] \n           \n            }\n       {-  User name: [user] \n           \n            }\n       }\n  "];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization under which to list mobile device access overrides.\n"]}
[@@ocaml.doc ""]
type nonrec mail_domain_summary =
  {
  default_domain: bool option
    [@ocaml.doc "Whether the domain is default or not.\n"];
  domain_name: string option [@ocaml.doc "The domain name.\n"]}[@@ocaml.doc
                                                                 "The data for a given domain.\n"]
type nonrec list_mail_domains_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The value becomes [null] when there are no more results to return.\n"];
  mail_domains: mail_domain_summary list option
    [@ocaml.doc
      "The list of mail domain summaries, specifying domains that exist in the specified WorkMail organization, along with the information about whether the domain is or isn't the default.\n"]}
[@@ocaml.doc ""]
type nonrec list_mail_domains_request =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not require a token.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  organization_id: string
    [@ocaml.doc "The WorkMail organization for which to list domains.\n"]}
[@@ocaml.doc ""]
type nonrec permission =
  {
  permission_values: permission_type list
    [@ocaml.doc
      "The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other folder-level permissions set on the mailbox.\n"];
  grantee_type: member_type
    [@ocaml.doc
      "The type of user, group, or resource referred to in GranteeId.\n"];
  grantee_id: string
    [@ocaml.doc
      "The identifier of the user, group, or resource to which the permissions are granted.\n"]}
[@@ocaml.doc
  "Permission granted to a user, group, or resource to access a certain aspect of another user, group, or resource mailbox.\n"]
type nonrec list_mailbox_permissions_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The value is \"null\" when there are no more results to return.\n"];
  permissions: permission list option
    [@ocaml.doc
      "One page of the user, group, or resource mailbox permissions.\n"]}
[@@ocaml.doc ""]
type nonrec list_mailbox_permissions_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"];
  entity_id: string
    [@ocaml.doc
      "The identifier of the user, or resource for which to list mailbox permissions.\n\n The entity ID can accept {i UserId or ResourceId}, {i Username or Resourcename}, or {i email}.\n \n  {ul\n        {-  Entity ID: 12345678-1234-1234-1234-123456789012, or r-0123456789a0123456789b0123456789\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity name: entity\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier of the organization under which the user, group, or resource exists.\n"]}
[@@ocaml.doc ""]
type nonrec mailbox_export_job_state =
  | CANCELLED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec mailbox_export_job =
  {
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The mailbox export job end timestamp.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The mailbox export job start timestamp.\n"];
  state: mailbox_export_job_state option
    [@ocaml.doc "The state of the mailbox export job.\n"];
  estimated_progress: int option
    [@ocaml.doc
      "The estimated progress of the mailbox export job, in percentage points.\n"];
  s3_path: string option
    [@ocaml.doc
      "The path to the S3 bucket and file that the mailbox export job exports to.\n"];
  s3_bucket_name: string option [@ocaml.doc "The name of the S3 bucket.\n"];
  description: string option
    [@ocaml.doc "The mailbox export job description.\n"];
  entity_id: string option
    [@ocaml.doc
      "The identifier of the user or resource associated with the mailbox.\n"];
  job_id: string option
    [@ocaml.doc "The identifier of the mailbox export job.\n"]}[@@ocaml.doc
                                                                 "The details of a mailbox export job, including the user or resource ID associated with the mailbox and the S3 bucket that the mailbox contents are exported to.\n"]
type nonrec list_mailbox_export_jobs_response =
  {
  next_token: string option
    [@ocaml.doc "The token to use to retrieve the next page of results.\n"];
  jobs: mailbox_export_job list option
    [@ocaml.doc "The mailbox export job details.\n"]}[@@ocaml.doc ""]
type nonrec list_mailbox_export_jobs_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc "The token to use to retrieve the next page of results.\n"];
  organization_id: string [@ocaml.doc "The organization ID.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec impersonation_role =
  {
  date_modified: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the impersonation role was last modified.\n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the impersonation role was created.\n"];
  type_: impersonation_role_type option
    [@ocaml.doc "The impersonation role type.\n"];
  name: string option [@ocaml.doc "The impersonation role name.\n"];
  impersonation_role_id: string option
    [@ocaml.doc "The identifier of the impersonation role.\n"]}[@@ocaml.doc
                                                                 "An impersonation role for the given WorkMail organization.\n"]
type nonrec list_impersonation_roles_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to retrieve the next page of results. The value is [null] when there are no results to return.\n"];
  roles: impersonation_role list option
    [@ocaml.doc
      "The list of impersonation roles under the given WorkMail organization.\n"]}
[@@ocaml.doc ""]
type nonrec list_impersonation_roles_request =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of results returned in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token used to retrieve the next page of results. The first call doesn't require a token.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization to which the listed impersonation roles belong.\n"]}
[@@ocaml.doc ""]
type nonrec group_identifier =
  {
  group_name: string option
    [@ocaml.doc "Group name that matched the group.\n"];
  group_id: string option [@ocaml.doc "Group ID that matched the group.\n"]}
[@@ocaml.doc
  "The identifier that contains the Group ID and name of a group.\n"]
type nonrec list_groups_for_entity_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. This value is `null` when there are no more results to return.\n"];
  groups: group_identifier list option
    [@ocaml.doc "The overview of groups in an organization.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec list_groups_for_entity_filters =
  {
  group_name_prefix: string option
    [@ocaml.doc
      "Filters only group names that start with the provided name prefix.\n"]}
[@@ocaml.doc
  " Filtering options for {i ListGroupsForEntity} operation. This is only used as input to Operation.\n"]
type nonrec list_groups_for_entity_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"];
  filters: list_groups_for_entity_filters option
    [@ocaml.doc "Limit the search results based on the filter criteria.\n"];
  entity_id: string
    [@ocaml.doc
      "The identifier for the entity.\n\n The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.\n \n  {ul\n        {-  Entity ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity name: entity\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the entity exists.\n"]}
[@@ocaml.doc ""]
type nonrec group =
  {
  disabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date indicating when the group was disabled from WorkMail use.\n"];
  enabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date indicating when the group was enabled for WorkMail use.\n"];
  state: entity_state option
    [@ocaml.doc
      "The state of the group, which can be ENABLED, DISABLED, or DELETED.\n"];
  name: string option [@ocaml.doc "The name of the group.\n"];
  email: string option [@ocaml.doc "The email of the group.\n"];
  id: string option [@ocaml.doc "The identifier of the group.\n"]}[@@ocaml.doc
                                                                    "The representation of an WorkMail group.\n"]
type nonrec list_groups_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The value is \"null\" when there are no more results to return.\n"];
  groups: group list option
    [@ocaml.doc "The overview of groups for an organization.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec list_groups_filters =
  {
  state: entity_state option
    [@ocaml.doc "Filters only groups with the provided state.\n"];
  primary_email_prefix: string option
    [@ocaml.doc
      "Filters only groups with the provided primary email prefix.\n"];
  name_prefix: string option
    [@ocaml.doc "Filters only groups with the provided name prefix.\n"]}
[@@ocaml.doc
  " Filtering options for {i ListGroups} operation. This is only used as input to Operation.\n"]
type nonrec list_groups_request =
  {
  filters: list_groups_filters option
    [@ocaml.doc
      "Limit the search results based on the filter criteria. Only one filter per request is supported.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the groups exist.\n"]}
[@@ocaml.doc ""]
type nonrec member =
  {
  disabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date indicating when the member was disabled from WorkMail use.\n"];
  enabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date indicating when the member was enabled for WorkMail use.\n"];
  state: entity_state option
    [@ocaml.doc
      "The state of the member, which can be ENABLED, DISABLED, or DELETED.\n"];
  type_: member_type option [@ocaml.doc "A member can be a user or group.\n"];
  name: string option [@ocaml.doc "The name of the member.\n"];
  id: string option [@ocaml.doc "The identifier of the member.\n"]}[@@ocaml.doc
                                                                    "The representation of a user or group.\n"]
type nonrec list_group_members_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"];
  members: member list option
    [@ocaml.doc "The members associated to the group.\n"]}[@@ocaml.doc ""]
type nonrec list_group_members_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      " The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"];
  group_id: string
    [@ocaml.doc
      "The identifier for the group to which the members (users or groups) are associated.\n\n The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: group\\@domain.tld\n            \n             }\n        {-  Group name: group\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the group exists.\n"]}
[@@ocaml.doc ""]
type nonrec availability_provider_type =
  | LAMBDA [@ocaml.doc ""]
  | EWS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec redacted_ews_availability_provider =
  {
  ews_username: string option
    [@ocaml.doc "The username used to authenticate the remote EWS server.\n"];
  ews_endpoint: string option
    [@ocaml.doc "The endpoint of the remote EWS server.\n"]}[@@ocaml.doc
                                                              "Describes an EWS based availability provider when returned from the service. It does not contain the password of the endpoint.\n"]
type nonrec availability_configuration =
  {
  date_modified: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time at which the availability configuration was last modified.\n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time at which the availability configuration was created.\n"];
  lambda_provider: lambda_availability_provider option
    [@ocaml.doc
      "If ProviderType is [LAMBDA] then this field contains [LambdaAvailabilityProvider]. Otherwise, it is not required.\n"];
  ews_provider: redacted_ews_availability_provider option
    [@ocaml.doc
      "If [ProviderType] is [EWS], then this field contains [RedactedEwsAvailabilityProvider]. Otherwise, it is not required.\n"];
  provider_type: availability_provider_type option
    [@ocaml.doc "Displays the provider type that applies to this domain.\n"];
  domain_name: string option
    [@ocaml.doc "Displays the domain to which the provider applies.\n"]}
[@@ocaml.doc
  "List all the [AvailabilityConfiguration]'s for the given WorkMail organization.\n"]
type nonrec list_availability_configurations_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The value is [null] when there are no further results to return.\n"];
  availability_configurations: availability_configuration list option
    [@ocaml.doc
      "The list of [AvailabilityConfiguration]'s that exist for the specified WorkMail organization.\n"]}
[@@ocaml.doc ""]
type nonrec list_availability_configurations_request =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not require a token.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization for which the [AvailabilityConfiguration]'s will be listed.\n"]}
[@@ocaml.doc ""]
type nonrec list_aliases_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The value is \"null\" when there are no more results to return.\n"];
  aliases: string list option
    [@ocaml.doc "The entity's paginated aliases.\n"]}[@@ocaml.doc ""]
type nonrec list_aliases_request =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results to return in a single call.\n"];
  next_token: string option
    [@ocaml.doc
      "The token to use to retrieve the next page of results. The first call does not contain any tokens.\n"];
  entity_id: string
    [@ocaml.doc
      "The identifier for the entity for which to list the aliases.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the entity exists.\n"]}
[@@ocaml.doc ""]
type nonrec access_control_rule =
  {
  not_impersonation_role_ids: string list option
    [@ocaml.doc "Impersonation role IDs to exclude from the rule.\n"];
  impersonation_role_ids: string list option
    [@ocaml.doc "Impersonation role IDs to include in the rule.\n"];
  date_modified: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date that the rule was modified.\n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date that the rule was created.\n"];
  not_user_ids: string list option
    [@ocaml.doc "User IDs to exclude from the rule.\n"];
  user_ids: string list option
    [@ocaml.doc "User IDs to include in the rule.\n"];
  not_actions: string list option
    [@ocaml.doc
      "Access protocol actions to exclude from the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"];
  actions: string list option
    [@ocaml.doc
      "Access protocol actions to include in the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"];
  not_ip_ranges: string list option
    [@ocaml.doc "IPv4 CIDR ranges to exclude from the rule.\n"];
  ip_ranges: string list option
    [@ocaml.doc "IPv4 CIDR ranges to include in the rule.\n"];
  description: string option [@ocaml.doc "The rule description.\n"];
  effect_: access_control_rule_effect option
    [@ocaml.doc "The rule effect.\n"];
  name: string option [@ocaml.doc "The rule name.\n"]}[@@ocaml.doc
                                                        "A rule that controls access to an WorkMail organization.\n"]
type nonrec list_access_control_rules_response =
  {
  rules: access_control_rule list option
    [@ocaml.doc "The access control rules.\n"]}[@@ocaml.doc ""]
type nonrec list_access_control_rules_request =
  {
  organization_id: string
    [@ocaml.doc "The identifier for the organization.\n"]}[@@ocaml.doc ""]
type nonrec get_personal_access_token_metadata_response =
  {
  scopes: string list option
    [@ocaml.doc
      " Lists all the Personal Access Token permissions for a mailbox. \n"];
  expires_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The time when the Personal Access Token ID will expire. \n"];
  date_last_used: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The date when the Personal Access Token ID was last used. \n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc
      " The date when the Personal Access Token ID was created. \n"];
  name: string option [@ocaml.doc " The Personal Access Token name. \n"];
  user_id: string option [@ocaml.doc " The WorkMail User ID. \n"];
  personal_access_token_id: string option
    [@ocaml.doc " The Personal Access Token ID.\n"]}[@@ocaml.doc ""]
type nonrec get_personal_access_token_metadata_request =
  {
  personal_access_token_id: string
    [@ocaml.doc " The Personal Access Token ID.\n"];
  organization_id: string [@ocaml.doc " The Organization ID. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec get_mobile_device_access_override_response =
  {
  date_modified: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date the description was last modified.\n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date the override was first created.\n"];
  description: string option [@ocaml.doc "A description of the override.\n"];
  effect_: mobile_device_access_rule_effect option
    [@ocaml.doc "The effect of the override, [ALLOW] or [DENY].\n"];
  device_id: string option
    [@ocaml.doc "The device to which the access override applies.\n"];
  user_id: string option
    [@ocaml.doc "The WorkMail user to which the access override applies.\n"]}
[@@ocaml.doc ""]
type nonrec get_mobile_device_access_override_request =
  {
  device_id: string
    [@ocaml.doc
      "The mobile device to which the override applies. [DeviceId] is case insensitive.\n"];
  user_id: string
    [@ocaml.doc
      "Identifies the WorkMail user for the override. Accepts the following types of user identities: \n\n {ul\n       {-  User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234] \n           \n            }\n       {-  Email address: [user@domain.tld] \n           \n            }\n       {-  User name: [user] \n           \n            }\n       }\n  "];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization to which you want to apply the override.\n"]}
[@@ocaml.doc ""]
type nonrec mobile_device_access_matched_rule =
  {
  name: string option
    [@ocaml.doc "Name of a rule that a simulated user matches.\n"];
  mobile_device_access_rule_id: string option
    [@ocaml.doc "Identifier of the rule that a simulated user matches.\n"]}
[@@ocaml.doc "The rule that a simulated user matches.\n"]
type nonrec get_mobile_device_access_effect_response =
  {
  matched_rules: mobile_device_access_matched_rule list option
    [@ocaml.doc
      "A list of the rules which matched the simulated user input and produced the effect.\n"];
  effect_: mobile_device_access_rule_effect option
    [@ocaml.doc
      "The effect of the simulated access, [ALLOW] or [DENY], after evaluating mobile device access rules in the WorkMail organization for the simulated user parameters.\n"]}
[@@ocaml.doc ""]
type nonrec get_mobile_device_access_effect_request =
  {
  device_user_agent: string option
    [@ocaml.doc "Device user agent the simulated user will report.\n"];
  device_operating_system: string option
    [@ocaml.doc "Device operating system the simulated user will report.\n"];
  device_model: string option
    [@ocaml.doc "Device model the simulated user will report.\n"];
  device_type: string option
    [@ocaml.doc "Device type the simulated user will report.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization to simulate the access effect for.\n"]}
[@@ocaml.doc ""]
type nonrec dns_record =
  {
  value: string option
    [@ocaml.doc
      "The value returned by the DNS for a query to that hostname and record type.\n"];
  hostname: string option
    [@ocaml.doc "The DNS hostname.- For example, [domain.example.com].\n"];
  type_: string option
    [@ocaml.doc
      "The RFC 1035 record type. Possible values: [CNAME], [A], [MX].\n"]}
[@@ocaml.doc "A DNS record uploaded to your DNS provider.\n"]
type nonrec dns_record_verification_status =
  | FAILED [@ocaml.doc ""]
  | VERIFIED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec get_mail_domain_response =
  {
  dkim_verification_status: dns_record_verification_status option
    [@ocaml.doc "Indicates the status of a DKIM verification.\n"];
  ownership_verification_status: dns_record_verification_status option
    [@ocaml.doc
      " Indicates the status of the domain ownership verification.\n"];
  is_default: bool option
    [@ocaml.doc
      "Specifies whether the domain is the default domain for your organization.\n"];
  is_test_domain: bool option
    [@ocaml.doc
      "Specifies whether the domain is a test domain provided by WorkMail, or a custom domain.\n"];
  records: dns_record list option
    [@ocaml.doc
      "A list of the DNS records that WorkMail recommends adding in your DNS provider for the best user experience. The records configure your domain with DMARC, SPF, DKIM, and direct incoming email traffic to SES. See admin guide for more details.\n"]}
[@@ocaml.doc ""]
type nonrec get_mail_domain_request =
  {
  domain_name: string
    [@ocaml.doc "The domain from which you want to retrieve details.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization for which the domain is retrieved.\n"]}
[@@ocaml.doc ""]
type nonrec get_mailbox_details_response =
  {
  mailbox_size: float option
    [@ocaml.doc "The current mailbox size, in MB, for the specified user.\n"];
  mailbox_quota: int option
    [@ocaml.doc
      "The maximum allowed mailbox size, in MB, for the specified user.\n"]}
[@@ocaml.doc ""]
type nonrec get_mailbox_details_request =
  {
  user_id: string
    [@ocaml.doc
      "The identifier for the user whose mailbox details are being requested.\n\n The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: user\\@domain.tld\n            \n             }\n        {-  User name: user\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization that contains the user whose mailbox details are being requested.\n"]}
[@@ocaml.doc ""]
type nonrec impersonation_matched_rule =
  {
  name: string option
    [@ocaml.doc "The name of the rule that matched the input.\n"];
  impersonation_rule_id: string option
    [@ocaml.doc "The ID of the rule that matched the input\n"]}[@@ocaml.doc
                                                                 "The impersonation rule that matched the input.\n"]
type nonrec get_impersonation_role_effect_response =
  {
  matched_rules: impersonation_matched_rule list option
    [@ocaml.doc
      "A list of the rules that match the input and produce the configured effect.\n"];
  effect_: access_effect option
    [@ocaml.doc
      " Effect of the impersonation role on the target user based on its rules. Available effects are [ALLOW] or [DENY].\n"];
  type_: impersonation_role_type option
    [@ocaml.doc "The impersonation role type.\n"]}[@@ocaml.doc ""]
type nonrec get_impersonation_role_effect_request =
  {
  target_user: string
    [@ocaml.doc
      "The WorkMail organization user chosen to test the impersonation role. The following identity formats are available:\n\n {ul\n       {-  User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234] \n           \n            }\n       {-  Email address: [user@domain.tld] \n           \n            }\n       {-  User name: [user] \n           \n            }\n       }\n  "];
  impersonation_role_id: string
    [@ocaml.doc "The impersonation role ID to test.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization where the impersonation role is defined.\n"]}
[@@ocaml.doc ""]
type nonrec get_impersonation_role_response =
  {
  date_modified: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the impersonation role was last modified.\n"];
  date_created: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the impersonation role was created.\n"];
  rules: impersonation_rule list option
    [@ocaml.doc "The list of rules for the given impersonation role.\n"];
  description: string option
    [@ocaml.doc "The impersonation role description.\n"];
  type_: impersonation_role_type option
    [@ocaml.doc "The impersonation role type.\n"];
  name: string option [@ocaml.doc "The impersonation role name.\n"];
  impersonation_role_id: string option
    [@ocaml.doc "The impersonation role ID.\n"]}[@@ocaml.doc ""]
type nonrec get_impersonation_role_request =
  {
  impersonation_role_id: string
    [@ocaml.doc "The impersonation role ID to retrieve.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization from which to retrieve the impersonation role.\n"]}
[@@ocaml.doc ""]
type nonrec get_default_retention_policy_response =
  {
  folder_configurations: folder_configuration list option
    [@ocaml.doc "The retention policy folder configurations.\n"];
  description: string option
    [@ocaml.doc "The retention policy description.\n"];
  name: string option [@ocaml.doc "The retention policy name.\n"];
  id: string option [@ocaml.doc "The retention policy ID.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec get_default_retention_policy_request =
  {
  organization_id: string [@ocaml.doc "The organization ID.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec get_access_control_effect_response =
  {
  matched_rules: string list option
    [@ocaml.doc
      "The rules that match the given parameters, resulting in an effect.\n"];
  effect_: access_control_rule_effect option
    [@ocaml.doc "The rule effect.\n"]}[@@ocaml.doc ""]
type nonrec get_access_control_effect_request =
  {
  impersonation_role_id: string option
    [@ocaml.doc "The impersonation role ID.\n"];
  user_id: string option [@ocaml.doc "The user ID.\n"];
  action: string
    [@ocaml.doc
      "The access protocol action. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"];
  ip_address: string [@ocaml.doc "The IPv4 address.\n"];
  organization_id: string
    [@ocaml.doc "The identifier for the organization.\n"]}[@@ocaml.doc ""]
type nonrec disassociate_member_from_group_request =
  {
  member_id: string
    [@ocaml.doc
      "The identifier for the member to be removed from the group.\n\n The member ID can accept {i UserID or GroupId}, {i Username or Groupname}, or {i email}.\n \n  {ul\n        {-  Member ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: member\\@domain.tld\n            \n             }\n        {-  Member name: member\n            \n             }\n        }\n  "];
  group_id: string
    [@ocaml.doc
      "The identifier for the group from which members are removed.\n\n The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: group\\@domain.tld\n            \n             }\n        {-  Group name: group\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the group exists.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_delegate_from_resource_request =
  {
  entity_id: string
    [@ocaml.doc
      "The identifier for the member (user, group) to be removed from the resource's delegates.\n\n The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.\n \n  {ul\n        {-  Entity: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity: entity\n            \n             }\n        }\n  "];
  resource_id: string
    [@ocaml.doc
      "The identifier of the resource from which delegates' set members are removed. \n\n The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Resource ID: r-0123456789a0123456789b0123456789\n            \n             }\n        {-  Email address: resource\\@domain.tld\n            \n             }\n        {-  Resource name: resource\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the resource exists.\n"]}
[@@ocaml.doc ""]
type nonrec describe_user_response =
  {
  identity_provider_identity_store_id: string option
    [@ocaml.doc
      " Identity Store ID from the IAM Identity Center. If this parameter is empty it will be updated automatically when the user logs in for the first time to the mailbox associated with WorkMail. \n"];
  identity_provider_user_id: string option
    [@ocaml.doc
      "User ID from the IAM Identity Center. If this parameter is empty it will be updated automatically when the user logs in for the first time to the mailbox associated with WorkMail.\n"];
  office: string option [@ocaml.doc "Office where the user is located.\n"];
  country: string option [@ocaml.doc "Country where the user is located.\n"];
  department: string option [@ocaml.doc "Department of the user.\n"];
  zip_code: string option [@ocaml.doc "Zip code of the user.\n"];
  company: string option [@ocaml.doc "Company of the user.\n"];
  city: string option [@ocaml.doc "City where the user is located.\n"];
  job_title: string option [@ocaml.doc "Job title of the user.\n"];
  street: string option [@ocaml.doc "Street where the user is located.\n"];
  telephone: string option [@ocaml.doc "User's contact number.\n"];
  initials: string option [@ocaml.doc "Initials of the user.\n"];
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If enabled, the user is hidden from the global address list.\n"];
  last_name: string option [@ocaml.doc "Last name of the user.\n"];
  first_name: string option [@ocaml.doc "First name of the user.\n"];
  mailbox_deprovisioned_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the mailbox was removed for the user.\n"];
  mailbox_provisioned_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the mailbox was created for the user.\n"];
  disabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time at which the user was disabled for WorkMail usage, in UNIX epoch time format.\n"];
  enabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time at which the user was enabled for WorkMailusage, in UNIX epoch time format.\n"];
  user_role: user_role option
    [@ocaml.doc
      "In certain cases, other entities are modeled as users. If interoperability is enabled, resources are imported into WorkMail as users. Because different WorkMail organizations rely on different directory types, administrators can distinguish between an unregistered user (account is disabled and has a user role) and the directory administrators. The values are USER, RESOURCE, SYSTEM_USER, and REMOTE_USER.\n"];
  state: entity_state option
    [@ocaml.doc
      "The state of a user: enabled (registered to WorkMail) or disabled (deregistered or never registered to WorkMail).\n"];
  display_name: string option [@ocaml.doc "The display name of the user.\n"];
  email: string option [@ocaml.doc "The email of the user.\n"];
  name: string option [@ocaml.doc "The name for the user.\n"];
  user_id: string option
    [@ocaml.doc "The identifier for the described user.\n"]}[@@ocaml.doc ""]
type nonrec describe_user_request =
  {
  user_id: string
    [@ocaml.doc
      "The identifier for the user to be described.\n\n The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: user\\@domain.tld\n            \n             }\n        {-  User name: user\n            \n             }\n        }\n   \n   "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the user exists.\n"]}
[@@ocaml.doc ""]
type nonrec describe_resource_response =
  {
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If enabled, the resource is hidden from the global address list.\n"];
  description: string option [@ocaml.doc "Description of the resource.\n"];
  disabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when a resource was disabled from WorkMail, in UNIX epoch time format.\n"];
  enabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when a resource was enabled for WorkMail, in UNIX epoch time format.\n"];
  state: entity_state option
    [@ocaml.doc
      "The state of the resource: enabled (registered to WorkMail), disabled (deregistered or never registered to WorkMail), or deleted.\n"];
  booking_options: booking_options option
    [@ocaml.doc "The booking options for the described resource.\n"];
  type_: resource_type option
    [@ocaml.doc "The type of the described resource.\n"];
  name: string option [@ocaml.doc "The name of the described resource.\n"];
  email: string option [@ocaml.doc "The email of the described resource.\n"];
  resource_id: string option
    [@ocaml.doc "The identifier of the described resource.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_resource_request =
  {
  resource_id: string
    [@ocaml.doc
      "The identifier of the resource to be described.\n\n The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Resource ID: r-0123456789a0123456789b0123456789\n            \n             }\n        {-  Email address: resource\\@domain.tld\n            \n             }\n        {-  Resource name: resource\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier associated with the organization for which the resource is described.\n"]}
[@@ocaml.doc ""]
type nonrec describe_organization_response =
  {
  interoperability_enabled: bool option
    [@ocaml.doc
      "Indicates if interoperability is enabled for this organization.\n"];
  migration_admin: string option
    [@ocaml.doc
      "The user ID of the migration admin if migration is enabled for the organization.\n"];
  ar_n: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the organization.\n"];
  error_message: string option
    [@ocaml.doc
      "(Optional) The error message indicating if unexpected behavior was encountered with regards to the organization.\n"];
  completed_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date at which the organization became usable in the WorkMail context, in UNIX epoch time format.\n"];
  default_mail_domain: string option
    [@ocaml.doc
      "The default mail domain associated with the organization.\n"];
  directory_type: string option
    [@ocaml.doc
      "The type of directory associated with the WorkMail organization.\n"];
  directory_id: string option
    [@ocaml.doc
      "The identifier for the directory associated with an WorkMail organization.\n"];
  state: string option [@ocaml.doc "The state of an organization.\n"];
  alias: string option [@ocaml.doc "The alias for an organization.\n"];
  organization_id: string option
    [@ocaml.doc "The identifier of an organization.\n"]}[@@ocaml.doc ""]
type nonrec describe_organization_request =
  {
  organization_id: string
    [@ocaml.doc "The identifier for the organization to be described.\n"]}
[@@ocaml.doc ""]
type nonrec describe_mailbox_export_job_response =
  {
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The mailbox export job end timestamp.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The mailbox export job start timestamp.\n"];
  error_info: string option
    [@ocaml.doc "Error information for failed mailbox export jobs.\n"];
  state: mailbox_export_job_state option
    [@ocaml.doc "The state of the mailbox export job.\n"];
  estimated_progress: int option
    [@ocaml.doc
      "The estimated progress of the mailbox export job, in percentage points.\n"];
  s3_path: string option
    [@ocaml.doc
      "The path to the S3 bucket and file that the mailbox export job is exporting to.\n"];
  s3_prefix: string option [@ocaml.doc "The S3 bucket prefix.\n"];
  s3_bucket_name: string option [@ocaml.doc "The name of the S3 bucket.\n"];
  kms_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key that encrypts the exported mailbox content.\n"];
  role_arn: string option
    [@ocaml.doc
      "The ARN of the AWS Identity and Access Management (IAM) role that grants write permission to the Amazon Simple Storage Service (Amazon S3) bucket.\n"];
  description: string option
    [@ocaml.doc "The mailbox export job description.\n"];
  entity_id: string option
    [@ocaml.doc
      "The identifier of the user or resource associated with the mailbox.\n"]}
[@@ocaml.doc ""]
type nonrec describe_mailbox_export_job_request =
  {
  organization_id: string [@ocaml.doc "The organization ID.\n"];
  job_id: string [@ocaml.doc "The mailbox export job ID.\n"]}[@@ocaml.doc ""]
type nonrec describe_inbound_dmarc_settings_response =
  {
  enforced: bool option
    [@ocaml.doc "Lists the enforcement setting of the applied policy.\n"]}
[@@ocaml.doc ""]
type nonrec describe_inbound_dmarc_settings_request =
  {
  organization_id: string
    [@ocaml.doc "Lists the ID of the given organization.\n"]}[@@ocaml.doc ""]
type nonrec describe_identity_provider_configuration_response =
  {
  personal_access_token_configuration:
    personal_access_token_configuration option
    [@ocaml.doc
      " The details of the Personal Access Token configuration. \n"];
  identity_center_configuration: identity_center_configuration option
    [@ocaml.doc " The details of the IAM Identity Center configuration. \n"];
  authentication_mode: identity_provider_authentication_mode option
    [@ocaml.doc " The authentication mode used in WorkMail.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec describe_identity_provider_configuration_request =
  {
  organization_id: string [@ocaml.doc " The Organization ID. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_group_response =
  {
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If the value is set to {i true}, the group is hidden from the address book.\n"];
  disabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when a user was deregistered from WorkMail, in UNIX epoch time format.\n"];
  enabled_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time when a user was registered to WorkMail, in UNIX epoch time format.\n"];
  state: entity_state option
    [@ocaml.doc
      "The state of the user: enabled (registered to WorkMail) or disabled (deregistered or never registered to WorkMail).\n"];
  email: string option [@ocaml.doc "The email of the described group.\n"];
  name: string option [@ocaml.doc "The name of the described group.\n"];
  group_id: string option
    [@ocaml.doc "The identifier of the described group.\n"]}[@@ocaml.doc ""]
type nonrec describe_group_request =
  {
  group_id: string
    [@ocaml.doc
      "The identifier for the group to be described.\n\n The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: group\\@domain.tld\n            \n             }\n        {-  Group name: group\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the group exists.\n"]}
[@@ocaml.doc ""]
type nonrec entity_type =
  | RESOURCE [@ocaml.doc ""]
  | USER [@ocaml.doc ""]
  | GROUP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec describe_entity_response =
  {
  type_: entity_type option [@ocaml.doc "Entity type.\n"];
  name: string option
    [@ocaml.doc
      "Username, GroupName, or ResourceName based on entity type.\n"];
  entity_id: string option
    [@ocaml.doc "The entity ID under which the entity exists.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_entity_request =
  {
  email: string [@ocaml.doc "The email under which the entity exists.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the entity exists.\n"]}
[@@ocaml.doc ""]
type nonrec describe_email_monitoring_configuration_response =
  {
  log_group_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email monitoring configuration.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring configuration.\n"]}
[@@ocaml.doc ""]
type nonrec describe_email_monitoring_configuration_request =
  {
  organization_id: string
    [@ocaml.doc
      "The ID of the organization for which the email monitoring configuration is described.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_custom_ses_configuration_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You SES configuration has customizations that WorkMail cannot save. The error message lists the invalid setting. For examples of invalid settings, refer to {{:https://docs.aws.amazon.com/ses/latest/APIReference/API_CreateReceiptRule.html}CreateReceiptRule}.\n"]
type nonrec deregister_mail_domain_request =
  {
  domain_name: string
    [@ocaml.doc "The domain to deregister in WorkMail and SES.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization for which the domain will be deregistered.\n"]}
[@@ocaml.doc ""]
type nonrec deregister_from_work_mail_request =
  {
  entity_id: string
    [@ocaml.doc
      "The identifier for the member to be updated.\n\n The identifier can be {i UserId, ResourceId, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.\n \n  {ul\n        {-  Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity name: entity\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the WorkMail entity exists.\n"]}
[@@ocaml.doc ""]
type nonrec delete_user_request =
  {
  user_id: string
    [@ocaml.doc
      "The identifier of the user to be deleted.\n\n The identifier can be the {i UserId} or {i Username}. The following identity formats are available:\n \n  {ul\n        {-  User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  User name: user\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc "The organization that contains the user to be deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_retention_policy_request =
  {
  id: string [@ocaml.doc "The retention policy ID.\n"];
  organization_id: string [@ocaml.doc "The organization ID.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec delete_resource_request =
  {
  resource_id: string
    [@ocaml.doc
      "The identifier of the resource to be deleted.\n\n The identifier can accept {i ResourceId}, or {i Resourcename}. The following identity formats are available:\n \n  {ul\n        {-  Resource ID: r-0123456789a0123456789b0123456789\n            \n             }\n        {-  Resource name: resource\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier associated with the organization from which the resource is deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_personal_access_token_request =
  {
  personal_access_token_id: string
    [@ocaml.doc " The Personal Access Token ID.\n"];
  organization_id: string [@ocaml.doc " The Organization ID. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_organization_response =
  {
  state: string option [@ocaml.doc "The state of the organization.\n"];
  organization_id: string option [@ocaml.doc "The organization ID.\n"]}
[@@ocaml.doc ""]
type nonrec delete_organization_request =
  {
  delete_identity_center_application: bool option
    [@ocaml.doc
      "Deletes IAM Identity Center application for WorkMail. This action does not affect authentication settings for any organization.\n"];
  force_delete: bool option
    [@ocaml.doc
      "Deletes a WorkMail organization even if the organization has enabled users.\n"];
  delete_directory: bool
    [@ocaml.doc
      "If true, deletes the AWS Directory Service directory associated with the organization.\n"];
  organization_id: string [@ocaml.doc "The organization ID.\n"];
  client_token: string option
    [@ocaml.doc "The idempotency token associated with the request.\n"]}
[@@ocaml.doc ""]
type nonrec delete_mobile_device_access_rule_request =
  {
  mobile_device_access_rule_id: string
    [@ocaml.doc "The identifier of the rule to be deleted.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization under which the rule will be deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_mobile_device_access_override_request =
  {
  device_id: string
    [@ocaml.doc
      "The mobile device for which you delete the override. [DeviceId] is case insensitive.\n"];
  user_id: string
    [@ocaml.doc
      "The WorkMail user for which you want to delete the override. Accepts the following types of user identities:\n\n {ul\n       {-  User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234] \n           \n            }\n       {-  Email address: [user@domain.tld] \n           \n            }\n       {-  User name: [user] \n           \n            }\n       }\n  "];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization for which the access override will be deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_mailbox_permissions_request =
  {
  grantee_id: string
    [@ocaml.doc
      "The identifier of the entity for which to delete granted permissions.\n\n The identifier can be {i UserId, ResourceID, or Group Id}, {i Username or Groupname}, or {i email}.\n \n  {ul\n        {-  Grantee ID: 12345678-1234-1234-1234-123456789012,r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: grantee\\@domain.tld\n            \n             }\n        {-  Grantee name: grantee\n            \n             }\n        }\n  "];
  entity_id: string
    [@ocaml.doc
      "The identifier of the entity that owns the mailbox.\n\n The identifier can be {i UserId or Group Id}, {i Username or Groupname}, or {i email}.\n \n  {ul\n        {-  Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity name: entity\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc
      "The identifier of the organization under which the member (user or group) exists.\n"]}
[@@ocaml.doc ""]
type nonrec delete_impersonation_role_request =
  {
  impersonation_role_id: string
    [@ocaml.doc "The ID of the impersonation role to delete.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization from which to delete the impersonation role.\n"]}
[@@ocaml.doc ""]
type nonrec delete_identity_provider_configuration_request =
  {
  organization_id: string [@ocaml.doc " The Organization ID. \n"]}[@@ocaml.doc
                                                                    ""]
type nonrec delete_identity_center_application_request =
  {
  application_arn: string
    [@ocaml.doc " The Amazon Resource Name (ARN) of the application. \n"]}
[@@ocaml.doc ""]
type nonrec delete_group_request =
  {
  group_id: string
    [@ocaml.doc
      "The identifier of the group to be deleted.\n\n The identifier can be the {i GroupId}, or {i Groupname}. The following identity formats are available:\n \n  {ul\n        {-  Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Group name: group\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc "The organization that contains the group.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec delete_email_monitoring_configuration_request =
  {
  organization_id: string
    [@ocaml.doc
      "The ID of the organization from which the email monitoring configuration is deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_availability_configuration_request =
  {
  domain_name: string
    [@ocaml.doc
      "The domain for which the [AvailabilityConfiguration] will be deleted.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization for which the [AvailabilityConfiguration] will be deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_alias_request =
  {
  alias: string
    [@ocaml.doc
      "The aliases to be removed from the user's set of aliases. Duplicate entries in the list are collapsed into single entries (the list is transformed into a set).\n"];
  entity_id: string
    [@ocaml.doc
      "The identifier for the member (user or group) from which to have the aliases removed.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier for the organization under which the user exists.\n"]}
[@@ocaml.doc ""]
type nonrec delete_access_control_rule_request =
  {
  name: string [@ocaml.doc "The name of the access control rule.\n"];
  organization_id: string
    [@ocaml.doc "The identifier for the organization.\n"]}[@@ocaml.doc ""]
type nonrec reserved_name_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This user, group, or resource name is not allowed in WorkMail.\n"]
type nonrec create_user_response =
  {
  user_id: string option [@ocaml.doc "The identifier for the new user.\n"]}
[@@ocaml.doc ""]
type nonrec create_user_request =
  {
  identity_provider_user_id: string option
    [@ocaml.doc
      "User ID from the IAM Identity Center. If this parameter is empty it will be updated automatically when the user logs in for the first time to the mailbox associated with WorkMail.\n"];
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If this parameter is enabled, the user will be hidden from the address book.\n"];
  last_name: string option [@ocaml.doc "The last name of the new user. \n"];
  first_name: string option [@ocaml.doc "The first name of the new user.\n"];
  role: user_role option
    [@ocaml.doc
      "The role of the new user.\n\n You cannot pass {i SYSTEM_USER} or {i RESOURCE} role in a single request. When a user role is not selected, the default role of {i USER} is selected.\n "];
  password: string option [@ocaml.doc "The password for the new user.\n"];
  display_name: string [@ocaml.doc "The display name for the new user.\n"];
  name: string
    [@ocaml.doc
      "The name for the new user. WorkMail directory user names have a maximum length of 64. All others have a maximum length of 20.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier of the organization for which the user is created.\n"]}
[@@ocaml.doc ""]
type nonrec create_resource_response =
  {
  resource_id: string option
    [@ocaml.doc "The identifier of the new resource.\n"]}[@@ocaml.doc ""]
type nonrec create_resource_request =
  {
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If this parameter is enabled, the resource will be hidden from the address book.\n"];
  description: string option [@ocaml.doc "Resource description.\n"];
  type_: resource_type
    [@ocaml.doc
      "The type of the new resource. The available types are [equipment] and [room].\n"];
  name: string [@ocaml.doc "The name of the new resource.\n"];
  organization_id: string
    [@ocaml.doc
      "The identifier associated with the organization for which the resource is created.\n"]}
[@@ocaml.doc ""]
type nonrec directory_in_use_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The directory is already in use by another WorkMail organization in the same account and Region.\n"]
type nonrec create_organization_response =
  {
  organization_id: string option [@ocaml.doc "The organization ID.\n"]}
[@@ocaml.doc ""]
type nonrec domain =
  {
  hosted_zone_id: string option
    [@ocaml.doc
      "The hosted zone ID for a domain hosted in Route 53. Required when configuring a domain hosted in Route 53.\n"];
  domain_name: string [@ocaml.doc "The fully qualified domain name.\n"]}
[@@ocaml.doc
  "The domain to associate with an WorkMail organization.\n\n When you configure a domain hosted in Amazon Route 53 (Route 53), all recommended DNS records are added to the organization when you create it. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html}Adding a domain} in the {i WorkMail Administrator Guide}.\n "]
type nonrec create_organization_request =
  {
  enable_interoperability: bool option
    [@ocaml.doc
      "When [true], allows organization interoperability between WorkMail and Microsoft Exchange. If [true], you must include a AD Connector directory ID in the request.\n"];
  kms_key_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a customer managed key from AWS KMS.\n"];
  domains: domain list option
    [@ocaml.doc "The email domains to associate with the organization.\n"];
  client_token: string option
    [@ocaml.doc "The idempotency token associated with the request.\n"];
  alias: string [@ocaml.doc "The organization alias.\n"];
  directory_id: string option
    [@ocaml.doc "The AWS Directory Service directory ID.\n"]}[@@ocaml.doc ""]
type nonrec create_mobile_device_access_rule_response =
  {
  mobile_device_access_rule_id: string option
    [@ocaml.doc
      "The identifier for the newly created mobile device access rule.\n"]}
[@@ocaml.doc ""]
type nonrec create_mobile_device_access_rule_request =
  {
  not_device_user_agents: string list option
    [@ocaml.doc
      "Device user agents that the rule {b will not} match. All other device user agents will match.\n"];
  device_user_agents: string list option
    [@ocaml.doc "Device user agents that the rule will match.\n"];
  not_device_operating_systems: string list option
    [@ocaml.doc
      "Device operating systems that the rule {b will not} match. All other device operating systems will match.\n"];
  device_operating_systems: string list option
    [@ocaml.doc "Device operating systems that the rule will match.\n"];
  not_device_models: string list option
    [@ocaml.doc
      "Device models that the rule {b will not} match. All other device models will match.\n"];
  device_models: string list option
    [@ocaml.doc "Device models that the rule will match.\n"];
  not_device_types: string list option
    [@ocaml.doc
      "Device types that the rule {b will not} match. All other device types will match.\n"];
  device_types: string list option
    [@ocaml.doc "Device types that the rule will match.\n"];
  effect_: mobile_device_access_rule_effect
    [@ocaml.doc
      "The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].\n"];
  description: string option [@ocaml.doc "The rule description.\n"];
  name: string [@ocaml.doc "The rule name.\n"];
  client_token: string option
    [@ocaml.doc "The idempotency token for the client request.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization under which the rule will be created.\n"]}
[@@ocaml.doc ""]
type nonrec create_impersonation_role_response =
  {
  impersonation_role_id: string option
    [@ocaml.doc "The new impersonation role ID.\n"]}[@@ocaml.doc ""]
type nonrec create_impersonation_role_request =
  {
  rules: impersonation_rule list
    [@ocaml.doc "The list of rules for the impersonation role.\n"];
  description: string option
    [@ocaml.doc "The description of the new impersonation role.\n"];
  type_: impersonation_role_type
    [@ocaml.doc
      "The impersonation role's type. The available impersonation role types are [READ_ONLY] or [FULL_ACCESS].\n"];
  name: string [@ocaml.doc "The name of the new impersonation role.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization to create the new impersonation role within.\n"];
  client_token: string option
    [@ocaml.doc "The idempotency token for the client request.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_identity_center_application_response =
  {
  application_arn: string option
    [@ocaml.doc " The Amazon Resource Name (ARN) of the application. \n"]}
[@@ocaml.doc ""]
type nonrec create_identity_center_application_request =
  {
  client_token: string option
    [@ocaml.doc " The idempotency token associated with the request. \n"];
  instance_arn: string
    [@ocaml.doc " The Amazon Resource Name (ARN) of the instance. \n"];
  name: string
    [@ocaml.doc " The name of the IAM Identity Center application. \n"]}
[@@ocaml.doc ""]
type nonrec create_group_response =
  {
  group_id: string option [@ocaml.doc "The identifier of the group.\n"]}
[@@ocaml.doc ""]
type nonrec create_group_request =
  {
  hidden_from_global_address_list: bool option
    [@ocaml.doc
      "If this parameter is enabled, the group will be hidden from the address book.\n"];
  name: string [@ocaml.doc "The name of the group.\n"];
  organization_id: string
    [@ocaml.doc "The organization under which the group is to be created.\n"]}
[@@ocaml.doc ""]
type nonrec create_availability_configuration_request =
  {
  lambda_provider: lambda_availability_provider option
    [@ocaml.doc
      "Lambda availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider].\n"];
  ews_provider: ews_availability_provider option
    [@ocaml.doc
      "Exchange Web Services (EWS) availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider].\n"];
  domain_name: string
    [@ocaml.doc "The domain to which the provider applies.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization for which the [AvailabilityConfiguration] will be created.\n"];
  client_token: string option
    [@ocaml.doc
      "An idempotent token that ensures that an API request is executed only once.\n"]}
[@@ocaml.doc ""]
type nonrec create_alias_request =
  {
  alias: string [@ocaml.doc "The alias to add to the member set.\n"];
  entity_id: string
    [@ocaml.doc "The member (user or group) to which this alias is added.\n"];
  organization_id: string
    [@ocaml.doc
      "The organization under which the member (user or group) exists.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_mailbox_export_job_request =
  {
  organization_id: string [@ocaml.doc "The organization ID.\n"];
  job_id: string [@ocaml.doc "The job ID.\n"];
  client_token: string
    [@ocaml.doc "The idempotency token for the client request.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec assume_impersonation_role_response =
  {
  expires_in: int option
    [@ocaml.doc "The authentication token's validity, in seconds.\n"];
  token: string option
    [@ocaml.doc "The authentication token for the impersonation role.\n"]}
[@@ocaml.doc ""]
type nonrec assume_impersonation_role_request =
  {
  impersonation_role_id: string
    [@ocaml.doc "The impersonation role ID to assume.\n"];
  organization_id: string
    [@ocaml.doc
      "The WorkMail organization under which the impersonation role will be assumed.\n"]}
[@@ocaml.doc ""]
type nonrec associate_member_to_group_request =
  {
  member_id: string
    [@ocaml.doc
      "The member (user or group) to associate to the group.\n\n The member ID can accept {i UserID or GroupId}, {i Username or Groupname}, or {i email}.\n \n  {ul\n        {-  Member: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: member\\@domain.tld\n            \n             }\n        {-  Member name: member\n            \n             }\n        }\n  "];
  group_id: string
    [@ocaml.doc
      "The group to which the member (user or group) is associated.\n\n The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: group\\@domain.tld\n            \n             }\n        {-  Group name: group\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc "The organization under which the group exists.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec associate_delegate_to_resource_request =
  {
  entity_id: string
    [@ocaml.doc
      "The member (user or group) to associate to the resource.\n\n The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.\n \n  {ul\n        {-  Entity: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234\n            \n             }\n        {-  Email address: entity\\@domain.tld\n            \n             }\n        {-  Entity: entity\n            \n             }\n        }\n  "];
  resource_id: string
    [@ocaml.doc
      "The resource for which members (users or groups) are associated.\n\n The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:\n \n  {ul\n        {-  Resource ID: r-0123456789a0123456789b0123456789\n            \n             }\n        {-  Email address: resource\\@domain.tld\n            \n             }\n        {-  Resource name: resource\n            \n             }\n        }\n  "];
  organization_id: string
    [@ocaml.doc "The organization under which the resource exists.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_update_user_response : unit -> unit
val make_update_user_request :
  ?identity_provider_user_id:string ->
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
val make_update_resource_response : unit -> unit
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
val make_update_primary_email_address_response : unit -> unit
val make_update_primary_email_address_request :
  email:string ->
    entity_id:string ->
      organization_id:string -> unit -> update_primary_email_address_request
val make_update_mobile_device_access_rule_response : unit -> unit
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
val make_update_mailbox_quota_response : unit -> unit
val make_update_mailbox_quota_request :
  mailbox_quota:int ->
    user_id:string ->
      organization_id:string -> unit -> update_mailbox_quota_request
val make_update_impersonation_role_response : unit -> unit
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
val make_update_group_response : unit -> unit
val make_update_group_request :
  ?hidden_from_global_address_list:bool ->
    group_id:string -> organization_id:string -> unit -> update_group_request
val make_update_default_mail_domain_response : unit -> unit
val make_update_default_mail_domain_request :
  domain_name:string ->
    organization_id:string -> unit -> update_default_mail_domain_request
val make_update_availability_configuration_response : unit -> unit
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
val make_untag_resource_response : unit -> unit
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
val make_tag_resource_response : unit -> unit
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
val make_reset_password_response : unit -> unit
val make_reset_password_request :
  password:string ->
    user_id:string ->
      organization_id:string -> unit -> reset_password_request
val make_register_to_work_mail_response : unit -> unit
val make_register_to_work_mail_request :
  email:string ->
    entity_id:string ->
      organization_id:string -> unit -> register_to_work_mail_request
val make_register_mail_domain_response : unit -> unit
val make_register_mail_domain_request :
  ?client_token:string ->
    domain_name:string ->
      organization_id:string -> unit -> register_mail_domain_request
val make_put_retention_policy_response : unit -> unit
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
val make_put_mobile_device_access_override_response : unit -> unit
val make_put_mobile_device_access_override_request :
  ?description:string ->
    effect_:mobile_device_access_rule_effect ->
      device_id:string ->
        user_id:string ->
          organization_id:string ->
            unit -> put_mobile_device_access_override_request
val make_put_mailbox_permissions_response : unit -> unit
val make_put_mailbox_permissions_request :
  permission_values:permission_type list ->
    grantee_id:string ->
      entity_id:string ->
        organization_id:string -> unit -> put_mailbox_permissions_request
val make_put_inbound_dmarc_settings_response : unit -> unit
val make_put_inbound_dmarc_settings_request :
  enforced:bool ->
    organization_id:string -> unit -> put_inbound_dmarc_settings_request
val make_put_identity_provider_configuration_response : unit -> unit
val make_identity_center_configuration :
  application_arn:string ->
    instance_arn:string -> unit -> identity_center_configuration
val make_personal_access_token_configuration :
  ?lifetime_in_days:int ->
    status:personal_access_token_configuration_status ->
      unit -> personal_access_token_configuration
val make_put_identity_provider_configuration_request :
  personal_access_token_configuration:personal_access_token_configuration ->
    identity_center_configuration:identity_center_configuration ->
      authentication_mode:identity_provider_authentication_mode ->
        organization_id:string ->
          unit -> put_identity_provider_configuration_request
val make_put_email_monitoring_configuration_response : unit -> unit
val make_put_email_monitoring_configuration_request :
  log_group_arn:string ->
    role_arn:string ->
      organization_id:string ->
        unit -> put_email_monitoring_configuration_request
val make_put_access_control_rule_response : unit -> unit
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
  ?identity_provider_identity_store_id:string ->
    ?identity_provider_user_id:string ->
      ?disabled_date:CoreTypes.Timestamp.t ->
        ?enabled_date:CoreTypes.Timestamp.t ->
          ?user_role:user_role ->
            ?state:entity_state ->
              ?display_name:string ->
                ?name:string -> ?email:string -> ?id:string -> unit -> user
val make_list_users_response :
  ?next_token:string -> ?users:user list -> unit -> list_users_response
val make_list_users_filters :
  ?identity_provider_user_id_prefix:string ->
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
val make_personal_access_token_summary :
  ?scopes:string list ->
    ?expires_time:CoreTypes.Timestamp.t ->
      ?date_last_used:CoreTypes.Timestamp.t ->
        ?date_created:CoreTypes.Timestamp.t ->
          ?name:string ->
            ?user_id:string ->
              ?personal_access_token_id:string ->
                unit -> personal_access_token_summary
val make_list_personal_access_tokens_response :
  ?personal_access_token_summaries:personal_access_token_summary list ->
    ?next_token:string -> unit -> list_personal_access_tokens_response
val make_list_personal_access_tokens_request :
  ?max_results:int ->
    ?next_token:string ->
      ?user_id:string ->
        organization_id:string -> unit -> list_personal_access_tokens_request
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
val make_get_personal_access_token_metadata_response :
  ?scopes:string list ->
    ?expires_time:CoreTypes.Timestamp.t ->
      ?date_last_used:CoreTypes.Timestamp.t ->
        ?date_created:CoreTypes.Timestamp.t ->
          ?name:string ->
            ?user_id:string ->
              ?personal_access_token_id:string ->
                unit -> get_personal_access_token_metadata_response
val make_get_personal_access_token_metadata_request :
  personal_access_token_id:string ->
    organization_id:string ->
      unit -> get_personal_access_token_metadata_request
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
val make_disassociate_member_from_group_response : unit -> unit
val make_disassociate_member_from_group_request :
  member_id:string ->
    group_id:string ->
      organization_id:string ->
        unit -> disassociate_member_from_group_request
val make_disassociate_delegate_from_resource_response : unit -> unit
val make_disassociate_delegate_from_resource_request :
  entity_id:string ->
    resource_id:string ->
      organization_id:string ->
        unit -> disassociate_delegate_from_resource_request
val make_describe_user_response :
  ?identity_provider_identity_store_id:string ->
    ?identity_provider_user_id:string ->
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
val make_describe_identity_provider_configuration_response :
  ?personal_access_token_configuration:personal_access_token_configuration ->
    ?identity_center_configuration:identity_center_configuration ->
      ?authentication_mode:identity_provider_authentication_mode ->
        unit -> describe_identity_provider_configuration_response
val make_describe_identity_provider_configuration_request :
  organization_id:string ->
    unit -> describe_identity_provider_configuration_request
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
val make_deregister_mail_domain_response : unit -> unit
val make_deregister_mail_domain_request :
  domain_name:string ->
    organization_id:string -> unit -> deregister_mail_domain_request
val make_deregister_from_work_mail_response : unit -> unit
val make_deregister_from_work_mail_request :
  entity_id:string ->
    organization_id:string -> unit -> deregister_from_work_mail_request
val make_delete_user_response : unit -> unit
val make_delete_user_request :
  user_id:string -> organization_id:string -> unit -> delete_user_request
val make_delete_retention_policy_response : unit -> unit
val make_delete_retention_policy_request :
  id:string ->
    organization_id:string -> unit -> delete_retention_policy_request
val make_delete_resource_response : unit -> unit
val make_delete_resource_request :
  resource_id:string ->
    organization_id:string -> unit -> delete_resource_request
val make_delete_personal_access_token_response : unit -> unit
val make_delete_personal_access_token_request :
  personal_access_token_id:string ->
    organization_id:string -> unit -> delete_personal_access_token_request
val make_delete_organization_response :
  ?state:string ->
    ?organization_id:string -> unit -> delete_organization_response
val make_delete_organization_request :
  ?delete_identity_center_application:bool ->
    ?force_delete:bool ->
      ?client_token:string ->
        delete_directory:bool ->
          organization_id:string -> unit -> delete_organization_request
val make_delete_mobile_device_access_rule_response : unit -> unit
val make_delete_mobile_device_access_rule_request :
  mobile_device_access_rule_id:string ->
    organization_id:string ->
      unit -> delete_mobile_device_access_rule_request
val make_delete_mobile_device_access_override_response : unit -> unit
val make_delete_mobile_device_access_override_request :
  device_id:string ->
    user_id:string ->
      organization_id:string ->
        unit -> delete_mobile_device_access_override_request
val make_delete_mailbox_permissions_response : unit -> unit
val make_delete_mailbox_permissions_request :
  grantee_id:string ->
    entity_id:string ->
      organization_id:string -> unit -> delete_mailbox_permissions_request
val make_delete_impersonation_role_response : unit -> unit
val make_delete_impersonation_role_request :
  impersonation_role_id:string ->
    organization_id:string -> unit -> delete_impersonation_role_request
val make_delete_identity_provider_configuration_response : unit -> unit
val make_delete_identity_provider_configuration_request :
  organization_id:string ->
    unit -> delete_identity_provider_configuration_request
val make_delete_identity_center_application_response : unit -> unit
val make_delete_identity_center_application_request :
  application_arn:string ->
    unit -> delete_identity_center_application_request
val make_delete_group_response : unit -> unit
val make_delete_group_request :
  group_id:string -> organization_id:string -> unit -> delete_group_request
val make_delete_email_monitoring_configuration_response : unit -> unit
val make_delete_email_monitoring_configuration_request :
  organization_id:string ->
    unit -> delete_email_monitoring_configuration_request
val make_delete_availability_configuration_response : unit -> unit
val make_delete_availability_configuration_request :
  domain_name:string ->
    organization_id:string ->
      unit -> delete_availability_configuration_request
val make_delete_alias_response : unit -> unit
val make_delete_alias_request :
  alias:string ->
    entity_id:string ->
      organization_id:string -> unit -> delete_alias_request
val make_delete_access_control_rule_response : unit -> unit
val make_delete_access_control_rule_request :
  name:string ->
    organization_id:string -> unit -> delete_access_control_rule_request
val make_create_user_response :
  ?user_id:string -> unit -> create_user_response
val make_create_user_request :
  ?identity_provider_user_id:string ->
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
val make_create_identity_center_application_response :
  ?application_arn:string ->
    unit -> create_identity_center_application_response
val make_create_identity_center_application_request :
  ?client_token:string ->
    instance_arn:string ->
      name:string -> unit -> create_identity_center_application_request
val make_create_group_response :
  ?group_id:string -> unit -> create_group_response
val make_create_group_request :
  ?hidden_from_global_address_list:bool ->
    name:string -> organization_id:string -> unit -> create_group_request
val make_create_availability_configuration_response : unit -> unit
val make_create_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
    ?ews_provider:ews_availability_provider ->
      ?client_token:string ->
        domain_name:string ->
          organization_id:string ->
            unit -> create_availability_configuration_request
val make_create_alias_response : unit -> unit
val make_create_alias_request :
  alias:string ->
    entity_id:string ->
      organization_id:string -> unit -> create_alias_request
val make_cancel_mailbox_export_job_response : unit -> unit
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
val make_associate_member_to_group_response : unit -> unit
val make_associate_member_to_group_request :
  member_id:string ->
    group_id:string ->
      organization_id:string -> unit -> associate_member_to_group_request
val make_associate_delegate_to_resource_response : unit -> unit
val make_associate_delegate_to_resource_request :
  entity_id:string ->
    resource_id:string ->
      organization_id:string ->
        unit -> associate_delegate_to_resource_request(** {1:operations Operations} *)

module AssociateDelegateToResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_delegate_to_resource_request ->
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
        (unit,
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
     "Updates data for the user. To have the latest information, it must be preceded by a [DescribeUser] call. The dataset in the request should be the one expected when performing another [DescribeUser] call.\n"]