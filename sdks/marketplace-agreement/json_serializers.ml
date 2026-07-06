open Smaws_Lib.Json.SerializeHelpers
open Types

let zero_value_integer_to_yojson = int_to_yojson

let payment_request_approval_strategy_to_yojson (x : payment_request_approval_strategy) =
  match x with
  | WAIT_FOR_APPROVAL -> `String "WAIT_FOR_APPROVAL"
  | AUTO_APPROVE_ON_EXPIRATION -> `String "AUTO_APPROVE_ON_EXPIRATION"

let iso8601_duration_to_yojson = string_to_yojson

let variable_payment_term_configuration_to_yojson (x : variable_payment_term_configuration) =
  assoc_to_yojson
    [
      ("expirationDuration", option_to_yojson iso8601_duration_to_yojson x.expiration_duration);
      ( "paymentRequestApprovalStrategy",
        Some (payment_request_approval_strategy_to_yojson x.payment_request_approval_strategy) );
    ]

let unversioned_term_type_to_yojson = string_to_yojson
let term_id_to_yojson = string_to_yojson
let currency_code_to_yojson = string_to_yojson
let bounded_string_to_yojson = string_to_yojson

let variable_payment_term_to_yojson (x : variable_payment_term) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson variable_payment_term_configuration_to_yojson x.configuration );
      ("maxTotalChargeAmount", option_to_yojson bounded_string_to_yojson x.max_total_charge_amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let validity_term_to_yojson (x : validity_term) =
  assoc_to_yojson
    [
      ("agreementEndDate", option_to_yojson timestamp_to_yojson x.agreement_end_date);
      ("agreementStartDate", option_to_yojson timestamp_to_yojson x.agreement_start_date);
      ("agreementDuration", option_to_yojson bounded_string_to_yojson x.agreement_duration);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | MISSING_PURCHASE_ORDER_REFERENCE -> `String "MISSING_PURCHASE_ORDER_REFERENCE"
  | DUPLICATE_AGREEMENT_IN_ORGANIZATION -> `String "DUPLICATE_AGREEMENT_IN_ORGANIZATION"
  | UNSUPPORTED_ACCOUNT_PLAN -> `String "UNSUPPORTED_ACCOUNT_PLAN"
  | DUPLICATE_CHARGES -> `String "DUPLICATE_CHARGES"
  | OTHER -> `String "OTHER"
  | INVALID_PAYMENT_REQUEST_STATUS -> `String "INVALID_PAYMENT_REQUEST_STATUS"
  | INVALID_REJECTION_REASON -> `String "INVALID_REJECTION_REASON"
  | UNSUPPORTED_ACTION -> `String "UNSUPPORTED_ACTION"
  | MISSING_ACCOUNT_ADDRESS -> `String "MISSING_ACCOUNT_ADDRESS"
  | INVALID_INCREMENTAL_CHARGE -> `String "INVALID_INCREMENTAL_CHARGE"
  | MISSING_USAGE_AGREEMENT -> `String "MISSING_USAGE_AGREEMENT"
  | INCOMPATIBLE_TERMS -> `String "INCOMPATIBLE_TERMS"
  | MISSING_MANDATORY_TERMS -> `String "MISSING_MANDATORY_TERMS"
  | EXPIRED_AGREEMENT_PROPOSAL -> `String "EXPIRED_AGREEMENT_PROPOSAL"
  | SUPERSEDED_AGREEMENT_PROPOSAL -> `String "SUPERSEDED_AGREEMENT_PROPOSAL"
  | INACTIVE_AGREEMENT -> `String "INACTIVE_AGREEMENT"
  | INVALID_PURCHASE_ORDER_REFERENCE -> `String "INVALID_PURCHASE_ORDER_REFERENCE"
  | INVALID_AGREEMENT_TYPE -> `String "INVALID_AGREEMENT_TYPE"
  | MISSING_CHARGE_REVISION -> `String "MISSING_CHARGE_REVISION"
  | INVALID_CHARGE_REVISION -> `String "INVALID_CHARGE_REVISION"
  | MISSING_CHARGE_ID -> `String "MISSING_CHARGE_ID"
  | INVALID_CHARGE_ID -> `String "INVALID_CHARGE_ID"
  | MISSING_PURCHASE_ORDERS -> `String "MISSING_PURCHASE_ORDERS"
  | INVALID_PURCHASE_ORDERS -> `String "INVALID_PURCHASE_ORDERS"
  | MISSING_AGREEMENT_REQUEST_ID -> `String "MISSING_AGREEMENT_REQUEST_ID"
  | INVALID_AGREEMENT_REQUEST_ID -> `String "INVALID_AGREEMENT_REQUEST_ID"
  | MISSING_REQUESTED_TERM_CONFIGURATION -> `String "MISSING_REQUESTED_TERM_CONFIGURATION"
  | INVALID_REQUESTED_TERM_CONFIGURATION -> `String "INVALID_REQUESTED_TERM_CONFIGURATION"
  | MISSING_REQUESTED_TERM_ID -> `String "MISSING_REQUESTED_TERM_ID"
  | INVALID_REQUESTED_TERM_ID -> `String "INVALID_REQUESTED_TERM_ID"
  | MISSING_REQUESTED_TERMS -> `String "MISSING_REQUESTED_TERMS"
  | INVALID_REQUESTED_TERMS -> `String "INVALID_REQUESTED_TERMS"
  | MISSING_AGREEMENT_PROPOSAL_IDENTIFIER -> `String "MISSING_AGREEMENT_PROPOSAL_IDENTIFIER"
  | INVALID_AGREEMENT_PROPOSAL_IDENTIFIER -> `String "INVALID_AGREEMENT_PROPOSAL_IDENTIFIER"
  | MISSING_SOURCE_AGREEMENT_IDENTIFIER -> `String "MISSING_SOURCE_AGREEMENT_IDENTIFIER"
  | INVALID_SOURCE_AGREEMENT_IDENTIFIER -> `String "INVALID_SOURCE_AGREEMENT_IDENTIFIER"
  | MISSING_INTENT -> `String "MISSING_INTENT"
  | INVALID_INTENT -> `String "INVALID_INTENT"
  | INVALID_CLIENT_TOKEN -> `String "INVALID_CLIENT_TOKEN"
  | UNSUPPORTED_FILTERS -> `String "UNSUPPORTED_FILTERS"
  | INVALID_PARTY_TYPE -> `String "INVALID_PARTY_TYPE"
  | MISSING_PARTY_TYPE -> `String "MISSING_PARTY_TYPE"
  | INVALID_PAYMENT_REQUEST_ID -> `String "INVALID_PAYMENT_REQUEST_ID"
  | MISSING_PAYMENT_REQUEST_ID -> `String "MISSING_PAYMENT_REQUEST_ID"
  | INVALID_CHARGE_AMOUNT -> `String "INVALID_CHARGE_AMOUNT"
  | MISSING_CHARGE_AMOUNT -> `String "MISSING_CHARGE_AMOUNT"
  | INVALID_DESCRIPTION -> `String "INVALID_DESCRIPTION"
  | INVALID_NAME -> `String "INVALID_NAME"
  | MISSING_NAME -> `String "MISSING_NAME"
  | MISSING_TERM_ID -> `String "MISSING_TERM_ID"
  | INVALID_TERM_ID -> `String "INVALID_TERM_ID"
  | INVALID_MAX_RESULTS -> `String "INVALID_MAX_RESULTS"
  | INVALID_NEXT_TOKEN -> `String "INVALID_NEXT_TOKEN"
  | INVALID_SORT_ORDER -> `String "INVALID_SORT_ORDER"
  | INVALID_SORT_BY -> `String "INVALID_SORT_BY"
  | MISSING_FILTER_VALUES -> `String "MISSING_FILTER_VALUES"
  | INVALID_FILTER_VALUES -> `String "INVALID_FILTER_VALUES"
  | MISSING_FILTER_NAME -> `String "MISSING_FILTER_NAME"
  | INVALID_FILTER_NAME -> `String "INVALID_FILTER_NAME"
  | INVALID_FILTERS -> `String "INVALID_FILTERS"
  | INVALID_CATALOG -> `String "INVALID_CATALOG"
  | MISSING_AGREEMENT_ID -> `String "MISSING_AGREEMENT_ID"
  | INVALID_AGREEMENT_ID -> `String "INVALID_AGREEMENT_ID"
  | INVALID_STATUS -> `String "INVALID_STATUS"
  | INVALID_REASON -> `String "INVALID_REASON"
  | MISSING_REASON -> `String "MISSING_REASON"
  | MISSING_AGREEMENT_CANCELLATION_REQUEST_ID -> `String "MISSING_AGREEMENT_CANCELLATION_REQUEST_ID"
  | INVALID_AGREEMENT_CANCELLATION_REQUEST_ID -> `String "INVALID_AGREEMENT_CANCELLATION_REQUEST_ID"
  | MULTIPLE_AGREEMENT_IDS -> `String "MULTIPLE_AGREEMENT_IDS"
  | MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY -> `String "MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY"
  | EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT -> `String "EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT"
  | MISSING_CURRENCY_CODE -> `String "MISSING_CURRENCY_CODE"
  | INVALID_CURRENCY_CODE -> `String "INVALID_CURRENCY_CODE"
  | INVALID_INVOICE_ADJUSTMENT_PERIOD -> `String "INVALID_INVOICE_ADJUSTMENT_PERIOD"
  | MISSING_DESCRIPTION -> `String "MISSING_DESCRIPTION"
  | MISSING_REASON_CODE -> `String "MISSING_REASON_CODE"
  | INVALID_REASON_CODE -> `String "INVALID_REASON_CODE"
  | MISSING_ADJUSTMENT_AMOUNT -> `String "MISSING_ADJUSTMENT_AMOUNT"
  | INVALID_ADJUSTMENT_AMOUNT -> `String "INVALID_ADJUSTMENT_AMOUNT"
  | MISSING_INVOICE_ID -> `String "MISSING_INVOICE_ID"
  | BILLING_ADJUSTMENTS_LIMIT_EXCEEDED -> `String "BILLING_ADJUSTMENTS_LIMIT_EXCEEDED"
  | MISSING_BILLING_ADJUSTMENTS -> `String "MISSING_BILLING_ADJUSTMENTS"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (bounded_string_to_yojson x.message));
      ("name", Some (bounded_string_to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let request_id_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let rate_card_item_to_yojson (x : rate_card_item) =
  assoc_to_yojson
    [
      ("price", option_to_yojson bounded_string_to_yojson x.price);
      ("dimensionKey", option_to_yojson bounded_string_to_yojson x.dimension_key);
    ]

let rate_card_list_to_yojson tree = list_to_yojson rate_card_item_to_yojson tree

let usage_based_rate_card_item_to_yojson (x : usage_based_rate_card_item) =
  assoc_to_yojson [ ("rateCard", option_to_yojson rate_card_list_to_yojson x.rate_card) ]

let usage_based_rate_card_list_to_yojson tree =
  list_to_yojson usage_based_rate_card_item_to_yojson tree

let usage_based_pricing_term_to_yojson (x : usage_based_pricing_term) =
  assoc_to_yojson
    [
      ("rateCards", option_to_yojson usage_based_rate_card_list_to_yojson x.rate_cards);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let update_purchase_orders_output_to_yojson = unit_to_yojson
let resource_id_to_yojson = string_to_yojson
let charge_revision_to_yojson = long_to_yojson
let purchase_order_reference_to_yojson = string_to_yojson

let purchase_order_to_yojson (x : purchase_order) =
  assoc_to_yojson
    [
      ( "purchaseOrderReference",
        option_to_yojson purchase_order_reference_to_yojson x.purchase_order_reference );
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ("chargeRevision", option_to_yojson charge_revision_to_yojson x.charge_revision);
      ("chargeId", Some (resource_id_to_yojson x.charge_id));
    ]

let purchase_orders_to_yojson tree = list_to_yojson purchase_order_to_yojson tree

let update_purchase_orders_input_to_yojson (x : update_purchase_orders_input) =
  assoc_to_yojson [ ("purchaseOrders", Some (purchase_orders_to_yojson x.purchase_orders)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | BILLING_ADJUSTMENT_REQUEST -> `String "BillingAdjustmentRequest"
  | AGREEMENT_CANCELLATION_REQUEST -> `String "AgreementCancellationRequest"
  | INVOICE -> `String "Invoice"
  | PAYMENT_REQUEST -> `String "PaymentRequest"
  | CHARGE -> `String "Charge"
  | AGREEMENT_PROPOSAL -> `String "AgreementProposal"
  | AGREEMENT_REQUEST -> `String "AgreementRequest"
  | AGREEMENT -> `String "Agreement"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with
  | INVALID_ACCESS -> `String "INVALID_ACCESS"
  | MISSING_MFA -> `String "MISSING_MFA"
  | FAILED_KYC_COMPLIANCE -> `String "FAILED_KYC_COMPLIANCE"
  | DENIED_BY_PRIVATE_MARKETPLACE_POLICY -> `String "DENIED_BY_PRIVATE_MARKETPLACE_POLICY"
  | INVALID_ACCOUNT_STATE -> `String "INVALID_ACCOUNT_STATE"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("reason", option_to_yojson access_denied_exception_reason_to_yojson x.reason);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let timing_to_yojson (x : timing) =
  match x with
  | BILLING_PERIOD -> `String "BILLING_PERIOD"
  | SCHEDULED -> `String "SCHEDULED"
  | ON_ACCEPTANCE -> `String "ON_ACCEPTANCE"

let tax_estimation_to_yojson (x : tax_estimation) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let tax_configuration_to_yojson (x : tax_configuration) =
  assoc_to_yojson [ ("taxEstimation", option_to_yojson tax_estimation_to_yojson x.tax_estimation) ]

let tax_breakdown_item_to_yojson (x : tax_breakdown_item) =
  assoc_to_yojson
    [
      ("type", option_to_yojson bounded_string_to_yojson x.type_);
      ("rate", option_to_yojson bounded_string_to_yojson x.rate);
      ("amount", option_to_yojson bounded_string_to_yojson x.amount);
    ]

let tax_breakdown_to_yojson tree = list_to_yojson tax_breakdown_item_to_yojson tree

let support_term_to_yojson (x : support_term) =
  assoc_to_yojson
    [
      ("refundPolicy", option_to_yojson bounded_string_to_yojson x.refund_policy);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let sort_order_to_yojson (x : sort_order) =
  match x with DESCENDING -> `String "DESCENDING" | ASCENDING -> `String "ASCENDING"

let sort_by_to_yojson = string_to_yojson

let sort_to_yojson (x : sort) =
  assoc_to_yojson
    [
      ("sortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
      ("sortBy", option_to_yojson sort_by_to_yojson x.sort_by);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceType", option_to_yojson bounded_string_to_yojson x.resource_type);
      ("serviceCode", option_to_yojson bounded_string_to_yojson x.service_code);
      ("quotaCode", option_to_yojson bounded_string_to_yojson x.quota_code);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let payment_request_id_to_yojson = string_to_yojson
let agreement_id_to_yojson = string_to_yojson

let payment_request_status_to_yojson (x : payment_request_status) =
  match x with
  | CANCELLED -> `String "CANCELLED"
  | REJECTED -> `String "REJECTED"
  | APPROVED -> `String "APPROVED"
  | PENDING_APPROVAL -> `String "PENDING_APPROVAL"
  | VALIDATION_FAILED -> `String "VALIDATION_FAILED"
  | VALIDATING -> `String "VALIDATING"

let payment_request_name_to_yojson = string_to_yojson
let payment_request_description_to_yojson = string_to_yojson
let positive_amount_upto8_decimals_to_yojson = string_to_yojson

let send_agreement_payment_request_output_to_yojson (x : send_agreement_payment_request_output) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
    ]

let client_token_to_yojson = string_to_yojson

let send_agreement_payment_request_input_to_yojson (x : send_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("chargeAmount", Some (positive_amount_upto8_decimals_to_yojson x.charge_amount));
      ("name", Some (payment_request_name_to_yojson x.name));
      ("termId", Some (term_id_to_yojson x.term_id));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let agreement_cancellation_request_id_to_yojson = string_to_yojson

let agreement_cancellation_request_status_to_yojson (x : agreement_cancellation_request_status) =
  match x with
  | VALIDATION_FAILED -> `String "VALIDATION_FAILED"
  | CANCELLED -> `String "CANCELLED"
  | REJECTED -> `String "REJECTED"
  | APPROVED -> `String "APPROVED"
  | PENDING_APPROVAL -> `String "PENDING_APPROVAL"

let agreement_cancellation_request_reason_code_to_yojson
    (x : agreement_cancellation_request_reason_code) =
  match x with
  | OTHER -> `String "OTHER"
  | BUYER_DISSATISFACTION -> `String "BUYER_DISSATISFACTION"
  | UNINTENDED_RENEWAL -> `String "UNINTENDED_RENEWAL"
  | PRODUCT_DISCONTINUED -> `String "PRODUCT_DISCONTINUED"
  | ALTERNATIVE_PROCUREMENT_CHANNEL -> `String "ALTERNATIVE_PROCUREMENT_CHANNEL"
  | TEST_AGREEMENT -> `String "TEST_AGREEMENT"
  | REPLACING_AGREEMENT -> `String "REPLACING_AGREEMENT"
  | INCORRECT_TERMS_ACCEPTED -> `String "INCORRECT_TERMS_ACCEPTED"

let agreement_cancellation_request_description_to_yojson = string_to_yojson

let send_agreement_cancellation_request_output_to_yojson
    (x : send_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
    ]

let send_agreement_cancellation_request_input_to_yojson
    (x : send_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("reasonCode", Some (agreement_cancellation_request_reason_code_to_yojson x.reason_code));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let selector_to_yojson (x : selector) =
  assoc_to_yojson
    [
      ("value", option_to_yojson bounded_string_to_yojson x.value);
      ("type", option_to_yojson bounded_string_to_yojson x.type_);
    ]

let agreement_type_to_yojson = string_to_yojson
let aws_account_id_to_yojson = string_to_yojson

let acceptor_to_yojson (x : acceptor) =
  assoc_to_yojson [ ("accountId", option_to_yojson aws_account_id_to_yojson x.account_id) ]

let proposer_to_yojson (x : proposer) =
  assoc_to_yojson [ ("accountId", option_to_yojson aws_account_id_to_yojson x.account_id) ]

let agreement_resource_type_to_yojson = string_to_yojson

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("type", option_to_yojson agreement_resource_type_to_yojson x.type_);
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let resources_to_yojson tree = list_to_yojson resource_to_yojson tree
let offer_id_to_yojson = string_to_yojson
let offer_set_id_to_yojson = string_to_yojson

let proposal_summary_to_yojson (x : proposal_summary) =
  assoc_to_yojson
    [
      ("offerSetId", option_to_yojson offer_set_id_to_yojson x.offer_set_id);
      ("offerId", option_to_yojson offer_id_to_yojson x.offer_id);
      ("resources", option_to_yojson resources_to_yojson x.resources);
    ]

let agreement_status_to_yojson (x : agreement_status) =
  match x with
  | TERMINATED -> `String "TERMINATED"
  | SUPERSEDED -> `String "SUPERSEDED"
  | ROLLED_BACK -> `String "ROLLED_BACK"
  | REPLACED -> `String "REPLACED"
  | RENEWED -> `String "RENEWED"
  | EXPIRED -> `String "EXPIRED"
  | CANCELLED -> `String "CANCELLED"
  | ARCHIVED -> `String "ARCHIVED"
  | ACTIVE -> `String "ACTIVE"

let entitlement_to_yojson (x : entitlement) =
  assoc_to_yojson
    [
      ( "licenseArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.license_arn );
    ]

let entitlement_list_to_yojson tree = list_to_yojson entitlement_to_yojson tree

let agreement_view_summary_to_yojson (x : agreement_view_summary) =
  assoc_to_yojson
    [
      ("entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
      ("status", option_to_yojson agreement_status_to_yojson x.status);
      ("proposalSummary", option_to_yojson proposal_summary_to_yojson x.proposal_summary);
      ("proposer", option_to_yojson proposer_to_yojson x.proposer);
      ("acceptor", option_to_yojson acceptor_to_yojson x.acceptor);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("acceptanceTime", option_to_yojson timestamp_to_yojson x.acceptance_time);
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
    ]

let agreement_view_summary_list_to_yojson tree =
  list_to_yojson agreement_view_summary_to_yojson tree

let next_token_to_yojson = string_to_yojson

let search_agreements_output_to_yojson (x : search_agreements_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "agreementViewSummaries",
        option_to_yojson agreement_view_summary_list_to_yojson x.agreement_view_summaries );
    ]

let catalog_to_yojson = string_to_yojson
let filter_name_to_yojson = string_to_yojson
let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson filter_value_list_to_yojson x.values);
      ("name", option_to_yojson filter_name_to_yojson x.name);
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree
let max_results_to_yojson = int_to_yojson

let search_agreements_input_to_yojson (x : search_agreements_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("sort", option_to_yojson sort_to_yojson x.sort);
      ("filters", option_to_yojson filter_list_to_yojson x.filters);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
    ]

let schedule_item_to_yojson (x : schedule_item) =
  assoc_to_yojson
    [
      ("chargeAmount", option_to_yojson bounded_string_to_yojson x.charge_amount);
      ("chargeDate", option_to_yojson timestamp_to_yojson x.charge_date);
    ]

let schedule_list_to_yojson tree = list_to_yojson schedule_item_to_yojson tree

let dimension_to_yojson (x : dimension) =
  assoc_to_yojson
    [
      ("dimensionValue", Some (zero_value_integer_to_yojson x.dimension_value));
      ("dimensionKey", Some (bounded_string_to_yojson x.dimension_key));
    ]

let dimension_list_to_yojson tree = list_to_yojson dimension_to_yojson tree

let configurable_upfront_pricing_term_configuration_to_yojson
    (x : configurable_upfront_pricing_term_configuration) =
  assoc_to_yojson
    [
      ("dimensions", Some (dimension_list_to_yojson x.dimensions));
      ("selectorValue", Some (bounded_string_to_yojson x.selector_value));
    ]

let boolean__to_yojson = bool_to_yojson

let renewal_term_configuration_to_yojson (x : renewal_term_configuration) =
  assoc_to_yojson [ ("enableAutoRenew", Some (boolean__to_yojson x.enable_auto_renew)) ]

let requested_term_configuration_to_yojson (x : requested_term_configuration) =
  match x with
  | VariablePaymentTermConfiguration arg ->
      assoc_to_yojson
        [
          ( "variablePaymentTermConfiguration",
            Some (variable_payment_term_configuration_to_yojson arg) );
        ]
  | RenewalTermConfiguration arg ->
      assoc_to_yojson
        [ ("renewalTermConfiguration", Some (renewal_term_configuration_to_yojson arg)) ]
  | ConfigurableUpfrontPricingTermConfiguration arg ->
      assoc_to_yojson
        [
          ( "configurableUpfrontPricingTermConfiguration",
            Some (configurable_upfront_pricing_term_configuration_to_yojson arg) );
        ]

let requested_term_to_yojson (x : requested_term) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson requested_term_configuration_to_yojson x.configuration);
      ("id", Some (term_id_to_yojson x.id));
    ]

let requested_term_list_to_yojson tree = list_to_yojson requested_term_to_yojson tree

let renewal_term_to_yojson (x : renewal_term) =
  assoc_to_yojson
    [
      ("configuration", option_to_yojson renewal_term_configuration_to_yojson x.configuration);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let payment_request_status_message_to_yojson = string_to_yojson

let reject_agreement_payment_request_output_to_yojson (x : reject_agreement_payment_request_output)
    =
  assoc_to_yojson
    [
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("statusMessage", option_to_yojson payment_request_status_message_to_yojson x.status_message);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
    ]

let payment_request_rejection_reason_to_yojson = string_to_yojson

let reject_agreement_payment_request_input_to_yojson (x : reject_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ( "rejectionReason",
        option_to_yojson payment_request_rejection_reason_to_yojson x.rejection_reason );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("paymentRequestId", Some (payment_request_id_to_yojson x.payment_request_id));
    ]

let agreement_cancellation_request_status_message_to_yojson = string_to_yojson

let reject_agreement_cancellation_request_output_to_yojson
    (x : reject_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ( "statusMessage",
        option_to_yojson agreement_cancellation_request_status_message_to_yojson x.status_message );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
    ]

let agreement_cancellation_request_rejection_reason_to_yojson = string_to_yojson

let reject_agreement_cancellation_request_input_to_yojson
    (x : reject_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ( "rejectionReason",
        Some (agreement_cancellation_request_rejection_reason_to_yojson x.rejection_reason) );
      ( "agreementCancellationRequestId",
        Some (agreement_cancellation_request_id_to_yojson x.agreement_cancellation_request_id) );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let registration_token_to_yojson = string_to_yojson

let recurring_payment_term_to_yojson (x : recurring_payment_term) =
  assoc_to_yojson
    [
      ("price", option_to_yojson bounded_string_to_yojson x.price);
      ("billingPeriod", option_to_yojson bounded_string_to_yojson x.billing_period);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let pricing_currency_amount_to_yojson (x : pricing_currency_amount) =
  assoc_to_yojson
    [
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("maxAdjustmentAmount", option_to_yojson bounded_string_to_yojson x.max_adjustment_amount);
      ("amount", option_to_yojson bounded_string_to_yojson x.amount);
    ]

let positive_integer_with_default_value_one_to_yojson = int_to_yojson

let payment_schedule_term_to_yojson (x : payment_schedule_term) =
  assoc_to_yojson
    [
      ("schedule", option_to_yojson schedule_list_to_yojson x.schedule);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let charge_id_to_yojson = string_to_yojson

let payment_request_summary_to_yojson (x : payment_request_summary) =
  assoc_to_yojson
    [
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("chargeId", option_to_yojson charge_id_to_yojson x.charge_id);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
    ]

let payment_request_summary_list_to_yojson tree =
  list_to_yojson payment_request_summary_to_yojson tree

let party_type_to_yojson = string_to_yojson
let billing_adjustment_request_id_to_yojson = string_to_yojson
let invoice_id_to_yojson = string_to_yojson

let billing_adjustment_status_to_yojson (x : billing_adjustment_status) =
  match x with
  | COMPLETED -> `String "COMPLETED"
  | VALIDATION_FAILED -> `String "VALIDATION_FAILED"
  | PENDING -> `String "PENDING"

let billing_adjustment_summary_to_yojson (x : billing_adjustment_summary) =
  assoc_to_yojson
    [
      ("catalog", Some (catalog_to_yojson x.catalog));
      ("agreementType", Some (agreement_type_to_yojson x.agreement_type));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("status", Some (billing_adjustment_status_to_yojson x.status));
      ("currencyCode", Some (currency_code_to_yojson x.currency_code));
      ("adjustmentAmount", Some (positive_amount_upto8_decimals_to_yojson x.adjustment_amount));
      ("originalInvoiceId", Some (invoice_id_to_yojson x.original_invoice_id));
      ( "billingAdjustmentRequestId",
        Some (billing_adjustment_request_id_to_yojson x.billing_adjustment_request_id) );
    ]

let billing_adjustment_summary_list_to_yojson tree =
  list_to_yojson billing_adjustment_summary_to_yojson tree

let list_billing_adjustment_requests_output_to_yojson (x : list_billing_adjustment_requests_output)
    =
  assoc_to_yojson
    [
      ("items", Some (billing_adjustment_summary_list_to_yojson x.items));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_billing_adjustment_requests_input_to_yojson (x : list_billing_adjustment_requests_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("createdBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("createdAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("status", option_to_yojson billing_adjustment_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
    ]

let list_agreement_payment_requests_output_to_yojson (x : list_agreement_payment_requests_output) =
  assoc_to_yojson
    [
      ("items", Some (payment_request_summary_list_to_yojson x.items));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_agreement_payment_requests_input_to_yojson (x : list_agreement_payment_requests_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("partyType", Some (party_type_to_yojson x.party_type));
    ]

let invoice_billing_period_to_yojson (x : invoice_billing_period) =
  assoc_to_yojson
    [
      ("year", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.year));
      ("month", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.month));
    ]

let invoice_type_to_yojson (x : invoice_type) =
  match x with CREDIT_MEMO -> `String "CREDIT_MEMO" | INVOICE -> `String "INVOICE"

let invoicing_entity_to_yojson (x : invoicing_entity) =
  assoc_to_yojson
    [
      ("branchName", option_to_yojson bounded_string_to_yojson x.branch_name);
      ("legalName", option_to_yojson bounded_string_to_yojson x.legal_name);
    ]

let agreement_invoice_line_item_group_summary_to_yojson
    (x : agreement_invoice_line_item_group_summary) =
  assoc_to_yojson
    [
      ("invoicingEntity", option_to_yojson invoicing_entity_to_yojson x.invoicing_entity);
      ("invoiceType", option_to_yojson invoice_type_to_yojson x.invoice_type);
      ("issuedTime", option_to_yojson timestamp_to_yojson x.issued_time);
      ( "invoiceBillingPeriod",
        option_to_yojson invoice_billing_period_to_yojson x.invoice_billing_period );
      ( "pricingCurrencyAmount",
        option_to_yojson pricing_currency_amount_to_yojson x.pricing_currency_amount );
      ("invoiceId", option_to_yojson resource_id_to_yojson x.invoice_id);
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
    ]

let agreement_invoice_line_item_group_summaries_to_yojson tree =
  list_to_yojson agreement_invoice_line_item_group_summary_to_yojson tree

let list_agreement_invoice_line_items_output_to_yojson
    (x : list_agreement_invoice_line_items_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "agreementInvoiceLineItemGroupSummaries",
        option_to_yojson agreement_invoice_line_item_group_summaries_to_yojson
          x.agreement_invoice_line_item_group_summaries );
    ]

let line_item_group_by_to_yojson (x : line_item_group_by) =
  match x with INVOICE_ID -> `String "INVOICE_ID"

let list_agreement_invoice_line_items_input_to_yojson (x : list_agreement_invoice_line_items_input)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("afterIssuedTime", option_to_yojson timestamp_to_yojson x.after_issued_time);
      ("beforeIssuedTime", option_to_yojson timestamp_to_yojson x.before_issued_time);
      ( "invoiceBillingPeriod",
        option_to_yojson invoice_billing_period_to_yojson x.invoice_billing_period );
      ("invoiceType", option_to_yojson invoice_type_to_yojson x.invoice_type);
      ("invoiceId", option_to_yojson resource_id_to_yojson x.invoice_id);
      ("groupBy", Some (line_item_group_by_to_yojson x.group_by));
      ("agreementId", Some (resource_id_to_yojson x.agreement_id));
    ]

let charge_to_yojson (x : charge) =
  assoc_to_yojson
    [
      ("time", option_to_yojson timestamp_to_yojson x.time);
      ("amount", option_to_yojson bounded_string_to_yojson x.amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ( "purchaseOrderReference",
        option_to_yojson purchase_order_reference_to_yojson x.purchase_order_reference );
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ("revision", option_to_yojson charge_revision_to_yojson x.revision);
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let charges_to_yojson tree = list_to_yojson charge_to_yojson tree

let list_agreement_charges_output_to_yojson (x : list_agreement_charges_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", option_to_yojson charges_to_yojson x.items);
    ]

let list_agreement_charges_input_to_yojson (x : list_agreement_charges_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
    ]

let agreement_cancellation_request_summary_to_yojson (x : agreement_cancellation_request_summary) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
    ]

let agreement_cancellation_request_summary_list_to_yojson tree =
  list_to_yojson agreement_cancellation_request_summary_to_yojson tree

let list_agreement_cancellation_requests_output_to_yojson
    (x : list_agreement_cancellation_requests_output) =
  assoc_to_yojson
    [
      ("items", option_to_yojson agreement_cancellation_request_summary_list_to_yojson x.items);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_agreement_cancellation_requests_input_to_yojson
    (x : list_agreement_cancellation_requests_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("partyType", Some (party_type_to_yojson x.party_type));
    ]

let document_item_to_yojson (x : document_item) =
  assoc_to_yojson
    [
      ("version", option_to_yojson bounded_string_to_yojson x.version);
      ("url", option_to_yojson bounded_string_to_yojson x.url);
      ("type", option_to_yojson bounded_string_to_yojson x.type_);
    ]

let document_list_to_yojson tree = list_to_yojson document_item_to_yojson tree

let legal_term_to_yojson (x : legal_term) =
  assoc_to_yojson
    [
      ("documents", option_to_yojson document_list_to_yojson x.documents);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let itemized_charge_to_yojson (x : itemized_charge) =
  assoc_to_yojson
    [
      ( "incrementalChargeAmount",
        option_to_yojson bounded_string_to_yojson x.incremental_charge_amount );
      ("chargeReference", option_to_yojson resource_id_to_yojson x.charge_reference);
      ( "oldQuantity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.old_quantity );
      ( "newQuantity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.new_quantity );
      ("dimensionKey", option_to_yojson bounded_string_to_yojson x.dimension_key);
    ]

let itemized_charge_list_to_yojson tree = list_to_yojson itemized_charge_to_yojson tree

let intent_to_yojson (x : intent) =
  match x with REPLACE -> `String "REPLACE" | AMEND -> `String "AMEND" | NEW -> `String "NEW"

let grant_item_to_yojson (x : grant_item) =
  assoc_to_yojson
    [
      ( "maxQuantity",
        option_to_yojson positive_integer_with_default_value_one_to_yojson x.max_quantity );
      ("dimensionKey", option_to_yojson bounded_string_to_yojson x.dimension_key);
    ]

let grant_list_to_yojson tree = list_to_yojson grant_item_to_yojson tree

let billing_adjustment_reason_code_to_yojson (x : billing_adjustment_reason_code) =
  match x with
  | OTHER -> `String "OTHER"
  | BUYER_DISSATISFACTION -> `String "BUYER_DISSATISFACTION"
  | UNINTENDED_RENEWAL -> `String "UNINTENDED_RENEWAL"
  | ALTERNATIVE_PROCUREMENT_CHANNEL -> `String "ALTERNATIVE_PROCUREMENT_CHANNEL"
  | TEST_ENVIRONMENT_CHARGES -> `String "TEST_ENVIRONMENT_CHARGES"
  | INCORRECT_METERING -> `String "INCORRECT_METERING"
  | INCORRECT_TERMS_ACCEPTED -> `String "INCORRECT_TERMS_ACCEPTED"

let billing_adjustment_status_message_to_yojson = string_to_yojson

let get_billing_adjustment_request_output_to_yojson (x : get_billing_adjustment_request_output) =
  assoc_to_yojson
    [
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ( "statusMessage",
        option_to_yojson billing_adjustment_status_message_to_yojson x.status_message );
      ("status", Some (billing_adjustment_status_to_yojson x.status));
      ("currencyCode", Some (currency_code_to_yojson x.currency_code));
      ("adjustmentAmount", Some (positive_amount_upto8_decimals_to_yojson x.adjustment_amount));
      ("originalInvoiceId", Some (invoice_id_to_yojson x.original_invoice_id));
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ( "adjustmentReasonCode",
        Some (billing_adjustment_reason_code_to_yojson x.adjustment_reason_code) );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "billingAdjustmentRequestId",
        Some (billing_adjustment_request_id_to_yojson x.billing_adjustment_request_id) );
    ]

let get_billing_adjustment_request_input_to_yojson (x : get_billing_adjustment_request_input) =
  assoc_to_yojson
    [
      ( "billingAdjustmentRequestId",
        Some (billing_adjustment_request_id_to_yojson x.billing_adjustment_request_id) );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let constraints_to_yojson (x : constraints) =
  assoc_to_yojson
    [
      ("quantityConfiguration", option_to_yojson bounded_string_to_yojson x.quantity_configuration);
      ( "multipleDimensionSelection",
        option_to_yojson bounded_string_to_yojson x.multiple_dimension_selection );
    ]

let configurable_upfront_rate_card_item_to_yojson (x : configurable_upfront_rate_card_item) =
  assoc_to_yojson
    [
      ("rateCard", option_to_yojson rate_card_list_to_yojson x.rate_card);
      ("constraints", option_to_yojson constraints_to_yojson x.constraints);
      ("selector", option_to_yojson selector_to_yojson x.selector);
    ]

let configurable_upfront_rate_card_list_to_yojson tree =
  list_to_yojson configurable_upfront_rate_card_item_to_yojson tree

let configurable_upfront_pricing_term_to_yojson (x : configurable_upfront_pricing_term) =
  assoc_to_yojson
    [
      ( "configuration",
        option_to_yojson configurable_upfront_pricing_term_configuration_to_yojson x.configuration
      );
      ("rateCards", option_to_yojson configurable_upfront_rate_card_list_to_yojson x.rate_cards);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let byol_pricing_term_to_yojson (x : byol_pricing_term) =
  assoc_to_yojson
    [
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let free_trial_pricing_term_to_yojson (x : free_trial_pricing_term) =
  assoc_to_yojson
    [
      ("grants", option_to_yojson grant_list_to_yojson x.grants);
      ("duration", option_to_yojson bounded_string_to_yojson x.duration);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let fixed_upfront_pricing_term_to_yojson (x : fixed_upfront_pricing_term) =
  assoc_to_yojson
    [
      ("grants", option_to_yojson grant_list_to_yojson x.grants);
      ("price", option_to_yojson bounded_string_to_yojson x.price);
      ("duration", option_to_yojson bounded_string_to_yojson x.duration);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
    ]

let accepted_term_to_yojson (x : accepted_term) =
  match x with
  | VariablePaymentTerm arg ->
      assoc_to_yojson [ ("variablePaymentTerm", Some (variable_payment_term_to_yojson arg)) ]
  | FixedUpfrontPricingTerm arg ->
      assoc_to_yojson
        [ ("fixedUpfrontPricingTerm", Some (fixed_upfront_pricing_term_to_yojson arg)) ]
  | FreeTrialPricingTerm arg ->
      assoc_to_yojson [ ("freeTrialPricingTerm", Some (free_trial_pricing_term_to_yojson arg)) ]
  | PaymentScheduleTerm arg ->
      assoc_to_yojson [ ("paymentScheduleTerm", Some (payment_schedule_term_to_yojson arg)) ]
  | ValidityTerm arg -> assoc_to_yojson [ ("validityTerm", Some (validity_term_to_yojson arg)) ]
  | RecurringPaymentTerm arg ->
      assoc_to_yojson [ ("recurringPaymentTerm", Some (recurring_payment_term_to_yojson arg)) ]
  | ByolPricingTerm arg ->
      assoc_to_yojson [ ("byolPricingTerm", Some (byol_pricing_term_to_yojson arg)) ]
  | ConfigurableUpfrontPricingTerm arg ->
      assoc_to_yojson
        [
          ("configurableUpfrontPricingTerm", Some (configurable_upfront_pricing_term_to_yojson arg));
        ]
  | UsageBasedPricingTerm arg ->
      assoc_to_yojson [ ("usageBasedPricingTerm", Some (usage_based_pricing_term_to_yojson arg)) ]
  | RenewalTerm arg -> assoc_to_yojson [ ("renewalTerm", Some (renewal_term_to_yojson arg)) ]
  | SupportTerm arg -> assoc_to_yojson [ ("supportTerm", Some (support_term_to_yojson arg)) ]
  | LegalTerm arg -> assoc_to_yojson [ ("legalTerm", Some (legal_term_to_yojson arg)) ]

let accepted_term_list_to_yojson tree = list_to_yojson accepted_term_to_yojson tree

let get_agreement_terms_output_to_yojson (x : get_agreement_terms_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("acceptedTerms", option_to_yojson accepted_term_list_to_yojson x.accepted_terms);
    ]

let get_agreement_terms_input_to_yojson (x : get_agreement_terms_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("agreementId", Some (resource_id_to_yojson x.agreement_id));
    ]

let get_agreement_payment_request_output_to_yojson (x : get_agreement_payment_request_output) =
  assoc_to_yojson
    [
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("chargeId", option_to_yojson charge_id_to_yojson x.charge_id);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("statusMessage", option_to_yojson payment_request_status_message_to_yojson x.status_message);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
    ]

let get_agreement_payment_request_input_to_yojson (x : get_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("paymentRequestId", Some (payment_request_id_to_yojson x.payment_request_id));
    ]

let entitlement_type_to_yojson = string_to_yojson

let agreement_entitlement_status_to_yojson (x : agreement_entitlement_status) =
  match x with
  | DEPROVISIONED -> `String "DEPROVISIONED"
  | FAILED -> `String "FAILED"
  | PENDING -> `String "PENDING"
  | SCHEDULED -> `String "SCHEDULED"
  | PROVISIONED -> `String "PROVISIONED"

let agreement_entitlement_status_reason_code_to_yojson
    (x : agreement_entitlement_status_reason_code) =
  match x with
  | PRODUCT_RESTRICTED -> `String "PRODUCT_RESTRICTED"
  | AGREEMENT_ACTIVE -> `String "AGREEMENT_ACTIVE"
  | AGREEMENT_INACTIVE -> `String "AGREEMENT_INACTIVE"
  | UNSUPPORTED_OPERATION -> `String "UNSUPPORTED_OPERATION"
  | ACCOUNT_SUSPENDED -> `String "ACCOUNT_SUSPENDED"
  | INCOMPATIBLE_CURRENCY -> `String "INCOMPATIBLE_CURRENCY"
  | INVALID_PAYMENT_INSTRUMENT -> `String "INVALID_PAYMENT_INSTRUMENT"
  | FUTURE_START_DATE -> `String "FUTURE_START_DATE"
  | PROVISIONING_IN_PROGRESS -> `String "PROVISIONING_IN_PROGRESS"

let aws_arn_to_yojson = string_to_yojson

let agreement_entitlement_to_yojson (x : agreement_entitlement) =
  assoc_to_yojson
    [
      ("licenseArn", option_to_yojson aws_arn_to_yojson x.license_arn);
      ( "statusReasonCode",
        option_to_yojson agreement_entitlement_status_reason_code_to_yojson x.status_reason_code );
      ("status", option_to_yojson agreement_entitlement_status_to_yojson x.status);
      ("registrationToken", option_to_yojson registration_token_to_yojson x.registration_token);
      ("type", option_to_yojson entitlement_type_to_yojson x.type_);
      ("resource", option_to_yojson resource_to_yojson x.resource);
    ]

let agreement_entitlement_list_to_yojson tree = list_to_yojson agreement_entitlement_to_yojson tree

let get_agreement_entitlements_output_to_yojson (x : get_agreement_entitlements_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "agreementEntitlements",
        option_to_yojson agreement_entitlement_list_to_yojson x.agreement_entitlements );
    ]

let get_agreement_entitlements_input_to_yojson (x : get_agreement_entitlements_input) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("agreementId", Some (resource_id_to_yojson x.agreement_id));
    ]

let get_agreement_cancellation_request_output_to_yojson
    (x : get_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "statusMessage",
        option_to_yojson agreement_cancellation_request_status_message_to_yojson x.status_message );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
    ]

let get_agreement_cancellation_request_input_to_yojson
    (x : get_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "agreementCancellationRequestId",
        Some (agreement_cancellation_request_id_to_yojson x.agreement_cancellation_request_id) );
    ]

let estimated_taxes_to_yojson (x : estimated_taxes) =
  assoc_to_yojson
    [
      ("totalAmount", option_to_yojson bounded_string_to_yojson x.total_amount);
      ("breakdown", option_to_yojson tax_breakdown_to_yojson x.breakdown);
    ]

let expected_charge_to_yojson (x : expected_charge) =
  assoc_to_yojson
    [
      ("estimatedTaxes", option_to_yojson estimated_taxes_to_yojson x.estimated_taxes);
      ("timing", option_to_yojson timing_to_yojson x.timing);
      ("amountAfterTax", option_to_yojson bounded_string_to_yojson x.amount_after_tax);
      ("amount", option_to_yojson bounded_string_to_yojson x.amount);
      ("time", option_to_yojson timestamp_to_yojson x.time);
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let expected_charge_list_to_yojson tree = list_to_yojson expected_charge_to_yojson tree

let estimated_charges_to_yojson (x : estimated_charges) =
  assoc_to_yojson
    [
      ("agreementValue", option_to_yojson bounded_string_to_yojson x.agreement_value);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
    ]

let describe_agreement_output_to_yojson (x : describe_agreement_output) =
  assoc_to_yojson
    [
      ("status", option_to_yojson agreement_status_to_yojson x.status);
      ("proposalSummary", option_to_yojson proposal_summary_to_yojson x.proposal_summary);
      ("estimatedCharges", option_to_yojson estimated_charges_to_yojson x.estimated_charges);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("acceptanceTime", option_to_yojson timestamp_to_yojson x.acceptance_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("proposer", option_to_yojson proposer_to_yojson x.proposer);
      ("acceptor", option_to_yojson acceptor_to_yojson x.acceptor);
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
    ]

let describe_agreement_input_to_yojson (x : describe_agreement_input) =
  assoc_to_yojson [ ("agreementId", Some (resource_id_to_yojson x.agreement_id)) ]

let agreement_request_id_to_yojson = string_to_yojson

let charge_summary_to_yojson (x : charge_summary) =
  assoc_to_yojson
    [
      ("invoicingEntity", option_to_yojson invoicing_entity_to_yojson x.invoicing_entity);
      ("itemizedCharges", option_to_yojson itemized_charge_list_to_yojson x.itemized_charges);
      ("estimatedTaxes", option_to_yojson estimated_taxes_to_yojson x.estimated_taxes);
      ("expectedCharges", option_to_yojson expected_charge_list_to_yojson x.expected_charges);
      ( "newAgreementValueAfterTax",
        option_to_yojson bounded_string_to_yojson x.new_agreement_value_after_tax );
      ("newAgreementValue", option_to_yojson bounded_string_to_yojson x.new_agreement_value);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
    ]

let create_agreement_request_output_to_yojson (x : create_agreement_request_output) =
  assoc_to_yojson
    [
      ("chargeSummary", option_to_yojson charge_summary_to_yojson x.charge_summary);
      ("agreementRequestId", option_to_yojson agreement_request_id_to_yojson x.agreement_request_id);
    ]

let agreement_proposal_id_to_yojson = string_to_yojson

let create_agreement_request_input_to_yojson (x : create_agreement_request_input) =
  assoc_to_yojson
    [
      ("taxConfiguration", option_to_yojson tax_configuration_to_yojson x.tax_configuration);
      ( "agreementProposalIdentifier",
        option_to_yojson agreement_proposal_id_to_yojson x.agreement_proposal_identifier );
      ( "sourceAgreementIdentifier",
        option_to_yojson resource_id_to_yojson x.source_agreement_identifier );
      ("requestedTerms", Some (requested_term_list_to_yojson x.requested_terms));
      ("intent", Some (intent_to_yojson x.intent));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let cancel_agreement_payment_request_output_to_yojson (x : cancel_agreement_payment_request_output)
    =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
    ]

let cancel_agreement_payment_request_input_to_yojson (x : cancel_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("paymentRequestId", Some (payment_request_id_to_yojson x.payment_request_id));
    ]

let cancel_agreement_output_to_yojson = unit_to_yojson

let cancel_agreement_input_to_yojson (x : cancel_agreement_input) =
  assoc_to_yojson [ ("agreementId", Some (resource_id_to_yojson x.agreement_id)) ]

let cancel_agreement_cancellation_request_output_to_yojson
    (x : cancel_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "statusMessage",
        option_to_yojson agreement_cancellation_request_status_message_to_yojson x.status_message );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
    ]

let agreement_cancellation_request_cancellation_reason_to_yojson = string_to_yojson

let cancel_agreement_cancellation_request_input_to_yojson
    (x : cancel_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ( "cancellationReason",
        Some (agreement_cancellation_request_cancellation_reason_to_yojson x.cancellation_reason) );
      ( "agreementCancellationRequestId",
        Some (agreement_cancellation_request_id_to_yojson x.agreement_cancellation_request_id) );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let billing_adjustment_error_code_to_yojson (x : billing_adjustment_error_code) =
  match x with
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | RESOURCE_NOT_FOUND_EXCEPTION -> `String "RESOURCE_NOT_FOUND_EXCEPTION"
  | VALIDATION_EXCEPTION -> `String "VALIDATION_EXCEPTION"
  | CONFLICT_EXCEPTION -> `String "CONFLICT_EXCEPTION"

let billing_adjustment_description_to_yojson = string_to_yojson

let batch_create_billing_adjustment_item_to_yojson (x : batch_create_billing_adjustment_item) =
  assoc_to_yojson
    [
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ( "billingAdjustmentRequestId",
        Some (billing_adjustment_request_id_to_yojson x.billing_adjustment_request_id) );
    ]

let batch_create_billing_adjustment_item_list_to_yojson tree =
  list_to_yojson batch_create_billing_adjustment_item_to_yojson tree

let batch_create_billing_adjustment_error_to_yojson (x : batch_create_billing_adjustment_error) =
  assoc_to_yojson
    [
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("code", Some (billing_adjustment_error_code_to_yojson x.code));
    ]

let batch_create_billing_adjustment_error_list_to_yojson tree =
  list_to_yojson batch_create_billing_adjustment_error_to_yojson tree

let batch_create_billing_adjustment_request_output_to_yojson
    (x : batch_create_billing_adjustment_request_output) =
  assoc_to_yojson
    [
      ("errors", Some (batch_create_billing_adjustment_error_list_to_yojson x.errors));
      ("items", Some (batch_create_billing_adjustment_item_list_to_yojson x.items));
    ]

let batch_create_billing_adjustment_request_entry_to_yojson
    (x : batch_create_billing_adjustment_request_entry) =
  assoc_to_yojson
    [
      ("clientToken", Some (client_token_to_yojson x.client_token));
      ("description", option_to_yojson billing_adjustment_description_to_yojson x.description);
      ( "adjustmentReasonCode",
        Some (billing_adjustment_reason_code_to_yojson x.adjustment_reason_code) );
      ("currencyCode", Some (currency_code_to_yojson x.currency_code));
      ("adjustmentAmount", Some (positive_amount_upto8_decimals_to_yojson x.adjustment_amount));
      ("originalInvoiceId", Some (invoice_id_to_yojson x.original_invoice_id));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let batch_create_billing_adjustment_request_entry_list_to_yojson tree =
  list_to_yojson batch_create_billing_adjustment_request_entry_to_yojson tree

let batch_create_billing_adjustment_request_input_to_yojson
    (x : batch_create_billing_adjustment_request_input) =
  assoc_to_yojson
    [
      ( "billingAdjustmentRequestEntries",
        Some
          (batch_create_billing_adjustment_request_entry_list_to_yojson
             x.billing_adjustment_request_entries) );
    ]

let accept_agreement_request_output_to_yojson (x : accept_agreement_request_output) =
  assoc_to_yojson [ ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id) ]

let accept_agreement_request_input_to_yojson (x : accept_agreement_request_input) =
  assoc_to_yojson
    [
      ("purchaseOrders", option_to_yojson purchase_orders_to_yojson x.purchase_orders);
      ("agreementRequestId", Some (agreement_request_id_to_yojson x.agreement_request_id));
    ]

let accept_agreement_payment_request_output_to_yojson (x : accept_agreement_payment_request_output)
    =
  assoc_to_yojson
    [
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
    ]

let accept_agreement_payment_request_input_to_yojson (x : accept_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ( "purchaseOrderReference",
        option_to_yojson purchase_order_reference_to_yojson x.purchase_order_reference );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("paymentRequestId", Some (payment_request_id_to_yojson x.payment_request_id));
    ]

let accept_agreement_cancellation_request_output_to_yojson
    (x : accept_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
    ]

let accept_agreement_cancellation_request_input_to_yojson
    (x : accept_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ( "agreementCancellationRequestId",
        Some (agreement_cancellation_request_id_to_yojson x.agreement_cancellation_request_id) );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]
