(** 
    WorkMail client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Service.descriptor

(** 
    You can't perform a write operation against a read-only directory.
     *)
type unsupported_operation_exception = {
  message: string option;
  
}

(** 
    The organization must have a valid state to perform certain operations on the organization or its members.
     *)
type organization_state_exception = {
  message: string option;
  
}

(** 
    An operation received a valid organization identifier that either doesn't belong or exist in the system.
     *)
type organization_not_found_exception = {
  message: string option;
  
}

(** 
    One or more of the input parameters don't match the service's restrictions.
     *)
type invalid_parameter_exception = {
  message: string option;
  
}

(** 
    You are performing an operation on a user, group, or resource that isn't in the expected state, such as trying to delete an active user.
     *)
type entity_state_exception = {
  message: string option;
  
}

(** 
    The identifier supplied for the user, group, or resource does not exist in your organization.
     *)
type entity_not_found_exception = {
  message: string option;
  
}

(** 
    The directory is unavailable. It might be located in another Region or deleted.
     *)
type directory_unavailable_exception = {
  message: string option;
  
}

(** 
    The directory service doesn't recognize the credentials supplied by WorkMail.
     *)
type directory_service_authentication_failed_exception = {
  message: string option;
  
}

type update_user_response = unit

type user_role = | REMOTE_USER
  | SYSTEM_USER
  | RESOURCE
  | USER

type update_user_request = {
  office: string option;
  (** 
    Updates the user's office.
     *)

  country: string option;
  (** 
    Updates the user's country.
     *)

  department: string option;
  (** 
    Updates the user's department.
     *)

  zip_code: string option;
  (** 
    Updates the user's zipcode.
     *)

  company: string option;
  (** 
    Updates the user's company.
     *)

  city: string option;
  (** 
    Updates the user's city.
     *)

  job_title: string option;
  (** 
    Updates the user's job title.
     *)

  street: string option;
  (** 
    Updates the user's street address.
     *)

  telephone: string option;
  (** 
    Updates the user's contact details.
     *)

  initials: string option;
  (** 
    Updates the user's initials.
     *)

  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the user is hidden from the global address list.
     *)

  last_name: string option;
  (** 
    Updates the user's last name.
     *)

  first_name: string option;
  (** 
    Updates the user's first name.
     *)

  display_name: string option;
  (** 
    Updates the display name of the user.
     *)

  role: user_role option;
  (** 
    Updates the user role.
    
     You cannot pass {i SYSTEM_USER} or {i RESOURCE}.
      *)

  user_id: string;
  (** 
    The identifier for the user to be updated.
    
     The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: user\@domain.tld
               
               }
            {- User name: user
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the user exists.
     *)

}

(** 
    The user, group, or resource name isn't unique in WorkMail.
     *)
type name_availability_exception = {
  message: string option;
  
}

(** 
    After a domain has been added to the organization, it must be verified. The domain is not yet verified.
     *)
type mail_domain_state_exception = {
  message: string option;
  
}

(** 
    The domain specified is not found in your organization.
     *)
type mail_domain_not_found_exception = {
  message: string option;
  
}

(** 
    The configuration for a resource isn't valid. A resource must either be able to auto-respond to requests or have at least one delegate associated that can do so on its behalf.
     *)
type invalid_configuration_exception = {
  message: string option;
  
}

(** 
    The email address that you're trying to assign is already created for a different user, group, or resource.
     *)
type email_address_in_use_exception = {
  message: string option;
  
}

type update_resource_response = unit

(** 
    At least one delegate must be associated to the resource to disable automatic replies from the resource.
     *)
type booking_options = {
  auto_decline_conflicting_requests: bool option;
  (** 
    The resource's ability to automatically decline any conflicting requests.
     *)

  auto_decline_recurring_requests: bool option;
  (** 
    The resource's ability to automatically decline any recurring requests.
     *)

  auto_accept_requests: bool option;
  (** 
    The resource's ability to automatically reply to requests. If disabled, delegates must be associated to the resource.
     *)

}

type resource_type = | EQUIPMENT
  | ROOM

type update_resource_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the resource is hidden from the global address list.
     *)

  type_: resource_type option;
  (** 
    Updates the resource type.
     *)

  description: string option;
  (** 
    Updates the resource description.
     *)

  booking_options: booking_options option;
  (** 
    The resource's booking options to be updated.
     *)

  name: string option;
  (** 
    The name of the resource to be updated.
     *)

  resource_id: string;
  (** 
    The identifier of the resource to be updated.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource\@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier associated with the organization for which the resource is updated.
     *)

}

type update_primary_email_address_response = unit

type update_primary_email_address_request = {
  email: string;
  (** 
    The value of the email to be updated as primary.
     *)

  entity_id: string;
  (** 
    The user, group, or resource to update.
    
     The identifier can accept {i UseriD, ResourceId, or GroupId}, {i Username, Resourcename, or Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization that contains the user, group, or resource to update.
     *)

}

type update_mobile_device_access_rule_response = unit

type mobile_device_access_rule_effect = | DENY
  | ALLOW

type update_mobile_device_access_rule_request = {
  not_device_user_agents: string list option;
  (** 
    User agents that the updated rule {b will not} match. All other user agents will match.
     *)

  device_user_agents: string list option;
  (** 
    User agents that the updated rule will match.
     *)

  not_device_operating_systems: string list option;
  (** 
    Device operating systems that the updated rule {b will not} match. All other device operating systems will match.
     *)

  device_operating_systems: string list option;
  (** 
    Device operating systems that the updated rule will match.
     *)

  not_device_models: string list option;
  (** 
    Device models that the updated rule {b will not} match. All other device models will match.
     *)

  device_models: string list option;
  (** 
    Device models that the updated rule will match.
     *)

  not_device_types: string list option;
  (** 
    Device types that the updated rule {b will not} match. All other device types will match.
     *)

  device_types: string list option;
  (** 
    Device types that the updated rule will match.
     *)

  effect_: mobile_device_access_rule_effect;
  (** 
    The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].
     *)

  description: string option;
  (** 
    The updated rule description.
     *)

  name: string;
  (** 
    The updated rule name.
     *)

  mobile_device_access_rule_id: string;
  (** 
    The identifier of the rule to be updated.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which the rule will be updated.
     *)

}

type update_mailbox_quota_response = unit

type update_mailbox_quota_request = {
  mailbox_quota: int;
  (** 
    The updated mailbox quota, in MB, for the specified user.
     *)

  user_id: string;
  (** 
    The identifer for the user for whom to update the mailbox quota.
    
     The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: user\@domain.tld
               
               }
            {- User name: user
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization that contains the user for whom to update the mailbox quota.
     *)

}

(** 
    The resource cannot be found.
     *)
type resource_not_found_exception = {
  message: string option;
  
}

(** 
    The request exceeds the limit of the resource.
     *)
type limit_exceeded_exception = {
  message: string option;
  
}

type update_impersonation_role_response = unit

type impersonation_role_type = | READ_ONLY
  | FULL_ACCESS

type access_effect = | DENY
  | ALLOW

(** 
    The rules for the given impersonation role.
     *)
type impersonation_rule = {
  not_target_users: string list option;
  (** 
    A list of user IDs that don't match the rule.
     *)

  target_users: string list option;
  (** 
    A list of user IDs that match the rule.
     *)

  effect_: access_effect;
  (** 
    The effect of the rule when it matches the input. Allowed effect values are [ALLOW] or [DENY].
     *)

  description: string option;
  (** 
    The rule description.
     *)

  name: string option;
  (** 
    The rule name.
     *)

  impersonation_rule_id: string;
  (** 
    The identifier of the rule.
     *)

}

type update_impersonation_role_request = {
  rules: impersonation_rule list;
  (** 
    The updated list of rules.
     *)

  description: string option;
  (** 
    The updated impersonation role description.
     *)

  type_: impersonation_role_type;
  (** 
    The updated impersonation role type.
     *)

  name: string;
  (** 
    The updated impersonation role name.
     *)

  impersonation_role_id: string;
  (** 
    The ID of the impersonation role to update.
     *)

  organization_id: string;
  (** 
    The WorkMail organization that contains the impersonation role to update.
     *)

}

type update_group_response = unit

type update_group_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the group is hidden from the global address list.
     *)

  group_id: string;
  (** 
    The identifier for the group to be updated.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group\@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the group exists.
     *)

}

type update_default_mail_domain_response = unit

type update_default_mail_domain_request = {
  domain_name: string;
  (** 
    The domain name that will become the default domain.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which to list domains.
     *)

}

type update_availability_configuration_response = unit

(** 
    Describes an EWS based availability provider. This is only used as input to the service.
     *)
type ews_availability_provider = {
  ews_password: string;
  (** 
    The password used to authenticate the remote EWS server.
     *)

  ews_username: string;
  (** 
    The username used to authenticate the remote EWS server.
     *)

  ews_endpoint: string;
  (** 
    The endpoint of the remote EWS server.
     *)

}

(** 
    Describes a Lambda based availability provider.
     *)
type lambda_availability_provider = {
  lambda_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the Lambda that acts as the availability provider.
     *)

}

type update_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  (** 
    The Lambda availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider]. The previously stored provider will be overridden by the one provided.
     *)

  ews_provider: ews_availability_provider option;
  (** 
    The EWS availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider]. The previously stored provider will be overridden by the one provided.
     *)

  domain_name: string;
  (** 
    The domain to which the provider applies the availability configuration.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the [AvailabilityConfiguration] will be updated.
     *)

}

type untag_resource_response = unit

type untag_resource_request = {
  tag_keys: string list;
  (** 
    The tag keys.
     *)

  resource_ar_n: string;
  (** 
    The resource ARN.
     *)

}

type test_availability_configuration_response = {
  failure_reason: string option;
  (** 
    String containing the reason for a failed test if [TestPassed] is false.
     *)

  test_passed: bool option;
  (** 
    Boolean indicating whether the test passed or failed.
     *)

}

type test_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  
  ews_provider: ews_availability_provider option;
  
  domain_name: string option;
  (** 
    The domain to which the provider applies. If this field is provided, a stored availability provider associated to this domain name will be tested.
     *)

  organization_id: string;
  (** 
    The WorkMail organization where the availability provider will be tested.
     *)

}

(** 
    The resource can have up to 50 user-applied tags.
     *)
type too_many_tags_exception = {
  message: string option;
  
}

type tag_resource_response = unit

(** 
    Describes a tag applied to a resource.
     *)
type tag = {
  value: string;
  (** 
    The value of the tag.
     *)

  key: string;
  (** 
    The key of the tag.
     *)

}

type tag_resource_request = {
  tags: tag list;
  (** 
    The tag key-value pairs.
     *)

  resource_ar_n: string;
  (** 
    The resource ARN.
     *)

}

type start_mailbox_export_job_response = {
  job_id: string option;
  (** 
    The job ID.
     *)

}

type start_mailbox_export_job_request = {
  s3_prefix: string;
  (** 
    The S3 bucket prefix.
     *)

  s3_bucket_name: string;
  (** 
    The name of the S3 bucket.
     *)

  kms_key_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key that encrypts the exported mailbox content.
     *)

  role_arn: string;
  (** 
    The ARN of the AWS Identity and Access Management (IAM) role that grants write permission to the S3 bucket.
     *)

  description: string option;
  (** 
    The mailbox export job description.
     *)

  entity_id: string;
  (** 
    The identifier of the user or resource associated with the mailbox.
    
     The identifier can accept {i UserId or ResourceId}, {i Username or Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789 , or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier associated with the organization.
     *)

  client_token: string;
  (** 
    The idempotency token for the client request.
     *)

}

(** 
    The supplied password doesn't match the minimum security constraints, such as length or use of special characters.
     *)
type invalid_password_exception = {
  message: string option;
  
}

type reset_password_response = unit

type reset_password_request = {
  password: string;
  (** 
    The new password for the user.
     *)

  user_id: string;
  (** 
    The identifier of the user for whom the password is reset.
     *)

  organization_id: string;
  (** 
    The identifier of the organization that contains the user for which the password is reset.
     *)

}

(** 
    The user, group, or resource that you're trying to register is already registered.
     *)
type entity_already_registered_exception = {
  message: string option;
  
}

type register_to_work_mail_response = unit

type register_to_work_mail_request = {
  email: string;
  (** 
    The email for the user, group, or resource to be updated.
     *)

  entity_id: string;
  (** 
    The identifier for the user, group, or resource to be updated.
    
     The identifier can accept {i UserId, ResourceId, or GroupId}, or {i Username, Resourcename, or Groupname}. The following identity formats are available:
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the user, group, or resource exists.
     *)

}

(** 
    The domain you're trying to change is in use by another user or organization in your account. See the error message for details.
     *)
type mail_domain_in_use_exception = {
  message: string option;
  
}

type register_mail_domain_response = unit

type register_mail_domain_request = {
  domain_name: string;
  (** 
    The name of the mail domain to create in WorkMail and SES.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which you're creating the domain.
     *)

  client_token: string option;
  (** 
    Idempotency token used when retrying requests.
     *)

}

type put_retention_policy_response = unit

type folder_name = | JUNK_EMAIL
  | DRAFTS
  | SENT_ITEMS
  | DELETED_ITEMS
  | INBOX

type retention_action = | PERMANENTLY_DELETE
  | DELETE
  | NONE

(** 
    The configuration applied to an organization's folders by its retention policy.
     *)
type folder_configuration = {
  period: int option;
  (** 
    The number of days for which the folder-configuration action applies.
     *)

  action: retention_action;
  (** 
    The action to take on the folder contents at the end of the folder configuration period.
     *)

  name: folder_name;
  (** 
    The folder name.
     *)

}

type put_retention_policy_request = {
  folder_configurations: folder_configuration list;
  (** 
    The retention policy folder configurations.
     *)

  description: string option;
  (** 
    The retention policy description.
     *)

  name: string;
  (** 
    The retention policy name.
     *)

  id: string option;
  (** 
    The retention policy ID.
     *)

  organization_id: string;
  (** 
    The organization ID.
     *)

}

type put_mobile_device_access_override_response = unit

