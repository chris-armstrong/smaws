open Smaws_Lib.Json.DeserializeHelpers
open Types

let zero_value_integer_of_yojson = int_of_yojson

let payment_request_approval_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "WAIT_FOR_APPROVAL" -> WAIT_FOR_APPROVAL
    | `String "AUTO_APPROVE_ON_EXPIRATION" -> AUTO_APPROVE_ON_EXPIRATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PaymentRequestApprovalStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "PaymentRequestApprovalStrategy")
     : payment_request_approval_strategy)
    : payment_request_approval_strategy)

let iso8601_duration_of_yojson = string_of_yojson

let variable_payment_term_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiration_duration =
       option_of_yojson (value_for_key iso8601_duration_of_yojson "expirationDuration") _list path;
     payment_request_approval_strategy =
       value_for_key payment_request_approval_strategy_of_yojson "paymentRequestApprovalStrategy"
         _list path;
   }
    : variable_payment_term_configuration)

let unversioned_term_type_of_yojson = string_of_yojson
let term_id_of_yojson = string_of_yojson
let currency_code_of_yojson = string_of_yojson
let bounded_string_of_yojson = string_of_yojson

let variable_payment_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key variable_payment_term_configuration_of_yojson "configuration")
         _list path;
     max_total_charge_amount =
       option_of_yojson (value_for_key bounded_string_of_yojson "maxTotalChargeAmount") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : variable_payment_term)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let validity_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_end_date =
       option_of_yojson (value_for_key timestamp_of_yojson "agreementEndDate") _list path;
     agreement_start_date =
       option_of_yojson (value_for_key timestamp_of_yojson "agreementStartDate") _list path;
     agreement_duration =
       option_of_yojson (value_for_key bounded_string_of_yojson "agreementDuration") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : validity_term)

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "MISSING_PURCHASE_ORDER_REFERENCE" -> MISSING_PURCHASE_ORDER_REFERENCE
    | `String "DUPLICATE_AGREEMENT_IN_ORGANIZATION" -> DUPLICATE_AGREEMENT_IN_ORGANIZATION
    | `String "UNSUPPORTED_ACCOUNT_PLAN" -> UNSUPPORTED_ACCOUNT_PLAN
    | `String "DUPLICATE_CHARGES" -> DUPLICATE_CHARGES
    | `String "OTHER" -> OTHER
    | `String "INVALID_PAYMENT_REQUEST_STATUS" -> INVALID_PAYMENT_REQUEST_STATUS
    | `String "INVALID_REJECTION_REASON" -> INVALID_REJECTION_REASON
    | `String "UNSUPPORTED_ACTION" -> UNSUPPORTED_ACTION
    | `String "MISSING_ACCOUNT_ADDRESS" -> MISSING_ACCOUNT_ADDRESS
    | `String "INVALID_INCREMENTAL_CHARGE" -> INVALID_INCREMENTAL_CHARGE
    | `String "MISSING_USAGE_AGREEMENT" -> MISSING_USAGE_AGREEMENT
    | `String "INCOMPATIBLE_TERMS" -> INCOMPATIBLE_TERMS
    | `String "MISSING_MANDATORY_TERMS" -> MISSING_MANDATORY_TERMS
    | `String "EXPIRED_AGREEMENT_PROPOSAL" -> EXPIRED_AGREEMENT_PROPOSAL
    | `String "SUPERSEDED_AGREEMENT_PROPOSAL" -> SUPERSEDED_AGREEMENT_PROPOSAL
    | `String "INACTIVE_AGREEMENT" -> INACTIVE_AGREEMENT
    | `String "INVALID_PURCHASE_ORDER_REFERENCE" -> INVALID_PURCHASE_ORDER_REFERENCE
    | `String "INVALID_AGREEMENT_TYPE" -> INVALID_AGREEMENT_TYPE
    | `String "MISSING_CHARGE_REVISION" -> MISSING_CHARGE_REVISION
    | `String "INVALID_CHARGE_REVISION" -> INVALID_CHARGE_REVISION
    | `String "MISSING_CHARGE_ID" -> MISSING_CHARGE_ID
    | `String "INVALID_CHARGE_ID" -> INVALID_CHARGE_ID
    | `String "MISSING_PURCHASE_ORDERS" -> MISSING_PURCHASE_ORDERS
    | `String "INVALID_PURCHASE_ORDERS" -> INVALID_PURCHASE_ORDERS
    | `String "MISSING_AGREEMENT_REQUEST_ID" -> MISSING_AGREEMENT_REQUEST_ID
    | `String "INVALID_AGREEMENT_REQUEST_ID" -> INVALID_AGREEMENT_REQUEST_ID
    | `String "MISSING_REQUESTED_TERM_CONFIGURATION" -> MISSING_REQUESTED_TERM_CONFIGURATION
    | `String "INVALID_REQUESTED_TERM_CONFIGURATION" -> INVALID_REQUESTED_TERM_CONFIGURATION
    | `String "MISSING_REQUESTED_TERM_ID" -> MISSING_REQUESTED_TERM_ID
    | `String "INVALID_REQUESTED_TERM_ID" -> INVALID_REQUESTED_TERM_ID
    | `String "MISSING_REQUESTED_TERMS" -> MISSING_REQUESTED_TERMS
    | `String "INVALID_REQUESTED_TERMS" -> INVALID_REQUESTED_TERMS
    | `String "MISSING_AGREEMENT_PROPOSAL_IDENTIFIER" -> MISSING_AGREEMENT_PROPOSAL_IDENTIFIER
    | `String "INVALID_AGREEMENT_PROPOSAL_IDENTIFIER" -> INVALID_AGREEMENT_PROPOSAL_IDENTIFIER
    | `String "MISSING_SOURCE_AGREEMENT_IDENTIFIER" -> MISSING_SOURCE_AGREEMENT_IDENTIFIER
    | `String "INVALID_SOURCE_AGREEMENT_IDENTIFIER" -> INVALID_SOURCE_AGREEMENT_IDENTIFIER
    | `String "MISSING_INTENT" -> MISSING_INTENT
    | `String "INVALID_INTENT" -> INVALID_INTENT
    | `String "INVALID_CLIENT_TOKEN" -> INVALID_CLIENT_TOKEN
    | `String "UNSUPPORTED_FILTERS" -> UNSUPPORTED_FILTERS
    | `String "INVALID_PARTY_TYPE" -> INVALID_PARTY_TYPE
    | `String "MISSING_PARTY_TYPE" -> MISSING_PARTY_TYPE
    | `String "INVALID_PAYMENT_REQUEST_ID" -> INVALID_PAYMENT_REQUEST_ID
    | `String "MISSING_PAYMENT_REQUEST_ID" -> MISSING_PAYMENT_REQUEST_ID
    | `String "INVALID_CHARGE_AMOUNT" -> INVALID_CHARGE_AMOUNT
    | `String "MISSING_CHARGE_AMOUNT" -> MISSING_CHARGE_AMOUNT
    | `String "INVALID_DESCRIPTION" -> INVALID_DESCRIPTION
    | `String "INVALID_NAME" -> INVALID_NAME
    | `String "MISSING_NAME" -> MISSING_NAME
    | `String "MISSING_TERM_ID" -> MISSING_TERM_ID
    | `String "INVALID_TERM_ID" -> INVALID_TERM_ID
    | `String "INVALID_MAX_RESULTS" -> INVALID_MAX_RESULTS
    | `String "INVALID_NEXT_TOKEN" -> INVALID_NEXT_TOKEN
    | `String "INVALID_SORT_ORDER" -> INVALID_SORT_ORDER
    | `String "INVALID_SORT_BY" -> INVALID_SORT_BY
    | `String "MISSING_FILTER_VALUES" -> MISSING_FILTER_VALUES
    | `String "INVALID_FILTER_VALUES" -> INVALID_FILTER_VALUES
    | `String "MISSING_FILTER_NAME" -> MISSING_FILTER_NAME
    | `String "INVALID_FILTER_NAME" -> INVALID_FILTER_NAME
    | `String "INVALID_FILTERS" -> INVALID_FILTERS
    | `String "INVALID_CATALOG" -> INVALID_CATALOG
    | `String "MISSING_AGREEMENT_ID" -> MISSING_AGREEMENT_ID
    | `String "INVALID_AGREEMENT_ID" -> INVALID_AGREEMENT_ID
    | `String "INVALID_STATUS" -> INVALID_STATUS
    | `String "INVALID_REASON" -> INVALID_REASON
    | `String "MISSING_REASON" -> MISSING_REASON
    | `String "MISSING_AGREEMENT_CANCELLATION_REQUEST_ID" ->
        MISSING_AGREEMENT_CANCELLATION_REQUEST_ID
    | `String "INVALID_AGREEMENT_CANCELLATION_REQUEST_ID" ->
        INVALID_AGREEMENT_CANCELLATION_REQUEST_ID
    | `String "MULTIPLE_AGREEMENT_IDS" -> MULTIPLE_AGREEMENT_IDS
    | `String "MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY" -> MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY
    | `String "EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT" -> EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT
    | `String "MISSING_CURRENCY_CODE" -> MISSING_CURRENCY_CODE
    | `String "INVALID_CURRENCY_CODE" -> INVALID_CURRENCY_CODE
    | `String "INVALID_INVOICE_ADJUSTMENT_PERIOD" -> INVALID_INVOICE_ADJUSTMENT_PERIOD
    | `String "MISSING_DESCRIPTION" -> MISSING_DESCRIPTION
    | `String "MISSING_REASON_CODE" -> MISSING_REASON_CODE
    | `String "INVALID_REASON_CODE" -> INVALID_REASON_CODE
    | `String "MISSING_ADJUSTMENT_AMOUNT" -> MISSING_ADJUSTMENT_AMOUNT
    | `String "INVALID_ADJUSTMENT_AMOUNT" -> INVALID_ADJUSTMENT_AMOUNT
    | `String "MISSING_INVOICE_ID" -> MISSING_INVOICE_ID
    | `String "BILLING_ADJUSTMENTS_LIMIT_EXCEEDED" -> BILLING_ADJUSTMENTS_LIMIT_EXCEEDED
    | `String "MISSING_BILLING_ADJUSTMENTS" -> MISSING_BILLING_ADJUSTMENTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key bounded_string_of_yojson "message" _list path;
     name = value_for_key bounded_string_of_yojson "name" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let request_id_of_yojson = string_of_yojson
