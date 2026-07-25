type nonrec impersonation_role_id = string [@@ocaml.doc ""]

type nonrec impersonation_role_id_list = impersonation_role_id list [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec work_mail_identifier = string [@@ocaml.doc ""]

type nonrec user_id_list = work_mail_identifier list [@@ocaml.doc ""]

type nonrec access_control_rule_action = string [@@ocaml.doc ""]

type nonrec actions_list = access_control_rule_action list [@@ocaml.doc ""]

type nonrec ip_range = string [@@ocaml.doc ""]

type nonrec ip_range_list = ip_range list [@@ocaml.doc ""]

type nonrec access_control_rule_description = string [@@ocaml.doc ""]

type nonrec access_control_rule_effect = ALLOW [@ocaml.doc ""] | DENY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_control_rule_name = string [@@ocaml.doc ""]

type nonrec access_control_rule = {
  name : access_control_rule_name option; [@ocaml.doc "The rule name.\n"]
  effect_ : access_control_rule_effect option; [@ocaml.doc "The rule effect.\n"]
  description : access_control_rule_description option; [@ocaml.doc "The rule description.\n"]
  ip_ranges : ip_range_list option; [@ocaml.doc "IPv4 CIDR ranges to include in the rule.\n"]
  not_ip_ranges : ip_range_list option; [@ocaml.doc "IPv4 CIDR ranges to exclude from the rule.\n"]
  actions : actions_list option;
      [@ocaml.doc
        "Access protocol actions to include in the rule. Valid values include [ActiveSync], \
         [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"]
  not_actions : actions_list option;
      [@ocaml.doc
        "Access protocol actions to exclude from the rule. Valid values include [ActiveSync], \
         [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"]
  user_ids : user_id_list option; [@ocaml.doc "User IDs to include in the rule.\n"]
  not_user_ids : user_id_list option; [@ocaml.doc "User IDs to exclude from the rule.\n"]
  date_created : timestamp option; [@ocaml.doc "The date that the rule was created.\n"]
  date_modified : timestamp option; [@ocaml.doc "The date that the rule was modified.\n"]
  impersonation_role_ids : impersonation_role_id_list option;
      [@ocaml.doc "Impersonation role IDs to include in the rule.\n"]
  not_impersonation_role_ids : impersonation_role_id_list option;
      [@ocaml.doc "Impersonation role IDs to exclude from the rule.\n"]
}
[@@ocaml.doc "A rule that controls access to an WorkMail organization.\n"]

type nonrec access_control_rule_name_list = access_control_rule_name list [@@ocaml.doc ""]

type nonrec access_control_rules_list = access_control_rule list [@@ocaml.doc ""]

type nonrec access_effect = ALLOW [@ocaml.doc ""] | DENY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec email_address = string [@@ocaml.doc ""]

type nonrec aliases = email_address list [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec application_arn = string [@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec unsupported_operation_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "You can't perform a write operation against a read-only directory.\n"]

type nonrec organization_state_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The organization must have a valid state to perform certain operations on the organization or \
   its members.\n"]

type nonrec organization_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "An operation received a valid organization identifier that either doesn't belong or exist in \
   the system.\n"]

type nonrec invalid_parameter_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "One or more of the input parameters don't match the service's restrictions.\n"]

type nonrec entity_state_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "You are performing an operation on a user, group, or resource that isn't in the expected state, \
   such as trying to delete an active user.\n"]

type nonrec entity_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The identifier supplied for the user, group, or resource does not exist in your organization.\n"]

type nonrec associate_delegate_to_resource_response = unit [@@ocaml.doc ""]

type nonrec entity_identifier = string [@@ocaml.doc ""]

type nonrec organization_id = string [@@ocaml.doc ""]