type put_mobile_device_access_override_request = {
  description: string option;
  (** 
    A description of the override.
     *)

  effect_: mobile_device_access_rule_effect;
  (** 
    The effect of the override, [ALLOW] or [DENY].
     *)

  device_id: string;
  (** 
    The mobile device for which you create the override. [DeviceId] is case insensitive.
     *)

  user_id: string;
  (** 
    The WorkMail user for which you create the override. Accepts the following types of user identities:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  organization_id: string;
  (** 
    Identifies the WorkMail organization for which you create the override.
     *)

}

type put_mailbox_permissions_response = unit

type permission_type = | SEND_ON_BEHALF
  | SEND_AS
  | FULL_ACCESS

type put_mailbox_permissions_request = {
  permission_values: permission_type list;
  (** 
    The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other folder-level permissions set on the mailbox.
     *)

  grantee_id: string;
  (** 
    The identifier of the user, group, or resource to which to grant the permissions.
    
     The identifier can be {i UserId, ResourceID, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.
     
      {ul
           {- Grantee ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: grantee\@domain.tld
               
               }
            {- Grantee name: grantee
               
               }
           
      }
       *)

  entity_id: string;
  (** 
    The identifier of the user or resource for which to update mailbox permissions.
    
     The identifier can be {i UserId, ResourceID, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier of the organization under which the user, group, or resource exists.
     *)

}

type put_inbound_dmarc_settings_response = unit

type put_inbound_dmarc_settings_request = {
  enforced: bool;
  (** 
    Enforces or suspends a policy after it's applied.
     *)

  organization_id: string;
  (** 
    The ID of the organization that you are applying the DMARC policy to.
     *)

}

type put_email_monitoring_configuration_response = unit

type put_email_monitoring_configuration_request = {
  log_group_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email monitoring configuration.
     *)

  role_arn: string;
  (** 
    The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring configuration.
     *)

  organization_id: string;
  (** 
    The ID of the organization for which the email monitoring configuration is set.
     *)

}

type put_access_control_rule_response = unit

type access_control_rule_effect = | DENY
  | ALLOW

type put_access_control_rule_request = {
  not_impersonation_role_ids: string list option;
  (** 
    Impersonation role IDs to exclude from the rule.
     *)

  impersonation_role_ids: string list option;
  (** 
    Impersonation role IDs to include in the rule.
     *)

  organization_id: string;
  (** 
    The identifier of the organization.
     *)

  not_user_ids: string list option;
  (** 
    User IDs to exclude from the rule.
     *)

  user_ids: string list option;
  (** 
    User IDs to include in the rule.
     *)

  not_actions: string list option;
  (** 
    Access protocol actions to exclude from the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  actions: string list option;
  (** 
    Access protocol actions to include in the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  not_ip_ranges: string list option;
  (** 
    IPv4 CIDR ranges to exclude from the rule.
     *)

  ip_ranges: string list option;
  (** 
    IPv4 CIDR ranges to include in the rule.
     *)

  description: string;
  (** 
    The rule description.
     *)

  effect_: access_control_rule_effect;
  (** 
    The rule effect.
     *)

  name: string;
  (** 
    The rule name.
     *)

}

type entity_state = | DELETED
  | DISABLED
  | ENABLED

(** 
    The representation of an WorkMail user.
     *)
type user = {
  disabled_date: float option;
  (** 
    The date indicating when the user was disabled from WorkMail use.
     *)

  enabled_date: float option;
  (** 
    The date indicating when the user was enabled for WorkMail use.
     *)

  user_role: user_role option;
  (** 
    The role of the user.
     *)

  state: entity_state option;
  (** 
    The state of the user, which can be ENABLED, DISABLED, or DELETED.
     *)

  display_name: string option;
  (** 
    The display name of the user.
     *)

  name: string option;
  (** 
    The name of the user.
     *)

  email: string option;
  (** 
    The email of the user.
     *)

  id: string option;
  (** 
    The identifier of the user.
     *)

}

type list_users_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. This value is `null` when there are no more results to return.
     *)

  users: user list option;
  (** 
    The overview of users for an organization.
     *)

}

(** 
    Filtering options for {i ListUsers} operation. This is only used as input to Operation.
     *)
type list_users_filters = {
  state: entity_state option;
  (** 
    Filters only users with the provided state.
     *)

  primary_email_prefix: string option;
  (** 
    Filters only users with the provided email prefix.
     *)

  display_name_prefix: string option;
  (** 
    Filters only users with the provided display name prefix.
     *)

  username_prefix: string option;
  (** 
    Filters only users with the provided username prefix.
     *)

}

type list_users_request = {
  filters: list_users_filters option;
  (** 
    Limit the user search results based on the filter criteria. You can only use one filter per request.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the users exist.
     *)

}

type list_tags_for_resource_response = {
  tags: tag list option;
  (** 
    A list of tag key-value pairs.
     *)

}

type list_tags_for_resource_request = {
  resource_ar_n: string;
  (** 
    The resource ARN.
     *)

}

(** 
    The representation of a resource.
     *)
type resource = {
  description: string option;
  (** 
    Resource description.
     *)

  disabled_date: float option;
  (** 
    The date indicating when the resource was disabled from WorkMail use.
     *)

  enabled_date: float option;
  (** 
    The date indicating when the resource was enabled for WorkMail use.
     *)

  state: entity_state option;
  (** 
    The state of the resource, which can be ENABLED, DISABLED, or DELETED.
     *)

  type_: resource_type option;
  (** 
    The type of the resource: equipment or room.
     *)

  name: string option;
  (** 
    The name of the resource.
     *)

  email: string option;
  (** 
    The email of the resource.
     *)

  id: string option;
  (** 
    The identifier of the resource.
     *)

}

type list_resources_response = {
  next_token: string option;
  (** 
    The token used to paginate through all the organization's resources. While results are still available, it has an associated value. When the last page is reached, the token is empty.
     *)

  resources: resource list option;
  (** 
    One page of the organization's resource representation.
     *)

}

(** 
    Filtering options for {i ListResources} operation. This is only used as input to Operation.
     *)
type list_resources_filters = {
  state: entity_state option;
  (** 
    Filters only resource with the provided state.
     *)

  primary_email_prefix: string option;
  (** 
    Filters only resource with the provided primary email prefix.
     *)

  name_prefix: string option;
  (** 
    Filters only resource that start with the entered name prefix .
     *)

}

type list_resources_request = {
  filters: list_resources_filters option;
  (** 
    Limit the resource search results based on the filter criteria. You can only use one filter per request.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the resources exist.
     *)

}

type member_type = | USER
  | GROUP

(** 
    The name of the attribute, which is one of the values defined in the UserAttribute enumeration.
     *)
type delegate = {
  type_: member_type;
  (** 
    The type of the delegate: user or group.
     *)

  id: string;
  (** 
    The identifier for the user or group associated as the resource's delegate.
     *)

}

type list_resource_delegates_response = {
  next_token: string option;
  (** 
    The token used to paginate through the delegates associated with a resource. While results are still available, it has an associated value. When the last page is reached, the token is empty.
     *)

  delegates: delegate list option;
  (** 
    One page of the resource's delegates.
     *)

}

type list_resource_delegates_request = {
  max_results: int option;
  (** 
    The number of maximum results in a page.
     *)

  next_token: string option;
  (** 
    The token used to paginate through the delegates associated with a resource.
     *)

  resource_id: string;
  (** 
    The identifier for the resource whose delegates are listed.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource\@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization that contains the resource for which delegates are listed.
     *)

}

(** 
    The representation of an organization.
     *)
type organization_summary = {
  state: string option;
  (** 
    The state associated with the organization.
     *)

  error_message: string option;
  (** 
    The error message associated with the organization. It is only present if unexpected behavior has occurred with regards to the organization. It provides insight or solutions regarding unexpected behavior.
     *)

  default_mail_domain: string option;
  (** 
    The default email domain associated with the organization.
     *)

  alias: string option;
  (** 
    The alias associated with the organization.
     *)

  organization_id: string option;
  (** 
    The identifier associated with the organization.
     *)

}

type list_organizations_response = {
  next_token: string option;
  [@ocaml.doc {| 
    The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.
     |}]

  organization_summaries: organization_summary list option;
  (** 
    The overview of owned organizations presented as a list of organization summaries.
     *)

}

type list_organizations_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

}

(** 
    A rule that controls access to mobile devices for an WorkMail group.
     *)
type mobile_device_access_rule = {
  date_modified: float option;
  (** 
    The date and time at which an access rule was modified.
     *)

  date_created: float option;
  (** 
    The date and time at which an access rule was created.
     *)

  not_device_user_agents: string list option;
  (** 
    Device user agents that a rule {b will not} match. All other device user agents will match.
     *)

  device_user_agents: string list option;
  (** 
    Device user agents that a rule will match.
     *)

  not_device_operating_systems: string list option;
  (** 
    Device operating systems that a rule {b will not} match. All other device types will match.
     *)

  device_operating_systems: string list option;
  (** 
    Device operating systems that a rule will match.
     *)

  not_device_models: string list option;
  (** 
    Device models that a rule {b will not} match. All other device models will match.
     *)

  device_models: string list option;
  (** 
    Device models that a rule will match.
     *)

  not_device_types: string list option;
  (** 
    Device types that a rule {b will not} match. All other device types will match.
     *)

  device_types: string list option;
  (** 
    Device types that a rule will match.
     *)

  effect_: mobile_device_access_rule_effect option;
  (** 
    The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].
     *)

  description: string option;
  (** 
    The description of a mobile access rule.
     *)

  name: string option;
  (** 
    The name of a mobile access rule.
     *)

  mobile_device_access_rule_id: string option;
  (** 
    The ID assigned to a mobile access rule.
     *)

}

type list_mobile_device_access_rules_response = {
  rules: mobile_device_access_rule list option;
  (** 
    The list of mobile device access rules that exist under the specified WorkMail organization.
     *)

}

type list_mobile_device_access_rules_request = {
  organization_id: string;
  (** 
    The WorkMail organization for which to list the rules.
     *)

}

(** 
    The override object.
     *)
type mobile_device_access_override = {
  date_modified: float option;
  (** 
    The date the override was last modified.
     *)

  date_created: float option;
  (** 
    The date the override was first created.
     *)

  description: string option;
  (** 
    A description of the override.
     *)

  effect_: mobile_device_access_rule_effect option;
  (** 
    The effect of the override, [ALLOW] or [DENY].
     *)

  device_id: string option;
  (** 
    The device to which the override applies.
     *)

  user_id: string option;
  (** 
    The WorkMail user to which the access override applies.
     *)

}

type list_mobile_device_access_overrides_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The value is “null” when there are no more results to return.
     *)

  overrides: mobile_device_access_override list option;
  (** 
    The list of mobile device access overrides that exist for the specified WorkMail organization and user.
     *)

}

type list_mobile_device_access_overrides_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not require a token.
     *)

  device_id: string option;
  (** 
    The mobile device to which the access override applies.
     *)

  user_id: string option;
  (** 
    The WorkMail user under which you list the mobile device access overrides. Accepts the following types of user identities:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  organization_id: string;
  (** 
    The WorkMail organization under which to list mobile device access overrides.
     *)

}

(** 
    The data for a given domain.
     *)
type mail_domain_summary = {
  default_domain: bool option;
  (** 
    Whether the domain is default or not.
     *)

  domain_name: string option;
  (** 
    The domain name.
     *)

}

type list_mail_domains_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The value becomes [null] when there are no more results to return.
     *)

  mail_domains: mail_domain_summary list option;
  (** 
    The list of mail domain summaries, specifying domains that exist in the specified WorkMail organization, along with the information about whether the domain is or isn't the default.
     *)

}

type list_mail_domains_request = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not require a token.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which to list domains.
     *)

}

(** 
    Permission granted to a user, group, or resource to access a certain aspect of another user, group, or resource mailbox.
     *)
type permission = {
  permission_values: permission_type list;
  (** 
    The permissions granted to the grantee. SEND_AS allows the grantee to send email as the owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF allows the grantee to send email on behalf of the owner of the mailbox (the grantee is not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee full access to the mailbox, irrespective of other folder-level permissions set on the mailbox.
     *)

  grantee_type: member_type;
  (** 
    The type of user, group, or resource referred to in GranteeId.
     *)

  grantee_id: string;
  (** 
    The identifier of the user, group, or resource to which the permissions are granted.
     *)

}

type list_mailbox_permissions_response = {
  next_token: string option;
  [@ocaml.doc {| 
    The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.
     |}]

  permissions: permission list option;
  (** 
    One page of the user, group, or resource mailbox permissions.
     *)

}

type list_mailbox_permissions_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  entity_id: string;
  (** 
    The identifier of the user, or resource for which to list mailbox permissions.
    
     The entity ID can accept {i UserId or ResourceId}, {i Username or Resourcename}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, or r-0123456789a0123456789b0123456789
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier of the organization under which the user, group, or resource exists.
     *)

}

type mailbox_export_job_state = | CANCELLED
  | FAILED
  | COMPLETED
  | RUNNING

(** 
    The details of a mailbox export job, including the user or resource ID associated with the mailbox and the S3 bucket that the mailbox contents are exported to.
     *)
type mailbox_export_job = {
  end_time: float option;
  (** 
    The mailbox export job end timestamp.
     *)

  start_time: float option;
  (** 
    The mailbox export job start timestamp.
     *)

  state: mailbox_export_job_state option;
  (** 
    The state of the mailbox export job.
     *)

  estimated_progress: int option;
  (** 
    The estimated progress of the mailbox export job, in percentage points.
     *)

  s3_path: string option;
  (** 
    The path to the S3 bucket and file that the mailbox export job exports to.
     *)

  s3_bucket_name: string option;
  (** 
    The name of the S3 bucket.
     *)

  description: string option;
  (** 
    The mailbox export job description.
     *)

  entity_id: string option;
  (** 
    The identifier of the user or resource associated with the mailbox.
     *)

  job_id: string option;
  (** 
    The identifier of the mailbox export job.
     *)

}

type list_mailbox_export_jobs_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results.
     *)

  jobs: mailbox_export_job list option;
  (** 
    The mailbox export job details.
     *)

}

type list_mailbox_export_jobs_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results.
     *)

  organization_id: string;
  (** 
    The organization ID.
     *)

}

