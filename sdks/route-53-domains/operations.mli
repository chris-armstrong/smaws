open Types

module TransferDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DomainLimitExceeded of domain_limit_exceeded
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    transfer_domain_request ->
    ( transfer_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DomainLimitExceeded of domain_limit_exceeded
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    transfer_domain_request ->
    ( transfer_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DomainLimitExceeded of domain_limit_exceeded
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Transfers a domain from another registrar to Amazon Route 53. \n\n\
  \ For more information about transferring domains, see the following topics:\n\
  \ \n\
  \  {ul\n\
  \        {-  For transfer requirements, a detailed procedure, and information about viewing the \
   status of a domain that you're transferring to Route 53, see \
   {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-to-route-53.html}Transferring \
   Registration for a Domain to Amazon Route 53} in the {i Amazon Route 53 Developer Guide}.\n\
  \            \n\
  \             }\n\
  \        {-  For information about how to transfer a domain from one Amazon Web Services account \
   to another, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html}TransferDomainToAnotherAwsAccount}. \n\
  \            \n\
  \             }\n\
  \        {-  For information about how to transfer a domain to another domain registrar, see \
   {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-transfer-from-route-53.html}Transferring \
   a Domain from Amazon Route 53 to Another Registrar} in the {i Amazon Route 53 Developer Guide}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    During the transfer of any country code top-level domains (ccTLDs) to Route 53, except for \
   .cc and .tv, updates to the owner contact are ignored and the owner contact data from the \
   registry is used. You can update the owner contact after the transfer is complete. For more \
   information, see \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_UpdateDomainContact.html}UpdateDomainContact}.\n\
  \    \n\
  \      If the registrar for your domain is also the DNS service provider for the domain, we \
   highly recommend that you transfer your DNS service to Route 53 or to another DNS service \
   provider before you transfer your registration. Some registrars provide free DNS service when \
   you purchase a domain registration. When you transfer the registration, the previous registrar \
   will not renew your domain registration and could end your DNS service at any time.\n\
  \      \n\
  \        If the registrar for your domain is also the DNS service provider for the domain and \
   you don't transfer DNS service to another provider, your website, email, and the web \
   applications associated with the domain might become unavailable.\n\
  \        \n\
  \          If the transfer is successful, this method returns an operation ID that you can use \
   to track the progress and completion of the action. If the transfer doesn't complete \
   successfully, the domain registrant will be notified by email.\n\
  \          "]

module TransferDomainToAnotherAwsAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    transfer_domain_to_another_aws_account_request ->
    ( transfer_domain_to_another_aws_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    transfer_domain_to_another_aws_account_request ->
    ( transfer_domain_to_another_aws_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Transfers a domain from the current Amazon Web Services account to another Amazon Web Services \
   account. Note the following:\n\n\
  \ {ul\n\
  \       {-  The Amazon Web Services account that you're transferring the domain to must accept \
   the transfer. If the other account doesn't accept the transfer within 3 days, we cancel the \
   transfer. See \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html}AcceptDomainTransferFromAnotherAwsAccount}. \n\
  \           \n\
  \            }\n\
  \       {-  You can cancel the transfer before the other account accepts it. See \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_CancelDomainTransferToAnotherAwsAccount.html}CancelDomainTransferToAnotherAwsAccount}. \n\
  \           \n\
  \            }\n\
  \       {-  The other account can reject the transfer. See \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_RejectDomainTransferFromAnotherAwsAccount.html}RejectDomainTransferFromAnotherAwsAccount}. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \    When you transfer a domain from one Amazon Web Services account to another, Route 53 \
   doesn't transfer the hosted zone that is associated with the domain. DNS resolution isn't \
   affected if the domain and the hosted zone are owned by separate accounts, so transferring the \
   hosted zone is optional. For information about transferring the hosted zone to another Amazon \
   Web Services account, see \
   {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-migrating.html}Migrating \
   a Hosted Zone to a Different Amazon Web Services Account} in the {i Amazon Route 53 Developer \
   Guide}.\n\
  \    \n\
  \      Use either \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html}ListOperations} \
   or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   to determine whether the operation succeeded. \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   provides additional information, for example, [Domain Transfer from Aws Account 111122223333 \
   has been cancelled]. \n\
  \      "]