type nonrec associate_delegate_to_resource_request = {
  organization_id : organization_id;
      [@ocaml.doc "The organization under which the resource exists.\n"]
  resource_id : entity_identifier;
      [@ocaml.doc
        "The resource for which members (users or groups) are associated.\n\n\
        \ The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Resource ID: r-0123456789a0123456789b0123456789\n\
        \            \n\
        \             }\n\
        \        {-  Email address: resource\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Resource name: resource\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The member (user or group) to associate to the resource.\n\n\
        \ The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec directory_unavailable_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The directory is unavailable. It might be located in another Region or deleted.\n"]

type nonrec directory_service_authentication_failed_exception = {
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc "The directory service doesn't recognize the credentials supplied by WorkMail.\n"]

type nonrec associate_member_to_group_response = unit [@@ocaml.doc ""]

type nonrec associate_member_to_group_request = {
  organization_id : organization_id; [@ocaml.doc "The organization under which the group exists.\n"]
  group_id : entity_identifier;
      [@ocaml.doc
        "The group to which the member (user or group) is associated.\n\n\
        \ The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Group ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: group\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Group name: group\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  member_id : entity_identifier;
      [@ocaml.doc
        "The member (user or group) to associate to the group.\n\n\
        \ The member ID can accept {i UserID or GroupId}, {i Username or Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Member: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: member\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Member name: member\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The resource cannot be found.\n"]

type nonrec expires_in = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec impersonation_token = string [@@ocaml.doc ""]

type nonrec assume_impersonation_role_response = {
  token : impersonation_token option;
      [@ocaml.doc "The authentication token for the impersonation role.\n"]
  expires_in : expires_in option; [@ocaml.doc "The authentication token's validity, in seconds.\n"]
}
[@@ocaml.doc ""]

type nonrec assume_impersonation_role_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization under which the impersonation role will be assumed.\n"]
  impersonation_role_id : impersonation_role_id;
      [@ocaml.doc "The impersonation role ID to assume.\n"]
}
[@@ocaml.doc ""]

type nonrec lambda_arn = string [@@ocaml.doc ""]

type nonrec lambda_availability_provider = {
  lambda_arn : lambda_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Lambda that acts as the availability provider.\n"]
}
[@@ocaml.doc "Describes a Lambda based availability provider.\n"]

type nonrec external_user_name = string [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec redacted_ews_availability_provider = {
  ews_endpoint : url option; [@ocaml.doc "The endpoint of the remote EWS server.\n"]
  ews_username : external_user_name option;
      [@ocaml.doc "The username used to authenticate the remote EWS server.\n"]
}
[@@ocaml.doc
  "Describes an EWS based availability provider when returned from the service. It does not \
   contain the password of the endpoint.\n"]

type nonrec availability_provider_type = EWS [@ocaml.doc ""] | LAMBDA [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec domain_name = string [@@ocaml.doc ""]

type nonrec availability_configuration = {
  domain_name : domain_name option;
      [@ocaml.doc "Displays the domain to which the provider applies.\n"]
  provider_type : availability_provider_type option;
      [@ocaml.doc "Displays the provider type that applies to this domain.\n"]
  ews_provider : redacted_ews_availability_provider option;
      [@ocaml.doc
        "If [ProviderType] is [EWS], then this field contains [RedactedEwsAvailabilityProvider]. \
         Otherwise, it is not required.\n"]
  lambda_provider : lambda_availability_provider option;
      [@ocaml.doc
        "If ProviderType is [LAMBDA] then this field contains [LambdaAvailabilityProvider]. \
         Otherwise, it is not required.\n"]
  date_created : timestamp option;
      [@ocaml.doc "The date and time at which the availability configuration was created.\n"]
  date_modified : timestamp option;
      [@ocaml.doc "The date and time at which the availability configuration was last modified.\n"]
}
[@@ocaml.doc "List all the [AvailabilityConfiguration]'s for the given WorkMail organization.\n"]

type nonrec availability_configuration_list = availability_configuration list [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec booking_options = {
  auto_accept_requests : boolean_ option;
      [@ocaml.doc
        "The resource's ability to automatically reply to requests. If disabled, delegates must be \
         associated to the resource.\n"]
  auto_decline_recurring_requests : boolean_ option;
      [@ocaml.doc "The resource's ability to automatically decline any recurring requests.\n"]
  auto_decline_conflicting_requests : boolean_ option;
      [@ocaml.doc "The resource's ability to automatically decline any conflicting requests.\n"]
}
[@@ocaml.doc
  "At least one delegate must be associated to the resource to disable automatic replies from the \
   resource.\n"]

type nonrec boolean_object = bool [@@ocaml.doc ""]

type nonrec cancel_mailbox_export_job_response = unit [@@ocaml.doc ""]

type nonrec mailbox_export_job_id = string [@@ocaml.doc ""]

type nonrec idempotency_client_token = string [@@ocaml.doc ""]

type nonrec cancel_mailbox_export_job_request = {
  client_token : idempotency_client_token;
      [@ocaml.doc "The idempotency token for the client request.\n"]
  job_id : mailbox_export_job_id; [@ocaml.doc "The job ID.\n"]
  organization_id : organization_id; [@ocaml.doc "The organization ID.\n"]
}
[@@ocaml.doc ""]

type nonrec mail_domain_state_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "After a domain has been added to the organization, it must be verified. The domain is not yet \
   verified.\n"]

type nonrec mail_domain_not_found_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The domain specified is not found in your organization.\n"]

type nonrec limit_exceeded_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The request exceeds the limit of the resource.\n"]

type nonrec email_address_in_use_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The email address that you're trying to assign is already created for a different user, group, \
   or resource.\n"]

type nonrec create_alias_response = unit [@@ocaml.doc ""]

type nonrec create_alias_request = {
  organization_id : organization_id;
      [@ocaml.doc "The organization under which the member (user or group) exists.\n"]
  entity_id : work_mail_identifier;
      [@ocaml.doc "The member (user or group) to which this alias is added.\n"]
  alias : email_address; [@ocaml.doc "The alias to add to the member set.\n"]
}
[@@ocaml.doc ""]

type nonrec name_availability_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The user, group, or resource name isn't unique in WorkMail.\n"]

type nonrec create_availability_configuration_response = unit [@@ocaml.doc ""]

type nonrec password = string [@@ocaml.doc ""]

type nonrec ews_availability_provider = {
  ews_endpoint : url; [@ocaml.doc "The endpoint of the remote EWS server.\n"]
  ews_username : external_user_name;
      [@ocaml.doc "The username used to authenticate the remote EWS server.\n"]
  ews_password : password; [@ocaml.doc "The password used to authenticate the remote EWS server.\n"]
}
[@@ocaml.doc
  "Describes an EWS based availability provider. This is only used as input to the service.\n"]

type nonrec create_availability_configuration_request = {
  client_token : idempotency_client_token option;
      [@ocaml.doc "An idempotent token that ensures that an API request is executed only once.\n"]
  organization_id : organization_id;
      [@ocaml.doc
        "The WorkMail organization for which the [AvailabilityConfiguration] will be created.\n"]
  domain_name : domain_name; [@ocaml.doc "The domain to which the provider applies.\n"]
  ews_provider : ews_availability_provider option;
      [@ocaml.doc
        "Exchange Web Services (EWS) availability provider definition. The request must contain \
         exactly one provider definition, either [EwsProvider] or [LambdaProvider].\n"]
  lambda_provider : lambda_availability_provider option;
      [@ocaml.doc
        "Lambda availability provider definition. The request must contain exactly one provider \
         definition, either [EwsProvider] or [LambdaProvider].\n"]
}
[@@ocaml.doc ""]

type nonrec reserved_name_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "This user, group, or resource name is not allowed in WorkMail.\n"]

type nonrec create_group_response = {
  group_id : work_mail_identifier option; [@ocaml.doc "The identifier of the group.\n"]
}
[@@ocaml.doc ""]

type nonrec group_name = string [@@ocaml.doc ""]

type nonrec create_group_request = {
  organization_id : organization_id;
      [@ocaml.doc "The organization under which the group is to be created.\n"]
  name : group_name; [@ocaml.doc "The name of the group.\n"]
  hidden_from_global_address_list : boolean_ option;
      [@ocaml.doc "If this parameter is enabled, the group will be hidden from the address book.\n"]
}
[@@ocaml.doc ""]

type nonrec create_identity_center_application_response = {
  application_arn : application_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the application. \n"]
}
[@@ocaml.doc ""]

type nonrec instance_arn = string [@@ocaml.doc ""]

type nonrec identity_center_application_name = string [@@ocaml.doc ""]

type nonrec create_identity_center_application_request = {
  name : identity_center_application_name;
      [@ocaml.doc " The name of the IAM Identity Center application. \n"]
  instance_arn : instance_arn; [@ocaml.doc " The Amazon Resource Name (ARN) of the instance. \n"]
  client_token : idempotency_client_token option;
      [@ocaml.doc " The idempotency token associated with the request. \n"]
}
[@@ocaml.doc ""]

type nonrec create_impersonation_role_response = {
  impersonation_role_id : impersonation_role_id option;
      [@ocaml.doc "The new impersonation role ID.\n"]
}
[@@ocaml.doc ""]

type nonrec target_users = entity_identifier list [@@ocaml.doc ""]

type nonrec impersonation_rule_description = string [@@ocaml.doc ""]

type nonrec impersonation_rule_name = string [@@ocaml.doc ""]

type nonrec impersonation_rule_id = string [@@ocaml.doc ""]

type nonrec impersonation_rule = {
  impersonation_rule_id : impersonation_rule_id; [@ocaml.doc "The identifier of the rule.\n"]
  name : impersonation_rule_name option; [@ocaml.doc "The rule name.\n"]
  description : impersonation_rule_description option; [@ocaml.doc "The rule description.\n"]
  effect_ : access_effect;
      [@ocaml.doc
        "The effect of the rule when it matches the input. Allowed effect values are [ALLOW] or \
         [DENY].\n"]
  target_users : target_users option; [@ocaml.doc "A list of user IDs that match the rule.\n"]
  not_target_users : target_users option;
      [@ocaml.doc "A list of user IDs that don't match the rule.\n"]
}
[@@ocaml.doc "The rules for the given impersonation role.\n"]

type nonrec impersonation_rule_list = impersonation_rule list [@@ocaml.doc ""]

type nonrec impersonation_role_description = string [@@ocaml.doc ""]

type nonrec impersonation_role_type = FULL_ACCESS [@ocaml.doc ""] | READ_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec impersonation_role_name = string [@@ocaml.doc ""]

type nonrec create_impersonation_role_request = {
  client_token : idempotency_client_token option;
      [@ocaml.doc "The idempotency token for the client request.\n"]
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization to create the new impersonation role within.\n"]
  name : impersonation_role_name; [@ocaml.doc "The name of the new impersonation role.\n"]
  type_ : impersonation_role_type;
      [@ocaml.doc
        "The impersonation role's type. The available impersonation role types are [READ_ONLY] or \
         [FULL_ACCESS].\n"]
  description : impersonation_role_description option;
      [@ocaml.doc "The description of the new impersonation role.\n"]
  rules : impersonation_rule_list; [@ocaml.doc "The list of rules for the impersonation role.\n"]
}
[@@ocaml.doc ""]

type nonrec mobile_device_access_rule_id = string [@@ocaml.doc ""]

type nonrec create_mobile_device_access_rule_response = {
  mobile_device_access_rule_id : mobile_device_access_rule_id option;
      [@ocaml.doc "The identifier for the newly created mobile device access rule.\n"]
}
[@@ocaml.doc ""]

type nonrec device_user_agent = string [@@ocaml.doc ""]

type nonrec device_user_agent_list = device_user_agent list [@@ocaml.doc ""]

type nonrec device_operating_system = string [@@ocaml.doc ""]

type nonrec device_operating_system_list = device_operating_system list [@@ocaml.doc ""]

type nonrec device_model = string [@@ocaml.doc ""]

type nonrec device_model_list = device_model list [@@ocaml.doc ""]

type nonrec device_type = string [@@ocaml.doc ""]

type nonrec device_type_list = device_type list [@@ocaml.doc ""]

type nonrec mobile_device_access_rule_effect = ALLOW [@ocaml.doc ""] | DENY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec mobile_device_access_rule_description = string [@@ocaml.doc ""]

type nonrec mobile_device_access_rule_name = string [@@ocaml.doc ""]

type nonrec create_mobile_device_access_rule_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization under which the rule will be created.\n"]
  client_token : idempotency_client_token option;
      [@ocaml.doc "The idempotency token for the client request.\n"]
  name : mobile_device_access_rule_name; [@ocaml.doc "The rule name.\n"]
  description : mobile_device_access_rule_description option; [@ocaml.doc "The rule description.\n"]
  effect_ : mobile_device_access_rule_effect;
      [@ocaml.doc "The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].\n"]
  device_types : device_type_list option; [@ocaml.doc "Device types that the rule will match.\n"]
  not_device_types : device_type_list option;
      [@ocaml.doc
        "Device types that the rule {b will not} match. All other device types will match.\n"]
  device_models : device_model_list option; [@ocaml.doc "Device models that the rule will match.\n"]
  not_device_models : device_model_list option;
      [@ocaml.doc
        "Device models that the rule {b will not} match. All other device models will match.\n"]
  device_operating_systems : device_operating_system_list option;
      [@ocaml.doc "Device operating systems that the rule will match.\n"]
  not_device_operating_systems : device_operating_system_list option;
      [@ocaml.doc
        "Device operating systems that the rule {b will not} match. All other device operating \
         systems will match.\n"]
  device_user_agents : device_user_agent_list option;
      [@ocaml.doc "Device user agents that the rule will match.\n"]
  not_device_user_agents : device_user_agent_list option;
      [@ocaml.doc
        "Device user agents that the rule {b will not} match. All other device user agents will \
         match.\n"]
}
[@@ocaml.doc ""]

type nonrec directory_in_use_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The directory is already in use by another WorkMail organization in the same account and Region.\n"]

type nonrec create_organization_response = {
  organization_id : organization_id option; [@ocaml.doc "The organization ID.\n"]
}
[@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec hosted_zone_id = string [@@ocaml.doc ""]

type nonrec domain = {
  domain_name : domain_name; [@ocaml.doc "The fully qualified domain name.\n"]
  hosted_zone_id : hosted_zone_id option;
      [@ocaml.doc
        "The hosted zone ID for a domain hosted in Route 53. Required when configuring a domain \
         hosted in Route 53.\n"]
}
[@@ocaml.doc
  "The domain to associate with an WorkMail organization.\n\n\
  \ When you configure a domain hosted in Amazon Route 53 (Route 53), all recommended DNS records \
   are added to the organization when you create it. For more information, see \
   {{:https://docs.aws.amazon.com/workmail/latest/adminguide/add_domain.html}Adding a domain} in \
   the {i WorkMail Administrator Guide}.\n\
  \ "]

type nonrec domains = domain list [@@ocaml.doc ""]

type nonrec organization_name = string [@@ocaml.doc ""]

type nonrec directory_id = string [@@ocaml.doc ""]

type nonrec create_organization_request = {
  directory_id : directory_id option; [@ocaml.doc "The AWS Directory Service directory ID.\n"]
  alias : organization_name; [@ocaml.doc "The organization alias.\n"]
  client_token : idempotency_client_token option;
      [@ocaml.doc "The idempotency token associated with the request.\n"]
  domains : domains option; [@ocaml.doc "The email domains to associate with the organization.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of a customer managed key from AWS KMS.\n"]
  enable_interoperability : boolean_ option;
      [@ocaml.doc
        "When [true], allows organization interoperability between WorkMail and Microsoft \
         Exchange. If [true], you must include a AD Connector directory ID in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec create_resource_response = {
  resource_id : resource_id option; [@ocaml.doc "The identifier of the new resource.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_description = string [@@ocaml.doc ""]

type nonrec resource_type = ROOM [@ocaml.doc ""] | EQUIPMENT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec resource_name = string [@@ocaml.doc ""]

type nonrec create_resource_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier associated with the organization for which the resource is created.\n"]
  name : resource_name; [@ocaml.doc "The name of the new resource.\n"]
  type_ : resource_type;
      [@ocaml.doc "The type of the new resource. The available types are [equipment] and [room].\n"]
  description : resource_description option; [@ocaml.doc "Resource description.\n"]
  hidden_from_global_address_list : boolean_ option;
      [@ocaml.doc
        "If this parameter is enabled, the resource will be hidden from the address book.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_password_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The supplied password doesn't match the minimum security constraints, such as length or use of \
   special characters.\n"]

type nonrec create_user_response = {
  user_id : work_mail_identifier option; [@ocaml.doc "The identifier for the new user.\n"]
}
[@@ocaml.doc ""]

type nonrec identity_provider_user_id = string [@@ocaml.doc ""]

type nonrec user_attribute = string [@@ocaml.doc ""]

type nonrec user_role =
  | USER [@ocaml.doc ""]
  | RESOURCE [@ocaml.doc ""]
  | SYSTEM_USER [@ocaml.doc ""]
  | REMOTE_USER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec user_name = string [@@ocaml.doc ""]

type nonrec create_user_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier of the organization for which the user is created.\n"]
  name : user_name;
      [@ocaml.doc
        "The name for the new user. WorkMail directory user names have a maximum length of 64. All \
         others have a maximum length of 20.\n"]
  display_name : user_attribute; [@ocaml.doc "The display name for the new user.\n"]
  password : password option; [@ocaml.doc "The password for the new user.\n"]
  role : user_role option;
      [@ocaml.doc
        "The role of the new user.\n\n\
        \ You cannot pass {i SYSTEM_USER} or {i RESOURCE} role in a single request. When a user \
         role is not selected, the default role of {i USER} is selected.\n\
        \ "]
  first_name : user_attribute option; [@ocaml.doc "The first name of the new user.\n"]
  last_name : user_attribute option; [@ocaml.doc "The last name of the new user. \n"]
  hidden_from_global_address_list : boolean_ option;
      [@ocaml.doc "If this parameter is enabled, the user will be hidden from the address book.\n"]
  identity_provider_user_id : identity_provider_user_id option;
      [@ocaml.doc
        "User ID from the IAM Identity Center. If this parameter is empty it will be updated \
         automatically when the user logs in for the first time to the mailbox associated with \
         WorkMail.\n"]
}
[@@ocaml.doc ""]

type nonrec member_type = GROUP [@ocaml.doc ""] | USER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec delegate = {
  id : string_;
      [@ocaml.doc "The identifier for the user or group associated as the resource's delegate.\n"]
  type_ : member_type; [@ocaml.doc "The type of the delegate: user or group.\n"]
}
[@@ocaml.doc
  "The name of the attribute, which is one of the values defined in the UserAttribute enumeration.\n"]

type nonrec delete_access_control_rule_response = unit [@@ocaml.doc ""]

type nonrec delete_access_control_rule_request = {
  organization_id : organization_id; [@ocaml.doc "The identifier for the organization.\n"]
  name : access_control_rule_name; [@ocaml.doc "The name of the access control rule.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_alias_response = unit [@@ocaml.doc ""]

type nonrec delete_alias_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the user exists.\n"]
  entity_id : work_mail_identifier;
      [@ocaml.doc
        "The identifier for the member (user or group) from which to have the aliases removed.\n"]
  alias : email_address;
      [@ocaml.doc
        "The aliases to be removed from the user's set of aliases. Duplicate entries in the list \
         are collapsed into single entries (the list is transformed into a set).\n"]
}
[@@ocaml.doc ""]

type nonrec delete_availability_configuration_response = unit [@@ocaml.doc ""]

type nonrec delete_availability_configuration_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The WorkMail organization for which the [AvailabilityConfiguration] will be deleted.\n"]
  domain_name : domain_name;
      [@ocaml.doc "The domain for which the [AvailabilityConfiguration] will be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_email_monitoring_configuration_response = unit [@@ocaml.doc ""]

type nonrec delete_email_monitoring_configuration_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The ID of the organization from which the email monitoring configuration is deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_group_response = unit [@@ocaml.doc ""]

type nonrec delete_group_request = {
  organization_id : organization_id; [@ocaml.doc "The organization that contains the group.\n"]
  group_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the group to be deleted.\n\n\
        \ The identifier can be the {i GroupId}, or {i Groupname}. The following identity formats \
         are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Group ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Group name: group\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_identity_center_application_response = unit [@@ocaml.doc ""]

type nonrec delete_identity_center_application_request = {
  application_arn : application_arn;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the application. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_identity_provider_configuration_response = unit [@@ocaml.doc ""]

type nonrec delete_identity_provider_configuration_request = {
  organization_id : organization_id; [@ocaml.doc " The Organization ID. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_impersonation_role_response = unit [@@ocaml.doc ""]

type nonrec delete_impersonation_role_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization from which to delete the impersonation role.\n"]
  impersonation_role_id : impersonation_role_id;
      [@ocaml.doc "The ID of the impersonation role to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_mailbox_permissions_response = unit [@@ocaml.doc ""]

type nonrec delete_mailbox_permissions_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier of the organization under which the member (user or group) exists.\n"]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the entity that owns the mailbox.\n\n\
        \ The identifier can be {i UserId or Group Id}, {i Username or Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity ID: 12345678-1234-1234-1234-123456789012, \
         r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity name: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  grantee_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the entity for which to delete granted permissions.\n\n\
        \ The identifier can be {i UserId, ResourceID, or Group Id}, {i Username or Groupname}, or \
         {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Grantee ID: \
         12345678-1234-1234-1234-123456789012,r-0123456789a0123456789b0123456789, or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: grantee\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Grantee name: grantee\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_mobile_device_access_override_response = unit [@@ocaml.doc ""]

type nonrec device_id = string [@@ocaml.doc ""]

type nonrec delete_mobile_device_access_override_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization for which the access override will be deleted.\n"]
  user_id : entity_identifier;
      [@ocaml.doc
        "The WorkMail user for which you want to delete the override. Accepts the following types \
         of user identities:\n\n\
        \ {ul\n\
        \       {-  User ID: [12345678-1234-1234-1234-123456789012] or \
         [S-1-1-12-1234567890-123456789-123456789-1234] \n\
        \           \n\
        \            }\n\
        \       {-  Email address: [user@domain.tld] \n\
        \           \n\
        \            }\n\
        \       {-  User name: [user] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  device_id : device_id;
      [@ocaml.doc
        "The mobile device for which you delete the override. [DeviceId] is case insensitive.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_mobile_device_access_rule_response = unit [@@ocaml.doc ""]

type nonrec delete_mobile_device_access_rule_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization under which the rule will be deleted.\n"]
  mobile_device_access_rule_id : mobile_device_access_rule_id;
      [@ocaml.doc "The identifier of the rule to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_organization_response = {
  organization_id : organization_id option; [@ocaml.doc "The organization ID.\n"]
  state : string_ option; [@ocaml.doc "The state of the organization.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_organization_request = {
  client_token : idempotency_client_token option;
      [@ocaml.doc "The idempotency token associated with the request.\n"]
  organization_id : organization_id; [@ocaml.doc "The organization ID.\n"]
  delete_directory : boolean_;
      [@ocaml.doc
        "If true, deletes the AWS Directory Service directory associated with the organization.\n"]
  force_delete : boolean_ option;
      [@ocaml.doc "Deletes a WorkMail organization even if the organization has enabled users.\n"]
  delete_identity_center_application : boolean_ option;
      [@ocaml.doc
        "Deletes IAM Identity Center application for WorkMail. This action does not affect \
         authentication settings for any organization.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_personal_access_token_response = unit [@@ocaml.doc ""]

type nonrec personal_access_token_id = string [@@ocaml.doc ""]

type nonrec delete_personal_access_token_request = {
  organization_id : organization_id; [@ocaml.doc " The Organization ID. \n"]
  personal_access_token_id : personal_access_token_id;
      [@ocaml.doc " The Personal Access Token ID.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_response = unit [@@ocaml.doc ""]

type nonrec delete_resource_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier associated with the organization from which the resource is deleted.\n"]
  resource_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the resource to be deleted.\n\n\
        \ The identifier can accept {i ResourceId}, or {i Resourcename}. The following identity \
         formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Resource ID: r-0123456789a0123456789b0123456789\n\
        \            \n\
        \             }\n\
        \        {-  Resource name: resource\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec delete_retention_policy_response = unit [@@ocaml.doc ""]

type nonrec short_string = string [@@ocaml.doc ""]

type nonrec delete_retention_policy_request = {
  organization_id : organization_id; [@ocaml.doc "The organization ID.\n"]
  id : short_string; [@ocaml.doc "The retention policy ID.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_user_response = unit [@@ocaml.doc ""]

type nonrec delete_user_request = {
  organization_id : organization_id;
      [@ocaml.doc "The organization that contains the user to be deleted.\n"]
  user_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the user to be deleted.\n\n\
        \ The identifier can be the {i UserId} or {i Username}. The following identity formats are \
         available:\n\
        \ \n\
        \  {ul\n\
        \        {-  User ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  User name: user\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec deregister_from_work_mail_response = unit [@@ocaml.doc ""]

type nonrec deregister_from_work_mail_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the WorkMail entity exists.\n"]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the member to be updated.\n\n\
        \ The identifier can be {i UserId, ResourceId, or Group Id}, {i Username, Resourcename, or \
         Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity ID: 12345678-1234-1234-1234-123456789012, \
         r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity name: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec mail_domain_in_use_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The domain you're trying to change is in use by another user or organization in your account. \
   See the error message for details.\n"]

type nonrec invalid_custom_ses_configuration_exception = {
  message : string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You SES configuration has customizations that WorkMail cannot save. The error message lists the \
   invalid setting. For examples of invalid settings, refer to \
   {{:https://docs.aws.amazon.com/ses/latest/APIReference/API_CreateReceiptRule.html}CreateReceiptRule}.\n"]

type nonrec deregister_mail_domain_response = unit [@@ocaml.doc ""]

type nonrec work_mail_domain_name = string [@@ocaml.doc ""]

type nonrec deregister_mail_domain_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization for which the domain will be deregistered.\n"]
  domain_name : work_mail_domain_name; [@ocaml.doc "The domain to deregister in WorkMail and SES.\n"]
}
[@@ocaml.doc ""]

type nonrec log_group_arn = string [@@ocaml.doc ""]

type nonrec role_arn = string [@@ocaml.doc ""]

type nonrec describe_email_monitoring_configuration_response = {
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring \
         configuration.\n"]
  log_group_arn : log_group_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email \
         monitoring configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_email_monitoring_configuration_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The ID of the organization for which the email monitoring configuration is described.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_type = GROUP [@ocaml.doc ""] | USER [@ocaml.doc ""] | RESOURCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_entity_response = {
  entity_id : work_mail_identifier option;
      [@ocaml.doc "The entity ID under which the entity exists.\n"]
  name : string_ option; [@ocaml.doc "Username, GroupName, or ResourceName based on entity type.\n"]
  type_ : entity_type option; [@ocaml.doc "Entity type.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_entity_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the entity exists.\n"]
  email : email_address; [@ocaml.doc "The email under which the entity exists.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_state =
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_group_response = {
  group_id : work_mail_identifier option; [@ocaml.doc "The identifier of the described group.\n"]
  name : group_name option; [@ocaml.doc "The name of the described group.\n"]
  email : email_address option; [@ocaml.doc "The email of the described group.\n"]
  state : entity_state option;
      [@ocaml.doc
        "The state of the user: enabled (registered to WorkMail) or disabled (deregistered or \
         never registered to WorkMail).\n"]
  enabled_date : timestamp option;
      [@ocaml.doc
        "The date and time when a user was registered to WorkMail, in UNIX epoch time format.\n"]
  disabled_date : timestamp option;
      [@ocaml.doc
        "The date and time when a user was deregistered from WorkMail, in UNIX epoch time format.\n"]
  hidden_from_global_address_list : boolean_ option;
      [@ocaml.doc "If the value is set to {i true}, the group is hidden from the address book.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_group_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the group exists.\n"]
  group_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the group to be described.\n\n\
        \ The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Group ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: group\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Group name: group\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec personal_access_token_lifetime_in_days = int [@@ocaml.doc ""]

type nonrec personal_access_token_configuration_status =
  | ACTIVE [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec personal_access_token_configuration = {
  status : personal_access_token_configuration_status;
      [@ocaml.doc
        " The status of the Personal Access Token allowed for the organization. \n\n\
        \ {ul\n\
        \       {-   {i Active} - Mailbox users can login to the web application and choose {i \
         Settings} to see the new {i Personal Access Tokens} page to create and delete the \
         Personal Access Tokens. Mailbox users can use the Personal Access Tokens to set up \
         mailbox connection from desktop or mobile email clients.\n\
        \           \n\
        \            }\n\
        \       {-   {i Inactive} - Personal Access Tokens are disabled for your organization. \
         Mailbox users can\226\128\153t create, list, or delete Personal Access Tokens and \
         can\226\128\153t use them to connect to their mailboxes from desktop or mobile email \
         clients.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  lifetime_in_days : personal_access_token_lifetime_in_days option;
      [@ocaml.doc " The validity of the Personal Access Token status in days. \n"]
}
[@@ocaml.doc " Displays the Personal Access Token status. \n"]

type nonrec identity_center_configuration = {
  instance_arn : instance_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the of IAM Identity Center instance. Must be in the \
         same AWS account and region as WorkMail organization.\n"]
  application_arn : application_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of IAMIdentity Center Application for WorkMail. Must be \
         created by the WorkMail API, see CreateIdentityCenterApplication.\n"]
}
[@@ocaml.doc " The IAM Identity Center configuration. \n"]

type nonrec identity_provider_authentication_mode =
  | IDENTITY_PROVIDER_ONLY [@ocaml.doc ""]
  | IDENTITY_PROVIDER_AND_DIRECTORY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec describe_identity_provider_configuration_response = {
  authentication_mode : identity_provider_authentication_mode option;
      [@ocaml.doc " The authentication mode used in WorkMail.\n"]
  identity_center_configuration : identity_center_configuration option;
      [@ocaml.doc " The details of the IAM Identity Center configuration. \n"]
  personal_access_token_configuration : personal_access_token_configuration option;
      [@ocaml.doc " The details of the Personal Access Token configuration. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_identity_provider_configuration_request = {
  organization_id : organization_id; [@ocaml.doc " The Organization ID. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_inbound_dmarc_settings_response = {
  enforced : boolean_ option; [@ocaml.doc "Lists the enforcement setting of the applied policy.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_inbound_dmarc_settings_request = {
  organization_id : organization_id; [@ocaml.doc "Lists the ID of the given organization.\n"]
}
[@@ocaml.doc ""]

type nonrec mailbox_export_error_info = string [@@ocaml.doc ""]

type nonrec mailbox_export_job_state =
  | RUNNING [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec percentage = int [@@ocaml.doc ""]

type nonrec s3_object_key = string [@@ocaml.doc ""]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec describe_mailbox_export_job_response = {
  entity_id : work_mail_identifier option;
      [@ocaml.doc "The identifier of the user or resource associated with the mailbox.\n"]
  description : description option; [@ocaml.doc "The mailbox export job description.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The ARN of the AWS Identity and Access Management (IAM) role that grants write permission \
         to the Amazon Simple Storage Service (Amazon S3) bucket.\n"]
  kms_key_arn : kms_key_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key \
         that encrypts the exported mailbox content.\n"]
  s3_bucket_name : s3_bucket_name option; [@ocaml.doc "The name of the S3 bucket.\n"]
  s3_prefix : s3_object_key option; [@ocaml.doc "The S3 bucket prefix.\n"]
  s3_path : s3_object_key option;
      [@ocaml.doc
        "The path to the S3 bucket and file that the mailbox export job is exporting to.\n"]
  estimated_progress : percentage option;
      [@ocaml.doc "The estimated progress of the mailbox export job, in percentage points.\n"]
  state : mailbox_export_job_state option; [@ocaml.doc "The state of the mailbox export job.\n"]
  error_info : mailbox_export_error_info option;
      [@ocaml.doc "Error information for failed mailbox export jobs.\n"]
  start_time : timestamp option; [@ocaml.doc "The mailbox export job start timestamp.\n"]
  end_time : timestamp option; [@ocaml.doc "The mailbox export job end timestamp.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_mailbox_export_job_request = {
  job_id : mailbox_export_job_id; [@ocaml.doc "The mailbox export job ID.\n"]
  organization_id : organization_id; [@ocaml.doc "The organization ID.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_organization_response = {
  organization_id : organization_id option; [@ocaml.doc "The identifier of an organization.\n"]
  alias : organization_name option; [@ocaml.doc "The alias for an organization.\n"]
  state : string_ option; [@ocaml.doc "The state of an organization.\n"]
  directory_id : string_ option;
      [@ocaml.doc "The identifier for the directory associated with an WorkMail organization.\n"]
  directory_type : string_ option;
      [@ocaml.doc "The type of directory associated with the WorkMail organization.\n"]
  default_mail_domain : string_ option;
      [@ocaml.doc "The default mail domain associated with the organization.\n"]
  completed_date : timestamp option;
      [@ocaml.doc
        "The date at which the organization became usable in the WorkMail context, in UNIX epoch \
         time format.\n"]
  error_message : string_ option;
      [@ocaml.doc
        "(Optional) The error message indicating if unexpected behavior was encountered with \
         regards to the organization.\n"]
  ar_n : amazon_resource_name option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the organization.\n"]
  migration_admin : work_mail_identifier option;
      [@ocaml.doc
        "The user ID of the migration admin if migration is enabled for the organization.\n"]
  interoperability_enabled : boolean_ option;
      [@ocaml.doc "Indicates if interoperability is enabled for this organization.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_organization_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization to be described.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_response = {
  resource_id : resource_id option; [@ocaml.doc "The identifier of the described resource.\n"]
  email : email_address option; [@ocaml.doc "The email of the described resource.\n"]
  name : resource_name option; [@ocaml.doc "The name of the described resource.\n"]
  type_ : resource_type option; [@ocaml.doc "The type of the described resource.\n"]
  booking_options : booking_options option;
      [@ocaml.doc "The booking options for the described resource.\n"]
  state : entity_state option;
      [@ocaml.doc
        "The state of the resource: enabled (registered to WorkMail), disabled (deregistered or \
         never registered to WorkMail), or deleted.\n"]
  enabled_date : timestamp option;
      [@ocaml.doc
        "The date and time when a resource was enabled for WorkMail, in UNIX epoch time format.\n"]
  disabled_date : timestamp option;
      [@ocaml.doc
        "The date and time when a resource was disabled from WorkMail, in UNIX epoch time format.\n"]
  description : resource_description option; [@ocaml.doc "Description of the resource.\n"]
  hidden_from_global_address_list : boolean_ option;
      [@ocaml.doc "If enabled, the resource is hidden from the global address list.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier associated with the organization for which the resource is described.\n"]
  resource_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the resource to be described.\n\n\
        \ The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Resource ID: r-0123456789a0123456789b0123456789\n\
        \            \n\
        \             }\n\
        \        {-  Email address: resource\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Resource name: resource\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec identity_provider_identity_store_id = string [@@ocaml.doc ""]

type nonrec describe_user_response = {
  user_id : work_mail_identifier option; [@ocaml.doc "The identifier for the described user.\n"]
  name : user_name option; [@ocaml.doc "The name for the user.\n"]
  email : email_address option; [@ocaml.doc "The email of the user.\n"]
  display_name : user_attribute option; [@ocaml.doc "The display name of the user.\n"]
  state : entity_state option;
      [@ocaml.doc
        "The state of a user: enabled (registered to WorkMail) or disabled (deregistered or never \
         registered to WorkMail).\n"]
  user_role : user_role option;
      [@ocaml.doc
        "In certain cases, other entities are modeled as users. If interoperability is enabled, \
         resources are imported into WorkMail as users. Because different WorkMail organizations \
         rely on different directory types, administrators can distinguish between an unregistered \
         user (account is disabled and has a user role) and the directory administrators. The \
         values are USER, RESOURCE, SYSTEM_USER, and REMOTE_USER.\n"]
  enabled_date : timestamp option;
      [@ocaml.doc
        "The date and time at which the user was enabled for WorkMailusage, in UNIX epoch time \
         format.\n"]
  disabled_date : timestamp option;
      [@ocaml.doc
        "The date and time at which the user was disabled for WorkMail usage, in UNIX epoch time \
         format.\n"]
  mailbox_provisioned_date : timestamp option;
      [@ocaml.doc "The date when the mailbox was created for the user.\n"]
  mailbox_deprovisioned_date : timestamp option;
      [@ocaml.doc "The date when the mailbox was removed for the user.\n"]
  first_name : user_attribute option; [@ocaml.doc "First name of the user.\n"]
  last_name : user_attribute option; [@ocaml.doc "Last name of the user.\n"]
  hidden_from_global_address_list : boolean_ option;
      [@ocaml.doc "If enabled, the user is hidden from the global address list.\n"]
  initials : user_attribute option; [@ocaml.doc "Initials of the user.\n"]
  telephone : user_attribute option; [@ocaml.doc "User's contact number.\n"]
  street : user_attribute option; [@ocaml.doc "Street where the user is located.\n"]
  job_title : user_attribute option; [@ocaml.doc "Job title of the user.\n"]
  city : user_attribute option; [@ocaml.doc "City where the user is located.\n"]
  company : user_attribute option; [@ocaml.doc "Company of the user.\n"]
  zip_code : user_attribute option; [@ocaml.doc "Zip code of the user.\n"]
  department : user_attribute option; [@ocaml.doc "Department of the user.\n"]
  country : user_attribute option; [@ocaml.doc "Country where the user is located.\n"]
  office : user_attribute option; [@ocaml.doc "Office where the user is located.\n"]
  identity_provider_user_id : identity_provider_user_id option;
      [@ocaml.doc
        "User ID from the IAM Identity Center. If this parameter is empty it will be updated \
         automatically when the user logs in for the first time to the mailbox associated with \
         WorkMail.\n"]
  identity_provider_identity_store_id : identity_provider_identity_store_id option;
      [@ocaml.doc
        " Identity Store ID from the IAM Identity Center. If this parameter is empty it will be \
         updated automatically when the user logs in for the first time to the mailbox associated \
         with WorkMail. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_user_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the user exists.\n"]
  user_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the user to be described.\n\n\
        \ The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity \
         formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  User ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: user\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  User name: user\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec disassociate_delegate_from_resource_response = unit [@@ocaml.doc ""]

type nonrec disassociate_delegate_from_resource_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the resource exists.\n"]
  resource_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the resource from which delegates' set members are removed. \n\n\
        \ The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Resource ID: r-0123456789a0123456789b0123456789\n\
        \            \n\
        \             }\n\
        \        {-  Email address: resource\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Resource name: resource\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the member (user, group) to be removed from the resource's delegates.\n\n\
        \ The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec disassociate_member_from_group_response = unit [@@ocaml.doc ""]

type nonrec disassociate_member_from_group_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the group exists.\n"]
  group_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the group from which members are removed.\n\n\
        \ The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Group ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: group\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Group name: group\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  member_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the member to be removed from the group.\n\n\
        \ The member ID can accept {i UserID or GroupId}, {i Username or Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Member ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: member\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Member name: member\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec dns_record = {
  type_ : string_ option;
      [@ocaml.doc "The RFC 1035 record type. Possible values: [CNAME], [A], [MX].\n"]
  hostname : string_ option; [@ocaml.doc "The DNS hostname.- For example, [domain.example.com].\n"]
  value : string_ option;
      [@ocaml.doc "The value returned by the DNS for a query to that hostname and record type.\n"]
}
[@@ocaml.doc "A DNS record uploaded to your DNS provider.\n"]

type nonrec dns_record_verification_status =
  | PENDING [@ocaml.doc ""]
  | VERIFIED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dns_records = dns_record list [@@ocaml.doc ""]

type nonrec entity_already_registered_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The user, group, or resource that you're trying to register is already registered.\n"]

type nonrec retention_period = int [@@ocaml.doc ""]

type nonrec retention_action =
  | NONE [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
  | PERMANENTLY_DELETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec folder_name =
  | INBOX [@ocaml.doc ""]
  | DELETED_ITEMS [@ocaml.doc ""]
  | SENT_ITEMS [@ocaml.doc ""]
  | DRAFTS [@ocaml.doc ""]
  | JUNK_EMAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec folder_configuration = {
  name : folder_name; [@ocaml.doc "The folder name.\n"]
  action : retention_action;
      [@ocaml.doc
        "The action to take on the folder contents at the end of the folder configuration period.\n"]
  period : retention_period option;
      [@ocaml.doc "The number of days for which the folder-configuration action applies.\n"]
}
[@@ocaml.doc "The configuration applied to an organization's folders by its retention policy.\n"]

type nonrec folder_configurations = folder_configuration list [@@ocaml.doc ""]

type nonrec get_access_control_effect_response = {
  effect_ : access_control_rule_effect option; [@ocaml.doc "The rule effect.\n"]
  matched_rules : access_control_rule_name_list option;
      [@ocaml.doc "The rules that match the given parameters, resulting in an effect.\n"]
}
[@@ocaml.doc ""]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec get_access_control_effect_request = {
  organization_id : organization_id; [@ocaml.doc "The identifier for the organization.\n"]
  ip_address : ip_address; [@ocaml.doc "The IPv4 address.\n"]
  action : access_control_rule_action;
      [@ocaml.doc
        "The access protocol action. Valid values include [ActiveSync], [AutoDiscover], [EWS], \
         [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"]
  user_id : work_mail_identifier option; [@ocaml.doc "The user ID.\n"]
  impersonation_role_id : impersonation_role_id option; [@ocaml.doc "The impersonation role ID.\n"]
}
[@@ocaml.doc ""]

type nonrec get_default_retention_policy_response = {
  id : short_string option; [@ocaml.doc "The retention policy ID.\n"]
  name : short_string option; [@ocaml.doc "The retention policy name.\n"]
  description : string_ option; [@ocaml.doc "The retention policy description.\n"]
  folder_configurations : folder_configurations option;
      [@ocaml.doc "The retention policy folder configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec get_default_retention_policy_request = {
  organization_id : organization_id; [@ocaml.doc "The organization ID.\n"]
}
[@@ocaml.doc ""]

type nonrec get_impersonation_role_response = {
  impersonation_role_id : impersonation_role_id option; [@ocaml.doc "The impersonation role ID.\n"]
  name : impersonation_role_name option; [@ocaml.doc "The impersonation role name.\n"]
  type_ : impersonation_role_type option; [@ocaml.doc "The impersonation role type.\n"]
  description : impersonation_role_description option;
      [@ocaml.doc "The impersonation role description.\n"]
  rules : impersonation_rule_list option;
      [@ocaml.doc "The list of rules for the given impersonation role.\n"]
  date_created : timestamp option;
      [@ocaml.doc "The date when the impersonation role was created.\n"]
  date_modified : timestamp option;
      [@ocaml.doc "The date when the impersonation role was last modified.\n"]
}
[@@ocaml.doc ""]

type nonrec get_impersonation_role_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization from which to retrieve the impersonation role.\n"]
  impersonation_role_id : impersonation_role_id;
      [@ocaml.doc "The impersonation role ID to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec impersonation_matched_rule = {
  impersonation_rule_id : impersonation_rule_id option;
      [@ocaml.doc "The ID of the rule that matched the input\n"]
  name : impersonation_rule_name option;
      [@ocaml.doc "The name of the rule that matched the input.\n"]
}
[@@ocaml.doc "The impersonation rule that matched the input.\n"]

type nonrec impersonation_matched_rule_list = impersonation_matched_rule list [@@ocaml.doc ""]

type nonrec get_impersonation_role_effect_response = {
  type_ : impersonation_role_type option; [@ocaml.doc "The impersonation role type.\n"]
  effect_ : access_effect option;
      [@ocaml.doc
        " Effect of the impersonation role on the target user based on its rules. Available \
         effects are [ALLOW] or [DENY].\n"]
  matched_rules : impersonation_matched_rule_list option;
      [@ocaml.doc "A list of the rules that match the input and produce the configured effect.\n"]
}
[@@ocaml.doc ""]

type nonrec get_impersonation_role_effect_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization where the impersonation role is defined.\n"]
  impersonation_role_id : impersonation_role_id; [@ocaml.doc "The impersonation role ID to test.\n"]
  target_user : entity_identifier;
      [@ocaml.doc
        "The WorkMail organization user chosen to test the impersonation role. The following \
         identity formats are available:\n\n\
        \ {ul\n\
        \       {-  User ID: [12345678-1234-1234-1234-123456789012] or \
         [S-1-1-12-1234567890-123456789-123456789-1234] \n\
        \           \n\
        \            }\n\
        \       {-  Email address: [user@domain.tld] \n\
        \           \n\
        \            }\n\
        \       {-  User name: [user] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec get_mail_domain_response = {
  records : dns_records option;
      [@ocaml.doc
        "A list of the DNS records that WorkMail recommends adding in your DNS provider for the \
         best user experience. The records configure your domain with DMARC, SPF, DKIM, and direct \
         incoming email traffic to SES. See admin guide for more details.\n"]
  is_test_domain : boolean_ option;
      [@ocaml.doc
        "Specifies whether the domain is a test domain provided by WorkMail, or a custom domain.\n"]
  is_default : boolean_ option;
      [@ocaml.doc "Specifies whether the domain is the default domain for your organization.\n"]
  ownership_verification_status : dns_record_verification_status option;
      [@ocaml.doc " Indicates the status of the domain ownership verification.\n"]
  dkim_verification_status : dns_record_verification_status option;
      [@ocaml.doc "Indicates the status of a DKIM verification.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mail_domain_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization for which the domain is retrieved.\n"]
  domain_name : work_mail_domain_name;
      [@ocaml.doc "The domain from which you want to retrieve details.\n"]
}
[@@ocaml.doc ""]

type nonrec mailbox_size = float [@@ocaml.doc ""]

type nonrec mailbox_quota = int [@@ocaml.doc ""]

type nonrec get_mailbox_details_response = {
  mailbox_quota : mailbox_quota option;
      [@ocaml.doc "The maximum allowed mailbox size, in MB, for the specified user.\n"]
  mailbox_size : mailbox_size option;
      [@ocaml.doc "The current mailbox size, in MB, for the specified user.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mailbox_details_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier for the organization that contains the user whose mailbox details are \
         being requested.\n"]
  user_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the user whose mailbox details are being requested.\n\n\
        \ The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity \
         formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  User ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: user\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  User name: user\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec mobile_device_access_matched_rule = {
  mobile_device_access_rule_id : mobile_device_access_rule_id option;
      [@ocaml.doc "Identifier of the rule that a simulated user matches.\n"]
  name : mobile_device_access_rule_name option;
      [@ocaml.doc "Name of a rule that a simulated user matches.\n"]
}
[@@ocaml.doc "The rule that a simulated user matches.\n"]

type nonrec mobile_device_access_matched_rule_list = mobile_device_access_matched_rule list
[@@ocaml.doc ""]

type nonrec get_mobile_device_access_effect_response = {
  effect_ : mobile_device_access_rule_effect option;
      [@ocaml.doc
        "The effect of the simulated access, [ALLOW] or [DENY], after evaluating mobile device \
         access rules in the WorkMail organization for the simulated user parameters.\n"]
  matched_rules : mobile_device_access_matched_rule_list option;
      [@ocaml.doc
        "A list of the rules which matched the simulated user input and produced the effect.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mobile_device_access_effect_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization to simulate the access effect for.\n"]
  device_type : device_type option; [@ocaml.doc "Device type the simulated user will report.\n"]
  device_model : device_model option; [@ocaml.doc "Device model the simulated user will report.\n"]
  device_operating_system : device_operating_system option;
      [@ocaml.doc "Device operating system the simulated user will report.\n"]
  device_user_agent : device_user_agent option;
      [@ocaml.doc "Device user agent the simulated user will report.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mobile_device_access_override_response = {
  user_id : work_mail_identifier option;
      [@ocaml.doc "The WorkMail user to which the access override applies.\n"]
  device_id : device_id option; [@ocaml.doc "The device to which the access override applies.\n"]
  effect_ : mobile_device_access_rule_effect option;
      [@ocaml.doc "The effect of the override, [ALLOW] or [DENY].\n"]
  description : mobile_device_access_rule_description option;
      [@ocaml.doc "A description of the override.\n"]
  date_created : timestamp option; [@ocaml.doc "The date the override was first created.\n"]
  date_modified : timestamp option; [@ocaml.doc "The date the description was last modified.\n"]
}
[@@ocaml.doc ""]

type nonrec get_mobile_device_access_override_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization to which you want to apply the override.\n"]
  user_id : entity_identifier;
      [@ocaml.doc
        "Identifies the WorkMail user for the override. Accepts the following types of user \
         identities: \n\n\
        \ {ul\n\
        \       {-  User ID: [12345678-1234-1234-1234-123456789012] or \
         [S-1-1-12-1234567890-123456789-123456789-1234] \n\
        \           \n\
        \            }\n\
        \       {-  Email address: [user@domain.tld] \n\
        \           \n\
        \            }\n\
        \       {-  User name: [user] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  device_id : device_id;
      [@ocaml.doc
        "The mobile device to which the override applies. [DeviceId] is case insensitive.\n"]
}
[@@ocaml.doc ""]

type nonrec personal_access_token_scope = string [@@ocaml.doc ""]

type nonrec personal_access_token_scope_list = personal_access_token_scope list [@@ocaml.doc ""]

type nonrec personal_access_token_name = string [@@ocaml.doc ""]

type nonrec get_personal_access_token_metadata_response = {
  personal_access_token_id : personal_access_token_id option;
      [@ocaml.doc " The Personal Access Token ID.\n"]
  user_id : work_mail_identifier option; [@ocaml.doc " The WorkMail User ID. \n"]
  name : personal_access_token_name option; [@ocaml.doc " The Personal Access Token name. \n"]
  date_created : timestamp option;
      [@ocaml.doc " The date when the Personal Access Token ID was created. \n"]
  date_last_used : timestamp option;
      [@ocaml.doc " The date when the Personal Access Token ID was last used. \n"]
  expires_time : timestamp option;
      [@ocaml.doc " The time when the Personal Access Token ID will expire. \n"]
  scopes : personal_access_token_scope_list option;
      [@ocaml.doc " Lists all the Personal Access Token permissions for a mailbox. \n"]
}
[@@ocaml.doc ""]

type nonrec get_personal_access_token_metadata_request = {
  organization_id : organization_id; [@ocaml.doc " The Organization ID. \n"]
  personal_access_token_id : personal_access_token_id;
      [@ocaml.doc " The Personal Access Token ID.\n"]
}
[@@ocaml.doc ""]

type nonrec group = {
  id : work_mail_identifier option; [@ocaml.doc "The identifier of the group.\n"]
  email : email_address option; [@ocaml.doc "The email of the group.\n"]
  name : group_name option; [@ocaml.doc "The name of the group.\n"]
  state : entity_state option;
      [@ocaml.doc "The state of the group, which can be ENABLED, DISABLED, or DELETED.\n"]
  enabled_date : timestamp option;
      [@ocaml.doc "The date indicating when the group was enabled for WorkMail use.\n"]
  disabled_date : timestamp option;
      [@ocaml.doc "The date indicating when the group was disabled from WorkMail use.\n"]
}
[@@ocaml.doc "The representation of an WorkMail group.\n"]

type nonrec group_identifier = {
  group_id : work_mail_identifier option; [@ocaml.doc "Group ID that matched the group.\n"]
  group_name : group_name option; [@ocaml.doc "Group name that matched the group.\n"]
}
[@@ocaml.doc "The identifier that contains the Group ID and name of a group.\n"]

type nonrec group_identifiers = group_identifier list [@@ocaml.doc ""]

type nonrec groups = group list [@@ocaml.doc ""]

type nonrec identity_provider_user_id_for_update = string [@@ocaml.doc ""]

type nonrec identity_provider_user_id_prefix = string [@@ocaml.doc ""]

type nonrec impersonation_role = {
  impersonation_role_id : impersonation_role_id option;
      [@ocaml.doc "The identifier of the impersonation role.\n"]
  name : impersonation_role_name option; [@ocaml.doc "The impersonation role name.\n"]
  type_ : impersonation_role_type option; [@ocaml.doc "The impersonation role type.\n"]
  date_created : timestamp option;
      [@ocaml.doc "The date when the impersonation role was created.\n"]
  date_modified : timestamp option;
      [@ocaml.doc "The date when the impersonation role was last modified.\n"]
}
[@@ocaml.doc "An impersonation role for the given WorkMail organization.\n"]

type nonrec impersonation_role_list = impersonation_role list [@@ocaml.doc ""]

type nonrec invalid_configuration_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "The configuration for a resource isn't valid. A resource must either be able to auto-respond to \
   requests or have at least one delegate associated that can do so on its behalf.\n"]

type nonrec mailbox_export_job = {
  job_id : mailbox_export_job_id option; [@ocaml.doc "The identifier of the mailbox export job.\n"]
  entity_id : work_mail_identifier option;
      [@ocaml.doc "The identifier of the user or resource associated with the mailbox.\n"]
  description : description option; [@ocaml.doc "The mailbox export job description.\n"]
  s3_bucket_name : s3_bucket_name option; [@ocaml.doc "The name of the S3 bucket.\n"]
  s3_path : s3_object_key option;
      [@ocaml.doc "The path to the S3 bucket and file that the mailbox export job exports to.\n"]
  estimated_progress : percentage option;
      [@ocaml.doc "The estimated progress of the mailbox export job, in percentage points.\n"]
  state : mailbox_export_job_state option; [@ocaml.doc "The state of the mailbox export job.\n"]
  start_time : timestamp option; [@ocaml.doc "The mailbox export job start timestamp.\n"]
  end_time : timestamp option; [@ocaml.doc "The mailbox export job end timestamp.\n"]
}
[@@ocaml.doc
  "The details of a mailbox export job, including the user or resource ID associated with the \
   mailbox and the S3 bucket that the mailbox contents are exported to.\n"]

type nonrec jobs = mailbox_export_job list [@@ocaml.doc ""]

type nonrec list_access_control_rules_response = {
  rules : access_control_rules_list option; [@ocaml.doc "The access control rules.\n"]
}
[@@ocaml.doc ""]

type nonrec list_access_control_rules_request = {
  organization_id : organization_id; [@ocaml.doc "The identifier for the organization.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec list_aliases_response = {
  aliases : aliases option; [@ocaml.doc "The entity's paginated aliases.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value is \"null\" when there \
         are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_aliases_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the entity exists.\n"]
  entity_id : work_mail_identifier;
      [@ocaml.doc "The identifier for the entity for which to list the aliases.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_availability_configurations_response = {
  availability_configurations : availability_configuration_list option;
      [@ocaml.doc
        "The list of [AvailabilityConfiguration]'s that exist for the specified WorkMail \
         organization.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value is [null] when there are \
         no further results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_availability_configurations_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The WorkMail organization for which the [AvailabilityConfiguration]'s will be listed.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not require a \
         token.\n"]
}
[@@ocaml.doc ""]

type nonrec member = {
  id : string_ option; [@ocaml.doc "The identifier of the member.\n"]
  name : string_ option; [@ocaml.doc "The name of the member.\n"]
  type_ : member_type option; [@ocaml.doc "A member can be a user or group.\n"]
  state : entity_state option;
      [@ocaml.doc "The state of the member, which can be ENABLED, DISABLED, or DELETED.\n"]
  enabled_date : timestamp option;
      [@ocaml.doc "The date indicating when the member was enabled for WorkMail use.\n"]
  disabled_date : timestamp option;
      [@ocaml.doc "The date indicating when the member was disabled from WorkMail use.\n"]
}
[@@ocaml.doc "The representation of a user or group.\n"]

type nonrec members = member list [@@ocaml.doc ""]

type nonrec list_group_members_response = {
  members : members option; [@ocaml.doc "The members associated to the group.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
}
[@@ocaml.doc ""]

type nonrec list_group_members_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the group exists.\n"]
  group_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the group to which the members (users or groups) are associated.\n\n\
        \ The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Group ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: group\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Group name: group\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        " The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_groups_response = {
  groups : groups option; [@ocaml.doc "The overview of groups for an organization.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value is \"null\" when there \
         are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_groups_filters = {
  name_prefix : string_ option; [@ocaml.doc "Filters only groups with the provided name prefix.\n"]
  primary_email_prefix : string_ option;
      [@ocaml.doc "Filters only groups with the provided primary email prefix.\n"]
  state : entity_state option; [@ocaml.doc "Filters only groups with the provided state.\n"]
}
[@@ocaml.doc
  " Filtering options for {i ListGroups} operation. This is only used as input to Operation.\n"]

type nonrec list_groups_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the groups exist.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  filters : list_groups_filters option;
      [@ocaml.doc
        "Limit the search results based on the filter criteria. Only one filter per request is \
         supported.\n"]
}
[@@ocaml.doc ""]

type nonrec list_groups_for_entity_response = {
  groups : group_identifiers option; [@ocaml.doc "The overview of groups in an organization.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. This value is `null` when there \
         are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_groups_for_entity_filters = {
  group_name_prefix : string_ option;
      [@ocaml.doc "Filters only group names that start with the provided name prefix.\n"]
}
[@@ocaml.doc
  " Filtering options for {i ListGroupsForEntity} operation. This is only used as input to \
   Operation.\n"]

type nonrec list_groups_for_entity_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the entity exists.\n"]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the entity.\n\n\
        \ The entity ID can accept {i UserId or GroupID}, {i Username or Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity name: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filters : list_groups_for_entity_filters option;
      [@ocaml.doc "Limit the search results based on the filter criteria.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec list_impersonation_roles_response = {
  roles : impersonation_role_list option;
      [@ocaml.doc "The list of impersonation roles under the given WorkMail organization.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to retrieve the next page of results. The value is [null] when there are no \
         results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_impersonation_roles_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization to which the listed impersonation roles belong.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token used to retrieve the next page of results. The first call doesn't require a \
         token.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results returned in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec mail_domain_summary = {
  domain_name : domain_name option; [@ocaml.doc "The domain name.\n"]
  default_domain : boolean_ option; [@ocaml.doc "Whether the domain is default or not.\n"]
}
[@@ocaml.doc "The data for a given domain.\n"]

type nonrec mail_domains = mail_domain_summary list [@@ocaml.doc ""]

type nonrec list_mail_domains_response = {
  mail_domains : mail_domains option;
      [@ocaml.doc
        "The list of mail domain summaries, specifying domains that exist in the specified \
         WorkMail organization, along with the information about whether the domain is or isn't \
         the default.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value becomes [null] when \
         there are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_mail_domains_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization for which to list domains.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not require a \
         token.\n"]
}
[@@ocaml.doc ""]

type nonrec list_mailbox_export_jobs_response = {
  jobs : jobs option; [@ocaml.doc "The mailbox export job details.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token to use to retrieve the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_mailbox_export_jobs_request = {
  organization_id : organization_id; [@ocaml.doc "The organization ID.\n"]
  next_token : next_token option;
      [@ocaml.doc "The token to use to retrieve the next page of results.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec permission_type =
  | FULL_ACCESS [@ocaml.doc ""]
  | SEND_AS [@ocaml.doc ""]
  | SEND_ON_BEHALF [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec permission_values = permission_type list [@@ocaml.doc ""]

type nonrec permission = {
  grantee_id : work_mail_identifier;
      [@ocaml.doc
        "The identifier of the user, group, or resource to which the permissions are granted.\n"]
  grantee_type : member_type;
      [@ocaml.doc "The type of user, group, or resource referred to in GranteeId.\n"]
  permission_values : permission_values;
      [@ocaml.doc
        "The permissions granted to the grantee. SEND_AS allows the grantee to send email as the \
         owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF \
         allows the grantee to send email on behalf of the owner of the mailbox (the grantee is \
         not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee \
         full access to the mailbox, irrespective of other folder-level permissions set on the \
         mailbox.\n"]
}
[@@ocaml.doc
  "Permission granted to a user, group, or resource to access a certain aspect of another user, \
   group, or resource mailbox.\n"]

type nonrec permissions = permission list [@@ocaml.doc ""]

type nonrec list_mailbox_permissions_response = {
  permissions : permissions option;
      [@ocaml.doc "One page of the user, group, or resource mailbox permissions.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value is \"null\" when there \
         are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_mailbox_permissions_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier of the organization under which the user, group, or resource exists.\n"]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the user, or resource for which to list mailbox permissions.\n\n\
        \ The entity ID can accept {i UserId or ResourceId}, {i Username or Resourcename}, or {i \
         email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity ID: 12345678-1234-1234-1234-123456789012, or \
         r-0123456789a0123456789b0123456789\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity name: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec mobile_device_access_override = {
  user_id : work_mail_identifier option;
      [@ocaml.doc "The WorkMail user to which the access override applies.\n"]
  device_id : device_id option; [@ocaml.doc "The device to which the override applies.\n"]
  effect_ : mobile_device_access_rule_effect option;
      [@ocaml.doc "The effect of the override, [ALLOW] or [DENY].\n"]
  description : mobile_device_access_rule_description option;
      [@ocaml.doc "A description of the override.\n"]
  date_created : timestamp option; [@ocaml.doc "The date the override was first created.\n"]
  date_modified : timestamp option; [@ocaml.doc "The date the override was last modified.\n"]
}
[@@ocaml.doc "The override object.\n"]

type nonrec mobile_device_access_overrides_list = mobile_device_access_override list
[@@ocaml.doc ""]

type nonrec list_mobile_device_access_overrides_response = {
  overrides : mobile_device_access_overrides_list option;
      [@ocaml.doc
        "The list of mobile device access overrides that exist for the specified WorkMail \
         organization and user.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value is \
         \226\128\156null\226\128\157 when there are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_mobile_device_access_overrides_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization under which to list mobile device access overrides.\n"]
  user_id : entity_identifier option;
      [@ocaml.doc
        "The WorkMail user under which you list the mobile device access overrides. Accepts the \
         following types of user identities:\n\n\
        \ {ul\n\
        \       {-  User ID: [12345678-1234-1234-1234-123456789012] or \
         [S-1-1-12-1234567890-123456789-123456789-1234] \n\
        \           \n\
        \            }\n\
        \       {-  Email address: [user@domain.tld] \n\
        \           \n\
        \            }\n\
        \       {-  User name: [user] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  device_id : device_id option;
      [@ocaml.doc "The mobile device to which the access override applies.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not require a \
         token.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec mobile_device_access_rule = {
  mobile_device_access_rule_id : mobile_device_access_rule_id option;
      [@ocaml.doc "The ID assigned to a mobile access rule.\n"]
  name : mobile_device_access_rule_name option; [@ocaml.doc "The name of a mobile access rule.\n"]
  description : mobile_device_access_rule_description option;
      [@ocaml.doc "The description of a mobile access rule.\n"]
  effect_ : mobile_device_access_rule_effect option;
      [@ocaml.doc "The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].\n"]
  device_types : device_type_list option; [@ocaml.doc "Device types that a rule will match.\n"]
  not_device_types : device_type_list option;
      [@ocaml.doc
        "Device types that a rule {b will not} match. All other device types will match.\n"]
  device_models : device_model_list option; [@ocaml.doc "Device models that a rule will match.\n"]
  not_device_models : device_model_list option;
      [@ocaml.doc
        "Device models that a rule {b will not} match. All other device models will match.\n"]
  device_operating_systems : device_operating_system_list option;
      [@ocaml.doc "Device operating systems that a rule will match.\n"]
  not_device_operating_systems : device_operating_system_list option;
      [@ocaml.doc
        "Device operating systems that a rule {b will not} match. All other device types will match.\n"]
  device_user_agents : device_user_agent_list option;
      [@ocaml.doc "Device user agents that a rule will match.\n"]
  not_device_user_agents : device_user_agent_list option;
      [@ocaml.doc
        "Device user agents that a rule {b will not} match. All other device user agents will match.\n"]
  date_created : timestamp option;
      [@ocaml.doc "The date and time at which an access rule was created.\n"]
  date_modified : timestamp option;
      [@ocaml.doc "The date and time at which an access rule was modified.\n"]
}
[@@ocaml.doc "A rule that controls access to mobile devices for an WorkMail group.\n"]

type nonrec mobile_device_access_rules_list = mobile_device_access_rule list [@@ocaml.doc ""]

type nonrec list_mobile_device_access_rules_response = {
  rules : mobile_device_access_rules_list option;
      [@ocaml.doc
        "The list of mobile device access rules that exist under the specified WorkMail \
         organization.\n"]
}
[@@ocaml.doc ""]

type nonrec list_mobile_device_access_rules_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization for which to list the rules.\n"]
}
[@@ocaml.doc ""]

type nonrec organization_summary = {
  organization_id : organization_id option;
      [@ocaml.doc "The identifier associated with the organization.\n"]
  alias : organization_name option; [@ocaml.doc "The alias associated with the organization.\n"]
  default_mail_domain : domain_name option;
      [@ocaml.doc "The default email domain associated with the organization.\n"]
  error_message : string_ option;
      [@ocaml.doc
        "The error message associated with the organization. It is only present if unexpected \
         behavior has occurred with regards to the organization. It provides insight or solutions \
         regarding unexpected behavior.\n"]
  state : string_ option; [@ocaml.doc "The state associated with the organization.\n"]
}
[@@ocaml.doc "The representation of an organization.\n"]

type nonrec organization_summaries = organization_summary list [@@ocaml.doc ""]

type nonrec list_organizations_response = {
  organization_summaries : organization_summaries option;
      [@ocaml.doc
        "The overview of owned organizations presented as a list of organization summaries.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The value is \"null\" when there \
         are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_organizations_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
}
[@@ocaml.doc ""]

type nonrec personal_access_token_summary = {
  personal_access_token_id : personal_access_token_id option;
      [@ocaml.doc " The ID of the Personal Access Token. \n"]
  user_id : work_mail_identifier option;
      [@ocaml.doc " The user ID of the WorkMail user associated with the Personal Access Token. \n"]
  name : personal_access_token_name option;
      [@ocaml.doc " The name of the Personal Access Token. \n"]
  date_created : timestamp option;
      [@ocaml.doc " The date when the Personal Access Token was created. \n"]
  date_last_used : timestamp option;
      [@ocaml.doc " The date when the Personal Access Token was last used. \n"]
  expires_time : timestamp option;
      [@ocaml.doc " The date when the Personal Access Token will expire. \n"]
  scopes : personal_access_token_scope_list option;
      [@ocaml.doc " Lists all the Personal Access Token permissions for a mailbox. \n"]
}
[@@ocaml.doc " The summary of the Personal Access Token. \n"]

type nonrec personal_access_token_summary_list = personal_access_token_summary list [@@ocaml.doc ""]

type nonrec list_personal_access_tokens_response = {
  next_token : next_token option;
      [@ocaml.doc " The token from the previous response to query the next page.\n"]
  personal_access_token_summaries : personal_access_token_summary_list option;
      [@ocaml.doc
        " Lists all the personal tokens in an organization or user, if user ID is provided. \n"]
}
[@@ocaml.doc ""]

type nonrec list_personal_access_tokens_request = {
  organization_id : organization_id; [@ocaml.doc " The Organization ID. \n"]
  user_id : entity_identifier option; [@ocaml.doc " The WorkMail User ID. \n"]
  next_token : next_token option;
      [@ocaml.doc " The token from the previous response to query the next page.\n"]
  max_results : max_results option;
      [@ocaml.doc " The maximum amount of items that should be returned in a response. \n"]
}
[@@ocaml.doc ""]

type nonrec resource_delegates = delegate list [@@ocaml.doc ""]

type nonrec list_resource_delegates_response = {
  delegates : resource_delegates option; [@ocaml.doc "One page of the resource's delegates.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token used to paginate through the delegates associated with a resource. While \
         results are still available, it has an associated value. When the last page is reached, \
         the token is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resource_delegates_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier for the organization that contains the resource for which delegates are \
         listed.\n"]
  resource_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the resource whose delegates are listed.\n\n\
        \ The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Resource ID: r-0123456789a0123456789b0123456789\n\
        \            \n\
        \             }\n\
        \        {-  Email address: resource\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Resource name: resource\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc "The token used to paginate through the delegates associated with a resource.\n"]
  max_results : max_results option; [@ocaml.doc "The number of maximum results in a page.\n"]
}
[@@ocaml.doc ""]

type nonrec resource = {
  id : work_mail_identifier option; [@ocaml.doc "The identifier of the resource.\n"]
  email : email_address option; [@ocaml.doc "The email of the resource.\n"]
  name : resource_name option; [@ocaml.doc "The name of the resource.\n"]
  type_ : resource_type option; [@ocaml.doc "The type of the resource: equipment or room.\n"]
  state : entity_state option;
      [@ocaml.doc "The state of the resource, which can be ENABLED, DISABLED, or DELETED.\n"]
  enabled_date : timestamp option;
      [@ocaml.doc "The date indicating when the resource was enabled for WorkMail use.\n"]
  disabled_date : timestamp option;
      [@ocaml.doc "The date indicating when the resource was disabled from WorkMail use.\n"]
  description : resource_description option; [@ocaml.doc "Resource description.\n"]
}
[@@ocaml.doc "The representation of a resource.\n"]

type nonrec resources = resource list [@@ocaml.doc ""]

type nonrec list_resources_response = {
  resources : resources option;
      [@ocaml.doc "One page of the organization's resource representation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token used to paginate through all the organization's resources. While results are \
         still available, it has an associated value. When the last page is reached, the token is \
         empty.\n"]
}
[@@ocaml.doc ""]

type nonrec list_resources_filters = {
  name_prefix : string_ option;
      [@ocaml.doc "Filters only resource that start with the entered name prefix .\n"]
  primary_email_prefix : string_ option;
      [@ocaml.doc "Filters only resource with the provided primary email prefix.\n"]
  state : entity_state option; [@ocaml.doc "Filters only resource with the provided state.\n"]
}
[@@ocaml.doc
  "Filtering options for {i ListResources} operation. This is only used as input to Operation.\n"]

type nonrec list_resources_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the resources exist.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  filters : list_resources_filters option;
      [@ocaml.doc
        "Limit the resource search results based on the filter criteria. You can only use one \
         filter per request.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
  value : tag_value; [@ocaml.doc "The value of the tag.\n"]
}
[@@ocaml.doc "Describes a tag applied to a resource.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "A list of tag key-value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The resource ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec user = {
  id : work_mail_identifier option; [@ocaml.doc "The identifier of the user.\n"]
  email : email_address option; [@ocaml.doc "The email of the user.\n"]
  name : user_name option; [@ocaml.doc "The name of the user.\n"]
  display_name : string_ option; [@ocaml.doc "The display name of the user.\n"]
  state : entity_state option;
      [@ocaml.doc "The state of the user, which can be ENABLED, DISABLED, or DELETED.\n"]
  user_role : user_role option; [@ocaml.doc "The role of the user.\n"]
  enabled_date : timestamp option;
      [@ocaml.doc "The date indicating when the user was enabled for WorkMail use.\n"]
  disabled_date : timestamp option;
      [@ocaml.doc "The date indicating when the user was disabled from WorkMail use.\n"]
  identity_provider_user_id : identity_provider_user_id option;
      [@ocaml.doc
        "User ID from the IAM Identity Center. If this parameter is empty it will be updated \
         automatically when the user logs in for the first time to the mailbox associated with \
         WorkMail.\n"]
  identity_provider_identity_store_id : identity_provider_identity_store_id option;
      [@ocaml.doc
        "Identity store ID from the IAM Identity Center. If this parameter is empty it will be \
         updated automatically when the user logs in for the first time to the mailbox associated \
         with WorkMail.\n"]
}
[@@ocaml.doc "The representation of an WorkMail user.\n"]

type nonrec users = user list [@@ocaml.doc ""]

type nonrec list_users_response = {
  users : users option; [@ocaml.doc "The overview of users for an organization.\n"]
  next_token : next_token option;
      [@ocaml.doc
        " The token to use to retrieve the next page of results. This value is `null` when there \
         are no more results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec list_users_filters = {
  username_prefix : string_ option;
      [@ocaml.doc "Filters only users with the provided username prefix.\n"]
  display_name_prefix : user_attribute option;
      [@ocaml.doc "Filters only users with the provided display name prefix.\n"]
  primary_email_prefix : string_ option;
      [@ocaml.doc "Filters only users with the provided email prefix.\n"]
  state : entity_state option; [@ocaml.doc "Filters only users with the provided state.\n"]
  identity_provider_user_id_prefix : identity_provider_user_id_prefix option;
      [@ocaml.doc "Filters only users with the ID from the IAM Identity Center.\n"]
}
[@@ocaml.doc
  " Filtering options for {i ListUsers} operation. This is only used as input to Operation.\n"]

type nonrec list_users_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the users exist.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token to use to retrieve the next page of results. The first call does not contain \
         any tokens.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in a single call.\n"]
  filters : list_users_filters option;
      [@ocaml.doc
        "Limit the user search results based on the filter criteria. You can only use one filter \
         per request.\n"]
}
[@@ocaml.doc ""]

type nonrec new_resource_description = string [@@ocaml.doc ""]

type nonrec policy_description = string [@@ocaml.doc ""]

type nonrec put_access_control_rule_response = unit [@@ocaml.doc ""]

type nonrec put_access_control_rule_request = {
  name : access_control_rule_name; [@ocaml.doc "The rule name.\n"]
  effect_ : access_control_rule_effect; [@ocaml.doc "The rule effect.\n"]
  description : access_control_rule_description; [@ocaml.doc "The rule description.\n"]
  ip_ranges : ip_range_list option; [@ocaml.doc "IPv4 CIDR ranges to include in the rule.\n"]
  not_ip_ranges : ip_range_list option; [@ocaml.doc "IPv4 CIDR ranges to exclude from the rule.\n"]
  actions : actions_list option;
      [@ocaml.doc
        "Access protocol actions to include in the rule. Valid values include [ActiveSync], \
         [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"]
  not_actions : actions_list option;
      [@ocaml.doc
        "Access protocol actions to exclude from the rule. Valid values include [ActiveSync], \
         [AutoDiscover], [EWS], [IMAP], [SMTP], [WindowsOutlook], and [WebMail].\n"]
  user_ids : user_id_list option; [@ocaml.doc "User IDs to include in the rule.\n"]
  not_user_ids : user_id_list option; [@ocaml.doc "User IDs to exclude from the rule.\n"]
  organization_id : organization_id; [@ocaml.doc "The identifier of the organization.\n"]
  impersonation_role_ids : impersonation_role_id_list option;
      [@ocaml.doc "Impersonation role IDs to include in the rule.\n"]
  not_impersonation_role_ids : impersonation_role_id_list option;
      [@ocaml.doc "Impersonation role IDs to exclude from the rule.\n"]
}
[@@ocaml.doc ""]

type nonrec put_email_monitoring_configuration_response = unit [@@ocaml.doc ""]

type nonrec put_email_monitoring_configuration_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The ID of the organization for which the email monitoring configuration is set.\n"]
  role_arn : role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM Role associated with the email monitoring \
         configuration. If absent, the IAM Role Arn of AWSServiceRoleForAmazonWorkMailEvents will \
         be used.\n"]
  log_group_arn : log_group_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the CloudWatch Log group associated with the email \
         monitoring configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec put_identity_provider_configuration_response = unit [@@ocaml.doc ""]

type nonrec put_identity_provider_configuration_request = {
  organization_id : organization_id; [@ocaml.doc " The ID of the WorkMail Organization. \n"]
  authentication_mode : identity_provider_authentication_mode;
      [@ocaml.doc " The authentication mode used in WorkMail.\n"]
  identity_center_configuration : identity_center_configuration;
      [@ocaml.doc " The details of the IAM Identity Center configuration.\n"]
  personal_access_token_configuration : personal_access_token_configuration;
      [@ocaml.doc " The details of the Personal Access Token configuration. \n"]
}
[@@ocaml.doc ""]

type nonrec put_inbound_dmarc_settings_response = unit [@@ocaml.doc ""]

type nonrec put_inbound_dmarc_settings_request = {
  organization_id : organization_id;
      [@ocaml.doc "The ID of the organization that you are applying the DMARC policy to.\n"]
  enforced : boolean_object; [@ocaml.doc "Enforces or suspends a policy after it's applied.\n"]
}
[@@ocaml.doc ""]

type nonrec put_mailbox_permissions_response = unit [@@ocaml.doc ""]

type nonrec put_mailbox_permissions_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier of the organization under which the user, group, or resource exists.\n"]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the user or resource for which to update mailbox permissions.\n\n\
        \ The identifier can be {i UserId, ResourceID, or Group Id}, {i Username, Resourcename, or \
         Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity ID: 12345678-1234-1234-1234-123456789012, \
         r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity name: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  grantee_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the user, group, or resource to which to grant the permissions.\n\n\
        \ The identifier can be {i UserId, ResourceID, or Group Id}, {i Username, Resourcename, or \
         Groupname}, or {i email}.\n\
        \ \n\
        \  {ul\n\
        \        {-  Grantee ID: 12345678-1234-1234-1234-123456789012, \
         r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: grantee\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Grantee name: grantee\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  permission_values : permission_values;
      [@ocaml.doc
        "The permissions granted to the grantee. SEND_AS allows the grantee to send email as the \
         owner of the mailbox (the grantee is not mentioned on these emails). SEND_ON_BEHALF \
         allows the grantee to send email on behalf of the owner of the mailbox (the grantee is \
         not mentioned as the physical sender of these emails). FULL_ACCESS allows the grantee \
         full access to the mailbox, irrespective of other folder-level permissions set on the \
         mailbox.\n"]
}
[@@ocaml.doc ""]

type nonrec put_mobile_device_access_override_response = unit [@@ocaml.doc ""]

type nonrec put_mobile_device_access_override_request = {
  organization_id : organization_id;
      [@ocaml.doc "Identifies the WorkMail organization for which you create the override.\n"]
  user_id : entity_identifier;
      [@ocaml.doc
        "The WorkMail user for which you create the override. Accepts the following types of user \
         identities:\n\n\
        \ {ul\n\
        \       {-  User ID: [12345678-1234-1234-1234-123456789012] or \
         [S-1-1-12-1234567890-123456789-123456789-1234] \n\
        \           \n\
        \            }\n\
        \       {-  Email address: [user@domain.tld] \n\
        \           \n\
        \            }\n\
        \       {-  User name: [user] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  device_id : device_id;
      [@ocaml.doc
        "The mobile device for which you create the override. [DeviceId] is case insensitive.\n"]
  effect_ : mobile_device_access_rule_effect;
      [@ocaml.doc "The effect of the override, [ALLOW] or [DENY].\n"]
  description : mobile_device_access_rule_description option;
      [@ocaml.doc "A description of the override.\n"]
}
[@@ocaml.doc ""]

type nonrec put_retention_policy_response = unit [@@ocaml.doc ""]

type nonrec put_retention_policy_request = {
  organization_id : organization_id; [@ocaml.doc "The organization ID.\n"]
  id : short_string option; [@ocaml.doc "The retention policy ID.\n"]
  name : short_string; [@ocaml.doc "The retention policy name.\n"]
  description : policy_description option; [@ocaml.doc "The retention policy description.\n"]
  folder_configurations : folder_configurations;
      [@ocaml.doc "The retention policy folder configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec register_mail_domain_response = unit [@@ocaml.doc ""]

type nonrec register_mail_domain_request = {
  client_token : idempotency_client_token option;
      [@ocaml.doc "Idempotency token used when retrying requests.\n"]
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization under which you're creating the domain.\n"]
  domain_name : work_mail_domain_name;
      [@ocaml.doc "The name of the mail domain to create in WorkMail and SES.\n"]
}
[@@ocaml.doc ""]

type nonrec register_to_work_mail_response = unit [@@ocaml.doc ""]

type nonrec register_to_work_mail_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier for the organization under which the user, group, or resource exists.\n"]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the user, group, or resource to be updated.\n\n\
        \ The identifier can accept {i UserId, ResourceId, or GroupId}, or {i Username, \
         Resourcename, or Groupname}. The following identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity ID: 12345678-1234-1234-1234-123456789012, \
         r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Entity name: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  email : email_address; [@ocaml.doc "The email for the user, group, or resource to be updated.\n"]
}
[@@ocaml.doc ""]

type nonrec reset_password_response = unit [@@ocaml.doc ""]

type nonrec reset_password_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier of the organization that contains the user for which the password is reset.\n"]
  user_id : work_mail_identifier;
      [@ocaml.doc "The identifier of the user for whom the password is reset.\n"]
  password : password; [@ocaml.doc "The new password for the user.\n"]
}
[@@ocaml.doc ""]

type nonrec start_mailbox_export_job_response = {
  job_id : mailbox_export_job_id option; [@ocaml.doc "The job ID.\n"]
}
[@@ocaml.doc ""]

type nonrec start_mailbox_export_job_request = {
  client_token : idempotency_client_token;
      [@ocaml.doc "The idempotency token for the client request.\n"]
  organization_id : organization_id;
      [@ocaml.doc "The identifier associated with the organization.\n"]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the user or resource associated with the mailbox.\n\n\
        \ The identifier can accept {i UserId or ResourceId}, {i Username or Resourcename}, or {i \
         email}. The following identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity ID: 12345678-1234-1234-1234-123456789012, \
         r-0123456789a0123456789b0123456789 , or S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity name: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  description : description option; [@ocaml.doc "The mailbox export job description.\n"]
  role_arn : role_arn;
      [@ocaml.doc
        "The ARN of the AWS Identity and Access Management (IAM) role that grants write permission \
         to the S3 bucket.\n"]
  kms_key_arn : kms_key_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the symmetric AWS Key Management Service (AWS KMS) key \
         that encrypts the exported mailbox content.\n"]
  s3_bucket_name : s3_bucket_name; [@ocaml.doc "The name of the S3 bucket.\n"]
  s3_prefix : s3_object_key; [@ocaml.doc "The S3 bucket prefix.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc "The resource can have up to 50 user-applied tags.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The resource ARN.\n"]
  tags : tag_list; [@ocaml.doc "The tag key-value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec test_availability_configuration_response = {
  test_passed : boolean_ option;
      [@ocaml.doc "Boolean indicating whether the test passed or failed.\n"]
  failure_reason : string_ option;
      [@ocaml.doc "String containing the reason for a failed test if [TestPassed] is false.\n"]
}
[@@ocaml.doc ""]

type nonrec test_availability_configuration_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization where the availability provider will be tested.\n"]
  domain_name : domain_name option;
      [@ocaml.doc
        "The domain to which the provider applies. If this field is provided, a stored \
         availability provider associated to this domain name will be tested.\n"]
  ews_provider : ews_availability_provider option; [@ocaml.doc ""]
  lambda_provider : lambda_availability_provider option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : amazon_resource_name; [@ocaml.doc "The resource ARN.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The tag keys.\n"]
}
[@@ocaml.doc ""]

type nonrec update_availability_configuration_response = unit [@@ocaml.doc ""]

type nonrec update_availability_configuration_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The WorkMail organization for which the [AvailabilityConfiguration] will be updated.\n"]
  domain_name : domain_name;
      [@ocaml.doc "The domain to which the provider applies the availability configuration.\n"]
  ews_provider : ews_availability_provider option;
      [@ocaml.doc
        "The EWS availability provider definition. The request must contain exactly one provider \
         definition, either [EwsProvider] or [LambdaProvider]. The previously stored provider will \
         be overridden by the one provided.\n"]
  lambda_provider : lambda_availability_provider option;
      [@ocaml.doc
        "The Lambda availability provider definition. The request must contain exactly one \
         provider definition, either [EwsProvider] or [LambdaProvider]. The previously stored \
         provider will be overridden by the one provided.\n"]
}
[@@ocaml.doc ""]

type nonrec update_default_mail_domain_response = unit [@@ocaml.doc ""]

type nonrec update_default_mail_domain_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization for which to list domains.\n"]
  domain_name : work_mail_domain_name;
      [@ocaml.doc "The domain name that will become the default domain.\n"]
}
[@@ocaml.doc ""]

type nonrec update_group_response = unit [@@ocaml.doc ""]

type nonrec update_group_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the group exists.\n"]
  group_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the group to be updated.\n\n\
        \ The identifier can accept {i GroupId}, {i Groupname}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Group ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: group\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Group name: group\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  hidden_from_global_address_list : boolean_object option;
      [@ocaml.doc "If enabled, the group is hidden from the global address list.\n"]
}
[@@ocaml.doc ""]

type nonrec update_impersonation_role_response = unit [@@ocaml.doc ""]

type nonrec update_impersonation_role_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization that contains the impersonation role to update.\n"]
  impersonation_role_id : impersonation_role_id;
      [@ocaml.doc "The ID of the impersonation role to update.\n"]
  name : impersonation_role_name; [@ocaml.doc "The updated impersonation role name.\n"]
  type_ : impersonation_role_type; [@ocaml.doc "The updated impersonation role type.\n"]
  description : impersonation_role_description option;
      [@ocaml.doc "The updated impersonation role description.\n"]
  rules : impersonation_rule_list; [@ocaml.doc "The updated list of rules.\n"]
}
[@@ocaml.doc ""]

type nonrec update_mailbox_quota_response = unit [@@ocaml.doc ""]

type nonrec update_mailbox_quota_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier for the organization that contains the user for whom to update the mailbox \
         quota.\n"]
  user_id : entity_identifier;
      [@ocaml.doc
        "The identifer for the user for whom to update the mailbox quota.\n\n\
        \ The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity \
         formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  User ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: user\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  User name: user\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  mailbox_quota : mailbox_quota;
      [@ocaml.doc "The updated mailbox quota, in MB, for the specified user.\n"]
}
[@@ocaml.doc ""]

type nonrec update_mobile_device_access_rule_response = unit [@@ocaml.doc ""]

type nonrec update_mobile_device_access_rule_request = {
  organization_id : organization_id;
      [@ocaml.doc "The WorkMail organization under which the rule will be updated.\n"]
  mobile_device_access_rule_id : mobile_device_access_rule_id;
      [@ocaml.doc "The identifier of the rule to be updated.\n"]
  name : mobile_device_access_rule_name; [@ocaml.doc "The updated rule name.\n"]
  description : mobile_device_access_rule_description option;
      [@ocaml.doc "The updated rule description.\n"]
  effect_ : mobile_device_access_rule_effect;
      [@ocaml.doc "The effect of the rule when it matches. Allowed values are [ALLOW] or [DENY].\n"]
  device_types : device_type_list option;
      [@ocaml.doc "Device types that the updated rule will match.\n"]
  not_device_types : device_type_list option;
      [@ocaml.doc
        "Device types that the updated rule {b will not} match. All other device types will match.\n"]
  device_models : device_model_list option;
      [@ocaml.doc "Device models that the updated rule will match.\n"]
  not_device_models : device_model_list option;
      [@ocaml.doc
        "Device models that the updated rule {b will not} match. All other device models will match.\n"]
  device_operating_systems : device_operating_system_list option;
      [@ocaml.doc "Device operating systems that the updated rule will match.\n"]
  not_device_operating_systems : device_operating_system_list option;
      [@ocaml.doc
        "Device operating systems that the updated rule {b will not} match. All other device \
         operating systems will match.\n"]
  device_user_agents : device_user_agent_list option;
      [@ocaml.doc "User agents that the updated rule will match.\n"]
  not_device_user_agents : device_user_agent_list option;
      [@ocaml.doc
        "User agents that the updated rule {b will not} match. All other user agents will match.\n"]
}
[@@ocaml.doc ""]

type nonrec update_primary_email_address_response = unit [@@ocaml.doc ""]

type nonrec update_primary_email_address_request = {
  organization_id : organization_id;
      [@ocaml.doc "The organization that contains the user, group, or resource to update.\n"]
  entity_id : entity_identifier;
      [@ocaml.doc
        "The user, group, or resource to update.\n\n\
        \ The identifier can accept {i UseriD, ResourceId, or GroupId}, {i Username, Resourcename, \
         or Groupname}, or {i email}. The following identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Entity ID: 12345678-1234-1234-1234-123456789012, \
         r-0123456789a0123456789b0123456789, or S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: entity\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Entity name: entity\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  email : email_address; [@ocaml.doc "The value of the email to be updated as primary.\n"]
}
[@@ocaml.doc ""]

type nonrec update_resource_response = unit [@@ocaml.doc ""]

type nonrec update_resource_request = {
  organization_id : organization_id;
      [@ocaml.doc
        "The identifier associated with the organization for which the resource is updated.\n"]
  resource_id : entity_identifier;
      [@ocaml.doc
        "The identifier of the resource to be updated.\n\n\
        \ The identifier can accept {i ResourceId}, {i Resourcename}, or {i email}. The following \
         identity formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  Resource ID: r-0123456789a0123456789b0123456789\n\
        \            \n\
        \             }\n\
        \        {-  Email address: resource\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  Resource name: resource\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : resource_name option; [@ocaml.doc "The name of the resource to be updated.\n"]
  booking_options : booking_options option;
      [@ocaml.doc "The resource's booking options to be updated.\n"]
  description : new_resource_description option; [@ocaml.doc "Updates the resource description.\n"]
  type_ : resource_type option; [@ocaml.doc "Updates the resource type.\n"]
  hidden_from_global_address_list : boolean_object option;
      [@ocaml.doc "If enabled, the resource is hidden from the global address list.\n"]
}
[@@ocaml.doc ""]

type nonrec update_user_response = unit [@@ocaml.doc ""]

type nonrec update_user_request = {
  organization_id : organization_id;
      [@ocaml.doc "The identifier for the organization under which the user exists.\n"]
  user_id : entity_identifier;
      [@ocaml.doc
        "The identifier for the user to be updated.\n\n\
        \ The identifier can be the {i UserId}, {i Username}, or {i email}. The following identity \
         formats are available:\n\
        \ \n\
        \  {ul\n\
        \        {-  User ID: 12345678-1234-1234-1234-123456789012 or \
         S-1-1-12-1234567890-123456789-123456789-1234\n\
        \            \n\
        \             }\n\
        \        {-  Email address: user\\@domain.tld\n\
        \            \n\
        \             }\n\
        \        {-  User name: user\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  role : user_role option;
      [@ocaml.doc "Updates the user role.\n\n You cannot pass {i SYSTEM_USER} or {i RESOURCE}.\n "]
  display_name : user_attribute option; [@ocaml.doc "Updates the display name of the user.\n"]
  first_name : user_attribute option; [@ocaml.doc "Updates the user's first name.\n"]
  last_name : user_attribute option; [@ocaml.doc "Updates the user's last name.\n"]
  hidden_from_global_address_list : boolean_object option;
      [@ocaml.doc "If enabled, the user is hidden from the global address list.\n"]
  initials : user_attribute option; [@ocaml.doc "Updates the user's initials.\n"]
  telephone : user_attribute option; [@ocaml.doc "Updates the user's contact details.\n"]
  street : user_attribute option; [@ocaml.doc "Updates the user's street address.\n"]
  job_title : user_attribute option; [@ocaml.doc "Updates the user's job title.\n"]
  city : user_attribute option; [@ocaml.doc "Updates the user's city.\n"]
  company : user_attribute option; [@ocaml.doc "Updates the user's company.\n"]
  zip_code : user_attribute option; [@ocaml.doc "Updates the user's zip code.\n"]
  department : user_attribute option; [@ocaml.doc "Updates the user's department.\n"]
  country : user_attribute option; [@ocaml.doc "Updates the user's country.\n"]
  office : user_attribute option; [@ocaml.doc "Updates the user's office.\n"]
  identity_provider_user_id : identity_provider_user_id_for_update option;
      [@ocaml.doc
        "User ID from the IAM Identity Center. If this parameter is empty it will be updated \
         automatically when the user logs in for the first time to the mailbox associated with \
         WorkMail.\n"]
}
[@@ocaml.doc ""]