(** 
    An impersonation role for the given WorkMail organization.
     *)
type impersonation_role = {
  date_modified: float option;
  (** 
    The date when the impersonation role was last modified.
     *)

  date_created: float option;
  (** 
    The date when the impersonation role was created.
     *)

  type_: impersonation_role_type option;
  (** 
    The impersonation role type.
     *)

  name: string option;
  (** 
    The impersonation role name.
     *)

  impersonation_role_id: string option;
  (** 
    The identifier of the impersonation role.
     *)

}

type list_impersonation_roles_response = {
  next_token: string option;
  (** 
    The token to retrieve the next page of results. The value is [null] when there are no results to return.
     *)

  roles: impersonation_role list option;
  (** 
    The list of impersonation roles under the given WorkMail organization.
     *)

}

type list_impersonation_roles_request = {
  max_results: int option;
  (** 
    The maximum number of results returned in a single call.
     *)

  next_token: string option;
  (** 
    The token used to retrieve the next page of results. The first call doesn't require a token.
     *)

  organization_id: string;
  (** 
    The WorkMail organization to which the listed impersonation roles belong.
     *)

}

(** 
    The identifier that contains the Group ID and name of a group.
     *)
type group_identifier = {
  group_name: string option;
  (** 
    Group name that matched the group.
     *)

  group_id: string option;
  (** 
    Group ID that matched the group.
     *)

}

type list_groups_for_entity_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. This value is `null` when there are no more results to return.
     *)

  groups: group_identifier list option;
  (** 
    The overview of groups in an organization.
     *)

}

(** 
    Filtering options for {i ListGroupsForEntity} operation. This is only used as input to Operation.
     *)
type list_groups_for_entity_filters = {
  group_name_prefix: string option;
  (** 
    Filters only group names that start with the provided name prefix.
     *)

}

type list_groups_for_entity_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  filters: list_groups_for_entity_filters option;
  (** 
    Limit the search results based on the filter criteria.
     *)

  entity_id: string;
  (** 
    The identifier for the entity.
    
     The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the entity exists.
     *)

}

(** 
    The representation of an WorkMail group.
     *)
type group = {
  disabled_date: float option;
  (** 
    The date indicating when the group was disabled from WorkMail use.
     *)

  enabled_date: float option;
  (** 
    The date indicating when the group was enabled for WorkMail use.
     *)

  state: entity_state option;
  (** 
    The state of the group, which can be ENABLED, DISABLED, or DELETED.
     *)

  name: string option;
  (** 
    The name of the group.
     *)

  email: string option;
  (** 
    The email of the group.
     *)

  id: string option;
  (** 
    The identifier of the group.
     *)

}

type list_groups_response = {
  next_token: string option;
  [@ocaml.doc {| 
    The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.
     |}]

  groups: group list option;
  (** 
    The overview of groups for an organization.
     *)

}

(** 
    Filtering options for {i ListGroups} operation. This is only used as input to Operation.
     *)
type list_groups_filters = {
  state: entity_state option;
  (** 
    Filters only groups with the provided state.
     *)

  primary_email_prefix: string option;
  (** 
    Filters only groups with the provided primary email prefix.
     *)

  name_prefix: string option;
  (** 
    Filters only groups with the provided name prefix.
     *)

}

type list_groups_request = {
  filters: list_groups_filters option;
  (** 
    Limit the search results based on the filter criteria. Only one filter per request is supported.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the groups exist.
     *)

}

(** 
    The representation of a user or group.
     *)
type member = {
  disabled_date: float option;
  (** 
    The date indicating when the member was disabled from WorkMail use.
     *)

  enabled_date: float option;
  (** 
    The date indicating when the member was enabled for WorkMail use.
     *)

  state: entity_state option;
  (** 
    The state of the member, which can be ENABLED, DISABLED, or DELETED.
     *)

  type_: member_type option;
  (** 
    A member can be a user or group.
     *)

  name: string option;
  (** 
    The name of the member.
     *)

  id: string option;
  (** 
    The identifier of the member.
     *)

}

type list_group_members_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  members: member list option;
  (** 
    The members associated to the group.
     *)

}

type list_group_members_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  group_id: string;
  (** 
    The identifier for the group to which the members (users or groups) are associated.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group\@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the group exists.
     *)

}

type availability_provider_type = | LAMBDA
  | EWS

(** 
    Describes an EWS based availability provider when returned from the service. It does not contain the password of the endpoint.
     *)
type redacted_ews_availability_provider = {
  ews_username: string option;
  (** 
    The username used to authenticate the remote EWS server.
     *)

  ews_endpoint: string option;
  (** 
    The endpoint of the remote EWS server.
     *)

}

(** 
    List all the [AvailabilityConfiguration]'s for the given WorkMail organization.
     *)
type availability_configuration = {
  date_modified: float option;
  (** 
    The date and time at which the availability configuration was last modified.
     *)

  date_created: float option;
  (** 
    The date and time at which the availability configuration was created.
     *)

  lambda_provider: lambda_availability_provider option;
  (** 
    If ProviderType is [LAMBDA] then this field contains [LambdaAvailabilityProvider]. Otherwise, it is not required.
     *)

  ews_provider: redacted_ews_availability_provider option;
  (** 
    If [ProviderType] is [EWS], then this field contains [RedactedEwsAvailabilityProvider]. Otherwise, it is not required.
     *)

  provider_type: availability_provider_type option;
  (** 
    Displays the provider type that applies to this domain.
     *)

  domain_name: string option;
  (** 
    Displays the domain to which the provider applies.
     *)

}

type list_availability_configurations_response = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The value is [null] when there are no further results to return.
     *)

  availability_configurations: availability_configuration list option;
  (** 
    The list of [AvailabilityConfiguration]'s that exist for the specified WorkMail organization.
     *)

}

type list_availability_configurations_request = {
  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not require a token.
     *)

  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the [AvailabilityConfiguration]'s will be listed.
     *)

}

type list_aliases_response = {
  next_token: string option;
  [@ocaml.doc {| 
    The token to use to retrieve the next page of results. The value is "null" when there are no more results to return.
     |}]

  aliases: string list option;
  (** 
    The entity's paginated aliases.
     *)

}

type list_aliases_request = {
  max_results: int option;
  (** 
    The maximum number of results to return in a single call.
     *)

  next_token: string option;
  (** 
    The token to use to retrieve the next page of results. The first call does not contain any tokens.
     *)

  entity_id: string;
  (** 
    The identifier for the entity for which to list the aliases.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the entity exists.
     *)

}

(** 
    A rule that controls access to an WorkMail organization.
     *)
type access_control_rule = {
  not_impersonation_role_ids: string list option;
  (** 
    Impersonation role IDs to exclude from the rule.
     *)

  impersonation_role_ids: string list option;
  (** 
    Impersonation role IDs to include in the rule.
     *)

  date_modified: float option;
  (** 
    The date that the rule was modified.
     *)

  date_created: float option;
  (** 
    The date that the rule was created.
     *)

  not_user_ids: string list option;
  (** 
    User IDs to exclude from the rule.
     *)

  user_ids: string list option;
  (** 
    User IDs to include in the rule.
     *)

  not_actions: string list option;
  (** 
    Access protocol actions to exclude from the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  actions: string list option;
  (** 
    Access protocol actions to include in the rule. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  not_ip_ranges: string list option;
  (** 
    IPv4 CIDR ranges to exclude from the rule.
     *)

  ip_ranges: string list option;
  (** 
    IPv4 CIDR ranges to include in the rule.
     *)

  description: string option;
  (** 
    The rule description.
     *)

  effect_: access_control_rule_effect option;
  (** 
    The rule effect.
     *)

  name: string option;
  (** 
    The rule name.
     *)

}

type list_access_control_rules_response = {
  rules: access_control_rule list option;
  (** 
    The access control rules.
     *)

}

type list_access_control_rules_request = {
  organization_id: string;
  (** 
    The identifier for the organization.
     *)

}

type get_mobile_device_access_override_response = {
  date_modified: float option;
  (** 
    The date the description was last modified.
     *)

  date_created: float option;
  (** 
    The date the override was first created.
     *)

  description: string option;
  (** 
    A description of the override.
     *)

  effect_: mobile_device_access_rule_effect option;
  (** 
    The effect of the override, [ALLOW] or [DENY].
     *)

  device_id: string option;
  (** 
    The device to which the access override applies.
     *)

  user_id: string option;
  (** 
    The WorkMail user to which the access override applies.
     *)

}

type get_mobile_device_access_override_request = {
  device_id: string;
  (** 
    The mobile device to which the override applies. [DeviceId] is case insensitive.
     *)

  user_id: string;
  (** 
    Identifies the WorkMail user for the override. Accepts the following types of user identities:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  organization_id: string;
  (** 
    The WorkMail organization to which you want to apply the override.
     *)

}

(** 
    The rule that a simulated user matches.
     *)
type mobile_device_access_matched_rule = {
  name: string option;
  (** 
    Name of a rule that a simulated user matches.
     *)

  mobile_device_access_rule_id: string option;
  (** 
    Identifier of the rule that a simulated user matches.
     *)

}

type get_mobile_device_access_effect_response = {
  matched_rules: mobile_device_access_matched_rule list option;
  (** 
    A list of the rules which matched the simulated user input and produced the effect.
     *)

  effect_: mobile_device_access_rule_effect option;
  (** 
    The effect of the simulated access, [ALLOW] or [DENY], after evaluating mobile device access rules in the WorkMail organization for the simulated user parameters.
     *)

}

type get_mobile_device_access_effect_request = {
  device_user_agent: string option;
  (** 
    Device user agent the simulated user will report.
     *)

  device_operating_system: string option;
  (** 
    Device operating system the simulated user will report.
     *)

  device_model: string option;
  (** 
    Device model the simulated user will report.
     *)

  device_type: string option;
  (** 
    Device type the simulated user will report.
     *)

  organization_id: string;
  (** 
    The WorkMail organization to simulate the access effect for.
     *)

}

(** 
    A DNS record uploaded to your DNS provider.
     *)
type dns_record = {
  value: string option;
  (** 
    The value returned by the DNS for a query to that hostname and record type.
     *)

  hostname: string option;
  (** 
    The DNS hostname.- For example, [domain.example.com].
     *)

  type_: string option;
  (** 
    The RFC 1035 record type. Possible values: [CNAME], [A], [MX].
     *)

}

type dns_record_verification_status = | FAILED
  | VERIFIED
  | PENDING

type get_mail_domain_response = {
  dkim_verification_status: dns_record_verification_status option;
  (** 
    Indicates the status of a DKIM verification.
     *)

  ownership_verification_status: dns_record_verification_status option;
  (** 
    Indicates the status of the domain ownership verification.
     *)

  is_default: bool option;
  (** 
    Specifies whether the domain is the default domain for your organization.
     *)

  is_test_domain: bool option;
  (** 
    Specifies whether the domain is a test domain provided by WorkMail, or a custom domain.
     *)

  records: dns_record list option;
  (** 
    A list of the DNS records that WorkMail recommends adding in your DNS provider for the best user experience. The records configure your domain with DMARC, SPF, DKIM, and direct incoming email traffic to SES. See admin guide for more details.
     *)

}

type get_mail_domain_request = {
  domain_name: string;
  (** 
    The domain from which you want to retrieve details.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the domain is retrieved.
     *)

}

type get_mailbox_details_response = {
  mailbox_size: float option;
  (** 
    The current mailbox size, in MB, for the specified user.
     *)

  mailbox_quota: int option;
  (** 
    The maximum allowed mailbox size, in MB, for the specified user.
     *)

}

type get_mailbox_details_request = {
  user_id: string;
  (** 
    The identifier for the user whose mailbox details are being requested.
    
     The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: user\@domain.tld
               
               }
            {- User name: user
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization that contains the user whose mailbox details are being requested.
     *)

}

(** 
    The impersonation rule that matched the input.
     *)
type impersonation_matched_rule = {
  name: string option;
  (** 
    The name of the rule that matched the input.
     *)

  impersonation_rule_id: string option;
  (** 
    The ID of the rule that matched the input
     *)

}

type get_impersonation_role_effect_response = {
  matched_rules: impersonation_matched_rule list option;
  (** 
    A list of the rules that match the input and produce the configured effect.
     *)

  effect_: access_effect option;
  (** 
    Effect of the impersonation role on the target user based on its rules. Available effects are [ALLOW] or [DENY].
     *)

  type_: impersonation_role_type option;
  (** 
    The impersonation role type.
     *)

}

type get_impersonation_role_effect_request = {
  target_user: string;
  (** 
    The WorkMail organization user chosen to test the impersonation role. The following identity formats are available:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  impersonation_role_id: string;
  (** 
    The impersonation role ID to test.
     *)

  organization_id: string;
  (** 
    The WorkMail organization where the impersonation role is defined.
     *)

}

type get_impersonation_role_response = {
  date_modified: float option;
  (** 
    The date when the impersonation role was last modified.
     *)

  date_created: float option;
  (** 
    The date when the impersonation role was created.
     *)

  rules: impersonation_rule list option;
  (** 
    The list of rules for the given impersonation role.
     *)

  description: string option;
  (** 
    The impersonation role description.
     *)

  type_: impersonation_role_type option;
  (** 
    The impersonation role type.
     *)

  name: string option;
  (** 
    The impersonation role name.
     *)

  impersonation_role_id: string option;
  (** 
    The impersonation role ID.
     *)

}

type get_impersonation_role_request = {
  impersonation_role_id: string;
  (** 
    The impersonation role ID to retrieve.
     *)

  organization_id: string;
  (** 
    The WorkMail organization from which to retrieve the impersonation role.
     *)

}

type get_default_retention_policy_response = {
  folder_configurations: folder_configuration list option;
  (** 
    The retention policy folder configurations.
     *)

  description: string option;
  (** 
    The retention policy description.
     *)

  name: string option;
  (** 
    The retention policy name.
     *)

  id: string option;
  (** 
    The retention policy ID.
     *)

}

type get_default_retention_policy_request = {
  organization_id: string;
  (** 
    The organization ID.
     *)

}

type get_access_control_effect_response = {
  matched_rules: string list option;
  (** 
    The rules that match the given parameters, resulting in an effect.
     *)

  effect_: access_control_rule_effect option;
  (** 
    The rule effect.
     *)

}

type get_access_control_effect_request = {
  impersonation_role_id: string option;
  (** 
    The impersonation role ID.
     *)

  user_id: string option;
  (** 
    The user ID.
     *)

  action: string;
  (** 
    The access protocol action. Valid values include [ActiveSync], [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].
     *)

  ip_address: string;
  (** 
    The IPv4 address.
     *)

  organization_id: string;
  (** 
    The identifier for the organization.
     *)

}

type disassociate_member_from_group_response = unit

type disassociate_member_from_group_request = {
  member_id: string;
  (** 
    The identifier for the member to be removed from the group.
    
     The member ID can accept {i UserID or GroupId}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Member ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: member\@domain.tld
               
               }
            {- Member name: member
               
               }
           
      }
       *)

  group_id: string;
  (** 
    The identifier for the group from which members are removed.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group\@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the group exists.
     *)

}

type disassociate_delegate_from_resource_response = unit

type disassociate_delegate_from_resource_request = {
  entity_id: string;
  (** 
    The identifier for the member (user, group) to be removed from the resource's delegates.
    
     The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Entity: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity: entity
               
               }
           
      }
       *)

  resource_id: string;
  (** 
    The identifier of the resource from which delegates' set members are removed.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource\@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the resource exists.
     *)

}

