type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec aws_organizations_not_in_use_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Your account isn't a member of an organization. To make this request, you must use the \
   credentials of an account that belongs to an organization.\n"]

type nonrec unsupported_api_endpoint_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "This action isn't available in the current Amazon Web Services Region.\n"]

type nonrec exception_type = string [@@ocaml.doc ""]

type nonrec too_many_requests_exception = {
  type_ : exception_type option; [@ocaml.doc ""]
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You have sent too many requests in too short a period of time. The quota helps protect against \
   denial-of-service attacks. Try again later.\n\n\
  \ For information about quotas that affect Organizations, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html}Quotas \
   for Organizations} in the {i Organizations User Guide}.\n\
  \ "]

type nonrec service_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Organizations can't complete your request because of an internal service error. Try again later.\n"]

type nonrec responsibility_transfer_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "We can't find a transfer that you specified.\n"]

type nonrec invalid_input_exception_reason =
  | INVALID_PARTY_TYPE_TARGET [@ocaml.doc ""]
  | INVALID_SYNTAX_ORGANIZATION [@ocaml.doc ""]
  | INVALID_SYNTAX_POLICY [@ocaml.doc ""]
  | INVALID_ENUM [@ocaml.doc ""]
  | INVALID_ENUM_POLICY_TYPE [@ocaml.doc ""]
  | INVALID_LIST_MEMBER [@ocaml.doc ""]
  | MAX_LENGTH_EXCEEDED [@ocaml.doc ""]
  | MAX_VALUE_EXCEEDED [@ocaml.doc ""]
  | MIN_LENGTH_EXCEEDED [@ocaml.doc ""]
  | MIN_VALUE_EXCEEDED [@ocaml.doc ""]
  | IMMUTABLE_POLICY [@ocaml.doc ""]
  | INVALID_PATTERN [@ocaml.doc ""]
  | INVALID_PATTERN_TARGET_ID [@ocaml.doc ""]
  | INPUT_REQUIRED [@ocaml.doc ""]
  | INVALID_PAGINATION_TOKEN [@ocaml.doc ""]
  | MAX_FILTER_LIMIT_EXCEEDED [@ocaml.doc ""]
  | MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS [@ocaml.doc ""]
  | INVALID_FULL_NAME_TARGET [@ocaml.doc ""]
  | UNRECOGNIZED_SERVICE_PRINCIPAL [@ocaml.doc ""]
  | INVALID_ROLE_NAME [@ocaml.doc ""]
  | INVALID_SYSTEM_TAGS_PARAMETER [@ocaml.doc ""]
  | DUPLICATE_TAG_KEY [@ocaml.doc ""]
  | TARGET_NOT_SUPPORTED [@ocaml.doc ""]
  | INVALID_EMAIL_ADDRESS_TARGET [@ocaml.doc ""]
  | INVALID_RESOURCE_POLICY_JSON [@ocaml.doc ""]
  | INVALID_PRINCIPAL [@ocaml.doc ""]
  | UNSUPPORTED_ACTION_IN_RESOURCE_POLICY [@ocaml.doc ""]
  | UNSUPPORTED_POLICY_TYPE_IN_RESOURCE_POLICY [@ocaml.doc ""]
  | UNSUPPORTED_RESOURCE_IN_RESOURCE_POLICY [@ocaml.doc ""]
  | NON_DETACHABLE_POLICY [@ocaml.doc ""]
  | CALLER_REQUIRED_FIELD_MISSING [@ocaml.doc ""]
  | UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER [@ocaml.doc ""]
  | START_DATE_NOT_BEGINNING_OF_MONTH [@ocaml.doc ""]
  | START_DATE_NOT_BEGINNING_OF_DAY [@ocaml.doc ""]
  | START_DATE_TOO_EARLY [@ocaml.doc ""]
  | START_DATE_TOO_LATE [@ocaml.doc ""]
  | INVALID_START_DATE [@ocaml.doc ""]
  | END_DATE_NOT_END_OF_MONTH [@ocaml.doc ""]
  | END_DATE_TOO_EARLY [@ocaml.doc ""]
  | INVALID_END_DATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invalid_input_exception = {
  message : exception_message option; [@ocaml.doc ""]
  reason : invalid_input_exception_reason option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested operation failed because you provided invalid values for one or more of the \
   request parameters. This exception includes a reason that contains additional information about \
   the violated limit:\n\n\
  \  Some of the reasons in the following list might not be applicable to this specific API or \
   operation.\n\
  \  \n\
  \    {ul\n\
  \          {-  CALLER_REQUIRED_FIELD_MISSING: At least one of the required field is missing: \
   Caller Account Id, Management Account Id or Organization Id.\n\
  \              \n\
  \               }\n\
  \          {-  DUPLICATE_TAG_KEY: Tag keys must be unique among the tags attached to the same \
   entity.\n\
  \              \n\
  \               }\n\
  \          {-  END_DATE_NOT_END_OF_MONTH: You provided an invalid end date. The end date must be \
   the end of the last day of the month (23.59.59.999).\n\
  \              \n\
  \               }\n\
  \          {-  END_DATE_TOO_EARLY: You provided an invalid end date. The end date is too early.\n\
  \              \n\
  \               }\n\
  \          {-  END_DATE_TOO_LATE: You provided an invalid end date. The end date is too late.\n\
  \              \n\
  \               }\n\
  \          {-  IMMUTABLE_POLICY: You specified a policy that is managed by Amazon Web Services \
   and can't be modified.\n\
  \              \n\
  \               }\n\
  \          {-  INPUT_REQUIRED: You must include a value for all required parameters.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_EMAIL_ADDRESS_TARGET: You specified an invalid email address for the \
   invited account owner.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_END_DATE: The selected withdrawal date doesn't meet the terms of your \
   partner agreement. Visit Amazon Web Services Partner Central to view your partner agreements or \
   contact your Amazon Web Services Partner for help.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_ENUM: You specified an invalid value.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_ENUM_POLICY_TYPE: You specified an invalid policy type string.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_FULL_NAME_TARGET: You specified a full name that contains invalid \
   characters.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_LIST_MEMBER: You provided a list to a parameter that contains at least \
   one invalid value.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_PAGINATION_TOKEN: Get the value for the [NextToken] parameter from the \
   response to a previous call of the operation.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_PARTY_TYPE_TARGET: You specified the wrong type of entity (account, \
   organization, or email) as a party.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_PATTERN: You provided a value that doesn't match the required pattern.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_PATTERN_TARGET_ID: You specified a policy target ID that doesn't match \
   the required pattern.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_PRINCIPAL: You specified an invalid principal element in the policy.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_ROLE_NAME: You provided a role name that isn't valid. A role name can't \
   begin with the reserved prefix [AWSServiceRoleFor].\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_START_DATE: The start date doesn't meet the minimum requirements.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_SYNTAX_ORGANIZATION_ARN: You specified an invalid Amazon Resource Name \
   (ARN) for the organization.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_SYNTAX_POLICY_ID: You specified an invalid policy ID. \n\
  \              \n\
  \               }\n\
  \          {-  INVALID_SYSTEM_TAGS_PARAMETER: You specified a tag key that is a system tag. You \
   can\226\128\153t add, edit, or delete system tag keys because they're reserved for Amazon Web \
   Services use. System tags don\226\128\153t count against your tags per resource limit.\n\
  \              \n\
  \               }\n\
  \          {-  MAX_FILTER_LIMIT_EXCEEDED: You can specify only one filter parameter for the \
   operation.\n\
  \              \n\
  \               }\n\
  \          {-  MAX_LENGTH_EXCEEDED: You provided a string parameter that is longer than allowed.\n\
  \              \n\
  \               }\n\
  \          {-  MAX_VALUE_EXCEEDED: You provided a numeric parameter that has a larger value than \
   allowed.\n\
  \              \n\
  \               }\n\
  \          {-  MIN_LENGTH_EXCEEDED: You provided a string parameter that is shorter than allowed.\n\
  \              \n\
  \               }\n\
  \          {-  MIN_VALUE_EXCEEDED: You provided a numeric parameter that has a smaller value \
   than allowed.\n\
  \              \n\
  \               }\n\
  \          {-  MOVING_ACCOUNT_BETWEEN_DIFFERENT_ROOTS: You can move an account only between \
   entities in the same root.\n\
  \              \n\
  \               }\n\
  \          {-  NON_DETACHABLE_POLICY: You can't detach this Amazon Web Services Managed Policy.\n\
  \              \n\
  \               }\n\
  \          {-  START_DATE_NOT_BEGINNING_OF_DAY: You provided an invalid start date. The start \
   date must be the beginning of the day (00:00:00.000).\n\
  \              \n\
  \               }\n\
  \          {-  START_DATE_NOT_BEGINNING_OF_MONTH: You provided an invalid start date. The start \
   date must be the first day of the month.\n\
  \              \n\
  \               }\n\
  \          {-  START_DATE_TOO_EARLY: You provided an invalid start date. The start date is too \
   early.\n\
  \              \n\
  \               }\n\
  \          {-  START_DATE_TOO_LATE: You provided an invalid start date. The start date is too \
   late.\n\
  \              \n\
  \               }\n\
  \          {-  TARGET_NOT_SUPPORTED: You can't perform the specified operation on that target \
   entity.\n\
  \              \n\
  \               }\n\
  \          {-  UNRECOGNIZED_SERVICE_PRINCIPAL: You specified a service principal that isn't \
   recognized.\n\
  \              \n\
  \               }\n\
  \          {-  UNSUPPORTED_ACTION_IN_RESPONSIBILITY_TRANSFER: You provided a value that is not \
   supported by this operation.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

type nonrec constraint_violation_exception_reason =
  | ACCOUNT_NUMBER_LIMIT_EXCEEDED [@ocaml.doc ""]
  | HANDSHAKE_RATE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | OU_NUMBER_LIMIT_EXCEEDED [@ocaml.doc ""]
  | OU_DEPTH_LIMIT_EXCEEDED [@ocaml.doc ""]
  | POLICY_NUMBER_LIMIT_EXCEEDED [@ocaml.doc ""]
  | POLICY_CONTENT_LIMIT_EXCEEDED [@ocaml.doc ""]
  | MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED [@ocaml.doc ""]
  | MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED [@ocaml.doc ""]
  | ACCOUNT_CANNOT_LEAVE_ORGANIZATION [@ocaml.doc ""]
  | ACCOUNT_CANNOT_LEAVE_WITHOUT_EULA [@ocaml.doc ""]
  | ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION [@ocaml.doc ""]
  | MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED [@ocaml.doc ""]
  | MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED [@ocaml.doc ""]
  | ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE [@ocaml.doc ""]
  | MASTER_ACCOUNT_MISSING_CONTACT_INFO [@ocaml.doc ""]
  | MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED [@ocaml.doc ""]
  | ORGANIZATION_NOT_IN_ALL_FEATURES_MODE [@ocaml.doc ""]
  | CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION [@ocaml.doc ""]
  | EMAIL_VERIFICATION_CODE_EXPIRED [@ocaml.doc ""]
  | WAIT_PERIOD_ACTIVE [@ocaml.doc ""]
  | MAX_TAG_LIMIT_EXCEEDED [@ocaml.doc ""]
  | TAG_POLICY_VIOLATION [@ocaml.doc ""]
  | MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR [@ocaml.doc ""]
  | CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG [@ocaml.doc ""]
  | DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE [@ocaml.doc ""]
  | POLICY_TYPE_ENABLED_FOR_THIS_SERVICE [@ocaml.doc ""]
  | MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE [@ocaml.doc ""]
  | CANNOT_CLOSE_MANAGEMENT_ACCOUNT [@ocaml.doc ""]
  | CLOSE_ACCOUNT_QUOTA_EXCEEDED [@ocaml.doc ""]
  | CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED [@ocaml.doc ""]
  | SERVICE_ACCESS_NOT_ENABLED [@ocaml.doc ""]
  | INVALID_PAYMENT_INSTRUMENT [@ocaml.doc ""]
  | ACCOUNT_CREATION_NOT_COMPLETE [@ocaml.doc ""]
  | CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR [@ocaml.doc ""]
  | ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION [@ocaml.doc ""]
  | RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION [@ocaml.doc ""]
  | RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION [@ocaml.doc ""]
  | RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION [@ocaml.doc ""]
  | ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS [@ocaml.doc ""]
  | TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS [@ocaml.doc ""]
  | TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS [@ocaml.doc ""]
  | UNSUPPORTED_PRICING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec constraint_violation_exception = {
  message : exception_message option; [@ocaml.doc ""]
  reason : constraint_violation_exception_reason option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Performing this operation violates a minimum or maximum value limit. For example, attempting to \
   remove the last service control policy (SCP) from an OU or root, inviting or creating too many \
   accounts to the organization, or attaching too many policies to an account, OU, or root. This \
   exception includes a reason that contains additional information about the violated limit:\n\n\
  \  Some of the reasons in the following list might not be applicable to this specific API or \
   operation.\n\
  \  \n\
  \    {ul\n\
  \          {-  ACCOUNT_CANNOT_LEAVE_ORGANIZATION: You attempted to remove the management account \
   from the organization. You can't remove the management account. Instead, after you remove all \
   member accounts, delete the organization itself.\n\
  \              \n\
  \               }\n\
  \          {-  ACCOUNT_CANNOT_LEAVE_WITHOUT_PHONE_VERIFICATION: You attempted to remove an \
   account from the organization that doesn't yet have enough information to exist as a standalone \
   account. This account requires you to first complete phone verification. Follow the steps at \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#orgs_manage_accounts_remove-from-master}Removing \
   a member account from your organization} in the {i Organizations User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  ACCOUNT_CREATION_RATE_LIMIT_EXCEEDED: You attempted to exceed the number of \
   accounts that you can create in one day.\n\
  \              \n\
  \               }\n\
  \          {-  ACCOUNT_CREATION_NOT_COMPLETE: Your account setup isn't complete or your account \
   isn't fully active. You must complete the account setup before you create an organization.\n\
  \              \n\
  \               }\n\
  \          {-  ACTIVE_RESPONSIBILITY_TRANSFER_PROCESS: You cannot delete organization due to an \
   ongoing responsibility transfer process. For example, a pending invitation or an in-progress \
   transfer. To delete the organization, you must resolve the current transfer process.\n\
  \              \n\
  \               }\n\
  \          {-  ACCOUNT_NUMBER_LIMIT_EXCEEDED: You attempted to exceed the limit on the number of \
   accounts in an organization. If you need more accounts, contact \
   {{:https://console.aws.amazon.com/support/home#/}Amazon Web Services Support} to request an \
   increase in your limit. \n\
  \              \n\
  \               Or the number of invitations that you tried to send would cause you to exceed \
   the limit of accounts in your organization. Send fewer invitations or contact Amazon Web \
   Services Support to request an increase in the number of accounts.\n\
  \               \n\
  \                 Deleted and closed accounts still count toward your limit.\n\
  \                 \n\
  \                    If you get this exception when running a command immediately after creating \
   the organization, wait one hour and try again. After an hour, if the command continues to fail \
   with this error, contact {{:https://console.aws.amazon.com/support/home#/}Amazon Web Services \
   Support}.\n\
  \                    \n\
  \                      }\n\
  \          {-  ALL_FEATURES_MIGRATION_ORGANIZATION_SIZE_LIMIT_EXCEEDED: Your organization has \
   more than 5000 accounts, and you can only use the standard migration process for organizations \
   with less than 5000 accounts. Use the assisted migration process to enable all features mode, \
   or create a support case for assistance if you are unable to use assisted migration.\n\
  \              \n\
  \               }\n\
  \          {-  CANNOT_REGISTER_SUSPENDED_ACCOUNT_AS_DELEGATED_ADMINISTRATOR: You cannot register \
   a suspended account as a delegated administrator.\n\
  \              \n\
  \               }\n\
  \          {-  CANNOT_REGISTER_MASTER_AS_DELEGATED_ADMINISTRATOR: You attempted to register the \
   management account of the organization as a delegated administrator for an Amazon Web Services \
   service integrated with Organizations. You can designate only a member account as a delegated \
   administrator.\n\
  \              \n\
  \               }\n\
  \          {-  CANNOT_CLOSE_MANAGEMENT_ACCOUNT: You attempted to close the management account. \
   To close the management account for the organization, you must first either remove or close all \
   member accounts in the organization. Follow standard account closure process using root \
   credentials.\226\128\139 \n\
  \              \n\
  \               }\n\
  \          {-  CANNOT_REMOVE_DELEGATED_ADMINISTRATOR_FROM_ORG: You attempted to remove an \
   account that is registered as a delegated administrator for a service integrated with your \
   organization. To complete this operation, you must first deregister this account as a delegated \
   administrator. \n\
  \              \n\
  \               }\n\
  \          {-  CLOSE_ACCOUNT_QUOTA_EXCEEDED: You have exceeded close account quota for the past \
   30 days. \n\
  \              \n\
  \               }\n\
  \          {-  CLOSE_ACCOUNT_REQUESTS_LIMIT_EXCEEDED: You attempted to exceed the number of \
   accounts that you can close at a time. \226\128\139 \n\
  \              \n\
  \               }\n\
  \          {-  CREATE_ORGANIZATION_IN_BILLING_MODE_UNSUPPORTED_REGION: To create an organization \
   in the specified region, you must enable all features mode.\n\
  \              \n\
  \               }\n\
  \          {-  DELEGATED_ADMINISTRATOR_EXISTS_FOR_THIS_SERVICE: You attempted to register an \
   Amazon Web Services account as a delegated administrator for an Amazon Web Services service \
   that already has a delegated administrator. To complete this operation, you must first \
   deregister any existing delegated administrators for this service.\n\
  \              \n\
  \               }\n\
  \          {-  EMAIL_VERIFICATION_CODE_EXPIRED: The email verification code is only valid for a \
   limited period of time. You must resubmit the request and generate a new verification code.\n\
  \              \n\
  \               }\n\
  \          {-  HANDSHAKE_RATE_LIMIT_EXCEEDED: You attempted to exceed the number of handshakes \
   that you can send in one day.\n\
  \              \n\
  \               }\n\
  \          {-  INVALID_PAYMENT_INSTRUMENT: You cannot remove an account because no supported \
   payment method is associated with the account. Amazon Web Services does not support cards \
   issued by financial institutions in Russia or Belarus. For more information, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/manage-general.html}Managing \
   your Amazon Web Services payments}.\n\
  \              \n\
  \               }\n\
  \          {-  MASTER_ACCOUNT_ADDRESS_DOES_NOT_MATCH_MARKETPLACE: To create an account in this \
   organization, you first must migrate the organization's management account to the marketplace \
   that corresponds to the management account's address. All accounts in an organization must be \
   associated with the same marketplace.\n\
  \              \n\
  \               }\n\
  \          {-  MASTER_ACCOUNT_MISSING_BUSINESS_LICENSE: Applies only to the Amazon Web Services \
   Regions in China. To create an organization, the master must have a valid business license. For \
   more information, contact customer support.\n\
  \              \n\
  \               }\n\
  \          {-  MASTER_ACCOUNT_MISSING_CONTACT_INFO: To complete this operation, you must first \
   provide a valid contact address and phone number for the management account. Then try the \
   operation again.\n\
  \              \n\
  \               }\n\
  \          {-  MASTER_ACCOUNT_NOT_GOVCLOUD_ENABLED: To complete this operation, the management \
   account must have an associated account in the Amazon Web Services GovCloud (US-West) Region. \
   For more information, see \
   {{:https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html}Organizations} \
   in the {i Amazon Web Services GovCloud User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  MASTER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED: To create an organization with this \
   management account, you first must associate a valid payment instrument, such as a credit card, \
   with the account. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_account-before-remove.html}Considerations \
   before removing an account from an organization} in the {i Organizations User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  MAX_DELEGATED_ADMINISTRATORS_FOR_SERVICE_LIMIT_EXCEEDED: You attempted to \
   register more delegated administrators than allowed for the service principal. \n\
  \              \n\
  \               }\n\
  \          {-  MAX_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED: You attempted to exceed the number of \
   policies of a certain type that can be attached to an entity at one time.\n\
  \              \n\
  \               }\n\
  \          {-  MAX_TAG_LIMIT_EXCEEDED: You have exceeded the number of tags allowed on this \
   resource. \n\
  \              \n\
  \               }\n\
  \          {-  MEMBER_ACCOUNT_PAYMENT_INSTRUMENT_REQUIRED: To complete this operation with this \
   member account, you first must associate a valid payment instrument, such as a credit card, \
   with the account. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_account-before-remove.html}Considerations \
   before removing an account from an organization} in the {i Organizations User Guide}.\n\
  \              \n\
  \               }\n\
  \          {-  MIN_POLICY_TYPE_ATTACHMENT_LIMIT_EXCEEDED: You attempted to detach a policy from \
   an entity that would cause the entity to have fewer than the minimum number of policies of a \
   certain type required.\n\
  \              \n\
  \               }\n\
  \          {-  ORGANIZATION_NOT_IN_ALL_FEATURES_MODE: You attempted to perform an operation that \
   requires the organization to be configured to support all features. An organization that \
   supports only consolidated billing features can't perform this operation.\n\
  \              \n\
  \               }\n\
  \          {-  OU_DEPTH_LIMIT_EXCEEDED: You attempted to create an OU tree that is too many \
   levels deep.\n\
  \              \n\
  \               }\n\
  \          {-  OU_NUMBER_LIMIT_EXCEEDED: You attempted to exceed the number of OUs that you can \
   have in an organization.\n\
  \              \n\
  \               }\n\
  \          {-  POLICY_CONTENT_LIMIT_EXCEEDED: You attempted to create a policy that is larger \
   than the maximum size.\n\
  \              \n\
  \               }\n\
  \          {-  POLICY_NUMBER_LIMIT_EXCEEDED: You attempted to exceed the number of policies that \
   you can have in an organization.\n\
  \              \n\
  \               }\n\
  \          {-  POLICY_TYPE_ENABLED_FOR_THIS_SERVICE: You attempted to disable service access \
   before you disabled the policy type (for example, SECURITYHUB_POLICY). To complete this \
   operation, you must first disable the policy type.\n\
  \              \n\
  \               }\n\
  \          {-  RESPONSIBILITY_TRANSFER_MAX_INBOUND_QUOTA_VIOLATION: You have exceeded your \
   inbound transfers limit.\n\
  \              \n\
  \               }\n\
  \          {-  RESPONSIBILITY_TRANSFER_MAX_LEVEL_VIOLATION: You have exceeded the maximum length \
   of your transfer chain.\n\
  \              \n\
  \               }\n\
  \          {-  RESPONSIBILITY_TRANSFER_MAX_OUTBOUND_QUOTA_VIOLATION: You have exceeded your \
   outbound transfers limit.\n\
  \              \n\
  \               }\n\
  \          {-  RESPONSIBILITY_TRANSFER_MAX_TRANSFERS_QUOTA_VIOLATION: You have exceeded the \
   maximum number of inbound transfers allowed in a transfer chain.\n\
  \              \n\
  \               }\n\
  \          {-  SERVICE_ACCESS_NOT_ENABLED:\n\
  \              \n\
  \               {ul\n\
  \                     {-  You attempted to register a delegated administrator before you enabled \
   service access. Call the [EnableAWSServiceAccess] API first.\n\
  \                         \n\
  \                          }\n\
  \                     {-  You attempted to enable a policy type before you enabled service \
   access. Call the [EnableAWSServiceAccess] API first.\n\
  \                         \n\
  \                          }\n\
  \                     \n\
  \           }\n\
  \            }\n\
  \          {-  TAG_POLICY_VIOLATION: You attempted to create or update a resource with tags that \
   are not compliant with the tag policy requirements for this account.\n\
  \              \n\
  \               }\n\
  \          {-  TRANSFER_RESPONSIBILITY_SOURCE_DELETION_IN_PROGRESS: The source organization \
   cannot accept this transfer invitation because it is marked for deletion.\n\
  \              \n\
  \               }\n\
  \          {-  TRANSFER_RESPONSIBILITY_TARGET_DELETION_IN_PROGRESS: The source organization \
   cannot accept this transfer invitation because target organization is marked for deletion.\n\
  \              \n\
  \               }\n\
  \          {-  UNSUPPORTED_PRICING: Your organization has a pricing contract that is unsupported.\n\
  \              \n\
  \               }\n\
  \          {-  WAIT_PERIOD_ACTIVE: After you create an Amazon Web Services account, you must \
   wait until at least four days after the account was created. Invited accounts aren't subject to \
   this waiting period.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

type nonrec access_denied_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You don't have permissions to perform the requested operation. The user or role that is making \
   the request must have at least one IAM permissions policy attached that grants the required \
   permissions. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html}Access Management} in the {i \
   IAM User Guide}.\n"]

type nonrec handshake_id = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec email = string [@@ocaml.doc ""]

type nonrec account_id = string [@@ocaml.doc ""]

type nonrec transfer_participant = {
  management_account_id : account_id option; [@ocaml.doc "ID for the management account.\n"]
  management_account_email : email option; [@ocaml.doc "Email address for the management account.\n"]
}
[@@ocaml.doc
  "Contains details for a participant in a transfer. A {i transfer} is the arrangement between two \
   management accounts where one account designates the other with specified responsibilities for \
   their organization.\n"]

type nonrec responsibility_transfer_status =
  | REQUESTED [@ocaml.doc ""]
  | DECLINED [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | ACCEPTED [@ocaml.doc ""]
  | WITHDRAWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec responsibility_transfer_type = BILLING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec responsibility_transfer_id = string [@@ocaml.doc ""]

type nonrec responsibility_transfer_name = string [@@ocaml.doc ""]

type nonrec responsibility_transfer_arn = string [@@ocaml.doc ""]

type nonrec responsibility_transfer = {
  arn : responsibility_transfer_arn option;
      [@ocaml.doc "Amazon Resource Name (ARN) for the transfer.\n"]
  name : responsibility_transfer_name option; [@ocaml.doc "Name assigned to the transfer.\n"]
  id : responsibility_transfer_id option; [@ocaml.doc "ID for the transfer.\n"]
  type_ : responsibility_transfer_type option;
      [@ocaml.doc "The type of transfer. Currently, only [BILLING] is supported.\n"]
  status : responsibility_transfer_status option; [@ocaml.doc "Status for the transfer.\n"]
  source : transfer_participant option;
      [@ocaml.doc
        "Account that allows another account external to its organization to manage the specified \
         responsibilities for the organization.\n"]
  target : transfer_participant option;
      [@ocaml.doc "Account that manages the specified responsibilities for another organization.\n"]
  start_timestamp : timestamp option; [@ocaml.doc "Timestamp when the transfer starts.\n"]
  end_timestamp : timestamp option; [@ocaml.doc "Timestamp when the transfer ends.\n"]
  active_handshake_id : handshake_id option; [@ocaml.doc "ID for the handshake of the transfer.\n"]
}
[@@ocaml.doc
  "Contains details for a transfer. A {i transfer} is the arrangement between two management \
   accounts where one account designates the other with specified responsibilities for their \
   organization.\n"]

type nonrec update_responsibility_transfer_response = {
  responsibility_transfer : responsibility_transfer option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec update_responsibility_transfer_request = {
  id : responsibility_transfer_id; [@ocaml.doc "ID for the transfer.\n"]
  name : responsibility_transfer_name; [@ocaml.doc "New name you want to assign to the transfer.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "We can't find a policy with the [PolicyId] that you specified.\n"]

type nonrec policy_changes_in_progress_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Changes to the effective policy are in progress, and its contents can't be returned. Try the \
   operation again later. \n"]

type nonrec malformed_policy_document_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The provided policy document doesn't meet the requirements of the specified policy type. For \
   example, the syntax might be incorrect. For details about service control policy syntax, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_syntax.html}SCP \
   syntax} in the {i Organizations User Guide}.\n"]

type nonrec duplicate_policy_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "A policy with the same name already exists.\n"]

type nonrec concurrent_modification_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The target of the operation is currently being modified by a different request. Try again later.\n"]

type nonrec policy_content = string [@@ocaml.doc ""]

type nonrec aws_managed_policy = bool [@@ocaml.doc ""]

type nonrec policy_type =
  | SERVICE_CONTROL_POLICY [@ocaml.doc ""]
  | RESOURCE_CONTROL_POLICY [@ocaml.doc ""]
  | TAG_POLICY [@ocaml.doc ""]
  | BACKUP_POLICY [@ocaml.doc ""]
  | AISERVICES_OPT_OUT_POLICY [@ocaml.doc ""]
  | CHATBOT_POLICY [@ocaml.doc ""]
  | DECLARATIVE_POLICY_EC2 [@ocaml.doc ""]
  | SECURITYHUB_POLICY [@ocaml.doc ""]
  | INSPECTOR_POLICY [@ocaml.doc ""]
  | UPGRADE_ROLLOUT_POLICY [@ocaml.doc ""]
  | BEDROCK_POLICY [@ocaml.doc ""]
  | S3_POLICY [@ocaml.doc ""]
  | NETWORK_SECURITY_DIRECTOR_POLICY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_description = string [@@ocaml.doc ""]

type nonrec policy_name = string [@@ocaml.doc ""]

type nonrec policy_arn = string [@@ocaml.doc ""]

type nonrec policy_id = string [@@ocaml.doc ""]

type nonrec policy_summary = {
  id : policy_id option;
      [@ocaml.doc
        "The unique identifier (ID) of the policy.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a policy ID string requires \
         \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the \
         underscore character (_).\n\
        \ "]
  arn : policy_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the policy.\n\n\
        \ For more information about ARNs in Organizations, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies}ARN \
         Formats Supported by Organizations} in the {i Amazon Web Services Service Authorization \
         Reference}.\n\
        \ "]
  name : policy_name option;
      [@ocaml.doc
        "The friendly name of the policy.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of any of the characters in the ASCII character range.\n\
        \ "]
  description : policy_description option; [@ocaml.doc "The description of the policy.\n"]
  type_ : policy_type option; [@ocaml.doc "The type of policy.\n"]
  aws_managed : aws_managed_policy option;
      [@ocaml.doc
        "A boolean value that indicates whether the specified policy is an Amazon Web Services \
         managed policy. If true, then you can attach the policy to roots, OUs, or accounts, but \
         you cannot edit it.\n"]
}
[@@ocaml.doc
  "Contains information about a policy, but does not include the content. To see the content of a \
   policy, see [DescribePolicy].\n"]

type nonrec policy = {
  policy_summary : policy_summary option;
      [@ocaml.doc "A structure that contains additional details about the policy.\n"]
  content : policy_content option; [@ocaml.doc "The text content of the policy.\n"]
}
[@@ocaml.doc
  "Contains rules to be applied to the affected accounts. Policies can be attached directly to \
   accounts, or to roots and OUs to affect all accounts in those hierarchies.\n"]

type nonrec update_policy_response = {
  policy : policy option;
      [@ocaml.doc
        "A structure that contains details about the updated policy, showing the requested changes.\n"]
}
[@@ocaml.doc ""]

type nonrec update_policy_request = {
  policy_id : policy_id;
      [@ocaml.doc
        "ID for the policy that you want to update.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a policy ID string requires \
         \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the \
         underscore character (_).\n\
        \ "]
  name : policy_name option;
      [@ocaml.doc
        "If provided, the new name for the policy.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of any of the characters in the ASCII character range.\n\
        \ "]
  description : policy_description option;
      [@ocaml.doc "If provided, the new description for the policy.\n"]
  content : policy_content option;
      [@ocaml.doc
        "If provided, the new content for the policy. The text must be correctly formatted JSON \
         that complies with the syntax for the policy's type. For more information, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_syntax.html}SCP \
         syntax} in the {i Organizations User Guide}.\n\n\
        \ The maximum size of a policy document depends on the policy's type. For more \
         information, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html#min-max-values}Maximum \
         and minimum values} in the {i Organizations User Guide}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec organizational_unit_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "We can't find an OU with the [OrganizationalUnitId] that you specified.\n"]

type nonrec duplicate_organizational_unit_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "An OU with the same name already exists.\n"]

type nonrec path = string [@@ocaml.doc ""]

type nonrec organizational_unit_name = string [@@ocaml.doc ""]

type nonrec organizational_unit_arn = string [@@ocaml.doc ""]

type nonrec organizational_unit_id = string [@@ocaml.doc ""]

type nonrec organizational_unit = {
  id : organizational_unit_id option;
      [@ocaml.doc
        "The unique identifier (ID) associated with this OU. The ID is unique to the organization \
         only.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an organizational unit ID \
         string requires \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of \
         the root that contains the OU). This string is followed by a second \"-\" dash and from 8 \
         to 32 additional lowercase letters or digits.\n\
        \ "]
  arn : organizational_unit_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of this OU.\n\n\
        \ For more information about ARNs in Organizations, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies}ARN \
         Formats Supported by Organizations} in the {i Amazon Web Services Service Authorization \
         Reference}.\n\
        \ "]
  name : organizational_unit_name option;
      [@ocaml.doc
        "The friendly name of this OU.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of any of the characters in the ASCII character range.\n\
        \ "]
  path : path option; [@ocaml.doc "The path in the organization where this OU exists.\n"]
}
[@@ocaml.doc
  "Contains details about an organizational unit (OU). An OU is a container of Amazon Web Services \
   accounts within a root of an organization. Policies that are attached to an OU apply to all \
   accounts contained in that OU and in any child OUs.\n"]

type nonrec update_organizational_unit_response = {
  organizational_unit : organizational_unit option;
      [@ocaml.doc
        "A structure that contains the details about the specified OU, including its new name.\n"]
}
[@@ocaml.doc ""]

type nonrec update_organizational_unit_request = {
  organizational_unit_id : organizational_unit_id;
      [@ocaml.doc
        "ID for the OU that you want to rename. You can get the ID from the \
         [ListOrganizationalUnitsForParent] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an organizational unit ID \
         string requires \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of \
         the root that contains the OU). This string is followed by a second \"-\" dash and from 8 \
         to 32 additional lowercase letters or digits.\n\
        \ "]
  name : organizational_unit_name option;
      [@ocaml.doc
        "The new name that you want to assign to the OU.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of any of the characters in the ASCII character range.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec target_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "We can't find a root, OU, account, or policy with the [TargetId] that you specified.\n"]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec taggable_resource_id = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_id : taggable_resource_id;
      [@ocaml.doc
        "The ID of the resource to remove a tag from.\n\n\
        \ You can specify any of the following taggable resources.\n\
        \ \n\
        \  {ul\n\
        \        {-  Amazon Web Services account \226\128\147 specify the account ID number.\n\
        \            \n\
        \             }\n\
        \        {-  Organizational unit \226\128\147 specify the OU ID that begins with [ou-] and \
         looks similar to: \n\
        \            {[\n\
        \            ou-{i 1a2b-34uvwxyz} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-  Root \226\128\147 specify the root ID that begins with [r-] and looks similar \
         to: \n\
        \            {[\n\
        \            r-{i 1a2b} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-  Policy \226\128\147 specify the policy ID that begins with [p-] andlooks \
         similar to: \n\
        \            {[\n\
        \            p-{i 12abcdefg3} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  tag_keys : tag_keys;
      [@ocaml.doc "The list of keys for tags to remove from the specified resource.\n"]
}
[@@ocaml.doc ""]

type nonrec responsibility_transfer_already_in_status_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The responsibility transfer is already in the status that you specified.\n"]

type nonrec invalid_responsibility_transfer_transition_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The responsibility transfer can't transition to the requested state because it's not in a valid \
   state for this operation.\n"]

type nonrec terminate_responsibility_transfer_response = {
  responsibility_transfer : responsibility_transfer option;
      [@ocaml.doc "A [ResponsibilityTransfer] object. Contains details for a transfer.\n"]
}
[@@ocaml.doc ""]

type nonrec terminate_responsibility_transfer_request = {
  id : responsibility_transfer_id; [@ocaml.doc "ID for the transfer.\n"]
  end_timestamp : timestamp option;
      [@ocaml.doc "Timestamp when the responsibility transfer is to end.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key identifier, or name, of the tag.\n"]
  value : tag_value;
      [@ocaml.doc
        "The string value that's associated with the key of the tag. You can set the value of a \
         tag to an empty string, but you can't set the value of a tag to null.\n"]
}
[@@ocaml.doc
  "A custom key-value pair associated with a resource within your organization.\n\n\
  \ You can attach tags to any of the following organization resources.\n\
  \ \n\
  \  {ul\n\
  \        {-  Amazon Web Services account\n\
  \            \n\
  \             }\n\
  \        {-  Organizational unit (OU)\n\
  \            \n\
  \             }\n\
  \        {-  Organization root\n\
  \            \n\
  \             }\n\
  \        {-  Policy\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec tags = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_id : taggable_resource_id;
      [@ocaml.doc
        "The ID of the resource to add a tag to.\n\n\
        \ You can specify any of the following taggable resources.\n\
        \ \n\
        \  {ul\n\
        \        {-  Amazon Web Services account \226\128\147 specify the account ID number.\n\
        \            \n\
        \             }\n\
        \        {-  Organizational unit \226\128\147 specify the OU ID that begins with [ou-] and \
         looks similar to: \n\
        \            {[\n\
        \            ou-{i 1a2b-34uvwxyz} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-  Root \226\128\147 specify the root ID that begins with [r-] and looks similar \
         to: \n\
        \            {[\n\
        \            r-{i 1a2b} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-  Policy \226\128\147 specify the policy ID that begins with [p-] andlooks \
         similar to: \n\
        \            {[\n\
        \            p-{i 12abcdefg3} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  tags : tags;
      [@ocaml.doc
        "A list of tags to add to the specified resource.\n\n\
        \ For each tag in the list, you must specify both a tag key and a value. The value can be \
         an empty string, but you can't set it to [null].\n\
        \ \n\
        \   If any one of the tags is not valid or if you exceed the maximum allowed number of \
         tags for a resource, then the entire request fails.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec master_cannot_leave_organization_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You can't remove a management account from an organization. If you want the management account \
   to become a member account in another organization, you must first delete the current \
   organization of the management account.\n"]

type nonrec account_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  " We can't find an Amazon Web Services account with the [AccountId] that you specified, or the \
   account whose credentials you used to make this request isn't a member of an organization.\n"]

type nonrec remove_account_from_organization_request = {
  account_id : account_id;
      [@ocaml.doc
        "ID for the member account that you want to remove from the organization.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an account ID string requires \
         exactly 12 digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec account_already_registered_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified account is already a delegated administrator for this Amazon Web Services service.\n"]

type nonrec service_principal = string [@@ocaml.doc ""]

type nonrec register_delegated_administrator_request = {
  account_id : account_id;
      [@ocaml.doc
        "The account ID number of the member account in the organization to register as a \
         delegated administrator.\n"]
  service_principal : service_principal;
      [@ocaml.doc
        "The service principal of the Amazon Web Services service for which you want to make the \
         member account a delegated administrator.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_policy_content = string [@@ocaml.doc ""]

type nonrec resource_policy_arn = string [@@ocaml.doc ""]

type nonrec resource_policy_id = string [@@ocaml.doc ""]

type nonrec resource_policy_summary = {
  id : resource_policy_id option;
      [@ocaml.doc "The unique identifier (ID) of the resource policy.\n"]
  arn : resource_policy_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource policy.\n"]
}
[@@ocaml.doc "A structure that contains resource policy ID and Amazon Resource Name (ARN).\n"]

type nonrec resource_policy = {
  resource_policy_summary : resource_policy_summary option;
      [@ocaml.doc "A structure that contains resource policy ID and Amazon Resource Name (ARN).\n"]
  content : resource_policy_content option; [@ocaml.doc "The policy text of the resource policy.\n"]
}
[@@ocaml.doc "A structure that contains details about a resource policy.\n"]

type nonrec put_resource_policy_response = {
  resource_policy : resource_policy option;
      [@ocaml.doc "A structure that contains details about the resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  content : resource_policy_content;
      [@ocaml.doc
        "If provided, the new content for the resource policy. The text must be correctly \
         formatted JSON that complies with the syntax for the resource policy's type. For more \
         information, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_syntax.html}SCP \
         syntax} in the {i Organizations User Guide}.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of tags that you want to attach to the newly created resource policy. For each tag \
         in the list, you must specify both a tag key and a value. You can set the value to an \
         empty string, but you can't set it to [null]. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html}Tagging \
         Organizations resources} in the Organizations User Guide.\n\n\
        \  Calls with tags apply to the initial creation of the resource policy, otherwise an \
         exception is thrown. If any one of the tags is not valid or if you exceed the allowed \
         number of tags for the resource policy, then the entire request fails and the resource \
         policy is not created. \n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec source_parent_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "We can't find a source root or OU with the [ParentId] that you specified.\n"]

type nonrec duplicate_account_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "That account is already present in the specified destination.\n"]

type nonrec destination_parent_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "We can't find the destination container (a root or OU) with the [ParentId] that you specified.\n"]

type nonrec parent_id = string [@@ocaml.doc ""]

type nonrec move_account_request = {
  account_id : account_id;
      [@ocaml.doc
        "ID for the account that you want to move.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an account ID string requires \
         exactly 12 digits.\n\
        \ "]
  source_parent_id : parent_id;
      [@ocaml.doc
        "ID for the root or organizational unit that you want to move the account from.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a parent ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  destination_parent_id : parent_id;
      [@ocaml.doc
        "ID for the root or organizational unit that you want to move the account to.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a parent ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec target_type =
  | ACCOUNT [@ocaml.doc ""]
  | ORGANIZATIONAL_UNIT [@ocaml.doc ""]
  | ROOT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec target_name = string [@@ocaml.doc ""]

type nonrec generic_arn = string [@@ocaml.doc ""]

type nonrec policy_target_id = string [@@ocaml.doc ""]

type nonrec policy_target_summary = {
  target_id : policy_target_id option;
      [@ocaml.doc
        "The unique identifier (ID) of the policy target.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a target ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Account} - A string that consists of exactly 12 digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  arn : generic_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the policy target.\n\n\
        \ For more information about ARNs in Organizations, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies}ARN \
         Formats Supported by Organizations} in the {i Amazon Web Services Service Authorization \
         Reference}.\n\
        \ "]
  name : target_name option;
      [@ocaml.doc
        "The friendly name of the policy target.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of any of the characters in the ASCII character range.\n\
        \ "]
  type_ : target_type option; [@ocaml.doc "The type of the policy target.\n"]
}
[@@ocaml.doc "Contains information about a root, OU, or account that a policy is attached to.\n"]

type nonrec policy_targets = policy_target_summary list [@@ocaml.doc ""]

type nonrec list_targets_for_policy_response = {
  targets : policy_targets option;
      [@ocaml.doc
        "A list of structures, each of which contains details about one of the entities to which \
         the specified policy is attached.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_targets_for_policy_request = {
  policy_id : policy_id;
      [@ocaml.doc
        "ID for the policy whose attachments you want to know.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a policy ID string requires \
         \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the \
         underscore character (_).\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tags option; [@ocaml.doc "The tags that are assigned to the resource.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_id : taggable_resource_id;
      [@ocaml.doc
        "The ID of the resource with the tags to list.\n\n\
        \ You can specify any of the following taggable resources.\n\
        \ \n\
        \  {ul\n\
        \        {-  Amazon Web Services account \226\128\147 specify the account ID number.\n\
        \            \n\
        \             }\n\
        \        {-  Organizational unit \226\128\147 specify the OU ID that begins with [ou-] and \
         looks similar to: \n\
        \            {[\n\
        \            ou-{i 1a2b-34uvwxyz} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-  Root \226\128\147 specify the root ID that begins with [r-] and looks similar \
         to: \n\
        \            {[\n\
        \            r-{i 1a2b} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        {-  Policy \226\128\147 specify the policy ID that begins with [p-] andlooks \
         similar to: \n\
        \            {[\n\
        \            p-{i 12abcdefg3} \n\
        \            ]}\n\
        \             \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_type_status =
  | ENABLED [@ocaml.doc ""]
  | PENDING_ENABLE [@ocaml.doc ""]
  | PENDING_DISABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_type_summary = {
  type_ : policy_type option; [@ocaml.doc "The name of the policy type.\n"]
  status : policy_type_status option;
      [@ocaml.doc
        "The status of the policy type as it relates to the associated root. To attach a policy of \
         the specified type to a root or to an OU or account in that root, it must be available in \
         the organization and enabled for that root.\n"]
}
[@@ocaml.doc "Contains information about a policy type and its status in the associated root.\n"]

type nonrec policy_types = policy_type_summary list [@@ocaml.doc ""]

type nonrec root_name = string [@@ocaml.doc ""]

type nonrec root_arn = string [@@ocaml.doc ""]

type nonrec root_id = string [@@ocaml.doc ""]

type nonrec root = {
  id : root_id option;
      [@ocaml.doc
        "The unique identifier (ID) for the root. The ID is unique to the organization only.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a root ID string requires \
         \"r-\" followed by from 4 to 32 lowercase letters or digits.\n\
        \ "]
  arn : root_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the root.\n\n\
        \ For more information about ARNs in Organizations, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies}ARN \
         Formats Supported by Organizations} in the {i Amazon Web Services Service Authorization \
         Reference}.\n\
        \ "]
  name : root_name option;
      [@ocaml.doc
        "The friendly name of the root.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of any of the characters in the ASCII character range.\n\
        \ "]
  policy_types : policy_types option;
      [@ocaml.doc
        "The types of policies that are currently enabled for the root and therefore can be \
         attached to the root or to its OUs or accounts.\n\n\
        \  Even if a policy type is shown as available in the organization, you can separately \
         enable and disable them at the root level by using [EnablePolicyType] and \
         [DisablePolicyType]. Use [DescribeOrganization] to see the availability of the policy \
         types in that organization.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Contains details about a root. A root is a top-level parent node in the hierarchy of an \
   organization that can contain organizational units (OUs) and accounts. The root contains every \
   Amazon Web Services account in the organization.\n"]

type nonrec roots = root list [@@ocaml.doc ""]

type nonrec list_roots_response = {
  roots : roots option; [@ocaml.doc "A list of roots that are defined in an organization.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_roots_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec policies = policy_summary list [@@ocaml.doc ""]

type nonrec list_policies_for_target_response = {
  policies : policies option;
      [@ocaml.doc "The list of policies that match the criteria in the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_policies_for_target_request = {
  target_id : policy_target_id;
      [@ocaml.doc
        "ID for the root, organizational unit, or account whose policies you want to list.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a target ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Account} - A string that consists of exactly 12 digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  filter : policy_type;
      [@ocaml.doc
        "The type of policy that you want to include in the returned list. You must specify one of \
         the following values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html}SERVICE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps.html}RESOURCE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_policies_response = {
  policies : policies option;
      [@ocaml.doc
        "A list of policies that match the filter criteria in the request. The output list doesn't \
         include the policy contents. To see the content for a policy, see [DescribePolicy].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_policies_request = {
  filter : policy_type;
      [@ocaml.doc
        "Specifies the type of policy that you want to include in the response. You must specify \
         one of the following values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html}SERVICE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps.html}RESOURCE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec child_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "We can't find an organizational unit (OU) or Amazon Web Services account with the [ChildId] \
   that you specified.\n"]

type nonrec parent_type = ROOT [@ocaml.doc ""] | ORGANIZATIONAL_UNIT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parent = {
  id : parent_id option;
      [@ocaml.doc
        "The unique identifier (ID) of the parent entity.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a parent ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  type_ : parent_type option; [@ocaml.doc "The type of the parent entity.\n"]
}
[@@ocaml.doc
  "Contains information about either a root or an organizational unit (OU) that can contain OUs or \
   accounts in an organization.\n"]

type nonrec parents = parent list [@@ocaml.doc ""]

type nonrec list_parents_response = {
  parents : parents option;
      [@ocaml.doc "A list of parents for the specified child account or OU.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec child_id = string [@@ocaml.doc ""]

type nonrec list_parents_request = {
  child_id : child_id;
      [@ocaml.doc
        "ID for the OU or account whose parent containers you want to list. Don't specify a root.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a child ID string requires one \
         of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Account} - A string that consists of exactly 12 digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec responsibility_transfers = responsibility_transfer list [@@ocaml.doc ""]

type nonrec list_outbound_responsibility_transfers_response = {
  responsibility_transfers : responsibility_transfers option;
      [@ocaml.doc
        "An array of [ResponsibilityTransfer] objects. Contains details for a transfer.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_outbound_responsibility_transfers_request = {
  type_ : responsibility_transfer_type;
      [@ocaml.doc "The type of responsibility. Currently, only [BILLING] is supported.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec parent_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "We can't find a root or OU with the [ParentId] that you specified.\n"]

type nonrec organizational_units = organizational_unit list [@@ocaml.doc ""]

type nonrec list_organizational_units_for_parent_response = {
  organizational_units : organizational_units option;
      [@ocaml.doc "A list of the OUs in the specified root or parent OU.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_organizational_units_for_parent_request = {
  parent_id : parent_id;
      [@ocaml.doc
        "ID for the root or OU whose child OUs you want to list.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a parent ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_inbound_responsibility_transfers_response = {
  responsibility_transfers : responsibility_transfers option;
      [@ocaml.doc "A [ResponsibilityTransfers] object. Contains details for a transfer.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_inbound_responsibility_transfers_request = {
  type_ : responsibility_transfer_type;
      [@ocaml.doc "The type of responsibility. Currently, only [BILLING] is supported.\n"]
  id : responsibility_transfer_id option; [@ocaml.doc "ID for the transfer.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec handshake_resource_type =
  | ACCOUNT [@ocaml.doc ""]
  | ORGANIZATION [@ocaml.doc ""]
  | ORGANIZATION_FEATURE_SET [@ocaml.doc ""]
  | EMAIL [@ocaml.doc ""]
  | MASTER_EMAIL [@ocaml.doc ""]
  | MASTER_NAME [@ocaml.doc ""]
  | NOTES [@ocaml.doc ""]
  | PARENT_HANDSHAKE [@ocaml.doc ""]
  | RESPONSIBILITY_TRANSFER [@ocaml.doc ""]
  | TRANSFER_START_TIMESTAMP [@ocaml.doc ""]
  | TRANSFER_TYPE [@ocaml.doc ""]
  | MANAGEMENT_ACCOUNT [@ocaml.doc ""]
  | MANAGEMENT_EMAIL [@ocaml.doc ""]
  | MANAGEMENT_NAME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec handshake_resource_value = string [@@ocaml.doc ""]

type handshake_resources = handshake_resource list [@@ocaml.doc ""]

and handshake_resource = {
  value : handshake_resource_value option;
      [@ocaml.doc
        "Additional information for the handshake. The format of the value string must match the \
         requirements of the specified type.\n"]
  type_ : handshake_resource_type option;
      [@ocaml.doc
        "The type of information being passed, specifying how the value is to be interpreted by \
         the other party:\n\n\
        \ {ul\n\
        \       {-   {b ACCOUNT}: ID for an Amazon Web Services account.\n\
        \           \n\
        \            }\n\
        \       {-   {b ORGANIZATION}: ID for an organization.\n\
        \           \n\
        \            }\n\
        \       {-   {b EMAIL}: Email address for the recipient.\n\
        \           \n\
        \            }\n\
        \       {-   {b OWNER_EMAIL}: Email address for the sender.\n\
        \           \n\
        \            }\n\
        \       {-   {b OWNER_NAME}: Name of the sender.\n\
        \           \n\
        \            }\n\
        \       {-   {b NOTES}: Additional text included by the sender for the recipient.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resources : handshake_resources option;
      [@ocaml.doc
        "An array of [HandshakeResource] objects. When needed, contains additional details for a \
         handshake. For example, the email address for the sender.\n"]
}
[@@ocaml.doc "Contains additional details for a handshake.\n"]

type nonrec action_type =
  | INVITE_ACCOUNT_TO_ORGANIZATION [@ocaml.doc ""]
  | ENABLE_ALL_FEATURES [@ocaml.doc ""]
  | APPROVE_ALL_FEATURES [@ocaml.doc ""]
  | ADD_ORGANIZATIONS_SERVICE_LINKED_ROLE [@ocaml.doc ""]
  | TRANSFER_RESPONSIBILITY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec handshake_state =
  | REQUESTED [@ocaml.doc ""]
  | OPEN [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | ACCEPTED [@ocaml.doc ""]
  | DECLINED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec handshake_party_type =
  | ACCOUNT [@ocaml.doc ""]
  | ORGANIZATION [@ocaml.doc ""]
  | EMAIL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec handshake_party_id = string [@@ocaml.doc ""]

type nonrec handshake_party = {
  id : handshake_party_id;
      [@ocaml.doc
        "ID for the participant: Acccount ID, organization ID, or email address.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for handshake ID string requires \
         \"h-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \ "]
  type_ : handshake_party_type; [@ocaml.doc "The type of ID for the participant.\n"]
}
[@@ocaml.doc "Contains details for a participant in a handshake.\n"]

type nonrec handshake_parties = handshake_party list [@@ocaml.doc ""]

type nonrec handshake_arn = string [@@ocaml.doc ""]

type nonrec handshake = {
  id : handshake_id option;
      [@ocaml.doc
        "ID for the handshake.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for handshake ID string requires \
         \"h-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \ "]
  arn : handshake_arn option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) for the handshake.\n\n\
        \ For more information about ARNs in Organizations, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies}ARN \
         Formats Supported by Organizations} in the {i Amazon Web Services Service Authorization \
         Reference}.\n\
        \ "]
  parties : handshake_parties option;
      [@ocaml.doc
        "An array of [HandshakeParty] objects. Contains details for participant in a handshake.\n"]
  state : handshake_state option;
      [@ocaml.doc
        "Current state for the handshake.\n\n\
        \ {ul\n\
        \       {-   {b REQUESTED}: Handshake awaiting a response from the recipient.\n\
        \           \n\
        \            }\n\
        \       {-   {b OPEN}: Handshake sent to multiple recipients and all recipients have \
         responded. The sender can now complete the handshake action.\n\
        \           \n\
        \            }\n\
        \       {-   {b CANCELED}: Handshake canceled by the sender.\n\
        \           \n\
        \            }\n\
        \       {-   {b ACCEPTED}: Handshake accepted by the recipient.\n\
        \           \n\
        \            }\n\
        \       {-   {b DECLINED}: Handshake declined by the recipient.\n\
        \           \n\
        \            }\n\
        \       {-   {b EXPIRED}: Handshake has expired.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  requested_timestamp : timestamp option;
      [@ocaml.doc "Timestamp when the handshake request was made.\n"]
  expiration_timestamp : timestamp option; [@ocaml.doc "Timestamp when the handshake expires.\n"]
  action : action_type option;
      [@ocaml.doc
        "The type of handshake:\n\n\
        \ {ul\n\
        \       {-   {b INVITE}: Handshake sent to a standalone account requesting that it to join \
         the sender's organization.\n\
        \           \n\
        \            }\n\
        \       {-   {b ENABLE_ALL_FEATURES}: Handshake sent to invited member accounts to enable \
         all features for the organization.\n\
        \           \n\
        \            }\n\
        \       {-   {b APPROVE_ALL_FEATURES}: Handshake sent to the management account when all \
         invited member accounts have approved to enable all features.\n\
        \           \n\
        \            }\n\
        \       {-   {b TRANSFER_RESPONSIBILITY}: Handshake sent to another organization's \
         management account requesting that it designate the sender with the specified \
         responsibilities for recipient's organization.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  resources : handshake_resources option;
      [@ocaml.doc
        "An array of [HandshakeResource] objects. When needed, contains additional details for a \
         handshake. For example, the email address for the sender.\n"]
}
[@@ocaml.doc
  "Contains details for a handshake. A handshake is the secure exchange of information between two \
   Amazon Web Services accounts: a sender and a recipient.\n\n\
  \  {b Note:} Handshakes that are [CANCELED], [ACCEPTED], [DECLINED], or [EXPIRED] show up in \
   lists for only 30 days after entering that state After that they are deleted.\n\
  \ "]

type nonrec handshakes = handshake list [@@ocaml.doc ""]

type nonrec list_handshakes_for_organization_response = {
  handshakes : handshakes option;
      [@ocaml.doc "An array of [Handshake]objects. Contains details for a handshake.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec handshake_filter = {
  action_type : action_type option;
      [@ocaml.doc
        "The type of handshake.\n\n\
        \ If you specify [ActionType], you cannot also specify [ParentHandshakeId].\n\
        \ "]
  parent_handshake_id : handshake_id option;
      [@ocaml.doc
        "The parent handshake. Only used for handshake types that are a child of another type.\n\n\
        \ If you specify [ParentHandshakeId], you cannot also specify [ActionType].\n\
        \ \n\
        \  The {{:http://wikipedia.org/wiki/regex}regex pattern} for handshake ID string requires \
         \"h-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \  "]
}
[@@ocaml.doc "Contains the filter used to select the handshakes for an operation.\n"]

type nonrec list_handshakes_for_organization_request = {
  filter : handshake_filter option;
      [@ocaml.doc
        "A [HandshakeFilter] object. Contains the filer used to select the handshakes for an \
         operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_handshakes_for_account_response = {
  handshakes : handshakes option;
      [@ocaml.doc "An array of [Handshake]objects. Contains details for a handshake.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_handshakes_for_account_request = {
  filter : handshake_filter option;
      [@ocaml.doc
        "A [HandshakeFilter] object. Contains the filer used to select the handshakes for an \
         operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec effective_policy_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "If you ran this action on the management account, this policy type is not enabled. If you ran \
   the action on a member account, the account doesn't have an effective policy of this type. \
   Contact the administrator of your organization about attaching a policy of this type to the \
   account. \n"]

type nonrec policy_ids = policy_id list [@@ocaml.doc ""]

type nonrec path_to_error = string [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec effective_policy_validation_error = {
  error_code : error_code option;
      [@ocaml.doc "The error code for the validation error. For example, [ELEMENTS_TOO_MANY].\n"]
  error_message : error_message option; [@ocaml.doc "The error message for the validation error.\n"]
  path_to_error : path_to_error option;
      [@ocaml.doc "The path within the effective policy where the validation error occurred.\n"]
  contributing_policies : policy_ids option;
      [@ocaml.doc
        "The individual policies \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inheritance_mgmt.html}inherited} \
         and \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_policies_attach.html}attached} \
         to the account which contributed to the validation error.\n"]
}
[@@ocaml.doc
  "Contains details about the validation errors that occurred when generating or enforcing an \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_effective.html}effective \
   policy}, such as which policies contributed to the error and location of the error.\n"]

type nonrec effective_policy_validation_errors = effective_policy_validation_error list
[@@ocaml.doc ""]

type nonrec effective_policy_type =
  | TAG_POLICY [@ocaml.doc ""]
  | BACKUP_POLICY [@ocaml.doc ""]
  | AISERVICES_OPT_OUT_POLICY [@ocaml.doc ""]
  | CHATBOT_POLICY [@ocaml.doc ""]
  | DECLARATIVE_POLICY_EC2 [@ocaml.doc ""]
  | SECURITYHUB_POLICY [@ocaml.doc ""]
  | INSPECTOR_POLICY [@ocaml.doc ""]
  | UPGRADE_ROLLOUT_POLICY [@ocaml.doc ""]
  | BEDROCK_POLICY [@ocaml.doc ""]
  | S3_POLICY [@ocaml.doc ""]
  | NETWORK_SECURITY_DIRECTOR_POLICY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_effective_policy_validation_errors_response = {
  account_id : account_id option; [@ocaml.doc "The ID of the specified account.\n"]
  policy_type : effective_policy_type option;
      [@ocaml.doc
        "The specified policy type. One of the following values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  path : path option;
      [@ocaml.doc "The path in the organization where the specified account exists.\n"]
  evaluation_timestamp : timestamp option;
      [@ocaml.doc
        "The time when the latest effective policy was generated for the specified account.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
  effective_policy_validation_errors : effective_policy_validation_errors option;
      [@ocaml.doc
        "The [EffectivePolicyValidationError] object contains details about the validation errors \
         that occurred when generating or enforcing an effective policy, such as which policies \
         contributed to the error and location of the error.\n"]
}
[@@ocaml.doc ""]

type nonrec list_effective_policy_validation_errors_request = {
  account_id : account_id;
      [@ocaml.doc
        "The ID of the account that you want details about. Specifying an organization root or \
         organizational unit (OU) as the target is not supported.\n"]
  policy_type : effective_policy_type;
      [@ocaml.doc
        "The type of policy that you want information about. You can specify one of the following \
         values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec account_not_registered_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified account is not a delegated administrator for this Amazon Web Services service. \n"]

type nonrec delegated_service = {
  service_principal : service_principal option;
      [@ocaml.doc
        "The name of an Amazon Web Services service that can request an operation for the \
         specified service. This is typically in the form of a URL, such as: \n\
         {[\n\
        \ {i servicename}.amazonaws.com\n\
         ]}\n\
         .\n"]
  delegation_enabled_date : timestamp option;
      [@ocaml.doc "The date that the account became a delegated administrator for this service. \n"]
}
[@@ocaml.doc
  "Contains information about the Amazon Web Services service for which the account is a delegated \
   administrator.\n"]

type nonrec delegated_services = delegated_service list [@@ocaml.doc ""]

type nonrec list_delegated_services_for_account_response = {
  delegated_services : delegated_services option;
      [@ocaml.doc "The services for which the account is a delegated administrator.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_delegated_services_for_account_request = {
  account_id : account_id;
      [@ocaml.doc
        "The account ID number of a delegated administrator account in the organization.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec account_joined_method = INVITED [@ocaml.doc ""] | CREATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_state =
  | PENDING_ACTIVATION [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | PENDING_CLOSURE [@ocaml.doc ""]
  | CLOSED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_status =
  | ACTIVE [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
  | PENDING_CLOSURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec account_name = string [@@ocaml.doc ""]

type nonrec account_arn = string [@@ocaml.doc ""]

type nonrec delegated_administrator = {
  id : account_id option;
      [@ocaml.doc "The unique identifier (ID) of the delegated administrator's account.\n"]
  arn : account_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the delegated administrator's account.\n"]
  email : email option;
      [@ocaml.doc
        "The email address that is associated with the delegated administrator's Amazon Web \
         Services account.\n"]
  name : account_name option;
      [@ocaml.doc "The friendly name of the delegated administrator's account.\n"]
  status : account_status option;
      [@ocaml.doc "The status of the delegated administrator's account in the organization.\n"]
  state : account_state option;
      [@ocaml.doc
        "Each state represents a specific phase in the account lifecycle. Use this information to \
         manage account access, automate workflows, or trigger actions based on account state \
         changes.\n\n\
        \ For more information about account states and their implications, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_account_state.html}Monitor \
         the state of your Amazon Web Services accounts } in the {i Organizations User Guide}.\n\
        \ "]
  joined_method : account_joined_method option;
      [@ocaml.doc
        "The method by which the delegated administrator's account joined the organization.\n"]
  joined_timestamp : timestamp option;
      [@ocaml.doc
        "The date when the delegated administrator's account became a part of the organization.\n"]
  delegation_enabled_date : timestamp option;
      [@ocaml.doc "The date when the account was made a delegated administrator.\n"]
}
[@@ocaml.doc "Contains information about the delegated administrator.\n"]

type nonrec delegated_administrators = delegated_administrator list [@@ocaml.doc ""]

type nonrec list_delegated_administrators_response = {
  delegated_administrators : delegated_administrators option;
      [@ocaml.doc "The list of delegated administrators in your organization.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_delegated_administrators_request = {
  service_principal : service_principal option;
      [@ocaml.doc
        "Specifies a service principal name. If specified, then the operation lists the delegated \
         administrators only for the specified service.\n\n\
        \ If you don't specify a service principal, the operation lists all delegated \
         administrators for all services in your organization.\n\
        \ "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec create_account_failure_reason =
  | ACCOUNT_LIMIT_EXCEEDED [@ocaml.doc ""]
  | EMAIL_ALREADY_EXISTS [@ocaml.doc ""]
  | INVALID_ADDRESS [@ocaml.doc ""]
  | INVALID_EMAIL [@ocaml.doc ""]
  | CONCURRENT_ACCOUNT_MODIFICATION [@ocaml.doc ""]
  | INTERNAL_FAILURE [@ocaml.doc ""]
  | GOVCLOUD_ACCOUNT_ALREADY_EXISTS [@ocaml.doc ""]
  | MISSING_BUSINESS_VALIDATION [@ocaml.doc ""]
  | FAILED_BUSINESS_VALIDATION [@ocaml.doc ""]
  | PENDING_BUSINESS_VALIDATIONv [@ocaml.doc ""]
  | INVALID_IDENTITY_FOR_BUSINESS_VALIDATION [@ocaml.doc ""]
  | UNKNOWN_BUSINESS_VALIDATION [@ocaml.doc ""]
  | MISSING_PAYMENT_INSTRUMENT [@ocaml.doc ""]
  | INVALID_PAYMENT_INSTRUMENT [@ocaml.doc ""]
  | UPDATE_EXISTING_RESOURCE_POLICY_WITH_TAGS_NOT_SUPPORTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_account_state =
  | IN_PROGRESS [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_account_name = string [@@ocaml.doc ""]

type nonrec create_account_request_id = string [@@ocaml.doc ""]

type nonrec create_account_status = {
  id : create_account_request_id option;
      [@ocaml.doc
        "The unique identifier (ID) that references this request. You get this value from the \
         response of the initial [CreateAccount] request to create the account.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a create account request ID \
         string requires \"car-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \ "]
  account_name : create_account_name option;
      [@ocaml.doc "The account name given to the account when it was created.\n"]
  state : create_account_state option;
      [@ocaml.doc
        "The status of the asynchronous request to create an Amazon Web Services account.\n"]
  requested_timestamp : timestamp option;
      [@ocaml.doc "The date and time that the request was made for the account creation.\n"]
  completed_timestamp : timestamp option;
      [@ocaml.doc "The date and time that the account was created and the request completed.\n"]
  account_id : account_id option;
      [@ocaml.doc
        "If the account was created successfully, the unique identifier (ID) of the new account.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an account ID string requires \
         exactly 12 digits.\n\
        \ "]
  gov_cloud_account_id : account_id option;
      [@ocaml.doc
        "If the account was created successfully, the ID for the new account in the Amazon Web \
         Services GovCloud (US) Region.\n"]
  failure_reason : create_account_failure_reason option;
      [@ocaml.doc
        "If the request failed, a description of the reason for the failure.\n\n\
        \ {ul\n\
        \       {-  ACCOUNT_LIMIT_EXCEEDED: The account couldn't be created because you reached \
         the limit on the number of accounts in your organization.\n\
        \           \n\
        \            }\n\
        \       {-  CONCURRENT_ACCOUNT_MODIFICATION: You already submitted a request with the same \
         information.\n\
        \           \n\
        \            }\n\
        \       {-  EMAIL_ALREADY_EXISTS: The account could not be created because another Amazon \
         Web Services account with that email address already exists.\n\
        \           \n\
        \            }\n\
        \       {-  FAILED_BUSINESS_VALIDATION: The Amazon Web Services account that owns your \
         organization failed to receive business license validation.\n\
        \           \n\
        \            }\n\
        \       {-  GOVCLOUD_ACCOUNT_ALREADY_EXISTS: The account in the Amazon Web Services \
         GovCloud (US) Region could not be created because this Region already includes an account \
         with that email address.\n\
        \           \n\
        \            }\n\
        \       {-  IDENTITY_INVALID_BUSINESS_VALIDATION: The Amazon Web Services account that \
         owns your organization can't complete business license validation because it doesn't have \
         valid identity data.\n\
        \           \n\
        \            }\n\
        \       {-  INVALID_ADDRESS: The account could not be created because the address you \
         provided is not valid.\n\
        \           \n\
        \            }\n\
        \       {-  INVALID_EMAIL: The account could not be created because the email address you \
         provided is not valid.\n\
        \           \n\
        \            }\n\
        \       {-  INVALID_PAYMENT_INSTRUMENT: The Amazon Web Services account that owns your \
         organization does not have a supported payment method associated with the account. Amazon \
         Web Services does not support cards issued by financial institutions in Russia or \
         Belarus. For more information, see \
         {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/manage-general.html}Managing \
         your Amazon Web Services payments}.\n\
        \           \n\
        \            }\n\
        \       {-  INTERNAL_FAILURE: The account could not be created because of an internal \
         failure. Try again later. If the problem persists, contact Amazon Web Services Customer \
         Support.\n\
        \           \n\
        \            }\n\
        \       {-  MISSING_BUSINESS_VALIDATION: The Amazon Web Services account that owns your \
         organization has not received Business Validation.\n\
        \           \n\
        \            }\n\
        \       {-   MISSING_PAYMENT_INSTRUMENT: You must configure the management account with a \
         valid payment method, such as a credit card.\n\
        \           \n\
        \            }\n\
        \       {-  PENDING_BUSINESS_VALIDATION: The Amazon Web Services account that owns your \
         organization is still in the process of completing business license validation.\n\
        \           \n\
        \            }\n\
        \       {-  UNKNOWN_BUSINESS_VALIDATION: The Amazon Web Services account that owns your \
         organization has an unknown issue with business license validation.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Contains the status about a [CreateAccount] or [CreateGovCloudAccount] request to create an \
   Amazon Web Services account or an Amazon Web Services GovCloud (US) account in an organization.\n"]

type nonrec create_account_statuses = create_account_status list [@@ocaml.doc ""]

type nonrec list_create_account_status_response = {
  create_account_statuses : create_account_statuses option;
      [@ocaml.doc
        "A list of objects with details about the requests. Certain elements, such as the \
         accountId number, are present in the output only after the account has been successfully \
         created.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec create_account_states = create_account_state list [@@ocaml.doc ""]

type nonrec list_create_account_status_request = {
  states : create_account_states option;
      [@ocaml.doc
        "A list of one or more states that you want included in the response. If this parameter \
         isn't present, all requests are included in the response.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec child_type = ACCOUNT [@ocaml.doc ""] | ORGANIZATIONAL_UNIT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec child = {
  id : child_id option;
      [@ocaml.doc
        "The unique identifier (ID) of this child entity.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a child ID string requires one \
         of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Account} - A string that consists of exactly 12 digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that contains the OU). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  type_ : child_type option; [@ocaml.doc "The type of this child entity.\n"]
}
[@@ocaml.doc "Contains a list of child entities, either OUs or accounts.\n"]

type nonrec children = child list [@@ocaml.doc ""]

type nonrec list_children_response = {
  children : children option;
      [@ocaml.doc "The list of children of the specified parent container.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_children_request = {
  parent_id : parent_id;
      [@ocaml.doc
        "The unique identifier (ID) for the parent root or OU whose children you want to list.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a parent ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  child_type : child_type;
      [@ocaml.doc "Filters the output to include only the specified child type.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec enabled_service_principal = {
  service_principal : service_principal option;
      [@ocaml.doc
        "The name of the service principal. This is typically in the form of a URL, such as: \n\
         {[\n\
        \ {i servicename}.amazonaws.com\n\
         ]}\n\
         .\n"]
  date_enabled : timestamp option;
      [@ocaml.doc
        "The date that the service principal was enabled for integration with Organizations.\n"]
}
[@@ocaml.doc
  "A structure that contains details of a service principal that represents an Amazon Web Services \
   service that is enabled to integrate with Organizations.\n"]

type nonrec enabled_service_principals = enabled_service_principal list [@@ocaml.doc ""]

type nonrec list_aws_service_access_for_organization_response = {
  enabled_service_principals : enabled_service_principals option;
      [@ocaml.doc
        "A list of the service principals for the services that are enabled to integrate with your \
         organization. Each principal is a structure that includes the name and the date that it \
         was enabled for integration with Organizations.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_aws_service_access_for_organization_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec paths = path list [@@ocaml.doc ""]

type nonrec account = {
  id : account_id option;
      [@ocaml.doc
        "The unique identifier (ID) of the account.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an account ID string requires \
         exactly 12 digits.\n\
        \ "]
  arn : account_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the account.\n\n\
        \ For more information about ARNs in Organizations, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies}ARN \
         Formats Supported by Organizations} in the {i Amazon Web Services Service Authorization \
         Reference}.\n\
        \ "]
  email : email option;
      [@ocaml.doc
        "The email address associated with the Amazon Web Services account.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for this parameter is a string of \
         characters that represents a standard internet email address.\n\
        \ "]
  name : account_name option;
      [@ocaml.doc
        "The friendly name of the account.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of any of the characters in the ASCII character range.\n\
        \ "]
  status : account_status option;
      [@ocaml.doc
        "The status of the account in the organization.\n\n\
        \  The [Status] parameter in the [Account] object will be retired on September 9, 2026. \
         Although both the account [State] and account [Status] parameters are currently available \
         in the Organizations APIs ([DescribeAccount], [ListAccounts], [ListAccountsForParent]), \
         we recommend that you update your scripts or other code to use the [State] parameter \
         instead of [Status] before September 9, 2026.\n\
        \  \n\
        \   "]
  state : account_state option;
      [@ocaml.doc
        "Each state represents a specific phase in the account lifecycle. Use this information to \
         manage account access, automate workflows, or trigger actions based on account state \
         changes.\n\n\
        \ For more information about account states and their implications, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_account_state.html}Monitor \
         the state of your Amazon Web Services accounts } in the {i Organizations User Guide}.\n\
        \ "]
  paths : paths option; [@ocaml.doc "The paths in the organization where the account exists.\n"]
  joined_method : account_joined_method option;
      [@ocaml.doc "The method by which the account joined the organization.\n"]
  joined_timestamp : timestamp option;
      [@ocaml.doc "The date the account became a part of the organization.\n"]
}
[@@ocaml.doc
  "Contains information about an Amazon Web Services account that is a member of an organization.\n"]

type nonrec accounts = account list [@@ocaml.doc ""]

type nonrec list_accounts_with_invalid_effective_policy_response = {
  accounts : accounts option;
      [@ocaml.doc
        "The accounts in the organization which have an invalid effective policy for the specified \
         policy type.\n"]
  policy_type : effective_policy_type option;
      [@ocaml.doc
        "The specified policy type. One of the following values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_accounts_with_invalid_effective_policy_request = {
  policy_type : effective_policy_type;
      [@ocaml.doc
        "The type of policy that you want information about. You can specify one of the following \
         values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_accounts_for_parent_response = {
  accounts : accounts option;
      [@ocaml.doc
        "A list of the accounts in the specified root or OU.\n\n\
        \  The [Status] parameter in the API response will be retired on September 9, 2026. \
         Although both the account [State] and account [Status] parameters are currently available \
         in the Organizations APIs ([DescribeAccount], [ListAccounts], [ListAccountsForParent]), \
         we recommend that you update your scripts or other code to use the [State] parameter \
         instead of [Status] before September 9, 2026.\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_accounts_for_parent_request = {
  parent_id : parent_id;
      [@ocaml.doc
        "The unique identifier (ID) for the parent root or organization unit (OU) whose accounts \
         you want to list.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_accounts_response = {
  accounts : accounts option;
      [@ocaml.doc
        "A list of objects in the organization.\n\n\
        \  The [Status] parameter in the API response will be retired on September 9, 2026. \
         Although both the account [State] and account [Status] parameters are currently available \
         in the Organizations APIs ([DescribeAccount], [ListAccounts], [ListAccountsForParent]), \
         we recommend that you update your scripts or other code to use the [State] parameter \
         instead of [Status] before September 9, 2026.\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_accounts_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The parameter for receiving additional results if you receive a [NextToken] response in a \
         previous request. A [NextToken] response indicates that more output is available. Set \
         this parameter to the value of the previous call's [NextToken] response to indicate where \
         the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return in the response. If more results exist than the \
         specified [MaxResults] value, a token is included in the response so that you can \
         retrieve the remaining results.\n"]
}
[@@ocaml.doc ""]

type nonrec handshake_constraint_violation_exception_reason =
  | ACCOUNT_NUMBER_LIMIT_EXCEEDED [@ocaml.doc ""]
  | HANDSHAKE_RATE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | ALREADY_IN_AN_ORGANIZATION [@ocaml.doc ""]
  | ORGANIZATION_ALREADY_HAS_ALL_FEATURES [@ocaml.doc ""]
  | ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION [@ocaml.doc ""]
  | INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES [@ocaml.doc ""]
  | PAYMENT_INSTRUMENT_REQUIRED [@ocaml.doc ""]
  | ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD [@ocaml.doc ""]
  | ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED [@ocaml.doc ""]
  | MANAGEMENT_ACCOUNT_EMAIL_NOT_VERIFIED [@ocaml.doc ""]
  | RESPONSIBILITY_TRANSFER_ALREADY_EXISTS [@ocaml.doc ""]
  | SOURCE_AND_TARGET_CANNOT_MATCH [@ocaml.doc ""]
  | UNUSED_PREPAYMENT_BALANCE [@ocaml.doc ""]
  | LEGACY_PERMISSIONS_STILL_IN_USE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec handshake_constraint_violation_exception = {
  message : exception_message option; [@ocaml.doc ""]
  reason : handshake_constraint_violation_exception_reason option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested operation would violate the constraint identified in the reason code.\n\n\
  \  Some of the reasons in the following list might not be applicable to this specific API or \
   operation:\n\
  \  \n\
  \    {ul\n\
  \          {-  ACCOUNT_NUMBER_LIMIT_EXCEEDED: You attempted to exceed the limit on the number of \
   accounts in an organization. Note that deleted and closed accounts still count toward your \
   limit.\n\
  \              \n\
  \                If you get this exception immediately after creating the organization, wait one \
   hour and try again. If after an hour it continues to fail with this error, contact \
   {{:https://console.aws.amazon.com/support/home#/}Amazon Web Services Support}.\n\
  \                \n\
  \                  }\n\
  \          {-  ALREADY_IN_AN_ORGANIZATION: The handshake request is invalid because the invited \
   account is already a member of an organization.\n\
  \              \n\
  \               }\n\
  \          {-  HANDSHAKE_RATE_LIMIT_EXCEEDED: You attempted to exceed the number of handshakes \
   that you can send in one day.\n\
  \              \n\
  \               }\n\
  \          {-  INVITE_DISABLED_DURING_ENABLE_ALL_FEATURES: You can't issue new invitations to \
   join an organization while it's in the process of enabling all features. You can resume \
   inviting accounts after you finalize the process when all accounts have agreed to the change.\n\
  \              \n\
  \               }\n\
  \          {-  LEGACY_PERMISSIONS_STILL_IN_USE: Your organization must migrate to use the new \
   IAM fine-grained actions for billing, cost management, and accounts.\n\
  \              \n\
  \               }\n\
  \          {-  ORGANIZATION_ALREADY_HAS_ALL_FEATURES: The handshake request is invalid because \
   the organization has already enabled all features.\n\
  \              \n\
  \               }\n\
  \          {-  ORGANIZATION_FROM_DIFFERENT_SELLER_OF_RECORD: The request failed because the \
   account is from a different marketplace than the accounts in the organization.\n\
  \              \n\
  \               }\n\
  \          {-  ORGANIZATION_IS_ALREADY_PENDING_ALL_FEATURES_MIGRATION: The handshake request is \
   invalid because the organization has already started the process to enable all features.\n\
  \              \n\
  \               }\n\
  \          {-  ORGANIZATION_MEMBERSHIP_CHANGE_RATE_LIMIT_EXCEEDED: You attempted to change the \
   membership of an account too quickly after its previous change.\n\
  \              \n\
  \               }\n\
  \          {-  PAYMENT_INSTRUMENT_REQUIRED: You can't complete the operation with an account \
   that doesn't have a payment instrument, such as a credit card, associated with it.\n\
  \              \n\
  \               }\n\
  \          {-  RESPONSIBILITY_TRANSFER_ALREADY_EXISTS: You cannot perform this operation with \
   the current transfer.\n\
  \              \n\
  \               }\n\
  \          {-  SOURCE_AND_TARGET_CANNOT_MATCH: An account can't accept a transfer invitation if \
   it is both the sender and recipient of the invitation.\n\
  \              \n\
  \               }\n\
  \          {-  UNUSED_PREPAYMENT_BALANCE: Your organization has an outstanding pre-payment \
   balance.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

type nonrec duplicate_handshake_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "A handshake with the same action and target already exists. For example, if you invited an \
   account to join your organization, the invited account might already have a pending invitation \
   from this organization. If you intend to resend an invitation to an account, ensure that \
   existing handshakes that might be considered duplicates are canceled or declined.\n"]

type nonrec invite_organization_to_transfer_responsibility_response = {
  handshake : handshake option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec handshake_notes = string [@@ocaml.doc ""]

type nonrec invite_organization_to_transfer_responsibility_request = {
  type_ : responsibility_transfer_type;
      [@ocaml.doc
        "The type of responsibility you want to designate to your organization. Currently, only \
         [BILLING] is supported.\n"]
  target : handshake_party;
      [@ocaml.doc
        "A [HandshakeParty] object. Contains details for the account you want to invite. \
         Currently, only [ACCOUNT] and [EMAIL] are supported.\n"]
  notes : handshake_notes option;
      [@ocaml.doc "Additional information that you want to include in the invitation.\n"]
  start_timestamp : timestamp;
      [@ocaml.doc
        "Timestamp when the recipient will begin managing the specified responsibilities.\n"]
  source_name : responsibility_transfer_name;
      [@ocaml.doc "Name you want to assign to the transfer.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of tags that you want to attach to the transfer. For each tag in the list, you \
         must specify both a tag key and a value. You can set the value to an empty string, but \
         you can't set it to [null]. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html}Tagging \
         Organizations resources} in the Organizations User Guide.\n\n\
        \  Any tags in the request are checked for compliance with any applicable tag policies \
         when the request is made. The request is rejected if the tags in the request don't match \
         the requirements of the policy at that time. Tag policy compliance is {i  {b not} } \
         checked again when the invitation is accepted and the tags are actually attached to the \
         transfer. That means that if the tag policy changes between the invitation and the \
         acceptance, then that tags could potentially be non-compliant.\n\
        \  \n\
        \     If any one of the tags is not valid or if you exceed the allowed number of tags for \
         a transfer, then the entire request fails and invitations are not sent.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec finalizing_organization_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Organizations couldn't perform the operation because your organization hasn't finished \
   initializing. This can take up to an hour. Try again later. If after one hour you continue to \
   receive this error, contact {{:https://console.aws.amazon.com/support/home#/}Amazon Web \
   Services Support}.\n"]

type nonrec account_owner_not_verified_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You can't invite an existing account to your organization until you verify that you own the \
   email address associated with the management account. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_create.html#about-email-verification}Email \
   address verification} in the {i Organizations User Guide}.\n"]

type nonrec invite_account_to_organization_response = {
  handshake : handshake option;
      [@ocaml.doc
        "A structure that contains details about the handshake that is created to support this \
         invitation request.\n"]
}
[@@ocaml.doc ""]

type nonrec invite_account_to_organization_request = {
  target : handshake_party;
      [@ocaml.doc
        "The identifier (ID) of the Amazon Web Services account that you want to invite to join \
         your organization. This is a JSON object that contains the following elements:\n\n\
        \  \n\
        \ {[\n\
        \ \\{ \"Type\": \"ACCOUNT\", \"Id\": \"<{i  {b account id number} }>\" \\}\n\
        \ ]}\n\
        \  \n\
        \ \n\
        \  If you use the CLI, you can submit this as a single string, similar to the following \
         example:\n\
        \  \n\
        \    [--target Id=123456789012,Type=ACCOUNT] \n\
        \   \n\
        \    If you specify [\"Type\": \"ACCOUNT\"], you must provide the Amazon Web Services \
         account ID number as the [Id]. If you specify [\"Type\": \"EMAIL\"], you must specify the \
         email address that is associated with the account.\n\
        \    \n\
        \      [--target Id=diego@example.com,Type=EMAIL] \n\
        \     "]
  notes : handshake_notes option;
      [@ocaml.doc
        "Additional information that you want to include in the generated email to the recipient \
         account owner.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of tags that you want to attach to the account when it becomes a member of the \
         organization. For each tag in the list, you must specify both a tag key and a value. You \
         can set the value to an empty string, but you can't set it to [null]. For more \
         information about tagging, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html}Tagging \
         Organizations resources} in the Organizations User Guide.\n\n\
        \  Any tags in the request are checked for compliance with any applicable tag policies \
         when the request is made. The request is rejected if the tags in the request don't match \
         the requirements of the policy at that time. Tag policy compliance is {i  {b not} } \
         checked again when the invitation is accepted and the tags are actually attached to the \
         account. That means that if the tag policy changes between the invitation and the \
         acceptance, then that tags could potentially be non-compliant.\n\
        \  \n\
        \     If any one of the tags is not valid or if you exceed the allowed number of tags for \
         an account, then the entire request fails and invitations are not sent.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc ""]

type nonrec root_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "We can't find a root with the [RootId] that you specified.\n"]

type nonrec policy_type_not_available_for_organization_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You can't use the specified policy type with the feature set currently enabled for this \
   organization. For example, you can enable SCPs only after you enable all features in the \
   organization. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html#enable_policies_on_root}Managing \
   Organizations policies}in the {i Organizations User Guide}.\n"]

type nonrec policy_type_already_enabled_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified policy type is already enabled in the specified root.\n"]

type nonrec enable_policy_type_response = {
  root : root option;
      [@ocaml.doc
        "A structure that shows the root with the updated list of enabled policy types.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_policy_type_request = {
  root_id : root_id;
      [@ocaml.doc
        "ID for the root in which you want to enable a policy type. You can get the ID from the \
         [ListRoots] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a root ID string requires \
         \"r-\" followed by from 4 to 32 lowercase letters or digits.\n\
        \ "]
  policy_type : policy_type;
      [@ocaml.doc
        "The policy type that you want to enable. You can specify one of the following values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html}SERVICE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps.html}RESOURCE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec enable_aws_service_access_request = {
  service_principal : service_principal;
      [@ocaml.doc
        "The service principal name of the Amazon Web Services service for which you want to \
         enable integration with your organization. This is typically in the form of a URL, such \
         as \n\
         {[\n\
        \ {i service-abbreviation}.amazonaws.com\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec enable_all_features_response = {
  handshake : handshake option;
      [@ocaml.doc
        "A structure that contains details about the handshake created to support this request to \
         enable all features in the organization.\n"]
}
[@@ocaml.doc ""]

type nonrec enable_all_features_request = unit [@@ocaml.doc ""]

type nonrec policy_type_not_enabled_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified policy type isn't currently enabled in this root. You can't attach policies of \
   the specified type to entities in a root until you enable that type in the root. For more \
   information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html}Enabling \
   all features in your organization} in the {i Organizations User Guide}.\n"]

type nonrec disable_policy_type_response = {
  root : root option;
      [@ocaml.doc
        "A structure that shows the root with the updated list of enabled policy types.\n"]
}
[@@ocaml.doc ""]

type nonrec disable_policy_type_request = {
  root_id : root_id;
      [@ocaml.doc
        "ID for the root in which you want to disable a policy type. You can get the ID from the \
         [ListRoots] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a root ID string requires \
         \"r-\" followed by from 4 to 32 lowercase letters or digits.\n\
        \ "]
  policy_type : policy_type;
      [@ocaml.doc
        "The policy type that you want to disable in this root. You can specify one of the \
         following values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html}SERVICE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps.html}RESOURCE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec disable_aws_service_access_request = {
  service_principal : service_principal;
      [@ocaml.doc
        "The service principal name of the Amazon Web Services service for which you want to \
         disable integration with your organization. This is typically in the form of a URL, such \
         as \n\
         {[\n\
        \ {i service-abbreviation}.amazonaws.com\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec policy_not_attached_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The policy isn't attached to the specified target in the specified root.\n"]

type nonrec detach_policy_request = {
  policy_id : policy_id;
      [@ocaml.doc
        "ID for the policy you want to detach. You can get the ID from the [ListPolicies] or \
         [ListPoliciesForTarget] operations.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a policy ID string requires \
         \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the \
         underscore character (_).\n\
        \ "]
  target_id : policy_target_id;
      [@ocaml.doc
        "ID for the root, OU, or account that you want to detach the policy from. You can get the \
         ID from the [ListRoots], [ListOrganizationalUnitsForParent], or [ListAccounts] \
         operations.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a target ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Account} - A string that consists of exactly 12 digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_responsibility_transfer_response = {
  responsibility_transfer : responsibility_transfer option;
      [@ocaml.doc "A [ResponsibilityTransfer] object. Contains details for a transfer.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_responsibility_transfer_request = {
  id : responsibility_transfer_id; [@ocaml.doc "ID for the transfer.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_policy_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "We can't find a resource policy request with the parameter that you specified.\n"]

type nonrec describe_resource_policy_response = {
  resource_policy : resource_policy option;
      [@ocaml.doc "A structure that contains details about the resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_policy_response = {
  policy : policy option;
      [@ocaml.doc "A structure that contains details about the specified policy.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_policy_request = {
  policy_id : policy_id;
      [@ocaml.doc
        "ID for the policy that you want details about. You can get the ID from the [ListPolicies] \
         or [ListPoliciesForTarget] operations.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a policy ID string requires \
         \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the \
         underscore character (_).\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_organizational_unit_response = {
  organizational_unit : organizational_unit option;
      [@ocaml.doc "A structure that contains details about the specified OU.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_organizational_unit_request = {
  organizational_unit_id : organizational_unit_id;
      [@ocaml.doc
        "ID for the organizational unit that you want details about. You can get the ID from the \
         [ListOrganizationalUnitsForParent] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an organizational unit ID \
         string requires \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of \
         the root that contains the OU). This string is followed by a second \"-\" dash and from 8 \
         to 32 additional lowercase letters or digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec organization_feature_set = ALL [@ocaml.doc ""] | CONSOLIDATED_BILLING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec organization_arn = string [@@ocaml.doc ""]

type nonrec organization_id = string [@@ocaml.doc ""]

type nonrec organization = {
  id : organization_id option;
      [@ocaml.doc
        "The unique identifier (ID) of an organization.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an organization ID string \
         requires \"o-\" followed by from 10 to 32 lowercase letters or digits.\n\
        \ "]
  arn : organization_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an organization.\n\n\
        \ For more information about ARNs in Organizations, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies}ARN \
         Formats Supported by Organizations} in the {i Amazon Web Services Service Authorization \
         Reference}.\n\
        \ "]
  feature_set : organization_feature_set option;
      [@ocaml.doc
        "Specifies the functionality that currently is available to the organization. If set to \
         \"ALL\", then all features are enabled and policies can be applied to accounts in the \
         organization. If set to \"CONSOLIDATED_BILLING\", then only consolidated billing \
         functionality is available. For more information, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html}Enabling \
         all features in your organization} in the {i Organizations User Guide}.\n"]
  master_account_arn : account_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the account that is designated as the management \
         account for the organization.\n\n\
        \ For more information about ARNs in Organizations, see \
         {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsorganizations.html#awsorganizations-resources-for-iam-policies}ARN \
         Formats Supported by Organizations} in the {i Amazon Web Services Service Authorization \
         Reference}.\n\
        \ "]
  master_account_id : account_id option;
      [@ocaml.doc
        "The unique identifier (ID) of the management account of an organization.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an account ID string requires \
         exactly 12 digits.\n\
        \ "]
  master_account_email : email option;
      [@ocaml.doc
        "The email address that is associated with the Amazon Web Services account that is \
         designated as the management account for the organization.\n"]
  available_policy_types : policy_types option;
      [@ocaml.doc
        " Do not use. This field is deprecated and doesn't provide complete information about the \
         policies in your organization.\n\
        \ \n\
        \   To determine the policies that are enabled and available for use in your organization, \
         use the [ListRoots] operation instead.\n\
        \   "]
}
[@@ocaml.doc
  "Contains details about an organization. An organization is a collection of accounts that are \
   centrally managed together using consolidated billing, organized hierarchically with \
   organizational units (OUs), and controlled with policies .\n"]

type nonrec describe_organization_response = {
  organization : organization option;
      [@ocaml.doc
        "A structure that contains information about the organization.\n\n\
        \  The [AvailablePolicyTypes] part of the response is deprecated, and you shouldn't use it \
         in your apps. It doesn't include any policy type supported by Organizations other than \
         SCPs. In the China (Ningxia) Region, no policy type is included. To determine which \
         policy types are enabled in your organization, use the \n\
        \  {[\n\
        \   [ListRoots] \n\
        \  ]}\n\
        \   operation.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec handshake_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "We can't find a handshake with the [HandshakeId] that you specified.\n"]

type nonrec describe_handshake_response = {
  handshake : handshake option;
      [@ocaml.doc "A [Handshake] object. Contains details for the handshake.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_handshake_request = {
  handshake_id : handshake_id;
      [@ocaml.doc
        "ID for the handshake that you want information about.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for handshake ID string requires \
         \"h-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec effective_policy = {
  policy_content : policy_content option; [@ocaml.doc "The text content of the policy.\n"]
  last_updated_timestamp : timestamp option;
      [@ocaml.doc "The time of the last update to this policy.\n"]
  target_id : policy_target_id option; [@ocaml.doc "The account ID of the policy target. \n"]
  policy_type : effective_policy_type option; [@ocaml.doc "The policy type.\n"]
}
[@@ocaml.doc
  "Contains rules to be applied to the affected accounts. The effective policy is the aggregation \
   of any policies the account inherits, plus any policy directly attached to the account.\n"]

type nonrec describe_effective_policy_response = {
  effective_policy : effective_policy option; [@ocaml.doc "The contents of the effective policy.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_effective_policy_request = {
  policy_type : effective_policy_type;
      [@ocaml.doc
        "The type of policy that you want information about. You can specify one of the following \
         values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  target_id : policy_target_id option;
      [@ocaml.doc
        "When you're signed in as the management account, specify the ID of the account that you \
         want details about. Specifying an organization root or organizational unit (OU) as the \
         target is not supported.\n"]
}
[@@ocaml.doc ""]

type nonrec create_account_status_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "We can't find an create account request with the [CreateAccountRequestId] that you specified.\n"]

type nonrec describe_create_account_status_response = {
  create_account_status : create_account_status option;
      [@ocaml.doc "A structure that contains the current status of an account creation request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_create_account_status_request = {
  create_account_request_id : create_account_request_id;
      [@ocaml.doc
        "Specifies the [Id] value that uniquely identifies the [CreateAccount] request. You can \
         get the value from the [CreateAccountStatus.Id] response in an earlier [CreateAccount] \
         request, or from the [ListCreateAccountStatus] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a create account request ID \
         string requires \"car-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec describe_account_response = {
  account : account option;
      [@ocaml.doc
        "A structure that contains information about the requested account.\n\n\
        \  The [Status] parameter in the API response will be retired on September 9, 2026. \
         Although both the account [State] and account [Status] parameters are currently available \
         in the Organizations APIs ([DescribeAccount], [ListAccounts], [ListAccountsForParent]), \
         we recommend that you update your scripts or other code to use the [State] parameter \
         instead of [Status] before September 9, 2026.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec describe_account_request = {
  account_id : account_id;
      [@ocaml.doc
        "The unique identifier (ID) of the Amazon Web Services account that you want information \
         about. You can get the ID from the [ListAccounts] or [ListAccountsForParent] operations.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an account ID string requires \
         exactly 12 digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec deregister_delegated_administrator_request = {
  account_id : account_id;
      [@ocaml.doc
        "The account ID number of the member account in the organization that you want to \
         deregister as a delegated administrator.\n"]
  service_principal : service_principal;
      [@ocaml.doc
        "The service principal name of an Amazon Web Services service for which the account is a \
         delegated administrator.\n\n\
        \ Delegated administrator privileges are revoked for only the specified Amazon Web \
         Services service from the member account. If the specified service is the only service \
         for which the member account is a delegated administrator, the operation also revokes \
         Organizations read action permissions.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec policy_in_use_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The policy is attached to one or more entities. You must detach it from all roots, OUs, and \
   accounts before performing this operation.\n"]

type nonrec delete_policy_request = {
  policy_id : policy_id;
      [@ocaml.doc
        "ID for the policy that you want to delete. You can get the ID from the [ListPolicies] or \
         [ListPoliciesForTarget] operations.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a policy ID string requires \
         \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the \
         underscore character (_).\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec organizational_unit_not_empty_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified OU is not empty. Move all accounts to another root or to other OUs, remove all \
   child OUs, and try the operation again.\n"]

type nonrec delete_organizational_unit_request = {
  organizational_unit_id : organizational_unit_id;
      [@ocaml.doc
        "ID for the organizational unit that you want to delete. You can get the ID from the \
         [ListOrganizationalUnitsForParent] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for an organizational unit ID \
         string requires \"ou-\" followed by from 4 to 32 lowercase letters or digits (the ID of \
         the root that contains the OU). This string is followed by a second \"-\" dash and from 8 \
         to 32 additional lowercase letters or digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec organization_not_empty_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The organization isn't empty. To delete an organization, you must first remove all accounts \
   except the management account.\n"]

type nonrec invalid_handshake_transition_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "You can't perform the operation on the handshake in its current state. For example, you can't \
   cancel a handshake that was already accepted or accept a handshake that was already declined.\n"]

type nonrec handshake_already_in_state_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified handshake is already in the requested state. For example, you can't accept a \
   handshake that was already accepted.\n"]

type nonrec decline_handshake_response = {
  handshake : handshake option;
      [@ocaml.doc "A [Handshake] object. Contains details for the declined handshake.\n"]
}
[@@ocaml.doc ""]

type nonrec decline_handshake_request = {
  handshake_id : handshake_id;
      [@ocaml.doc
        "ID for the handshake that you want to decline. You can get the ID from the \
         [ListHandshakesForAccount] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for handshake ID string requires \
         \"h-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_policy_response = {
  policy : policy option;
      [@ocaml.doc "A structure that contains details about the newly created policy.\n"]
}
[@@ocaml.doc ""]

type nonrec create_policy_request = {
  content : policy_content;
      [@ocaml.doc
        "The policy text content to add to the new policy. The text that you supply must adhere to \
         the rules of the policy type you specify in the [Type] parameter. \n\n\
        \ The maximum size of a policy document depends on the policy's type. For more \
         information, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html#min-max-values}Maximum \
         and minimum values} in the {i Organizations User Guide}.\n\
        \ "]
  description : policy_description;
      [@ocaml.doc "An optional description to assign to the policy.\n"]
  name : policy_name;
      [@ocaml.doc
        "The friendly name to assign to the policy.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter is a string of any of the characters in the ASCII character range.\n\
        \ "]
  type_ : policy_type;
      [@ocaml.doc
        "The type of policy to create. You can specify one of the following values:\n\n\
        \ {ul\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html}SERVICE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps.html}RESOURCE_CONTROL_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_declarative.html}DECLARATIVE_POLICY_EC2} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html}BACKUP_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html}TAG_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_chatbot.html}CHATBOT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html}AISERVICES_OPT_OUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_security_hub.html}SECURITYHUB_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_upgrade_rollout.html}UPGRADE_ROLLOUT_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inspector.html}INSPECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_bedrock.html}BEDROCK_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_s3.html}S3_POLICY} \n\
        \           \n\
        \            }\n\
        \       {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_network_security_director.html}NETWORK_SECURITY_DIRECTOR_POLICY} \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tags option;
      [@ocaml.doc
        "A list of tags that you want to attach to the newly created policy. For each tag in the \
         list, you must specify both a tag key and a value. You can set the value to an empty \
         string, but you can't set it to [null]. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html}Tagging \
         Organizations resources} in the Organizations User Guide.\n\n\
        \  If any one of the tags is not valid or if you exceed the allowed number of tags for a \
         policy, then the entire request fails and the policy is not created.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_organizational_unit_response = {
  organizational_unit : organizational_unit option;
      [@ocaml.doc "A structure that contains details about the newly created OU.\n"]
}
[@@ocaml.doc ""]

type nonrec create_organizational_unit_request = {
  parent_id : parent_id;
      [@ocaml.doc
        "ID for the parent root or OU that you want to create the new OU in.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a parent ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  name : organizational_unit_name; [@ocaml.doc "The friendly name to assign to the new OU.\n"]
  tags : tags option;
      [@ocaml.doc
        "A list of tags that you want to attach to the newly created OU. For each tag in the list, \
         you must specify both a tag key and a value. You can set the value to an empty string, \
         but you can't set it to [null]. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html}Tagging \
         Organizations resources} in the Organizations User Guide.\n\n\
        \  If any one of the tags is not valid or if you exceed the allowed number of tags for an \
         OU, then the entire request fails and the OU is not created.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec already_in_organization_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "This account is already a member of an organization. An account can belong to only one \
   organization at a time.\n"]

type nonrec access_denied_for_dependency_exception_reason =
  | ACCESS_DENIED_DURING_CREATE_SERVICE_LINKED_ROLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_denied_for_dependency_exception = {
  message : exception_message option; [@ocaml.doc ""]
  reason : access_denied_for_dependency_exception_reason option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The operation that you attempted requires you to have the [iam:CreateServiceLinkedRole] for \
   [organizations.amazonaws.com] permission so that Organizations can create the required \
   service-linked role. You don't have that permission.\n"]

type nonrec create_organization_response = {
  organization : organization option;
      [@ocaml.doc "A structure that contains details about the newly created organization.\n"]
}
[@@ocaml.doc ""]

type nonrec create_organization_request = {
  feature_set : organization_feature_set option;
      [@ocaml.doc
        "Specifies the feature set supported by the new organization. Each feature set supports \
         different levels of functionality.\n\n\
        \ {ul\n\
        \       {-   [CONSOLIDATED_BILLING]: All member accounts have their bills consolidated to \
         and paid by the management account. For more information, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set-cb-only}Consolidated \
         billing} in the {i Organizations User Guide}.\n\
        \           \n\
        \             The consolidated billing feature subset isn't available for organizations in \
         the Amazon Web Services GovCloud (US) Region.\n\
        \            \n\
        \             }\n\
        \       {-   [ALL]: In addition to all the features supported by the consolidated billing \
         feature set, the management account can also apply any policy type to any member account \
         in the organization. For more information, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#feature-set-all}All \
         features} in the {i Organizations User Guide}.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec create_gov_cloud_account_response = {
  create_account_status : create_account_status option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec iam_user_access_to_billing = ALLOW [@ocaml.doc ""] | DENY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec role_name = string [@@ocaml.doc ""]

type nonrec create_gov_cloud_account_request = {
  email : email;
      [@ocaml.doc
        "Specifies the email address of the owner to assign to the new member account in the \
         commercial Region. This email address must not already be associated with another Amazon \
         Web Services account. You must use a valid email address to complete account creation.\n\n\
        \ The rules for a valid email address:\n\
        \ \n\
        \  {ul\n\
        \        {-  The address must be a minimum of 6 and a maximum of 64 characters long.\n\
        \            \n\
        \             }\n\
        \        {-  All characters must be 7-bit ASCII characters.\n\
        \            \n\
        \             }\n\
        \        {-  There must be one and only one \\@ symbol, which separates the local name \
         from the domain name.\n\
        \            \n\
        \             }\n\
        \        {-  The local name can't contain any of the following characters:\n\
        \            \n\
        \             whitespace, \" ' ( ) < > \\[ \\] : ; , \\ | % &\n\
        \             \n\
        \              }\n\
        \        {-  The local name can't begin with a dot (.)\n\
        \            \n\
        \             }\n\
        \        {-  The domain name can consist of only the characters \
         \\[a-z\\],\\[A-Z\\],\\[0-9\\], hyphen (-), or dot (.)\n\
        \            \n\
        \             }\n\
        \        {-  The domain name can't begin or end with a hyphen (-) or dot (.)\n\
        \            \n\
        \             }\n\
        \        {-  The domain name must contain at least one dot\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can't access the root user of the account or remove an account that was created \
         with an invalid email address. Like all request parameters for [CreateGovCloudAccount], \
         the request for the email address for the Amazon Web Services GovCloud (US) account \
         originates from the commercial Region, not from the Amazon Web Services GovCloud (US) \
         Region.\n\
        \   "]
  account_name : create_account_name;
      [@ocaml.doc
        "The friendly name of the member account. \n\n\
        \ The account name can consist of only the characters \\[a-z\\],\\[A-Z\\],\\[0-9\\], \
         hyphen (-), or dot (.) You can't separate characters with a dash (\226\128\147).\n\
        \ "]
  role_name : role_name option;
      [@ocaml.doc
        "(Optional)\n\n\
        \ The name of an IAM role that Organizations automatically preconfigures in the new member \
         accounts in both the Amazon Web Services GovCloud (US) Region and in the commercial \
         Region. This role trusts the management account, allowing users in the management account \
         to assume the role, as permitted by the management account administrator. The role has \
         administrator permissions in the new member account.\n\
        \ \n\
        \  If you don't specify this parameter, the role name defaults to \
         [OrganizationAccountAccessRole].\n\
        \  \n\
        \   For more information about how to use this role to access the member account, see the \
         following links:\n\
        \   \n\
        \    {ul\n\
        \          {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_create-cross-account-role}Creating \
         the OrganizationAccountAccessRole in an invited member account} in the {i Organizations \
         User Guide} \n\
        \              \n\
        \               }\n\
        \          {-  Steps 2 and 3 in \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html}IAM \
         Tutorial: Delegate access across Amazon Web Services accounts using IAM roles} in the {i \
         IAM User Guide} \n\
        \              \n\
        \               }\n\
        \          }\n\
        \   The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter. The pattern can include uppercase letters, lowercase letters, digits with no \
         spaces, and any of the following characters: =,.\\@-\n\
        \   "]
  iam_user_access_to_billing : iam_user_access_to_billing option;
      [@ocaml.doc
        "If set to [ALLOW], the new linked account in the commercial Region enables IAM users to \
         access account billing information {i if} they have the required permissions. If set to \
         [DENY], only the root user of the new account can access account billing information. For \
         more information, see \
         {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate}About \
         IAM access to the Billing and Cost Management console} in the {i Amazon Web Services \
         Billing and Cost Management User Guide}.\n\n\
        \ If you don't specify this parameter, the value defaults to [ALLOW], and IAM users and \
         roles with the required permissions can access billing information for the new account.\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "A list of tags that you want to attach to the newly created account. These tags are \
         attached to the commercial account associated with the GovCloud account, and not to the \
         GovCloud account itself. To add tags to the actual GovCloud account, call the \
         [TagResource] operation in the GovCloud region after the new GovCloud account exists.\n\n\
        \ For each tag in the list, you must specify both a tag key and a value. You can set the \
         value to an empty string, but you can't set it to [null]. For more information about \
         tagging, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html}Tagging \
         Organizations resources} in the Organizations User Guide.\n\
        \ \n\
        \   If any one of the tags is not valid or if you exceed the maximum allowed number of \
         tags for an account, then the entire request fails and the account is not created.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec create_account_response = {
  create_account_status : create_account_status option;
      [@ocaml.doc
        "A structure that contains details about the request to create an account. This response \
         structure might not be fully populated when you first receive it because account creation \
         is an asynchronous process. You can pass the returned [CreateAccountStatus] ID as a \
         parameter to [DescribeCreateAccountStatus] to get status about the progress of the \
         request at later times. You can also check the CloudTrail log for the \
         [CreateAccountResult] event. For more information, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_security_incident-response.html}Logging \
         and monitoring in Organizations} in the {i Organizations User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec create_account_request = {
  email : email;
      [@ocaml.doc
        "The email address of the owner to assign to the new member account. This email address \
         must not already be associated with another Amazon Web Services account. You must use a \
         valid email address to complete account creation.\n\n\
        \ The rules for a valid email address:\n\
        \ \n\
        \  {ul\n\
        \        {-  The address must be a minimum of 6 and a maximum of 64 characters long.\n\
        \            \n\
        \             }\n\
        \        {-  All characters must be 7-bit ASCII characters.\n\
        \            \n\
        \             }\n\
        \        {-  There must be one and only one \\@ symbol, which separates the local name \
         from the domain name.\n\
        \            \n\
        \             }\n\
        \        {-  The local name can't contain any of the following characters:\n\
        \            \n\
        \             whitespace, \" ' ( ) < > \\[ \\] : ; , \\ | % &\n\
        \             \n\
        \              }\n\
        \        {-  The local name can't begin with a dot (.)\n\
        \            \n\
        \             }\n\
        \        {-  The domain name can consist of only the characters \
         \\[a-z\\],\\[A-Z\\],\\[0-9\\], hyphen (-), or dot (.)\n\
        \            \n\
        \             }\n\
        \        {-  The domain name can't begin or end with a hyphen (-) or dot (.)\n\
        \            \n\
        \             }\n\
        \        {-  The domain name must contain at least one dot\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can't access the root user of the account or remove an account that was created \
         with an invalid email address.\n\
        \   "]
  account_name : create_account_name; [@ocaml.doc "The friendly name of the member account.\n"]
  role_name : role_name option;
      [@ocaml.doc
        "The name of an IAM role that Organizations automatically preconfigures in the new member \
         account. This role trusts the management account, allowing users in the management \
         account to assume the role, as permitted by the management account administrator. The \
         role has administrator permissions in the new member account.\n\n\
        \ If you don't specify this parameter, the role name defaults to \
         [OrganizationAccountAccessRole].\n\
        \ \n\
        \  For more information about how to use this role to access the member account, see the \
         following links:\n\
        \  \n\
        \   {ul\n\
        \         {-   \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_create-cross-account-role}Creating \
         the OrganizationAccountAccessRole in an invited member account} in the {i Organizations \
         User Guide} \n\
        \             \n\
        \              }\n\
        \         {-  Steps 2 and 3 in \
         {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html}IAM \
         Tutorial: Delegate access across Amazon Web Services accounts using IAM roles} in the {i \
         IAM User Guide} \n\
        \             \n\
        \              }\n\
        \         }\n\
        \   The {{:http://wikipedia.org/wiki/regex}regex pattern} that is used to validate this \
         parameter. The pattern can include uppercase letters, lowercase letters, digits with no \
         spaces, and any of the following characters: =,.\\@-\n\
        \   "]
  iam_user_access_to_billing : iam_user_access_to_billing option;
      [@ocaml.doc
        "If set to [ALLOW], the new account enables IAM users to access account billing \
         information {i if} they have the required permissions. If set to [DENY], only the root \
         user of the new account can access account billing information. For more information, see \
         {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate}About \
         IAM access to the Billing and Cost Management console} in the {i Amazon Web Services \
         Billing and Cost Management User Guide}.\n\n\
        \ If you don't specify this parameter, the value defaults to [ALLOW], and IAM users and \
         roles with the required permissions can access billing information for the new account.\n\
        \ "]
  tags : tags option;
      [@ocaml.doc
        "A list of tags that you want to attach to the newly created account. For each tag in the \
         list, you must specify both a tag key and a value. You can set the value to an empty \
         string, but you can't set it to [null]. For more information about tagging, see \
         {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_tagging.html}Tagging \
         Organizations resources} in the Organizations User Guide.\n\n\
        \  If any one of the tags is not valid or if you exceed the maximum allowed number of tags \
         for an account, then the entire request fails and the account is not created.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec conflict_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The request failed because it conflicts with the current state of the specified resource.\n"]

type nonrec account_already_closed_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You attempted to close an account that is already closed.\n"]

type nonrec close_account_request = {
  account_id : account_id;
      [@ocaml.doc
        "Retrieves the Amazon Web Services account Id for the current [CloseAccount] API request. \n"]
}
[@@ocaml.doc ""]

type nonrec cancel_handshake_response = {
  handshake : handshake option;
      [@ocaml.doc "A [Handshake] object. Contains for the handshake that you canceled.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_handshake_request = {
  handshake_id : handshake_id;
      [@ocaml.doc
        "ID for the handshake that you want to cancel. You can get the ID from the \
         [ListHandshakesForOrganization] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for handshake ID string requires \
         \"h-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec duplicate_policy_attachment_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The selected policy is already attached to the specified target.\n"]

type nonrec attach_policy_request = {
  policy_id : policy_id;
      [@ocaml.doc
        "ID for the policy that you want to attach to the target. You can get the ID for the \
         policy by calling the [ListPolicies] operation.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a policy ID string requires \
         \"p-\" followed by from 8 to 128 lowercase or uppercase letters, digits, or the \
         underscore character (_).\n\
        \ "]
  target_id : policy_target_id;
      [@ocaml.doc
        "ID for the root, OU, or account that you want to attach the policy to. You can get the ID \
         by calling the [ListRoots], [ListOrganizationalUnitsForParent], or [ListAccounts] \
         operations.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for a target ID string requires \
         one of the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Root} - A string that begins with \"r-\" followed by from 4 to 32 \
         lowercase letters or digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Account} - A string that consists of exactly 12 digits.\n\
        \            \n\
        \             }\n\
        \        {-   {b Organizational unit (OU)} - A string that begins with \"ou-\" followed by \
         from 4 to 32 lowercase letters or digits (the ID of the root that the OU is in). This \
         string is followed by a second \"-\" dash and from 8 to 32 additional lowercase letters \
         or digits.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec accept_handshake_response = {
  handshake : handshake option;
      [@ocaml.doc "A [Handshake] object. Contains details for the handshake.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_handshake_request = {
  handshake_id : handshake_id;
      [@ocaml.doc
        "ID for the handshake that you want to accept.\n\n\
        \ The {{:http://wikipedia.org/wiki/regex}regex pattern} for handshake ID string requires \
         \"h-\" followed by from 8 to 32 lowercase letters or digits.\n\
        \ "]
}
[@@ocaml.doc ""]
