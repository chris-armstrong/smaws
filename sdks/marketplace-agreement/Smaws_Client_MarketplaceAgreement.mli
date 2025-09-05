(** 
    Marketplace Agreement client library built on EIO.
    
*)

(** {1:types Types} *)

type nonrec zero_value_integer = int[@@ocaml.doc ""]
type nonrec unversioned_term_type = string[@@ocaml.doc ""]
type nonrec bounded_string = string[@@ocaml.doc ""]
type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec validity_term =
  {
  agreement_end_date: timestamp option
    [@ocaml.doc
      "Defines the date when the agreement ends. The agreement ends at 23:59:59.999 UTC on the date provided. If [AgreementEndDate] isn\226\128\153t provided, the agreement end date is determined by the validity of individual terms.\n"];
  agreement_start_date: timestamp option
    [@ocaml.doc
      "Defines the date when agreement starts. The agreement starts at 00:00:00.000 UTC on the date provided. If [AgreementStartDate] isn\226\128\153t provided, the agreement start date is determined based on agreement signature time.\n"];
  agreement_duration: bounded_string option
    [@ocaml.doc
      "Defines the duration that the agreement remains active. If [AgreementStartDate] isn\226\128\153t provided, the agreement duration is relative to the agreement signature time. The duration is represented in the ISO_8601 format.\n"];
  type_: unversioned_term_type option
    [@ocaml.doc "Category of the term being updated. \n"]}[@@ocaml.doc
                                                            "Defines the conditions that will keep an agreement created from this offer valid. \n"]
