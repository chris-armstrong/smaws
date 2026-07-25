type nonrec aws_account_id = string [@@ocaml.doc ""]

type nonrec bounded_string = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  name : bounded_string; [@ocaml.doc "The name of the field associated with the error.\n"]
  message : bounded_string; [@ocaml.doc "See applicable actions.\n"]
}
[@@ocaml.doc "The input fails to satisfy the constraints specified by the service.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | MISSING_BILLING_ADJUSTMENTS [@ocaml.doc ""]
  | BILLING_ADJUSTMENTS_LIMIT_EXCEEDED [@ocaml.doc ""]
  | MISSING_INVOICE_ID [@ocaml.doc ""]
  | INVALID_ADJUSTMENT_AMOUNT [@ocaml.doc ""]
  | MISSING_ADJUSTMENT_AMOUNT [@ocaml.doc ""]
  | INVALID_REASON_CODE [@ocaml.doc ""]
  | MISSING_REASON_CODE [@ocaml.doc ""]
  | MISSING_DESCRIPTION [@ocaml.doc ""]
  | INVALID_INVOICE_ADJUSTMENT_PERIOD [@ocaml.doc ""]
  | INVALID_CURRENCY_CODE [@ocaml.doc ""]
  | MISSING_CURRENCY_CODE [@ocaml.doc ""]
  | EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT [@ocaml.doc ""]
  | MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY [@ocaml.doc ""]
  | MULTIPLE_AGREEMENT_IDS [@ocaml.doc ""]
  | INVALID_AGREEMENT_CANCELLATION_REQUEST_ID [@ocaml.doc ""]
  | MISSING_AGREEMENT_CANCELLATION_REQUEST_ID [@ocaml.doc ""]
  | MISSING_REASON [@ocaml.doc ""]
  | INVALID_REASON [@ocaml.doc ""]
  | INVALID_STATUS [@ocaml.doc ""]
  | INVALID_AGREEMENT_ID [@ocaml.doc ""]
  | MISSING_AGREEMENT_ID [@ocaml.doc ""]
  | INVALID_CATALOG [@ocaml.doc ""]
  | INVALID_FILTERS [@ocaml.doc ""]
  | INVALID_FILTER_NAME [@ocaml.doc ""]
  | MISSING_FILTER_NAME [@ocaml.doc ""]
  | INVALID_FILTER_VALUES [@ocaml.doc ""]
  | MISSING_FILTER_VALUES [@ocaml.doc ""]
  | INVALID_SORT_BY [@ocaml.doc ""]
  | INVALID_SORT_ORDER [@ocaml.doc ""]
  | INVALID_NEXT_TOKEN [@ocaml.doc ""]
  | INVALID_MAX_RESULTS [@ocaml.doc ""]
  | INVALID_TERM_ID [@ocaml.doc ""]
  | MISSING_TERM_ID [@ocaml.doc ""]
  | MISSING_NAME [@ocaml.doc ""]
  | INVALID_NAME [@ocaml.doc ""]
  | INVALID_DESCRIPTION [@ocaml.doc ""]
  | MISSING_CHARGE_AMOUNT [@ocaml.doc ""]
  | INVALID_CHARGE_AMOUNT [@ocaml.doc ""]
  | MISSING_PAYMENT_REQUEST_ID [@ocaml.doc ""]
  | INVALID_PAYMENT_REQUEST_ID [@ocaml.doc ""]
  | MISSING_PARTY_TYPE [@ocaml.doc ""]
  | INVALID_PARTY_TYPE [@ocaml.doc ""]
  | UNSUPPORTED_FILTERS [@ocaml.doc ""]
  | INVALID_CLIENT_TOKEN [@ocaml.doc ""]
  | INVALID_INTENT [@ocaml.doc ""]
  | MISSING_INTENT [@ocaml.doc ""]
  | INVALID_SOURCE_AGREEMENT_IDENTIFIER [@ocaml.doc ""]
  | MISSING_SOURCE_AGREEMENT_IDENTIFIER [@ocaml.doc ""]
  | INVALID_AGREEMENT_PROPOSAL_IDENTIFIER [@ocaml.doc ""]
  | MISSING_AGREEMENT_PROPOSAL_IDENTIFIER [@ocaml.doc ""]
  | INVALID_REQUESTED_TERMS [@ocaml.doc ""]
  | MISSING_REQUESTED_TERMS [@ocaml.doc ""]
  | INVALID_REQUESTED_TERM_ID [@ocaml.doc ""]
  | MISSING_REQUESTED_TERM_ID [@ocaml.doc ""]
  | INVALID_REQUESTED_TERM_CONFIGURATION [@ocaml.doc ""]
  | MISSING_REQUESTED_TERM_CONFIGURATION [@ocaml.doc ""]
  | INVALID_AGREEMENT_REQUEST_ID [@ocaml.doc ""]
  | MISSING_AGREEMENT_REQUEST_ID [@ocaml.doc ""]
  | INVALID_PURCHASE_ORDERS [@ocaml.doc ""]
  | MISSING_PURCHASE_ORDERS [@ocaml.doc ""]
  | INVALID_CHARGE_ID [@ocaml.doc ""]
  | MISSING_CHARGE_ID [@ocaml.doc ""]
  | INVALID_CHARGE_REVISION [@ocaml.doc ""]
  | MISSING_CHARGE_REVISION [@ocaml.doc ""]
  | INVALID_AGREEMENT_TYPE [@ocaml.doc ""]
  | INVALID_PURCHASE_ORDER_REFERENCE [@ocaml.doc ""]
  | INACTIVE_AGREEMENT [@ocaml.doc ""]
  | SUPERSEDED_AGREEMENT_PROPOSAL [@ocaml.doc ""]
  | EXPIRED_AGREEMENT_PROPOSAL [@ocaml.doc ""]
  | MISSING_MANDATORY_TERMS [@ocaml.doc ""]
  | INCOMPATIBLE_TERMS [@ocaml.doc ""]
  | MISSING_USAGE_AGREEMENT [@ocaml.doc ""]
  | INVALID_INCREMENTAL_CHARGE [@ocaml.doc ""]
  | MISSING_ACCOUNT_ADDRESS [@ocaml.doc ""]
  | UNSUPPORTED_ACTION [@ocaml.doc ""]
  | INVALID_REJECTION_REASON [@ocaml.doc ""]
  | INVALID_PAYMENT_REQUEST_STATUS [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
  | DUPLICATE_CHARGES [@ocaml.doc ""]
  | UNSUPPORTED_ACCOUNT_PLAN [@ocaml.doc ""]
  | DUPLICATE_AGREEMENT_IN_ORGANIZATION [@ocaml.doc ""]
  | MISSING_PURCHASE_ORDER_REFERENCE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec request_id = string [@@ocaml.doc ""]

type nonrec validation_exception = {
  request_id : request_id option; [@ocaml.doc "The unique identifier associated with the error.\n"]
  message : exception_message option; [@ocaml.doc "Description of the error.\n"]
  reason : validation_exception_reason option;
      [@ocaml.doc "The reason associated with the error.\n"]
  fields : validation_exception_field_list option;
      [@ocaml.doc "The fields associated with the error.\n"]
}
[@@ocaml.doc "The input fails to satisfy the constraints specified by the service.\n"]

type nonrec throttling_exception = {
  request_id : request_id option; [@ocaml.doc "The unique identifier for the error.\n"]
  message : exception_message option; [@ocaml.doc "Description of the error.\n"]
}
[@@ocaml.doc "Request was denied due to request throttling.\n"]

type nonrec resource_type =
  | AGREEMENT [@ocaml.doc ""]
  | AGREEMENT_REQUEST [@ocaml.doc ""]
  | AGREEMENT_PROPOSAL [@ocaml.doc ""]
  | CHARGE [@ocaml.doc ""]
  | PAYMENT_REQUEST [@ocaml.doc ""]
  | INVOICE [@ocaml.doc ""]
  | AGREEMENT_CANCELLATION_REQUEST [@ocaml.doc ""]
  | BILLING_ADJUSTMENT_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec resource_not_found_exception = {
  request_id : request_id option; [@ocaml.doc "The unique identifier for the error.\n"]
  message : exception_message option; [@ocaml.doc "Description of the error.\n"]
  resource_id : resource_id option; [@ocaml.doc "The unique identifier for the resource.\n"]
  resource_type : resource_type option; [@ocaml.doc "The type of resource.\n"]
}
[@@ocaml.doc "Request references a resource which does not exist.\n"]

type nonrec internal_server_exception = {
  request_id : request_id option; [@ocaml.doc "The unique identifier for the error.\n"]
  message : exception_message option; [@ocaml.doc "Description of the error.\n"]
}
[@@ocaml.doc "Unexpected error during processing of request.\n"]

type nonrec conflict_exception = {
  request_id : request_id option; [@ocaml.doc "The unique identifier for the error.\n"]
  message : exception_message option; [@ocaml.doc "Description of the error.\n"]
  resource_id : resource_id option;
      [@ocaml.doc "The unique identifier of the resource involved in the conflict.\n"]
  resource_type : resource_type option;
      [@ocaml.doc "The type of the resource involved in the conflict.\n"]
}
[@@ocaml.doc "Request was denied due to a resource conflict.\n"]

type nonrec access_denied_exception_reason =
  | INVALID_ACCOUNT_STATE [@ocaml.doc ""]
  | DENIED_BY_PRIVATE_MARKETPLACE_POLICY [@ocaml.doc ""]
  | FAILED_KYC_COMPLIANCE [@ocaml.doc ""]
  | MISSING_MFA [@ocaml.doc ""]
  | INVALID_ACCESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec access_denied_exception = {
  request_id : request_id option; [@ocaml.doc "The unique identifier for the error.\n"]
  message : exception_message option; [@ocaml.doc "Description of the error.\n"]
  reason : access_denied_exception_reason option;
      [@ocaml.doc "The reason for the access denied exception.\n"]
}
[@@ocaml.doc "User does not have sufficient access to perform this action.\n"]

type nonrec update_purchase_orders_output = unit [@@ocaml.doc ""]

type nonrec purchase_order_reference = string [@@ocaml.doc ""]

type nonrec charge_revision = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec purchase_order = {
  charge_id : resource_id;
      [@ocaml.doc "The unique identifier of the charge to associate the purchase order with.\n"]
  charge_revision : charge_revision option; [@ocaml.doc "The revision of the charge.\n"]
  agreement_id : resource_id option;
      [@ocaml.doc "The unique identifier of the agreement associated with this charge.\n"]
  purchase_order_reference : purchase_order_reference option;
      [@ocaml.doc "The purchase order reference to associate with the charge.\n"]
}
[@@ocaml.doc
  "Contains information about a purchase order association to a charge within an agreement.\n"]

type nonrec purchase_orders = purchase_order list [@@ocaml.doc ""]

type nonrec update_purchase_orders_input = {
  purchase_orders : purchase_orders;
      [@ocaml.doc "Contains information about purchase order associations.\n"]
}
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec currency_code = string [@@ocaml.doc ""]

type nonrec positive_amount_upto8_decimals = string [@@ocaml.doc ""]

type nonrec payment_request_description = string [@@ocaml.doc ""]

type nonrec payment_request_name = string [@@ocaml.doc ""]

type nonrec payment_request_status =
  | VALIDATING [@ocaml.doc ""]
  | VALIDATION_FAILED [@ocaml.doc ""]
  | PENDING_APPROVAL [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec agreement_id = string [@@ocaml.doc ""]

type nonrec payment_request_id = string [@@ocaml.doc ""]

type nonrec send_agreement_payment_request_output = {
  payment_request_id : payment_request_id option;
      [@ocaml.doc "The unique identifier for the sent payment request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc "The agreement identifier for this payment request.\n"]
  status : payment_request_status option;
      [@ocaml.doc
        "The current status of the payment request. The initial status is [PENDING_APPROVAL].\n"]
  name : payment_request_name option; [@ocaml.doc "The descriptive name of the payment request.\n"]
  description : payment_request_description option;
      [@ocaml.doc "The detailed description of the payment request, if provided.\n"]
  charge_amount : positive_amount_upto8_decimals option;
      [@ocaml.doc "The amount being charged to the buyer.\n"]
  currency_code : currency_code option;
      [@ocaml.doc "The currency code for the charge amount (e.g., [USD]).\n"]
  created_at : timestamp option; [@ocaml.doc "The time when the payment request was created.\n"]
}
[@@ocaml.doc ""]

type nonrec term_id = string [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec send_agreement_payment_request_input = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement for which the payment request is being submitted. \
         Use [GetAgreementTerms] to retrieve agreement term details.\n"]
  term_id : term_id;
      [@ocaml.doc
        "The unique identifier of the [VariablePaymentTerm] for the agreement that the payment \
         request is being sent for.\n"]
  name : payment_request_name;
      [@ocaml.doc "A descriptive name for the payment request (5-64 characters).\n"]
  charge_amount : positive_amount_upto8_decimals;
      [@ocaml.doc
        "The amount requested to be charged to the buyer, positive decimal value in the currency \
         of the accepted term.\n\n\
        \  A [ValidationException] is returned if the [chargeAmount] exceeds the available \
         balance, if the agreement doesn't have an active [VariablePaymentTerm], or if the \
         [termId] is invalid.\n\
        \  \n\
        \   "]
  description : payment_request_description option;
      [@ocaml.doc "An optional detailed description of the payment request (1-2000 characters).\n"]
}
[@@ocaml.doc ""]

type nonrec agreement_cancellation_request_description = string [@@ocaml.doc ""]

type nonrec agreement_cancellation_request_reason_code =
  | INCORRECT_TERMS_ACCEPTED [@ocaml.doc ""]
  | REPLACING_AGREEMENT [@ocaml.doc ""]
  | TEST_AGREEMENT [@ocaml.doc ""]
  | ALTERNATIVE_PROCUREMENT_CHANNEL [@ocaml.doc ""]
  | PRODUCT_DISCONTINUED [@ocaml.doc ""]
  | UNINTENDED_RENEWAL [@ocaml.doc ""]
  | BUYER_DISSATISFACTION [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec agreement_cancellation_request_status =
  | PENDING_APPROVAL [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | VALIDATION_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec agreement_cancellation_request_id = string [@@ocaml.doc ""]

type nonrec send_agreement_cancellation_request_output = {
  agreement_id : agreement_id option; [@ocaml.doc "The unique identifier of the agreement.\n"]
  agreement_cancellation_request_id : agreement_cancellation_request_id option;
      [@ocaml.doc "The unique identifier for the created cancellation request.\n"]
  status : agreement_cancellation_request_status option;
      [@ocaml.doc
        "The current status of the cancellation request. The initial status is [PENDING_APPROVAL].\n"]
  reason_code : agreement_cancellation_request_reason_code option;
      [@ocaml.doc "The reason code provided for the cancellation.\n"]
  description : agreement_cancellation_request_description option;
      [@ocaml.doc "The detailed description of the cancellation reason, if provided.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The time when the cancellation request was created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The time when the cancellation request was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec send_agreement_cancellation_request_input = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement for which the cancellation request is being \
         submitted.\n"]
  reason_code : agreement_cancellation_request_reason_code;
      [@ocaml.doc "The reason code for the cancellation request.\n"]
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  description : agreement_cancellation_request_description option;
      [@ocaml.doc
        "An optional detailed description of the cancellation reason (1-2000 characters).\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec entitlement = {
  license_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS License Manager license associated with the \
         entitlement.\n"]
}
[@@ocaml.doc "Represents an entitlement associated with an agreement.\n"]

type nonrec entitlement_list = entitlement list [@@ocaml.doc ""]

type nonrec agreement_status =
  | ACTIVE [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | RENEWED [@ocaml.doc ""]
  | REPLACED [@ocaml.doc ""]
  | ROLLED_BACK [@ocaml.doc ""]
  | SUPERSEDED [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec offer_set_id = string [@@ocaml.doc ""]

type nonrec offer_id = string [@@ocaml.doc ""]

type nonrec agreement_resource_type = string [@@ocaml.doc ""]

type nonrec resource = {
  id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the resource.\n\n\
        \  We mention the term resource, which is most commonly a product, so a [resourceId] is \
         also a [productId].\n\
        \  \n\
        \   "]
  type_ : agreement_resource_type option;
      [@ocaml.doc
        "Type of the resource, which is the product (for example, [SaaSProduct], [AmiProduct], \
         [ContainerProduct]).\n"]
}
[@@ocaml.doc "The list of resources involved in the agreement.\n"]

type nonrec resources = resource list [@@ocaml.doc ""]

type nonrec proposal_summary = {
  resources : resources option; [@ocaml.doc "The list of resources involved in the agreement.\n"]
  offer_id : offer_id option;
      [@ocaml.doc "The unique identifier of the offer in AWS Marketplace.\n"]
  offer_set_id : offer_set_id option;
      [@ocaml.doc
        "A unique identifier for the offer set containing this offer. All agreements created from \
         offers in this set include this identifier as context.\n"]
}
[@@ocaml.doc "A summary of the proposal received from the proposer.\n"]

type nonrec proposer = {
  account_id : aws_account_id option; [@ocaml.doc "The AWS account ID of the proposer.\n"]
}
[@@ocaml.doc
  "Details of the party proposing the agreement terms,. This is commonly the seller for \
   [PurchaseAgreement]. \n"]

type nonrec acceptor = {
  account_id : aws_account_id option; [@ocaml.doc "The AWS account ID of the acceptor.\n"]
}
[@@ocaml.doc
  "The details of the party accepting the agreement terms. This is commonly the buyer for \
   [PurchaseAgreement].\n"]

type nonrec agreement_type = string [@@ocaml.doc ""]

type nonrec agreement_view_summary = {
  agreement_id : resource_id option; [@ocaml.doc "The unique identifier of the agreement.\n"]
  acceptance_time : timestamp option;
      [@ocaml.doc "The date and time that the agreement was accepted.\n"]
  start_time : timestamp option; [@ocaml.doc "The date and time when the agreement starts.\n"]
  end_time : timestamp option;
      [@ocaml.doc
        "The date and time when the agreement ends. The field is [null] for pay-as-you-go \
         agreements, which don\226\128\153t have end dates.\n"]
  agreement_type : agreement_type option; [@ocaml.doc "The type of agreement.\n"]
  acceptor : acceptor option;
      [@ocaml.doc
        "Details of the party accepting the agreement terms. This is commonly the buyer for \
         [PurchaseAgreement.] \n"]
  proposer : proposer option;
      [@ocaml.doc
        "Details of the party proposing the agreement terms, most commonly the seller for \
         [PurchaseAgreement].\n"]
  proposal_summary : proposal_summary option; [@ocaml.doc "A summary of the proposal\n"]
  status : agreement_status option; [@ocaml.doc "The current status of the agreement. \n"]
  entitlements : entitlement_list option;
      [@ocaml.doc "A list of entitlements associated with the agreement.\n"]
}
[@@ocaml.doc
  "A summary of the agreement, including top-level attributes (for example, the agreement ID, \
   proposer, and acceptor).\n"]

type nonrec agreement_view_summary_list = agreement_view_summary list [@@ocaml.doc ""]

type nonrec search_agreements_output = {
  agreement_view_summaries : agreement_view_summary_list option;
      [@ocaml.doc
        "A summary of the agreement, including top-level attributes (for example, the agreement \
         ID, proposer, and acceptor).\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token used for pagination. The field is [null] if there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec sort_order = ASCENDING [@ocaml.doc ""] | DESCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sort_by = string [@@ocaml.doc ""]

type nonrec sort = {
  sort_by : sort_by option;
      [@ocaml.doc
        "The attribute on which the data is grouped, which can be by [StartTime] and [EndTime]. \
         The default value is [EndTime].\n"]
  sort_order : sort_order option;
      [@ocaml.doc
        "The sorting order, which can be [ASCENDING] or [DESCENDING]. The default value is \
         [DESCENDING].\n"]
}
[@@ocaml.doc "An object that contains the [SortBy] and [SortOrder] attributes.\n"]

type nonrec filter_value = string [@@ocaml.doc ""]

type nonrec filter_value_list = filter_value list [@@ocaml.doc ""]

type nonrec filter_name = string [@@ocaml.doc ""]

type nonrec filter = {
  name : filter_name option; [@ocaml.doc "The name of the filter.\n"]
  values : filter_value_list option; [@ocaml.doc "The filter value.\n"]
}
[@@ocaml.doc
  "The filter name and value pair that is used to return a more specific list of results. Filters \
   can be used to match a set of resources by various criteria, such as [offerId] or [productId].\n"]

type nonrec filter_list = filter list [@@ocaml.doc ""]

type nonrec catalog = string [@@ocaml.doc ""]

type nonrec search_agreements_input = {
  catalog : catalog option; [@ocaml.doc "The catalog in which the agreement was created.\n"]
  filters : filter_list option;
      [@ocaml.doc
        "The filter name and value pair used to return a specific list of results.\n\n\
        \ The following filters are supported:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ResourceIdentifier] \226\128\147 The unique identifier of the resource.\n\
        \            \n\
        \             }\n\
        \        {-   [ResourceType] \226\128\147 Type of the resource, which is the product \
         ([AmiProduct], [ContainerProduct], [SaaSProduct], [ProfessionalServicesProduct], or \
         [MachineLearningProduct]).\n\
        \            \n\
        \             }\n\
        \        {-   [PartyType] \226\128\147 The party type of the caller. Use [Proposer] or \
         [Acceptor].\n\
        \            \n\
        \             }\n\
        \        {-   [AcceptorAccountId] \226\128\147 The AWS account ID of the party accepting \
         the agreement terms.\n\
        \            \n\
        \             }\n\
        \        {-   [OfferId] \226\128\147 The unique identifier of the offer in which the terms \
         are registered in the agreement token.\n\
        \            \n\
        \             }\n\
        \        {-   [Status] \226\128\147 The current status of the agreement. Values include \
         [ACTIVE], [ARCHIVED], [CANCELLED], [EXPIRED], [RENEWED], [REPLACED], and [TERMINATED].\n\
        \            \n\
        \             }\n\
        \        {-   [BeforeEndTime] \226\128\147 A date used to filter agreements with a date \
         before the [endTime] of an agreement.\n\
        \            \n\
        \             }\n\
        \        {-   [AfterEndTime] \226\128\147 A date used to filter agreements with a date \
         after the [endTime] of an agreement.\n\
        \            \n\
        \             }\n\
        \        {-   [AgreementType] \226\128\147 The type of agreement. Supported value includes \
         [PurchaseAgreement].\n\
        \            \n\
        \             }\n\
        \        {-   [OfferSetId] \226\128\147 A unique identifier for the offer set containing \
         this offer. All agreements created from offers in this set include this identifier as \
         context.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  sort : sort option;
      [@ocaml.doc
        "An object that contains the [SortBy] and [SortOrder] attributes. Only [EndTime] is \
         supported for [SearchAgreements]. The default sort is [EndTime] descending.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of agreements to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc "A token to specify where to start pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec payment_request_status_message = string [@@ocaml.doc ""]

type nonrec reject_agreement_payment_request_output = {
  payment_request_id : payment_request_id option;
      [@ocaml.doc "The unique identifier of the rejected payment request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc "The unique identifier of the agreement associated with this payment request.\n"]
  status : payment_request_status option;
      [@ocaml.doc "The updated status of the payment request, which is [REJECTED].\n"]
  status_message : payment_request_status_message option;
      [@ocaml.doc "The rejection reason provided by the buyer, if any.\n"]
  name : payment_request_name option; [@ocaml.doc "The descriptive name of the payment request.\n"]
  description : payment_request_description option;
      [@ocaml.doc "The detailed description of the payment request, if provided.\n"]
  charge_amount : positive_amount_upto8_decimals option;
      [@ocaml.doc "The amount that was requested to be charged.\n"]
  currency_code : currency_code option; [@ocaml.doc "The currency code for the charge amount.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the payment request was originally created.\n"]
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the payment request was rejected.\n"]
}
[@@ocaml.doc ""]

type nonrec payment_request_rejection_reason = string [@@ocaml.doc ""]

type nonrec reject_agreement_payment_request_input = {
  payment_request_id : payment_request_id;
      [@ocaml.doc "The unique identifier of the payment request to reject.\n"]
  agreement_id : agreement_id;
      [@ocaml.doc "The unique identifier of the agreement associated with the payment request.\n"]
  rejection_reason : payment_request_rejection_reason option;
      [@ocaml.doc
        "An optional reason for rejecting the payment request (1-250 characters). This message is \
         visible to the seller.\n"]
}
[@@ocaml.doc ""]

type nonrec agreement_cancellation_request_status_message = string [@@ocaml.doc ""]

type nonrec reject_agreement_cancellation_request_output = {
  agreement_id : agreement_id option;
      [@ocaml.doc
        "The unique identifier of the agreement associated with this cancellation request.\n"]
  agreement_cancellation_request_id : agreement_cancellation_request_id option;
      [@ocaml.doc "The unique identifier of the rejected cancellation request.\n"]
  status : agreement_cancellation_request_status option;
      [@ocaml.doc "The updated status of the cancellation request, which is [REJECTED].\n"]
  status_message : agreement_cancellation_request_status_message option;
      [@ocaml.doc "The rejection reason provided by the buyer.\n"]
  reason_code : agreement_cancellation_request_reason_code option;
      [@ocaml.doc "The original reason code provided when the cancellation request was created.\n"]
  description : agreement_cancellation_request_description option;
      [@ocaml.doc "The detailed description of the cancellation reason, if provided.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was originally created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was rejected.\n"]
}
[@@ocaml.doc ""]

type nonrec agreement_cancellation_request_rejection_reason = string [@@ocaml.doc ""]

type nonrec reject_agreement_cancellation_request_input = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement associated with the cancellation request.\n"]
  agreement_cancellation_request_id : agreement_cancellation_request_id;
      [@ocaml.doc "The unique identifier of the cancellation request to reject.\n"]
  rejection_reason : agreement_cancellation_request_rejection_reason;
      [@ocaml.doc
        "The reason for rejecting the cancellation request (1-2000 characters). This message is \
         visible to the seller.\n"]
}
[@@ocaml.doc ""]

type nonrec billing_adjustment_status =
  | PENDING [@ocaml.doc ""]
  | VALIDATION_FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec invoice_id = string [@@ocaml.doc ""]

type nonrec billing_adjustment_request_id = string [@@ocaml.doc ""]

type nonrec billing_adjustment_summary = {
  billing_adjustment_request_id : billing_adjustment_request_id;
      [@ocaml.doc "The unique identifier of the billing adjustment request.\n"]
  original_invoice_id : invoice_id;
      [@ocaml.doc "The identifier of the original invoice being adjusted.\n"]
  adjustment_amount : positive_amount_upto8_decimals;
      [@ocaml.doc "The adjustment amount as a string representation of a decimal number.\n"]
  currency_code : currency_code; [@ocaml.doc "The currency code for the adjustment amount.\n"]
  status : billing_adjustment_status;
      [@ocaml.doc "The current status of the billing adjustment request.\n"]
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement associated with this billing adjustment request.\n"]
  created_at : timestamp;
      [@ocaml.doc "The date and time when the billing adjustment request was created.\n"]
  updated_at : timestamp;
      [@ocaml.doc "The date and time when the billing adjustment request was last updated.\n"]
  agreement_type : agreement_type; [@ocaml.doc "The type of agreement.\n"]
  catalog : catalog; [@ocaml.doc "The catalog in which the agreement was created.\n"]
}
[@@ocaml.doc "Summary view of a billing adjustment request.\n"]

type nonrec billing_adjustment_summary_list = billing_adjustment_summary list [@@ocaml.doc ""]

type nonrec list_billing_adjustment_requests_output = {
  next_token : next_token option;
      [@ocaml.doc
        "The token used for pagination. The field is [null] if there are no more results.\n"]
  items : billing_adjustment_summary_list;
      [@ocaml.doc
        "An array of [BillingAdjustmentSummary] objects containing summary information about each \
         billing adjustment request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_billing_adjustment_requests_input = {
  agreement_id : agreement_id option;
      [@ocaml.doc
        "The unique identifier of the agreement to list billing adjustment requests for.\n"]
  status : billing_adjustment_status option;
      [@ocaml.doc
        "An optional filter to return billing adjustment requests with the specified status.\n"]
  created_after : timestamp option;
      [@ocaml.doc
        "An optional filter to return billing adjustment requests created after the specified \
         timestamp.\n"]
  created_before : timestamp option;
      [@ocaml.doc
        "An optional filter to return billing adjustment requests created before the specified \
         timestamp.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of billing adjustment requests to return in the response.\n"]
  catalog : catalog option;
      [@ocaml.doc
        "An optional filter to return billing adjustment requests by catalog (e.g., \
         [AWSMarketplace]).\n"]
  agreement_type : agreement_type option;
      [@ocaml.doc
        "An optional filter to return billing adjustment requests by agreement type (e.g., \
         [PurchaseAgreement]).\n"]
  next_token : next_token option; [@ocaml.doc "A token to specify where to start pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec charge_id = string [@@ocaml.doc ""]

type nonrec payment_request_summary = {
  payment_request_id : payment_request_id option;
      [@ocaml.doc "The unique identifier of the payment request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc "The unique identifier of the agreement associated with this payment request.\n"]
  status : payment_request_status option;
      [@ocaml.doc
        "The current status of the payment request. Possible values include [VALIDATING], \
         [VALIDATION_FAILED], [PENDING_APPROVAL], [APPROVED], [REJECTED], and [CANCELLED].\n"]
  name : payment_request_name option; [@ocaml.doc "The descriptive name of the payment request.\n"]
  charge_id : charge_id option;
      [@ocaml.doc
        "The unique identifier of the charge created after the payment request is approved. This \
         field is only present for approved payment requests.\n"]
  charge_amount : positive_amount_upto8_decimals option;
      [@ocaml.doc "The amount charged or to be charged to the buyer.\n"]
  currency_code : currency_code option; [@ocaml.doc "The currency code for the charge amount.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the payment request was created.\n"]
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the payment request was last updated.\n"]
}
[@@ocaml.doc "Summary view of a payment request.\n"]

type nonrec payment_request_summary_list = payment_request_summary list [@@ocaml.doc ""]

type nonrec list_agreement_payment_requests_output = {
  next_token : next_token option;
      [@ocaml.doc
        "The token used for pagination. The field is [null] if there are no more results.\n"]
  items : payment_request_summary_list;
      [@ocaml.doc
        "An array of [PaymentRequestSummary] objects containing summary information about each \
         payment request.\n"]
}
[@@ocaml.doc ""]

type nonrec party_type = string [@@ocaml.doc ""]

type nonrec list_agreement_payment_requests_input = {
  party_type : party_type;
      [@ocaml.doc
        "The party type for the payment requests. Required parameter. Use [Proposer] to list \
         payment requests where you are the seller, or [Acceptor] to list payment requests where \
         you are the buyer.\n"]
  agreement_type : agreement_type option;
      [@ocaml.doc
        "An optional parameter to list payment requests by agreement type (e.g., \
         [PurchaseAgreement]).\n"]
  catalog : catalog option;
      [@ocaml.doc
        "An optional parameter to list payment requests by catalog (e.g., [AWSMarketplace]).\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc "An optional parameter to list payment requests for a specific agreement.\n"]
  status : payment_request_status option;
      [@ocaml.doc
        "An optional parameter to list payment requests by status. Valid values include \
         [VALIDATING], [VALIDATION_FAILED], [PENDING_APPROVAL], [APPROVED], [REJECTED], and \
         [CANCELLED].\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of payment requests to return in a single response (1-50). Default is \
         50.\n"]
  next_token : next_token option; [@ocaml.doc "A token to specify where to start pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec invoicing_entity = {
  legal_name : bounded_string option; [@ocaml.doc "Legal name of the entity issuing the invoice.\n"]
  branch_name : bounded_string option;
      [@ocaml.doc "The branch where the issuing entity is operating from.\n"]
}
[@@ocaml.doc "The entity responsible for issuing the invoice.\n"]

type nonrec invoice_type = INVOICE [@ocaml.doc ""] | CREDIT_MEMO [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec invoice_billing_period = {
  month : Smaws_Lib.Smithy_api.Types.integer;
      [@ocaml.doc "The billing period month. Valid range: 1-12.\n"]
  year : Smaws_Lib.Smithy_api.Types.integer; [@ocaml.doc "The billing period year.\n"]
}
[@@ocaml.doc "The billing period for an invoice, specified by month and year.\n"]

type nonrec pricing_currency_amount = {
  amount : bounded_string option; [@ocaml.doc "The monetary amount before tax.\n"]
  max_adjustment_amount : bounded_string option;
      [@ocaml.doc "The maximum refundable amount as a string representation of a decimal number.\n"]
  currency_code : currency_code option;
      [@ocaml.doc "The 3-letter ISO 4217 currency code (e.g., [USD], [EUR], [JPY]).\n"]
}
[@@ocaml.doc "Monetary amounts associated with an invoice line item group.\n"]

type nonrec agreement_invoice_line_item_group_summary = {
  agreement_id : resource_id option; [@ocaml.doc "The unique identifier of the agreement.\n"]
  invoice_id : resource_id option; [@ocaml.doc "The identifier of the invoice for this group.\n"]
  pricing_currency_amount : pricing_currency_amount option;
      [@ocaml.doc "Monetary amounts for this invoice group.\n"]
  invoice_billing_period : invoice_billing_period option;
      [@ocaml.doc "The billing period associated with this group.\n"]
  issued_time : timestamp option;
      [@ocaml.doc "The timestamp when the invoice containing this group was created.\n"]
  invoice_type : invoice_type option;
      [@ocaml.doc "The type of invoice. Valid values are [INVOICE] and [CREDIT_MEMO].\n"]
  invoicing_entity : invoicing_entity option; [@ocaml.doc "The entity that issues the invoice.\n"]
}
[@@ocaml.doc "A summary of grouped billing data for an agreement invoice line item.\n"]

type nonrec agreement_invoice_line_item_group_summaries =
  agreement_invoice_line_item_group_summary list
[@@ocaml.doc ""]

type nonrec list_agreement_invoice_line_items_output = {
  agreement_invoice_line_item_group_summaries : agreement_invoice_line_item_group_summaries option;
      [@ocaml.doc "A list of grouped billing data objects.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token used for pagination. The field is [null] if there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec line_item_group_by = INVOICE_ID [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_agreement_invoice_line_items_input = {
  agreement_id : resource_id; [@ocaml.doc "The unique identifier of the agreement.\n"]
  group_by : line_item_group_by;
      [@ocaml.doc
        "Specifies a grouping strategy for line items. Currently supports [INVOICE_ID].\n"]
  invoice_id : resource_id option;
      [@ocaml.doc "An optional filter to retrieve invoice information for a specific invoice.\n"]
  invoice_type : invoice_type option;
      [@ocaml.doc
        "An optional filter for the type of invoice. Valid values are [INVOICE] and [CREDIT_MEMO].\n"]
  invoice_billing_period : invoice_billing_period option;
      [@ocaml.doc "An optional filter for the billing period associated with the invoice.\n"]
  before_issued_time : timestamp option;
      [@ocaml.doc "An optional filter for invoices issued before the specified timestamp.\n"]
  after_issued_time : timestamp option;
      [@ocaml.doc "An optional filter for invoices issued after the specified timestamp.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of results to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc "A token to specify where to start pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec charge = {
  id : resource_id option; [@ocaml.doc "The unique identifier of the charge.\n"]
  revision : charge_revision option; [@ocaml.doc "The revision number of the charge.\n"]
  agreement_id : resource_id option;
      [@ocaml.doc "The unique identifier of the agreement that resulted in this charge.\n"]
  agreement_type : agreement_type option;
      [@ocaml.doc
        "The type of agreement that resulted in this charge (for example, [PurchaseAgreement]).\n"]
  purchase_order_reference : purchase_order_reference option;
      [@ocaml.doc "The purchase order reference associated with the charge, if any.\n"]
  currency_code : currency_code option; [@ocaml.doc "The currency code for the charge amount.\n"]
  amount : bounded_string option; [@ocaml.doc "The amount of the charge.\n"]
  time : timestamp option;
      [@ocaml.doc
        "The date and time when the charge will be incurred. This is available only when the \
         charge date is known.\n"]
}
[@@ocaml.doc
  "Represents a charge associated with an agreement, including amount, timing, and purchase order \
   details.\n"]

type nonrec charges = charge list [@@ocaml.doc ""]

type nonrec list_agreement_charges_output = {
  items : charges option; [@ocaml.doc "A list of agreement charges.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token used for pagination. The field is [null] if there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_agreement_charges_input = {
  catalog : catalog option; [@ocaml.doc "The catalog in which the charges were created.\n"]
  agreement_id : resource_id option; [@ocaml.doc "The unique identifier of the agreement.\n"]
  agreement_type : agreement_type option;
      [@ocaml.doc
        "Filter to retrieve charges of a specific agreement type (for example, [PurchaseAgreement]).\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of charges to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc "A token to specify where to start pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec agreement_cancellation_request_summary = {
  agreement_cancellation_request_id : agreement_cancellation_request_id option;
      [@ocaml.doc "The unique identifier of the cancellation request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc
        "The unique identifier of the agreement associated with this cancellation request.\n"]
  status : agreement_cancellation_request_status option;
      [@ocaml.doc
        "The current status of the cancellation request. Possible values include \
         [PENDING_APPROVAL], [APPROVED], [REJECTED], [CANCELLED], and [VALIDATION_FAILED].\n"]
  reason_code : agreement_cancellation_request_reason_code option;
      [@ocaml.doc "The reason code provided for the cancellation.\n"]
  agreement_type : agreement_type option; [@ocaml.doc "The type of agreement.\n"]
  catalog : catalog option; [@ocaml.doc "The catalog in which the agreement was created.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was last updated.\n"]
}
[@@ocaml.doc "Summary view of an agreement cancellation request.\n"]

type nonrec agreement_cancellation_request_summary_list =
  agreement_cancellation_request_summary list
[@@ocaml.doc ""]

type nonrec list_agreement_cancellation_requests_output = {
  next_token : next_token option;
      [@ocaml.doc
        "The token used for pagination. The field is [null] if there are no more results.\n"]
  items : agreement_cancellation_request_summary_list option;
      [@ocaml.doc
        "An array of [AgreementCancellationRequestSummary] objects containing summary information \
         about each cancellation request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_agreement_cancellation_requests_input = {
  party_type : party_type;
      [@ocaml.doc
        "The party type for the cancellation requests. Required parameter. Use [Proposer] to list \
         cancellation requests where you are the seller, or [Acceptor] to list cancellation \
         requests where you are the buyer.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc
        "An optional parameter to filter cancellation requests for a specific agreement.\n"]
  status : agreement_cancellation_request_status option;
      [@ocaml.doc "An optional parameter to filter cancellation requests by status.\n"]
  agreement_type : agreement_type option;
      [@ocaml.doc
        "An optional parameter to filter cancellation requests by agreement type (e.g., \
         [PurchaseAgreement]).\n"]
  catalog : catalog option;
      [@ocaml.doc
        "An optional parameter to filter cancellation requests by catalog (e.g., [AWSMarketplace]).\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of cancellation requests to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc "A token to specify where to start pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec billing_adjustment_status_message = string [@@ocaml.doc ""]

type nonrec billing_adjustment_reason_code =
  | INCORRECT_TERMS_ACCEPTED [@ocaml.doc ""]
  | INCORRECT_METERING [@ocaml.doc ""]
  | TEST_ENVIRONMENT_CHARGES [@ocaml.doc ""]
  | ALTERNATIVE_PROCUREMENT_CHANNEL [@ocaml.doc ""]
  | UNINTENDED_RENEWAL [@ocaml.doc ""]
  | BUYER_DISSATISFACTION [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_billing_adjustment_request_output = {
  billing_adjustment_request_id : billing_adjustment_request_id;
      [@ocaml.doc "The unique identifier of the billing adjustment request.\n"]
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement associated with this billing adjustment request.\n"]
  adjustment_reason_code : billing_adjustment_reason_code;
      [@ocaml.doc "The reason code for the billing adjustment.\n"]
  description : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The detailed description of the billing adjustment reason, if provided.\n"]
  original_invoice_id : invoice_id;
      [@ocaml.doc "The identifier of the original invoice being adjusted.\n"]
  adjustment_amount : positive_amount_upto8_decimals;
      [@ocaml.doc "The adjustment amount as a string representation of a decimal number.\n"]
  currency_code : currency_code;
      [@ocaml.doc "The currency code for the adjustment amount (e.g., [USD]).\n"]
  status : billing_adjustment_status;
      [@ocaml.doc "The current status of the billing adjustment request.\n"]
  status_message : billing_adjustment_status_message option;
      [@ocaml.doc
        "A message providing additional context about the billing adjustment request status. This \
         field is populated only when the status is [VALIDATION_FAILED].\n"]
  created_at : timestamp;
      [@ocaml.doc "The date and time when the billing adjustment request was created.\n"]
  updated_at : timestamp;
      [@ocaml.doc "The date and time when the billing adjustment request was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec get_billing_adjustment_request_input = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement associated with the billing adjustment request.\n"]
  billing_adjustment_request_id : billing_adjustment_request_id;
      [@ocaml.doc "The unique identifier of the billing adjustment request.\n"]
}
[@@ocaml.doc ""]

type nonrec iso8601_duration = string [@@ocaml.doc ""]

type nonrec payment_request_approval_strategy =
  | AUTO_APPROVE_ON_EXPIRATION [@ocaml.doc ""]
  | WAIT_FOR_APPROVAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec variable_payment_term_configuration = {
  payment_request_approval_strategy : payment_request_approval_strategy;
      [@ocaml.doc
        "Defines the strategy for approving payment requests. Values include \
         [AUTO_APPROVE_ON_EXPIRATION] and [WAIT_FOR_APPROVAL] \n"]
  expiration_duration : iso8601_duration option;
      [@ocaml.doc
        "Defines the duration after which a payment request is automatically approved if no \
         further action is taken. This only applies when the payment request approval strategy is \
         set to [AUTO_APPROVE_ON_EXPIRATION]. The duration is represented in the ISO_8601 format \
         (e.g., P10D for 10 days).\n"]
}
[@@ocaml.doc
  "Additional parameters specified by the acceptor while accepting the variable payment term.\n"]

type nonrec unversioned_term_type = string [@@ocaml.doc ""]

type nonrec variable_payment_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Type of the term.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
  currency_code : currency_code option;
      [@ocaml.doc "Defines the currency for the prices mentioned in the term.\n"]
  max_total_charge_amount : bounded_string option;
      [@ocaml.doc
        "The maximum total amount that can be charged to the customer through variable payment \
         requests under this term.\n"]
  configuration : variable_payment_term_configuration option;
      [@ocaml.doc "Additional parameters specified by the acceptor while accepting the term.\n"]
}
[@@ocaml.doc
  "Defines a payment model where sellers can submit variable payment requests up to a maximum \
   charge amount, with configurable approval strategies and expiration timelines.\n"]

type nonrec positive_integer_with_default_value_one = int [@@ocaml.doc ""]

type nonrec grant_item = {
  dimension_key : bounded_string option;
      [@ocaml.doc
        "Unique dimension key defined in the product document. Dimensions represent categories of \
         capacity in a product and are specified when the product is listed in AWS Marketplace. \n"]
  max_quantity : positive_integer_with_default_value_one option;
      [@ocaml.doc
        "Maximum amount of capacity that the buyer can be entitled to the given dimension of the \
         product. If [MaxQuantity] is not provided, the buyer will be able to use an unlimited \
         amount of the given dimension. \n"]
}
[@@ocaml.doc
  "Entitlements granted to the acceptor of fixed upfront as part of agreement execution.\n"]

type nonrec grant_list = grant_item list [@@ocaml.doc ""]

type nonrec fixed_upfront_pricing_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Category of the term being updated.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
  currency_code : currency_code option;
      [@ocaml.doc "Defines the currency for the prices mentioned in this term. \n"]
  duration : bounded_string option; [@ocaml.doc "Contract duration for the terms.\n"]
  price : bounded_string option;
      [@ocaml.doc "Fixed amount to be charged to the customer when this term is accepted.\n"]
  grants : grant_list option;
      [@ocaml.doc
        "Entitlements granted to the acceptor of fixed upfront as part of agreement execution.\n"]
}
[@@ocaml.doc
  "Defines a prepaid pricing model where the customers are charged a fixed upfront amount.\n"]

type nonrec free_trial_pricing_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Category of the term.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the terms.\n"]
  duration : bounded_string option;
      [@ocaml.doc "Duration of the free trial period (5\226\128\14731 days). \n"]
  grants : grant_list option;
      [@ocaml.doc
        "Entitlements granted to the acceptor of a free trial as part of an agreement execution.\n"]
}
[@@ocaml.doc
  "Defines a short-term free pricing model where the buyers aren\226\128\153t charged anything \
   within a specified limit.\n"]

type nonrec schedule_item = {
  charge_date : timestamp option;
      [@ocaml.doc
        "The date that the customer would pay the price defined in this payment schedule term. \
         Invoices are generated on the date provided.\n"]
  charge_amount : bounded_string option;
      [@ocaml.doc "The price that the customer would pay on the scheduled date (chargeDate).\n"]
}
[@@ocaml.doc
  "An individual installment of the payment that includes the date and amount of the charge.\n"]

type nonrec schedule_list = schedule_item list [@@ocaml.doc ""]

type nonrec payment_schedule_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Type of the term.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
  currency_code : currency_code option;
      [@ocaml.doc "Defines the currency for the prices mentioned in the term. \n"]
  schedule : schedule_list option;
      [@ocaml.doc
        "List of the payment schedule where each element defines one installment of payment. It \
         contains the information necessary for calculating the price.\n"]
}
[@@ocaml.doc
  "Defines an installment-based pricing model where customers are charged a fixed price on \
   different dates during the agreement validity period. This is used most commonly for flexible \
   payment schedule pricing.\n"]

type nonrec validity_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Category of the term being updated. \n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
  agreement_duration : bounded_string option;
      [@ocaml.doc
        "Defines the duration that the agreement remains active. If [AgreementStartDate] \
         isn\226\128\153t provided, the agreement duration is relative to the agreement signature \
         time. The duration is represented in the ISO_8601 format.\n"]
  agreement_start_date : timestamp option;
      [@ocaml.doc
        "Defines the date when agreement starts. The agreement starts at 00:00:00.000 UTC on the \
         date provided. If [AgreementStartDate] isn\226\128\153t provided, the agreement start \
         date is determined based on agreement signature time.\n"]
  agreement_end_date : timestamp option;
      [@ocaml.doc
        "Defines the date when the agreement ends. The agreement ends at 23:59:59.999 UTC on the \
         date provided. If [AgreementEndDate] isn\226\128\153t provided, the agreement end date is \
         determined by the validity of individual terms.\n"]
}
[@@ocaml.doc "Defines the conditions that will keep an agreement created from this offer valid. \n"]

type nonrec recurring_payment_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Type of the term being updated.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
  currency_code : currency_code option;
      [@ocaml.doc "Defines the currency for the prices mentioned in this term. \n"]
  billing_period : bounded_string option;
      [@ocaml.doc "Defines the recurrence at which buyers are charged.\n"]
  price : bounded_string option; [@ocaml.doc "Amount charged to the buyer every billing period.\n"]
}
[@@ocaml.doc
  "Defines a pricing model where customers are charged a fixed recurring price at the end of each \
   billing period.\n"]

type nonrec byol_pricing_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Type of the term being updated.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
}
[@@ocaml.doc
  "Enables you and your customers to move your existing agreements to AWS Marketplace. The \
   customer won't be charged for product usage in AWS Marketplace because they already paid for \
   the product outside of AWS Marketplace.\n"]

type nonrec zero_value_integer = int [@@ocaml.doc ""]

type nonrec dimension = {
  dimension_key : bounded_string; [@ocaml.doc "The name of key value of the dimension.\n"]
  dimension_value : zero_value_integer;
      [@ocaml.doc
        "The number of units of the dimension the acceptor has purchased.\n\n\
        \  For Agreements with [ConfigurableUpfrontPricingTerm], the [RateCard] section will \
         define the prices and dimensions defined by the seller (proposer), whereas the \
         [Configuration] section will define the actual dimensions, prices, and units the buyer \
         has chosen to accept.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "Defines the dimensions that the acceptor has purchased from the overall set of dimensions \
   presented in the rate card.\n"]

type nonrec dimension_list = dimension list [@@ocaml.doc ""]

type nonrec configurable_upfront_pricing_term_configuration = {
  selector_value : bounded_string;
      [@ocaml.doc
        "Defines the length of time for which the particular pricing/dimension is being purchased \
         by the acceptor.\n"]
  dimensions : dimension_list;
      [@ocaml.doc
        "Defines the dimensions that the acceptor has purchased from the overall set of dimensions \
         presented in the rate card.\n"]
}
[@@ocaml.doc
  "Defines a prepaid payment model that allows buyers to configure the entitlements they want to \
   purchase and the duration.\n"]

type nonrec rate_card_item = {
  dimension_key : bounded_string option;
      [@ocaml.doc
        "Dimension for which the given entitlement applies. Dimensions represent categories of \
         capacity in a product and are specified when the product is listed in AWS Marketplace.\n"]
  price : bounded_string option;
      [@ocaml.doc
        "Per unit price for the product dimension that\226\128\153s used for calculating the \
         amount to be charged.\n"]
}
[@@ocaml.doc "Defines the per unit rates for each individual product dimension.\n"]

type nonrec rate_card_list = rate_card_item list [@@ocaml.doc ""]

type nonrec constraints = {
  multiple_dimension_selection : bounded_string option;
      [@ocaml.doc
        "Determines if buyers are allowed to select multiple dimensions in the rate card. The \
         possible values are [Allowed] and [Disallowed]. The default value is [Allowed].\n"]
  quantity_configuration : bounded_string option;
      [@ocaml.doc
        "Determines if acceptors are allowed to configure quantity for each dimension in rate \
         card. The possible values are [Allowed] and [Disallowed]. The default value is [Allowed].\n"]
}
[@@ocaml.doc "Defines limits on how the term can be configured by acceptors. \n"]

type nonrec selector = {
  type_ : bounded_string option; [@ocaml.doc "Category of selector.\n"]
  value : bounded_string option;
      [@ocaml.doc "Contract duration. This field supports the ISO 8601 format. \n"]
}
[@@ocaml.doc
  "Differentiates between the mutually exclusive rate cards in the same pricing term to be \
   selected by the buyer.\n"]

type nonrec configurable_upfront_rate_card_item = {
  selector : selector option;
      [@ocaml.doc
        "Differentiates between the mutually exclusive rate cards in the same pricing term to be \
         selected by the buyer.\n"]
  constraints : constraints option;
      [@ocaml.doc "Defines limits on how the term can be configured by acceptors.\n"]
  rate_card : rate_card_list option;
      [@ocaml.doc "Defines the per unit rates for product dimensions.\n"]
}
[@@ocaml.doc
  "Within the prepaid payment model defined under [ConfigurableUpfrontPricingTerm], the \
   [RateCardItem] defines all the various rate cards (including pricing and dimensions) that have \
   been proposed.\n"]

type nonrec configurable_upfront_rate_card_list = configurable_upfront_rate_card_item list
[@@ocaml.doc ""]

type nonrec configurable_upfront_pricing_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Category of selector.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier of the term.\n"]
  currency_code : currency_code option;
      [@ocaml.doc "Defines the currency for the prices mentioned in the term.\n"]
  rate_cards : configurable_upfront_rate_card_list option;
      [@ocaml.doc "A rate card defines the per unit rates for product dimensions.\n"]
  configuration : configurable_upfront_pricing_term_configuration option;
      [@ocaml.doc "Additional parameters specified by the acceptor while accepting the term.\n"]
}
[@@ocaml.doc
  "Defines a prepaid payment model that allows buyers to configure the entitlements they want to \
   purchase and the duration.\n"]

type nonrec usage_based_rate_card_item = {
  rate_card : rate_card_list option;
      [@ocaml.doc "Defines the per unit rates for product dimensions.\n"]
}
[@@ocaml.doc
  "Within the pay-as-you-go model defined under [UsageBasedPricingTerm], the \
   [UsageBasedRateCardItem] defines an individual rate for a product dimension.\n"]

type nonrec usage_based_rate_card_list = usage_based_rate_card_item list [@@ocaml.doc ""]

type nonrec usage_based_pricing_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Category of the term.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
  currency_code : currency_code option;
      [@ocaml.doc "Defines the currency for the prices mentioned in the term. \n"]
  rate_cards : usage_based_rate_card_list option; [@ocaml.doc "List of rate cards.\n"]
}
[@@ocaml.doc
  "Defines a usage-based pricing model (typically, pay-as-you-go pricing), where the customers are \
   charged based on product usage.\n"]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec renewal_term_configuration = {
  enable_auto_renew : boolean_;
      [@ocaml.doc
        "Defines whether the acceptor has chosen to auto-renew the agreement at the end of its \
         lifecycle. Can be set to [True] or [False].\n"]
}
[@@ocaml.doc "Additional parameters specified by the acceptor while accepting the term.\n"]

type nonrec renewal_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Category of the term being updated. \n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
  configuration : renewal_term_configuration option;
      [@ocaml.doc "Additional parameters specified by the acceptor while accepting the term.\n"]
}
[@@ocaml.doc
  "Defines that on graceful expiration of the agreement (when the agreement ends on its \
   pre-defined end date), a new agreement will be created using the accepted terms on the existing \
   agreement. In other words, the agreement will be renewed. The presence of [RenewalTerm] in the \
   offer document means that auto-renewal is allowed. Buyers will have the option to accept or \
   decline auto-renewal at the offer acceptance/agreement creation. Buyers can also change this \
   flag from [True] to [False] or [False] to [True] at anytime during the agreement's lifecycle.\n"]

type nonrec support_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Category of the term being updated.\n"]
  id : term_id option; [@ocaml.doc "The unique identifier for the term.\n"]
  refund_policy : bounded_string option;
      [@ocaml.doc
        "Free-text field about the refund policy description that will be shown to customers as is \
         on the website and console.\n"]
}
[@@ocaml.doc
  "Defines the customer support available for the acceptors when they purchase the software.\n"]

type nonrec document_item = {
  type_ : bounded_string option;
      [@ocaml.doc
        "Category of the document. Document types include:\n\n\
        \ {ul\n\
        \       {-   [CustomEula] \226\128\147 A custom EULA provided by you as seller. A URL for \
         a EULA stored in an accessible Amazon S3 bucket is required for this document type.\n\
        \           \n\
        \            }\n\
        \       {-   [CustomDsa] \226\128\147 A custom Data Subscription Agreement (DSA) provided \
         by you as seller. A URL for a DSA stored in an accessible Amazon S3 bucket is required \
         for this document type.\n\
        \           \n\
        \            }\n\
        \       {-   [StandardEula] \226\128\147 The Standard Contract for AWS Marketplace (SCMP). \
         For more information about SCMP, see the AWS Marketplace Seller Guide. You \
         don\226\128\153t provide a URL for this type because it\226\128\153s managed by AWS \
         Marketplace.\n\
        \           \n\
        \            }\n\
        \       {-   [StandardDsa] \226\128\147 DSA for AWS Marketplace. For more information \
         about the DSA, see the AWS Data Exchange User Guide. You don\226\128\153t provide a URL \
         for this type because it\226\128\153s managed by AWS Marketplace.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  url : bounded_string option;
      [@ocaml.doc
        "A URL to the legal document for buyers to read. Required when [Type] is [CustomEula].\n"]
  version : bounded_string option;
      [@ocaml.doc
        "Version of standard contracts provided by AWS Marketplace. Required when Type is \
         [StandardEula] or [StandardDsa]. \n"]
}
[@@ocaml.doc
  "Includes the list of references to legal resources proposed by the proposer to the acceptor. \
   Each [DocumentItem] refers to an individual reference.\n"]

type nonrec document_list = document_item list [@@ocaml.doc ""]

type nonrec legal_term = {
  type_ : unversioned_term_type option; [@ocaml.doc "Category of the term being updated.\n"]
  id : term_id option; [@ocaml.doc "The unique identifer for the term.\n"]
  documents : document_list option;
      [@ocaml.doc
        "List of references to legal resources proposed to the buyers. An example is the EULA.\n"]
}
[@@ocaml.doc
  "Defines the list of text agreements proposed to the acceptors. An example is the end user \
   license agreement (EULA).\n"]

type nonrec accepted_term =
  | LegalTerm of legal_term
      [@ocaml.doc
        "Defines the list of text agreements proposed to the acceptors. An example is the end user \
         license agreement (EULA).\n"]
  | SupportTerm of support_term
      [@ocaml.doc
        "Defines the customer support available for the acceptors when they purchase the software.\n"]
  | RenewalTerm of renewal_term
      [@ocaml.doc
        "Defines that on graceful expiration of the agreement (when the agreement ends on its \
         pre-defined end date), a new agreement will be created using the accepted terms on the \
         existing agreement. In other words, the agreement will be renewed. Presence of \
         [RenewalTerm] in the offer document means that auto-renewal is allowed. Buyers will have \
         the option to accept or decline auto-renewal at the offer acceptance/agreement creation. \
         Buyers can also change this flag from [True] to [False] or [False] to [True] at anytime \
         during the agreement's lifecycle.\n"]
  | UsageBasedPricingTerm of usage_based_pricing_term
      [@ocaml.doc
        "Defines a usage-based pricing model (typically, pay-as-you-go pricing), where the \
         customers are charged based on product usage.\n"]
  | ConfigurableUpfrontPricingTerm of configurable_upfront_pricing_term
      [@ocaml.doc
        "Defines a prepaid payment model that allows buyers to configure the entitlements they \
         want to purchase and the duration.\n"]
  | ByolPricingTerm of byol_pricing_term
      [@ocaml.doc
        "Enables you and your customers to move your existing agreements to AWS Marketplace. The \
         customer won't be charged for product usage in AWS Marketplace because they already paid \
         for the product outside of AWS Marketplace.\n"]
  | RecurringPaymentTerm of recurring_payment_term
      [@ocaml.doc
        "Defines a pricing model where customers are charged a fixed recurring price at the end of \
         each billing period.\n"]
  | ValidityTerm of validity_term
      [@ocaml.doc
        "Defines the conditions that will keep an agreement created from this offer valid.\n"]
  | PaymentScheduleTerm of payment_schedule_term
      [@ocaml.doc
        "Defines an installment-based pricing model where customers are charged a fixed price on \
         different dates during the agreement validity period. This is used most commonly for \
         flexible payment schedule pricing.\n"]
  | FreeTrialPricingTerm of free_trial_pricing_term
      [@ocaml.doc
        "Defines a short-term free pricing model where the buyers aren\226\128\153t charged \
         anything within a specified limit.\n"]
  | FixedUpfrontPricingTerm of fixed_upfront_pricing_term
      [@ocaml.doc
        "Defines a pre-paid pricing model where the customers are charged a fixed upfront amount.\n"]
  | VariablePaymentTerm of variable_payment_term
      [@ocaml.doc
        "Defines a payment model where sellers can submit variable payment requests up to a \
         maximum charge amount, with configurable approval strategies and expiration timelines.\n"]
[@@ocaml.doc
  "A subset of terms proposed by the proposer, which have been accepted by the acceptor as part of \
   agreement creation.\n"]

type nonrec accepted_term_list = accepted_term list [@@ocaml.doc ""]

type nonrec get_agreement_terms_output = {
  accepted_terms : accepted_term_list option;
      [@ocaml.doc
        "A subset of terms proposed by the proposer that have been accepted by the acceptor as \
         part of the agreement creation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token used for pagination. The field is [null] if there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec get_agreement_terms_input = {
  agreement_id : resource_id; [@ocaml.doc "The unique identifier of the agreement.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of agreements to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc "A token to specify where to start pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec get_agreement_payment_request_output = {
  payment_request_id : payment_request_id option;
      [@ocaml.doc "The unique identifier of the payment request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc
        "The unique identifier of the agreement associated with this payment request. Use \
         [DescribeAgreement] to retrieve full agreement details.\n"]
  status : payment_request_status option;
      [@ocaml.doc
        "The current status of the payment request. Possible values include:\n\n\
        \ {ul\n\
        \       {-   [VALIDATING] \226\128\147 The payment request is being validated against \
         agreement terms.\n\
        \           \n\
        \            }\n\
        \       {-   [VALIDATION_FAILED] \226\128\147 The payment request failed validation.\n\
        \           \n\
        \            }\n\
        \       {-   [PENDING_APPROVAL] \226\128\147 The payment request is awaiting buyer action.\n\
        \           \n\
        \            }\n\
        \       {-   [APPROVED] \226\128\147 The buyer has approved the payment request.\n\
        \           \n\
        \            }\n\
        \       {-   [REJECTED] \226\128\147 The buyer has rejected the payment request.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCELLED] \226\128\147 The seller has cancelled the payment request.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status_message : payment_request_status_message option;
      [@ocaml.doc
        "An optional message providing additional context about the payment request status, such \
         as a rejection reason or validation failure details.\n"]
  name : payment_request_name option; [@ocaml.doc "The descriptive name of the payment request.\n"]
  description : payment_request_description option;
      [@ocaml.doc "The detailed description of the payment request, if provided.\n"]
  charge_id : charge_id option;
      [@ocaml.doc
        "The unique identifier of the charge created after the payment request is approved. This \
         field is only present for approved payment requests and follows the pattern \
         [ch-\\[a-zA-Z0-9\\]+].\n"]
  charge_amount : positive_amount_upto8_decimals option;
      [@ocaml.doc "The amount charged or to be charged to the buyer.\n"]
  currency_code : currency_code option; [@ocaml.doc "The currency code for the charge amount.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the payment request was created.\n"]
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the payment request was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec get_agreement_payment_request_input = {
  payment_request_id : payment_request_id; [@ocaml.doc "The identifier of the payment request.\n"]
  agreement_id : agreement_id;
      [@ocaml.doc "The unique identifier of the agreement associated with the payment request.\n"]
}
[@@ocaml.doc ""]

type nonrec aws_arn = string [@@ocaml.doc ""]

type nonrec agreement_entitlement_status_reason_code =
  | PROVISIONING_IN_PROGRESS [@ocaml.doc ""]
  | FUTURE_START_DATE [@ocaml.doc ""]
  | INVALID_PAYMENT_INSTRUMENT [@ocaml.doc ""]
  | INCOMPATIBLE_CURRENCY [@ocaml.doc ""]
  | ACCOUNT_SUSPENDED [@ocaml.doc ""]
  | UNSUPPORTED_OPERATION [@ocaml.doc ""]
  | AGREEMENT_INACTIVE [@ocaml.doc ""]
  | AGREEMENT_ACTIVE [@ocaml.doc ""]
  | PRODUCT_RESTRICTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec agreement_entitlement_status =
  | PROVISIONED [@ocaml.doc ""]
  | SCHEDULED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DEPROVISIONED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registration_token = string [@@ocaml.doc ""]

type nonrec entitlement_type = string [@@ocaml.doc ""]

type nonrec agreement_entitlement = {
  resource : resource option;
      [@ocaml.doc "The resource that the entitlement is provisioned to, such as a product.\n"]
  type_ : entitlement_type option; [@ocaml.doc "The type of entitlement.\n"]
  registration_token : registration_token option;
      [@ocaml.doc
        "A short-lived token required by acceptors to register their account with the product \
         provider. The token is only valid for 30 minutes after creation and is only applicable \
         for purchase agreements.\n"]
  status : agreement_entitlement_status option;
      [@ocaml.doc "The current state of an entitlement.\n"]
  status_reason_code : agreement_entitlement_status_reason_code option;
      [@ocaml.doc "Provides more information about the status of an entitlement.\n"]
  license_arn : aws_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the AWS License Manager license associated with the \
         entitlement.\n"]
}
[@@ocaml.doc
  "Represents an entitlement associated with an agreement, including the provisioning status, \
   resource, and type.\n"]

type nonrec agreement_entitlement_list = agreement_entitlement list [@@ocaml.doc ""]

type nonrec get_agreement_entitlements_output = {
  agreement_entitlements : agreement_entitlement_list option;
      [@ocaml.doc "A list of agreement entitlements which are part of the latest agreement.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The token used for pagination. The field is [null] if there are no more results.\n"]
}
[@@ocaml.doc ""]

type nonrec get_agreement_entitlements_input = {
  agreement_id : resource_id; [@ocaml.doc "The unique identifier of the agreement.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of agreement entitlements to return in the response.\n"]
  next_token : next_token option; [@ocaml.doc "A token to specify where to start pagination.\n"]
}
[@@ocaml.doc ""]

type nonrec get_agreement_cancellation_request_output = {
  agreement_cancellation_request_id : agreement_cancellation_request_id option;
      [@ocaml.doc "The unique identifier of the cancellation request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc
        "The unique identifier of the agreement associated with this cancellation request. Use \
         [DescribeAgreement] to retrieve full agreement details.\n"]
  reason_code : agreement_cancellation_request_reason_code option;
      [@ocaml.doc "The reason code provided for the cancellation.\n"]
  description : agreement_cancellation_request_description option;
      [@ocaml.doc "The detailed description of the cancellation reason, if provided.\n"]
  status : agreement_cancellation_request_status option;
      [@ocaml.doc "The current status of the cancellation request.\n"]
  status_message : agreement_cancellation_request_status_message option;
      [@ocaml.doc "A message providing additional context about the cancellation request status.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was last updated.\n"]
}
[@@ocaml.doc ""]

type nonrec get_agreement_cancellation_request_input = {
  agreement_cancellation_request_id : agreement_cancellation_request_id;
      [@ocaml.doc "The unique identifier of the cancellation request.\n"]
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement associated with the cancellation request.\n"]
}
[@@ocaml.doc ""]

type nonrec estimated_charges = {
  currency_code : currency_code option; [@ocaml.doc "Defines the currency code for the charge.\n"]
  agreement_value : bounded_string option;
      [@ocaml.doc
        "The total known amount customer has to pay across the lifecycle of the agreement.\n\n\
        \  This is the total contract value if accepted terms contain \
         [ConfigurableUpfrontPricingTerm] or [FixedUpfrontPricingTerm]. In the case of pure \
         contract pricing, this will be the total value of the contract. In the case of contracts \
         with consumption pricing, this will only include the committed value and not include any \
         overages that occur.\n\
        \  \n\
        \   If the accepted terms contain [PaymentScheduleTerm], it will be the total payment \
         schedule amount. This occurs when flexible payment schedule is used, and is the sum of \
         all invoice charges in the payment schedule.\n\
        \   \n\
        \    In case a customer has amended an agreement, by purchasing more units of any \
         dimension, this will include both the original cost as well as the added cost incurred \
         due to addition of new units. \n\
        \    \n\
        \     This is [0] if the accepted terms contain [UsageBasedPricingTerm] without \
         [ConfigurableUpfrontPricingTerm] or [RecurringPaymentTerm]. This occurs for usage-based \
         pricing (such as SaaS metered or AMI/container hourly or monthly), because the exact \
         usage is not known upfront.\n\
        \     \n\
        \      "]
}
[@@ocaml.doc "Estimated cost of the agreement.\n"]

type nonrec describe_agreement_output = {
  agreement_id : resource_id option; [@ocaml.doc "The unique identifier of the agreement.\n"]
  acceptor : acceptor option;
      [@ocaml.doc
        "The details of the party accepting the agreement terms. This is commonly the buyer for \
         [PurchaseAgreement].\n"]
  proposer : proposer option;
      [@ocaml.doc
        "The details of the party proposing the agreement terms. This is commonly the seller for \
         [PurchaseAgreement].\n"]
  start_time : timestamp option; [@ocaml.doc "The date and time when the agreement starts.\n"]
  end_time : timestamp option;
      [@ocaml.doc
        "The date and time when the agreement ends. The field is [null] for pay-as-you-go \
         agreements, which don\226\128\153t have end dates.\n"]
  acceptance_time : timestamp option;
      [@ocaml.doc
        "The date and time the offer was accepted or the agreement was created.\n\n\
        \   [AcceptanceTime] and [StartTime] can differ for future dated agreements (FDAs).\n\
        \  \n\
        \   "]
  agreement_type : agreement_type option;
      [@ocaml.doc
        "The type of agreement. Values are [PurchaseAgreement] or [VendorInsightsAgreement].\n"]
  estimated_charges : estimated_charges option;
      [@ocaml.doc "The estimated cost of the agreement.\n"]
  proposal_summary : proposal_summary option;
      [@ocaml.doc "A summary of the proposal received from the proposer.\n"]
  status : agreement_status option;
      [@ocaml.doc
        "The current status of the agreement.\n\n\
        \ Statuses include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ACTIVE] \226\128\147 The terms of the agreement are active.\n\
        \            \n\
        \             }\n\
        \        {-   [ARCHIVED] \226\128\147 The agreement ended without a specified reason.\n\
        \            \n\
        \             }\n\
        \        {-   [CANCELLED] \226\128\147 The acceptor ended the agreement before the defined \
         end date.\n\
        \            \n\
        \             }\n\
        \        {-   [EXPIRED] \226\128\147 The agreement ended on the defined end date.\n\
        \            \n\
        \             }\n\
        \        {-   [RENEWED] \226\128\147 The agreement was renewed into a new agreement (for \
         example, an auto-renewal).\n\
        \            \n\
        \             }\n\
        \        {-   [REPLACED] \226\128\147 The agreement was replaced using an agreement \
         replacement offer.\n\
        \            \n\
        \             }\n\
        \        {-   [TERMINATED] \226\128\147 The agreement ended before the defined end date \
         because of an AWS termination (for example, a payment failure).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_agreement_input = {
  agreement_id : resource_id; [@ocaml.doc "The unique identifier of the agreement.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = {
  request_id : request_id option; [@ocaml.doc "The unique identifier for the error.\n"]
  message : exception_message option; [@ocaml.doc "Description of the error.\n"]
  quota_code : bounded_string option; [@ocaml.doc "The code of the quota that was exceeded.\n"]
  service_code : bounded_string option;
      [@ocaml.doc "The code of the service whose quota was exceeded.\n"]
  resource_type : bounded_string option;
      [@ocaml.doc "The type of the resource that exceeded the quota.\n"]
  resource_id : resource_id option;
      [@ocaml.doc "The unique identifier of the resource that exceeded the quota.\n"]
}
[@@ocaml.doc
  "Request exceeded the maximum allowed limit (quota) for a specific resource or API operation.\n"]

type nonrec itemized_charge = {
  dimension_key : bounded_string option;
      [@ocaml.doc "The dimension key as specified in the accepted term.\n"]
  new_quantity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The requested quantity for this dimension.\n"]
  old_quantity : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc
        "The existing quantity for this dimension from the source agreement. This value is [0] for \
         NEW intent.\n"]
  charge_reference : resource_id option;
      [@ocaml.doc
        "The identifier of the expected charge that this itemized charge contributes to.\n"]
  incremental_charge_amount : bounded_string option;
      [@ocaml.doc "The total incremental charge amount for this dimension.\n"]
}
[@@ocaml.doc
  "A breakdown of individual charges or line items within a billing or pricing context.\n"]

type nonrec itemized_charge_list = itemized_charge list [@@ocaml.doc ""]

type nonrec tax_breakdown_item = {
  amount : bounded_string option; [@ocaml.doc "The estimated tax amount.\n"]
  rate : bounded_string option; [@ocaml.doc "The tax rate, in decimals.\n"]
  type_ : bounded_string option; [@ocaml.doc "The type of tax (for example, VAT, ST, or GST).\n"]
}
[@@ocaml.doc "Represents a single tax breakdown entry with amount, rate, and type.\n"]

type nonrec tax_breakdown = tax_breakdown_item list [@@ocaml.doc ""]

type nonrec estimated_taxes = {
  breakdown : tax_breakdown option; [@ocaml.doc "A list of tax breakdown information.\n"]
  total_amount : bounded_string option;
      [@ocaml.doc "The total amount of tax aggregated from the tax breakdown.\n"]
}
[@@ocaml.doc "Provides an aggregated view of estimated tax information.\n"]

type nonrec timing =
  | ON_ACCEPTANCE [@ocaml.doc ""]
  | SCHEDULED [@ocaml.doc ""]
  | BILLING_PERIOD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec expected_charge = {
  id : resource_id option; [@ocaml.doc "Unique identifier of the charge for a given agreement.\n"]
  time : timestamp option;
      [@ocaml.doc
        "The date and time when the charge is due to be invoiced. This is available only when the \
         charge date is known.\n"]
  amount : bounded_string option;
      [@ocaml.doc
        "The tax-exclusive amount of the charge. Only available when the charge amount is known.\n"]
  amount_after_tax : bounded_string option;
      [@ocaml.doc
        "The tax-inclusive amount the acceptor has to pay. The amount is only present for fixed \
         charges.\n"]
  timing : timing option;
      [@ocaml.doc
        "Indicates when the charge amount will be incurred. Values include [ON_ACCEPTANCE] \
         (charged immediately when the agreement request is accepted), [BILLING_PERIOD] (charged \
         on each billing period), and [SCHEDULED] (charged at a predetermined future date).\n"]
  estimated_taxes : estimated_taxes option;
      [@ocaml.doc
        "Provides an aggregated view of estimated tax information for this specific charge.\n"]
}
[@@ocaml.doc "Estimated charge for the request.\n"]

type nonrec expected_charge_list = expected_charge list [@@ocaml.doc ""]

type nonrec charge_summary = {
  currency_code : currency_code option;
      [@ocaml.doc "The three-letter currency code for all charges (e.g., USD).\n"]
  new_agreement_value : bounded_string option;
      [@ocaml.doc "The total value of the agreement, which includes any amendments.\n"]
  new_agreement_value_after_tax : bounded_string option;
      [@ocaml.doc "Expected new agreement value after estimated taxes are applied.\n"]
  expected_charges : expected_charge_list option;
      [@ocaml.doc "A list of expected charges for the agreement request.\n"]
  estimated_taxes : estimated_taxes option;
      [@ocaml.doc "Provides an aggregated view of estimated tax information for the agreement.\n"]
  itemized_charges : itemized_charge_list option;
      [@ocaml.doc "An itemized list of charges for the agreement request.\n"]
  invoicing_entity : invoicing_entity option;
      [@ocaml.doc "The entity responsible for issuing the invoice.\n"]
}
[@@ocaml.doc
  "The [ChargeSummary] provides a detailed breakdown of charges that are associated with an \
   agreement request. This is applicable only when a request is created for a \
   [PurchaseAgreement].\n\n\
  \  Tax and invoicing fields (such as [estimatedTaxes], [amountAfterTax], \
   [newAgreementValueAfterTax], and [invoicingEntity]) are returned on a best-effort basis and do \
   not cause the request to fail if unavailable.\n\
  \  \n\
  \   A [null] tax amount can have two meanings:\n\
  \   \n\
  \    {ul\n\
  \          {-  Tax estimation was unavailable at the time of the request.\n\
  \              \n\
  \               }\n\
  \          {-  The charge timing is [BILLING_PERIOD], so the charge amount is not determined at \
   request time. In this case, the tax breakdown may still include the tax [rate] and [type].\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

type nonrec agreement_request_id = string [@@ocaml.doc ""]

type nonrec create_agreement_request_output = {
  agreement_request_id : agreement_request_id option;
      [@ocaml.doc
        "The unique identifier of the agreement request created. Use this identifier with \
         [AcceptAgreementRequest] to accept the agreement.\n"]
  charge_summary : charge_summary option;
      [@ocaml.doc
        "Provides details of the charges associated with the agreement request. This is only \
         applicable when a request is created for [PurchaseAgreement].\n"]
}
[@@ocaml.doc ""]

type nonrec tax_estimation = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec tax_configuration = {
  tax_estimation : tax_estimation option;
      [@ocaml.doc
        "Toggle to estimate tax as part of the response. Values include [ENABLED] and [DISABLED]. \
         Default is [DISABLED].\n"]
}
[@@ocaml.doc "Configuration controls for tax estimation in the agreement request.\n"]

type nonrec agreement_proposal_id = string [@@ocaml.doc ""]

type nonrec requested_term_configuration =
  | ConfigurableUpfrontPricingTermConfiguration of configurable_upfront_pricing_term_configuration
      [@ocaml.doc ""]
  | RenewalTermConfiguration of renewal_term_configuration [@ocaml.doc ""]
  | VariablePaymentTermConfiguration of variable_payment_term_configuration [@ocaml.doc ""]
[@@ocaml.doc
  "A tagged union that represents the term configuration provided by the acceptor. Only one \
   configuration is accepted per term.\n"]

type nonrec requested_term = {
  id : term_id; [@ocaml.doc "The unique identifier of the term in the agreement proposal.\n"]
  configuration : requested_term_configuration option;
      [@ocaml.doc
        "Additional configuration for the requested terms. This configuration is applicable only \
         to the terms that accept a customer-provided configuration, such as \
         [ConfigurableUpfrontPricingTerm].\n"]
}
[@@ocaml.doc
  "Defines what is being accepted as part of the agreement creation or update request, and it \
   includes their configurations.\n"]

type nonrec requested_term_list = requested_term list [@@ocaml.doc ""]

type nonrec intent = NEW [@ocaml.doc ""] | AMEND [@ocaml.doc ""] | REPLACE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec create_agreement_request_input = {
  client_token : client_token option;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
  intent : intent;
      [@ocaml.doc
        "The purpose and desired outcome of the agreement request. This is a required parameter \
         that determines how the agreement request is processed.\n\n\
        \ {ul\n\
        \       {-   [NEW] \226\128\147 Creates a new agreement for terms in the request.\n\
        \           \n\
        \            }\n\
        \       {-   [AMEND] \226\128\147 Modifies an existing agreement with terms that are \
         accepted in the request.\n\
        \           \n\
        \            }\n\
        \       {-   [REPLACE] \226\128\147 Creates a new agreement with accepted terms and \
         replaces the existing agreement.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  requested_terms : requested_term_list;
      [@ocaml.doc
        "A list of terms that define what is being accepted as part of the agreement. Some terms \
         require configuration.\n"]
  source_agreement_identifier : resource_id option;
      [@ocaml.doc
        "The agreement's identifier that the request acts upon.\n\n\
        \   This parameter is required for all non-[NEW] intents (i.e., [AMEND] or [REPLACE]). \
         Don't provide this parameter if the intent is [NEW]. \n\
        \  \n\
        \   "]
  agreement_proposal_identifier : agreement_proposal_id option;
      [@ocaml.doc
        "The agreement proposal signed by the proposer. The proposal includes the requested \
         resources and the terms that outline an agreement outcome.\n\n\
        \   This parameter is required if the intent is not [AMEND].\n\
        \  \n\
        \   "]
  tax_configuration : tax_configuration option;
      [@ocaml.doc "Configuration for tax estimation in the agreement request response.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_agreement_payment_request_output = {
  payment_request_id : payment_request_id option;
      [@ocaml.doc "The unique identifier of the cancelled payment request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc "The unique identifier of the agreement associated with this payment request.\n"]
  status : payment_request_status option;
      [@ocaml.doc "The updated status of the payment request, which is [CANCELLED].\n"]
  name : payment_request_name option; [@ocaml.doc "The descriptive name of the payment request.\n"]
  description : payment_request_description option;
      [@ocaml.doc "The detailed description of the payment request, if provided.\n"]
  charge_amount : positive_amount_upto8_decimals option;
      [@ocaml.doc "The amount that was requested to be charged.\n"]
  currency_code : currency_code option; [@ocaml.doc "The currency code for the charge amount.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The date and time when the payment request was originally created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The date and time when the payment request was cancelled.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_agreement_payment_request_input = {
  payment_request_id : payment_request_id;
      [@ocaml.doc "The unique identifier of the payment request to cancel.\n"]
  agreement_id : agreement_id;
      [@ocaml.doc "The unique identifier of the agreement associated with the payment request.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_agreement_cancellation_request_output = {
  agreement_cancellation_request_id : agreement_cancellation_request_id option;
      [@ocaml.doc "The unique identifier of the cancelled cancellation request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc
        "The unique identifier of the agreement associated with this cancellation request.\n"]
  reason_code : agreement_cancellation_request_reason_code option;
      [@ocaml.doc "The original reason code provided when the cancellation request was created.\n"]
  description : agreement_cancellation_request_description option;
      [@ocaml.doc "The detailed description of the original cancellation reason, if provided.\n"]
  status : agreement_cancellation_request_status option;
      [@ocaml.doc "The updated status of the cancellation request, which is [CANCELLED].\n"]
  status_message : agreement_cancellation_request_status_message option;
      [@ocaml.doc "A message providing additional context about the cancellation request status.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was originally created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was cancelled.\n"]
}
[@@ocaml.doc ""]

type nonrec agreement_cancellation_request_cancellation_reason = string [@@ocaml.doc ""]

type nonrec cancel_agreement_cancellation_request_input = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement associated with the cancellation request.\n"]
  agreement_cancellation_request_id : agreement_cancellation_request_id;
      [@ocaml.doc "The unique identifier of the cancellation request to cancel.\n"]
  cancellation_reason : agreement_cancellation_request_cancellation_reason;
      [@ocaml.doc
        "A required message explaining why the cancellation request is being withdrawn (1-2000 \
         characters).\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_agreement_output = unit [@@ocaml.doc ""]

type nonrec cancel_agreement_input = {
  agreement_id : resource_id; [@ocaml.doc "The unique identifier of the agreement.\n"]
}
[@@ocaml.doc ""]

type nonrec billing_adjustment_error_code =
  | CONFLICT_EXCEPTION [@ocaml.doc ""]
  | VALIDATION_EXCEPTION [@ocaml.doc ""]
  | RESOURCE_NOT_FOUND_EXCEPTION [@ocaml.doc ""]
  | INTERNAL_FAILURE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batch_create_billing_adjustment_error = {
  code : billing_adjustment_error_code;
      [@ocaml.doc "The error code indicating the reason for failure.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "A human-readable message describing the error.\n"]
  client_token : client_token; [@ocaml.doc "The client token of the request entry that failed.\n"]
}
[@@ocaml.doc "An error for a billing adjustment request entry that failed validation.\n"]

type nonrec batch_create_billing_adjustment_error_list = batch_create_billing_adjustment_error list
[@@ocaml.doc ""]

type nonrec batch_create_billing_adjustment_item = {
  billing_adjustment_request_id : billing_adjustment_request_id;
      [@ocaml.doc "The unique identifier of the created billing adjustment request.\n"]
  client_token : client_token;
      [@ocaml.doc "The client token provided in the corresponding request entry.\n"]
}
[@@ocaml.doc "A successfully created billing adjustment request item.\n"]

type nonrec batch_create_billing_adjustment_item_list = batch_create_billing_adjustment_item list
[@@ocaml.doc ""]

type nonrec batch_create_billing_adjustment_request_output = {
  items : batch_create_billing_adjustment_item_list;
      [@ocaml.doc
        "A list of successfully created billing adjustment items, each containing the \
         [billingAdjustmentRequestId] and [clientToken].\n"]
  errors : batch_create_billing_adjustment_error_list;
      [@ocaml.doc
        "A list of errors for entries that failed validation, each containing the [clientToken], \
         error [code], and [message].\n"]
}
[@@ocaml.doc ""]

type nonrec billing_adjustment_description = string [@@ocaml.doc ""]

type nonrec batch_create_billing_adjustment_request_entry = {
  agreement_id : agreement_id;
      [@ocaml.doc "The unique identifier of the agreement associated with the invoice.\n"]
  original_invoice_id : invoice_id;
      [@ocaml.doc "The identifier of the original invoice to adjust.\n"]
  adjustment_amount : positive_amount_upto8_decimals;
      [@ocaml.doc
        "The adjustment amount as a string representation of a decimal number in the currency of \
         the invoice.\n"]
  currency_code : currency_code;
      [@ocaml.doc
        "The 3-letter ISO 4217 currency code for the adjustment amount. Must match the currency \
         code of the offer associated with the agreement (e.g., [USD]).\n"]
  adjustment_reason_code : billing_adjustment_reason_code;
      [@ocaml.doc "The reason code for the billing adjustment.\n"]
  description : billing_adjustment_description option;
      [@ocaml.doc "An optional detailed description of the adjustment reason.\n"]
  client_token : client_token;
      [@ocaml.doc
        "A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         request.\n"]
}
[@@ocaml.doc
  "An individual entry in a batch billing adjustment request, specifying the invoice and \
   adjustment details.\n"]

type nonrec batch_create_billing_adjustment_request_entry_list =
  batch_create_billing_adjustment_request_entry list
[@@ocaml.doc ""]

type nonrec batch_create_billing_adjustment_request_input = {
  billing_adjustment_request_entries : batch_create_billing_adjustment_request_entry_list;
      [@ocaml.doc
        "A list of billing adjustment request entries. Each entry specifies the invoice and \
         adjustment details.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_agreement_request_output = {
  agreement_id : resource_id option;
      [@ocaml.doc
        "The unique identifier of the agreement created or modified by accepting the agreement \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_agreement_request_input = {
  agreement_request_id : agreement_request_id;
      [@ocaml.doc "The unique identifier of the agreement request.\n"]
  purchase_orders : purchase_orders option;
      [@ocaml.doc
        "A list of purchase orders associated with accepting a marketplace agreement request.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_agreement_payment_request_output = {
  payment_request_id : payment_request_id option;
      [@ocaml.doc "The unique identifier of the accepted payment request.\n"]
  agreement_id : agreement_id option;
      [@ocaml.doc "The unique identifier of the agreement associated with this payment request.\n"]
  status : payment_request_status option;
      [@ocaml.doc "The updated status of the payment request, which is [APPROVED].\n"]
  name : payment_request_name option; [@ocaml.doc "The descriptive name of the payment request.\n"]
  description : payment_request_description option;
      [@ocaml.doc "The detailed description of the payment request, if provided.\n"]
  charge_amount : positive_amount_upto8_decimals option;
      [@ocaml.doc "The amount that was approved to be charged.\n"]
  currency_code : currency_code option; [@ocaml.doc "The currency code for the charge amount.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the payment request was originally created.\n"]
  updated_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time when the payment request was accepted.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_agreement_payment_request_input = {
  payment_request_id : payment_request_id;
      [@ocaml.doc "The unique identifier of the payment request to accept.\n"]
  agreement_id : agreement_id;
      [@ocaml.doc "The unique identifier of the agreement associated with the payment request.\n"]
  purchase_order_reference : purchase_order_reference option;
      [@ocaml.doc
        "An optional purchase order reference that buyers can provide to associate the payment \
         request with their internal purchase order system.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_agreement_cancellation_request_output = {
  agreement_id : agreement_id option;
      [@ocaml.doc
        "The unique identifier of the agreement associated with this cancellation request.\n"]
  agreement_cancellation_request_id : agreement_cancellation_request_id option;
      [@ocaml.doc "The unique identifier of the accepted cancellation request.\n"]
  status : agreement_cancellation_request_status option;
      [@ocaml.doc "The updated status of the cancellation request, which is [APPROVED].\n"]
  reason_code : agreement_cancellation_request_reason_code option;
      [@ocaml.doc "The original reason code provided when the cancellation request was created.\n"]
  description : agreement_cancellation_request_description option;
      [@ocaml.doc "The detailed description of the cancellation reason, if provided.\n"]
  created_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was originally created.\n"]
  updated_at : timestamp option;
      [@ocaml.doc "The date and time when the cancellation request was accepted.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_agreement_cancellation_request_input = {
  agreement_id : agreement_id;
      [@ocaml.doc
        "The unique identifier of the agreement associated with the cancellation request.\n"]
  agreement_cancellation_request_id : agreement_cancellation_request_id;
      [@ocaml.doc "The unique identifier of the cancellation request to accept.\n"]
}
[@@ocaml.doc ""]
