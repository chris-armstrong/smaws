open Smaws_Lib.Json.DeserializeHelpers
open Types
let zero_value_integer_of_yojson = int_of_yojson
let unversioned_term_type_of_yojson = string_of_yojson
let bounded_string_of_yojson = string_of_yojson
let timestamp__of_yojson = timestamp_epoch_seconds_of_yojson
let validity_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_end_date =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "agreementEndDate") _list path);
     agreement_start_date =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "agreementStartDate") _list
          path);
     agreement_duration =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson "agreementDuration") _list
          path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : validity_term)
let base_unit_of_yojson = unit_of_yojson
let validation_exception_reason_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "OTHER" -> OTHER
    | `String "UNSUPPORTED_FILTERS" -> UNSUPPORTED_FILTERS
    | `String "INVALID_MAX_RESULTS" -> INVALID_MAX_RESULTS
    | `String "INVALID_NEXT_TOKEN" -> INVALID_NEXT_TOKEN
    | `String "INVALID_SORT_ORDER" -> INVALID_SORT_ORDER
    | `String "INVALID_SORT_BY" -> INVALID_SORT_BY
    | `String "INVALID_FILTER_VALUES" -> INVALID_FILTER_VALUES
    | `String "INVALID_FILTER_NAME" -> INVALID_FILTER_NAME
    | `String "INVALID_CATALOG" -> INVALID_CATALOG
    | `String "MISSING_AGREEMENT_ID" -> MISSING_AGREEMENT_ID
    | `String "INVALID_AGREEMENT_ID" -> INVALID_AGREEMENT_ID
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "ValidationExceptionReason" value)
    | _ ->
        raise (deserialize_wrong_type_error path "ValidationExceptionReason") : 
     validation_exception_reason) : validation_exception_reason)
let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = (value_for_key bounded_string_of_yojson "message" _list path);
     name = (value_for_key bounded_string_of_yojson "name" _list path)
   } : validation_exception_field)
let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path
let request_id_of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson
let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields =
       (option_of_yojson
          (value_for_key validation_exception_field_list_of_yojson "fields")
          _list path);
     reason =
       (option_of_yojson
          (value_for_key validation_exception_reason_of_yojson "reason")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path);
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "requestId")
          _list path)
   } : validation_exception)
let rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price =
       (option_of_yojson (value_for_key bounded_string_of_yojson "price")
          _list path);
     dimension_key =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson "dimensionKey") _list path)
   } : rate_card_item)
let rate_card_list_of_yojson tree path =
  list_of_yojson rate_card_item_of_yojson tree path
let usage_based_rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rate_card =
       (option_of_yojson (value_for_key rate_card_list_of_yojson "rateCard")
          _list path)
   } : usage_based_rate_card_item)
let usage_based_rate_card_list_of_yojson tree path =
  list_of_yojson usage_based_rate_card_item_of_yojson tree path
let currency_code_of_yojson = string_of_yojson
let usage_based_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rate_cards =
       (option_of_yojson
          (value_for_key usage_based_rate_card_list_of_yojson "rateCards")
          _list path);
     currency_code =
       (option_of_yojson
          (value_for_key currency_code_of_yojson "currencyCode") _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : usage_based_pricing_term)
let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path);
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "requestId")
          _list path)
   } : throttling_exception)