type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | UNSUPPORTED_FILTERS [@ocaml.doc ""]
  | INVALID_MAX_RESULTS [@ocaml.doc ""]
  | INVALID_NEXT_TOKEN [@ocaml.doc ""]
  | INVALID_SORT_ORDER [@ocaml.doc ""]
  | INVALID_SORT_BY [@ocaml.doc ""]
  | INVALID_FILTER_VALUES [@ocaml.doc ""]
  | INVALID_FILTER_NAME [@ocaml.doc ""]
  | INVALID_CATALOG [@ocaml.doc ""]
  | MISSING_AGREEMENT_ID [@ocaml.doc ""]
  | INVALID_AGREEMENT_ID [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec validation_exception_field =
  {
  message: bounded_string [@ocaml.doc "See applicable actions.\n"];
  name: bounded_string
    [@ocaml.doc "The name of the field associated with the error.\n"]}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by the service.\n"]
type nonrec validation_exception_field_list = validation_exception_field list
[@@ocaml.doc ""]
type nonrec request_id = string[@@ocaml.doc ""]
type nonrec exception_message = string[@@ocaml.doc ""]
type nonrec validation_exception =
  {
  fields: validation_exception_field_list option
    [@ocaml.doc "The fields associated with the error.\n"];
  reason: validation_exception_reason option
    [@ocaml.doc "The reason associated with the error.\n"];
  message: exception_message option [@ocaml.doc ""];
  request_id: request_id option
    [@ocaml.doc "The unique identifier associated with the error.\n"]}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by the service.\n"]
type nonrec rate_card_item =
  {
  price: bounded_string option
    [@ocaml.doc
      "Per unit price for the product dimension that\226\128\153s used for calculating the amount to be charged.\n"];
  dimension_key: bounded_string option
    [@ocaml.doc
      "Dimension for which the given entitlement applies. Dimensions represent categories of capacity in a product and are specified when the product is listed in AWS Marketplace.\n"]}
[@@ocaml.doc
  "Defines the per unit rates for each individual product dimension.\n"]
type nonrec rate_card_list = rate_card_item list[@@ocaml.doc ""]
type nonrec usage_based_rate_card_item =
  {
  rate_card: rate_card_list option
    [@ocaml.doc "Defines the per unit rates for product dimensions.\n"]}
[@@ocaml.doc
  "Within the pay-as-you-go model defined under [UsageBasedPricingTerm], the [UsageBasedRateCardItem] defines an individual rate for a product dimension.\n"]
type nonrec usage_based_rate_card_list = usage_based_rate_card_item list
[@@ocaml.doc ""]
type nonrec currency_code = string[@@ocaml.doc ""]
type nonrec usage_based_pricing_term =
  {
  rate_cards: usage_based_rate_card_list option
    [@ocaml.doc "List of rate cards.\n"];
  currency_code: currency_code option
    [@ocaml.doc
      "Defines the currency for the prices mentioned in the term. \n"];
  type_: unversioned_term_type option [@ocaml.doc "Category of the term.\n"]}
[@@ocaml.doc
  "Defines a usage-based pricing model (typically, pay-as-you-go pricing), where the customers are charged based on product usage.\n"]
type nonrec throttling_exception =
  {
  message: exception_message option [@ocaml.doc ""];
  request_id: request_id option
    [@ocaml.doc "The unique identifier for the error.\n"]}[@@ocaml.doc
                                                            "Request was denied due to request throttling.\n"]
type nonrec support_term =
  {
  refund_policy: bounded_string option
    [@ocaml.doc
      "Free-text field about the refund policy description that will be shown to customers as is on the website and console.\n"];
  type_: unversioned_term_type option
    [@ocaml.doc "Category of the term being updated.\n"]}[@@ocaml.doc
                                                           "Defines the customer support available for the acceptors when they purchase the software.\n"]
type nonrec sort_order =
  | DESCENDING [@ocaml.doc ""]
  | ASCENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sort_by = string[@@ocaml.doc ""]
type nonrec sort =
  {
  sort_order: sort_order option
    [@ocaml.doc
      "The sorting order, which can be [ASCENDING] or [DESCENDING]. The default value is [DESCENDING].\n"];
  sort_by: sort_by option
    [@ocaml.doc
      "The attribute on which the data is grouped, which can be by [StartTime] and [EndTime]. The default value is [EndTime].\n"]}
[@@ocaml.doc
  "An object that contains the [SortBy] and [SortOrder] attributes.\n"]
type nonrec selector =
  {
  value: bounded_string option
    [@ocaml.doc
      "Contract duration. This field supports the ISO 8601 format. \n"];
  type_: bounded_string option [@ocaml.doc "Category of selector.\n"]}
[@@ocaml.doc
  "Differentiates between the mutually exclusive rate cards in the same pricing term to be selected by the buyer.\n"]
type nonrec resource_id = string[@@ocaml.doc ""]
type nonrec agreement_type = string[@@ocaml.doc ""]
type nonrec aws_account_id = string[@@ocaml.doc ""]
type nonrec acceptor =
  {
  account_id: aws_account_id option
    [@ocaml.doc "The AWS account ID of the acceptor.\n"]}[@@ocaml.doc
                                                           "The details of the party accepting the agreement terms. This is commonly the buyer for [PurchaseAgreement].\n"]
type nonrec proposer =
  {
  account_id: aws_account_id option
    [@ocaml.doc "The AWS account ID of the proposer.\n"]}[@@ocaml.doc
                                                           "Details of the party proposing the agreement terms,. This is commonly the seller for [PurchaseAgreement]. \n"]
type nonrec agreement_resource_type = string[@@ocaml.doc ""]
type nonrec resource =
  {
  type_: agreement_resource_type option
    [@ocaml.doc
      "Type of the resource, which is the product. Values include [SaaSProduct] or [AmiProduct].\n"];
  id: resource_id option
    [@ocaml.doc
      "The unique identifier of the resource.\n\n  We mention the term resource, which is most commonly a product, so a [resourceId] is also a [productId].\n  \n   "]}
[@@ocaml.doc "The list of resources involved in the agreement.\n"]
type nonrec resources = resource list[@@ocaml.doc ""]
type nonrec offer_id = string[@@ocaml.doc ""]
type nonrec proposal_summary =
  {
  offer_id: offer_id option
    [@ocaml.doc "The unique identifier of the offer in AWS Marketplace.\n"];
  resources: resources option
    [@ocaml.doc "The list of resources involved in the agreement.\n"]}
[@@ocaml.doc "A summary of the proposal received from the proposer.\n"]
type nonrec agreement_status =
  | TERMINATED [@ocaml.doc ""]
  | SUPERSEDED [@ocaml.doc ""]
  | ROLLED_BACK [@ocaml.doc ""]
  | REPLACED [@ocaml.doc ""]
  | RENEWED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec agreement_view_summary =
  {
  status: agreement_status option
    [@ocaml.doc "The current status of the agreement. \n"];
  proposal_summary: proposal_summary option
    [@ocaml.doc "A summary of the proposal\n"];
  proposer: proposer option
    [@ocaml.doc
      "Details of the party proposing the agreement terms, most commonly the seller for [PurchaseAgreement].\n"];
  acceptor: acceptor option
    [@ocaml.doc
      "Details of the party accepting the agreement terms. This is commonly the buyer for [PurchaseAgreement.] \n"];
  agreement_type: agreement_type option
    [@ocaml.doc
      "The type of agreement. Values are [PurchaseAgreement] or [VendorInsightsAgreement].\n"];
  end_time: timestamp option
    [@ocaml.doc
      "The date and time when the agreement ends. The field is [null] for pay-as-you-go agreements, which don\226\128\153t have end dates.\n"];
  start_time: timestamp option
    [@ocaml.doc "The date and time when the agreement starts.\n"];
  acceptance_time: timestamp option
    [@ocaml.doc "The date and time that the agreement was accepted.\n"];
  agreement_id: resource_id option
    [@ocaml.doc "The unique identifier of the agreement.\n"]}[@@ocaml.doc
                                                               "A summary of the agreement, including top-level attributes (for example, the agreement ID, version, proposer, and acceptor).\n"]
type nonrec agreement_view_summary_list = agreement_view_summary list
[@@ocaml.doc ""]
type nonrec next_token = string[@@ocaml.doc ""]
type nonrec search_agreements_output =
  {
  next_token: next_token option
    [@ocaml.doc
      "The token used for pagination. The field is [null] if there are no more results.\n"];
  agreement_view_summaries: agreement_view_summary_list option
    [@ocaml.doc
      "A summary of the agreement, including top-level attributes (for example, the agreement ID, version, proposer, and acceptor).\n"]}
[@@ocaml.doc ""]
type nonrec catalog = string[@@ocaml.doc ""]
type nonrec filter_name = string[@@ocaml.doc ""]
type nonrec filter_value = string[@@ocaml.doc ""]
type nonrec filter_value_list = filter_value list[@@ocaml.doc ""]
type nonrec filter =
  {
  values: filter_value_list option [@ocaml.doc "The filter value.\n"];
  name: filter_name option [@ocaml.doc "The name of the filter.\n"]}[@@ocaml.doc
                                                                    "The filter name and value pair that is used to return a more specific list of results. Filters can be used to match a set of resources by various criteria, such as [offerId] or [productId].\n"]
type nonrec filter_list = filter list[@@ocaml.doc ""]
type nonrec max_results = int[@@ocaml.doc ""]
type nonrec search_agreements_input =
  {
  next_token: next_token option
    [@ocaml.doc "A token to specify where to start pagination.\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of agreements to return in the response.\n"];
  sort: sort option
    [@ocaml.doc
      "An object that contains the [SortBy] and [SortOrder] attributes.\n"];
  filters: filter_list option
    [@ocaml.doc
      "The filter name and value pair used to return a specific list of results.\n\n The following filters are supported:\n \n  {ul\n        {-   [ResourceIdentifier] \226\128\147 The unique identifier of the resource.\n            \n             }\n        {-   [ResourceType] \226\128\147 Type of the resource, which is the product ([AmiProduct], [ContainerProduct], or [SaaSProduct]).\n            \n             }\n        {-   [PartyType] \226\128\147 The party type (either [Acceptor] or [Proposer]) of the caller. For agreements where the caller is the proposer, use the [Proposer] filter. For agreements where the caller is the acceptor, use the [Acceptor] filter.\n            \n             }\n        {-   [AcceptorAccountId] \226\128\147 The AWS account ID of the party accepting the agreement terms.\n            \n             }\n        {-   [OfferId] \226\128\147 The unique identifier of the offer in which the terms are registered in the agreement token.\n            \n             }\n        {-   [Status] \226\128\147 The current status of the agreement. Values include [ACTIVE], [ARCHIVED], [CANCELLED], [EXPIRED], [RENEWED], [REPLACED], and [TERMINATED].\n            \n             }\n        {-   [BeforeEndTime] \226\128\147 A date used to filter agreements with a date before the [endTime] of an agreement.\n            \n             }\n        {-   [AfterEndTime] \226\128\147 A date used to filter agreements with a date after the [endTime] of an agreement.\n            \n             }\n        {-   [AgreementType] \226\128\147 The type of agreement. Values include [PurchaseAgreement] or [VendorInsightsAgreement].\n            \n             }\n        }\n  "];
  catalog: catalog option
    [@ocaml.doc "The catalog in which the agreement was created.\n"]}
[@@ocaml.doc ""]
type nonrec internal_server_exception =
  {
  message: exception_message option [@ocaml.doc ""];
  request_id: request_id option
    [@ocaml.doc "The unique identifier for the error.\n"]}[@@ocaml.doc
                                                            "Unexpected error during processing of request.\n"]
type nonrec access_denied_exception =
  {
  message: exception_message option [@ocaml.doc ""];
  request_id: request_id option
    [@ocaml.doc "The unique identifier for the error.\n"]}[@@ocaml.doc
                                                            "User does not have sufficient access to perform this action.\n"]
type nonrec schedule_item =
  {
  charge_amount: bounded_string option
    [@ocaml.doc
      "The price that the customer would pay on the scheduled date (chargeDate).\n"];
  charge_date: timestamp option
    [@ocaml.doc
      "The date that the customer would pay the price defined in this payment schedule term. Invoices are generated on the date provided.\n"]}
[@@ocaml.doc
  "An individual installment of the payment that includes the date and amount of the charge.\n"]
type nonrec schedule_list = schedule_item list[@@ocaml.doc ""]
type nonrec resource_type =
  | AGREEMENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  resource_type: resource_type option [@ocaml.doc "The type of resource.\n"];
  resource_id: resource_id option
    [@ocaml.doc "The unique identifier for the resource.\n"];
  message: exception_message option [@ocaml.doc ""];
  request_id: request_id option
    [@ocaml.doc "The unique identifier for the error.\n"]}[@@ocaml.doc
                                                            "Request references a resource which does not exist.\n"]
