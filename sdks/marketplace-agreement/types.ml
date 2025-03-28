open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "<blank>";
      endpointPrefix = "agreement-marketplace";
      version = "2020-03-01";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec zero_value_integer = unit
type nonrec unversioned_term_type = unit
type nonrec bounded_string = unit
type nonrec timestamp_ = unit
type nonrec validity_term =
  {
  agreement_end_date: Timestamp.t option ;
  agreement_start_date: Timestamp.t option ;
  agreement_duration: string option ;
  type_: string option }
type nonrec base_unit = unit
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
type nonrec validation_exception_field_list = unit
type nonrec request_id = unit
type nonrec exception_message = unit
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
type nonrec rate_card_list = unit
type nonrec usage_based_rate_card_item =
  {
  rate_card: rate_card_item list option }
type nonrec usage_based_rate_card_list = unit
type nonrec currency_code = unit
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
type nonrec sort_by = unit
type nonrec sort = {
  sort_order: sort_order option ;
  sort_by: string option }
type nonrec selector = {
  value: string option ;
  type_: string option }
type nonrec resource_id = unit
type nonrec agreement_type = unit
type nonrec aws_account_id = unit
type nonrec acceptor = {
  account_id: string option }
type nonrec proposer = {
  account_id: string option }
type nonrec agreement_resource_type = unit
type nonrec resource = {
  type_: string option ;
  id: string option }
type nonrec resources = unit
type nonrec offer_id = unit
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
  end_time: Timestamp.t option ;
  start_time: Timestamp.t option ;
  acceptance_time: Timestamp.t option ;
  agreement_id: string option }
type nonrec agreement_view_summary_list = unit
type nonrec next_token = unit
type nonrec search_agreements_output =
  {
  next_token: string option ;
  agreement_view_summaries: agreement_view_summary list option }
type nonrec catalog = unit
type nonrec filter_name = unit
type nonrec filter_value = unit
type nonrec filter_value_list = unit
type nonrec filter = {
  values: string list option ;
  name: string option }
type nonrec filter_list = unit
type nonrec max_results = unit
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
  charge_date: Timestamp.t option }
type nonrec schedule_list = unit
type nonrec resource_type =
  | AGREEMENT 
type nonrec resource_not_found_exception =
  {
  resource_type: resource_type option ;
  resource_id: string option ;
  message: string option ;
  request_id: string option }
type nonrec boolean_ = unit
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
type nonrec positive_integer_with_default_value_one = unit
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
type nonrec document_list = unit
type nonrec legal_term =
  {
  documents: document_item list option ;
  type_: string option }
type nonrec grant_item =
  {
  max_quantity: int option ;
  dimension_key: string option }
type nonrec grant_list = unit
type nonrec constraints =
  {
  quantity_configuration: string option ;
  multiple_dimension_selection: string option }
type nonrec configurable_upfront_rate_card_item =
  {
  rate_card: rate_card_item list option ;
  constraints: constraints option ;
  selector: selector option }
type nonrec configurable_upfront_rate_card_list = unit
type nonrec dimension = {
  dimension_value: int ;
  dimension_key: string }
type nonrec dimension_list = unit
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
type nonrec accepted_term = unit
type nonrec accepted_term_list = unit
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
  acceptance_time: Timestamp.t option ;
  end_time: Timestamp.t option ;
  start_time: Timestamp.t option ;
  proposer: proposer option ;
  acceptor: acceptor option ;
  agreement_id: string option }
type nonrec describe_agreement_input = {
  agreement_id: string }
type nonrec awsmp_commerce_service_v20200301 = unit
type nonrec base_string = unit
type nonrec base_boolean = unit
type nonrec base_integer = unit
type nonrec base_timestamp = unit
type nonrec base_long = unit
type nonrec base_document = unit