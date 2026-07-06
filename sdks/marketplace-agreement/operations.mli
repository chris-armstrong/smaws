open Types

module AcceptAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_cancellation_request_input ->
    ( accept_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_cancellation_request_input ->
    ( accept_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows buyers (acceptors) to accept a cancellation request that is in [PENDING_APPROVAL] \
   status. Once accepted, the cancellation request transitions to [APPROVED] status and the \
   agreement cancellation will be processed.\n\n\
  \  Only cancellation requests in [PENDING_APPROVAL] status can be accepted. A \
   [ConflictException] is thrown if the cancellation request is in any other status.\n\
  \  \n\
  \   "]

module AcceptAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_payment_request_input ->
    ( accept_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_payment_request_input ->
    ( accept_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows buyers (acceptors) to accept a payment request that is in [PENDING_APPROVAL] status. \
   Once accepted, the payment request transitions to [APPROVED] status and the charge will be \
   processed. Buyers can optionally provide a purchase order reference for their internal \
   tracking.\n\n\
  \  Only payment requests in [PENDING_APPROVAL] status can be accepted. A [ConflictException] is \
   thrown if the payment request is in any other status.\n\
  \  \n\
  \   "]

module AcceptAgreementRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_request_input ->
    ( accept_agreement_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    accept_agreement_request_input ->
    ( accept_agreement_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Accepts an agreement request to finalize the agreement. The acceptor can optionally provide \
   purchase orders to associate with the agreement charges.\n"]

module BatchCreateBillingAdjustmentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_create_billing_adjustment_request_input ->
    ( batch_create_billing_adjustment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_create_billing_adjustment_request_input ->
    ( batch_create_billing_adjustment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to submit billing adjustment requests for one or more invoices \
   within an agreement. Each entry in the batch specifies an invoice and the adjustment amount. \
   The operation returns successfully created adjustment request IDs and any errors for entries \
   that failed to process.\n\n\
  \  Each entry requires a unique [clientToken] for idempotency.\n\
  \  \n\
  \   "]

module CancelAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_input ->
    ( cancel_agreement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_input ->
    ( cancel_agreement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows an acceptor to cancel an active agreement. Not all agreements are eligible for \
   cancellation. Use the error response to determine why a cancellation request was rejected.\n"]

module CancelAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_cancellation_request_input ->
    ( cancel_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_cancellation_request_input ->
    ( cancel_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to withdraw an existing agreement cancellation request that is in a \
   pending state. Once cancelled, the cancellation request transitions to [CANCELLED] status and \
   can no longer be approved or rejected by the buyer.\n\n\
  \  Only cancellation requests in [PENDING_APPROVAL] status can be cancelled. A \
   [ConflictException] is thrown if the cancellation request is in any other status.\n\
  \  \n\
  \   "]

module CancelAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_payment_request_input ->
    ( cancel_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_agreement_payment_request_input ->
    ( cancel_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to cancel a payment request that is in [PENDING_APPROVAL] status. \
   Once cancelled, the payment request transitions to [CANCELLED] status and can no longer be \
   accepted or rejected by the buyer.\n\n\
  \  Only payment requests in [PENDING_APPROVAL] status can be cancelled. A [ConflictException] is \
   thrown if the payment request is in any other status.\n\
  \  \n\
  \   "]

module CreateAgreementRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_agreement_request_input ->
    ( create_agreement_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_agreement_request_input ->
    ( create_agreement_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an agreement request that acts as a quote for the terms you want to accept. The \
   agreement request captures the requested terms, calculates charges, and returns a summary. Use \
   [AcceptAgreementRequest] with the returned [agreementRequestId] to finalize the agreement.\n"]

module DescribeAgreement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_agreement_input ->
    ( describe_agreement_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_agreement_input ->
    ( describe_agreement_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides details about an agreement, such as the proposer, acceptor, start date, and end date.\n"]

module GetAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_cancellation_request_input ->
    ( get_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_cancellation_request_input ->
    ( get_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific agreement cancellation request. Both sellers \
   (proposers) and buyers (acceptors) can use this operation to view cancellation requests \
   associated with their agreements.\n"]

module GetAgreementEntitlements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_entitlements_input ->
    ( get_agreement_entitlements_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_entitlements_input ->
    ( get_agreement_entitlements_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Obtains details about the entitlements of an agreement.\n"]

module GetAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_payment_request_input ->
    ( get_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_payment_request_input ->
    ( get_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific payment request. Both sellers (proposers) and \
   buyers (acceptors) can use this operation to view payment requests associated with their \
   agreements. The response includes the current status, charge details, timestamps, and the \
   charge ID if the request has been approved.\n\n\
  \  The calling identity must be either the acceptor or proposer of the payment request. A \
   [ResourceNotFoundException] is returned if the payment request does not exist.\n\
  \  \n\
  \   "]

module GetAgreementTerms : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_terms_input ->
    ( get_agreement_terms_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_agreement_terms_input ->
    ( get_agreement_terms_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Obtains details about the terms in an agreement that you participated in as proposer or \
   acceptor.\n\n\
  \ The details include:\n\
  \ \n\
  \  {ul\n\
  \        {-   [TermType] \226\128\147 The type of term, such as [LegalTerm], [RenewalTerm], or \
   [ConfigurableUpfrontPricingTerm].\n\
  \            \n\
  \             }\n\
  \        {-   [TermID] \226\128\147 The ID of the particular term, which is common between offer \
   and agreement.\n\
  \            \n\
  \             }\n\
  \        {-   [TermPayload] \226\128\147 The key information contained in the term, such as the \
   EULA for [LegalTerm] or pricing and dimensions for various pricing terms, such as \
   [ConfigurableUpfrontPricingTerm] or [UsageBasedPricingTerm].\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   {ul\n\
  \         {-   [Configuration] \226\128\147 The buyer/acceptor's selection at the time of \
   agreement creation, such as the number of units purchased for a dimension or setting the \
   [EnableAutoRenew] flag.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module GetBillingAdjustmentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_billing_adjustment_request_input ->
    ( get_billing_adjustment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_billing_adjustment_request_input ->
    ( get_billing_adjustment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information about a specific billing adjustment request. Sellers (proposers) \
   can use this operation to view the status and details of a billing adjustment request they \
   submitted.\n"]

module ListAgreementCancellationRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_cancellation_requests_input ->
    ( list_agreement_cancellation_requests_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_cancellation_requests_input ->
    ( list_agreement_cancellation_requests_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists agreement cancellation requests available to you as a seller or buyer. Both sellers \
   (proposers) and buyers (acceptors) can use this operation to find cancellation requests by \
   specifying their party type and applying optional filters.\n\n\
  \   [PartyType] is a required parameter. A [ValidationException] is returned if [PartyType] is \
   not provided.\n\
  \  \n\
  \   "]

module ListAgreementCharges : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_charges_input ->
    ( list_agreement_charges_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_charges_input ->
    ( list_agreement_charges_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows acceptors to view charges and purchase orders that are associated with an agreement. The \
   response includes details about all charges regardless of whether a purchase order is linked to \
   each charge.\n"]

module ListAgreementInvoiceLineItems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_invoice_line_items_input ->
    ( list_agreement_invoice_line_items_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_invoice_line_items_input ->
    ( list_agreement_invoice_line_items_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to retrieve aggregated billing data from AWS Marketplace agreements \
   using flexible grouping. Supports invoice-level aggregation with filtering by billing period, \
   invoice type, and issued date.\n\n\
  \  The [groupBy] parameter is required and supports only [INVOICE_ID] as a value. The \
   [agreementId] parameter is required.\n\
  \  \n\
  \   "]

module ListAgreementPaymentRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_payment_requests_input ->
    ( list_agreement_payment_requests_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_agreement_payment_requests_input ->
    ( list_agreement_payment_requests_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists payment requests available to you as a seller or buyer. Both sellers (proposers) and \
   buyers (acceptors) can use this operation to find payment requests by specifying their party \
   type and applying optional parameters.\n\n\
  \   [PartyType] is a required parameter. A [ValidationException] is returned if [PartyType] is \
   not provided. Pagination is supported through [maxResults] (1-50, default 50) and [nextToken] \
   parameters.\n\
  \  \n\
  \   "]

module ListBillingAdjustmentRequests : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_billing_adjustment_requests_input ->
    ( list_billing_adjustment_requests_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_billing_adjustment_requests_input ->
    ( list_billing_adjustment_requests_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists billing adjustment requests for a specific agreement. Sellers (proposers) can use this \
   operation to view all billing adjustment requests associated with an agreement.\n"]

module RejectAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_agreement_cancellation_request_input ->
    ( reject_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_agreement_cancellation_request_input ->
    ( reject_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows buyers (acceptors) to reject a cancellation request that is in [PENDING_APPROVAL] \
   status. Once rejected, the cancellation request transitions to [REJECTED] status and the \
   agreement remains active. Buyers must provide a reason for the rejection.\n\n\
  \  Only cancellation requests in [PENDING_APPROVAL] status can be rejected. A \
   [ConflictException] is thrown if the cancellation request is in any other status.\n\
  \  \n\
  \   "]

module RejectAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reject_agreement_payment_request_input ->
    ( reject_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reject_agreement_payment_request_input ->
    ( reject_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows buyers (acceptors) to reject a payment request that is in [PENDING_APPROVAL] status. \
   Once rejected, the payment request transitions to [REJECTED] status and cannot be accepted. \
   Buyers can optionally provide a reason for the rejection.\n\n\
  \  Only payment requests in [PENDING_APPROVAL] status can be rejected. A [ConflictException] is \
   thrown if the payment request is in any other status.\n\
  \  \n\
  \   "]

module SearchAgreements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    search_agreements_input ->
    ( search_agreements_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    search_agreements_input ->
    ( search_agreements_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches across all agreements that a proposer or an acceptor has in AWS Marketplace. The \
   search returns a list of agreements with basic agreement information.\n\n\
  \ The following filter combinations are supported when the [PartyType] is [Proposer]:\n\
  \ \n\
  \  {ul\n\
  \        {-   [AgreementType] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceType] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceType] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceType] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceType] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceIdentifier] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceIdentifier] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceIdentifier] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [ResourceIdentifier] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [OfferId] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [OfferId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [OfferId] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [OfferId] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceIdentifier] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceType] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceType] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceType] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [AcceptorAccountId] + [ResourceType] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferId] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferId] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferId] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferSetId] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferSetId] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferSetId] + [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [AgreementType] + [OfferSetId] + [Status] + [EndTime] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \     To filter by [EndTime], you can use [BeforeEndTime] and/or [AfterEndTime]. Only [EndTime] \
   is supported for sorting.\n\
  \    \n\
  \      The following filter combinations are supported when the [PartyType] is [Acceptor]:\n\
  \      \n\
  \       {ul\n\
  \             {-   [AgreementType] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [Status] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [Status] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceIdentifier] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceIdentifier] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceIdentifier] + [Status] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceIdentifier] + [Status] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceType] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [ResourceType] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferId] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferId] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferId] + [Status] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferId] + [Status] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferSetId] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferSetId] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferSetId] + [Status] \n\
  \                 \n\
  \                  }\n\
  \             {-   [AgreementType] + [OfferSetId] + [Status] + [EndTime] \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module SendAgreementCancellationRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_agreement_cancellation_request_input ->
    ( send_agreement_cancellation_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_agreement_cancellation_request_input ->
    ( send_agreement_cancellation_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to submit a cancellation request for an active agreement. The \
   cancellation request is created in [PENDING_APPROVAL] status, at which point the buyer can \
   review it.\n"]

module SendAgreementPaymentRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_agreement_payment_request_input ->
    ( send_agreement_payment_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_agreement_payment_request_input ->
    ( send_agreement_payment_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows sellers (proposers) to submit a payment request to buyers (acceptors) for a specific \
   charge amount for an agreement that includes a [VariablePaymentTerm]. The payment request is \
   created in [PENDING_APPROVAL] status, at which point the buyer can accept or reject it.\n\n\
  \  The agreement must be active and have a [VariablePaymentTerm] to support payment requests. \
   The [chargeAmount] must not exceed the remaining available balance under the \
   [VariablePaymentTerm] [maxTotalChargeAmount].\n\
  \  \n\
  \   "]

module UpdatePurchaseOrders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_purchase_orders_input ->
    ( update_purchase_orders_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_purchase_orders_input ->
    ( update_purchase_orders_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Allows acceptors to associate purchase orders with agreement charges after an agreement is \
   created.\n"]
