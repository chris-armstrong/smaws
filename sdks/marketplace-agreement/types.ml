open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "<blank>";
      endpointPrefix = "agreement-marketplace";
      version = "2020-03-01";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec validity_term =
  {
  agreement_end_date: CoreTypes.Timestamp.t option ;
  agreement_start_date: CoreTypes.Timestamp.t option ;
  agreement_duration: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines the conditions that will keep an agreement created from this offer valid. \n"]
type nonrec validation_exception_reason =
  | OTHER 
  | UNSUPPORTED_FILTERS 
  | INVALID_MAX_RESULTS 
  | INVALID_NEXT_TOKEN 
  | INVALID_SORT_ORDER 
  | INVALID_SORT_BY 
  | INVALID_FILTER_VALUES 
  | INVALID_FILTER_NAME 
  | INVALID_CATALOG 
  | MISSING_AGREEMENT_ID 
  | INVALID_AGREEMENT_ID [@@ocaml.doc ""]
type nonrec validation_exception_field = {
  message: string ;
  name: string }[@@ocaml.doc
                  "The input fails to satisfy the constraints specified by the service.\n"]
type nonrec validation_exception =
  {
  fields: validation_exception_field list option ;
  reason: validation_exception_reason option ;
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "The input fails to satisfy the constraints specified by the service.\n"]
type nonrec rate_card_item =
  {
  price: string option ;
  dimension_key: string option }[@@ocaml.doc
                                  "Defines the per unit rates for each individual product dimension.\n"]
type nonrec usage_based_rate_card_item =
  {
  rate_card: rate_card_item list option }[@@ocaml.doc
                                           "Within the pay-as-you-go model defined under [UsageBasedPricingTerm], the [UsageBasedRateCardItem] defines an individual rate for a product dimension.\n"]
type nonrec usage_based_pricing_term =
  {
  rate_cards: usage_based_rate_card_item list option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a usage-based pricing model (typically, pay-as-you-go pricing), where the customers are charged based on product usage.\n"]
type nonrec throttling_exception =
  {
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "Request was denied due to request throttling.\n"]
type nonrec support_term =
  {
  refund_policy: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines the customer support available for the acceptors when they purchase the software.\n"]
type nonrec sort_order =
  | DESCENDING 
  | ASCENDING [@@ocaml.doc ""]
type nonrec sort = {
  sort_order: sort_order option ;
  sort_by: string option }[@@ocaml.doc
                            "An object that contains the [SortBy] and [SortOrder] attributes.\n"]
type nonrec selector = {
  value: string option ;
  type_: string option }[@@ocaml.doc
                          "Differentiates between the mutually exclusive rate cards in the same pricing term to be selected by the buyer.\n"]
type nonrec acceptor = {
  account_id: string option }[@@ocaml.doc
                               "The details of the party accepting the agreement terms. This is commonly the buyer for [PurchaseAgreement].\n"]
type nonrec proposer = {
  account_id: string option }[@@ocaml.doc
                               "Details of the party proposing the agreement terms,. This is commonly the seller for [PurchaseAgreement]. \n"]
type nonrec resource = {
  type_: string option ;
  id: string option }[@@ocaml.doc
                       "The list of resources involved in the agreement.\n"]
type nonrec proposal_summary =
  {
  offer_id: string option ;
  resources: resource list option }[@@ocaml.doc
                                     "A summary of the proposal received from the proposer.\n"]
type nonrec agreement_status =
  | TERMINATED 
  | SUPERSEDED 
  | ROLLED_BACK 
  | REPLACED 
  | RENEWED 
  | EXPIRED 
  | CANCELLED 
  | ARCHIVED 
  | ACTIVE [@@ocaml.doc ""]
type nonrec agreement_view_summary =
  {
  status: agreement_status option ;
  proposal_summary: proposal_summary option ;
  proposer: proposer option ;
  acceptor: acceptor option ;
  agreement_type: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  acceptance_time: CoreTypes.Timestamp.t option ;
  agreement_id: string option }[@@ocaml.doc
                                 "A summary of the agreement, including top-level attributes (for example, the agreement ID, version, proposer, and acceptor).\n"]
type nonrec search_agreements_output =
  {
  next_token: string option ;
  agreement_view_summaries: agreement_view_summary list option }[@@ocaml.doc
                                                                  ""]
type nonrec filter = {
  values: string list option ;
  name: string option }[@@ocaml.doc
                         "The filter name and value pair that is used to return a more specific list of results. Filters can be used to match a set of resources by various criteria, such as [offerId] or [productId].\n"]
type nonrec search_agreements_input =
  {
  next_token: string option ;
  max_results: int option ;
  sort: sort option ;
  filters: filter list option ;
  catalog: string option }[@@ocaml.doc ""]
type nonrec internal_server_exception =
  {
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "Unexpected error during processing of request.\n"]
type nonrec access_denied_exception =
  {
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "User does not have sufficient access to perform this action.\n"]
type nonrec schedule_item =
  {
  charge_amount: string option ;
  charge_date: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                               "An individual installment of the payment that includes the date and amount of the charge.\n"]
type nonrec resource_type =
  | AGREEMENT [@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  resource_type: resource_type option ;
  resource_id: string option ;
  message: string option ;
  request_id: string option }[@@ocaml.doc
                               "Request references a resource which does not exist.\n"]
type nonrec renewal_term_configuration = {
  enable_auto_renew: bool }[@@ocaml.doc
                             "Additional parameters specified by the acceptor while accepting the term.\n"]
type nonrec renewal_term =
  {
  configuration: renewal_term_configuration option ;
  type_: string option }[@@ocaml.doc
                          "Defines that on graceful expiration of the agreement (when the agreement ends on its pre-defined end date), a new agreement will be created using the accepted terms on the existing agreement. In other words, the agreement will be renewed. The presence of [RenewalTerm] in the offer document means that auto-renewal is allowed. Buyers will have the option to accept or decline auto-renewal at the offer acceptance/agreement creation. Buyers can also change this flag from [True] to [False] or [False] to [True] at anytime during the agreement's lifecycle.\n"]
type nonrec recurring_payment_term =
  {
  price: string option ;
  billing_period: string option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a pricing model where customers are charged a fixed recurring price at the end of each billing period.\n"]
type nonrec payment_schedule_term =
  {
  schedule: schedule_item list option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines an installment-based pricing model where customers are charged a fixed price on different dates during the agreement validity period. This is used most commonly for flexible payment schedule pricing.\n"]
type nonrec document_item =
  {
  version: string option ;
  url: string option ;
  type_: string option }[@@ocaml.doc
                          "Includes the list of references to legal resources proposed by the proposer to the acceptor. Each [DocumentItem] refers to an individual reference.\n"]
type nonrec legal_term =
  {
  documents: document_item list option ;
  type_: string option }[@@ocaml.doc
                          "Defines the list of text agreements proposed to the acceptors. An example is the end user license agreement (EULA).\n"]
type nonrec grant_item =
  {
  max_quantity: int option ;
  dimension_key: string option }[@@ocaml.doc
                                  "Entitlements granted to the acceptor of fixed upfront as part of agreement execution.\n"]
type nonrec constraints =
  {
  quantity_configuration: string option ;
  multiple_dimension_selection: string option }[@@ocaml.doc
                                                 "Defines limits on how the term can be configured by acceptors. \n"]
type nonrec configurable_upfront_rate_card_item =
  {
  rate_card: rate_card_item list option ;
  constraints: constraints option ;
  selector: selector option }[@@ocaml.doc
                               "Within the prepaid payment model defined under [ConfigurableUpfrontPricingTerm], the [RateCardItem] defines all the various rate cards (including pricing and dimensions) that have been proposed.\n"]
type nonrec dimension = {
  dimension_value: int ;
  dimension_key: string }[@@ocaml.doc
                           "Defines the dimensions that the acceptor has purchased from the overall set of dimensions presented in the rate card.\n"]
type nonrec configurable_upfront_pricing_term_configuration =
  {
  dimensions: dimension list ;
  selector_value: string }[@@ocaml.doc
                            "Defines a prepaid payment model that allows buyers to configure the entitlements they want to purchase and the duration.\n"]
type nonrec configurable_upfront_pricing_term =
  {
  configuration: configurable_upfront_pricing_term_configuration option ;
  rate_cards: configurable_upfront_rate_card_item list option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a prepaid payment model that allows buyers to configure the entitlements they want to purchase and the duration.\n"]
type nonrec byol_pricing_term = {
  type_: string option }[@@ocaml.doc
                          "Enables you and your customers to move your existing agreements to AWS Marketplace. The customer won't be charged for product usage in AWS Marketplace because they already paid for the product outside of AWS Marketplace.\n"]
type nonrec free_trial_pricing_term =
  {
  grants: grant_item list option ;
  duration: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a short-term free pricing model where the buyers aren\226\128\153t charged anything within a specified limit.\n"]
type nonrec fixed_upfront_pricing_term =
  {
  grants: grant_item list option ;
  price: string option ;
  duration: string option ;
  currency_code: string option ;
  type_: string option }[@@ocaml.doc
                          "Defines a prepaid pricing model where the customers are charged a fixed upfront amount.\n"]
type nonrec accepted_term =
  | FixedUpfrontPricingTerm of fixed_upfront_pricing_term 
  | FreeTrialPricingTerm of free_trial_pricing_term 
  | PaymentScheduleTerm of payment_schedule_term 
  | ValidityTerm of validity_term 
  | RecurringPaymentTerm of recurring_payment_term 
  | ByolPricingTerm of byol_pricing_term 
  | ConfigurableUpfrontPricingTerm of configurable_upfront_pricing_term 
  | UsageBasedPricingTerm of usage_based_pricing_term 
  | RenewalTerm of renewal_term 
  | SupportTerm of support_term 
  | LegalTerm of legal_term [@@ocaml.doc
                              "A subset of terms proposed by the proposer, which have been accepted by the acceptor as part of agreement creation.\n"]
type nonrec get_agreement_terms_output =
  {
  next_token: string option ;
  accepted_terms: accepted_term list option }[@@ocaml.doc ""]
type nonrec get_agreement_terms_input =
  {
  next_token: string option ;
  max_results: int option ;
  agreement_id: string }[@@ocaml.doc ""]
type nonrec estimated_charges =
  {
  agreement_value: string option ;
  currency_code: string option }[@@ocaml.doc
                                  "Estimated cost of the agreement.\n"]
type nonrec describe_agreement_output =
  {
  status: agreement_status option ;
  proposal_summary: proposal_summary option ;
  estimated_charges: estimated_charges option ;
  agreement_type: string option ;
  acceptance_time: CoreTypes.Timestamp.t option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  proposer: proposer option ;
  acceptor: acceptor option ;
  agreement_id: string option }[@@ocaml.doc ""]
type nonrec describe_agreement_input = {
  agreement_id: string }[@@ocaml.doc ""]