let support_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     refund_policy =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson "refundPolicy") _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : support_term)
let sort_order_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DESCENDING" -> DESCENDING
    | `String "ASCENDING" -> ASCENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder") : sort_order) : 
  sort_order)
let sort_by_of_yojson = string_of_yojson
let sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order =
       (option_of_yojson (value_for_key sort_order_of_yojson "sortOrder")
          _list path);
     sort_by =
       (option_of_yojson (value_for_key sort_by_of_yojson "sortBy") _list
          path)
   } : sort)
let selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (option_of_yojson (value_for_key bounded_string_of_yojson "value")
          _list path);
     type_ =
       (option_of_yojson (value_for_key bounded_string_of_yojson "type")
          _list path)
   } : selector)
let resource_id_of_yojson = string_of_yojson
let agreement_type_of_yojson = string_of_yojson
let aws_account_id_of_yojson = string_of_yojson
let acceptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id =
       (option_of_yojson (value_for_key aws_account_id_of_yojson "accountId")
          _list path)
   } : acceptor)
let proposer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id =
       (option_of_yojson (value_for_key aws_account_id_of_yojson "accountId")
          _list path)
   } : proposer)
let agreement_resource_type_of_yojson = string_of_yojson
let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       (option_of_yojson
          (value_for_key agreement_resource_type_of_yojson "type") _list path);
     id =
       (option_of_yojson (value_for_key resource_id_of_yojson "id") _list
          path)
   } : resource)
let resources_of_yojson tree path =
  list_of_yojson resource_of_yojson tree path
let offer_id_of_yojson = string_of_yojson
let proposal_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offer_id =
       (option_of_yojson (value_for_key offer_id_of_yojson "offerId") _list
          path);
     resources =
       (option_of_yojson (value_for_key resources_of_yojson "resources")
          _list path)
   } : proposal_summary)
let agreement_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TERMINATED" -> TERMINATED
    | `String "SUPERSEDED" -> SUPERSEDED
    | `String "ROLLED_BACK" -> ROLLED_BACK
    | `String "REPLACED" -> REPLACED
    | `String "RENEWED" -> RENEWED
    | `String "EXPIRED" -> EXPIRED
    | `String "CANCELLED" -> CANCELLED
    | `String "ARCHIVED" -> ARCHIVED
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AgreementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementStatus") : 
     agreement_status) : agreement_status)
let agreement_view_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (option_of_yojson (value_for_key agreement_status_of_yojson "status")
          _list path);
     proposal_summary =
       (option_of_yojson
          (value_for_key proposal_summary_of_yojson "proposalSummary") _list
          path);
     proposer =
       (option_of_yojson (value_for_key proposer_of_yojson "proposer") _list
          path);
     acceptor =
       (option_of_yojson (value_for_key acceptor_of_yojson "acceptor") _list
          path);
     agreement_type =
       (option_of_yojson
          (value_for_key agreement_type_of_yojson "agreementType") _list path);
     end_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "endTime") _list
          path);
     start_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "startTime")
          _list path);
     acceptance_time =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "acceptanceTime") _list path);
     agreement_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "agreementId")
          _list path)
   } : agreement_view_summary)
let agreement_view_summary_list_of_yojson tree path =
  list_of_yojson agreement_view_summary_of_yojson tree path
let next_token_of_yojson = string_of_yojson
let search_agreements_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     agreement_view_summaries =
       (option_of_yojson
          (value_for_key agreement_view_summary_list_of_yojson
             "agreementViewSummaries") _list path)
   } : search_agreements_output)
let catalog_of_yojson = string_of_yojson
let filter_name_of_yojson = string_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_value_list_of_yojson tree path =
  list_of_yojson filter_value_of_yojson tree path
let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values =
       (option_of_yojson (value_for_key filter_value_list_of_yojson "values")
          _list path);
     name =
       (option_of_yojson (value_for_key filter_name_of_yojson "name") _list
          path)
   } : filter)
let filter_list_of_yojson tree path =
  list_of_yojson filter_of_yojson tree path
let max_results_of_yojson = int_of_yojson
let search_agreements_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "maxResults")
          _list path);
     sort =
       (option_of_yojson (value_for_key sort_of_yojson "sort") _list path);
     filters =
       (option_of_yojson (value_for_key filter_list_of_yojson "filters")
          _list path);
     catalog =
       (option_of_yojson (value_for_key catalog_of_yojson "catalog") _list
          path)
   } : search_agreements_input)
let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path);
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "requestId")
          _list path)
   } : internal_server_exception)
let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path);
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "requestId")
          _list path)
   } : access_denied_exception)
let schedule_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     charge_amount =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson "chargeAmount") _list path);
     charge_date =
       (option_of_yojson (value_for_key timestamp__of_yojson "chargeDate")
          _list path)
   } : schedule_item)
let schedule_list_of_yojson tree path =
  list_of_yojson schedule_item_of_yojson tree path