let exception_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fields")
         _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : validation_exception)

let rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price = option_of_yojson (value_for_key bounded_string_of_yojson "price") _list path;
     dimension_key =
       option_of_yojson (value_for_key bounded_string_of_yojson "dimensionKey") _list path;
   }
    : rate_card_item)

let rate_card_list_of_yojson tree path = list_of_yojson rate_card_item_of_yojson tree path

let usage_based_rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rate_card = option_of_yojson (value_for_key rate_card_list_of_yojson "rateCard") _list path }
    : usage_based_rate_card_item)

let usage_based_rate_card_list_of_yojson tree path =
  list_of_yojson usage_based_rate_card_item_of_yojson tree path

let usage_based_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rate_cards =
       option_of_yojson (value_for_key usage_based_rate_card_list_of_yojson "rateCards") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : usage_based_pricing_term)

let update_purchase_orders_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_id_of_yojson = string_of_yojson
let charge_revision_of_yojson = long_of_yojson
let purchase_order_reference_of_yojson = string_of_yojson

let purchase_order_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     purchase_order_reference =
       option_of_yojson
         (value_for_key purchase_order_reference_of_yojson "purchaseOrderReference")
         _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     charge_revision =
       option_of_yojson (value_for_key charge_revision_of_yojson "chargeRevision") _list path;
     charge_id = value_for_key resource_id_of_yojson "chargeId" _list path;
   }
    : purchase_order)

let purchase_orders_of_yojson tree path = list_of_yojson purchase_order_of_yojson tree path