type describe_user_response = {
  office: string option;
  (** 
    Office where the user is located.
     *)

  country: string option;
  (** 
    Country where the user is located.
     *)

  department: string option;
  (** 
    Department of the user.
     *)

  zip_code: string option;
  (** 
    Zip code of the user.
     *)

  company: string option;
  (** 
    Company of the user.
     *)

  city: string option;
  (** 
    City where the user is located.
     *)

  job_title: string option;
  (** 
    Job title of the user.
     *)

  street: string option;
  (** 
    Street where the user is located.
     *)

  telephone: string option;
  (** 
    User's contact number.
     *)

  initials: string option;
  (** 
    Initials of the user.
     *)

  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the user is hidden from the global address list.
     *)

  last_name: string option;
  (** 
    Last name of the user.
     *)

  first_name: string option;
  (** 
    First name of the user.
     *)

  mailbox_deprovisioned_date: float option;
  (** 
    The date when the mailbox was removed for the user.
     *)

  mailbox_provisioned_date: float option;
  (** 
    The date when the mailbox was created for the user.
     *)

  disabled_date: float option;
  (** 
    The date and time at which the user was disabled for WorkMail usage, in UNIX epoch time format.
     *)

  enabled_date: float option;
  (** 
    The date and time at which the user was enabled for WorkMailusage, in UNIX epoch time format.
     *)

  user_role: user_role option;
  (** 
    In certain cases, other entities are modeled as users. If interoperability is enabled, resources are imported into WorkMail as users. Because different WorkMail organizations rely on different directory types, administrators can distinguish between an unregistered user (account is disabled and has a user role) and the directory administrators. The values are USER, RESOURCE, SYSTEM_USER, and REMOTE_USER.
     *)

  state: entity_state option;
  (** 
    The state of a user: enabled (registered to WorkMail) or disabled (deregistered or never registered to WorkMail).
     *)

  display_name: string option;
  (** 
    The display name of the user.
     *)

  email: string option;
  (** 
    The email of the user.
     *)

  name: string option;
  (** 
    The name for the user.
     *)

  user_id: string option;
  (** 
    The identifier for the described user.
     *)

}

type describe_user_request = {
  user_id: string;
  (** 
    The identifier for the user to be described.
    
     The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: user\@domain.tld
               
               }
            {- User name: user
               
               }
           
      }
       
        *)

  organization_id: string;
  (** 
    The identifier for the organization under which the user exists.
     *)

}

type describe_resource_response = {
  hidden_from_global_address_list: bool option;
  (** 
    If enabled, the resource is hidden from the global address list.
     *)

  description: string option;
  (** 
    Description of the resource.
     *)

  disabled_date: float option;
  (** 
    The date and time when a resource was disabled from WorkMail, in UNIX epoch time format.
     *)

  enabled_date: float option;
  (** 
    The date and time when a resource was enabled for WorkMail, in UNIX epoch time format.
     *)

  state: entity_state option;
  (** 
    The state of the resource: enabled (registered to WorkMail), disabled (deregistered or never registered to WorkMail), or deleted.
     *)

  booking_options: booking_options option;
  (** 
    The booking options for the described resource.
     *)

  type_: resource_type option;
  (** 
    The type of the described resource.
     *)

  name: string option;
  (** 
    The name of the described resource.
     *)

  email: string option;
  (** 
    The email of the described resource.
     *)

  resource_id: string option;
  (** 
    The identifier of the described resource.
     *)

}

type describe_resource_request = {
  resource_id: string;
  (** 
    The identifier of the resource to be described.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource\@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier associated with the organization for which the resource is described.
     *)

}

type describe_organization_response = {
  interoperability_enabled: bool option;
  (** 
    Indicates if interoperability is enabled for this organization.
     *)

  migration_admin: string option;
  (** 
    The user ID of the migration admin if migration is enabled for the organization.
     *)

  ar_n: string option;
  (** 
    The Amazon Resource Name (ARN) of the organization.
     *)

  error_message: string option;
  (** 
    (Optional) The error message indicating if unexpected behavior was encountered with regards to the organization.
     *)

  completed_date: float option;
  (** 
    The date at which the organization became usable in the WorkMail context, in UNIX epoch time format.
     *)

  default_mail_domain: string option;
  (** 
    The default mail domain associated with the organization.
     *)

  directory_type: string option;
  (** 
    The type of directory associated with the WorkMail organization.
     *)

  directory_id: string option;
  (** 
    The identifier for the directory associated with an WorkMail organization.
     *)

  state: string option;
  (** 
    The state of an organization.
     *)

  alias: string option;
  (** 
    The alias for an organization.
     *)

  organization_id: string option;
  (** 
    The identifier of an organization.
     *)

}

type describe_organization_request = {
  organization_id: string;
  (** 
    The identifier for the organization to be described.
     *)

}

type describe_mailbox_export_job_response = {
  end_time: float option;
  (** 
    The mailbox export job end timestamp.
     *)

  start_time: float option;
  (** 
    The mailbox export job start timestamp.
     *)

  error_info: string option;
  (** 
    Error information for failed mailbox export jobs.
     *)

  state: mailbox_export_job_state option;
  (** 
    The state of the mailbox export job.
     *)

  estimated_progress: int option;
  (** 
    The estimated progress of the mailbox export job, in percentage points.
     *)

  s3_path: string option;
  (** 
    The path to the S3 bucket and file that the mailbox export job is exporting to.
     *)

  s3_prefix: string option;
  (** 
    The S3 bucket prefix.
     *)

  s3_bucket_name: string option;
  (** 
    The name of the S3 bucket.
     *)

  kms_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key that encrypts the exported mailbox content.
     *)

  role_arn: string option;
  (** 
    The ARN of the AWS Identity and Access Management (IAM) role that grants write permission to the Amazon Simple Storage Service (Amazon S3) bucket.
     *)

  description: string option;
  (** 
    The mailbox export job description.
     *)

  entity_id: string option;
  (** 
    The identifier of the user or resource associated with the mailbox.
     *)

}

type describe_mailbox_export_job_request = {
  organization_id: string;
  (** 
    The organization ID.
     *)

  job_id: string;
  (** 
    The mailbox export job ID.
     *)

}

type describe_inbound_dmarc_settings_response = {
  enforced: bool option;
  (** 
    Lists the enforcement setting of the applied policy.
     *)

}

type describe_inbound_dmarc_settings_request = {
  organization_id: string;
  (** 
    Lists the ID of the given organization.
     *)

}

type describe_group_response = {
  hidden_from_global_address_list: bool option;
  (** 
    If the value is set to {i true}, the group is hidden from the address book.
     *)

  disabled_date: float option;
  (** 
    The date and time when a user was deregistered from WorkMail, in UNIX epoch time format.
     *)

  enabled_date: float option;
  (** 
    The date and time when a user was registered to WorkMail, in UNIX epoch time format.
     *)

  state: entity_state option;
  (** 
    The state of the user: enabled (registered to WorkMail) or disabled (deregistered or never registered to WorkMail).
     *)

  email: string option;
  (** 
    The email of the described group.
     *)

  name: string option;
  (** 
    The name of the described group.
     *)

  group_id: string option;
  (** 
    The identifier of the described group.
     *)

}

type describe_group_request = {
  group_id: string;
  (** 
    The identifier for the group to be described.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group\@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the group exists.
     *)

}

type entity_type = | RESOURCE
  | USER
  | GROUP

type describe_entity_response = {
  type_: entity_type option;
  (** 
    Entity type.
     *)

  name: string option;
  (** 
    Username, GroupName, or ResourceName based on entity type.
     *)

  entity_id: string option;
  (** 
    The entity ID under which the entity exists.
     *)

}

type describe_entity_request = {
  email: string;
  (** 
    The email under which the entity exists.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the entity exists.
     *)

}

type describe_email_monitoring_configuration_response = {
  log_group_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email monitoring configuration.
     *)

  role_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring configuration.
     *)

}

type describe_email_monitoring_configuration_request = {
  organization_id: string;
  (** 
    The ID of the organization for which the email monitoring configuration is described.
     *)

}

(** 
    You SES configuration has customizations that WorkMail cannot save. The error message lists the invalid setting. For examples of invalid settings, refer to {{:https://docs.aws.amazon.com/ses/latest/APIReference/API_CreateReceiptRule.html}CreateReceiptRule}.
     *)
type invalid_custom_ses_configuration_exception = {
  message: string option;
  
}

type deregister_mail_domain_response = unit

type deregister_mail_domain_request = {
  domain_name: string;
  (** 
    The domain to deregister in WorkMail and SES.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the domain will be deregistered.
     *)

}

type deregister_from_work_mail_response = unit

type deregister_from_work_mail_request = {
  entity_id: string;
  (** 
    The identifier for the member to be updated.
    
     The identifier can be {i UserId, ResourceId, or Group Id}, {i Username, Resourcename, or Groupname}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier for the organization under which the WorkMail entity exists.
     *)

}

type delete_user_response = unit

type delete_user_request = {
  user_id: string;
  (** 
    The identifier of the user to be deleted.
    
     The identifier can be the {i UserId} or {i Username}. The following identity formats are available:
     
      {ul
           {- User ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- User name: user
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization that contains the user to be deleted.
     *)

}

type delete_retention_policy_response = unit

type delete_retention_policy_request = {
  id: string;
  (** 
    The retention policy ID.
     *)

  organization_id: string;
  (** 
    The organization ID.
     *)

}

type delete_resource_response = unit

type delete_resource_request = {
  resource_id: string;
  (** 
    The identifier of the resource to be deleted.
    
     The identifier can accept {i ResourceId}, or {i Resourcename}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier associated with the organization from which the resource is deleted.
     *)

}

type delete_organization_response = {
  state: string option;
  (** 
    The state of the organization.
     *)

  organization_id: string option;
  (** 
    The organization ID.
     *)

}

type delete_organization_request = {
  force_delete: bool option;
  (** 
    Deletes a WorkMail organization even if the organization has enabled users.
     *)

  delete_directory: bool;
  (** 
    If true, deletes the AWS Directory Service directory associated with the organization.
     *)

  organization_id: string;
  (** 
    The organization ID.
     *)

  client_token: string option;
  (** 
    The idempotency token associated with the request.
     *)

}

type delete_mobile_device_access_rule_response = unit

type delete_mobile_device_access_rule_request = {
  mobile_device_access_rule_id: string;
  (** 
    The identifier of the rule to be deleted.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which the rule will be deleted.
     *)

}

type delete_mobile_device_access_override_response = unit

type delete_mobile_device_access_override_request = {
  device_id: string;
  (** 
    The mobile device for which you delete the override. [DeviceId] is case insensitive.
     *)

  user_id: string;
  (** 
    The WorkMail user for which you want to delete the override. Accepts the following types of user identities:
    
     {ul
          {- User ID: [12345678-1234-1234-1234-123456789012] or [S-1-1-12-1234567890-123456789-123456789-1234]
             
             }
           {- Email address: [user@domain.tld]
              
              }
           {- User name: [user]
              
              }
          
      }
       *)

  organization_id: string;
  (** 
    The WorkMail organization for which the access override will be deleted.
     *)

}

type delete_mailbox_permissions_response = unit

type delete_mailbox_permissions_request = {
  grantee_id: string;
  (** 
    The identifier of the entity for which to delete granted permissions.
    
     The identifier can be {i UserId, ResourceID, or Group Id}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Grantee ID: 12345678-1234-1234-1234-123456789012,r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: grantee\@domain.tld
               
               }
            {- Grantee name: grantee
               
               }
           
      }
       *)

  entity_id: string;
  (** 
    The identifier of the entity that owns the mailbox.
    
     The identifier can be {i UserId or Group Id}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Entity ID: 12345678-1234-1234-1234-123456789012, r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity name: entity
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The identifier of the organization under which the member (user or group) exists.
     *)

}

type delete_impersonation_role_response = unit

type delete_impersonation_role_request = {
  impersonation_role_id: string;
  (** 
    The ID of the impersonation role to delete.
     *)

  organization_id: string;
  (** 
    The WorkMail organization from which to delete the impersonation role.
     *)

}

type delete_group_response = unit

type delete_group_request = {
  group_id: string;
  (** 
    The identifier of the group to be deleted.
    
     The identifier can be the {i GroupId}, or {i Groupname}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization that contains the group.
     *)

}

type delete_email_monitoring_configuration_response = unit

type delete_email_monitoring_configuration_request = {
  organization_id: string;
  (** 
    The ID of the organization from which the email monitoring configuration is deleted.
     *)

}

type delete_availability_configuration_response = unit

type delete_availability_configuration_request = {
  domain_name: string;
  (** 
    The domain for which the [AvailabilityConfiguration] will be deleted.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the [AvailabilityConfiguration] will be deleted.
     *)

}

type delete_alias_response = unit

type delete_alias_request = {
  alias: string;
  (** 
    The aliases to be removed from the user's set of aliases. Duplicate entries in the list are collapsed into single entries (the list is transformed into a set).
     *)

  entity_id: string;
  (** 
    The identifier for the member (user or group) from which to have the aliases removed.
     *)

  organization_id: string;
  (** 
    The identifier for the organization under which the user exists.
     *)

}

type delete_access_control_rule_response = unit

type delete_access_control_rule_request = {
  name: string;
  (** 
    The name of the access control rule.
     *)

  organization_id: string;
  (** 
    The identifier for the organization.
     *)

}

(** 
    This user, group, or resource name is not allowed in WorkMail.
     *)
type reserved_name_exception = {
  message: string option;
  
}

type create_user_response = {
  user_id: string option;
  (** 
    The identifier for the new user.
     *)

}

type create_user_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If this parameter is enabled, the user will be hidden from the address book.
     *)

  last_name: string option;
  (** 
    The last name of the new user.
     *)

  first_name: string option;
  (** 
    The first name of the new user.
     *)

  role: user_role option;
  (** 
    The role of the new user.
    
     You cannot pass {i SYSTEM_USER} or {i RESOURCE} role in a single request. When a user role is not selected, the default role of {i USER} is selected.
      *)

  password: string option;
  (** 
    The password for the new user.
     *)

  display_name: string;
  (** 
    The display name for the new user.
     *)

  name: string;
  (** 
    The name for the new user. WorkMail directory user names have a maximum length of 64. All others have a maximum length of 20.
     *)

  organization_id: string;
  (** 
    The identifier of the organization for which the user is created.
     *)

}