module UpdateDomainContact : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_domain_contact_request ->
    ( update_domain_contact_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_domain_contact_request ->
    ( update_domain_contact_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation updates the contact information for a particular domain. You must specify \
   information for at least one contact: registrant, administrator, or technical.\n\n\
  \ If the update is successful, this method returns an operation ID that you can use to track the \
   progress and completion of the operation. If the request is not completed successfully, the \
   domain registrant will be notified by email.\n\
  \ "]

module UpdateDomainContactPrivacy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_domain_contact_privacy_request ->
    ( update_domain_contact_privacy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_domain_contact_privacy_request ->
    ( update_domain_contact_privacy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation updates the specified domain contact's privacy setting. When privacy protection \
   is enabled, your contact information is replaced with contact information for the registrar or \
   with the phrase \"REDACTED FOR PRIVACY\", or \"On behalf of  owner.\"\n\n\
  \  While some domains may allow different privacy settings per contact, we recommend specifying \
   the same privacy setting for all contacts.\n\
  \  \n\
  \    This operation affects only the contact information for the specified contact type \
   (administrative, registrant, or technical). If the request succeeds, Amazon Route 53 returns an \
   operation ID that you can use with \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   to track the progress and completion of the action. If the request doesn't complete \
   successfully, the domain registrant will be notified by email.\n\
  \    \n\
  \      By disabling the privacy service via API, you consent to the publication of the contact \
   information provided for this domain via the public WHOIS database. You certify that you are \
   the registrant of this domain name and have the authority to make this decision. You may \
   withdraw your consent at any time by enabling privacy protection using either \
   [UpdateDomainContactPrivacy] or the Route 53 console. Enabling privacy protection removes the \
   contact information provided for this domain from the WHOIS database. For more information on \
   our privacy practices, see {{:https://aws.amazon.com/privacy/}https://aws.amazon.com/privacy/}.\n\
  \      \n\
  \       "]

module UpdateDomainNameservers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_domain_nameservers_request ->
    ( update_domain_nameservers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_domain_nameservers_request ->
    ( update_domain_nameservers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation replaces the current set of name servers for the domain with the specified set \
   of name servers. If you use Amazon Route 53 as your DNS service, specify the four name servers \
   in the delegation set for the hosted zone for the domain.\n\n\
  \ If successful, this operation returns an operation ID that you can use to track the progress \
   and completion of the action. If the request is not completed successfully, the domain \
   registrant will be notified by email.\n\
  \ "]

module UpdateTagsForDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_tags_for_domain_request ->
    ( update_tags_for_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_tags_for_domain_request ->
    ( update_tags_for_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation adds or updates tags for a specified domain.\n\n\
  \ All tag operations are eventually consistent; subsequent operations might not immediately \
   represent all issued operations.\n\
  \ "]

module ViewBilling : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    view_billing_request ->
    ( view_billing_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    view_billing_request ->
    ( view_billing_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns all the domain-related billing records for the current Amazon Web Services account for \
   a specified period\n"]

module RetrieveDomainAuthCode : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `TLDInMaintenance of tld_in_maintenance
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retrieve_domain_auth_code_request ->
    ( retrieve_domain_auth_code_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retrieve_domain_auth_code_request ->
    ( retrieve_domain_auth_code_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation returns the authorization code for the domain. To transfer a domain to another \
   registrar, you provide this value to the new registrar.\n"]

module ResendOperationAuthorization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `TLDInMaintenance of tld_in_maintenance ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resend_operation_authorization_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resend_operation_authorization_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Resend the form of authorization email for this operation. \n"]

module ResendContactReachabilityEmail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDInMaintenance of tld_in_maintenance
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resend_contact_reachability_email_request ->
    ( resend_contact_reachability_email_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resend_contact_reachability_email_request ->
    ( resend_contact_reachability_email_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For operations that require confirmation that the email address for the registrant contact is \
   valid, such as registering a new domain, this operation resends the confirmation email to the \
   current email address for the registrant contact.\n"]

module RenewDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    renew_domain_request ->
    ( renew_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    renew_domain_request ->
    ( renew_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation renews a domain for the specified number of years. The cost of renewing your \
   domain is billed to your Amazon Web Services account.\n\n\
  \ We recommend that you renew your domain several weeks before the expiration date. Some TLD \
   registries delete domains before the expiration date if you haven't renewed far enough in \
   advance. For more information about renewing domain registration, see \
   {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-renew.html}Renewing \
   Registration for a Domain} in the {i Amazon Route 53 Developer Guide}.\n\
  \ "]

module RejectDomainTransferFromAnotherAwsAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_domain_transfer_from_another_aws_account_request ->
    ( reject_domain_transfer_from_another_aws_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_domain_transfer_from_another_aws_account_request ->
    ( reject_domain_transfer_from_another_aws_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Rejects the transfer of a domain from another Amazon Web Services account to the current Amazon \
   Web Services account. You initiate a transfer betweenAmazon Web Services accounts using \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html}TransferDomainToAnotherAwsAccount}. \
   \n\n\
  \ Use either \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html}ListOperations} \
   or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   to determine whether the operation succeeded. \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   provides additional information, for example, [Domain Transfer from Aws Account 111122223333 \
   has been cancelled]. \n\
  \ "]

module RegisterDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DomainLimitExceeded of domain_limit_exceeded
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_domain_request ->
    ( register_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DomainLimitExceeded of domain_limit_exceeded
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_domain_request ->
    ( register_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DomainLimitExceeded of domain_limit_exceeded
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation registers a domain. For some top-level domains (TLDs), this operation requires \
   extra parameters.\n\n\
  \ When you register a domain, Amazon Route 53 does the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  Creates a Route 53 hosted zone that has the same name as the domain. Route 53 \
   assigns four name servers to your hosted zone and automatically updates your domain \
   registration with the names of these name servers.\n\
  \            \n\
  \             }\n\
  \        {-  Enables auto renew, so your domain registration will renew automatically each year. \
   We'll notify you in advance of the renewal date so you can choose whether to renew the \
   registration.\n\
  \            \n\
  \             }\n\
  \        {-  Optionally enables privacy protection, so WHOIS queries return contact for the \
   registrar or the phrase \"REDACTED FOR PRIVACY\", or \"On behalf of  owner.\" If you don't \
   enable privacy protection, WHOIS queries return the information that you entered for the \
   administrative, registrant, and technical contacts.\n\
  \            \n\
  \              While some domains may allow different privacy settings per contact, we recommend \
   specifying the same privacy setting for all contacts.\n\
  \              \n\
  \                }\n\
  \        {-  If registration is successful, returns an operation ID that you can use to track \
   the progress and completion of the action. If the request is not completed successfully, the \
   domain registrant is notified by email.\n\
  \            \n\
  \             }\n\
  \        {-  Charges your Amazon Web Services account an amount based on the top-level domain. \
   For more information, see {{:http://aws.amazon.com/route53/pricing/}Amazon Route 53 Pricing}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module PushDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDInMaintenance of tld_in_maintenance
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    push_domain_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    push_domain_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Moves a domain from Amazon Web Services to another registrar. \n\n\
  \ Supported actions:\n\
  \ \n\
  \  {ul\n\
  \        {-  Changes the IPS tags of a .uk domain, and pushes it to transit. Transit means that \
   the domain is ready to be transferred to another registrar.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ListTagsForDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_domain_request ->
    ( list_tags_for_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_domain_request ->
    ( list_tags_for_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation returns all of the tags that are associated with the specified domain.\n\n\
  \ All tag operations are eventually consistent; subsequent operations might not immediately \
   represent all issued operations.\n\
  \ "]

module ListPrices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_prices_request ->
    ( list_prices_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_prices_request ->
    ( list_prices_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the following prices for either all the TLDs supported by Route\194\16053, or the \
   specified TLD:\n\n\
  \ {ul\n\
  \       {-  Registration\n\
  \           \n\
  \            }\n\
  \       {-  Transfer\n\
  \           \n\
  \            }\n\
  \       {-  Owner change\n\
  \           \n\
  \            }\n\
  \       {-  Domain renewal\n\
  \           \n\
  \            }\n\
  \       {-  Domain restoration\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module ListOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_operations_request ->
    ( list_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_operations_request ->
    ( list_operations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about all of the operations that return an operation ID and that have ever \
   been performed on domains that were registered by the current account. \n\n\
  \ This command runs only in the us-east-1 Region.\n\
  \ "]

module ListDomains : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_domains_request ->
    ( list_domains_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_domains_request ->
    ( list_domains_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation returns all the domain names registered with Amazon Route 53 for the current \
   Amazon Web Services account if no filtering conditions are used.\n"]

module GetOperationDetail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_operation_detail_request ->
    ( get_operation_detail_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_operation_detail_request ->
    ( get_operation_detail_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "This operation returns the current status of an operation that is not completed.\n"]

module GetDomainSuggestions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `TLDInMaintenance of tld_in_maintenance
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_domain_suggestions_request ->
    ( get_domain_suggestions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_domain_suggestions_request ->
    ( get_domain_suggestions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The GetDomainSuggestions operation returns a list of suggested domain names.\n"]

module GetDomainDetail : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_domain_detail_request ->
    ( get_domain_detail_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_domain_detail_request ->
    ( get_domain_detail_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation returns detailed information about a specified domain that is associated with \
   the current Amazon Web Services account. Contact information for the domain is also returned as \
   part of the output.\n"]

module GetContactReachabilityStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_contact_reachability_status_request ->
    ( get_contact_reachability_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_contact_reachability_status_request ->
    ( get_contact_reachability_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For operations that require confirmation that the email address for the registrant contact is \
   valid, such as registering a new domain, this operation returns information about whether the \
   registrant contact has responded.\n\n\
  \ If you want us to resend the email, use the [ResendContactReachabilityEmail] operation.\n\
  \ "]

module EnableDomainTransferLock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_domain_transfer_lock_request ->
    ( enable_domain_transfer_lock_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_domain_transfer_lock_request ->
    ( enable_domain_transfer_lock_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation sets the transfer lock on the domain (specifically the \
   [clientTransferProhibited] status) to prevent domain transfers. Successful submission returns \
   an operation ID that you can use to track the progress and completion of the action. If the \
   request is not completed successfully, the domain registrant will be notified by email.\n"]

module EnableDomainAutoRenew : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_domain_auto_renew_request ->
    ( enable_domain_auto_renew_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_domain_auto_renew_request ->
    ( enable_domain_auto_renew_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation configures Amazon Route 53 to automatically renew the specified domain before \
   the domain registration expires. The cost of renewing your domain registration is billed to \
   your Amazon Web Services account.\n\n\
  \ The period during which you can renew a domain name varies by TLD. For a list of TLDs and \
   their renewal policies, see \
   {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/registrar-tld-list.html}Domains \
   That You Can Register with Amazon Route 53} in the {i Amazon Route 53 Developer Guide}. Route \
   53 requires that you renew before the end of the renewal period so we can complete processing \
   before the deadline.\n\
  \ "]

module DisassociateDelegationSignerFromDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_delegation_signer_from_domain_request ->
    ( disassociate_delegation_signer_from_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_delegation_signer_from_domain_request ->
    ( disassociate_delegation_signer_from_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a delegation signer (DS) record in the registry zone for this domain name.\n"]

module DisableDomainTransferLock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_domain_transfer_lock_request ->
    ( disable_domain_transfer_lock_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_domain_transfer_lock_request ->
    ( disable_domain_transfer_lock_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation removes the transfer lock on the domain (specifically the \
   [clientTransferProhibited] status) to allow domain transfers. We recommend you refrain from \
   performing this action unless you intend to transfer the domain to a different registrar. \
   Successful submission returns an operation ID that you can use to track the progress and \
   completion of the action. If the request is not completed successfully, the domain registrant \
   will be notified by email.\n"]

module DisableDomainAutoRenew : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_domain_auto_renew_request ->
    ( disable_domain_auto_renew_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_domain_auto_renew_request ->
    ( disable_domain_auto_renew_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation disables automatic renewal of domain registration for the specified domain.\n"]

module DeleteTagsForDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_for_domain_request ->
    ( delete_tags_for_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_tags_for_domain_request ->
    ( delete_tags_for_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation deletes the specified tags for a domain.\n\n\
  \ All tag operations are eventually consistent; subsequent operations might not immediately \
   represent all issued operations.\n\
  \ "]

module DeleteDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_domain_request ->
    ( delete_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_domain_request ->
    ( delete_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation deletes the specified domain. This action is permanent. For more information, \
   see {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/domain-delete.html}Deleting a \
   domain name registration}.\n\n\
  \ To transfer the domain registration to another registrar, use the transfer process \
   that\226\128\153s provided by the registrar to which you want to transfer the registration. \
   Otherwise, the following apply:\n\
  \ \n\
  \  {ol\n\
  \        {-  You can\226\128\153t get a refund for the cost of a deleted domain registration.\n\
  \            \n\
  \             }\n\
  \        {-  The registry for the top-level domain might hold the domain name for a brief time \
   before releasing it for other users to register (varies by registry). \n\
  \            \n\
  \             }\n\
  \        {-  When the registration has been deleted, we'll send you a confirmation to the \
   registrant contact. The email will come from [noreply@domainnameverification.net] or \
   [noreply@emailverification.info] or [noreply@registrar.amazon].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module CheckDomainTransferability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `TLDInMaintenance of tld_in_maintenance
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_domain_transferability_request ->
    ( check_domain_transferability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_domain_transferability_request ->
    ( check_domain_transferability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Checks whether a domain name can be transferred to Amazon Route 53. \n"]

module CheckDomainAvailability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `TLDInMaintenance of tld_in_maintenance
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    check_domain_availability_request ->
    ( check_domain_availability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    check_domain_availability_request ->
    ( check_domain_availability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `TLDInMaintenance of tld_in_maintenance
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation checks the availability of one domain name. Note that if the availability status \
   of a domain is pending, you must submit another request to determine the availability of the \
   domain name.\n"]

module CancelDomainTransferToAnotherAwsAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_domain_transfer_to_another_aws_account_request ->
    ( cancel_domain_transfer_to_another_aws_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_domain_transfer_to_another_aws_account_request ->
    ( cancel_domain_transfer_to_another_aws_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels the transfer of a domain from the current Amazon Web Services account to another Amazon \
   Web Services account. You initiate a transfer betweenAmazon Web Services accounts using \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html}TransferDomainToAnotherAwsAccount}. \
   \n\n\
  \  You must cancel the transfer before the other Amazon Web Services account accepts the \
   transfer using \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_AcceptDomainTransferFromAnotherAwsAccount.html}AcceptDomainTransferFromAnotherAwsAccount}.\n\
  \  \n\
  \    Use either \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html}ListOperations} \
   or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   to determine whether the operation succeeded. \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   provides additional information, for example, [Domain Transfer from Aws Account 111122223333 \
   has been cancelled]. \n\
  \    "]

module AssociateDelegationSignerToDomain : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DnssecLimitExceeded of dnssec_limit_exceeded
    | `DuplicateRequest of duplicate_request
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `TLDRulesViolation of tld_rules_violation
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_delegation_signer_to_domain_request ->
    ( associate_delegation_signer_to_domain_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DnssecLimitExceeded of dnssec_limit_exceeded
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_delegation_signer_to_domain_request ->
    ( associate_delegation_signer_to_domain_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DnssecLimitExceeded of dnssec_limit_exceeded
      | `DuplicateRequest of duplicate_request
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `TLDRulesViolation of tld_rules_violation
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a delegation signer (DS) record in the registry zone for this domain name.\n\n\
  \ Note that creating DS record at the registry impacts DNSSEC validation of your DNS records. \
   This action may render your domain name unavailable on the internet if the steps are completed \
   in the wrong order, or with incorrect timing. For more information about DNSSEC signing, see \
   {{:https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-configuring-dnssec.html}Configuring \
   DNSSEC signing} in the {i Route\194\16053 developer guide}.\n\
  \ "]

module AcceptDomainTransferFromAnotherAwsAccount : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DomainLimitExceeded of domain_limit_exceeded
    | `InvalidInput of invalid_input
    | `OperationLimitExceeded of operation_limit_exceeded
    | `UnsupportedTLD of unsupported_tl_d ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_domain_transfer_from_another_aws_account_request ->
    ( accept_domain_transfer_from_another_aws_account_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DomainLimitExceeded of domain_limit_exceeded
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_domain_transfer_from_another_aws_account_request ->
    ( accept_domain_transfer_from_another_aws_account_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DomainLimitExceeded of domain_limit_exceeded
      | `InvalidInput of invalid_input
      | `OperationLimitExceeded of operation_limit_exceeded
      | `UnsupportedTLD of unsupported_tl_d ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts the transfer of a domain from another Amazon Web Services account to the currentAmazon \
   Web Services account. You initiate a transfer between Amazon Web Services accounts using \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_TransferDomainToAnotherAwsAccount.html}TransferDomainToAnotherAwsAccount}.\n\n\
  \ If you use the CLI command at \
   {{:https://docs.aws.amazon.com/cli/latest/reference/route53domains/accept-domain-transfer-from-another-aws-account.html}accept-domain-transfer-from-another-aws-account}, \
   use JSON format as input instead of text because otherwise CLI will throw an error from domain \
   transfer input that includes single quotes.\n\
  \ \n\
  \  Use either \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_ListOperations.html}ListOperations} \
   or \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   to determine whether the operation succeeded. \
   {{:https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_GetOperationDetail.html}GetOperationDetail} \
   provides additional information, for example, [Domain Transfer from Aws Account 111122223333 \
   has been cancelled]. \n\
  \  "]