type nonrec boolean_ = bool[@@ocaml.doc ""]
type nonrec renewal_term_configuration =
  {
  enable_auto_renew: boolean_
    [@ocaml.doc
      "Defines whether the acceptor has chosen to auto-renew the agreement at the end of its lifecycle. Can be set to [True] or [False].\n"]}
[@@ocaml.doc
  "Additional parameters specified by the acceptor while accepting the term.\n"]
type nonrec renewal_term =
  {
  configuration: renewal_term_configuration option
    [@ocaml.doc
      "Additional parameters specified by the acceptor while accepting the term.\n"];
  type_: unversioned_term_type option
    [@ocaml.doc "Category of the term being updated. \n"]}[@@ocaml.doc
                                                            "Defines that on graceful expiration of the agreement (when the agreement ends on its pre-defined end date), a new agreement will be created using the accepted terms on the existing agreement. In other words, the agreement will be renewed. The presence of [RenewalTerm] in the offer document means that auto-renewal is allowed. Buyers will have the option to accept or decline auto-renewal at the offer acceptance/agreement creation. Buyers can also change this flag from [True] to [False] or [False] to [True] at anytime during the agreement's lifecycle.\n"]
type nonrec recurring_payment_term =
  {
  price: bounded_string option
    [@ocaml.doc "Amount charged to the buyer every billing period.\n"];
  billing_period: bounded_string option
    [@ocaml.doc "Defines the recurrence at which buyers are charged.\n"];
  currency_code: currency_code option
    [@ocaml.doc
      "Defines the currency for the prices mentioned in this term. \n"];
  type_: unversioned_term_type option
    [@ocaml.doc "Type of the term being updated.\n"]}[@@ocaml.doc
                                                       "Defines a pricing model where customers are charged a fixed recurring price at the end of each billing period.\n"]