type create_resource_response = {
  resource_id: string option;
  (** 
    The identifier of the new resource.
     *)

}

type create_resource_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If this parameter is enabled, the resource will be hidden from the address book.
     *)

  description: string option;
  (** 
    Resource description.
     *)

  type_: resource_type;
  (** 
    The type of the new resource. The available types are [equipment] and [room].
     *)

  name: string;
  (** 
    The name of the new resource.
     *)

  organization_id: string;
  (** 
    The identifier associated with the organization for which the resource is created.
     *)

}

(** 
    The directory is already in use by another WorkMail organization in the same account and Region.
     *)
type directory_in_use_exception = {
  message: string option;
  
}

type create_organization_response = {
  organization_id: string option;
  (** 
    The organization ID.
     *)

}

(** 
    The domain to associate with an WorkMail organization.
    
     When you configure a domain hosted in Amazon Route 53 (Route 53), all recommended DNS records are added to the organization when you create it. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html}Adding a domain} in the {i WorkMail Administrator Guide}.
      *)
type domain = {
  hosted_zone_id: string option;
  (** 
    The hosted zone ID for a domain hosted in Route 53. Required when configuring a domain hosted in Route 53.
     *)

  domain_name: string;
  (** 
    The fully qualified domain name.
     *)

}

type create_organization_request = {
  enable_interoperability: bool option;
  (** 
    When [true], allows organization interoperability between WorkMail and Microsoft Exchange. If [true], you must include a AD Connector directory ID in the request.
     *)

  kms_key_arn: string option;
  (** 
    The Amazon Resource Name (ARN) of a customer managed key from AWS KMS.
     *)

  domains: domain list option;
  (** 
    The email domains to associate with the organization.
     *)

  client_token: string option;
  (** 
    The idempotency token associated with the request.
     *)

  alias: string;
  (** 
    The organization alias.
     *)

  directory_id: string option;
  (** 
    The AWS Directory Service directory ID.
     *)

}

type create_mobile_device_access_rule_response = {
  mobile_device_access_rule_id: string option;
  (** 
    The identifier for the newly created mobile device access rule.
     *)

}

type create_mobile_device_access_rule_request = {
  not_device_user_agents: string list option;
  (** 
    Device user agents that the rule {b will not} match. All other device user agents will match.
     *)

  device_user_agents: string list option;
  (** 
    Device user agents that the rule will match.
     *)

  not_device_operating_systems: string list option;
  (** 
    Device operating systems that the rule {b will not} match. All other device operating systems will match.
     *)

  device_operating_systems: string list option;
  (** 
    Device operating systems that the rule will match.
     *)

  not_device_models: string list option;
  (** 
    Device models that the rule {b will not} match. All other device models will match.
     *)

  device_models: string list option;
  (** 
    Device models that the rule will match.
     *)

  not_device_types: string list option;
  (** 
    Device types that the rule {b will not} match. All other device types will match.
     *)

  device_types: string list option;
  (** 
    Device types that the rule will match.
     *)

  effect_: mobile_device_access_rule_effect;
  (** 
    The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].
     *)

  description: string option;
  (** 
    The rule description.
     *)

  name: string;
  (** 
    The rule name.
     *)

  client_token: string option;
  (** 
    The idempotency token for the client request.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which the rule will be created.
     *)

}

type create_impersonation_role_response = {
  impersonation_role_id: string option;
  (** 
    The new impersonation role ID.
     *)

}

type create_impersonation_role_request = {
  rules: impersonation_rule list;
  (** 
    The list of rules for the impersonation role.
     *)

  description: string option;
  (** 
    The description of the new impersonation role.
     *)

  type_: impersonation_role_type;
  (** 
    The impersonation role's type. The available impersonation role types are [READ_ONLY] or [FULL_ACCESS].
     *)

  name: string;
  (** 
    The name of the new impersonation role.
     *)

  organization_id: string;
  (** 
    The WorkMail organization to create the new impersonation role within.
     *)

  client_token: string option;
  (** 
    The idempotency token for the client request.
     *)

}

type create_group_response = {
  group_id: string option;
  (** 
    The identifier of the group.
     *)

}

type create_group_request = {
  hidden_from_global_address_list: bool option;
  (** 
    If this parameter is enabled, the group will be hidden from the address book.
     *)

  name: string;
  (** 
    The name of the group.
     *)

  organization_id: string;
  (** 
    The organization under which the group is to be created.
     *)

}

type create_availability_configuration_response = unit

type create_availability_configuration_request = {
  lambda_provider: lambda_availability_provider option;
  (** 
    Lambda availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider].
     *)

  ews_provider: ews_availability_provider option;
  (** 
    Exchange Web Services (EWS) availability provider definition. The request must contain exactly one provider definition, either [EwsProvider] or [LambdaProvider].
     *)

  domain_name: string;
  (** 
    The domain to which the provider applies.
     *)

  organization_id: string;
  (** 
    The WorkMail organization for which the [AvailabilityConfiguration] will be created.
     *)

  client_token: string option;
  (** 
    An idempotent token that ensures that an API request is executed only once.
     *)

}

type create_alias_response = unit

type create_alias_request = {
  alias: string;
  (** 
    The alias to add to the member set.
     *)

  entity_id: string;
  (** 
    The member (user or group) to which this alias is added.
     *)

  organization_id: string;
  (** 
    The organization under which the member (user or group) exists.
     *)

}

type cancel_mailbox_export_job_response = unit

type cancel_mailbox_export_job_request = {
  organization_id: string;
  (** 
    The organization ID.
     *)

  job_id: string;
  (** 
    The job ID.
     *)

  client_token: string;
  (** 
    The idempotency token for the client request.
     *)

}

type assume_impersonation_role_response = {
  expires_in: int option;
  (** 
    The authentication token's validity, in seconds.
     *)

  token: string option;
  (** 
    The authentication token for the impersonation role.
     *)

}

type assume_impersonation_role_request = {
  impersonation_role_id: string;
  (** 
    The impersonation role ID to assume.
     *)

  organization_id: string;
  (** 
    The WorkMail organization under which the impersonation role will be assumed.
     *)

}

type associate_member_to_group_response = unit

