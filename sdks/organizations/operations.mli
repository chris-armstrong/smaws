open Types

module AcceptHandshake : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
    | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
    | `HandshakeNotFoundException of handshake_not_found_exception
    | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
    | `InvalidInputException of invalid_input_exception
    | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_handshake_request ->
    ( accept_handshake_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
      | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
      | `HandshakeNotFoundException of handshake_not_found_exception
      | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
      | `InvalidInputException of invalid_input_exception
      | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_handshake_request ->
    ( accept_handshake_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
      | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
      | `HandshakeNotFoundException of handshake_not_found_exception
      | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
      | `InvalidInputException of invalid_input_exception
      | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts a handshake by sending an [ACCEPTED] response to the sender. You can view accepted \
   handshakes in API responses for 30 days before they are deleted.\n\n\
  \  {b Only the management account can accept the following handshakes}:\n\
  \ \n\
  \  {ul\n\
  \        {-  Enable all features final confirmation ([APPROVE_ALL_FEATURES])\n\
  \            \n\
  \             }\n\
  \        {-  Billing transfer ([TRANSFER_RESPONSIBILITY])\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/manage-begin-all-features-standard-migration.html#manage-approve-all-features-invite}Enabling \
   all features} and \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_transfer_billing-respond-invitation.html}Responding \
   to a billing transfer invitation} in the {i Organizations User Guide}.\n\
  \   \n\
  \     {b Only a member account can accept the following handshakes}:\n\
  \    \n\
  \     {ul\n\
  \           {-  Invitation to join ([INVITE])\n\
  \               \n\
  \                }\n\
  \           {-  Approve all features request ([ENABLE_ALL_FEATURES])\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_accept-decline-invite.html}Responding \
   to invitations} and \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/manage-begin-all-features-standard-migration.html#manage-approve-all-features-invite}Enabling \
   all features} in the {i Organizations User Guide}.\n\
  \   \n\
  \    When a handshake is accepted, Organizations logs membership events in CloudTrail, available \
   only in the management account's event history. If the account was standalone and joined a new \
   organization, an [AccountJoinedOrganization] event is logged with [joinedMethod:Invited] and \
   [joinedTime] fields. If the account departed one organization and joined another, both an \
   [AccountDepartedOrganization] event with [departedMethod:Left] and [departedTime] and an \
   [AccountJoinedOrganization] event with [joinedMethod:Invited] and [joinedTime] are logged in \
   their respective management accounts.\n\
  \    "]

module AttachPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `DuplicatePolicyAttachmentException of duplicate_policy_attachment_exception
    | `InvalidInputException of invalid_input_exception
    | `PolicyChangesInProgressException of policy_changes_in_progress_exception
    | `PolicyNotFoundException of policy_not_found_exception
    | `PolicyTypeNotEnabledException of policy_type_not_enabled_exception
    | `ServiceException of service_exception
    | `TargetNotFoundException of target_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicatePolicyAttachmentException of duplicate_policy_attachment_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `PolicyTypeNotEnabledException of policy_type_not_enabled_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicatePolicyAttachmentException of duplicate_policy_attachment_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `PolicyTypeNotEnabledException of policy_type_not_enabled_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a policy to a root, an organizational unit (OU), or an individual account. How the \
   policy affects accounts depends on the type of policy. Refer to the {i Organizations User \
   Guide} for information about each policy type:\n\n\
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
  \   You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \   "]

module CancelHandshake : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
    | `HandshakeNotFoundException of handshake_not_found_exception
    | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_handshake_request ->
    ( cancel_handshake_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
      | `HandshakeNotFoundException of handshake_not_found_exception
      | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_handshake_request ->
    ( cancel_handshake_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
      | `HandshakeNotFoundException of handshake_not_found_exception
      | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels a [Handshake].\n\n\
  \ Only the account that sent a handshake can call this operation. The recipient of the handshake \
   can't cancel it, but can use [DeclineHandshake] to decline. After a handshake is canceled, the \
   recipient can no longer respond to the handshake.\n\
  \ \n\
  \  You can view canceled handshakes in API responses for 30 days before they are deleted.\n\
  \  "]

module CloseAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountAlreadyClosedException of account_already_closed_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConflictException of conflict_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    close_account_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountAlreadyClosedException of account_already_closed_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    close_account_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountAlreadyClosedException of account_already_closed_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConflictException of conflict_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Closes an Amazon Web Services member account within an organization. You can close an account \
   when \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html}all \
   features are enabled }. You can't close the management account with this API. This is an \
   asynchronous request that Amazon Web Services performs in the background. Because \
   [CloseAccount] operates asynchronously, it can return a successful completion message even \
   though account closure might still be in progress. You need to wait a few minutes before the \
   account is fully closed. To check the status of the request, do one of the following:\n\n\
  \ {ul\n\
  \       {-  Use the [AccountId] that you sent in the [CloseAccount] request to provide as a \
   parameter to the [DescribeAccount] operation. \n\
  \           \n\
  \            While the close account request is in progress, Account status will indicate \
   PENDING_CLOSURE. When the close account request completes, the status will change to SUSPENDED. \n\
  \            \n\
  \             }\n\
  \       {-  Check the CloudTrail log for the [CloseAccountResult] event that gets published \
   after the account closes successfully. For information on using CloudTrail with Organizations, \
   see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_security_incident-response.html#orgs_cloudtrail-integration}Logging \
   and monitoring in Organizations} in the {i Organizations User Guide}.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    {ul\n\
  \          {-  Resources remaining within the account after closing will be automatically \
   deleted after 90 days. During this 90-day period, the resources won't be available unless you \
   contact Amazon Web Services Support to reopen the account. After 90 days, you can't reopen an \
   account. You might still receive a \
   {{:https://repost.aws/knowledge-center/closed-account-bill}bill after account closure}. \n\
  \              \n\
  \               }\n\
  \          {-  Within a rolling 30 day period you can close the higher of either 250 or 20% of \
   the member accounts in your organization, up to a maximum of 1,000. This quota is not bound by \
   a calendar month, but starts when you close an account. After you reach this limit, you can't \
   close additional accounts. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html}Closing \
   a member account in your organization} and \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html}Quotas \
   for Organizations} in the {i Organizations User Guide}. \n\
  \              \n\
  \               }\n\
  \          {-  To reinstate a closed account, contact Amazon Web Services Support within the \
   90-day grace period while the account is in SUSPENDED status. \n\
  \              \n\
  \               }\n\
  \          {-  If the Amazon Web Services account you attempt to close is linked to an Amazon \
   Web Services GovCloud (US) account, the [CloseAccount] request will close both accounts. To \
   learn important pre-closure details, see \
   {{:https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/Closing-govcloud-account.html} \
   Closing an Amazon Web Services GovCloud (US) account} in the {i  Amazon Web Services GovCloud \
   User Guide}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    After the permanent termination of the account after the 90-day waiting period, \
   Organizations logs a membership event in CloudTrail. The event is an \
   [AccountDepartedOrganization] event with [departedMethod:Cleaned] and [departedTime]. This \
   event is available only in the management account's event history.\n\
  \    "]

module CreateAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `FinalizingOrganizationException of finalizing_organization_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_account_request ->
    ( create_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `FinalizingOrganizationException of finalizing_organization_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_account_request ->
    ( create_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `FinalizingOrganizationException of finalizing_organization_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Web Services account that is automatically a member of the organization whose \
   credentials made the request. This is an asynchronous request that Amazon Web Services performs \
   in the background. Because [CreateAccount] operates asynchronously, it can return a successful \
   completion message even though account initialization might still be in progress. You might \
   need to wait a few minutes before you can successfully access the account. To check the status \
   of the request, do one of the following:\n\n\
  \ {ul\n\
  \       {-  Use the [Id] value of the [CreateAccountStatus] response element from this operation \
   to provide as a parameter to the [DescribeCreateAccountStatus] operation.\n\
  \           \n\
  \            }\n\
  \       {-  Check the CloudTrail log for the [CreateAccountResult] event. For information on \
   using CloudTrail with Organizations, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_security_incident-response.html#orgs_cloudtrail-integration}Logging \
   and monitoring in Organizations} in the {i Organizations User Guide}.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Additionally, the [AccountJoinedOrganization] event is logged in CloudTrail and is available \
   only in the management account's event history. This event includes [joinedMethod:Created] and \
   [joinedTime] fields to provide context on how and when the account joined the organization.\n\
  \   \n\
  \    The user who calls the API to create an account must have the [organizations:CreateAccount] \
   permission. If you enabled all features in the organization, Organizations creates the required \
   service-linked role named [AWSServiceRoleForOrganizations]. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs}Organizations \
   and service-linked roles} in the {i Organizations User Guide}.\n\
  \    \n\
  \     If the request includes tags, then the requester must have the [organizations:TagResource] \
   permission.\n\
  \     \n\
  \      Organizations preconfigures the new member account with a role (named \
   [OrganizationAccountAccessRole] by default) that grants users in the management account \
   administrator permissions in the new member account. Principals in the management account can \
   assume the role. Organizations clones the company name and address information for the new \
   account from the organization's management account.\n\
  \      \n\
  \       You can only call this operation from the management account.\n\
  \       \n\
  \        For more information about creating accounts, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html}Creating \
   a member account in your organization} in the {i Organizations User Guide}.\n\
  \        \n\
  \          {ul\n\
  \                {-  When you create an account in an organization using the Organizations \
   console, API, or CLI commands, the information required for the account to operate as a \
   standalone account, such as a payment method is {i not} automatically collected. If you must \
   remove an account from your organization later, you can do so only after you provide the \
   missing information. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_account-before-remove.html}Considerations \
   before removing an account from an organization} in the {i Organizations User Guide}.\n\
  \                    \n\
  \                     }\n\
  \                {-  If you get an exception that indicates that you exceeded your account \
   limits for the organization, contact {{:https://console.aws.amazon.com/support/home#/}Amazon \
   Web Services Support}.\n\
  \                    \n\
  \                     }\n\
  \                {-  If you get an exception that indicates that the operation failed because \
   your organization is still initializing, wait one hour and then try again. If the error \
   persists, contact {{:https://console.aws.amazon.com/support/home#/}Amazon Web Services Support}.\n\
  \                    \n\
  \                     }\n\
  \                {-  It isn't recommended to use [CreateAccount] to create multiple temporary \
   accounts, and using the [CreateAccount] API to close accounts is subject to a 30-day usage \
   quota. For information on the requirements and process for closing an account, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html}Closing \
   a member account in your organization} in the {i Organizations User Guide}.\n\
  \                    \n\
  \                     }\n\
  \                }\n\
  \     When you create a member account with this operation, you can choose whether to create the \
   account with the {b IAM User and Role Access to Billing Information} switch enabled. If you \
   enable it, IAM users and roles that have appropriate permissions can view billing information \
   for the account. If you disable it, only the account root user can access billing information. \
   For information about how to disable this switch for an account, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/control-access-billing.html#grantaccess}Granting \
   access to your billing information and tools}.\n\
  \     \n\
  \      "]

module CreateGovCloudAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `FinalizingOrganizationException of finalizing_organization_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_gov_cloud_account_request ->
    ( create_gov_cloud_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `FinalizingOrganizationException of finalizing_organization_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_gov_cloud_account_request ->
    ( create_gov_cloud_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `FinalizingOrganizationException of finalizing_organization_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This action is available if all of the following are true:\n\n\
  \ {ul\n\
  \       {-  You're authorized to create accounts in the Amazon Web Services GovCloud (US) \
   Region. For more information on the Amazon Web Services GovCloud (US) Region, see the \
   {{:https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/welcome.html} {i Amazon Web \
   Services GovCloud User Guide}.} \n\
  \           \n\
  \            }\n\
  \       {-  You already have an account in the Amazon Web Services GovCloud (US) Region that is \
   paired with a management account of an organization in the commercial Region.\n\
  \           \n\
  \            }\n\
  \       {-  You call this action from the management account of your organization in the \
   commercial Region.\n\
  \           \n\
  \            }\n\
  \       {-  You have the [organizations:CreateGovCloudAccount] permission. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Organizations automatically creates the required service-linked role named \
   [AWSServiceRoleForOrganizations]. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs}Organizations \
   and service-linked roles} in the {i Organizations User Guide}.\n\
  \   \n\
  \    Amazon Web Services automatically enables CloudTrail for Amazon Web Services GovCloud (US) \
   accounts, but you should also do the following:\n\
  \    \n\
  \     {ul\n\
  \           {-  Verify that CloudTrail is enabled to store logs.\n\
  \               \n\
  \                }\n\
  \           {-  Create an Amazon S3 bucket for CloudTrail log storage.\n\
  \               \n\
  \                For more information, see \
   {{:https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/verifying-cloudtrail.html}Verifying \
   CloudTrail Is Enabled} in the {i Amazon Web Services GovCloud User Guide}. \n\
  \                \n\
  \                 }\n\
  \           }\n\
  \   If the request includes tags, then the requester must have the [organizations:TagResource] \
   permission. The tags are attached to the commercial account associated with the GovCloud \
   account, rather than the GovCloud account itself. To add tags to the GovCloud account, call the \
   [TagResource] operation in the GovCloud Region after the new GovCloud account exists.\n\
  \   \n\
  \    You call this action from the management account of your organization in the commercial \
   Region to create a standalone Amazon Web Services account in the Amazon Web Services GovCloud \
   (US) Region. After the account is created, the management account of an organization in the \
   Amazon Web Services GovCloud (US) Region can invite it to that organization. For more \
   information on inviting standalone accounts in the Amazon Web Services GovCloud (US) to join an \
   organization, see \
   {{:https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html}Organizations} \
   in the {i Amazon Web Services GovCloud User Guide}.\n\
  \    \n\
  \     Calling [CreateGovCloudAccount] is an asynchronous request that Amazon Web Services \
   performs in the background. Because [CreateGovCloudAccount] operates asynchronously, it can \
   return a successful completion message even though account initialization might still be in \
   progress. You might need to wait a few minutes before you can successfully access the account. \
   To check the status of the request, do one of the following:\n\
  \     \n\
  \      {ul\n\
  \            {-  Use the [OperationId] response element from this operation to provide as a \
   parameter to the [DescribeCreateAccountStatus] operation.\n\
  \                \n\
  \                 }\n\
  \            {-  Check the CloudTrail log for the [CreateAccountResult] event. For information \
   on using CloudTrail with Organizations, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_security_incident-response.html}Logging \
   and monitoring in Organizations} in the {i Organizations User Guide}.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   Additionally, the [AccountJoinedOrganization] event is logged in CloudTrail and is available \
   only in the management account's event history only for the linked commercial account. This \
   event includes [joinedMethod:Created] and [joinedTime] fields to provide context on how and \
   when the account joined the organization.\n\
  \   \n\
  \    \n\
  \    \n\
  \     When you call the [CreateGovCloudAccount] action, you create two accounts: a standalone \
   account in the Amazon Web Services GovCloud (US) Region and an associated account in the \
   commercial Region for billing and support purposes. The account in the commercial Region is \
   automatically a member of the organization whose credentials made the request. Both accounts \
   are associated with the same email address.\n\
  \     \n\
  \      A role is created in the new account in the commercial Region that allows the management \
   account in the organization in the commercial Region to assume it. An Amazon Web Services \
   GovCloud (US) account is then created and associated with the commercial account that you just \
   created. A role is also created in the new Amazon Web Services GovCloud (US) account that can \
   be assumed by the Amazon Web Services GovCloud (US) account that is associated with the \
   management account of the commercial organization. For more information and to view a diagram \
   that explains how account access works, see \
   {{:https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html}Organizations} \
   in the {i Amazon Web Services GovCloud User Guide}.\n\
  \      \n\
  \       For more information about creating accounts, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html}Creating \
   a member account in your organization} in the {i Organizations User Guide}.\n\
  \       \n\
  \         {ul\n\
  \               {-  When you create an account in an organization using the Organizations \
   console, API, or CLI commands, the information required for the account to operate as a \
   standalone account is {i not} automatically collected. This includes a payment method and \
   signing the end user license agreement (EULA). If you must remove an account from your \
   organization later, you can do so only after you provide the missing information. For more \
   information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_account-before-remove.html}Considerations \
   before removing an account from an organization} in the {i Organizations User Guide}.\n\
  \                   \n\
  \                    }\n\
  \               {-  If you get an exception that indicates that you exceeded your account limits \
   for the organization, contact {{:https://console.aws.amazon.com/support/home#/}Amazon Web \
   Services Support}.\n\
  \                   \n\
  \                    }\n\
  \               {-  If you get an exception that indicates that the operation failed because \
   your organization is still initializing, wait one hour and then try again. If the error \
   persists, contact {{:https://console.aws.amazon.com/support/home#/}Amazon Web Services Support}.\n\
  \                   \n\
  \                    }\n\
  \               {-  Using [CreateGovCloudAccount] to create multiple temporary accounts isn't \
   recommended. You can only close an account from the Amazon Web Services Billing and Cost \
   Management console, and you must be signed in as the root user. For information on the \
   requirements and process for closing an account, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html}Closing \
   a member account in your organization} in the {i Organizations User Guide}.\n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \     When you create a member account with this operation, you can choose whether to create the \
   account with the {b IAM User and Role Access to Billing Information} switch enabled. If you \
   enable it, IAM users and roles that have appropriate permissions can view billing information \
   for the account. If you disable it, only the account root user can access billing information. \
   For information about how to disable this switch for an account, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html}Granting \
   access to your billing information and tools}.\n\
  \     \n\
  \      "]

module CreateOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
    | `AlreadyInOrganizationException of already_in_organization_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_organization_request ->
    ( create_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
      | `AlreadyInOrganizationException of already_in_organization_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_organization_request ->
    ( create_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
      | `AlreadyInOrganizationException of already_in_organization_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Web Services organization. The account whose user is calling the \
   [CreateOrganization] operation automatically becomes the \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account}management \
   account} of the new organization.\n\n\
  \ This operation must be called using credentials from the account that is to become the new \
   organization's management account. The principal must also have the relevant IAM permissions.\n\
  \ \n\
  \  By default (or if you set the [FeatureSet] parameter to [ALL]), the new organization is \
   created with all features enabled and service control policies automatically enabled in the \
   root. If you instead choose to create the organization supporting only the consolidated billing \
   features by setting the [FeatureSet] parameter to [CONSOLIDATED_BILLING], no policy types are \
   enabled by default and you can't use organization policies.\n\
  \  \n\
  \   The [AccountJoinedOrganization] event is logged in CloudTrail and is available only in the \
   management account's event history. This event includes [joinedMethod:Invited] and [joinedTime] \
   fields to provide context on how and when the account joined the organization.\n\
  \   "]

module CreateOrganizationalUnit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `DuplicateOrganizationalUnitException of duplicate_organizational_unit_exception
    | `InvalidInputException of invalid_input_exception
    | `ParentNotFoundException of parent_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_organizational_unit_request ->
    ( create_organizational_unit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicateOrganizationalUnitException of duplicate_organizational_unit_exception
      | `InvalidInputException of invalid_input_exception
      | `ParentNotFoundException of parent_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_organizational_unit_request ->
    ( create_organizational_unit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicateOrganizationalUnitException of duplicate_organizational_unit_exception
      | `InvalidInputException of invalid_input_exception
      | `ParentNotFoundException of parent_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an organizational unit (OU) within a root or parent OU. An OU is a container for \
   accounts that enables you to organize your accounts to apply policies according to your \
   business requirements. The number of levels deep that you can nest OUs is dependent upon the \
   policy types enabled for that root. For service control policies, the limit is five.\n\n\
  \ For more information about OUs, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html}Managing \
   organizational units (OUs)} in the {i Organizations User Guide}.\n\
  \ \n\
  \  If the request includes tags, then the requester must have the [organizations:TagResource] \
   permission.\n\
  \  \n\
  \   You can only call this operation from the management account.\n\
  \   "]

module CreatePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `DuplicatePolicyException of duplicate_policy_exception
    | `InvalidInputException of invalid_input_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PolicyTypeNotAvailableForOrganizationException of
      policy_type_not_available_for_organization_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_policy_request ->
    ( create_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicatePolicyException of duplicate_policy_exception
      | `InvalidInputException of invalid_input_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PolicyTypeNotAvailableForOrganizationException of
        policy_type_not_available_for_organization_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_policy_request ->
    ( create_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicatePolicyException of duplicate_policy_exception
      | `InvalidInputException of invalid_input_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PolicyTypeNotAvailableForOrganizationException of
        policy_type_not_available_for_organization_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a policy of a specified type that you can attach to a root, an organizational unit \
   (OU), or an individual Amazon Web Services account.\n\n\
  \ For more information about policies and their use, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html}Managing \
   Organizations policies}.\n\
  \ \n\
  \  If the request includes tags, then the requester must have the [organizations:TagResource] \
   permission.\n\
  \  \n\
  \   You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \   "]

module DeclineHandshake : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
    | `HandshakeNotFoundException of handshake_not_found_exception
    | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    decline_handshake_request ->
    ( decline_handshake_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
      | `HandshakeNotFoundException of handshake_not_found_exception
      | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    decline_handshake_request ->
    ( decline_handshake_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `HandshakeAlreadyInStateException of handshake_already_in_state_exception
      | `HandshakeNotFoundException of handshake_not_found_exception
      | `InvalidHandshakeTransitionException of invalid_handshake_transition_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Declines a [Handshake].\n\n\
  \ Only the account that receives a handshake can call this operation. The sender of the \
   handshake can use [CancelHandshake] to cancel if the handshake hasn't yet been responded to.\n\
  \ \n\
  \  You can view canceled handshakes in API responses for 30 days before they are deleted.\n\
  \  "]

module DeleteOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `OrganizationNotEmptyException of organization_not_empty_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `OrganizationNotEmptyException of organization_not_empty_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `OrganizationNotEmptyException of organization_not_empty_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the organization. You can delete an organization only by using credentials from the \
   management account. The organization must be empty of member accounts.\n\n\
  \ When an organization is deleted, Organizations logs a membership event in CloudTrail. The \
   event is an [AccountDepartedOrganization] event with [departedMethod:Left] and [departedTime]. \
   This event is available only in the management account's event history.\n\
  \ "]

module DeleteOrganizationalUnit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `OrganizationalUnitNotEmptyException of organizational_unit_not_empty_exception
    | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_organizational_unit_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `OrganizationalUnitNotEmptyException of organizational_unit_not_empty_exception
      | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_organizational_unit_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `OrganizationalUnitNotEmptyException of organizational_unit_not_empty_exception
      | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an organizational unit (OU) from a root or another OU. You must first remove all \
   accounts and child OUs from the OU that you want to delete.\n\n\
  \ You can only call this operation from the management account.\n\
  \ "]

module DeletePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `PolicyInUseException of policy_in_use_exception
    | `PolicyNotFoundException of policy_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyInUseException of policy_in_use_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyInUseException of policy_in_use_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified policy from your organization. Before you perform this operation, you \
   must first detach the policy from all organizational units (OUs), roots, and accounts.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the resource policy from your organization.\n\n\
  \ You can only call this operation from the management account.\n\
  \ "]

module DeregisterDelegatedAdministrator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AccountNotRegisteredException of account_not_registered_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_delegated_administrator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AccountNotRegisteredException of account_not_registered_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_delegated_administrator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AccountNotRegisteredException of account_not_registered_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified member Amazon Web Services account as a delegated administrator for the \
   specified Amazon Web Services service.\n\n\
  \  Deregistering a delegated administrator can have unintended impacts on the functionality of \
   the enabled Amazon Web Services service. See the documentation for the enabled service before \
   you deregister a delegated administrator so that you understand any potential impacts.\n\
  \  \n\
  \    You can run this action only for Amazon Web Services services that support this feature. \
   For a current list of services that support it, see the column {i Supports Delegated \
   Administrator} in the table at \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html}Amazon \
   Web Services Services that you can use with Organizations} in the {i Organizations User Guide.} \n\
  \    \n\
  \     You can only call this operation from the management account.\n\
  \     "]

module DescribeAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_request ->
    ( describe_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_request ->
    ( describe_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves Organizations-related information about the specified account.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module DescribeCreateAccountStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `CreateAccountStatusNotFoundException of create_account_status_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_create_account_status_request ->
    ( describe_create_account_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `CreateAccountStatusNotFoundException of create_account_status_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_create_account_status_request ->
    ( describe_create_account_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `CreateAccountStatusNotFoundException of create_account_status_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the current status of an asynchronous request to create an account.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module DescribeEffectivePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TargetNotFoundException of target_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_effective_policy_request ->
    ( describe_effective_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_effective_policy_request ->
    ( describe_effective_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the contents of the effective policy for specified policy type and account. The \
   effective policy is the aggregation of any policies of the specified type that the account \
   inherits, plus any policy of that type that is directly attached to the account.\n\n\
  \ This operation applies only to management policies. It does not apply to authorization \
   policies: service control policies (SCPs) and resource control policies (RCPs).\n\
  \ \n\
  \  For more information about policy inheritance, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_inheritance_mgmt.html}Understanding \
   management policy inheritance} in the {i Organizations User Guide}.\n\
  \  \n\
  \   You can call this operation from any account in a organization.\n\
  \   "]

module DescribeHandshake : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `HandshakeNotFoundException of handshake_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_handshake_request ->
    ( describe_handshake_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `HandshakeNotFoundException of handshake_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_handshake_request ->
    ( describe_handshake_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `HandshakeNotFoundException of handshake_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details for a handshake. A handshake is the secure exchange of information between two \
   Amazon Web Services accounts: a sender and a recipient.\n\n\
  \ You can view [ACCEPTED], [DECLINED], or [CANCELED] handshakes in API Responses for 30 days \
   before they are deleted.\n\
  \ \n\
  \  You can call this operation from any account in a organization.\n\
  \  "]

module DescribeOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the organization that the user's account belongs to.\n\n\
  \ You can call this operation from any account in a organization.\n\
  \ \n\
  \   Even if a policy type is shown as available in the organization, you can disable it \
   separately at the root level with [DisablePolicyType]. Use [ListRoots] to see the status of \
   policy types for a specified root.\n\
  \   \n\
  \    "]

module DescribeOrganizationalUnit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_organizational_unit_request ->
    ( describe_organizational_unit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_organizational_unit_request ->
    ( describe_organizational_unit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about an organizational unit (OU).\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module DescribePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `PolicyNotFoundException of policy_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_policy_request ->
    ( describe_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_policy_request ->
    ( describe_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about a policy.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module DescribeResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about a resource policy.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module DescribeResponsibilityTransfer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_responsibility_transfer_request ->
    ( describe_responsibility_transfer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_responsibility_transfer_request ->
    ( describe_responsibility_transfer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns details for a transfer. A {i transfer} is an arrangement between two management \
   accounts where one account designates the other with specified responsibilities for their \
   organization.\n"]

module DetachPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `PolicyChangesInProgressException of policy_changes_in_progress_exception
    | `PolicyNotAttachedException of policy_not_attached_exception
    | `PolicyNotFoundException of policy_not_found_exception
    | `ServiceException of service_exception
    | `TargetNotFoundException of target_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyNotAttachedException of policy_not_attached_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_policy_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyNotAttachedException of policy_not_attached_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches a policy from a target root, organizational unit (OU), or account.\n\n\
  \  If the policy being detached is a service control policy (SCP), the changes to permissions \
   for Identity and Access Management (IAM) users and roles in affected accounts are immediate.\n\
  \  \n\
  \    Every root, OU, and account must have at least one SCP attached. If you want to replace the \
   default [FullAWSAccess] policy with an SCP that limits the permissions that can be delegated, \
   you must attach the replacement SCP before you can remove the default SCP. This is the \
   authorization strategy of an \
   \"{{:https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_allowlist}allow \
   list}\". If you instead attach a second SCP and leave the [FullAWSAccess] SCP still attached, \
   and specify [\"Effect\":\n\
  \                \"Deny\"] in the second SCP to override the [\"Effect\": \"Allow\"] in the \
   [FullAWSAccess] policy (or any other attached SCP), you're using the authorization strategy of \
   a \
   \"{{:https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_denylist}deny \
   list}\".\n\
  \    \n\
  \     You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \     "]

module DisableAWSServiceAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_aws_service_access_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_aws_service_access_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the integration of an Amazon Web Services service (the service that is specified by \
   [ServicePrincipal]) with Organizations. When you disable integration, the specified service no \
   longer can create a \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html}service-linked \
   role} in {i new} accounts in your organization. This means the service can't perform operations \
   on your behalf on any new accounts in your organization. The service can still perform \
   operations in older accounts until the service completes its clean-up from Organizations.\n\n\
  \  We {b  {i strongly recommend} } that you don't use this command to disable integration \
   between Organizations and the specified Amazon Web Services service. Instead, use the console \
   or commands that are provided by the specified service. This lets the trusted service perform \
   any required initialization when enabling trusted access, such as creating any required \
   resources and any required clean up of resources when disabling trusted access. \n\
  \  \n\
  \   For information about how to disable trusted service access to your organization using the \
   trusted service, see the {b Learn more} link under the {b Supports Trusted Access} column at \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html}Amazon \
   Web Services services that you can use with Organizations}. on this page.\n\
  \   \n\
  \    If you disable access by using this command, it causes the following actions to occur:\n\
  \    \n\
  \     {ul\n\
  \           {-  The service can no longer create a service-linked role in the accounts in your \
   organization. This means that the service can't perform operations on your behalf on any new \
   accounts in your organization. The service can still perform operations in older accounts until \
   the service completes its clean-up from Organizations. \n\
  \               \n\
  \                }\n\
  \           {-  The service can no longer perform tasks in the member accounts in the \
   organization, unless those operations are explicitly permitted by the IAM policies that are \
   attached to your roles. This includes any data aggregation from the member accounts to the \
   management account, or to a delegated administrator account, where relevant.\n\
  \               \n\
  \                }\n\
  \           {-  Some services detect this and clean up any remaining data or resources related \
   to the integration, while other services stop accessing the organization but leave any \
   historical data and configuration in place to support a possible re-enabling of the integration.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   Using the other service's console or commands to disable the integration ensures that the \
   other service is aware that it can clean up any resources that are required only for the \
   integration. How the service cleans up its resources in the organization's accounts depends on \
   that service. For more information, see the documentation for the other Amazon Web Services \
   service. \n\
  \   \n\
  \     After you perform the [DisableAWSServiceAccess] operation, the specified service can no \
   longer perform operations in your organization's accounts \n\
  \     \n\
  \      For more information about integrating other services with Organizations, including the \
   list of services that work with Organizations, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html}Using \
   Organizations with other Amazon Web Services services} in the {i Organizations User Guide}.\n\
  \      \n\
  \       You can only call this operation from the management account.\n\
  \       "]

module DisablePolicyType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `PolicyChangesInProgressException of policy_changes_in_progress_exception
    | `PolicyTypeNotEnabledException of policy_type_not_enabled_exception
    | `RootNotFoundException of root_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_policy_type_request ->
    ( disable_policy_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyTypeNotEnabledException of policy_type_not_enabled_exception
      | `RootNotFoundException of root_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_policy_type_request ->
    ( disable_policy_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyTypeNotEnabledException of policy_type_not_enabled_exception
      | `RootNotFoundException of root_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables an organizational policy type in a root. A policy of a certain type can be attached to \
   entities in a root only if that type is enabled in the root. After you perform this operation, \
   you no longer can attach policies of the specified type to that root or to any organizational \
   unit (OU) or account in that root. You can undo this by using the [EnablePolicyType] \
   operation.\n\n\
  \ This is an asynchronous request that Amazon Web Services performs in the background. If you \
   disable a policy type for a root, it still appears enabled for the organization if \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html}all \
   features} are enabled for the organization. Amazon Web Services recommends that you first use \
   [ListRoots] to see the status of policy types for a specified root, and then use this operation.\n\
  \ \n\
  \  You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \  \n\
  \    To view the status of available policy types in the organization, use [ListRoots].\n\
  \   "]

module EnableAllFeatures : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_all_features_request ->
    ( enable_all_features_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_all_features_request ->
    ( enable_all_features_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables all features in an organization. This enables the use of organization policies that can \
   restrict the services and actions that can be called in each account. Until you enable all \
   features, you have access only to consolidated billing, and you can't use any of the advanced \
   account administration features that Organizations supports. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html}Enabling \
   all features in your organization} in the {i Organizations User Guide}.\n\n\
  \  This operation is required only for organizations that were created explicitly with only the \
   consolidated billing features enabled. Calling this operation sends a handshake to every \
   invited account in the organization. The feature set change can be finalized and the additional \
   features enabled only after all administrators in the invited accounts approve the change by \
   accepting the handshake.\n\
  \  \n\
  \    After you enable all features, you can separately enable or disable individual policy types \
   in a root using [EnablePolicyType] and [DisablePolicyType]. To see the status of policy types \
   in a root, use [ListRoots].\n\
  \    \n\
  \     After all invited member accounts accept the handshake, you finalize the feature set \
   change by accepting the handshake that contains [\"Action\":\n\
  \                \"ENABLE_ALL_FEATURES\"]. This completes the change.\n\
  \     \n\
  \      After you enable all features in your organization, the management account in the \
   organization can apply policies on all member accounts. These policies can restrict what users \
   and even administrators in those accounts can do. The management account can apply policies \
   that prevent accounts from leaving the organization. Ensure that your account administrators \
   are aware of this.\n\
  \      \n\
  \       You can only call this operation from the management account.\n\
  \       "]

module EnableAWSServiceAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_aws_service_access_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_aws_service_access_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides an Amazon Web Services service (the service that is specified by [ServicePrincipal]) \
   with permissions to view the structure of an organization, create a \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html}service-linked \
   role} in all the accounts in the organization, and allow the service to perform operations on \
   behalf of the organization and its accounts. Establishing these permissions can be a first step \
   in enabling the integration of an Amazon Web Services service with Organizations.\n\n\
  \  We recommend that you enable integration between Organizations and the specified Amazon Web \
   Services service by using the console or commands that are provided by the specified service. \
   Doing so ensures that the service is aware that it can create the resources that are required \
   for the integration. How the service creates those resources in the organization's accounts \
   depends on that service. For more information, see the documentation for the other Amazon Web \
   Services service.\n\
  \  \n\
  \    For more information about enabling services to integrate with Organizations, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html}Using \
   Organizations with other Amazon Web Services services} in the {i Organizations User Guide}.\n\
  \    \n\
  \     You can only call this operation from the management account.\n\
  \     "]

module EnablePolicyType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `PolicyChangesInProgressException of policy_changes_in_progress_exception
    | `PolicyTypeAlreadyEnabledException of policy_type_already_enabled_exception
    | `PolicyTypeNotAvailableForOrganizationException of
      policy_type_not_available_for_organization_exception
    | `RootNotFoundException of root_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_policy_type_request ->
    ( enable_policy_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyTypeAlreadyEnabledException of policy_type_already_enabled_exception
      | `PolicyTypeNotAvailableForOrganizationException of
        policy_type_not_available_for_organization_exception
      | `RootNotFoundException of root_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_policy_type_request ->
    ( enable_policy_type_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyTypeAlreadyEnabledException of policy_type_already_enabled_exception
      | `PolicyTypeNotAvailableForOrganizationException of
        policy_type_not_available_for_organization_exception
      | `RootNotFoundException of root_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables a policy type in a root. After you enable a policy type in a root, you can attach \
   policies of that type to the root, any organizational unit (OU), or account in that root. You \
   can undo this by using the [DisablePolicyType] operation.\n\n\
  \ This is an asynchronous request that Amazon Web Services performs in the background. Amazon \
   Web Services recommends that you first use [ListRoots] to see the status of policy types for a \
   specified root, and then use this operation.\n\
  \ \n\
  \  You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \  \n\
  \   You can enable a policy type in a root only if that policy type is available in the \
   organization. To view the status of available policy types in the organization, use [ListRoots].\n\
  \   "]

module InviteAccountToOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountOwnerNotVerifiedException of account_owner_not_verified_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `DuplicateHandshakeException of duplicate_handshake_exception
    | `FinalizingOrganizationException of finalizing_organization_exception
    | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    invite_account_to_organization_request ->
    ( invite_account_to_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountOwnerNotVerifiedException of account_owner_not_verified_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicateHandshakeException of duplicate_handshake_exception
      | `FinalizingOrganizationException of finalizing_organization_exception
      | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    invite_account_to_organization_request ->
    ( invite_account_to_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountOwnerNotVerifiedException of account_owner_not_verified_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicateHandshakeException of duplicate_handshake_exception
      | `FinalizingOrganizationException of finalizing_organization_exception
      | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends an invitation to another account to join your organization as a member account. \
   Organizations sends email on your behalf to the email address that is associated with the other \
   account's owner. The invitation is implemented as a [Handshake] whose details are in the \
   response.\n\n\
  \  If you receive an exception that indicates that you exceeded your account limits for the \
   organization or that the operation failed because your organization is still initializing, wait \
   one hour and then try again. If the error persists after an hour, contact \
   {{:https://console.aws.amazon.com/support/home#/}Amazon Web Services Support}.\n\
  \  \n\
  \    If the request includes tags, then the requester must have the [organizations:TagResource] \
   permission.\n\
  \    \n\
  \     You can only call this operation from the management account.\n\
  \     "]

module InviteOrganizationToTransferResponsibility : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `DuplicateHandshakeException of duplicate_handshake_exception
    | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    invite_organization_to_transfer_responsibility_request ->
    ( invite_organization_to_transfer_responsibility_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicateHandshakeException of duplicate_handshake_exception
      | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    invite_organization_to_transfer_responsibility_request ->
    ( invite_organization_to_transfer_responsibility_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicateHandshakeException of duplicate_handshake_exception
      | `HandshakeConstraintViolationException of handshake_constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends an invitation to another organization's management account to designate your account with \
   the specified responsibilities for their organization. The invitation is implemented as a \
   [Handshake] whose details are in the response.\n\n\
  \ You can only call this operation from the management account.\n\
  \ "]

module LeaveOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a member account from its parent organization. This version of the operation is \
   performed by the account that wants to leave. To remove a member account as a user in the \
   management account, use [RemoveAccountFromOrganization] instead.\n\n\
  \ You can only call from operation from a member account.\n\
  \ \n\
  \  When an account leaves an organization, Organizations logs a membership event in CloudTrail. \
   The event is an [AccountDepartedOrganization] event with [departedMethod:Left] and \
   [departedTime]. This event is available only in the management account's event history.\n\
  \  \n\
  \    {ul\n\
  \          {-  The management account in an organization with all features enabled can set \
   service control policies (SCPs) that can restrict what administrators of member accounts can \
   do. This includes preventing them from successfully calling [LeaveOrganization] and leaving the \
   organization.\n\
  \              \n\
  \               }\n\
  \          {-  You can leave an organization as a member account only if the account is \
   configured with the information required to operate as a standalone account. When you create an \
   account in an organization using the Organizations console, API, or CLI commands, the \
   information required of standalone accounts is {i not} automatically collected. For each \
   account that you want to make standalone, you must perform the following steps. If any of the \
   steps are already completed for this account, that step doesn't appear.\n\
  \              \n\
  \               {ul\n\
  \                     {-  Choose a support plan\n\
  \                         \n\
  \                          }\n\
  \                     {-  Provide and verify the required contact information\n\
  \                         \n\
  \                          }\n\
  \                     {-  Provide a current payment method\n\
  \                         \n\
  \                          }\n\
  \                     \n\
  \           }\n\
  \            Amazon Web Services uses the payment method to charge for any billable (not free \
   tier) Amazon Web Services activity that occurs while the account isn't attached to an \
   organization. For more information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_account-before-remove.html}Considerations \
   before removing an account from an organization} in the {i Organizations User Guide}.\n\
  \            \n\
  \             }\n\
  \          {-  The account that you want to leave must not be a delegated administrator account \
   for any Amazon Web Services service enabled for your organization. If the account is a \
   delegated administrator, you must first change the delegated administrator account to another \
   account that is remaining in the organization.\n\
  \              \n\
  \               }\n\
  \          {-  After the account leaves the organization, all tags that were attached to the \
   account object in the organization are deleted. Amazon Web Services accounts outside of an \
   organization do not support tags.\n\
  \              \n\
  \               }\n\
  \          {-  A newly created account has a waiting period before it can be removed from its \
   organization. You must wait until at least four days after the account was created. Invited \
   accounts aren't subject to this waiting period.\n\
  \              \n\
  \               }\n\
  \          {-  If you are using an organization principal to call [LeaveOrganization] across \
   multiple accounts, you can only do this up to 5 accounts per second in a single organization.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module ListAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_request ->
    ( list_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_request ->
    ( list_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the accounts in the organization. To request only the accounts in a specified root or \
   organizational unit (OU), use the [ListAccountsForParent] operation instead.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    "]

module ListAccountsForParent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ParentNotFoundException of parent_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_for_parent_request ->
    ( list_accounts_for_parent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ParentNotFoundException of parent_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_for_parent_request ->
    ( list_accounts_for_parent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ParentNotFoundException of parent_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the accounts in an organization that are contained by the specified target root or \
   organizational unit (OU). If you specify the root, you get a list of all the accounts that \
   aren't in any OU. If you specify an OU, you get a list of all the accounts in only that OU and \
   not in any child OUs. To get a list of all accounts in the organization, use the [ListAccounts] \
   operation.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    "]

module ListAccountsWithInvalidEffectivePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_with_invalid_effective_policy_request ->
    ( list_accounts_with_invalid_effective_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_with_invalid_effective_policy_request ->
    ( list_accounts_with_invalid_effective_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the accounts in an organization that have invalid effective policies. An {i invalid \
   effective policy} is an \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_effective.html}effective \
   policy} that fails validation checks, resulting in the effective policy not being fully \
   enforced on all the intended accounts within an organization.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module ListAWSServiceAccessForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_aws_service_access_for_organization_request ->
    ( list_aws_service_access_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_aws_service_access_for_organization_request ->
    ( list_aws_service_access_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the Amazon Web Services services that you enabled to integrate with your \
   organization. After a service on this list creates the resources that it requires for the \
   integration, it can perform operations on your organization and its accounts.\n\n\
  \ For more information about integrating other services with Organizations, including the list \
   of services that currently work with Organizations, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html}Using \
   Organizations with other Amazon Web Services services} in the {i Organizations User Guide}.\n\
  \ \n\
  \  You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \  "]

module ListChildren : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ParentNotFoundException of parent_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_children_request ->
    ( list_children_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ParentNotFoundException of parent_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_children_request ->
    ( list_children_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ParentNotFoundException of parent_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all of the organizational units (OUs) or accounts that are contained in the specified \
   parent OU or root. This operation, along with [ListParents] enables you to traverse the tree \
   structure that makes up this root.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    "]

module ListCreateAccountStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_create_account_status_request ->
    ( list_create_account_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_create_account_status_request ->
    ( list_create_account_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the account creation requests that match the specified status that is currently being \
   tracked for the organization.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    "]

module ListDelegatedAdministrators : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_delegated_administrators_request ->
    ( list_delegated_administrators_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_delegated_administrators_request ->
    ( list_delegated_administrators_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the Amazon Web Services accounts that are designated as delegated administrators in this \
   organization.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module ListDelegatedServicesForAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AccountNotRegisteredException of account_not_registered_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_delegated_services_for_account_request ->
    ( list_delegated_services_for_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AccountNotRegisteredException of account_not_registered_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_delegated_services_for_account_request ->
    ( list_delegated_services_for_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AccountNotRegisteredException of account_not_registered_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the Amazon Web Services services for which the specified account is a delegated \
   administrator.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module ListEffectivePolicyValidationErrors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_effective_policy_validation_errors_request ->
    ( list_effective_policy_validation_errors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_effective_policy_validation_errors_request ->
    ( list_effective_policy_validation_errors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `EffectivePolicyNotFoundException of effective_policy_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the validation errors on an \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_effective.html}effective \
   policy} for a specified account and policy type.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module ListHandshakesForAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_handshakes_for_account_request ->
    ( list_handshakes_for_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_handshakes_for_account_request ->
    ( list_handshakes_for_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the recent handshakes that you have received.\n\n\
  \ You can view [CANCELED], [ACCEPTED], [DECLINED], or [EXPIRED] handshakes in API responses for \
   30 days before they are deleted.\n\
  \ \n\
  \  You can call this operation from any account in a organization.\n\
  \  \n\
  \    When calling List* operations, always check the [NextToken] response parameter value, even \
   if you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \    \n\
  \     "]

module ListHandshakesForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_handshakes_for_organization_request ->
    ( list_handshakes_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_handshakes_for_organization_request ->
    ( list_handshakes_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the recent handshakes that you have sent.\n\n\
  \ You can view [CANCELED], [ACCEPTED], [DECLINED], or [EXPIRED] handshakes in API responses for \
   30 days before they are deleted.\n\
  \ \n\
  \  You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \  \n\
  \    When calling List* operations, always check the [NextToken] response parameter value, even \
   if you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \    \n\
  \     "]

module ListInboundResponsibilityTransfers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_inbound_responsibility_transfers_request ->
    ( list_inbound_responsibility_transfers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inbound_responsibility_transfers_request ->
    ( list_inbound_responsibility_transfers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists transfers that allow you to manage the specified responsibilities for another \
   organization. This operation returns both transfer invitations and transfers.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \   "]

module ListOrganizationalUnitsForParent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ParentNotFoundException of parent_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_organizational_units_for_parent_request ->
    ( list_organizational_units_for_parent_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ParentNotFoundException of parent_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_organizational_units_for_parent_request ->
    ( list_organizational_units_for_parent_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ParentNotFoundException of parent_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the organizational units (OUs) in a parent organizational unit or root.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    "]

module ListOutboundResponsibilityTransfers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_outbound_responsibility_transfers_request ->
    ( list_outbound_responsibility_transfers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_outbound_responsibility_transfers_request ->
    ( list_outbound_responsibility_transfers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists transfers that allow an account outside your organization to manage the specified \
   responsibilities for your organization. This operation returns both transfer invitations and \
   transfers.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \   "]

module ListParents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ChildNotFoundException of child_not_found_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_parents_request ->
    ( list_parents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ChildNotFoundException of child_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_parents_request ->
    ( list_parents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ChildNotFoundException of child_not_found_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the root or organizational units (OUs) that serve as the immediate parent of the \
   specified child OU or account. This operation, along with [ListChildren] enables you to \
   traverse the tree structure that makes up this root.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    \n\
  \      In the current release, a child can have only a single parent.\n\
  \      \n\
  \       "]

module ListPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policies_request ->
    ( list_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policies_request ->
    ( list_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the list of all policies in an organization of a specified type.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    "]

module ListPoliciesForTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TargetNotFoundException of target_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_policies_for_target_request ->
    ( list_policies_for_target_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_policies_for_target_request ->
    ( list_policies_for_target_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the policies that are directly attached to the specified target root, organizational unit \
   (OU), or account. You must specify the policy type that you want included in the returned \
   list.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    "]

module ListRoots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_roots_request ->
    ( list_roots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_roots_request ->
    ( list_roots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the roots that are defined in the current organization.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    \n\
  \      Policy types can be enabled and disabled in roots. This is distinct from whether they're \
   available in the organization. When you enable all features, you make policy types available \
   for use in that organization. Individual policy types can then be enabled and disabled in a \
   root. To see the availability of a policy type in an organization, use [DescribeOrganization].\n\
  \      \n\
  \       "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TargetNotFoundException of target_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists tags that are attached to the specified resource.\n\n\
  \ You can attach tags to the following resources in Organizations.\n\
  \ \n\
  \  {ul\n\
  \        {-  Amazon Web Services account\n\
  \            \n\
  \             }\n\
  \        {-  Organization root\n\
  \            \n\
  \             }\n\
  \        {-  Organizational unit (OU)\n\
  \            \n\
  \             }\n\
  \        {-  Policy (any type)\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \   "]

module ListTargetsForPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `InvalidInputException of invalid_input_exception
    | `PolicyNotFoundException of policy_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_targets_for_policy_request ->
    ( list_targets_for_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_targets_for_policy_request ->
    ( list_targets_for_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `InvalidInputException of invalid_input_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the roots, organizational units (OUs), and accounts that the specified policy is \
   attached to.\n\n\
  \  When calling List* operations, always check the [NextToken] response parameter value, even if \
   you receive an empty result set. These operations can occasionally return an empty set of \
   results even when more results are available. Continue making requests until [NextToken] \
   returns null. A null [NextToken] value indicates that you have retrieved all available results.\n\
  \  \n\
  \    You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \    "]

module MoveAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `DestinationParentNotFoundException of destination_parent_not_found_exception
    | `DuplicateAccountException of duplicate_account_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `SourceParentNotFoundException of source_parent_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    move_account_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DestinationParentNotFoundException of destination_parent_not_found_exception
      | `DuplicateAccountException of duplicate_account_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `SourceParentNotFoundException of source_parent_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    move_account_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DestinationParentNotFoundException of destination_parent_not_found_exception
      | `DuplicateAccountException of duplicate_account_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `SourceParentNotFoundException of source_parent_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Moves an account from its current source parent root or organizational unit (OU) to the \
   specified destination parent root or OU.\n\n\
  \ You can only call this operation from the management account.\n\
  \ "]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a resource policy.\n\n\
  \ You can only call this operation from the management account..\n\
  \ "]

module RegisterDelegatedAdministrator : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountAlreadyRegisteredException of account_already_registered_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_delegated_administrator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountAlreadyRegisteredException of account_already_registered_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_delegated_administrator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountAlreadyRegisteredException of account_already_registered_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the specified member account to administer the Organizations features of the specified \
   Amazon Web Services service. It grants read-only access to Organizations service data. The \
   account still requires IAM permissions to access and administer the Amazon Web Services \
   service.\n\n\
  \ You can run this action only for Amazon Web Services services that support this feature. For a \
   current list of services that support it, see the column {i Supports Delegated Administrator} \
   in the table at \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html}Amazon \
   Web Services Services that you can use with Organizations} in the {i Organizations User Guide.} \n\
  \ \n\
  \  You can only call this operation from the management account.\n\
  \  "]

module RemoveAccountFromOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AccountNotFoundException of account_not_found_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_account_from_organization_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_account_from_organization_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AccountNotFoundException of account_not_found_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `MasterCannotLeaveOrganizationException of master_cannot_leave_organization_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified account from the organization.\n\n\
  \ The removed account becomes a standalone account that isn't a member of any organization. It's \
   no longer subject to any policies and is responsible for its own bill payments. The \
   organization's management account is no longer charged for any expenses accrued by the member \
   account after it's removed from the organization.\n\
  \ \n\
  \  You can only call this operation from the management account. Member accounts can remove \
   themselves with [LeaveOrganization] instead.\n\
  \  \n\
  \   When an account is removed from an organization, Organizations logs a membership event in \
   CloudTrail. The event is an [AccountDepartedOrganization] event with [departedMethod:Removed] \
   and [departedTime]. This event is available only in the management account's event history.\n\
  \   \n\
  \     {ul\n\
  \           {-  You can remove an account from your organization only if the account is \
   configured with the information required to operate as a standalone account. When you create an \
   account in an organization using the Organizations console, API, or CLI commands, the \
   information required of standalone accounts is {i not} automatically collected. For more \
   information, see \
   {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_account-before-remove.html}Considerations \
   before removing an account from an organization} in the {i Organizations User Guide}.\n\
  \               \n\
  \                }\n\
  \           {-  The account that you want to leave must not be a delegated administrator account \
   for any Amazon Web Services service enabled for your organization. If the account is a \
   delegated administrator, you must first change the delegated administrator account to another \
   account that is remaining in the organization.\n\
  \               \n\
  \                }\n\
  \           {-  After the account leaves the organization, all tags that were attached to the \
   account object in the organization are deleted. Amazon Web Services accounts outside of an \
   organization do not support tags.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TargetNotFoundException of target_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more tags to the specified resource.\n\n\
  \ Currently, you can attach tags to the following resources in Organizations.\n\
  \ \n\
  \  {ul\n\
  \        {-  Amazon Web Services account\n\
  \            \n\
  \             }\n\
  \        {-  Organization root\n\
  \            \n\
  \             }\n\
  \        {-  Organizational unit (OU)\n\
  \            \n\
  \             }\n\
  \        {-  Policy (any type)\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \   "]

module TerminateResponsibilityTransfer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `InvalidResponsibilityTransferTransitionException of
      invalid_responsibility_transfer_transition_exception
    | `ResponsibilityTransferAlreadyInStatusException of
      responsibility_transfer_already_in_status_exception
    | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_responsibility_transfer_request ->
    ( terminate_responsibility_transfer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidResponsibilityTransferTransitionException of
        invalid_responsibility_transfer_transition_exception
      | `ResponsibilityTransferAlreadyInStatusException of
        responsibility_transfer_already_in_status_exception
      | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_responsibility_transfer_request ->
    ( terminate_responsibility_transfer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `InvalidResponsibilityTransferTransitionException of
        invalid_responsibility_transfer_transition_exception
      | `ResponsibilityTransferAlreadyInStatusException of
        responsibility_transfer_already_in_status_exception
      | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Ends a transfer. A {i transfer} is an arrangement between two management accounts where one \
   account designates the other with specified responsibilities for their organization.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceException of service_exception
    | `TargetNotFoundException of target_not_found_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceException of service_exception
      | `TargetNotFoundException of target_not_found_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes any tags with the specified keys from the specified resource.\n\n\
  \ You can attach tags to the following resources in Organizations.\n\
  \ \n\
  \  {ul\n\
  \        {-  Amazon Web Services account\n\
  \            \n\
  \             }\n\
  \        {-  Organization root\n\
  \            \n\
  \             }\n\
  \        {-  Organizational unit (OU)\n\
  \            \n\
  \             }\n\
  \        {-  Policy (any type)\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \   "]

module UpdateOrganizationalUnit : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `DuplicateOrganizationalUnitException of duplicate_organizational_unit_exception
    | `InvalidInputException of invalid_input_exception
    | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_organizational_unit_request ->
    ( update_organizational_unit_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DuplicateOrganizationalUnitException of duplicate_organizational_unit_exception
      | `InvalidInputException of invalid_input_exception
      | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_organizational_unit_request ->
    ( update_organizational_unit_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `DuplicateOrganizationalUnitException of duplicate_organizational_unit_exception
      | `InvalidInputException of invalid_input_exception
      | `OrganizationalUnitNotFoundException of organizational_unit_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Renames the specified organizational unit (OU). The ID and ARN don't change. The child OUs and \
   accounts remain in place, and any attached policies of the OU remain attached.\n\n\
  \ You can only call this operation from the management account.\n\
  \ "]

module UpdatePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `DuplicatePolicyException of duplicate_policy_exception
    | `InvalidInputException of invalid_input_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PolicyChangesInProgressException of policy_changes_in_progress_exception
    | `PolicyNotFoundException of policy_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_policy_request ->
    ( update_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicatePolicyException of duplicate_policy_exception
      | `InvalidInputException of invalid_input_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_policy_request ->
    ( update_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `DuplicatePolicyException of duplicate_policy_exception
      | `InvalidInputException of invalid_input_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PolicyChangesInProgressException of policy_changes_in_progress_exception
      | `PolicyNotFoundException of policy_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing policy with a new name, description, or content. If you don't supply any \
   parameter, that value remains unchanged. You can't change a policy's type.\n\n\
  \ You can only call this operation from the management account or a member account that is a \
   delegated administrator.\n\
  \ "]

module UpdateResponsibilityTransfer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
    | `ConstraintViolationException of constraint_violation_exception
    | `InvalidInputException of invalid_input_exception
    | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
    | `ServiceException of service_exception
    | `TooManyRequestsException of too_many_requests_exception
    | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_responsibility_transfer_request ->
    ( update_responsibility_transfer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_responsibility_transfer_request ->
    ( update_responsibility_transfer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AWSOrganizationsNotInUseException of aws_organizations_not_in_use_exception
      | `ConstraintViolationException of constraint_violation_exception
      | `InvalidInputException of invalid_input_exception
      | `ResponsibilityTransferNotFoundException of responsibility_transfer_not_found_exception
      | `ServiceException of service_exception
      | `TooManyRequestsException of too_many_requests_exception
      | `UnsupportedAPIEndpointException of unsupported_api_endpoint_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a transfer. A {i transfer} is the arrangement between two management accounts where one \
   account designates the other with specified responsibilities for their organization.\n\n\
  \ You can update the name assigned to a transfer.\n\
  \ "]