type nonrec positive_integer_with_default_value_one = int[@@ocaml.doc ""]
type nonrec payment_schedule_term =
  {
  schedule: schedule_list option
    [@ocaml.doc
      "List of the payment schedule where each element defines one installment of payment. It contains the information necessary for calculating the price.\n"];
  currency_code: currency_code option
    [@ocaml.doc
      "Defines the currency for the prices mentioned in the term. \n"];
  type_: unversioned_term_type option [@ocaml.doc "Type of the term.\n"]}
[@@ocaml.doc
  "Defines an installment-based pricing model where customers are charged a fixed price on different dates during the agreement validity period. This is used most commonly for flexible payment schedule pricing.\n"]
type nonrec document_item =
  {
  version: bounded_string option
    [@ocaml.doc
      "Version of standard contracts provided by AWS Marketplace. Required when Type is [StandardEula] or [StandardDsa]. \n"];
  url: bounded_string option
    [@ocaml.doc
      "A URL to the legal document for buyers to read. Required when [Type] is [CustomEula].\n"];
  type_: bounded_string option
    [@ocaml.doc
      "Category of the document. Document types include:\n\n {ul\n       {-   [CustomEula] \226\128\147 A custom EULA provided by you as seller. A URL for a EULA stored in an accessible Amazon S3 bucket is required for this document type.\n           \n            }\n       {-   [CustomDsa] \226\128\147 A custom Data Subscription Agreement (DSA) provided by you as seller. A URL for a DSA stored in an accessible Amazon S3 bucket is required for this document type.\n           \n            }\n       {-   [StandardEula] \226\128\147 The Standard Contract for AWS Marketplace (SCMP). For more information about SCMP, see the AWS Marketplace Seller Guide. You don\226\128\153t provide a URL for this type because it\226\128\153s managed by AWS Marketplace.\n           \n            }\n       {-   [StandardDsa] \226\128\147 DSA for AWS Marketplace. For more information about the DSA, see the AWS Data Exchange User Guide. You don\226\128\153t provide a URL for this type because it\226\128\153s managed by AWS Marketplace.\n           \n            }\n       }\n  "]}
[@@ocaml.doc
  "Includes the list of references to legal resources proposed by the proposer to the acceptor. Each [DocumentItem] refers to an individual reference.\n"]
type nonrec document_list = document_item list[@@ocaml.doc ""]
type nonrec legal_term =
  {
  documents: document_list option
    [@ocaml.doc
      "List of references to legal resources proposed to the buyers. An example is the EULA.\n"];
  type_: unversioned_term_type option
    [@ocaml.doc "Category of the term being updated.\n"]}[@@ocaml.doc
                                                           "Defines the list of text agreements proposed to the acceptors. An example is the end user license agreement (EULA).\n"]