type associate_member_to_group_request = {
  member_id: string;
  (** 
    The member (user or group) to associate to the group.
    
     The member ID can accept {i UserID or GroupId}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Member: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: member\@domain.tld
               
               }
            {- Member name: member
               
               }
           
      }
       *)

  group_id: string;
  (** 
    The group to which the member (user or group) is associated.
    
     The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following identity formats are available:
     
      {ul
           {- Group ID: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: group\@domain.tld
               
               }
            {- Group name: group
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization under which the group exists.
     *)

}

type associate_delegate_to_resource_response = unit

type associate_delegate_to_resource_request = {
  entity_id: string;
  (** 
    The member (user or group) to associate to the resource.
    
     The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.
     
      {ul
           {- Entity: 12345678-1234-1234-1234-123456789012 or S-1-1-12-1234567890-123456789-123456789-1234
              
              }
            {- Email address: entity\@domain.tld
               
               }
            {- Entity: entity
               
               }
           
      }
       *)

  resource_id: string;
  (** 
    The resource for which members (users or groups) are associated.
    
     The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following identity formats are available:
     
      {ul
           {- Resource ID: r-0123456789a0123456789b0123456789
              
              }
            {- Email address: resource\@domain.tld
               
               }
            {- Resource name: resource
               
               }
           
      }
       *)

  organization_id: string;
  (** 
    The organization under which the resource exists.
     *)

}

(** 
    WorkMail is a secure, managed business email and calendaring service with support for existing desktop and mobile email clients. You can access your email, contacts, and calendars using Microsoft Outlook, your browser, or other native iOS and Android email applications. You can integrate WorkMail with your existing corporate directory and control both the keys that encrypt your data and the location in which your data is stored.
    
     The WorkMail API is designed for the following scenarios:
     
      {ul
           {- Listing and describing organizations
              
              }
           
      }
       {ul
            {- Managing users
               
               }
            
      }
       {ul
            {- Managing groups
               
               }
            
      }
       {ul
            {- Managing resources
               
               }
            
      }
       All WorkMail API operations are Amazon-authenticated and certificate-signed. They not only require the use of the AWS SDK, but also allow for the exclusive use of AWS Identity and Access Management users and roles to help facilitate access, trust, and permission policies. By creating a role and allowing an IAM user to access the WorkMail site, the IAM user gains full administrative visibility into the entire WorkMail organization (or as set in the IAM policy). This includes, but is not limited to, the ability to create, update, and delete users, groups, and resources. This allows developers to perform the scenarios listed above, as well as give users the ability to grant access on a selective basis using the IAM model.
        *)


type base_document = Json.t

(** {1:builders Builders} *)

val make_update_user_response : unit
-> update_user_response
(** Create a {!type-update_user_response} type *)

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
  unit
-> update_user_request
(** Create a {!type-update_user_request} type *)

val make_update_resource_response : unit
-> update_resource_response
(** Create a {!type-update_resource_response} type *)

val make_booking_options :
  ?auto_decline_conflicting_requests:bool ->
  ?auto_decline_recurring_requests:bool ->
  ?auto_accept_requests:bool ->
  unit
-> booking_options
(** Create a {!type-booking_options} type *)

val make_update_resource_request :
  ?hidden_from_global_address_list:bool ->
  ?type_:resource_type ->
  ?description:string ->
  ?booking_options:booking_options ->
  ?name:string ->
  resource_id:string ->
  organization_id:string ->
  unit
-> update_resource_request
(** Create a {!type-update_resource_request} type *)

val make_update_primary_email_address_response : unit
-> update_primary_email_address_response
(** Create a {!type-update_primary_email_address_response} type *)

val make_update_primary_email_address_request :
  email:string -> entity_id:string -> organization_id:string -> unit
-> update_primary_email_address_request
(** Create a {!type-update_primary_email_address_request} type *)

val make_update_mobile_device_access_rule_response : unit
-> update_mobile_device_access_rule_response
(** Create a {!type-update_mobile_device_access_rule_response} type *)

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
  unit
-> update_mobile_device_access_rule_request
(** Create a {!type-update_mobile_device_access_rule_request} type *)

val make_update_mailbox_quota_response : unit
-> update_mailbox_quota_response
(** Create a {!type-update_mailbox_quota_response} type *)

val make_update_mailbox_quota_request :
  mailbox_quota:int -> user_id:string -> organization_id:string -> unit
-> update_mailbox_quota_request
(** Create a {!type-update_mailbox_quota_request} type *)

val make_update_impersonation_role_response : unit
-> update_impersonation_role_response
(** Create a {!type-update_impersonation_role_response} type *)

val make_impersonation_rule :
  ?not_target_users:string list ->
  ?target_users:string list ->
  ?description:string ->
  ?name:string ->
  effect_:access_effect ->
  impersonation_rule_id:string ->
  unit
-> impersonation_rule
(** Create a {!type-impersonation_rule} type *)

val make_update_impersonation_role_request :
  ?description:string ->
  rules:impersonation_rule list ->
  type_:impersonation_role_type ->
  name:string ->
  impersonation_role_id:string ->
  organization_id:string ->
  unit
-> update_impersonation_role_request
(** Create a {!type-update_impersonation_role_request} type *)

val make_update_group_response : unit
-> update_group_response
(** Create a {!type-update_group_response} type *)

val make_update_group_request :
  ?hidden_from_global_address_list:bool ->
  group_id:string ->
  organization_id:string ->
  unit
-> update_group_request
(** Create a {!type-update_group_request} type *)

val make_update_default_mail_domain_response : unit
-> update_default_mail_domain_response
(** Create a {!type-update_default_mail_domain_response} type *)

val make_update_default_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> update_default_mail_domain_request
(** Create a {!type-update_default_mail_domain_request} type *)

val make_update_availability_configuration_response : unit
-> update_availability_configuration_response
(** Create a {!type-update_availability_configuration_response} type *)

val make_ews_availability_provider :
  ews_password:string -> ews_username:string -> ews_endpoint:string -> unit
-> ews_availability_provider
(** Create a {!type-ews_availability_provider} type *)

val make_lambda_availability_provider : lambda_arn:string -> unit
-> lambda_availability_provider
(** Create a {!type-lambda_availability_provider} type *)

val make_update_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  domain_name:string ->
  organization_id:string ->
  unit
-> update_availability_configuration_request
(** Create a {!type-update_availability_configuration_request} type *)

val make_untag_resource_response : unit
-> untag_resource_response
(** Create a {!type-untag_resource_response} type *)

val make_untag_resource_request :
  tag_keys:string list -> resource_ar_n:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_test_availability_configuration_response :
  ?failure_reason:string -> ?test_passed:bool -> unit
-> test_availability_configuration_response
(** Create a {!type-test_availability_configuration_response} type *)

val make_test_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  ?domain_name:string ->
  organization_id:string ->
  unit
-> test_availability_configuration_request
(** Create a {!type-test_availability_configuration_request} type *)

val make_tag_resource_response : unit
-> tag_resource_response
(** Create a {!type-tag_resource_response} type *)

val make_tag : value:string -> key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_request : tags:tag list -> resource_ar_n:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_start_mailbox_export_job_response : ?job_id:string -> unit
-> start_mailbox_export_job_response
(** Create a {!type-start_mailbox_export_job_response} type *)

val make_start_mailbox_export_job_request :
  ?description:string ->
  s3_prefix:string ->
  s3_bucket_name:string ->
  kms_key_arn:string ->
  role_arn:string ->
  entity_id:string ->
  organization_id:string ->
  client_token:string ->
  unit
-> start_mailbox_export_job_request
(** Create a {!type-start_mailbox_export_job_request} type *)

val make_reset_password_response : unit
-> reset_password_response
(** Create a {!type-reset_password_response} type *)

val make_reset_password_request :
  password:string -> user_id:string -> organization_id:string -> unit
-> reset_password_request
(** Create a {!type-reset_password_request} type *)

val make_register_to_work_mail_response : unit
-> register_to_work_mail_response
(** Create a {!type-register_to_work_mail_response} type *)

val make_register_to_work_mail_request :
  email:string -> entity_id:string -> organization_id:string -> unit
-> register_to_work_mail_request
(** Create a {!type-register_to_work_mail_request} type *)

val make_register_mail_domain_response : unit
-> register_mail_domain_response
(** Create a {!type-register_mail_domain_response} type *)

val make_register_mail_domain_request :
  ?client_token:string ->
  domain_name:string ->
  organization_id:string ->
  unit
-> register_mail_domain_request
(** Create a {!type-register_mail_domain_request} type *)

val make_put_retention_policy_response : unit
-> put_retention_policy_response
(** Create a {!type-put_retention_policy_response} type *)

val make_folder_configuration :
  ?period:int -> action:retention_action -> name:folder_name -> unit
-> folder_configuration
(** Create a {!type-folder_configuration} type *)

val make_put_retention_policy_request :
  ?description:string ->
  ?id:string ->
  folder_configurations:folder_configuration list ->
  name:string ->
  organization_id:string ->
  unit
-> put_retention_policy_request
(** Create a {!type-put_retention_policy_request} type *)

val make_put_mobile_device_access_override_response : unit
-> put_mobile_device_access_override_response
(** Create a {!type-put_mobile_device_access_override_response} type *)

val make_put_mobile_device_access_override_request :
  ?description:string ->
  effect_:mobile_device_access_rule_effect ->
  device_id:string ->
  user_id:string ->
  organization_id:string ->
  unit
-> put_mobile_device_access_override_request
(** Create a {!type-put_mobile_device_access_override_request} type *)

val make_put_mailbox_permissions_response : unit
-> put_mailbox_permissions_response
(** Create a {!type-put_mailbox_permissions_response} type *)

val make_put_mailbox_permissions_request :
  permission_values:permission_type list ->
  grantee_id:string ->
  entity_id:string ->
  organization_id:string ->
  unit
-> put_mailbox_permissions_request
(** Create a {!type-put_mailbox_permissions_request} type *)

val make_put_inbound_dmarc_settings_response : unit
-> put_inbound_dmarc_settings_response
(** Create a {!type-put_inbound_dmarc_settings_response} type *)

val make_put_inbound_dmarc_settings_request :
  enforced:bool -> organization_id:string -> unit
-> put_inbound_dmarc_settings_request
(** Create a {!type-put_inbound_dmarc_settings_request} type *)

val make_put_email_monitoring_configuration_response : unit
-> put_email_monitoring_configuration_response
(** Create a {!type-put_email_monitoring_configuration_response} type *)

val make_put_email_monitoring_configuration_request :
  log_group_arn:string -> role_arn:string -> organization_id:string -> unit
-> put_email_monitoring_configuration_request
(** Create a {!type-put_email_monitoring_configuration_request} type *)

val make_put_access_control_rule_response : unit
-> put_access_control_rule_response
(** Create a {!type-put_access_control_rule_response} type *)

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
  unit
-> put_access_control_rule_request
(** Create a {!type-put_access_control_rule_request} type *)

val make_user :
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?user_role:user_role ->
  ?state:entity_state ->
  ?display_name:string ->
  ?name:string ->
  ?email:string ->
  ?id:string ->
  unit -> user
(** Create a {!type-user} type *)

val make_list_users_response : ?next_token:string -> ?users:user list -> unit
-> list_users_response
(** Create a {!type-list_users_response} type *)

val make_list_users_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?display_name_prefix:string ->
  ?username_prefix:string ->
  unit
-> list_users_filters
(** Create a {!type-list_users_filters} type *)

val make_list_users_request :
  ?filters:list_users_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit
-> list_users_request
(** Create a {!type-list_users_request} type *)

val make_list_tags_for_resource_response : ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request : resource_ar_n:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_resource :
  ?description:string ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?type_:resource_type ->
  ?name:string ->
  ?email:string ->
  ?id:string ->
  unit
-> resource
(** Create a {!type-resource} type *)

val make_list_resources_response :
  ?next_token:string -> ?resources:resource list -> unit
-> list_resources_response
(** Create a {!type-list_resources_response} type *)

val make_list_resources_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?name_prefix:string ->
  unit
-> list_resources_filters
(** Create a {!type-list_resources_filters} type *)

val make_list_resources_request :
  ?filters:list_resources_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit
-> list_resources_request
(** Create a {!type-list_resources_request} type *)

val make_delegate : type_:member_type -> id:string -> unit
-> delegate
(** Create a {!type-delegate} type *)

val make_list_resource_delegates_response :
  ?next_token:string -> ?delegates:delegate list -> unit
-> list_resource_delegates_response
(** Create a {!type-list_resource_delegates_response} type *)

val make_list_resource_delegates_request :
  ?max_results:int ->
  ?next_token:string ->
  resource_id:string ->
  organization_id:string ->
  unit
-> list_resource_delegates_request
(** Create a {!type-list_resource_delegates_request} type *)

val make_organization_summary :
  ?state:string ->
  ?error_message:string ->
  ?default_mail_domain:string ->
  ?alias:string ->
  ?organization_id:string ->
  unit
-> organization_summary
(** Create a {!type-organization_summary} type *)

val make_list_organizations_response :
  ?next_token:string ->
  ?organization_summaries:organization_summary list ->
  unit
-> list_organizations_response
(** Create a {!type-list_organizations_response} type *)

val make_list_organizations_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_organizations_request
(** Create a {!type-list_organizations_request} type *)

val make_mobile_device_access_rule :
  ?date_modified:float ->
  ?date_created:float ->
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
  unit
-> mobile_device_access_rule
(** Create a {!type-mobile_device_access_rule} type *)

val make_list_mobile_device_access_rules_response :
  ?rules:mobile_device_access_rule list -> unit
-> list_mobile_device_access_rules_response
(** Create a {!type-list_mobile_device_access_rules_response} type *)

val make_list_mobile_device_access_rules_request :
  organization_id:string -> unit
-> list_mobile_device_access_rules_request
(** Create a {!type-list_mobile_device_access_rules_request} type *)

val make_mobile_device_access_override :
  ?date_modified:float ->
  ?date_created:float ->
  ?description:string ->
  ?effect_:mobile_device_access_rule_effect ->
  ?device_id:string ->
  ?user_id:string ->
  unit
-> mobile_device_access_override
(** Create a {!type-mobile_device_access_override} type *)

val make_list_mobile_device_access_overrides_response :
  ?next_token:string -> ?overrides:mobile_device_access_override list -> unit
-> list_mobile_device_access_overrides_response
(** Create a {!type-list_mobile_device_access_overrides_response} type *)

val make_list_mobile_device_access_overrides_request :
  ?max_results:int ->
  ?next_token:string ->
  ?device_id:string ->
  ?user_id:string ->
  organization_id:string ->
  unit
-> list_mobile_device_access_overrides_request
(** Create a {!type-list_mobile_device_access_overrides_request} type *)

val make_mail_domain_summary :
  ?default_domain:bool -> ?domain_name:string -> unit
-> mail_domain_summary
(** Create a {!type-mail_domain_summary} type *)

val make_list_mail_domains_response :
  ?next_token:string -> ?mail_domains:mail_domain_summary list -> unit
-> list_mail_domains_response
(** Create a {!type-list_mail_domains_response} type *)

val make_list_mail_domains_request :
  ?next_token:string -> ?max_results:int -> organization_id:string -> unit
-> list_mail_domains_request
(** Create a {!type-list_mail_domains_request} type *)

val make_permission :
  permission_values:permission_type list ->
  grantee_type:member_type ->
  grantee_id:string ->
  unit
-> permission
(** Create a {!type-permission} type *)

val make_list_mailbox_permissions_response :
  ?next_token:string -> ?permissions:permission list -> unit
-> list_mailbox_permissions_response
(** Create a {!type-list_mailbox_permissions_response} type *)

val make_list_mailbox_permissions_request :
  ?max_results:int ->
  ?next_token:string ->
  entity_id:string ->
  organization_id:string ->
  unit
-> list_mailbox_permissions_request
(** Create a {!type-list_mailbox_permissions_request} type *)

val make_mailbox_export_job :
  ?end_time:float ->
  ?start_time:float ->
  ?state:mailbox_export_job_state ->
  ?estimated_progress:int ->
  ?s3_path:string ->
  ?s3_bucket_name:string ->
  ?description:string ->
  ?entity_id:string ->
  ?job_id:string ->
  unit
-> mailbox_export_job
(** Create a {!type-mailbox_export_job} type *)

val make_list_mailbox_export_jobs_response :
  ?next_token:string -> ?jobs:mailbox_export_job list -> unit
-> list_mailbox_export_jobs_response
(** Create a {!type-list_mailbox_export_jobs_response} type *)

val make_list_mailbox_export_jobs_request :
  ?max_results:int -> ?next_token:string -> organization_id:string -> unit
-> list_mailbox_export_jobs_request
(** Create a {!type-list_mailbox_export_jobs_request} type *)

val make_impersonation_role :
  ?date_modified:float ->
  ?date_created:float ->
  ?type_:impersonation_role_type ->
  ?name:string ->
  ?impersonation_role_id:string ->
  unit
-> impersonation_role
(** Create a {!type-impersonation_role} type *)

val make_list_impersonation_roles_response :
  ?next_token:string -> ?roles:impersonation_role list -> unit
-> list_impersonation_roles_response
(** Create a {!type-list_impersonation_roles_response} type *)

val make_list_impersonation_roles_request :
  ?max_results:int -> ?next_token:string -> organization_id:string -> unit
-> list_impersonation_roles_request
(** Create a {!type-list_impersonation_roles_request} type *)

val make_group_identifier : ?group_name:string -> ?group_id:string -> unit
-> group_identifier
(** Create a {!type-group_identifier} type *)

val make_list_groups_for_entity_response :
  ?next_token:string -> ?groups:group_identifier list -> unit
-> list_groups_for_entity_response
(** Create a {!type-list_groups_for_entity_response} type *)

val make_list_groups_for_entity_filters : ?group_name_prefix:string -> unit
-> list_groups_for_entity_filters
(** Create a {!type-list_groups_for_entity_filters} type *)

val make_list_groups_for_entity_request :
  ?max_results:int ->
  ?next_token:string ->
  ?filters:list_groups_for_entity_filters ->
  entity_id:string ->
  organization_id:string ->
  unit
-> list_groups_for_entity_request
(** Create a {!type-list_groups_for_entity_request} type *)

val make_group :
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?name:string ->
  ?email:string ->
  ?id:string ->
  unit
-> group
(** Create a {!type-group} type *)

val make_list_groups_response :
  ?next_token:string -> ?groups:group list -> unit
-> list_groups_response
(** Create a {!type-list_groups_response} type *)

val make_list_groups_filters :
  ?state:entity_state ->
  ?primary_email_prefix:string ->
  ?name_prefix:string ->
  unit
-> list_groups_filters
(** Create a {!type-list_groups_filters} type *)

val make_list_groups_request :
  ?filters:list_groups_filters ->
  ?max_results:int ->
  ?next_token:string ->
  organization_id:string ->
  unit
-> list_groups_request
(** Create a {!type-list_groups_request} type *)

val make_member :
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?type_:member_type ->
  ?name:string ->
  ?id:string ->
  unit
-> member
(** Create a {!type-member} type *)

val make_list_group_members_response :
  ?next_token:string -> ?members:member list -> unit
-> list_group_members_response
(** Create a {!type-list_group_members_response} type *)

val make_list_group_members_request :
  ?max_results:int ->
  ?next_token:string ->
  group_id:string ->
  organization_id:string ->
  unit
-> list_group_members_request
(** Create a {!type-list_group_members_request} type *)

val make_redacted_ews_availability_provider :
  ?ews_username:string -> ?ews_endpoint:string -> unit
-> redacted_ews_availability_provider
(** Create a {!type-redacted_ews_availability_provider} type *)

val make_availability_configuration :
  ?date_modified:float ->
  ?date_created:float ->
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:redacted_ews_availability_provider ->
  ?provider_type:availability_provider_type ->
  ?domain_name:string ->
  unit
-> availability_configuration
(** Create a {!type-availability_configuration} type *)

val make_list_availability_configurations_response :
  ?next_token:string ->
  ?availability_configurations:availability_configuration list ->
  unit
-> list_availability_configurations_response
(** Create a {!type-list_availability_configurations_response} type *)

val make_list_availability_configurations_request :
  ?next_token:string -> ?max_results:int -> organization_id:string -> unit
-> list_availability_configurations_request
(** Create a {!type-list_availability_configurations_request} type *)

val make_list_aliases_response :
  ?next_token:string -> ?aliases:string list -> unit
-> list_aliases_response
(** Create a {!type-list_aliases_response} type *)

val make_list_aliases_request :
  ?max_results:int ->
  ?next_token:string ->
  entity_id:string ->
  organization_id:string ->
  unit
-> list_aliases_request
(** Create a {!type-list_aliases_request} type *)

val make_access_control_rule :
  ?not_impersonation_role_ids:string list ->
  ?impersonation_role_ids:string list ->
  ?date_modified:float ->
  ?date_created:float ->
  ?not_user_ids:string list ->
  ?user_ids:string list ->
  ?not_actions:string list ->
  ?actions:string list ->
  ?not_ip_ranges:string list ->
  ?ip_ranges:string list ->
  ?description:string ->
  ?effect_:access_control_rule_effect ->
  ?name:string ->
  unit
-> access_control_rule
(** Create a {!type-access_control_rule} type *)

val make_list_access_control_rules_response :
  ?rules:access_control_rule list -> unit
-> list_access_control_rules_response
(** Create a {!type-list_access_control_rules_response} type *)

val make_list_access_control_rules_request : organization_id:string -> unit
-> list_access_control_rules_request
(** Create a {!type-list_access_control_rules_request} type *)

val make_get_mobile_device_access_override_response :
  ?date_modified:float ->
  ?date_created:float ->
  ?description:string ->
  ?effect_:mobile_device_access_rule_effect ->
  ?device_id:string ->
  ?user_id:string ->
  unit
-> get_mobile_device_access_override_response
(** Create a {!type-get_mobile_device_access_override_response} type *)

val make_get_mobile_device_access_override_request :
  device_id:string -> user_id:string -> organization_id:string -> unit
-> get_mobile_device_access_override_request
(** Create a {!type-get_mobile_device_access_override_request} type *)

val make_mobile_device_access_matched_rule :
  ?name:string -> ?mobile_device_access_rule_id:string -> unit
-> mobile_device_access_matched_rule
(** Create a {!type-mobile_device_access_matched_rule} type *)

val make_get_mobile_device_access_effect_response :
  ?matched_rules:mobile_device_access_matched_rule list ->
  ?effect_:mobile_device_access_rule_effect ->
  unit
-> get_mobile_device_access_effect_response
(** Create a {!type-get_mobile_device_access_effect_response} type *)

val make_get_mobile_device_access_effect_request :
  ?device_user_agent:string ->
  ?device_operating_system:string ->
  ?device_model:string ->
  ?device_type:string ->
  organization_id:string ->
  unit
-> get_mobile_device_access_effect_request
(** Create a {!type-get_mobile_device_access_effect_request} type *)

val make_dns_record :
  ?value:string -> ?hostname:string -> ?type_:string -> unit
-> dns_record
(** Create a {!type-dns_record} type *)

val make_get_mail_domain_response :
  ?dkim_verification_status:dns_record_verification_status ->
  ?ownership_verification_status:dns_record_verification_status ->
  ?is_default:bool ->
  ?is_test_domain:bool ->
  ?records:dns_record list ->
  unit
-> get_mail_domain_response
(** Create a {!type-get_mail_domain_response} type *)

val make_get_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> get_mail_domain_request
(** Create a {!type-get_mail_domain_request} type *)

val make_get_mailbox_details_response :
  ?mailbox_size:float -> ?mailbox_quota:int -> unit
-> get_mailbox_details_response
(** Create a {!type-get_mailbox_details_response} type *)

val make_get_mailbox_details_request :
  user_id:string -> organization_id:string -> unit
-> get_mailbox_details_request
(** Create a {!type-get_mailbox_details_request} type *)

val make_impersonation_matched_rule :
  ?name:string -> ?impersonation_rule_id:string -> unit
-> impersonation_matched_rule
(** Create a {!type-impersonation_matched_rule} type *)

val make_get_impersonation_role_effect_response :
  ?matched_rules:impersonation_matched_rule list ->
  ?effect_:access_effect ->
  ?type_:impersonation_role_type ->
  unit
-> get_impersonation_role_effect_response
(** Create a {!type-get_impersonation_role_effect_response} type *)

val make_get_impersonation_role_effect_request :
  target_user:string ->
  impersonation_role_id:string ->
  organization_id:string ->
  unit
-> get_impersonation_role_effect_request
(** Create a {!type-get_impersonation_role_effect_request} type *)

val make_get_impersonation_role_response :
  ?date_modified:float ->
  ?date_created:float ->
  ?rules:impersonation_rule list ->
  ?description:string ->
  ?type_:impersonation_role_type ->
  ?name:string ->
  ?impersonation_role_id:string ->
  unit
-> get_impersonation_role_response
(** Create a {!type-get_impersonation_role_response} type *)

val make_get_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> get_impersonation_role_request
(** Create a {!type-get_impersonation_role_request} type *)

val make_get_default_retention_policy_response :
  ?folder_configurations:folder_configuration list ->
  ?description:string ->
  ?name:string ->
  ?id:string ->
  unit
-> get_default_retention_policy_response
(** Create a {!type-get_default_retention_policy_response} type *)

val make_get_default_retention_policy_request :
  organization_id:string -> unit
-> get_default_retention_policy_request
(** Create a {!type-get_default_retention_policy_request} type *)

val make_get_access_control_effect_response :
  ?matched_rules:string list -> ?effect_:access_control_rule_effect -> unit
-> get_access_control_effect_response
(** Create a {!type-get_access_control_effect_response} type *)

val make_get_access_control_effect_request :
  ?impersonation_role_id:string ->
  ?user_id:string ->
  action:string ->
  ip_address:string ->
  organization_id:string ->
  unit
-> get_access_control_effect_request
(** Create a {!type-get_access_control_effect_request} type *)

val make_disassociate_member_from_group_response : unit
-> disassociate_member_from_group_response
(** Create a {!type-disassociate_member_from_group_response} type *)

val make_disassociate_member_from_group_request :
  member_id:string -> group_id:string -> organization_id:string -> unit
-> disassociate_member_from_group_request
(** Create a {!type-disassociate_member_from_group_request} type *)

val make_disassociate_delegate_from_resource_response : unit
-> disassociate_delegate_from_resource_response
(** Create a {!type-disassociate_delegate_from_resource_response} type *)

val make_disassociate_delegate_from_resource_request :
  entity_id:string -> resource_id:string -> organization_id:string -> unit
-> disassociate_delegate_from_resource_request
(** Create a {!type-disassociate_delegate_from_resource_request} type *)

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
  ?mailbox_deprovisioned_date:float ->
  ?mailbox_provisioned_date:float ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?user_role:user_role ->
  ?state:entity_state ->
  ?display_name:string ->
  ?email:string ->
  ?name:string ->
  ?user_id:string ->
  unit
-> describe_user_response
(** Create a {!type-describe_user_response} type *)

val make_describe_user_request :
  user_id:string -> organization_id:string -> unit
-> describe_user_request
(** Create a {!type-describe_user_request} type *)

val make_describe_resource_response :
  ?hidden_from_global_address_list:bool ->
  ?description:string ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?booking_options:booking_options ->
  ?type_:resource_type ->
  ?name:string ->
  ?email:string ->
  ?resource_id:string ->
  unit
-> describe_resource_response
(** Create a {!type-describe_resource_response} type *)

val make_describe_resource_request :
  resource_id:string -> organization_id:string -> unit
-> describe_resource_request
(** Create a {!type-describe_resource_request} type *)

val make_describe_organization_response :
  ?interoperability_enabled:bool ->
  ?migration_admin:string ->
  ?ar_n:string ->
  ?error_message:string ->
  ?completed_date:float ->
  ?default_mail_domain:string ->
  ?directory_type:string ->
  ?directory_id:string ->
  ?state:string ->
  ?alias:string ->
  ?organization_id:string ->
  unit
-> describe_organization_response
(** Create a {!type-describe_organization_response} type *)

val make_describe_organization_request : organization_id:string -> unit
-> describe_organization_request
(** Create a {!type-describe_organization_request} type *)

val make_describe_mailbox_export_job_response :
  ?end_time:float ->
  ?start_time:float ->
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
  unit
-> describe_mailbox_export_job_response
(** Create a {!type-describe_mailbox_export_job_response} type *)

val make_describe_mailbox_export_job_request :
  organization_id:string -> job_id:string -> unit
-> describe_mailbox_export_job_request
(** Create a {!type-describe_mailbox_export_job_request} type *)

val make_describe_inbound_dmarc_settings_response : ?enforced:bool -> unit
-> describe_inbound_dmarc_settings_response
(** Create a {!type-describe_inbound_dmarc_settings_response} type *)

val make_describe_inbound_dmarc_settings_request :
  organization_id:string -> unit
-> describe_inbound_dmarc_settings_request
(** Create a {!type-describe_inbound_dmarc_settings_request} type *)

val make_describe_group_response :
  ?hidden_from_global_address_list:bool ->
  ?disabled_date:float ->
  ?enabled_date:float ->
  ?state:entity_state ->
  ?email:string ->
  ?name:string ->
  ?group_id:string ->
  unit
-> describe_group_response
(** Create a {!type-describe_group_response} type *)

val make_describe_group_request :
  group_id:string -> organization_id:string -> unit
-> describe_group_request
(** Create a {!type-describe_group_request} type *)

val make_describe_entity_response :
  ?type_:entity_type -> ?name:string -> ?entity_id:string -> unit
-> describe_entity_response
(** Create a {!type-describe_entity_response} type *)

val make_describe_entity_request :
  email:string -> organization_id:string -> unit
-> describe_entity_request
(** Create a {!type-describe_entity_request} type *)

val make_describe_email_monitoring_configuration_response :
  ?log_group_arn:string -> ?role_arn:string -> unit
-> describe_email_monitoring_configuration_response
(** Create a {!type-describe_email_monitoring_configuration_response} type *)

val make_describe_email_monitoring_configuration_request :
  organization_id:string -> unit
-> describe_email_monitoring_configuration_request
(** Create a {!type-describe_email_monitoring_configuration_request} type *)

val make_deregister_mail_domain_response : unit
-> deregister_mail_domain_response
(** Create a {!type-deregister_mail_domain_response} type *)

val make_deregister_mail_domain_request :
  domain_name:string -> organization_id:string -> unit
-> deregister_mail_domain_request
(** Create a {!type-deregister_mail_domain_request} type *)

val make_deregister_from_work_mail_response : unit
-> deregister_from_work_mail_response
(** Create a {!type-deregister_from_work_mail_response} type *)

val make_deregister_from_work_mail_request :
  entity_id:string -> organization_id:string -> unit
-> deregister_from_work_mail_request
(** Create a {!type-deregister_from_work_mail_request} type *)

val make_delete_user_response : unit
-> delete_user_response
(** Create a {!type-delete_user_response} type *)

val make_delete_user_request :
  user_id:string -> organization_id:string -> unit
-> delete_user_request
(** Create a {!type-delete_user_request} type *)

val make_delete_retention_policy_response : unit
-> delete_retention_policy_response
(** Create a {!type-delete_retention_policy_response} type *)

val make_delete_retention_policy_request :
  id:string -> organization_id:string -> unit
-> delete_retention_policy_request
(** Create a {!type-delete_retention_policy_request} type *)

val make_delete_resource_response : unit
-> delete_resource_response
(** Create a {!type-delete_resource_response} type *)

val make_delete_resource_request :
  resource_id:string -> organization_id:string -> unit
-> delete_resource_request
(** Create a {!type-delete_resource_request} type *)

val make_delete_organization_response :
  ?state:string -> ?organization_id:string -> unit
-> delete_organization_response
(** Create a {!type-delete_organization_response} type *)

val make_delete_organization_request :
  ?force_delete:bool ->
  ?client_token:string ->
  delete_directory:bool ->
  organization_id:string ->
  unit
-> delete_organization_request
(** Create a {!type-delete_organization_request} type *)

val make_delete_mobile_device_access_rule_response : unit
-> delete_mobile_device_access_rule_response
(** Create a {!type-delete_mobile_device_access_rule_response} type *)

val make_delete_mobile_device_access_rule_request :
  mobile_device_access_rule_id:string -> organization_id:string -> unit
-> delete_mobile_device_access_rule_request
(** Create a {!type-delete_mobile_device_access_rule_request} type *)

val make_delete_mobile_device_access_override_response : unit
-> delete_mobile_device_access_override_response
(** Create a {!type-delete_mobile_device_access_override_response} type *)

val make_delete_mobile_device_access_override_request :
  device_id:string -> user_id:string -> organization_id:string -> unit
-> delete_mobile_device_access_override_request
(** Create a {!type-delete_mobile_device_access_override_request} type *)

val make_delete_mailbox_permissions_response : unit
-> delete_mailbox_permissions_response
(** Create a {!type-delete_mailbox_permissions_response} type *)

val make_delete_mailbox_permissions_request :
  grantee_id:string -> entity_id:string -> organization_id:string -> unit
-> delete_mailbox_permissions_request
(** Create a {!type-delete_mailbox_permissions_request} type *)

val make_delete_impersonation_role_response : unit
-> delete_impersonation_role_response
(** Create a {!type-delete_impersonation_role_response} type *)

val make_delete_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> delete_impersonation_role_request
(** Create a {!type-delete_impersonation_role_request} type *)

val make_delete_group_response : unit
-> delete_group_response
(** Create a {!type-delete_group_response} type *)

val make_delete_group_request :
  group_id:string -> organization_id:string -> unit
-> delete_group_request
(** Create a {!type-delete_group_request} type *)

val make_delete_email_monitoring_configuration_response : unit
-> delete_email_monitoring_configuration_response
(** Create a {!type-delete_email_monitoring_configuration_response} type *)

val make_delete_email_monitoring_configuration_request :
  organization_id:string -> unit
-> delete_email_monitoring_configuration_request
(** Create a {!type-delete_email_monitoring_configuration_request} type *)

val make_delete_availability_configuration_response : unit
-> delete_availability_configuration_response
(** Create a {!type-delete_availability_configuration_response} type *)

val make_delete_availability_configuration_request :
  domain_name:string -> organization_id:string -> unit
-> delete_availability_configuration_request
(** Create a {!type-delete_availability_configuration_request} type *)

val make_delete_alias_response : unit
-> delete_alias_response
(** Create a {!type-delete_alias_response} type *)

val make_delete_alias_request :
  alias:string -> entity_id:string -> organization_id:string -> unit
-> delete_alias_request
(** Create a {!type-delete_alias_request} type *)

val make_delete_access_control_rule_response : unit
-> delete_access_control_rule_response
(** Create a {!type-delete_access_control_rule_response} type *)

val make_delete_access_control_rule_request :
  name:string -> organization_id:string -> unit
-> delete_access_control_rule_request
(** Create a {!type-delete_access_control_rule_request} type *)

val make_create_user_response : ?user_id:string -> unit
-> create_user_response
(** Create a {!type-create_user_response} type *)

val make_create_user_request :
  ?hidden_from_global_address_list:bool ->
  ?last_name:string ->
  ?first_name:string ->
  ?role:user_role ->
  ?password:string ->
  display_name:string ->
  name:string ->
  organization_id:string ->
  unit
-> create_user_request
(** Create a {!type-create_user_request} type *)

val make_create_resource_response : ?resource_id:string -> unit
-> create_resource_response
(** Create a {!type-create_resource_response} type *)

val make_create_resource_request :
  ?hidden_from_global_address_list:bool ->
  ?description:string ->
  type_:resource_type ->
  name:string ->
  organization_id:string ->
  unit
-> create_resource_request
(** Create a {!type-create_resource_request} type *)

val make_create_organization_response : ?organization_id:string -> unit
-> create_organization_response
(** Create a {!type-create_organization_response} type *)

val make_domain : ?hosted_zone_id:string -> domain_name:string -> unit
-> domain
(** Create a {!type-domain} type *)

val make_create_organization_request :
  ?enable_interoperability:bool ->
  ?kms_key_arn:string ->
  ?domains:domain list ->
  ?client_token:string ->
  ?directory_id:string ->
  alias:string ->
  unit
-> create_organization_request
(** Create a {!type-create_organization_request} type *)

val make_create_mobile_device_access_rule_response :
  ?mobile_device_access_rule_id:string -> unit
-> create_mobile_device_access_rule_response
(** Create a {!type-create_mobile_device_access_rule_response} type *)

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
  unit
-> create_mobile_device_access_rule_request
(** Create a {!type-create_mobile_device_access_rule_request} type *)

val make_create_impersonation_role_response :
  ?impersonation_role_id:string -> unit
-> create_impersonation_role_response
(** Create a {!type-create_impersonation_role_response} type *)

val make_create_impersonation_role_request :
  ?description:string ->
  ?client_token:string ->
  rules:impersonation_rule list ->
  type_:impersonation_role_type ->
  name:string ->
  organization_id:string ->
  unit
-> create_impersonation_role_request
(** Create a {!type-create_impersonation_role_request} type *)

val make_create_group_response : ?group_id:string -> unit
-> create_group_response
(** Create a {!type-create_group_response} type *)

val make_create_group_request :
  ?hidden_from_global_address_list:bool ->
  name:string ->
  organization_id:string ->
  unit
-> create_group_request
(** Create a {!type-create_group_request} type *)

val make_create_availability_configuration_response : unit
-> create_availability_configuration_response
(** Create a {!type-create_availability_configuration_response} type *)

val make_create_availability_configuration_request :
  ?lambda_provider:lambda_availability_provider ->
  ?ews_provider:ews_availability_provider ->
  ?client_token:string ->
  domain_name:string ->
  organization_id:string ->
  unit
-> create_availability_configuration_request
(** Create a {!type-create_availability_configuration_request} type *)

val make_create_alias_response : unit
-> create_alias_response
(** Create a {!type-create_alias_response} type *)

val make_create_alias_request :
  alias:string -> entity_id:string -> organization_id:string -> unit
-> create_alias_request
(** Create a {!type-create_alias_request} type *)

val make_cancel_mailbox_export_job_response : unit
-> cancel_mailbox_export_job_response
(** Create a {!type-cancel_mailbox_export_job_response} type *)

val make_cancel_mailbox_export_job_request :
  organization_id:string -> job_id:string -> client_token:string -> unit
-> cancel_mailbox_export_job_request
(** Create a {!type-cancel_mailbox_export_job_request} type *)

val make_assume_impersonation_role_response :
  ?expires_in:int -> ?token:string -> unit
-> assume_impersonation_role_response
(** Create a {!type-assume_impersonation_role_response} type *)

val make_assume_impersonation_role_request :
  impersonation_role_id:string -> organization_id:string -> unit
-> assume_impersonation_role_request
(** Create a {!type-assume_impersonation_role_request} type *)

val make_associate_member_to_group_response : unit
-> associate_member_to_group_response
(** Create a {!type-associate_member_to_group_response} type *)

val make_associate_member_to_group_request :
  member_id:string -> group_id:string -> organization_id:string -> unit
-> associate_member_to_group_request
(** Create a {!type-associate_member_to_group_request} type *)

val make_associate_delegate_to_resource_response : unit
-> associate_delegate_to_resource_response
(** Create a {!type-associate_delegate_to_resource_response} type *)

val make_associate_delegate_to_resource_request :
  entity_id:string -> resource_id:string -> organization_id:string -> unit
-> associate_delegate_to_resource_request
(** Create a {!type-associate_delegate_to_resource_request} type *)

(** {1:operations Operations} *)

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
  (** 
    Adds a member (user or group) to the resource's set of delegates.
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
  (** 
    Adds a member (user or group) to the group's set.
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
  (** 
    Assumes an impersonation role for the given WorkMail organization. This method returns an authentication token you can use to make impersonated calls.
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
  (** 
    Cancels a mailbox export job.
    
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
  (** 
    Adds an alias to the set of a given member (user or group) of WorkMail.
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
  (** 
    Creates an [AvailabilityConfiguration] for the given WorkMail organization and domain.
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
  (** 
    Creates a group that can be used in WorkMail by calling the [RegisterToWorkMail] operation.
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
  (** 
    Creates an impersonation role for the given WorkMail organization.
    
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
  (** 
    Creates a new mobile device access rule for the specified WorkMail organization.
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
  (** 
    Creates a new WorkMail organization. Optionally, you can choose to associate an existing AWS Directory Service directory with your organization. If an AWS Directory Service directory ID is specified, the organization alias must match the directory alias. If you choose not to associate an existing directory with your organization, then we create a new WorkMail directory for you. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_new_organization.html}Adding an organization} in the {i WorkMail Administrator Guide}.
    
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
  (** 
    Creates a new WorkMail resource.
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
  (** 
    Creates a user who can be used in WorkMail by calling the [RegisterToWorkMail] operation.
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
  (** 
    Deletes an access control rule for the specified WorkMail organization.
    
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
  (** 
    Remove one or more specified aliases from a set of aliases for a given user.
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
  (** 
    Deletes the [AvailabilityConfiguration] for the given WorkMail organization and domain.
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
  (** 
    Deletes the email monitoring configuration for a specified organization.
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
  (** 
    Deletes a group from WorkMail.
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
  (** 
    Deletes an impersonation role for the given WorkMail organization.
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
  (** 
    Deletes permissions granted to a member (user or group).
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
  (** 
    Deletes the mobile device access override for the given WorkMail organization, user, and device.
    
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
  (** 
    Deletes a mobile device access rule for the specified WorkMail organization.
    
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
  (** 
    Deletes an WorkMail organization and all underlying AWS resources managed by WorkMail as part of the organization. You can choose whether to delete the associated directory. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/remove_organization.html}Removing an organization} in the {i WorkMail Administrator Guide}.
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
  (** 
    Deletes the specified resource.
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
  (** 
    Deletes the specified retention policy from the specified organization.
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
  (** 
    Deletes a user from WorkMail and all subsequent systems. Before you can delete a user, the user state must be [DISABLED]. Use the [DescribeUser] action to confirm the user state.
    
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
  (** 
    Mark a user, group, or resource as no longer used in WorkMail. This action disassociates the mailbox and schedules it for clean-up. WorkMail keeps mailboxes for 30 days before they are permanently removed. The functionality in the console is {i Disable}.
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
  (** 
    Removes a domain from WorkMail, stops email routing to WorkMail, and removes the authorization allowing WorkMail use. SES keeps the domain because other applications may use it. You must first remove any email address used by WorkMail entities before you remove the domain.
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
  (** 
    Describes the current email monitoring configuration for a specified organization.
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
  (** 
    Returns basic details about an entity in WorkMail.
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
  (** 
    Returns the data available for the group.
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
  (** 
    Lists the settings in a DMARC policy for a specified organization.
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
  (** 
    Describes the current status of a mailbox export job.
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
  (** 
    Provides more information regarding a given organization based on its identifier.
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
  (** 
    Returns the data available for the resource.
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
  (** 
    Provides information regarding the user.
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
  (** 
    Removes a member from the resource's set of delegates.
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
  (** 
    Removes a member from a group.
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
  (** 
    Gets the effects of an organization's access control rules as they apply to a specified IPv4 address, access protocol action, and user ID or impersonation role ID. You must provide either the user ID or impersonation role ID. Impersonation role ID can only be used with Action EWS.
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
  (** 
    Gets the default retention policy details for the specified organization.
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
  (** 
    Gets the impersonation role details for the given WorkMail organization.
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
  (** 
    Tests whether the given impersonation role can impersonate a target user.
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
  (** 
    Requests a user's mailbox details for a specified organization and user.
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
  (** 
    Gets details for a mail domain, including domain records required to configure your domain with recommended security.
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
  (** 
    Simulates the effect of the mobile device access rules for the given attributes of a sample access event. Use this method to test the effects of the current set of mobile device access rules for the WorkMail organization for a particular user's attributes.
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
  (** 
    Gets the mobile device access override for the given WorkMail organization, user, and device.
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
  (** 
    Lists the access control rules for the specified organization.
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
  (** 
    Creates a paginated call to list the aliases associated with a given entity.
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
  (** 
    List all the [AvailabilityConfiguration]'s for the given WorkMail organization.
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
  (** 
    Returns an overview of the members of a group. Users and groups can be members of a group.
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
  (** 
    Returns summaries of the organization's groups.
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
  (** 
    Returns all the groups to which an entity belongs.
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
  (** 
    Lists all the impersonation roles for the given WorkMail organization.
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
  (** 
    Lists the mailbox export jobs started for the specified organization within the last seven days.
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
  (** 
    Lists the mailbox permissions associated with a user, group, or resource mailbox.
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
  (** 
    Lists the mail domains in a given WorkMail organization.
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
  (** 
    Lists all the mobile device access overrides for any given combination of WorkMail organization, user, or device.
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
  (** 
    Lists the mobile device access rules for the specified WorkMail organization.
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
  (** 
    Returns summaries of the customer's organizations.
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
  (** 
    Lists the delegates associated with a resource. Users and groups can be resource delegates and answer requests on behalf of the resource.
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
  (** 
    Returns summaries of the organization's resources.
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
  (** 
    Lists the tags applied to an WorkMail organization resource.
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
  (** 
    Returns summaries of the organization's users.
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
  (** 
    Adds a new access control rule for the specified organization. The rule allows or denies access to the organization for the specified IPv4 addresses, access protocol actions, user IDs and impersonation IDs. Adding a new rule with the same name as an existing rule replaces the older rule.
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
  (** 
    Creates or updates the email monitoring configuration for a specified organization.
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
  (** 
    Enables or disables a DMARC policy for a given organization.
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
  (** 
    Sets permissions for a user, group, or resource. This replaces any pre-existing permissions.
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
  (** 
    Creates or updates a mobile device access override for the given WorkMail organization, user, and device.
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
  (** 
    Puts a retention policy to the specified organization.
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
  (** 
    Registers a new domain in WorkMail and SES, and configures it for use by WorkMail. Emails received by SES for this domain are routed to the specified WorkMail organization, and WorkMail has permanent permission to use the specified domain for sending your users' emails.
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
  (** 
    Registers an existing and disabled user, group, or resource for WorkMail use by associating a mailbox and calendaring capabilities. It performs no change if the user, group, or resource is enabled and fails if the user, group, or resource is deleted. This operation results in the accumulation of costs. For more information, see {{:https://aws.amazon.com/workmail/pricing}Pricing}. The equivalent console functionality for this operation is {i Enable}.
    
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
  (** 
    Allows the administrator to reset the password for a user.
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
  (** 
    Starts a mailbox export job to export MIME-format email messages and calendar items from the specified mailbox to the specified Amazon Simple Storage Service (Amazon S3) bucket. For more information, see {{:https://docs.aws.amazon.com/workmail/latest/adminguide/mail-export.html}Exporting mailbox content} in the {i WorkMail Administrator Guide}.
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
  (** 
    Applies the specified tags to the specified WorkMailorganization resource.
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
  (** 
    Performs a test on an availability provider to ensure that access is allowed. For EWS, it verifies the provided credentials can be used to successfully log in. For Lambda, it verifies that the Lambda function can be invoked and that the resource access policy was configured to deny anonymous access. An anonymous invocation is one done without providing either a [SourceArn] or [SourceAccount] header.
    
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
  (** 
    Untags the specified tags from the specified WorkMail organization resource.
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
  (** 
    Updates an existing [AvailabilityConfiguration] for the given WorkMail organization and domain.
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
  (** 
    Updates the default mail domain for an organization. The default mail domain is used by the WorkMail AWS Console to suggest an email address when enabling a mail user. You can only have one default domain.
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
  (** 
    Updates attibutes in a group.
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
  (** 
    Updates an impersonation role for the given WorkMail organization.
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
  (** 
    Updates a user's current mailbox quota for a specified organization and user.
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
  (** 
    Updates a mobile device access rule for the specified WorkMail organization.
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
  (** 
    Updates the primary email for a user, group, or resource. The current email is moved into the list of aliases (or swapped between an existing alias and the current primary email), and the email provided in the input is promoted as the primary.
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
  (** 
    Updates data for the resource. To have the latest information, it must be preceded by a [DescribeResource] call. The dataset in the request should be the one expected when performing another [DescribeResource] call.
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
  (** 
    Updates data for the user. To have the latest information, it must be preceded by a [DescribeUser] call. The dataset in the request should be the one expected when performing another [DescribeUser] call.
     *)

  
end