let update_purchase_orders_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ purchase_orders = value_for_key purchase_orders_of_yojson "purchaseOrders" _list path }
    : update_purchase_orders_input)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : throttling_exception)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BillingAdjustmentRequest" -> BILLING_ADJUSTMENT_REQUEST
    | `String "AgreementCancellationRequest" -> AGREEMENT_CANCELLATION_REQUEST
    | `String "Invoice" -> INVOICE
    | `String "PaymentRequest" -> PAYMENT_REQUEST
    | `String "Charge" -> CHARGE
    | `String "AgreementProposal" -> AGREEMENT_PROPOSAL
    | `String "AgreementRequest" -> AGREEMENT_REQUEST
    | `String "Agreement" -> AGREEMENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : conflict_exception)

let access_denied_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_ACCESS" -> INVALID_ACCESS
    | `String "MISSING_MFA" -> MISSING_MFA
    | `String "FAILED_KYC_COMPLIANCE" -> FAILED_KYC_COMPLIANCE
    | `String "DENIED_BY_PRIVATE_MARKETPLACE_POLICY" -> DENIED_BY_PRIVATE_MARKETPLACE_POLICY
    | `String "INVALID_ACCOUNT_STATE" -> INVALID_ACCOUNT_STATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessDeniedExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedExceptionReason")
     : access_denied_exception_reason)
    : access_denied_exception_reason)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       option_of_yojson (value_for_key access_denied_exception_reason_of_yojson "reason") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : access_denied_exception)

let timing_of_yojson (tree : t) path =
  ((match tree with
    | `String "BILLING_PERIOD" -> BILLING_PERIOD
    | `String "SCHEDULED" -> SCHEDULED
    | `String "ON_ACCEPTANCE" -> ON_ACCEPTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Timing" value)
    | _ -> raise (deserialize_wrong_type_error path "Timing")
     : timing)
    : timing)

let tax_estimation_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaxEstimation" value)
    | _ -> raise (deserialize_wrong_type_error path "TaxEstimation")
     : tax_estimation)
    : tax_estimation)

let tax_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tax_estimation =
       option_of_yojson (value_for_key tax_estimation_of_yojson "taxEstimation") _list path;
   }
    : tax_configuration)

let tax_breakdown_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key bounded_string_of_yojson "type") _list path;
     rate = option_of_yojson (value_for_key bounded_string_of_yojson "rate") _list path;
     amount = option_of_yojson (value_for_key bounded_string_of_yojson "amount") _list path;
   }
    : tax_breakdown_item)

let tax_breakdown_of_yojson tree path = list_of_yojson tax_breakdown_item_of_yojson tree path

let support_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     refund_policy =
       option_of_yojson (value_for_key bounded_string_of_yojson "refundPolicy") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : support_term)

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "DESCENDING" -> DESCENDING
    | `String "ASCENDING" -> ASCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_by_of_yojson = string_of_yojson

let sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "sortOrder") _list path;
     sort_by = option_of_yojson (value_for_key sort_by_of_yojson "sortBy") _list path;
   }
    : sort)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key bounded_string_of_yojson "resourceType") _list path;
     service_code =
       option_of_yojson (value_for_key bounded_string_of_yojson "serviceCode") _list path;
     quota_code = option_of_yojson (value_for_key bounded_string_of_yojson "quotaCode") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : service_quota_exceeded_exception)

let payment_request_id_of_yojson = string_of_yojson
let agreement_id_of_yojson = string_of_yojson

let payment_request_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CANCELLED" -> CANCELLED
    | `String "REJECTED" -> REJECTED
    | `String "APPROVED" -> APPROVED
    | `String "PENDING_APPROVAL" -> PENDING_APPROVAL
    | `String "VALIDATION_FAILED" -> VALIDATION_FAILED
    | `String "VALIDATING" -> VALIDATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PaymentRequestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PaymentRequestStatus")
     : payment_request_status)
    : payment_request_status)

let payment_request_name_of_yojson = string_of_yojson
let payment_request_description_of_yojson = string_of_yojson
let positive_amount_upto8_decimals_of_yojson = string_of_yojson

let send_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
   }
    : send_agreement_payment_request_output)

let client_token_of_yojson = string_of_yojson

let send_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     charge_amount =
       value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount" _list path;
     name = value_for_key payment_request_name_of_yojson "name" _list path;
     term_id = value_for_key term_id_of_yojson "termId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : send_agreement_payment_request_input)

let agreement_cancellation_request_id_of_yojson = string_of_yojson

let agreement_cancellation_request_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALIDATION_FAILED" -> VALIDATION_FAILED
    | `String "CANCELLED" -> CANCELLED
    | `String "REJECTED" -> REJECTED
    | `String "APPROVED" -> APPROVED
    | `String "PENDING_APPROVAL" -> PENDING_APPROVAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AgreementCancellationRequestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementCancellationRequestStatus")
     : agreement_cancellation_request_status)
    : agreement_cancellation_request_status)

let agreement_cancellation_request_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTHER" -> OTHER
    | `String "BUYER_DISSATISFACTION" -> BUYER_DISSATISFACTION
    | `String "UNINTENDED_RENEWAL" -> UNINTENDED_RENEWAL
    | `String "PRODUCT_DISCONTINUED" -> PRODUCT_DISCONTINUED
    | `String "ALTERNATIVE_PROCUREMENT_CHANNEL" -> ALTERNATIVE_PROCUREMENT_CHANNEL
    | `String "TEST_AGREEMENT" -> TEST_AGREEMENT
    | `String "REPLACING_AGREEMENT" -> REPLACING_AGREEMENT
    | `String "INCORRECT_TERMS_ACCEPTED" -> INCORRECT_TERMS_ACCEPTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AgreementCancellationRequestReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementCancellationRequestReasonCode")
     : agreement_cancellation_request_reason_code)
    : agreement_cancellation_request_reason_code)

let agreement_cancellation_request_description_of_yojson = string_of_yojson

let send_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
   }
    : send_agreement_cancellation_request_output)

let send_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     reason_code =
       value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : send_agreement_cancellation_request_input)

let selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key bounded_string_of_yojson "value") _list path;
     type_ = option_of_yojson (value_for_key bounded_string_of_yojson "type") _list path;
   }
    : selector)

let agreement_type_of_yojson = string_of_yojson
let aws_account_id_of_yojson = string_of_yojson

let acceptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_id = option_of_yojson (value_for_key aws_account_id_of_yojson "accountId") _list path }
    : acceptor)

let proposer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_id = option_of_yojson (value_for_key aws_account_id_of_yojson "accountId") _list path }
    : proposer)

let agreement_resource_type_of_yojson = string_of_yojson

let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key agreement_resource_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : resource)

let resources_of_yojson tree path = list_of_yojson resource_of_yojson tree path
let offer_id_of_yojson = string_of_yojson
let offer_set_id_of_yojson = string_of_yojson

let proposal_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     offer_set_id = option_of_yojson (value_for_key offer_set_id_of_yojson "offerSetId") _list path;
     offer_id = option_of_yojson (value_for_key offer_id_of_yojson "offerId") _list path;
     resources = option_of_yojson (value_for_key resources_of_yojson "resources") _list path;
   }
    : proposal_summary)

let agreement_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "TERMINATED" -> TERMINATED
    | `String "SUPERSEDED" -> SUPERSEDED
    | `String "ROLLED_BACK" -> ROLLED_BACK
    | `String "REPLACED" -> REPLACED
    | `String "RENEWED" -> RENEWED
    | `String "EXPIRED" -> EXPIRED
    | `String "CANCELLED" -> CANCELLED
    | `String "ARCHIVED" -> ARCHIVED
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgreementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementStatus")
     : agreement_status)
    : agreement_status)

