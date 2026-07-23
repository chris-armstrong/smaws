open Smaws_Lib.Json.DeserializeHelpers
open Types

let aws_account_id_of_yojson = string_of_yojson
let bounded_string_of_yojson = string_of_yojson

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key bounded_string_of_yojson "name" _list path;
     message = value_for_key bounded_string_of_yojson "message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "MISSING_BILLING_ADJUSTMENTS" -> MISSING_BILLING_ADJUSTMENTS
    | `String "BILLING_ADJUSTMENTS_LIMIT_EXCEEDED" -> BILLING_ADJUSTMENTS_LIMIT_EXCEEDED
    | `String "MISSING_INVOICE_ID" -> MISSING_INVOICE_ID
    | `String "INVALID_ADJUSTMENT_AMOUNT" -> INVALID_ADJUSTMENT_AMOUNT
    | `String "MISSING_ADJUSTMENT_AMOUNT" -> MISSING_ADJUSTMENT_AMOUNT
    | `String "INVALID_REASON_CODE" -> INVALID_REASON_CODE
    | `String "MISSING_REASON_CODE" -> MISSING_REASON_CODE
    | `String "MISSING_DESCRIPTION" -> MISSING_DESCRIPTION
    | `String "INVALID_INVOICE_ADJUSTMENT_PERIOD" -> INVALID_INVOICE_ADJUSTMENT_PERIOD
    | `String "INVALID_CURRENCY_CODE" -> INVALID_CURRENCY_CODE
    | `String "MISSING_CURRENCY_CODE" -> MISSING_CURRENCY_CODE
    | `String "EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT" -> EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT
    | `String "MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY" -> MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY
    | `String "MULTIPLE_AGREEMENT_IDS" -> MULTIPLE_AGREEMENT_IDS
    | `String "INVALID_AGREEMENT_CANCELLATION_REQUEST_ID" ->
        INVALID_AGREEMENT_CANCELLATION_REQUEST_ID
    | `String "MISSING_AGREEMENT_CANCELLATION_REQUEST_ID" ->
        MISSING_AGREEMENT_CANCELLATION_REQUEST_ID
    | `String "MISSING_REASON" -> MISSING_REASON
    | `String "INVALID_REASON" -> INVALID_REASON
    | `String "INVALID_STATUS" -> INVALID_STATUS
    | `String "INVALID_AGREEMENT_ID" -> INVALID_AGREEMENT_ID
    | `String "MISSING_AGREEMENT_ID" -> MISSING_AGREEMENT_ID
    | `String "INVALID_CATALOG" -> INVALID_CATALOG
    | `String "INVALID_FILTERS" -> INVALID_FILTERS
    | `String "INVALID_FILTER_NAME" -> INVALID_FILTER_NAME
    | `String "MISSING_FILTER_NAME" -> MISSING_FILTER_NAME
    | `String "INVALID_FILTER_VALUES" -> INVALID_FILTER_VALUES
    | `String "MISSING_FILTER_VALUES" -> MISSING_FILTER_VALUES
    | `String "INVALID_SORT_BY" -> INVALID_SORT_BY
    | `String "INVALID_SORT_ORDER" -> INVALID_SORT_ORDER
    | `String "INVALID_NEXT_TOKEN" -> INVALID_NEXT_TOKEN
    | `String "INVALID_MAX_RESULTS" -> INVALID_MAX_RESULTS
    | `String "INVALID_TERM_ID" -> INVALID_TERM_ID
    | `String "MISSING_TERM_ID" -> MISSING_TERM_ID
    | `String "MISSING_NAME" -> MISSING_NAME
    | `String "INVALID_NAME" -> INVALID_NAME
    | `String "INVALID_DESCRIPTION" -> INVALID_DESCRIPTION
    | `String "MISSING_CHARGE_AMOUNT" -> MISSING_CHARGE_AMOUNT
    | `String "INVALID_CHARGE_AMOUNT" -> INVALID_CHARGE_AMOUNT
    | `String "MISSING_PAYMENT_REQUEST_ID" -> MISSING_PAYMENT_REQUEST_ID
    | `String "INVALID_PAYMENT_REQUEST_ID" -> INVALID_PAYMENT_REQUEST_ID
    | `String "MISSING_PARTY_TYPE" -> MISSING_PARTY_TYPE
    | `String "INVALID_PARTY_TYPE" -> INVALID_PARTY_TYPE
    | `String "UNSUPPORTED_FILTERS" -> UNSUPPORTED_FILTERS
    | `String "INVALID_CLIENT_TOKEN" -> INVALID_CLIENT_TOKEN
    | `String "INVALID_INTENT" -> INVALID_INTENT
    | `String "MISSING_INTENT" -> MISSING_INTENT
    | `String "INVALID_SOURCE_AGREEMENT_IDENTIFIER" -> INVALID_SOURCE_AGREEMENT_IDENTIFIER
    | `String "MISSING_SOURCE_AGREEMENT_IDENTIFIER" -> MISSING_SOURCE_AGREEMENT_IDENTIFIER
    | `String "INVALID_AGREEMENT_PROPOSAL_IDENTIFIER" -> INVALID_AGREEMENT_PROPOSAL_IDENTIFIER
    | `String "MISSING_AGREEMENT_PROPOSAL_IDENTIFIER" -> MISSING_AGREEMENT_PROPOSAL_IDENTIFIER
    | `String "INVALID_REQUESTED_TERMS" -> INVALID_REQUESTED_TERMS
    | `String "MISSING_REQUESTED_TERMS" -> MISSING_REQUESTED_TERMS
    | `String "INVALID_REQUESTED_TERM_ID" -> INVALID_REQUESTED_TERM_ID
    | `String "MISSING_REQUESTED_TERM_ID" -> MISSING_REQUESTED_TERM_ID
    | `String "INVALID_REQUESTED_TERM_CONFIGURATION" -> INVALID_REQUESTED_TERM_CONFIGURATION
    | `String "MISSING_REQUESTED_TERM_CONFIGURATION" -> MISSING_REQUESTED_TERM_CONFIGURATION
    | `String "INVALID_AGREEMENT_REQUEST_ID" -> INVALID_AGREEMENT_REQUEST_ID
    | `String "MISSING_AGREEMENT_REQUEST_ID" -> MISSING_AGREEMENT_REQUEST_ID
    | `String "INVALID_PURCHASE_ORDERS" -> INVALID_PURCHASE_ORDERS
    | `String "MISSING_PURCHASE_ORDERS" -> MISSING_PURCHASE_ORDERS
    | `String "INVALID_CHARGE_ID" -> INVALID_CHARGE_ID
    | `String "MISSING_CHARGE_ID" -> MISSING_CHARGE_ID
    | `String "INVALID_CHARGE_REVISION" -> INVALID_CHARGE_REVISION
    | `String "MISSING_CHARGE_REVISION" -> MISSING_CHARGE_REVISION
    | `String "INVALID_AGREEMENT_TYPE" -> INVALID_AGREEMENT_TYPE
    | `String "INVALID_PURCHASE_ORDER_REFERENCE" -> INVALID_PURCHASE_ORDER_REFERENCE
    | `String "INACTIVE_AGREEMENT" -> INACTIVE_AGREEMENT
    | `String "SUPERSEDED_AGREEMENT_PROPOSAL" -> SUPERSEDED_AGREEMENT_PROPOSAL
    | `String "EXPIRED_AGREEMENT_PROPOSAL" -> EXPIRED_AGREEMENT_PROPOSAL
    | `String "MISSING_MANDATORY_TERMS" -> MISSING_MANDATORY_TERMS
    | `String "INCOMPATIBLE_TERMS" -> INCOMPATIBLE_TERMS
    | `String "MISSING_USAGE_AGREEMENT" -> MISSING_USAGE_AGREEMENT
    | `String "INVALID_INCREMENTAL_CHARGE" -> INVALID_INCREMENTAL_CHARGE
    | `String "MISSING_ACCOUNT_ADDRESS" -> MISSING_ACCOUNT_ADDRESS
    | `String "UNSUPPORTED_ACTION" -> UNSUPPORTED_ACTION
    | `String "INVALID_REJECTION_REASON" -> INVALID_REJECTION_REASON
    | `String "INVALID_PAYMENT_REQUEST_STATUS" -> INVALID_PAYMENT_REQUEST_STATUS
    | `String "OTHER" -> OTHER
    | `String "DUPLICATE_CHARGES" -> DUPLICATE_CHARGES
    | `String "UNSUPPORTED_ACCOUNT_PLAN" -> UNSUPPORTED_ACCOUNT_PLAN
    | `String "DUPLICATE_AGREEMENT_IN_ORGANIZATION" -> DUPLICATE_AGREEMENT_IN_ORGANIZATION
    | `String "MISSING_PURCHASE_ORDER_REFERENCE" -> MISSING_PURCHASE_ORDER_REFERENCE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let exception_message_of_yojson = string_of_yojson
let request_id_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     fields =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fields")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
   }
    : throttling_exception)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Agreement" -> AGREEMENT
    | `String "AgreementRequest" -> AGREEMENT_REQUEST
    | `String "AgreementProposal" -> AGREEMENT_PROPOSAL
    | `String "Charge" -> CHARGE
    | `String "PaymentRequest" -> PAYMENT_REQUEST
    | `String "Invoice" -> INVOICE
    | `String "AgreementCancellationRequest" -> AGREEMENT_CANCELLATION_REQUEST
    | `String "BillingAdjustmentRequest" -> BILLING_ADJUSTMENT_REQUEST
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let resource_id_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
   }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
   }
    : conflict_exception)

let access_denied_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_ACCOUNT_STATE" -> INVALID_ACCOUNT_STATE
    | `String "DENIED_BY_PRIVATE_MARKETPLACE_POLICY" -> DENIED_BY_PRIVATE_MARKETPLACE_POLICY
    | `String "FAILED_KYC_COMPLIANCE" -> FAILED_KYC_COMPLIANCE
    | `String "MISSING_MFA" -> MISSING_MFA
    | `String "INVALID_ACCESS" -> INVALID_ACCESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessDeniedExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedExceptionReason")
     : access_denied_exception_reason)
    : access_denied_exception_reason)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     reason =
       option_of_yojson (value_for_key access_denied_exception_reason_of_yojson "reason") _list path;
   }
    : access_denied_exception)

let update_purchase_orders_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let purchase_order_reference_of_yojson = string_of_yojson
let charge_revision_of_yojson = long_of_yojson

let purchase_order_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     charge_id = value_for_key resource_id_of_yojson "chargeId" _list path;
     charge_revision =
       option_of_yojson (value_for_key charge_revision_of_yojson "chargeRevision") _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     purchase_order_reference =
       option_of_yojson
         (value_for_key purchase_order_reference_of_yojson "purchaseOrderReference")
         _list path;
   }
    : purchase_order)

let purchase_orders_of_yojson tree path = list_of_yojson purchase_order_of_yojson tree path

let update_purchase_orders_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ purchase_orders = value_for_key purchase_orders_of_yojson "purchaseOrders" _list path }
    : update_purchase_orders_input)

let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let currency_code_of_yojson = string_of_yojson
let positive_amount_upto8_decimals_of_yojson = string_of_yojson
let payment_request_description_of_yojson = string_of_yojson
let payment_request_name_of_yojson = string_of_yojson

let payment_request_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "VALIDATING" -> VALIDATING
    | `String "VALIDATION_FAILED" -> VALIDATION_FAILED
    | `String "PENDING_APPROVAL" -> PENDING_APPROVAL
    | `String "APPROVED" -> APPROVED
    | `String "REJECTED" -> REJECTED
    | `String "CANCELLED" -> CANCELLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PaymentRequestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PaymentRequestStatus")
     : payment_request_status)
    : payment_request_status)

let agreement_id_of_yojson = string_of_yojson
let payment_request_id_of_yojson = string_of_yojson

let send_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
   }
    : send_agreement_payment_request_output)

let term_id_of_yojson = string_of_yojson
let client_token_of_yojson = string_of_yojson

let send_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     term_id = value_for_key term_id_of_yojson "termId" _list path;
     name = value_for_key payment_request_name_of_yojson "name" _list path;
     charge_amount =
       value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount" _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
   }
    : send_agreement_payment_request_input)

let agreement_cancellation_request_description_of_yojson = string_of_yojson

let agreement_cancellation_request_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCORRECT_TERMS_ACCEPTED" -> INCORRECT_TERMS_ACCEPTED
    | `String "REPLACING_AGREEMENT" -> REPLACING_AGREEMENT
    | `String "TEST_AGREEMENT" -> TEST_AGREEMENT
    | `String "ALTERNATIVE_PROCUREMENT_CHANNEL" -> ALTERNATIVE_PROCUREMENT_CHANNEL
    | `String "PRODUCT_DISCONTINUED" -> PRODUCT_DISCONTINUED
    | `String "UNINTENDED_RENEWAL" -> UNINTENDED_RENEWAL
    | `String "BUYER_DISSATISFACTION" -> BUYER_DISSATISFACTION
    | `String "OTHER" -> OTHER
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AgreementCancellationRequestReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementCancellationRequestReasonCode")
     : agreement_cancellation_request_reason_code)
    : agreement_cancellation_request_reason_code)

let agreement_cancellation_request_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_APPROVAL" -> PENDING_APPROVAL
    | `String "APPROVED" -> APPROVED
    | `String "REJECTED" -> REJECTED
    | `String "CANCELLED" -> CANCELLED
    | `String "VALIDATION_FAILED" -> VALIDATION_FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AgreementCancellationRequestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementCancellationRequestStatus")
     : agreement_cancellation_request_status)
    : agreement_cancellation_request_status)

let agreement_cancellation_request_id_of_yojson = string_of_yojson

let send_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : send_agreement_cancellation_request_output)

let send_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     reason_code =
       value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
   }
    : send_agreement_cancellation_request_input)

let next_token_of_yojson = string_of_yojson

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

let agreement_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTIVE" -> ACTIVE
    | `String "ARCHIVED" -> ARCHIVED
    | `String "CANCELLED" -> CANCELLED
    | `String "EXPIRED" -> EXPIRED
    | `String "RENEWED" -> RENEWED
    | `String "REPLACED" -> REPLACED
    | `String "ROLLED_BACK" -> ROLLED_BACK
    | `String "SUPERSEDED" -> SUPERSEDED
    | `String "TERMINATED" -> TERMINATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgreementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementStatus")
     : agreement_status)
    : agreement_status)

let offer_set_id_of_yojson = string_of_yojson
let offer_id_of_yojson = string_of_yojson
let agreement_resource_type_of_yojson = string_of_yojson

let resource_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     type_ = option_of_yojson (value_for_key agreement_resource_type_of_yojson "type") _list path;
   }
    : resource)

let resources_of_yojson tree path = list_of_yojson resource_of_yojson tree path

let proposal_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resources = option_of_yojson (value_for_key resources_of_yojson "resources") _list path;
     offer_id = option_of_yojson (value_for_key offer_id_of_yojson "offerId") _list path;
     offer_set_id = option_of_yojson (value_for_key offer_set_id_of_yojson "offerSetId") _list path;
   }
    : proposal_summary)

let proposer_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_id = option_of_yojson (value_for_key aws_account_id_of_yojson "accountId") _list path }
    : proposer)

let acceptor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_id = option_of_yojson (value_for_key aws_account_id_of_yojson "accountId") _list path }
    : acceptor)

let agreement_type_of_yojson = string_of_yojson

let agreement_view_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     acceptance_time =
       option_of_yojson (value_for_key timestamp_of_yojson "acceptanceTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     acceptor = option_of_yojson (value_for_key acceptor_of_yojson "acceptor") _list path;
     proposer = option_of_yojson (value_for_key proposer_of_yojson "proposer") _list path;
     proposal_summary =
       option_of_yojson (value_for_key proposal_summary_of_yojson "proposalSummary") _list path;
     status = option_of_yojson (value_for_key agreement_status_of_yojson "status") _list path;
     entitlements =
       option_of_yojson (value_for_key entitlement_list_of_yojson "entitlements") _list path;
   }
    : agreement_view_summary)

let agreement_view_summary_list_of_yojson tree path =
  list_of_yojson agreement_view_summary_of_yojson tree path

let search_agreements_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_view_summaries =
       option_of_yojson
         (value_for_key agreement_view_summary_list_of_yojson "agreementViewSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : search_agreements_output)

let max_results_of_yojson = int_of_yojson

let sort_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASCENDING" -> ASCENDING
    | `String "DESCENDING" -> DESCENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "SortOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "SortOrder")
     : sort_order)
    : sort_order)

let sort_by_of_yojson = string_of_yojson

let sort_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sort_by = option_of_yojson (value_for_key sort_by_of_yojson "sortBy") _list path;
     sort_order = option_of_yojson (value_for_key sort_order_of_yojson "sortOrder") _list path;
   }
    : sort)

let filter_value_of_yojson = string_of_yojson
let filter_value_list_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path
let filter_name_of_yojson = string_of_yojson

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key filter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key filter_value_list_of_yojson "values") _list path;
   }
    : filter)

let filter_list_of_yojson tree path = list_of_yojson filter_of_yojson tree path
let catalog_of_yojson = string_of_yojson

let search_agreements_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     filters = option_of_yojson (value_for_key filter_list_of_yojson "filters") _list path;
     sort = option_of_yojson (value_for_key sort_of_yojson "sort") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : search_agreements_input)

let payment_request_status_message_of_yojson = string_of_yojson

let reject_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     status_message =
       option_of_yojson
         (value_for_key payment_request_status_message_of_yojson "statusMessage")
         _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
   }
    : reject_agreement_payment_request_output)

let payment_request_rejection_reason_of_yojson = string_of_yojson

let reject_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id = value_for_key payment_request_id_of_yojson "paymentRequestId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     rejection_reason =
       option_of_yojson
         (value_for_key payment_request_rejection_reason_of_yojson "rejectionReason")
         _list path;
   }
    : reject_agreement_payment_request_input)

let agreement_cancellation_request_status_message_of_yojson = string_of_yojson

let reject_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     status_message =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_message_of_yojson "statusMessage")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : reject_agreement_cancellation_request_output)

let agreement_cancellation_request_rejection_reason_of_yojson = string_of_yojson

let reject_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     agreement_cancellation_request_id =
       value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId"
         _list path;
     rejection_reason =
       value_for_key agreement_cancellation_request_rejection_reason_of_yojson "rejectionReason"
         _list path;
   }
    : reject_agreement_cancellation_request_input)

let billing_adjustment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "VALIDATION_FAILED" -> VALIDATION_FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BillingAdjustmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingAdjustmentStatus")
     : billing_adjustment_status)
    : billing_adjustment_status)

let invoice_id_of_yojson = string_of_yojson
let billing_adjustment_request_id_of_yojson = string_of_yojson

let billing_adjustment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_adjustment_request_id =
       value_for_key billing_adjustment_request_id_of_yojson "billingAdjustmentRequestId" _list path;
     original_invoice_id = value_for_key invoice_id_of_yojson "originalInvoiceId" _list path;
     adjustment_amount =
       value_for_key positive_amount_upto8_decimals_of_yojson "adjustmentAmount" _list path;
     currency_code = value_for_key currency_code_of_yojson "currencyCode" _list path;
     status = value_for_key billing_adjustment_status_of_yojson "status" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     agreement_type = value_for_key agreement_type_of_yojson "agreementType" _list path;
     catalog = value_for_key catalog_of_yojson "catalog" _list path;
   }
    : billing_adjustment_summary)

let billing_adjustment_summary_list_of_yojson tree path =
  list_of_yojson billing_adjustment_summary_of_yojson tree path

let list_billing_adjustment_requests_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     items = value_for_key billing_adjustment_summary_list_of_yojson "items" _list path;
   }
    : list_billing_adjustment_requests_output)

let list_billing_adjustment_requests_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status =
       option_of_yojson (value_for_key billing_adjustment_status_of_yojson "status") _list path;
     created_after = option_of_yojson (value_for_key timestamp_of_yojson "createdAfter") _list path;
     created_before =
       option_of_yojson (value_for_key timestamp_of_yojson "createdBefore") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_billing_adjustment_requests_input)

let charge_id_of_yojson = string_of_yojson

let payment_request_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     charge_id = option_of_yojson (value_for_key charge_id_of_yojson "chargeId") _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
   }
    : payment_request_summary)

let payment_request_summary_list_of_yojson tree path =
  list_of_yojson payment_request_summary_of_yojson tree path

let list_agreement_payment_requests_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     items = value_for_key payment_request_summary_list_of_yojson "items" _list path;
   }
    : list_agreement_payment_requests_output)

let party_type_of_yojson = string_of_yojson

let list_agreement_payment_requests_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     party_type = value_for_key party_type_of_yojson "partyType" _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_agreement_payment_requests_input)

let invoicing_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     legal_name = option_of_yojson (value_for_key bounded_string_of_yojson "legalName") _list path;
     branch_name = option_of_yojson (value_for_key bounded_string_of_yojson "branchName") _list path;
   }
    : invoicing_entity)

let invoice_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVOICE" -> INVOICE
    | `String "CREDIT_MEMO" -> CREDIT_MEMO
    | `String value -> raise (deserialize_unknown_enum_value_error path "InvoiceType" value)
    | _ -> raise (deserialize_wrong_type_error path "InvoiceType")
     : invoice_type)
    : invoice_type)

let invoice_billing_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     month =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "month" _list path;
     year =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "year" _list path;
   }
    : invoice_billing_period)

let pricing_currency_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount = option_of_yojson (value_for_key bounded_string_of_yojson "amount") _list path;
     max_adjustment_amount =
       option_of_yojson (value_for_key bounded_string_of_yojson "maxAdjustmentAmount") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
   }
    : pricing_currency_amount)

let agreement_invoice_line_item_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     invoice_id = option_of_yojson (value_for_key resource_id_of_yojson "invoiceId") _list path;
     pricing_currency_amount =
       option_of_yojson
         (value_for_key pricing_currency_amount_of_yojson "pricingCurrencyAmount")
         _list path;
     invoice_billing_period =
       option_of_yojson
         (value_for_key invoice_billing_period_of_yojson "invoiceBillingPeriod")
         _list path;
     issued_time = option_of_yojson (value_for_key timestamp_of_yojson "issuedTime") _list path;
     invoice_type = option_of_yojson (value_for_key invoice_type_of_yojson "invoiceType") _list path;
     invoicing_entity =
       option_of_yojson (value_for_key invoicing_entity_of_yojson "invoicingEntity") _list path;
   }
    : agreement_invoice_line_item_group_summary)

let agreement_invoice_line_item_group_summaries_of_yojson tree path =
  list_of_yojson agreement_invoice_line_item_group_summary_of_yojson tree path

let list_agreement_invoice_line_items_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_invoice_line_item_group_summaries =
       option_of_yojson
         (value_for_key agreement_invoice_line_item_group_summaries_of_yojson
            "agreementInvoiceLineItemGroupSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
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
     agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path;
     group_by = value_for_key line_item_group_by_of_yojson "groupBy" _list path;
     invoice_id = option_of_yojson (value_for_key resource_id_of_yojson "invoiceId") _list path;
     invoice_type = option_of_yojson (value_for_key invoice_type_of_yojson "invoiceType") _list path;
     invoice_billing_period =
       option_of_yojson
         (value_for_key invoice_billing_period_of_yojson "invoiceBillingPeriod")
         _list path;
     before_issued_time =
       option_of_yojson (value_for_key timestamp_of_yojson "beforeIssuedTime") _list path;
     after_issued_time =
       option_of_yojson (value_for_key timestamp_of_yojson "afterIssuedTime") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_agreement_invoice_line_items_input)

let charge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     revision = option_of_yojson (value_for_key charge_revision_of_yojson "revision") _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     purchase_order_reference =
       option_of_yojson
         (value_for_key purchase_order_reference_of_yojson "purchaseOrderReference")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     amount = option_of_yojson (value_for_key bounded_string_of_yojson "amount") _list path;
     time = option_of_yojson (value_for_key timestamp_of_yojson "time") _list path;
   }
    : charge)

let charges_of_yojson tree path = list_of_yojson charge_of_yojson tree path

let list_agreement_charges_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = option_of_yojson (value_for_key charges_of_yojson "items") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_agreement_charges_output)

let list_agreement_charges_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_agreement_charges_input)

let agreement_cancellation_request_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : agreement_cancellation_request_summary)

let agreement_cancellation_request_summary_list_of_yojson tree path =
  list_of_yojson agreement_cancellation_request_summary_of_yojson tree path

let list_agreement_cancellation_requests_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson
         (value_for_key agreement_cancellation_request_summary_list_of_yojson "items")
         _list path;
   }
    : list_agreement_cancellation_requests_output)

let list_agreement_cancellation_requests_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     party_type = value_for_key party_type_of_yojson "partyType" _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     catalog = option_of_yojson (value_for_key catalog_of_yojson "catalog") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_agreement_cancellation_requests_input)

let billing_adjustment_status_message_of_yojson = string_of_yojson

let billing_adjustment_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INCORRECT_TERMS_ACCEPTED" -> INCORRECT_TERMS_ACCEPTED
    | `String "INCORRECT_METERING" -> INCORRECT_METERING
    | `String "TEST_ENVIRONMENT_CHARGES" -> TEST_ENVIRONMENT_CHARGES
    | `String "ALTERNATIVE_PROCUREMENT_CHANNEL" -> ALTERNATIVE_PROCUREMENT_CHANNEL
    | `String "UNINTENDED_RENEWAL" -> UNINTENDED_RENEWAL
    | `String "BUYER_DISSATISFACTION" -> BUYER_DISSATISFACTION
    | `String "OTHER" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BillingAdjustmentReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingAdjustmentReasonCode")
     : billing_adjustment_reason_code)
    : billing_adjustment_reason_code)

let get_billing_adjustment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_adjustment_request_id =
       value_for_key billing_adjustment_request_id_of_yojson "billingAdjustmentRequestId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     adjustment_reason_code =
       value_for_key billing_adjustment_reason_code_of_yojson "adjustmentReasonCode" _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     original_invoice_id = value_for_key invoice_id_of_yojson "originalInvoiceId" _list path;
     adjustment_amount =
       value_for_key positive_amount_upto8_decimals_of_yojson "adjustmentAmount" _list path;
     currency_code = value_for_key currency_code_of_yojson "currencyCode" _list path;
     status = value_for_key billing_adjustment_status_of_yojson "status" _list path;
     status_message =
       option_of_yojson
         (value_for_key billing_adjustment_status_message_of_yojson "statusMessage")
         _list path;
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
   }
    : get_billing_adjustment_request_output)

let get_billing_adjustment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     billing_adjustment_request_id =
       value_for_key billing_adjustment_request_id_of_yojson "billingAdjustmentRequestId" _list path;
   }
    : get_billing_adjustment_request_input)

let iso8601_duration_of_yojson = string_of_yojson

let payment_request_approval_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTO_APPROVE_ON_EXPIRATION" -> AUTO_APPROVE_ON_EXPIRATION
    | `String "WAIT_FOR_APPROVAL" -> WAIT_FOR_APPROVAL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PaymentRequestApprovalStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "PaymentRequestApprovalStrategy")
     : payment_request_approval_strategy)
    : payment_request_approval_strategy)

let variable_payment_term_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_approval_strategy =
       value_for_key payment_request_approval_strategy_of_yojson "paymentRequestApprovalStrategy"
         _list path;
     expiration_duration =
       option_of_yojson (value_for_key iso8601_duration_of_yojson "expirationDuration") _list path;
   }
    : variable_payment_term_configuration)

let unversioned_term_type_of_yojson = string_of_yojson

let variable_payment_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     max_total_charge_amount =
       option_of_yojson (value_for_key bounded_string_of_yojson "maxTotalChargeAmount") _list path;
     configuration =
       option_of_yojson
         (value_for_key variable_payment_term_configuration_of_yojson "configuration")
         _list path;
   }
    : variable_payment_term)

let positive_integer_with_default_value_one_of_yojson = int_of_yojson

let grant_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_key =
       option_of_yojson (value_for_key bounded_string_of_yojson "dimensionKey") _list path;
     max_quantity =
       option_of_yojson
         (value_for_key positive_integer_with_default_value_one_of_yojson "maxQuantity")
         _list path;
   }
    : grant_item)

let grant_list_of_yojson tree path = list_of_yojson grant_item_of_yojson tree path

let fixed_upfront_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     duration = option_of_yojson (value_for_key bounded_string_of_yojson "duration") _list path;
     price = option_of_yojson (value_for_key bounded_string_of_yojson "price") _list path;
     grants = option_of_yojson (value_for_key grant_list_of_yojson "grants") _list path;
   }
    : fixed_upfront_pricing_term)

let free_trial_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     duration = option_of_yojson (value_for_key bounded_string_of_yojson "duration") _list path;
     grants = option_of_yojson (value_for_key grant_list_of_yojson "grants") _list path;
   }
    : free_trial_pricing_term)

let schedule_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     charge_date = option_of_yojson (value_for_key timestamp_of_yojson "chargeDate") _list path;
     charge_amount =
       option_of_yojson (value_for_key bounded_string_of_yojson "chargeAmount") _list path;
   }
    : schedule_item)

let schedule_list_of_yojson tree path = list_of_yojson schedule_item_of_yojson tree path

let payment_schedule_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     schedule = option_of_yojson (value_for_key schedule_list_of_yojson "schedule") _list path;
   }
    : payment_schedule_term)

let validity_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     agreement_duration =
       option_of_yojson (value_for_key bounded_string_of_yojson "agreementDuration") _list path;
     agreement_start_date =
       option_of_yojson (value_for_key timestamp_of_yojson "agreementStartDate") _list path;
     agreement_end_date =
       option_of_yojson (value_for_key timestamp_of_yojson "agreementEndDate") _list path;
   }
    : validity_term)

let recurring_payment_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     billing_period =
       option_of_yojson (value_for_key bounded_string_of_yojson "billingPeriod") _list path;
     price = option_of_yojson (value_for_key bounded_string_of_yojson "price") _list path;
   }
    : recurring_payment_term)

let byol_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
   }
    : byol_pricing_term)

let zero_value_integer_of_yojson = int_of_yojson

let dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_key = value_for_key bounded_string_of_yojson "dimensionKey" _list path;
     dimension_value = value_for_key zero_value_integer_of_yojson "dimensionValue" _list path;
   }
    : dimension)

let dimension_list_of_yojson tree path = list_of_yojson dimension_of_yojson tree path

let configurable_upfront_pricing_term_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selector_value = value_for_key bounded_string_of_yojson "selectorValue" _list path;
     dimensions = value_for_key dimension_list_of_yojson "dimensions" _list path;
   }
    : configurable_upfront_pricing_term_configuration)

let rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_key =
       option_of_yojson (value_for_key bounded_string_of_yojson "dimensionKey") _list path;
     price = option_of_yojson (value_for_key bounded_string_of_yojson "price") _list path;
   }
    : rate_card_item)

let rate_card_list_of_yojson tree path = list_of_yojson rate_card_item_of_yojson tree path

let constraints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multiple_dimension_selection =
       option_of_yojson
         (value_for_key bounded_string_of_yojson "multipleDimensionSelection")
         _list path;
     quantity_configuration =
       option_of_yojson (value_for_key bounded_string_of_yojson "quantityConfiguration") _list path;
   }
    : constraints)

let selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key bounded_string_of_yojson "type") _list path;
     value = option_of_yojson (value_for_key bounded_string_of_yojson "value") _list path;
   }
    : selector)

let configurable_upfront_rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selector = option_of_yojson (value_for_key selector_of_yojson "selector") _list path;
     constraints = option_of_yojson (value_for_key constraints_of_yojson "constraints") _list path;
     rate_card = option_of_yojson (value_for_key rate_card_list_of_yojson "rateCard") _list path;
   }
    : configurable_upfront_rate_card_item)

let configurable_upfront_rate_card_list_of_yojson tree path =
  list_of_yojson configurable_upfront_rate_card_item_of_yojson tree path

let configurable_upfront_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     rate_cards =
       option_of_yojson
         (value_for_key configurable_upfront_rate_card_list_of_yojson "rateCards")
         _list path;
     configuration =
       option_of_yojson
         (value_for_key configurable_upfront_pricing_term_configuration_of_yojson "configuration")
         _list path;
   }
    : configurable_upfront_pricing_term)

let usage_based_rate_card_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rate_card = option_of_yojson (value_for_key rate_card_list_of_yojson "rateCard") _list path }
    : usage_based_rate_card_item)

let usage_based_rate_card_list_of_yojson tree path =
  list_of_yojson usage_based_rate_card_item_of_yojson tree path

let usage_based_pricing_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     rate_cards =
       option_of_yojson (value_for_key usage_based_rate_card_list_of_yojson "rateCards") _list path;
   }
    : usage_based_pricing_term)

let boolean__of_yojson = bool_of_yojson

let renewal_term_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ enable_auto_renew = value_for_key boolean__of_yojson "enableAutoRenew" _list path }
    : renewal_term_configuration)

let renewal_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     configuration =
       option_of_yojson
         (value_for_key renewal_term_configuration_of_yojson "configuration")
         _list path;
   }
    : renewal_term)

let support_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     refund_policy =
       option_of_yojson (value_for_key bounded_string_of_yojson "refundPolicy") _list path;
   }
    : support_term)

let document_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key bounded_string_of_yojson "type") _list path;
     url = option_of_yojson (value_for_key bounded_string_of_yojson "url") _list path;
     version = option_of_yojson (value_for_key bounded_string_of_yojson "version") _list path;
   }
    : document_item)

let document_list_of_yojson tree path = list_of_yojson document_item_of_yojson tree path

let legal_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key unversioned_term_type_of_yojson "type") _list path;
     id = option_of_yojson (value_for_key term_id_of_yojson "id") _list path;
     documents = option_of_yojson (value_for_key document_list_of_yojson "documents") _list path;
   }
    : legal_term)

let accepted_term_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "legalTerm" -> LegalTerm (legal_term_of_yojson value_ path)
   | "supportTerm" -> SupportTerm (support_term_of_yojson value_ path)
   | "renewalTerm" -> RenewalTerm (renewal_term_of_yojson value_ path)
   | "usageBasedPricingTerm" ->
       UsageBasedPricingTerm (usage_based_pricing_term_of_yojson value_ path)
   | "configurableUpfrontPricingTerm" ->
       ConfigurableUpfrontPricingTerm (configurable_upfront_pricing_term_of_yojson value_ path)
   | "byolPricingTerm" -> ByolPricingTerm (byol_pricing_term_of_yojson value_ path)
   | "recurringPaymentTerm" -> RecurringPaymentTerm (recurring_payment_term_of_yojson value_ path)
   | "validityTerm" -> ValidityTerm (validity_term_of_yojson value_ path)
   | "paymentScheduleTerm" -> PaymentScheduleTerm (payment_schedule_term_of_yojson value_ path)
   | "freeTrialPricingTerm" -> FreeTrialPricingTerm (free_trial_pricing_term_of_yojson value_ path)
   | "fixedUpfrontPricingTerm" ->
       FixedUpfrontPricingTerm (fixed_upfront_pricing_term_of_yojson value_ path)
   | "variablePaymentTerm" -> VariablePaymentTerm (variable_payment_term_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "AcceptedTerm" unknown)
    : accepted_term)

let accepted_term_list_of_yojson tree path = list_of_yojson accepted_term_of_yojson tree path

let get_agreement_terms_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accepted_terms =
       option_of_yojson (value_for_key accepted_term_list_of_yojson "acceptedTerms") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_agreement_terms_output)

let get_agreement_terms_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_agreement_terms_input)

let get_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     status_message =
       option_of_yojson
         (value_for_key payment_request_status_message_of_yojson "statusMessage")
         _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     charge_id = option_of_yojson (value_for_key charge_id_of_yojson "chargeId") _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
   }
    : get_agreement_payment_request_output)

let get_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id = value_for_key payment_request_id_of_yojson "paymentRequestId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : get_agreement_payment_request_input)

let aws_arn_of_yojson = string_of_yojson

let agreement_entitlement_status_reason_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROVISIONING_IN_PROGRESS" -> PROVISIONING_IN_PROGRESS
    | `String "FUTURE_START_DATE" -> FUTURE_START_DATE
    | `String "INVALID_PAYMENT_INSTRUMENT" -> INVALID_PAYMENT_INSTRUMENT
    | `String "INCOMPATIBLE_CURRENCY" -> INCOMPATIBLE_CURRENCY
    | `String "ACCOUNT_SUSPENDED" -> ACCOUNT_SUSPENDED
    | `String "UNSUPPORTED_OPERATION" -> UNSUPPORTED_OPERATION
    | `String "AGREEMENT_INACTIVE" -> AGREEMENT_INACTIVE
    | `String "AGREEMENT_ACTIVE" -> AGREEMENT_ACTIVE
    | `String "PRODUCT_RESTRICTED" -> PRODUCT_RESTRICTED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AgreementEntitlementStatusReasonCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementEntitlementStatusReasonCode")
     : agreement_entitlement_status_reason_code)
    : agreement_entitlement_status_reason_code)

let agreement_entitlement_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROVISIONED" -> PROVISIONED
    | `String "SCHEDULED" -> SCHEDULED
    | `String "PENDING" -> PENDING
    | `String "FAILED" -> FAILED
    | `String "DEPROVISIONED" -> DEPROVISIONED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AgreementEntitlementStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgreementEntitlementStatus")
     : agreement_entitlement_status)
    : agreement_entitlement_status)

let registration_token_of_yojson = string_of_yojson
let entitlement_type_of_yojson = string_of_yojson

let agreement_entitlement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource = option_of_yojson (value_for_key resource_of_yojson "resource") _list path;
     type_ = option_of_yojson (value_for_key entitlement_type_of_yojson "type") _list path;
     registration_token =
       option_of_yojson (value_for_key registration_token_of_yojson "registrationToken") _list path;
     status =
       option_of_yojson (value_for_key agreement_entitlement_status_of_yojson "status") _list path;
     status_reason_code =
       option_of_yojson
         (value_for_key agreement_entitlement_status_reason_code_of_yojson "statusReasonCode")
         _list path;
     license_arn = option_of_yojson (value_for_key aws_arn_of_yojson "licenseArn") _list path;
   }
    : agreement_entitlement)

let agreement_entitlement_list_of_yojson tree path =
  list_of_yojson agreement_entitlement_of_yojson tree path

let get_agreement_entitlements_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_entitlements =
       option_of_yojson
         (value_for_key agreement_entitlement_list_of_yojson "agreementEntitlements")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_agreement_entitlements_output)

let get_agreement_entitlements_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : get_agreement_entitlements_input)

let get_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     status_message =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_message_of_yojson "statusMessage")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : get_agreement_cancellation_request_output)

let get_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_cancellation_request_id =
       value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId"
         _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : get_agreement_cancellation_request_input)

let estimated_charges_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     agreement_value =
       option_of_yojson (value_for_key bounded_string_of_yojson "agreementValue") _list path;
   }
    : estimated_charges)

let describe_agreement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = option_of_yojson (value_for_key resource_id_of_yojson "agreementId") _list path;
     acceptor = option_of_yojson (value_for_key acceptor_of_yojson "acceptor") _list path;
     proposer = option_of_yojson (value_for_key proposer_of_yojson "proposer") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     acceptance_time =
       option_of_yojson (value_for_key timestamp_of_yojson "acceptanceTime") _list path;
     agreement_type =
       option_of_yojson (value_for_key agreement_type_of_yojson "agreementType") _list path;
     estimated_charges =
       option_of_yojson (value_for_key estimated_charges_of_yojson "estimatedCharges") _list path;
     proposal_summary =
       option_of_yojson (value_for_key proposal_summary_of_yojson "proposalSummary") _list path;
     status = option_of_yojson (value_for_key agreement_status_of_yojson "status") _list path;
   }
    : describe_agreement_output)

let describe_agreement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path }
    : describe_agreement_input)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
     message = option_of_yojson (value_for_key exception_message_of_yojson "message") _list path;
     quota_code = option_of_yojson (value_for_key bounded_string_of_yojson "quotaCode") _list path;
     service_code =
       option_of_yojson (value_for_key bounded_string_of_yojson "serviceCode") _list path;
     resource_type =
       option_of_yojson (value_for_key bounded_string_of_yojson "resourceType") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
   }
    : service_quota_exceeded_exception)

let itemized_charge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_key =
       option_of_yojson (value_for_key bounded_string_of_yojson "dimensionKey") _list path;
     new_quantity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "newQuantity")
         _list path;
     old_quantity =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "oldQuantity")
         _list path;
     charge_reference =
       option_of_yojson (value_for_key resource_id_of_yojson "chargeReference") _list path;
     incremental_charge_amount =
       option_of_yojson
         (value_for_key bounded_string_of_yojson "incrementalChargeAmount")
         _list path;
   }
    : itemized_charge)

let itemized_charge_list_of_yojson tree path = list_of_yojson itemized_charge_of_yojson tree path

let tax_breakdown_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount = option_of_yojson (value_for_key bounded_string_of_yojson "amount") _list path;
     rate = option_of_yojson (value_for_key bounded_string_of_yojson "rate") _list path;
     type_ = option_of_yojson (value_for_key bounded_string_of_yojson "type") _list path;
   }
    : tax_breakdown_item)

let tax_breakdown_of_yojson tree path = list_of_yojson tax_breakdown_item_of_yojson tree path

let estimated_taxes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     breakdown = option_of_yojson (value_for_key tax_breakdown_of_yojson "breakdown") _list path;
     total_amount =
       option_of_yojson (value_for_key bounded_string_of_yojson "totalAmount") _list path;
   }
    : estimated_taxes)

let timing_of_yojson (tree : t) path =
  ((match tree with
    | `String "ON_ACCEPTANCE" -> ON_ACCEPTANCE
    | `String "SCHEDULED" -> SCHEDULED
    | `String "BILLING_PERIOD" -> BILLING_PERIOD
    | `String value -> raise (deserialize_unknown_enum_value_error path "Timing" value)
    | _ -> raise (deserialize_wrong_type_error path "Timing")
     : timing)
    : timing)

let expected_charge_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     time = option_of_yojson (value_for_key timestamp_of_yojson "time") _list path;
     amount = option_of_yojson (value_for_key bounded_string_of_yojson "amount") _list path;
     amount_after_tax =
       option_of_yojson (value_for_key bounded_string_of_yojson "amountAfterTax") _list path;
     timing = option_of_yojson (value_for_key timing_of_yojson "timing") _list path;
     estimated_taxes =
       option_of_yojson (value_for_key estimated_taxes_of_yojson "estimatedTaxes") _list path;
   }
    : expected_charge)

let expected_charge_list_of_yojson tree path = list_of_yojson expected_charge_of_yojson tree path

let charge_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     new_agreement_value =
       option_of_yojson (value_for_key bounded_string_of_yojson "newAgreementValue") _list path;
     new_agreement_value_after_tax =
       option_of_yojson
         (value_for_key bounded_string_of_yojson "newAgreementValueAfterTax")
         _list path;
     expected_charges =
       option_of_yojson (value_for_key expected_charge_list_of_yojson "expectedCharges") _list path;
     estimated_taxes =
       option_of_yojson (value_for_key estimated_taxes_of_yojson "estimatedTaxes") _list path;
     itemized_charges =
       option_of_yojson (value_for_key itemized_charge_list_of_yojson "itemizedCharges") _list path;
     invoicing_entity =
       option_of_yojson (value_for_key invoicing_entity_of_yojson "invoicingEntity") _list path;
   }
    : charge_summary)

let agreement_request_id_of_yojson = string_of_yojson

let create_agreement_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_request_id =
       option_of_yojson
         (value_for_key agreement_request_id_of_yojson "agreementRequestId")
         _list path;
     charge_summary =
       option_of_yojson (value_for_key charge_summary_of_yojson "chargeSummary") _list path;
   }
    : create_agreement_request_output)

let tax_estimation_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
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

let agreement_proposal_id_of_yojson = string_of_yojson

let requested_term_configuration_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "configurableUpfrontPricingTermConfiguration" ->
       ConfigurableUpfrontPricingTermConfiguration
         (configurable_upfront_pricing_term_configuration_of_yojson value_ path)
   | "renewalTermConfiguration" ->
       RenewalTermConfiguration (renewal_term_configuration_of_yojson value_ path)
   | "variablePaymentTermConfiguration" ->
       VariablePaymentTermConfiguration (variable_payment_term_configuration_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "RequestedTermConfiguration" unknown)
    : requested_term_configuration)

let requested_term_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id = value_for_key term_id_of_yojson "id" _list path;
     configuration =
       option_of_yojson
         (value_for_key requested_term_configuration_of_yojson "configuration")
         _list path;
   }
    : requested_term)

let requested_term_list_of_yojson tree path = list_of_yojson requested_term_of_yojson tree path

let intent_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW" -> NEW
    | `String "AMEND" -> AMEND
    | `String "REPLACE" -> REPLACE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Intent" value)
    | _ -> raise (deserialize_wrong_type_error path "Intent")
     : intent)
    : intent)

let create_agreement_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     intent = value_for_key intent_of_yojson "intent" _list path;
     requested_terms = value_for_key requested_term_list_of_yojson "requestedTerms" _list path;
     source_agreement_identifier =
       option_of_yojson (value_for_key resource_id_of_yojson "sourceAgreementIdentifier") _list path;
     agreement_proposal_identifier =
       option_of_yojson
         (value_for_key agreement_proposal_id_of_yojson "agreementProposalIdentifier")
         _list path;
     tax_configuration =
       option_of_yojson (value_for_key tax_configuration_of_yojson "taxConfiguration") _list path;
   }
    : create_agreement_request_input)

let cancel_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : cancel_agreement_payment_request_output)

let cancel_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id = value_for_key payment_request_id_of_yojson "paymentRequestId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
   }
    : cancel_agreement_payment_request_input)

let cancel_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     status_message =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_message_of_yojson "statusMessage")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : cancel_agreement_cancellation_request_output)

let agreement_cancellation_request_cancellation_reason_of_yojson = string_of_yojson

let cancel_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     agreement_cancellation_request_id =
       value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId"
         _list path;
     cancellation_reason =
       value_for_key agreement_cancellation_request_cancellation_reason_of_yojson
         "cancellationReason" _list path;
   }
    : cancel_agreement_cancellation_request_input)

let cancel_agreement_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_agreement_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agreement_id = value_for_key resource_id_of_yojson "agreementId" _list path }
    : cancel_agreement_input)

let billing_adjustment_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONFLICT_EXCEPTION" -> CONFLICT_EXCEPTION
    | `String "VALIDATION_EXCEPTION" -> VALIDATION_EXCEPTION
    | `String "RESOURCE_NOT_FOUND_EXCEPTION" -> RESOURCE_NOT_FOUND_EXCEPTION
    | `String "INTERNAL_FAILURE" -> INTERNAL_FAILURE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BillingAdjustmentErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingAdjustmentErrorCode")
     : billing_adjustment_error_code)
    : billing_adjustment_error_code)

let batch_create_billing_adjustment_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     code = value_for_key billing_adjustment_error_code_of_yojson "code" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
   }
    : batch_create_billing_adjustment_error)

let batch_create_billing_adjustment_error_list_of_yojson tree path =
  list_of_yojson batch_create_billing_adjustment_error_of_yojson tree path

let batch_create_billing_adjustment_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_adjustment_request_id =
       value_for_key billing_adjustment_request_id_of_yojson "billingAdjustmentRequestId" _list path;
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
   }
    : batch_create_billing_adjustment_item)

let batch_create_billing_adjustment_item_list_of_yojson tree path =
  list_of_yojson batch_create_billing_adjustment_item_of_yojson tree path

let batch_create_billing_adjustment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     items = value_for_key batch_create_billing_adjustment_item_list_of_yojson "items" _list path;
     errors = value_for_key batch_create_billing_adjustment_error_list_of_yojson "errors" _list path;
   }
    : batch_create_billing_adjustment_request_output)

let billing_adjustment_description_of_yojson = string_of_yojson

let batch_create_billing_adjustment_request_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     original_invoice_id = value_for_key invoice_id_of_yojson "originalInvoiceId" _list path;
     adjustment_amount =
       value_for_key positive_amount_upto8_decimals_of_yojson "adjustmentAmount" _list path;
     currency_code = value_for_key currency_code_of_yojson "currencyCode" _list path;
     adjustment_reason_code =
       value_for_key billing_adjustment_reason_code_of_yojson "adjustmentReasonCode" _list path;
     description =
       option_of_yojson
         (value_for_key billing_adjustment_description_of_yojson "description")
         _list path;
     client_token = value_for_key client_token_of_yojson "clientToken" _list path;
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
     agreement_request_id =
       value_for_key agreement_request_id_of_yojson "agreementRequestId" _list path;
     purchase_orders =
       option_of_yojson (value_for_key purchase_orders_of_yojson "purchaseOrders") _list path;
   }
    : accept_agreement_request_input)

let accept_agreement_payment_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id =
       option_of_yojson (value_for_key payment_request_id_of_yojson "paymentRequestId") _list path;
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     status = option_of_yojson (value_for_key payment_request_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key payment_request_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key payment_request_description_of_yojson "description")
         _list path;
     charge_amount =
       option_of_yojson
         (value_for_key positive_amount_upto8_decimals_of_yojson "chargeAmount")
         _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "currencyCode") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
   }
    : accept_agreement_payment_request_output)

let accept_agreement_payment_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payment_request_id = value_for_key payment_request_id_of_yojson "paymentRequestId" _list path;
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     purchase_order_reference =
       option_of_yojson
         (value_for_key purchase_order_reference_of_yojson "purchaseOrderReference")
         _list path;
   }
    : accept_agreement_payment_request_input)

let accept_agreement_cancellation_request_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = option_of_yojson (value_for_key agreement_id_of_yojson "agreementId") _list path;
     agreement_cancellation_request_id =
       option_of_yojson
         (value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId")
         _list path;
     status =
       option_of_yojson
         (value_for_key agreement_cancellation_request_status_of_yojson "status")
         _list path;
     reason_code =
       option_of_yojson
         (value_for_key agreement_cancellation_request_reason_code_of_yojson "reasonCode")
         _list path;
     description =
       option_of_yojson
         (value_for_key agreement_cancellation_request_description_of_yojson "description")
         _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "updatedAt") _list path;
   }
    : accept_agreement_cancellation_request_output)

let accept_agreement_cancellation_request_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agreement_id = value_for_key agreement_id_of_yojson "agreementId" _list path;
     agreement_cancellation_request_id =
       value_for_key agreement_cancellation_request_id_of_yojson "agreementCancellationRequestId"
         _list path;
   }
    : accept_agreement_cancellation_request_input)