let resource_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "Agreement" -> AGREEMENT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType") : 
     resource_type) : resource_type)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       (option_of_yojson
          (value_for_key resource_type_of_yojson "resourceType") _list path);
     resource_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "resourceId")
          _list path);
     message =
       (option_of_yojson
          (value_for_key exception_message_of_yojson "message") _list path);
     request_id =
       (option_of_yojson (value_for_key request_id_of_yojson "requestId")
          _list path)
   } : resource_not_found_exception)
let boolean__of_yojson = bool_of_yojson
let renewal_term_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_auto_renew =
       (value_for_key boolean__of_yojson "enableAutoRenew" _list path)
   } : renewal_term_configuration)
let renewal_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       (option_of_yojson
          (value_for_key renewal_term_configuration_of_yojson "configuration")
          _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : renewal_term)
let recurring_payment_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price =
       (option_of_yojson (value_for_key bounded_string_of_yojson "price")
          _list path);
     billing_period =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson "billingPeriod") _list path);
     currency_code =
       (option_of_yojson
          (value_for_key currency_code_of_yojson "currencyCode") _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : recurring_payment_term)
let positive_integer_with_default_value_one_of_yojson = int_of_yojson
let payment_schedule_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schedule =
       (option_of_yojson (value_for_key schedule_list_of_yojson "schedule")
          _list path);
     currency_code =
       (option_of_yojson
          (value_for_key currency_code_of_yojson "currencyCode") _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : payment_schedule_term)
let document_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version =
       (option_of_yojson (value_for_key bounded_string_of_yojson "version")
          _list path);
     url =
       (option_of_yojson (value_for_key bounded_string_of_yojson "url") _list
          path);
     type_ =
       (option_of_yojson (value_for_key bounded_string_of_yojson "type")
          _list path)
   } : document_item)
let document_list_of_yojson tree path =
  list_of_yojson document_item_of_yojson tree path
let legal_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     documents =
       (option_of_yojson (value_for_key document_list_of_yojson "documents")
          _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : legal_term)
let grant_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_quantity =
       (option_of_yojson
          (value_for_key positive_integer_with_default_value_one_of_yojson
             "maxQuantity") _list path);
     dimension_key =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson "dimensionKey") _list path)
   } : grant_item)
let grant_list_of_yojson tree path =
  list_of_yojson grant_item_of_yojson tree path
let constraints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quantity_configuration =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson "quantityConfiguration")
          _list path);
     multiple_dimension_selection =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson
             "multipleDimensionSelection") _list path)
   } : constraints)
let configurable_upfront_rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rate_card =
       (option_of_yojson (value_for_key rate_card_list_of_yojson "rateCard")
          _list path);
     constraints =
       (option_of_yojson (value_for_key constraints_of_yojson "constraints")
          _list path);
     selector =
       (option_of_yojson (value_for_key selector_of_yojson "selector") _list
          path)
   } : configurable_upfront_rate_card_item)
let configurable_upfront_rate_card_list_of_yojson tree path =
  list_of_yojson configurable_upfront_rate_card_item_of_yojson tree path
let dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_value =
       (value_for_key zero_value_integer_of_yojson "dimensionValue" _list
          path);
     dimension_key =
       (value_for_key bounded_string_of_yojson "dimensionKey" _list path)
   } : dimension)
let dimension_list_of_yojson tree path =
  list_of_yojson dimension_of_yojson tree path
let configurable_upfront_pricing_term_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimensions =
       (value_for_key dimension_list_of_yojson "dimensions" _list path);
     selector_value =
       (value_for_key bounded_string_of_yojson "selectorValue" _list path)
   } : configurable_upfront_pricing_term_configuration)
let configurable_upfront_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       (option_of_yojson
          (value_for_key
             configurable_upfront_pricing_term_configuration_of_yojson
             "configuration") _list path);
     rate_cards =
       (option_of_yojson
          (value_for_key configurable_upfront_rate_card_list_of_yojson
             "rateCards") _list path);
     currency_code =
       (option_of_yojson
          (value_for_key currency_code_of_yojson "currencyCode") _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : configurable_upfront_pricing_term)