let entitlement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_arn =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "licenseArn")
         _list path;
   }
    : entitlement)

let entitlement_list_of_yojson tree path = list_of_yojson entitlement_of_yojson tree path

let agreement_view_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entitlements =
       option_of_yojson (value_for_key entitlement_list_of_yojson "entitlements") _list path;
     status = option_of_yojson (value_for_key agreement_status_of_yojson "status") _list path;
     proposal_summary =
       option_of_yojson (value_for_key proposal_summary_of_yojson "proposalSummary") _list path;
     proposer = option_of_yojson (value_for_key proposer_of_yojson "proposer") _list path;
     acceptor = option_of_yojson (value_for_key acceptor_of_yojson "acceptor") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     acceptance_time =
       option_of_yojson (value_for_key timestamp_of_yojson "acceptanceTime") _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
   }
    : agreement_view_summary)

let agreement_view_summary_list_of_yojson tree path =
  list_of_yojson agreement_view_summary_of_yojson tree path

let next_token_of_yojson = string_of_yojson

let search_agreements_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     agreement_view_summaries =
       option_of_yojson
         (value_for_key agreement_view_summary_list_of_yojson "agreementViewSummaries")
         _list path;
   }
    : search_agreements_output)

let catalog_of_yojson = string_of_yojson
let filter_name_of_yojson = string_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_value_list_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key filter_value_list_of_yojson "values") _list path;
     name = option_of_yojson (value_for_key filter_name_of_yojson "name") _list path;
   }
    : filter)

let filter_list_of_yojson tree path = list_of_yojson filter_of_yojson tree path
let max_results_of_yojson = int_of_yojson

let search_agreements_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     sort = option_of_yojson (value_for_key sort_of_yojson "sort") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "filters") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
   }
    : search_agreements_input)

let schedule_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     charge_amount =
       option_of_yojson (value_for_key bounded_string_of_yojson "chargeAmount") _list path;
     charge_date = option_of_yojson (value_for_key timestamp_of_yojson "chargeDate") _list path;
   }
    : schedule_item)

let schedule_list_of_yojson tree path = list_of_yojson schedule_item_of_yojson tree path

let dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_value = value_for_key zero_value_integer_of_yojson "dimensionValue" _list path;
     dimension_key = value_for_key bounded_string_of_yojson "dimensionKey" _list path;
   }
    : dimension)

let dimension_list_of_yojson tree path = list_of_yojson dimension_of_yojson tree path

let configurable_upfront_pricing_term_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimensions = value_for_key dimension_list_of_yojson "dimensions" _list path;
     selector_value = value_for_key bounded_string_of_yojson "selectorValue" _list path;
   }
    : configurable_upfront_pricing_term_configuration)

let boolean__of_yojson = bool_of_yojson

let renewal_term_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ enable_auto_renew = value_for_key boolean__of_yojson "enableAutoRenew" _list path }
    : renewal_term_configuration)

let requested_term_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "variablePaymentTermConfiguration" ->
       VariablePaymentTermConfiguration (variable_payment_term_configuration_of_yojson value_ path)
   | "renewalTermConfiguration" ->
       RenewalTermConfiguration (renewal_term_configuration_of_yojson value_ path)
   | "configurableUpfrontPricingTermConfiguration" ->
       ConfigurableUpfrontPricingTermConfiguration
         (configurable_upfront_pricing_term_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "RequestedTermConfiguration" unknown)
    : requested_term_configuration)

let requested_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key requested_term_configuration_of_yojson "configuration")
         _list path;
     id = value_for_key term_id_of_yojson "id" _list path;
   }
    : requested_term)

let requested_term_list_of_yojson tree path = list_of_yojson requested_term_of_yojson tree path

let renewal_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key renewal_term_configuration_of_yojson "configuration")
         _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : renewal_term)

let payment_request_status_message_of_yojson = string_of_yojson

let reject_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     status_message =
       option_of_yojson
         (value_for_key payment_request_status_message_of_yojson "statusMessage")
         _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
   }
    : reject_agreement_payment_request_output)

let payment_request_rejection_reason_of_yojson = string_of_yojson

let reject_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rejection_reason =
       option_of_yojson
         (value_for_key payment_request_rejection_reason_of_yojson "rejectionReason")
         _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     payment_request_id = value_for_key payment_request_id_of_yojson "paymentRequestId" _list path;
   }
    : reject_agreement_payment_request_input)

let agreement_cancellation_request_status_message_of_yojson = string_of_yojson

let reject_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     status_message =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_message_of_yojson "statusMessage")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
   }
    : reject_agreement_cancellation_request_output)

let agreement_cancellation_request_rejection_reason_of_yojson = string_of_yojson

let reject_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rejection_reason =
       value_for_key agreement_cancellation_request_rejection_reason_of_yojson "rejectionReason"
         _list path;
     agreement_cancellation_request_id =
       value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId"
         _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : reject_agreement_cancellation_request_input)

let registration_token_of_yojson = string_of_yojson

let recurring_payment_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     price = option_of_yojson (value_for_key bounded_string_of_yojson "price") _list path;
     billing_period =
       option_of_yojson (value_for_key bounded_string_of_yojson "billingPeriod") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : recurring_payment_term)

let pricing_currency_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     max_adjustment_amount =
       option_of_yojson (value_for_key bounded_string_of_yojson "maxAdjustmentAmount") _list path;
     amount = option_of_yojson (value_for_key bounded_string_of_yojson "amount") _list path;
   }
    : pricing_currency_amount)

let positive_integer_with_default_value_one_of_yojson = int_of_yojson