type nonrec grant_item =
  {
  max_quantity: positive_integer_with_default_value_one option
    [@ocaml.doc
      "Maximum amount of capacity that the buyer can be entitled to the given dimension of the product. If [MaxQuantity] is not provided, the buyer will be able to use an unlimited amount of the given dimension. \n"];
  dimension_key: bounded_string option
    [@ocaml.doc
      "Unique dimension key defined in the product document. Dimensions represent categories of capacity in a product and are specified when the product is listed in AWS Marketplace. \n"]}
[@@ocaml.doc
  "Entitlements granted to the acceptor of fixed upfront as part of agreement execution.\n"]
type nonrec grant_list = grant_item list[@@ocaml.doc ""]
type nonrec constraints =
  {
  quantity_configuration: bounded_string option
    [@ocaml.doc
      "Determines if acceptors are allowed to configure quantity for each dimension in rate card. The possible values are [Allowed] and [Disallowed]. The default value is [Allowed].\n"];
  multiple_dimension_selection: bounded_string option
    [@ocaml.doc
      "Determines if buyers are allowed to select multiple dimensions in the rate card. The possible values are [Allowed] and [Disallowed]. The default value is [Allowed].\n"]}
[@@ocaml.doc
  "Defines limits on how the term can be configured by acceptors. \n"]
type nonrec configurable_upfront_rate_card_item =
  {
  rate_card: rate_card_list option
    [@ocaml.doc "Defines the per unit rates for product dimensions.\n"];
  constraints: constraints option
    [@ocaml.doc
      "Defines limits on how the term can be configured by acceptors.\n"];
  selector: selector option
    [@ocaml.doc
      "Differentiates between the mutually exclusive rate cards in the same pricing term to be selected by the buyer.\n"]}
[@@ocaml.doc
  "Within the prepaid payment model defined under [ConfigurableUpfrontPricingTerm], the [RateCardItem] defines all the various rate cards (including pricing and dimensions) that have been proposed.\n"]
type nonrec configurable_upfront_rate_card_list =
  configurable_upfront_rate_card_item list[@@ocaml.doc ""]
type nonrec dimension =
  {
  dimension_value: zero_value_integer
    [@ocaml.doc
      "The number of units of the dimension the acceptor has purchased.\n\n  For Agreements with [ConfigurableUpfrontPricingTerm], the [RateCard] section will define the prices and dimensions defined by the seller (proposer), whereas the [Configuration] section will define the actual dimensions, prices, and units the buyer has chosen to accept.\n  \n   "];
  dimension_key: bounded_string
    [@ocaml.doc "The name of key value of the dimension.\n"]}[@@ocaml.doc
                                                               "Defines the dimensions that the acceptor has purchased from the overall set of dimensions presented in the rate card.\n"]
type nonrec dimension_list = dimension list[@@ocaml.doc ""]
type nonrec configurable_upfront_pricing_term_configuration =
  {
  dimensions: dimension_list
    [@ocaml.doc
      "Defines the dimensions that the acceptor has purchased from the overall set of dimensions presented in the rate card.\n"];
  selector_value: bounded_string
    [@ocaml.doc
      "Defines the length of time for which the particular pricing/dimension is being purchased by the acceptor.\n"]}
[@@ocaml.doc
  "Defines a prepaid payment model that allows buyers to configure the entitlements they want to purchase and the duration.\n"]
type nonrec configurable_upfront_pricing_term =
  {
  configuration: configurable_upfront_pricing_term_configuration option
    [@ocaml.doc
      "Additional parameters specified by the acceptor while accepting the term.\n"];
  rate_cards: configurable_upfront_rate_card_list option
    [@ocaml.doc
      "A rate card defines the per unit rates for product dimensions.\n"];
  currency_code: currency_code option
    [@ocaml.doc
      "Defines the currency for the prices mentioned in the term.\n"];
  type_: unversioned_term_type option [@ocaml.doc "Category of selector.\n"]}
[@@ocaml.doc
  "Defines a prepaid payment model that allows buyers to configure the entitlements they want to purchase and the duration.\n"]
type nonrec byol_pricing_term =
  {
  type_: unversioned_term_type option
    [@ocaml.doc "Type of the term being updated.\n"]}[@@ocaml.doc
                                                       "Enables you and your customers to move your existing agreements to AWS Marketplace. The customer won't be charged for product usage in AWS Marketplace because they already paid for the product outside of AWS Marketplace.\n"]
type nonrec free_trial_pricing_term =
  {
  grants: grant_list option
    [@ocaml.doc
      "Entitlements granted to the acceptor of a free trial as part of an agreement execution.\n"];
  duration: bounded_string option
    [@ocaml.doc
      "Duration of the free trial period (5\226\128\14731 days). \n"];
  type_: unversioned_term_type option [@ocaml.doc "Category of the term.\n"]}
[@@ocaml.doc
  "Defines a short-term free pricing model where the buyers aren\226\128\153t charged anything within a specified limit.\n"]
type nonrec fixed_upfront_pricing_term =
  {
  grants: grant_list option
    [@ocaml.doc
      "Entitlements granted to the acceptor of fixed upfront as part of agreement execution.\n"];
  price: bounded_string option
    [@ocaml.doc
      "Fixed amount to be charged to the customer when this term is accepted.\n"];
  duration: bounded_string option
    [@ocaml.doc "Contract duration for the terms.\n"];
  currency_code: currency_code option
    [@ocaml.doc
      "Defines the currency for the prices mentioned in this term. \n"];
  type_: unversioned_term_type option
    [@ocaml.doc "Category of the term being updated.\n"]}[@@ocaml.doc
                                                           "Defines a prepaid pricing model where the customers are charged a fixed upfront amount.\n"]
type nonrec accepted_term =
  | FixedUpfrontPricingTerm of fixed_upfront_pricing_term
  [@ocaml.doc
    "Defines a pre-paid pricing model where the customers are charged a fixed upfront amount.\n"]
  | FreeTrialPricingTerm of free_trial_pricing_term
  [@ocaml.doc
    "Defines a short-term free pricing model where the buyers aren\226\128\153t charged anything within a specified limit.\n"]
  | PaymentScheduleTerm of payment_schedule_term
  [@ocaml.doc
    "Defines an installment-based pricing model where customers are charged a fixed price on different dates during the agreement validity period. This is used most commonly for flexible payment schedule pricing.\n"]
  | ValidityTerm of validity_term
  [@ocaml.doc
    "Defines the conditions that will keep an agreement created from this offer valid.\n"]
  | RecurringPaymentTerm of recurring_payment_term
  [@ocaml.doc
    "Defines a pricing model where customers are charged a fixed recurring price at the end of each billing period.\n"]
  | ByolPricingTerm of byol_pricing_term
  [@ocaml.doc
    "Enables you and your customers to move your existing agreements to AWS Marketplace. The customer won't be charged for product usage in AWS Marketplace because they already paid for the product outside of AWS Marketplace.\n"]
  | ConfigurableUpfrontPricingTerm of configurable_upfront_pricing_term
  [@ocaml.doc
    "Defines a prepaid payment model that allows buyers to configure the entitlements they want to purchase and the duration.\n"]
  | UsageBasedPricingTerm of usage_based_pricing_term
  [@ocaml.doc
    "Defines a usage-based pricing model (typically, pay-as-you-go pricing), where the customers are charged based on product usage.\n"]
  | RenewalTerm of renewal_term
  [@ocaml.doc
    "Defines that on graceful expiration of the agreement (when the agreement ends on its pre-defined end date), a new agreement will be created using the accepted terms on the existing agreement. In other words, the agreement will be renewed. Presence of [RenewalTerm] in the offer document means that auto-renewal is allowed. Buyers will have the option to accept or decline auto-renewal at the offer acceptance/agreement creation. Buyers can also change this flag from [True] to [False] or [False] to [True] at anytime during the agreement's lifecycle.\n"]
  | SupportTerm of support_term
  [@ocaml.doc
    "Defines the customer support available for the acceptors when they purchase the software.\n"]
  | LegalTerm of legal_term
  [@ocaml.doc
    "Defines the list of text agreements proposed to the acceptors. An example is the end user license agreement (EULA).\n"]
[@@ocaml.doc
  "A subset of terms proposed by the proposer, which have been accepted by the acceptor as part of agreement creation.\n"]
type nonrec accepted_term_list = accepted_term list[@@ocaml.doc ""]
type nonrec get_agreement_terms_output =
  {
  next_token: next_token option
    [@ocaml.doc "A token to specify where to start pagination\n"];
  accepted_terms: accepted_term_list option
    [@ocaml.doc
      "A subset of terms proposed by the proposer that have been accepted by the acceptor as part of the agreement creation.\n"]}
[@@ocaml.doc ""]
type nonrec get_agreement_terms_input =
  {
  next_token: next_token option
    [@ocaml.doc "A token to specify where to start pagination\n"];
  max_results: max_results option
    [@ocaml.doc
      "The maximum number of agreements to return in the response.\n"];
  agreement_id: resource_id
    [@ocaml.doc "The unique identifier of the agreement.\n"]}[@@ocaml.doc ""]
