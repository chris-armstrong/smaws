open Types
module DescribeAgreement :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_agreement_input ->
        (describe_agreement_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Provides details about an agreement, such as the proposer, acceptor, start date, and end date.\n"]
module GetAgreementTerms :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_agreement_terms_input ->
        (get_agreement_terms_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Obtains details about the terms in an agreement that you participated in as proposer or acceptor.\n\n The details include:\n \n  {ul\n        {-   [TermType] \226\128\147 The type of term, such as [LegalTerm], [RenewalTerm], or [ConfigurableUpfrontPricingTerm].\n            \n             }\n        {-   [TermID] \226\128\147 The ID of the particular term, which is common between offer and agreement.\n            \n             }\n        {-   [TermPayload] \226\128\147 The key information contained in the term, such as the EULA for [LegalTerm] or pricing and dimensions for various pricing terms, such as [ConfigurableUpfrontPricingTerm] or [UsageBasedPricingTerm].\n            \n             }\n        }\n   {ul\n         {-   [Configuration] \226\128\147 The buyer/acceptor's selection at the time of agreement creation, such as the number of units purchased for a dimension or setting the [EnableAutoRenew] flag.\n             \n              }\n         }\n  "]
module SearchAgreements :
sig
  val request :
    Smaws_Lib.Context.t ->
      search_agreements_input ->
        (search_agreements_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Searches across all agreements that a proposer or an acceptor has in AWS Marketplace. The search returns a list of agreements with basic agreement information.\n\n The following filter combinations are supported:\n \n  {ul\n        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceIdentifier] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [OfferId] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [Status] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceIdentifier] + [Status] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [OfferId] + [Status] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [Status] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [ResourceType] + [Status] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceType] + [Status] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [OfferId] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [OfferId] + [Status] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [Status] \n            \n             }\n        {-   [PartyType] as [Proposer] + [AgreementType] + [AcceptorAccountId] + [ResourceType] \n            \n             }\n        }\n  "]