let payment_schedule_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schedule = option_of_yojson (value_for_key schedule_list_of_yojson "schedule") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : payment_schedule_term)

let charge_id_of_yojson = string_of_yojson

let payment_request_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     charge_id = option_of_yojson (value_for_key charge_id_of_yojson "chargeId") _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
   }
    : payment_request_summary)

let payment_request_summary_list_of_yojson tree path =
  list_of_yojson payment_request_summary_of_yojson tree path

let party_type_of_yojson = string_of_yojson
let billing_adjustment_request_id_of_yojson = string_of_yojson
let invoice_id_of_yojson = string_of_yojson

let billing_adjustment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "VALIDATION_FAILED" -> VALIDATION_FAILED
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BillingAdjustmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingAdjustmentStatus")
     : billing_adjustment_status)
    : billing_adjustment_status)

let billing_adjustment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
     agreement_type = value_for_key agreement_type_of_yojson "agreementType" _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     status = value_for_key billing_adjustment_status_of_yojson "status" _list path;
     currency_code = value_for_key currency_code_of_yojson "currencyCode" _list path;
     adjustment_amount =
       value_for_key positive_amount_upto8_decimals_of_yojson "adjustmentAmount" _list path;
     original_invoice_id = value_for_key invoice_id_of_yojson "originalInvoiceId" _list path;
     billing_adjustment_request_id =
       value_for_key billing_adjustment_request_id_of_yojson "billingAdjustmentRequestId" _list path;
   }
    : billing_adjustment_summary)

let billing_adjustment_summary_list_of_yojson tree path =
  list_of_yojson billing_adjustment_summary_of_yojson tree path

let list_billing_adjustment_requests_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = value_for_key billing_adjustment_summary_list_of_yojson "items" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_billing_adjustment_requests_output)

let list_billing_adjustment_requests_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     created_before =
       option_of_yojson (value_for_key timestamp_of_yojson "createdBefore") _list path;
     created_after = option_of_yojson (value_for_key timestamp_of_yojson "createdAfter") _list path;
     status =
       option_of_yojson (value_for_key billing_adjustment_status_of_yojson "status") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
   }
    : list_billing_adjustment_requests_input)

let list_agreement_payment_requests_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = value_for_key payment_request_summary_list_of_yojson "items" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_agreement_payment_requests_output)

let list_agreement_payment_requests_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     party_type = value_for_key party_type_of_yojson "partyType" _list path;
   }
    : list_agreement_payment_requests_input)

let invoice_billing_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     year =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "year" _list path;
     month =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "month" _list path;
   }
    : invoice_billing_period)

let invoice_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREDIT_MEMO" -> CREDIT_MEMO
    | `String "INVOICE" -> INVOICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "InvoiceType" value)
    | _ -> raise (deserialize_wrong_type_error path "InvoiceType")
     : invoice_type)
    : invoice_type)

let invoicing_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     branch_name = option_of_yojson (value_for_key bounded_string_of_yojson "branchName") _list path;
     legal_name = option_of_yojson (value_for_key bounded_string_of_yojson "legalName") _list path;
   }
    : invoicing_entity)

let agreement_invoice_line_item_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoicing_entity =
       option_of_yojson (value_for_key invoicing_entity_of_yojson "invoicingEntity") _list path;
     invoice_type = option_of_yojson (value_for_key invoice_type_of_yojson "invoiceType") _list path;
     issued_time = option_of_yojson (value_for_key timestamp_of_yojson "issuedTime") _list path;
     invoice_billing_period =
       option_of_yojson
         (value_for_key invoice_billing_period_of_yojson "invoiceBillingPeriod")
         _list path;
     pricing_currency_amount =
       option_of_yojson
         (value_for_key pricing_currency_amount_of_yojson "pricingCurrencyAmount")
         _list path;
     invoice_id = option_of_yojson (value_for_key resource_id_of_yojson "invoiceId") _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
   }
    : agreement_invoice_line_item_group_summary)

let agreement_invoice_line_item_group_summaries_of_yojson tree path =
  list_of_yojson agreement_invoice_line_item_group_summary_of_yojson tree path

let list_agreement_invoice_line_items_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     agreement_invoice_line_item_group_summaries =
       option_of_yojson
         (value_for_key agreement_invoice_line_item_group_summaries_of_yojson
            "agreementInvoiceLineItemGroupSummaries")
         _list path;
   }
    : list_agreement_invoice_line_items_output)

let line_item_group_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVOICE_ID" -> INVOICE_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "LineItemGroupBy" value)
    | _ -> raise (deserialize_wrong_type_error path "LineItemGroupBy")
     : line_item_group_by)
    : line_item_group_by)

let list_agreement_invoice_line_items_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     after_issued_time =
       option_of_yojson (value_for_key timestamp_of_yojson "afterIssuedTime") _list path;
     before_issued_time =
       option_of_yojson (value_for_key timestamp_of_yojson "beforeIssuedTime") _list path;
     invoice_billing_period =
       option_of_yojson
         (value_for_key invoice_billing_period_of_yojson "invoiceBillingPeriod")
         _list path;
     invoice_type = option_of_yojson (value_for_key invoice_type_of_yojson "invoiceType") _list path;
     invoice_id = option_of_yojson (value_for_key resource_id_of_yojson "invoiceId") _list path;
     group_by = value_for_key line_item_group_by_of_yojson "groupBy" _list path;
     agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path;
   }
    : list_agreement_invoice_line_items_input)

let charge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time = option_of_yojson (value_for_key timestamp_of_yojson "time") _list path;
     amount = option_of_yojson (value_for_key bounded_string_of_yojson "amount") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     purchase_order_reference =
       option_of_yojson
         (value_for_key purchase_order_reference_of_yojson "purchaseOrderReference")
         _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     revision = option_of_yojson (value_for_key charge_revision_of_yojson "revision") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : charge)

let charges_of_yojson tree path = list_of_yojson charge_of_yojson tree path

let list_agreement_charges_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     items = option_of_yojson (value_for_key charges_of_yojson "items") _list path;
   }
    : list_agreement_charges_output)

let list_agreement_charges_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
   }
    : list_agreement_charges_input)

let agreement_cancellation_request_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
   }
    : agreement_cancellation_request_summary)

let agreement_cancellation_request_summary_list_of_yojson tree path =
  list_of_yojson agreement_cancellation_request_summary_of_yojson tree path

let list_agreement_cancellation_requests_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items =
       option_of_yojson
         (value_for_key agreement_cancellation_request_summary_list_of_yojson "items")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_agreement_cancellation_requests_output)

let list_agreement_cancellation_requests_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     party_type = value_for_key party_type_of_yojson "partyType" _list path;
   }
    : list_agreement_cancellation_requests_input)

let document_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = option_of_yojson (value_for_key bounded_string_of_yojson "version") _list path;
     url = option_of_yojson (value_for_key bounded_string_of_yojson "url") _list path;
     type_ = option_of_yojson (value_for_key bounded_string_of_yojson "type") _list path;
   }
    : document_item)

let document_list_of_yojson tree path = list_of_yojson document_item_of_yojson tree path

let legal_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     documents = option_of_yojson (value_for_key document_list_of_yojson "documents") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : legal_term)

let itemized_charge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     incremental_charge_amount =
       option_of_yojson
         (value_for_key bounded_string_of_yojson "incrementalChargeAmount")
         _list path;
     charge_reference =
       option_of_yojson (value_for_key resource_id_of_yojson "chargeReference") _list path;
     old_quantity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "oldQuantity")
         _list path;
     new_quantity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "newQuantity")
         _list path;
     dimension_key =
       option_of_yojson (value_for_key bounded_string_of_yojson "dimensionKey") _list path;
   }
    : itemized_charge)

let itemized_charge_list_of_yojson tree path = list_of_yojson itemized_charge_of_yojson tree path

let intent_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPLACE" -> REPLACE
    | `String "AMEND" -> AMEND
    | `String "NEW" -> NEW
    | `String value -> raise (deserialize_unknown_enum_value_error path "Intent" value)
    | _ -> raise (deserialize_wrong_type_error path "Intent")
     : intent)
    : intent)