let byol_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : byol_pricing_term)
let free_trial_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grants =
       (option_of_yojson (value_for_key grant_list_of_yojson "grants") _list
          path);
     duration =
       (option_of_yojson (value_for_key bounded_string_of_yojson "duration")
          _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : free_trial_pricing_term)
let fixed_upfront_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grants =
       (option_of_yojson (value_for_key grant_list_of_yojson "grants") _list
          path);
     price =
       (option_of_yojson (value_for_key bounded_string_of_yojson "price")
          _list path);
     duration =
       (option_of_yojson (value_for_key bounded_string_of_yojson "duration")
          _list path);
     currency_code =
       (option_of_yojson
          (value_for_key currency_code_of_yojson "currencyCode") _list path);
     type_ =
       (option_of_yojson
          (value_for_key unversioned_term_type_of_yojson "type") _list path)
   } : fixed_upfront_pricing_term)
let accepted_term_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "fixedUpfrontPricingTerm" ->
       FixedUpfrontPricingTerm
         (fixed_upfront_pricing_term_of_yojson value_ path)
   | "freeTrialPricingTerm" ->
       FreeTrialPricingTerm (free_trial_pricing_term_of_yojson value_ path)
   | "paymentScheduleTerm" ->
       PaymentScheduleTerm (payment_schedule_term_of_yojson value_ path)
   | "validityTerm" -> ValidityTerm (validity_term_of_yojson value_ path)
   | "recurringPaymentTerm" ->
       RecurringPaymentTerm (recurring_payment_term_of_yojson value_ path)
   | "byolPricingTerm" ->
       ByolPricingTerm (byol_pricing_term_of_yojson value_ path)
   | "configurableUpfrontPricingTerm" ->
       ConfigurableUpfrontPricingTerm
         (configurable_upfront_pricing_term_of_yojson value_ path)
   | "usageBasedPricingTerm" ->
       UsageBasedPricingTerm (usage_based_pricing_term_of_yojson value_ path)
   | "renewalTerm" -> RenewalTerm (renewal_term_of_yojson value_ path)
   | "supportTerm" -> SupportTerm (support_term_of_yojson value_ path)
   | "legalTerm" -> LegalTerm (legal_term_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "AcceptedTerm" unknown) : 
    accepted_term)
let accepted_term_list_of_yojson tree path =
  list_of_yojson accepted_term_of_yojson tree path
let get_agreement_terms_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     accepted_terms =
       (option_of_yojson
          (value_for_key accepted_term_list_of_yojson "acceptedTerms") _list
          path)
   } : get_agreement_terms_output)
let get_agreement_terms_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "nextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "maxResults")
          _list path);
     agreement_id =
       (value_for_key resource_id_of_yojson "agreementId" _list path)
   } : get_agreement_terms_input)
let estimated_charges_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_value =
       (option_of_yojson
          (value_for_key bounded_string_of_yojson "agreementValue") _list
          path);
     currency_code =
       (option_of_yojson
          (value_for_key currency_code_of_yojson "currencyCode") _list path)
   } : estimated_charges)
let describe_agreement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (option_of_yojson (value_for_key agreement_status_of_yojson "status")
          _list path);
     proposal_summary =
       (option_of_yojson
          (value_for_key proposal_summary_of_yojson "proposalSummary") _list
          path);
     estimated_charges =
       (option_of_yojson
          (value_for_key estimated_charges_of_yojson "estimatedCharges")
          _list path);
     agreement_type =
       (option_of_yojson
          (value_for_key agreement_type_of_yojson "agreementType") _list path);
     acceptance_time =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "acceptanceTime") _list path);
     end_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "endTime") _list
          path);
     start_time =
       (option_of_yojson (value_for_key timestamp__of_yojson "startTime")
          _list path);
     proposer =
       (option_of_yojson (value_for_key proposer_of_yojson "proposer") _list
          path);
     acceptor =
       (option_of_yojson (value_for_key acceptor_of_yojson "acceptor") _list
          path);
     agreement_id =
       (option_of_yojson (value_for_key resource_id_of_yojson "agreementId")
          _list path)
   } : describe_agreement_output)
let describe_agreement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id =
       (value_for_key resource_id_of_yojson "agreementId" _list path)
   } : describe_agreement_input)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson