open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec validity_term =
  {
  agreement_end_date: CoreTypes.Timestamp.t option ;
  agreement_start_date: CoreTypes.Timestamp.t option ;
  agreement_duration: string option ;
  type_: string option }
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
  | INVALID_AGREEMENT_ID 
type nonrec validation_exception_field = {
  message: string ;
  name: string }
type nonrec validation_exception =
  {
  fields: validation_exception_field list option ;
  reason: validation_exception_reason option ;
  message: string option ;
  request_id: string option }
type nonrec rate_card_item =
  {
  price: string option ;
  dimension_key: string option }
type nonrec usage_based_rate_card_item =
  {
  rate_card: rate_card_item list option }
type nonrec usage_based_pricing_term =
  {
  rate_cards: usage_based_rate_card_item list option ;
  currency_code: string option ;
  type_: string option }
type nonrec throttling_exception =
  {
  message: string option ;
  request_id: string option }
type nonrec support_term =
  {
  refund_policy: string option ;
  type_: string option }
type nonrec sort_order =
  | DESCENDING 
  | ASCENDING 
type nonrec sort = {
  sort_order: sort_order option ;
  sort_by: string option }
type nonrec selector = {
  value: string option ;
  type_: string option }
type nonrec acceptor = {
  account_id: string option }
type nonrec proposer = {
  account_id: string option }
type nonrec resource = {
  type_: string option ;
  id: string option }
type nonrec proposal_summary =
  {
  offer_id: string option ;
  resources: resource list option }
type nonrec agreement_status =
  | TERMINATED 
  | SUPERSEDED 
  | ROLLED_BACK 
  | REPLACED 
  | RENEWED 
  | EXPIRED 
  | CANCELLED 
  | ARCHIVED 
  | ACTIVE 
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
  agreement_id: string option }
type nonrec search_agreements_output =
  {
  next_token: string option ;
  agreement_view_summaries: agreement_view_summary list option }
type nonrec filter = {
  values: string list option ;
  name: string option }
type nonrec search_agreements_input =
  {
  next_token: string option ;
  max_results: int option ;
  sort: sort option ;
  filters: filter list option ;
  catalog: string option }
type nonrec internal_server_exception =
  {
  message: string option ;
  request_id: string option }
type nonrec access_denied_exception =
  {
  message: string option ;
  request_id: string option }
type nonrec schedule_item =
  {
  charge_amount: string option ;
  charge_date: CoreTypes.Timestamp.t option }
type nonrec resource_type =
  | AGREEMENT 
type nonrec resource_not_found_exception =
  {
  resource_type: resource_type option ;
  resource_id: string option ;
  message: string option ;
  request_id: string option }
type nonrec renewal_term_configuration = {
  enable_auto_renew: bool }
type nonrec renewal_term =
  {
  configuration: renewal_term_configuration option ;
  type_: string option }
type nonrec recurring_payment_term =
  {
  price: string option ;
  billing_period: string option ;
  currency_code: string option ;
  type_: string option }
type nonrec payment_schedule_term =
  {
  schedule: schedule_item list option ;
  currency_code: string option ;
  type_: string option }
type nonrec document_item =
  {
  version: string option ;
  url: string option ;
  type_: string option }
type nonrec legal_term =
  {
  documents: document_item list option ;
  type_: string option }
type nonrec grant_item =
  {
  max_quantity: int option ;
  dimension_key: string option }
type nonrec constraints =
  {
  quantity_configuration: string option ;
  multiple_dimension_selection: string option }
type nonrec configurable_upfront_rate_card_item =
  {
  rate_card: rate_card_item list option ;
  constraints: constraints option ;
  selector: selector option }
type nonrec dimension = {
  dimension_value: int ;
  dimension_key: string }
type nonrec configurable_upfront_pricing_term_configuration =
  {
  dimensions: dimension list ;
  selector_value: string }
type nonrec configurable_upfront_pricing_term =
  {
  configuration: configurable_upfront_pricing_term_configuration option ;
  rate_cards: configurable_upfront_rate_card_item list option ;
  currency_code: string option ;
  type_: string option }
type nonrec byol_pricing_term = {
  type_: string option }
type nonrec free_trial_pricing_term =
  {
  grants: grant_item list option ;
  duration: string option ;
  type_: string option }
type nonrec fixed_upfront_pricing_term =
  {
  grants: grant_item list option ;
  price: string option ;
  duration: string option ;
  currency_code: string option ;
  type_: string option }
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
  | LegalTerm of legal_term 
type nonrec get_agreement_terms_output =
  {
  next_token: string option ;
  accepted_terms: accepted_term list option }
type nonrec get_agreement_terms_input =
  {
  next_token: string option ;
  max_results: int option ;
  agreement_id: string }
type nonrec estimated_charges =
  {
  agreement_value: string option ;
  currency_code: string option }
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
  agreement_id: string option }
type nonrec describe_agreement_input = {
  agreement_id: string }