let grant_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_quantity =
       option_of_yojson
         (value_for_key positive_integer_with_default_value_one_of_yojson "maxQuantity")
         _list path;
     dimension_key =
       option_of_yojson (value_for_key bounded_string_of_yojson "dimensionKey") _list path;
   }
    : grant_item)

let grant_list_of_yojson tree path = list_of_yojson grant_item_of_yojson tree path

let billing_adjustment_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTHER" -> OTHER
    | `String "BUYER_DISSATISFACTION" -> BUYER_DISSATISFACTION
    | `String "UNINTENDED_RENEWAL" -> UNINTENDED_RENEWAL
    | `String "ALTERNATIVE_PROCUREMENT_CHANNEL" -> ALTERNATIVE_PROCUREMENT_CHANNEL
    | `String "TEST_ENVIRONMENT_CHARGES" -> TEST_ENVIRONMENT_CHARGES
    | `String "INCORRECT_METERING" -> INCORRECT_METERING
    | `String "INCORRECT_TERMS_ACCEPTED" -> INCORRECT_TERMS_ACCEPTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BillingAdjustmentReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingAdjustmentReasonCode")
     : billing_adjustment_reason_code)
    : billing_adjustment_reason_code)

let billing_adjustment_status_message_of_yojson = string_of_yojson

let get_billing_adjustment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     status_message =
       option_of_yojson
         (value_for_key billing_adjustment_status_message_of_yojson "statusMessage")
         _list path;
     status = value_for_key billing_adjustment_status_of_yojson "status" _list path;
     currency_code = value_for_key currency_code_of_yojson "currencyCode" _list path;
     adjustment_amount =
       value_for_key positive_amount_upto8_decimals_of_yojson "adjustmentAmount" _list path;
     original_invoice_id = value_for_key invoice_id_of_yojson "originalInvoiceId" _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     adjustment_reason_code =
       value_for_key billing_adjustment_reason_code_of_yojson "adjustmentReasonCode" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     billing_adjustment_request_id =
       value_for_key billing_adjustment_request_id_of_yojson "billingAdjustmentRequestId" _list path;
   }
    : get_billing_adjustment_request_output)

let get_billing_adjustment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_adjustment_request_id =
       value_for_key billing_adjustment_request_id_of_yojson "billingAdjustmentRequestId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : get_billing_adjustment_request_input)

let constraints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quantity_configuration =
       option_of_yojson (value_for_key bounded_string_of_yojson "quantityConfiguration") _list path;
     multiple_dimension_selection =
       option_of_yojson
         (value_for_key bounded_string_of_yojson "multipleDimensionSelection")
         _list path;
   }
    : constraints)

let configurable_upfront_rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rate_card = option_of_yojson (value_for_key rate_card_list_of_yojson "rateCard") _list path;
     constraints = option_of_yojson (value_for_key constraints_of_yojson "constraints") _list path;
     selector = option_of_yojson (value_for_key selector_of_yojson "selector") _list path;
   }
    : configurable_upfront_rate_card_item)

let configurable_upfront_rate_card_list_of_yojson tree path =
  list_of_yojson configurable_upfront_rate_card_item_of_yojson tree path

let configurable_upfront_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key configurable_upfront_pricing_term_configuration_of_yojson "configuration")
         _list path;
     rate_cards =
       option_of_yojson
         (value_for_key configurable_upfront_rate_card_list_of_yojson "rateCards")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : configurable_upfront_pricing_term)

let byol_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : byol_pricing_term)

let free_trial_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grants = option_of_yojson (value_for_key grant_list_of_yojson "grants") _list path;
     duration = option_of_yojson (value_for_key bounded_string_of_yojson "duration") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : free_trial_pricing_term)

let fixed_upfront_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grants = option_of_yojson (value_for_key grant_list_of_yojson "grants") _list path;
     price = option_of_yojson (value_for_key bounded_string_of_yojson "price") _list path;
     duration = option_of_yojson (value_for_key bounded_string_of_yojson "duration") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
   }
    : fixed_upfront_pricing_term)

let accepted_term_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "variablePaymentTerm" -> VariablePaymentTerm (variable_payment_term_of_yojson value_ path)
   | "fixedUpfrontPricingTerm" ->
       FixedUpfrontPricingTerm (fixed_upfront_pricing_term_of_yojson value_ path)
   | "freeTrialPricingTerm" -> FreeTrialPricingTerm (free_trial_pricing_term_of_yojson value_ path)
   | "paymentScheduleTerm" -> PaymentScheduleTerm (payment_schedule_term_of_yojson value_ path)
   | "validityTerm" -> ValidityTerm (validity_term_of_yojson value_ path)
   | "recurringPaymentTerm" -> RecurringPaymentTerm (recurring_payment_term_of_yojson value_ path)
   | "byolPricingTerm" -> ByolPricingTerm (byol_pricing_term_of_yojson value_ path)
   | "configurableUpfrontPricingTerm" ->
       ConfigurableUpfrontPricingTerm (configurable_upfront_pricing_term_of_yojson value_ path)
   | "usageBasedPricingTerm" ->
       UsageBasedPricingTerm (usage_based_pricing_term_of_yojson value_ path)
   | "renewalTerm" -> RenewalTerm (renewal_term_of_yojson value_ path)
   | "supportTerm" -> SupportTerm (support_term_of_yojson value_ path)
   | "legalTerm" -> LegalTerm (legal_term_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "AcceptedTerm" unknown)
    : accepted_term)

let accepted_term_list_of_yojson tree path = list_of_yojson accepted_term_of_yojson tree path

let get_agreement_terms_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     accepted_terms =
       option_of_yojson (value_for_key accepted_term_list_of_yojson "acceptedTerms") _list path;
   }
    : get_agreement_terms_output)

let get_agreement_terms_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path;
   }
    : get_agreement_terms_input)

let get_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     charge_id = option_of_yojson (value_for_key charge_id_of_yojson "chargeId") _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     status_message =
       option_of_yojson
         (value_for_key payment_request_status_message_of_yojson "statusMessage")
         _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
   }
    : get_agreement_payment_request_output)

let get_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     payment_request_id = value_for_key payment_request_id_of_yojson "paymentRequestId" _list path;
   }
    : get_agreement_payment_request_input)

let entitlement_type_of_yojson = string_of_yojson

let agreement_entitlement_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEPROVISIONED" -> DEPROVISIONED
    | `String "FAILED" -> FAILED
    | `String "PENDING" -> PENDING
    | `String "SCHEDULED" -> SCHEDULED
    | `String "PROVISIONED" -> PROVISIONED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AgreementEntitlementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementEntitlementStatus")
     : agreement_entitlement_status)
    : agreement_entitlement_status)

let agreement_entitlement_status_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRODUCT_RESTRICTED" -> PRODUCT_RESTRICTED
    | `String "AGREEMENT_ACTIVE" -> AGREEMENT_ACTIVE
    | `String "AGREEMENT_INACTIVE" -> AGREEMENT_INACTIVE
    | `String "UNSUPPORTED_OPERATION" -> UNSUPPORTED_OPERATION
    | `String "ACCOUNT_SUSPENDED" -> ACCOUNT_SUSPENDED
    | `String "INCOMPATIBLE_CURRENCY" -> INCOMPATIBLE_CURRENCY
    | `String "INVALID_PAYMENT_INSTRUMENT" -> INVALID_PAYMENT_INSTRUMENT
    | `String "FUTURE_START_DATE" -> FUTURE_START_DATE
    | `String "PROVISIONING_IN_PROGRESS" -> PROVISIONING_IN_PROGRESS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AgreementEntitlementStatusReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementEntitlementStatusReasonCode")
     : agreement_entitlement_status_reason_code)
    : agreement_entitlement_status_reason_code)

let aws_arn_of_yojson = string_of_yojson

let agreement_entitlement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_arn = option_of_yojson (value_for_key aws_arn_of_yojson "licenseArn") _list path;
     status_reason_code =
       option_of_yojson
         (value_for_key agreement_entitlement_status_reason_code_of_yojson "statusReasonCode")
         _list path;
     status =
       option_of_yojson (value_for_key agreement_entitlement_status_of_yojson "status") _list path;
     registration_token =
       option_of_yojson (value_for_key registration_token_of_yojson "registrationToken") _list path;
     type_ = option_of_yojson (value_for_key entitlement_type_of_yojson "type") _list path;
     resource = option_of_yojson (value_for_key resource_of_yojson "resource") _list path;
   }
    : agreement_entitlement)

let agreement_entitlement_list_of_yojson tree path =
  list_of_yojson agreement_entitlement_of_yojson tree path

let get_agreement_entitlements_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     agreement_entitlements =
       option_of_yojson
         (value_for_key agreement_entitlement_list_of_yojson "agreementEntitlements")
         _list path;
   }
    : get_agreement_entitlements_output)

let get_agreement_entitlements_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path;
   }
    : get_agreement_entitlements_input)

let get_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     status_message =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_message_of_yojson "statusMessage")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
   }
    : get_agreement_cancellation_request_output)

let get_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     agreement_cancellation_request_id =
       value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId"
         _list path;
   }
    : get_agreement_cancellation_request_input)

let estimated_taxes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_amount =
       option_of_yojson (value_for_key bounded_string_of_yojson "totalAmount") _list path;
     breakdown = option_of_yojson (value_for_key tax_breakdown_of_yojson "breakdown") _list path;
   }
    : estimated_taxes)

let expected_charge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_taxes =
       option_of_yojson (value_for_key estimated_taxes_of_yojson "estimatedTaxes") _list path;
     timing = option_of_yojson (value_for_key timing_of_yojson "timing") _list path;
     amount_after_tax =
       option_of_yojson (value_for_key bounded_string_of_yojson "amountAfterTax") _list path;
     amount = option_of_yojson (value_for_key bounded_string_of_yojson "amount") _list path;
     time = option_of_yojson (value_for_key timestamp_of_yojson "time") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : expected_charge)

let expected_charge_list_of_yojson tree path = list_of_yojson expected_charge_of_yojson tree path

let estimated_charges_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_value =
       option_of_yojson (value_for_key bounded_string_of_yojson "agreementValue") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
   }
    : estimated_charges)

let describe_agreement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key agreement_status_of_yojson "status") _list path;
     proposal_summary =
       option_of_yojson (value_for_key proposal_summary_of_yojson "proposalSummary") _list path;
     estimated_charges =
       option_of_yojson (value_for_key estimated_charges_of_yojson "estimatedCharges") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     acceptance_time =
       option_of_yojson (value_for_key timestamp_of_yojson "acceptanceTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     proposer = option_of_yojson (value_for_key proposer_of_yojson "proposer") _list path;
     acceptor = option_of_yojson (value_for_key acceptor_of_yojson "acceptor") _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
   }
    : describe_agreement_output)