type nonrec estimated_charges =
  {
  agreement_value: bounded_string option
    [@ocaml.doc
      "The total known amount customer has to pay across the lifecycle of the agreement.\n\n  This is the total contract value if accepted terms contain [ConfigurableUpfrontPricingTerm] or [FixedUpfrontPricingTerm]. In the case of pure contract pricing, this will be the total value of the contract. In the case of contracts with consumption pricing, this will only include the committed value and not include any overages that occur.\n  \n   If the accepted terms contain [PaymentScheduleTerm], it will be the total payment schedule amount. This occurs when flexible payment schedule is used, and is the sum of all invoice charges in the payment schedule.\n   \n    In case a customer has amended an agreement, by purchasing more units of any dimension, this will include both the original cost as well as the added cost incurred due to addition of new units. \n    \n     This is [0] if the accepted terms contain [UsageBasedPricingTerm] without [ConfigurableUpfrontPricingTerm] or [RecurringPaymentTerm]. This occurs for usage-based pricing (such as SaaS metered or AMI/container hourly or monthly), because the exact usage is not known upfront.\n     \n      "];
  currency_code: currency_code option
    [@ocaml.doc "Defines the currency code for the charge.\n"]}[@@ocaml.doc
                                                                 "Estimated cost of the agreement.\n"]
type nonrec describe_agreement_output =
  {
  status: agreement_status option
    [@ocaml.doc
      "The current status of the agreement.\n\n Statuses include:\n \n  {ul\n        {-   [ACTIVE] \226\128\147 The terms of the agreement are active.\n            \n             }\n        {-   [ARCHIVED] \226\128\147 The agreement ended without a specified reason.\n            \n             }\n        {-   [CANCELLED] \226\128\147 The acceptor ended the agreement before the defined end date.\n            \n             }\n        {-   [EXPIRED] \226\128\147 The agreement ended on the defined end date.\n            \n             }\n        {-   [RENEWED] \226\128\147 The agreement was renewed into a new agreement (for example, an auto-renewal).\n            \n             }\n        {-   [REPLACED] \226\128\147 The agreement was replaced using an agreement replacement offer.\n            \n             }\n        {-   [ROLLED_BACK] (Only applicable to inactive agreement revisions) \226\128\147 The agreement revision has been rolled back because of an error. An earlier revision is now active.\n            \n             }\n        {-   [SUPERCEDED] (Only applicable to inactive agreement revisions) \226\128\147 The agreement revision is no longer active and another agreement revision is now active.\n            \n             }\n        {-   [TERMINATED] \226\128\147 The agreement ended before the defined end date because of an AWS termination (for example, a payment failure).\n            \n             }\n        }\n  "];
  proposal_summary: proposal_summary option
    [@ocaml.doc "A summary of the proposal received from the proposer.\n"];
  estimated_charges: estimated_charges option
    [@ocaml.doc "The estimated cost of the agreement.\n"];
  agreement_type: agreement_type option
    [@ocaml.doc
      "The type of agreement. Values are [PurchaseAgreement] or [VendorInsightsAgreement].\n"];
  acceptance_time: timestamp option
    [@ocaml.doc
      "The date and time the offer was accepted or the agreement was created.\n\n   [AcceptanceTime] and [StartTime] can differ for future dated agreements (FDAs).\n  \n   "];
  end_time: timestamp option
    [@ocaml.doc
      "The date and time when the agreement ends. The field is [null] for pay-as-you-go agreements, which don\226\128\153t have end dates.\n"];
  start_time: timestamp option
    [@ocaml.doc "The date and time when the agreement starts.\n"];
  proposer: proposer option
    [@ocaml.doc
      "The details of the party proposing the agreement terms. This is commonly the seller for [PurchaseAgreement].\n"];
  acceptor: acceptor option
    [@ocaml.doc
      "The details of the party accepting the agreement terms. This is commonly the buyer for [PurchaseAgreement].\n"];
  agreement_id: resource_id option
    [@ocaml.doc "The unique identifier of the agreement.\n"]}[@@ocaml.doc ""]
type nonrec describe_agreement_input =
  {
  agreement_id: resource_id
    [@ocaml.doc "The unique identifier of the agreement.\n"]}[@@ocaml.doc ""](** {1:builders Builders} *)

val make_validity_term :
  ?agreement_end_date:timestamp ->
    ?agreement_start_date:timestamp ->
      ?agreement_duration:bounded_string ->
        ?type_:unversioned_term_type -> unit -> validity_term
val make_validation_exception_field :
  message:bounded_string ->
    name:bounded_string -> unit -> validation_exception_field
val make_rate_card_item :
  ?price:bounded_string ->
    ?dimension_key:bounded_string -> unit -> rate_card_item
val make_usage_based_rate_card_item :
  ?rate_card:rate_card_list -> unit -> usage_based_rate_card_item
val make_usage_based_pricing_term :
  ?rate_cards:usage_based_rate_card_list ->
    ?currency_code:currency_code ->
      ?type_:unversioned_term_type -> unit -> usage_based_pricing_term
val make_support_term :
  ?refund_policy:bounded_string ->
    ?type_:unversioned_term_type -> unit -> support_term
val make_sort : ?sort_order:sort_order -> ?sort_by:sort_by -> unit -> sort
val make_selector :
  ?value:bounded_string -> ?type_:bounded_string -> unit -> selector