let describe_agreement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path }
    : describe_agreement_input)

let agreement_request_id_of_yojson = string_of_yojson

let charge_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoicing_entity =
       option_of_yojson (value_for_key invoicing_entity_of_yojson "invoicingEntity") _list path;
     itemized_charges =
       option_of_yojson (value_for_key itemized_charge_list_of_yojson "itemizedCharges") _list path;
     estimated_taxes =
       option_of_yojson (value_for_key estimated_taxes_of_yojson "estimatedTaxes") _list path;
     expected_charges =
       option_of_yojson (value_for_key expected_charge_list_of_yojson "expectedCharges") _list path;
     new_agreement_value_after_tax =
       option_of_yojson
         (value_for_key bounded_string_of_yojson "newAgreementValueAfterTax")
         _list path;
     new_agreement_value =
       option_of_yojson (value_for_key bounded_string_of_yojson "newAgreementValue") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
   }
    : charge_summary)

let create_agreement_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     charge_summary =
       option_of_yojson (value_for_key charge_summary_of_yojson "chargeSummary") _list path;
     agreement_request_id =
       option_of_yojson
         (value_for_key agreement_request_id_of_yojson "agreementRequestId")
         _list path;
   }
    : create_agreement_request_output)

let agreement_proposal_id_of_yojson = string_of_yojson

let create_agreement_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tax_configuration =
       option_of_yojson (value_for_key tax_configuration_of_yojson "taxConfiguration") _list path;
     agreement_proposal_identifier =
       option_of_yojson
         (value_for_key agreement_proposal_id_of_yojson "agreementProposalIdentifier")
         _list path;
     source_agreement_identifier =
       option_of_yojson (value_for_key resource_id_of_yojson "sourceAgreementIdentifier") _list path;
     requested_terms = value_for_key requested_term_list_of_yojson "requestedTerms" _list path;
     intent = value_for_key intent_of_yojson "intent" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_agreement_request_input)

let cancel_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
   }
    : cancel_agreement_payment_request_output)

let cancel_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     payment_request_id = value_for_key payment_request_id_of_yojson "paymentRequestId" _list path;
   }
    : cancel_agreement_payment_request_input)

let cancel_agreement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_agreement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path }
    : cancel_agreement_input)

let cancel_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     status_message =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_message_of_yojson "statusMessage")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
   }
    : cancel_agreement_cancellation_request_output)

let agreement_cancellation_request_cancellation_reason_of_yojson = string_of_yojson

let cancel_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cancellation_reason =
       value_for_key agreement_cancellation_request_cancellation_reason_of_yojson
         "cancellationReason" _list path;
     agreement_cancellation_request_id =
       value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId"
         _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : cancel_agreement_cancellation_request_input)

let billing_adjustment_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_FAILURE" -> INTERNAL_FAILURE
    | `String "RESOURCE_NOT_FOUND_EXCEPTION" -> RESOURCE_NOT_FOUND_EXCEPTION
    | `String "VALIDATION_EXCEPTION" -> VALIDATION_EXCEPTION
    | `String "CONFLICT_EXCEPTION" -> CONFLICT_EXCEPTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BillingAdjustmentErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingAdjustmentErrorCode")
     : billing_adjustment_error_code)
    : billing_adjustment_error_code)

let billing_adjustment_description_of_yojson = string_of_yojson

let batch_create_billing_adjustment_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
     billing_adjustment_request_id =
       value_for_key billing_adjustment_request_id_of_yojson "billingAdjustmentRequestId" _list path;
   }
    : batch_create_billing_adjustment_item)

let batch_create_billing_adjustment_item_list_of_yojson tree path =
  list_of_yojson batch_create_billing_adjustment_item_of_yojson tree path

let batch_create_billing_adjustment_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     code = value_for_key billing_adjustment_error_code_of_yojson "code" _list path;
   }
    : batch_create_billing_adjustment_error)

let batch_create_billing_adjustment_error_list_of_yojson tree path =
  list_of_yojson batch_create_billing_adjustment_error_of_yojson tree path

let batch_create_billing_adjustment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors = value_for_key batch_create_billing_adjustment_error_list_of_yojson "errors" _list path;
     items = value_for_key batch_create_billing_adjustment_item_list_of_yojson "items" _list path;
   }
    : batch_create_billing_adjustment_request_output)

let batch_create_billing_adjustment_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
     description =
       option_of_yojson
         (value_for_key billing_adjustment_description_of_yojson "description")
         _list path;
     adjustment_reason_code =
       value_for_key billing_adjustment_reason_code_of_yojson "adjustmentReasonCode" _list path;
     currency_code = value_for_key currency_code_of_yojson "currencyCode" _list path;
     adjustment_amount =
       value_for_key positive_amount_upto8_decimals_of_yojson "adjustmentAmount" _list path;
     original_invoice_id = value_for_key invoice_id_of_yojson "originalInvoiceId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : batch_create_billing_adjustment_request_entry)

let batch_create_billing_adjustment_request_entry_list_of_yojson tree path =
  list_of_yojson batch_create_billing_adjustment_request_entry_of_yojson tree path

let batch_create_billing_adjustment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_adjustment_request_entries =
       value_for_key batch_create_billing_adjustment_request_entry_list_of_yojson
         "billingAdjustmentRequestEntries" _list path;
   }
    : batch_create_billing_adjustment_request_input)

let accept_agreement_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
   }
    : accept_agreement_request_output)

let accept_agreement_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     purchase_orders =
       option_of_yojson (value_for_key purchase_orders_of_yojson "purchaseOrders") _list path;
     agreement_request_id =
       value_for_key agreement_request_id_of_yojson "agreementRequestId" _list path;
   }
    : accept_agreement_request_input)

let accept_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
   }
    : accept_agreement_payment_request_output)

let accept_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     purchase_order_reference =
       option_of_yojson
         (value_for_key purchase_order_reference_of_yojson "purchaseOrderReference")
         _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     payment_request_id = value_for_key payment_request_id_of_yojson "paymentRequestId" _list path;
   }
    : accept_agreement_payment_request_input)

let accept_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
   }
    : accept_agreement_cancellation_request_output)

let accept_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_cancellation_request_id =
       value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId"
         _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : accept_agreement_cancellation_request_input)