val make_acceptor : ?account_id:aws_account_id -> unit -> acceptor
val make_proposer : ?account_id:aws_account_id -> unit -> proposer
val make_resource :
  ?type_:agreement_resource_type -> ?id:resource_id -> unit -> resource
val make_proposal_summary :
  ?offer_id:offer_id -> ?resources:resources -> unit -> proposal_summary
val make_agreement_view_summary :
  ?status:agreement_status ->
    ?proposal_summary:proposal_summary ->
      ?proposer:proposer ->
        ?acceptor:acceptor ->
          ?agreement_type:agreement_type ->
            ?end_time:timestamp ->
              ?start_time:timestamp ->
                ?acceptance_time:timestamp ->
                  ?agreement_id:resource_id -> unit -> agreement_view_summary
val make_search_agreements_output :
  ?next_token:next_token ->
    ?agreement_view_summaries:agreement_view_summary_list ->
      unit -> search_agreements_output
val make_filter :
  ?values:filter_value_list -> ?name:filter_name -> unit -> filter
val make_search_agreements_input :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?sort:sort ->
        ?filters:filter_list ->
          ?catalog:catalog -> unit -> search_agreements_input
val make_schedule_item :
  ?charge_amount:bounded_string ->
    ?charge_date:timestamp -> unit -> schedule_item
val make_renewal_term_configuration :
  enable_auto_renew:boolean_ -> unit -> renewal_term_configuration
val make_renewal_term :
  ?configuration:renewal_term_configuration ->
    ?type_:unversioned_term_type -> unit -> renewal_term
val make_recurring_payment_term :
  ?price:bounded_string ->
    ?billing_period:bounded_string ->
      ?currency_code:currency_code ->
        ?type_:unversioned_term_type -> unit -> recurring_payment_term
val make_payment_schedule_term :
  ?schedule:schedule_list ->
    ?currency_code:currency_code ->
      ?type_:unversioned_term_type -> unit -> payment_schedule_term
val make_document_item :
  ?version:bounded_string ->
    ?url:bounded_string -> ?type_:bounded_string -> unit -> document_item
val make_legal_term :
  ?documents:document_list ->
    ?type_:unversioned_term_type -> unit -> legal_term
val make_grant_item :
  ?max_quantity:positive_integer_with_default_value_one ->
    ?dimension_key:bounded_string -> unit -> grant_item
val make_constraints :
  ?quantity_configuration:bounded_string ->
    ?multiple_dimension_selection:bounded_string -> unit -> constraints
val make_configurable_upfront_rate_card_item :
  ?rate_card:rate_card_list ->
    ?constraints:constraints ->
      ?selector:selector -> unit -> configurable_upfront_rate_card_item
val make_dimension :
  dimension_value:zero_value_integer ->
    dimension_key:bounded_string -> unit -> dimension
val make_configurable_upfront_pricing_term_configuration :
  dimensions:dimension_list ->
    selector_value:bounded_string ->
      unit -> configurable_upfront_pricing_term_configuration
val make_configurable_upfront_pricing_term :
  ?configuration:configurable_upfront_pricing_term_configuration ->
    ?rate_cards:configurable_upfront_rate_card_list ->
      ?currency_code:currency_code ->
        ?type_:unversioned_term_type ->
          unit -> configurable_upfront_pricing_term
val make_byol_pricing_term :
  ?type_:unversioned_term_type -> unit -> byol_pricing_term
val make_free_trial_pricing_term :
  ?grants:grant_list ->
    ?duration:bounded_string ->
      ?type_:unversioned_term_type -> unit -> free_trial_pricing_term
val make_fixed_upfront_pricing_term :
  ?grants:grant_list ->
    ?price:bounded_string ->
      ?duration:bounded_string ->
        ?currency_code:currency_code ->
          ?type_:unversioned_term_type -> unit -> fixed_upfront_pricing_term
val make_get_agreement_terms_output :
  ?next_token:next_token ->
    ?accepted_terms:accepted_term_list -> unit -> get_agreement_terms_output
val make_get_agreement_terms_input :
  ?next_token:next_token ->
    ?max_results:max_results ->
      agreement_id:resource_id -> unit -> get_agreement_terms_input
val make_estimated_charges :
  ?agreement_value:bounded_string ->
    ?currency_code:currency_code -> unit -> estimated_charges
val make_describe_agreement_output :
  ?status:agreement_status ->
    ?proposal_summary:proposal_summary ->
      ?estimated_charges:estimated_charges ->
        ?agreement_type:agreement_type ->
          ?acceptance_time:timestamp ->
            ?end_time:timestamp ->
              ?start_time:timestamp ->
                ?proposer:proposer ->
                  ?acceptor:acceptor ->
                    ?agreement_id:resource_id ->
                      unit -> describe_agreement_output
val make_describe_agreement_input :
  agreement_id:resource_id -> unit -> describe_agreement_input(** {1:operations Operations} *)

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