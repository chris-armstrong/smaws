open Smaws_Lib.Json.SerializeHelpers
open Types

let aws_account_id_to_yojson = string_to_yojson
let bounded_string_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (bounded_string_to_yojson x.name));
      ("message", Some (bounded_string_to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | MISSING_BILLING_ADJUSTMENTS -> `String "MISSING_BILLING_ADJUSTMENTS"
  | BILLING_ADJUSTMENTS_LIMIT_EXCEEDED -> `String "BILLING_ADJUSTMENTS_LIMIT_EXCEEDED"
  | MISSING_INVOICE_ID -> `String "MISSING_INVOICE_ID"
  | INVALID_ADJUSTMENT_AMOUNT -> `String "INVALID_ADJUSTMENT_AMOUNT"
  | MISSING_ADJUSTMENT_AMOUNT -> `String "MISSING_ADJUSTMENT_AMOUNT"
  | INVALID_REASON_CODE -> `String "INVALID_REASON_CODE"
  | MISSING_REASON_CODE -> `String "MISSING_REASON_CODE"
  | MISSING_DESCRIPTION -> `String "MISSING_DESCRIPTION"
  | INVALID_INVOICE_ADJUSTMENT_PERIOD -> `String "INVALID_INVOICE_ADJUSTMENT_PERIOD"
  | INVALID_CURRENCY_CODE -> `String "INVALID_CURRENCY_CODE"
  | MISSING_CURRENCY_CODE -> `String "MISSING_CURRENCY_CODE"
  | EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT -> `String "EXCEEDED_MAXIMUM_ADJUSTMENT_AMOUNT"
  | MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY -> `String "MISSING_BILLING_ADJUSTMENT_REQUEST_ENTRY"
  | MULTIPLE_AGREEMENT_IDS -> `String "MULTIPLE_AGREEMENT_IDS"
  | INVALID_AGREEMENT_CANCELLATION_REQUEST_ID -> `String "INVALID_AGREEMENT_CANCELLATION_REQUEST_ID"
  | MISSING_AGREEMENT_CANCELLATION_REQUEST_ID -> `String "MISSING_AGREEMENT_CANCELLATION_REQUEST_ID"
  | MISSING_REASON -> `String "MISSING_REASON"
  | INVALID_REASON -> `String "INVALID_REASON"
  | INVALID_STATUS -> `String "INVALID_STATUS"
  | INVALID_AGREEMENT_ID -> `String "INVALID_AGREEMENT_ID"
  | MISSING_AGREEMENT_ID -> `String "MISSING_AGREEMENT_ID"
  | INVALID_CATALOG -> `String "INVALID_CATALOG"
  | INVALID_FILTERS -> `String "INVALID_FILTERS"
  | INVALID_FILTER_NAME -> `String "INVALID_FILTER_NAME"
  | MISSING_FILTER_NAME -> `String "MISSING_FILTER_NAME"
  | INVALID_FILTER_VALUES -> `String "INVALID_FILTER_VALUES"
  | MISSING_FILTER_VALUES -> `String "MISSING_FILTER_VALUES"
  | INVALID_SORT_BY -> `String "INVALID_SORT_BY"
  | INVALID_SORT_ORDER -> `String "INVALID_SORT_ORDER"
  | INVALID_NEXT_TOKEN -> `String "INVALID_NEXT_TOKEN"
  | INVALID_MAX_RESULTS -> `String "INVALID_MAX_RESULTS"
  | INVALID_TERM_ID -> `String "INVALID_TERM_ID"
  | MISSING_TERM_ID -> `String "MISSING_TERM_ID"
  | MISSING_NAME -> `String "MISSING_NAME"
  | INVALID_NAME -> `String "INVALID_NAME"
  | INVALID_DESCRIPTION -> `String "INVALID_DESCRIPTION"
  | MISSING_CHARGE_AMOUNT -> `String "MISSING_CHARGE_AMOUNT"
  | INVALID_CHARGE_AMOUNT -> `String "INVALID_CHARGE_AMOUNT"
  | MISSING_PAYMENT_REQUEST_ID -> `String "MISSING_PAYMENT_REQUEST_ID"
  | INVALID_PAYMENT_REQUEST_ID -> `String "INVALID_PAYMENT_REQUEST_ID"
  | MISSING_PARTY_TYPE -> `String "MISSING_PARTY_TYPE"
  | INVALID_PARTY_TYPE -> `String "INVALID_PARTY_TYPE"
  | UNSUPPORTED_FILTERS -> `String "UNSUPPORTED_FILTERS"
  | INVALID_CLIENT_TOKEN -> `String "INVALID_CLIENT_TOKEN"
  | INVALID_INTENT -> `String "INVALID_INTENT"
  | MISSING_INTENT -> `String "MISSING_INTENT"
  | INVALID_SOURCE_AGREEMENT_IDENTIFIER -> `String "INVALID_SOURCE_AGREEMENT_IDENTIFIER"
  | MISSING_SOURCE_AGREEMENT_IDENTIFIER -> `String "MISSING_SOURCE_AGREEMENT_IDENTIFIER"
  | INVALID_AGREEMENT_PROPOSAL_IDENTIFIER -> `String "INVALID_AGREEMENT_PROPOSAL_IDENTIFIER"
  | MISSING_AGREEMENT_PROPOSAL_IDENTIFIER -> `String "MISSING_AGREEMENT_PROPOSAL_IDENTIFIER"
  | INVALID_REQUESTED_TERMS -> `String "INVALID_REQUESTED_TERMS"
  | MISSING_REQUESTED_TERMS -> `String "MISSING_REQUESTED_TERMS"
  | INVALID_REQUESTED_TERM_ID -> `String "INVALID_REQUESTED_TERM_ID"
  | MISSING_REQUESTED_TERM_ID -> `String "MISSING_REQUESTED_TERM_ID"
  | INVALID_REQUESTED_TERM_CONFIGURATION -> `String "INVALID_REQUESTED_TERM_CONFIGURATION"
  | MISSING_REQUESTED_TERM_CONFIGURATION -> `String "MISSING_REQUESTED_TERM_CONFIGURATION"
  | INVALID_AGREEMENT_REQUEST_ID -> `String "INVALID_AGREEMENT_REQUEST_ID"
  | MISSING_AGREEMENT_REQUEST_ID -> `String "MISSING_AGREEMENT_REQUEST_ID"
  | INVALID_PURCHASE_ORDERS -> `String "INVALID_PURCHASE_ORDERS"
  | MISSING_PURCHASE_ORDERS -> `String "MISSING_PURCHASE_ORDERS"
  | INVALID_CHARGE_ID -> `String "INVALID_CHARGE_ID"
  | MISSING_CHARGE_ID -> `String "MISSING_CHARGE_ID"
  | INVALID_CHARGE_REVISION -> `String "INVALID_CHARGE_REVISION"
  | MISSING_CHARGE_REVISION -> `String "MISSING_CHARGE_REVISION"
  | INVALID_AGREEMENT_TYPE -> `String "INVALID_AGREEMENT_TYPE"
  | INVALID_PURCHASE_ORDER_REFERENCE -> `String "INVALID_PURCHASE_ORDER_REFERENCE"
  | INACTIVE_AGREEMENT -> `String "INACTIVE_AGREEMENT"
  | SUPERSEDED_AGREEMENT_PROPOSAL -> `String "SUPERSEDED_AGREEMENT_PROPOSAL"
  | EXPIRED_AGREEMENT_PROPOSAL -> `String "EXPIRED_AGREEMENT_PROPOSAL"
  | MISSING_MANDATORY_TERMS -> `String "MISSING_MANDATORY_TERMS"
  | INCOMPATIBLE_TERMS -> `String "INCOMPATIBLE_TERMS"
  | MISSING_USAGE_AGREEMENT -> `String "MISSING_USAGE_AGREEMENT"
  | INVALID_INCREMENTAL_CHARGE -> `String "INVALID_INCREMENTAL_CHARGE"
  | MISSING_ACCOUNT_ADDRESS -> `String "MISSING_ACCOUNT_ADDRESS"
  | UNSUPPORTED_ACTION -> `String "UNSUPPORTED_ACTION"
  | INVALID_REJECTION_REASON -> `String "INVALID_REJECTION_REASON"
  | INVALID_PAYMENT_REQUEST_STATUS -> `String "INVALID_PAYMENT_REQUEST_STATUS"
  | OTHER -> `String "OTHER"
  | DUPLICATE_CHARGES -> `String "DUPLICATE_CHARGES"
  | UNSUPPORTED_ACCOUNT_PLAN -> `String "UNSUPPORTED_ACCOUNT_PLAN"
  | DUPLICATE_AGREEMENT_IN_ORGANIZATION -> `String "DUPLICATE_AGREEMENT_IN_ORGANIZATION"
  | MISSING_PURCHASE_ORDER_REFERENCE -> `String "MISSING_PURCHASE_ORDER_REFERENCE"

let exception_message_to_yojson = string_to_yojson
let request_id_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | AGREEMENT -> `String "Agreement"
  | AGREEMENT_REQUEST -> `String "AgreementRequest"
  | AGREEMENT_PROPOSAL -> `String "AgreementProposal"
  | CHARGE -> `String "Charge"
  | PAYMENT_REQUEST -> `String "PaymentRequest"
  | INVOICE -> `String "Invoice"
  | AGREEMENT_CANCELLATION_REQUEST -> `String "AgreementCancellationRequest"
  | BILLING_ADJUSTMENT_REQUEST -> `String "BillingAdjustmentRequest"

let resource_id_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let access_denied_exception_reason_to_yojson (x : access_denied_exception_reason) =
  match x with
  | INVALID_ACCOUNT_STATE -> `String "INVALID_ACCOUNT_STATE"
  | DENIED_BY_PRIVATE_MARKETPLACE_POLICY -> `String "DENIED_BY_PRIVATE_MARKETPLACE_POLICY"
  | FAILED_KYC_COMPLIANCE -> `String "FAILED_KYC_COMPLIANCE"
  | MISSING_MFA -> `String "MISSING_MFA"
  | INVALID_ACCESS -> `String "INVALID_ACCESS"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("reason", option_to_yojson access_denied_exception_reason_to_yojson x.reason);
    ]

let update_purchase_orders_output_to_yojson = unit_to_yojson
let purchase_order_reference_to_yojson = string_to_yojson
let charge_revision_to_yojson = long_to_yojson

let purchase_order_to_yojson (x : purchase_order) =
  assoc_to_yojson
    [
      ("chargeId", Some (resource_id_to_yojson x.charge_id));
      ("chargeRevision", option_to_yojson charge_revision_to_yojson x.charge_revision);
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ( "purchaseOrderReference",
        option_to_yojson purchase_order_reference_to_yojson x.purchase_order_reference );
    ]

let purchase_orders_to_yojson tree = list_to_yojson purchase_order_to_yojson tree

let update_purchase_orders_input_to_yojson (x : update_purchase_orders_input) =
  assoc_to_yojson [ ("purchaseOrders", Some (purchase_orders_to_yojson x.purchase_orders)) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let currency_code_to_yojson = string_to_yojson
let positive_amount_upto8_decimals_to_yojson = string_to_yojson
let payment_request_description_to_yojson = string_to_yojson
let payment_request_name_to_yojson = string_to_yojson

let payment_request_status_to_yojson (x : payment_request_status) =
  match x with
  | VALIDATING -> `String "VALIDATING"
  | VALIDATION_FAILED -> `String "VALIDATION_FAILED"
  | PENDING_APPROVAL -> `String "PENDING_APPROVAL"
  | APPROVED -> `String "APPROVED"
  | REJECTED -> `String "REJECTED"
  | CANCELLED -> `String "CANCELLED"

let agreement_id_to_yojson = string_to_yojson
let payment_request_id_to_yojson = string_to_yojson

let send_agreement_payment_request_output_to_yojson (x : send_agreement_payment_request_output) =
  assoc_to_yojson
    [
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let term_id_to_yojson = string_to_yojson
let client_token_to_yojson = string_to_yojson

let send_agreement_payment_request_input_to_yojson (x : send_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("termId", Some (term_id_to_yojson x.term_id));
      ("name", Some (payment_request_name_to_yojson x.name));
      ("chargeAmount", Some (positive_amount_upto8_decimals_to_yojson x.charge_amount));
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
    ]

let agreement_cancellation_request_description_to_yojson = string_to_yojson

let agreement_cancellation_request_reason_code_to_yojson
    (x : agreement_cancellation_request_reason_code) =
  match x with
  | INCORRECT_TERMS_ACCEPTED -> `String "INCORRECT_TERMS_ACCEPTED"
  | REPLACING_AGREEMENT -> `String "REPLACING_AGREEMENT"
  | TEST_AGREEMENT -> `String "TEST_AGREEMENT"
  | ALTERNATIVE_PROCUREMENT_CHANNEL -> `String "ALTERNATIVE_PROCUREMENT_CHANNEL"
  | PRODUCT_DISCONTINUED -> `String "PRODUCT_DISCONTINUED"
  | UNINTENDED_RENEWAL -> `String "UNINTENDED_RENEWAL"
  | BUYER_DISSATISFACTION -> `String "BUYER_DISSATISFACTION"
  | OTHER -> `String "OTHER"

let agreement_cancellation_request_status_to_yojson (x : agreement_cancellation_request_status) =
  match x with
  | PENDING_APPROVAL -> `String "PENDING_APPROVAL"
  | APPROVED -> `String "APPROVED"
  | REJECTED -> `String "REJECTED"
  | CANCELLED -> `String "CANCELLED"
  | VALIDATION_FAILED -> `String "VALIDATION_FAILED"

let agreement_cancellation_request_id_to_yojson = string_to_yojson

let send_agreement_cancellation_request_output_to_yojson
    (x : send_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let send_agreement_cancellation_request_input_to_yojson
    (x : send_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("reasonCode", Some (agreement_cancellation_request_reason_code_to_yojson x.reason_code));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
    ]

let next_token_to_yojson = string_to_yojson

let entitlement_to_yojson (x : entitlement) =
  assoc_to_yojson
    [
      ( "licenseArn",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.license_arn );
    ]

let entitlement_list_to_yojson tree = list_to_yojson entitlement_to_yojson tree

let agreement_status_to_yojson (x : agreement_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | ARCHIVED -> `String "ARCHIVED"
  | CANCELLED -> `String "CANCELLED"
  | EXPIRED -> `String "EXPIRED"
  | RENEWED -> `String "RENEWED"
  | REPLACED -> `String "REPLACED"
  | ROLLED_BACK -> `String "ROLLED_BACK"
  | SUPERSEDED -> `String "SUPERSEDED"
  | TERMINATED -> `String "TERMINATED"

let offer_set_id_to_yojson = string_to_yojson
let offer_id_to_yojson = string_to_yojson
let agreement_resource_type_to_yojson = string_to_yojson

let resource_to_yojson (x : resource) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("type", option_to_yojson agreement_resource_type_to_yojson x.type_);
    ]

let resources_to_yojson tree = list_to_yojson resource_to_yojson tree

let proposal_summary_to_yojson (x : proposal_summary) =
  assoc_to_yojson
    [
      ("resources", option_to_yojson resources_to_yojson x.resources);
      ("offerId", option_to_yojson offer_id_to_yojson x.offer_id);
      ("offerSetId", option_to_yojson offer_set_id_to_yojson x.offer_set_id);
    ]

let proposer_to_yojson (x : proposer) =
  assoc_to_yojson [ ("accountId", option_to_yojson aws_account_id_to_yojson x.account_id) ]

let acceptor_to_yojson (x : acceptor) =
  assoc_to_yojson [ ("accountId", option_to_yojson aws_account_id_to_yojson x.account_id) ]

let agreement_type_to_yojson = string_to_yojson

let agreement_view_summary_to_yojson (x : agreement_view_summary) =
  assoc_to_yojson
    [
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ("acceptanceTime", option_to_yojson timestamp_to_yojson x.acceptance_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("acceptor", option_to_yojson acceptor_to_yojson x.acceptor);
      ("proposer", option_to_yojson proposer_to_yojson x.proposer);
      ("proposalSummary", option_to_yojson proposal_summary_to_yojson x.proposal_summary);
      ("status", option_to_yojson agreement_status_to_yojson x.status);
      ("entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
    ]

let agreement_view_summary_list_to_yojson tree =
  list_to_yojson agreement_view_summary_to_yojson tree

let search_agreements_output_to_yojson (x : search_agreements_output) =
  assoc_to_yojson
    [
      ( "agreementViewSummaries",
        option_to_yojson agreement_view_summary_list_to_yojson x.agreement_view_summaries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let sort_order_to_yojson (x : sort_order) =
  match x with ASCENDING -> `String "ASCENDING" | DESCENDING -> `String "DESCENDING"

let sort_by_to_yojson = string_to_yojson

let sort_to_yojson (x : sort) =
  assoc_to_yojson
    [
      ("sortBy", option_to_yojson sort_by_to_yojson x.sort_by);
      ("sortOrder", option_to_yojson sort_order_to_yojson x.sort_order);
    ]

let filter_value_to_yojson = string_to_yojson
let filter_value_list_to_yojson tree = list_to_yojson filter_value_to_yojson tree
let filter_name_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson filter_name_to_yojson x.name);
      ("values", option_to_yojson filter_value_list_to_yojson x.values);
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree
let catalog_to_yojson = string_to_yojson

let search_agreements_input_to_yojson (x : search_agreements_input) =
  assoc_to_yojson
    [
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("filters", option_to_yojson filter_list_to_yojson x.filters);
      ("sort", option_to_yojson sort_to_yojson x.sort);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let payment_request_status_message_to_yojson = string_to_yojson

let reject_agreement_payment_request_output_to_yojson (x : reject_agreement_payment_request_output)
    =
  assoc_to_yojson
    [
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("statusMessage", option_to_yojson payment_request_status_message_to_yojson x.status_message);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let payment_request_rejection_reason_to_yojson = string_to_yojson

let reject_agreement_payment_request_input_to_yojson (x : reject_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ("paymentRequestId", Some (payment_request_id_to_yojson x.payment_request_id));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "rejectionReason",
        option_to_yojson payment_request_rejection_reason_to_yojson x.rejection_reason );
    ]

let agreement_cancellation_request_status_message_to_yojson = string_to_yojson

let reject_agreement_cancellation_request_output_to_yojson
    (x : reject_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "statusMessage",
        option_to_yojson agreement_cancellation_request_status_message_to_yojson x.status_message );
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let agreement_cancellation_request_rejection_reason_to_yojson = string_to_yojson

let reject_agreement_cancellation_request_input_to_yojson
    (x : reject_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "agreementCancellationRequestId",
        Some (agreement_cancellation_request_id_to_yojson x.agreement_cancellation_request_id) );
      ( "rejectionReason",
        Some (agreement_cancellation_request_rejection_reason_to_yojson x.rejection_reason) );
    ]

let billing_adjustment_status_to_yojson (x : billing_adjustment_status) =
  match x with
  | PENDING -> `String "PENDING"
  | VALIDATION_FAILED -> `String "VALIDATION_FAILED"
  | COMPLETED -> `String "COMPLETED"

let invoice_id_to_yojson = string_to_yojson
let billing_adjustment_request_id_to_yojson = string_to_yojson

let billing_adjustment_summary_to_yojson (x : billing_adjustment_summary) =
  assoc_to_yojson
    [
      ( "billingAdjustmentRequestId",
        Some (billing_adjustment_request_id_to_yojson x.billing_adjustment_request_id) );
      ("originalInvoiceId", Some (invoice_id_to_yojson x.original_invoice_id));
      ("adjustmentAmount", Some (positive_amount_upto8_decimals_to_yojson x.adjustment_amount));
      ("currencyCode", Some (currency_code_to_yojson x.currency_code));
      ("status", Some (billing_adjustment_status_to_yojson x.status));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("agreementType", Some (agreement_type_to_yojson x.agreement_type));
      ("catalog", Some (catalog_to_yojson x.catalog));
    ]

let billing_adjustment_summary_list_to_yojson tree =
  list_to_yojson billing_adjustment_summary_to_yojson tree

let list_billing_adjustment_requests_output_to_yojson (x : list_billing_adjustment_requests_output)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", Some (billing_adjustment_summary_list_to_yojson x.items));
    ]

let list_billing_adjustment_requests_input_to_yojson (x : list_billing_adjustment_requests_input) =
  assoc_to_yojson
    [
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson billing_adjustment_status_to_yojson x.status);
      ("createdAfter", option_to_yojson timestamp_to_yojson x.created_after);
      ("createdBefore", option_to_yojson timestamp_to_yojson x.created_before);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let charge_id_to_yojson = string_to_yojson

let payment_request_summary_to_yojson (x : payment_request_summary) =
  assoc_to_yojson
    [
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("chargeId", option_to_yojson charge_id_to_yojson x.charge_id);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let payment_request_summary_list_to_yojson tree =
  list_to_yojson payment_request_summary_to_yojson tree

let list_agreement_payment_requests_output_to_yojson (x : list_agreement_payment_requests_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", Some (payment_request_summary_list_to_yojson x.items));
    ]

let party_type_to_yojson = string_to_yojson

let list_agreement_payment_requests_input_to_yojson (x : list_agreement_payment_requests_input) =
  assoc_to_yojson
    [
      ("partyType", Some (party_type_to_yojson x.party_type));
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let invoicing_entity_to_yojson (x : invoicing_entity) =
  assoc_to_yojson
    [
      ("legalName", option_to_yojson bounded_string_to_yojson x.legal_name);
      ("branchName", option_to_yojson bounded_string_to_yojson x.branch_name);
    ]

let invoice_type_to_yojson (x : invoice_type) =
  match x with INVOICE -> `String "INVOICE" | CREDIT_MEMO -> `String "CREDIT_MEMO"

let invoice_billing_period_to_yojson (x : invoice_billing_period) =
  assoc_to_yojson
    [
      ("month", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.month));
      ("year", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.year));
    ]

let pricing_currency_amount_to_yojson (x : pricing_currency_amount) =
  assoc_to_yojson
    [
      ("amount", option_to_yojson bounded_string_to_yojson x.amount);
      ("maxAdjustmentAmount", option_to_yojson bounded_string_to_yojson x.max_adjustment_amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
    ]

let agreement_invoice_line_item_group_summary_to_yojson
    (x : agreement_invoice_line_item_group_summary) =
  assoc_to_yojson
    [
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ("invoiceId", option_to_yojson resource_id_to_yojson x.invoice_id);
      ( "pricingCurrencyAmount",
        option_to_yojson pricing_currency_amount_to_yojson x.pricing_currency_amount );
      ( "invoiceBillingPeriod",
        option_to_yojson invoice_billing_period_to_yojson x.invoice_billing_period );
      ("issuedTime", option_to_yojson timestamp_to_yojson x.issued_time);
      ("invoiceType", option_to_yojson invoice_type_to_yojson x.invoice_type);
      ("invoicingEntity", option_to_yojson invoicing_entity_to_yojson x.invoicing_entity);
    ]

let agreement_invoice_line_item_group_summaries_to_yojson tree =
  list_to_yojson agreement_invoice_line_item_group_summary_to_yojson tree

let list_agreement_invoice_line_items_output_to_yojson
    (x : list_agreement_invoice_line_items_output) =
  assoc_to_yojson
    [
      ( "agreementInvoiceLineItemGroupSummaries",
        option_to_yojson agreement_invoice_line_item_group_summaries_to_yojson
          x.agreement_invoice_line_item_group_summaries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let line_item_group_by_to_yojson (x : line_item_group_by) =
  match x with INVOICE_ID -> `String "INVOICE_ID"

let list_agreement_invoice_line_items_input_to_yojson (x : list_agreement_invoice_line_items_input)
    =
  assoc_to_yojson
    [
      ("agreementId", Some (resource_id_to_yojson x.agreement_id));
      ("groupBy", Some (line_item_group_by_to_yojson x.group_by));
      ("invoiceId", option_to_yojson resource_id_to_yojson x.invoice_id);
      ("invoiceType", option_to_yojson invoice_type_to_yojson x.invoice_type);
      ( "invoiceBillingPeriod",
        option_to_yojson invoice_billing_period_to_yojson x.invoice_billing_period );
      ("beforeIssuedTime", option_to_yojson timestamp_to_yojson x.before_issued_time);
      ("afterIssuedTime", option_to_yojson timestamp_to_yojson x.after_issued_time);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let charge_to_yojson (x : charge) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("revision", option_to_yojson charge_revision_to_yojson x.revision);
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ( "purchaseOrderReference",
        option_to_yojson purchase_order_reference_to_yojson x.purchase_order_reference );
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("amount", option_to_yojson bounded_string_to_yojson x.amount);
      ("time", option_to_yojson timestamp_to_yojson x.time);
    ]

let charges_to_yojson tree = list_to_yojson charge_to_yojson tree

let list_agreement_charges_output_to_yojson (x : list_agreement_charges_output) =
  assoc_to_yojson
    [
      ("items", option_to_yojson charges_to_yojson x.items);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_agreement_charges_input_to_yojson (x : list_agreement_charges_input) =
  assoc_to_yojson
    [
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let agreement_cancellation_request_summary_to_yojson (x : agreement_cancellation_request_summary) =
  assoc_to_yojson
    [
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let agreement_cancellation_request_summary_list_to_yojson tree =
  list_to_yojson agreement_cancellation_request_summary_to_yojson tree

let list_agreement_cancellation_requests_output_to_yojson
    (x : list_agreement_cancellation_requests_output) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("items", option_to_yojson agreement_cancellation_request_summary_list_to_yojson x.items);
    ]

let list_agreement_cancellation_requests_input_to_yojson
    (x : list_agreement_cancellation_requests_input) =
  assoc_to_yojson
    [
      ("partyType", Some (party_type_to_yojson x.party_type));
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("catalog", option_to_yojson catalog_to_yojson x.catalog);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let billing_adjustment_status_message_to_yojson = string_to_yojson

let billing_adjustment_reason_code_to_yojson (x : billing_adjustment_reason_code) =
  match x with
  | INCORRECT_TERMS_ACCEPTED -> `String "INCORRECT_TERMS_ACCEPTED"
  | INCORRECT_METERING -> `String "INCORRECT_METERING"
  | TEST_ENVIRONMENT_CHARGES -> `String "TEST_ENVIRONMENT_CHARGES"
  | ALTERNATIVE_PROCUREMENT_CHANNEL -> `String "ALTERNATIVE_PROCUREMENT_CHANNEL"
  | UNINTENDED_RENEWAL -> `String "UNINTENDED_RENEWAL"
  | BUYER_DISSATISFACTION -> `String "BUYER_DISSATISFACTION"
  | OTHER -> `String "OTHER"

let get_billing_adjustment_request_output_to_yojson (x : get_billing_adjustment_request_output) =
  assoc_to_yojson
    [
      ( "billingAdjustmentRequestId",
        Some (billing_adjustment_request_id_to_yojson x.billing_adjustment_request_id) );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "adjustmentReasonCode",
        Some (billing_adjustment_reason_code_to_yojson x.adjustment_reason_code) );
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("originalInvoiceId", Some (invoice_id_to_yojson x.original_invoice_id));
      ("adjustmentAmount", Some (positive_amount_upto8_decimals_to_yojson x.adjustment_amount));
      ("currencyCode", Some (currency_code_to_yojson x.currency_code));
      ("status", Some (billing_adjustment_status_to_yojson x.status));
      ( "statusMessage",
        option_to_yojson billing_adjustment_status_message_to_yojson x.status_message );
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
    ]

let get_billing_adjustment_request_input_to_yojson (x : get_billing_adjustment_request_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "billingAdjustmentRequestId",
        Some (billing_adjustment_request_id_to_yojson x.billing_adjustment_request_id) );
    ]

let iso8601_duration_to_yojson = string_to_yojson

let payment_request_approval_strategy_to_yojson (x : payment_request_approval_strategy) =
  match x with
  | AUTO_APPROVE_ON_EXPIRATION -> `String "AUTO_APPROVE_ON_EXPIRATION"
  | WAIT_FOR_APPROVAL -> `String "WAIT_FOR_APPROVAL"

let variable_payment_term_configuration_to_yojson (x : variable_payment_term_configuration) =
  assoc_to_yojson
    [
      ( "paymentRequestApprovalStrategy",
        Some (payment_request_approval_strategy_to_yojson x.payment_request_approval_strategy) );
      ("expirationDuration", option_to_yojson iso8601_duration_to_yojson x.expiration_duration);
    ]

let unversioned_term_type_to_yojson = string_to_yojson

let variable_payment_term_to_yojson (x : variable_payment_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("maxTotalChargeAmount", option_to_yojson bounded_string_to_yojson x.max_total_charge_amount);
      ( "configuration",
        option_to_yojson variable_payment_term_configuration_to_yojson x.configuration );
    ]

let positive_integer_with_default_value_one_to_yojson = int_to_yojson

let grant_item_to_yojson (x : grant_item) =
  assoc_to_yojson
    [
      ("dimensionKey", option_to_yojson bounded_string_to_yojson x.dimension_key);
      ( "maxQuantity",
        option_to_yojson positive_integer_with_default_value_one_to_yojson x.max_quantity );
    ]

let grant_list_to_yojson tree = list_to_yojson grant_item_to_yojson tree

let fixed_upfront_pricing_term_to_yojson (x : fixed_upfront_pricing_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("duration", option_to_yojson bounded_string_to_yojson x.duration);
      ("price", option_to_yojson bounded_string_to_yojson x.price);
      ("grants", option_to_yojson grant_list_to_yojson x.grants);
    ]

let free_trial_pricing_term_to_yojson (x : free_trial_pricing_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("duration", option_to_yojson bounded_string_to_yojson x.duration);
      ("grants", option_to_yojson grant_list_to_yojson x.grants);
    ]

let schedule_item_to_yojson (x : schedule_item) =
  assoc_to_yojson
    [
      ("chargeDate", option_to_yojson timestamp_to_yojson x.charge_date);
      ("chargeAmount", option_to_yojson bounded_string_to_yojson x.charge_amount);
    ]

let schedule_list_to_yojson tree = list_to_yojson schedule_item_to_yojson tree

let payment_schedule_term_to_yojson (x : payment_schedule_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("schedule", option_to_yojson schedule_list_to_yojson x.schedule);
    ]

let validity_term_to_yojson (x : validity_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("agreementDuration", option_to_yojson bounded_string_to_yojson x.agreement_duration);
      ("agreementStartDate", option_to_yojson timestamp_to_yojson x.agreement_start_date);
      ("agreementEndDate", option_to_yojson timestamp_to_yojson x.agreement_end_date);
    ]

let recurring_payment_term_to_yojson (x : recurring_payment_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("billingPeriod", option_to_yojson bounded_string_to_yojson x.billing_period);
      ("price", option_to_yojson bounded_string_to_yojson x.price);
    ]

let byol_pricing_term_to_yojson (x : byol_pricing_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
    ]

let zero_value_integer_to_yojson = int_to_yojson

let dimension_to_yojson (x : dimension) =
  assoc_to_yojson
    [
      ("dimensionKey", Some (bounded_string_to_yojson x.dimension_key));
      ("dimensionValue", Some (zero_value_integer_to_yojson x.dimension_value));
    ]

let dimension_list_to_yojson tree = list_to_yojson dimension_to_yojson tree

let configurable_upfront_pricing_term_configuration_to_yojson
    (x : configurable_upfront_pricing_term_configuration) =
  assoc_to_yojson
    [
      ("selectorValue", Some (bounded_string_to_yojson x.selector_value));
      ("dimensions", Some (dimension_list_to_yojson x.dimensions));
    ]

let rate_card_item_to_yojson (x : rate_card_item) =
  assoc_to_yojson
    [
      ("dimensionKey", option_to_yojson bounded_string_to_yojson x.dimension_key);
      ("price", option_to_yojson bounded_string_to_yojson x.price);
    ]

let rate_card_list_to_yojson tree = list_to_yojson rate_card_item_to_yojson tree

let constraints_to_yojson (x : constraints) =
  assoc_to_yojson
    [
      ( "multipleDimensionSelection",
        option_to_yojson bounded_string_to_yojson x.multiple_dimension_selection );
      ("quantityConfiguration", option_to_yojson bounded_string_to_yojson x.quantity_configuration);
    ]

let selector_to_yojson (x : selector) =
  assoc_to_yojson
    [
      ("type", option_to_yojson bounded_string_to_yojson x.type_);
      ("value", option_to_yojson bounded_string_to_yojson x.value);
    ]

let configurable_upfront_rate_card_item_to_yojson (x : configurable_upfront_rate_card_item) =
  assoc_to_yojson
    [
      ("selector", option_to_yojson selector_to_yojson x.selector);
      ("constraints", option_to_yojson constraints_to_yojson x.constraints);
      ("rateCard", option_to_yojson rate_card_list_to_yojson x.rate_card);
    ]

let configurable_upfront_rate_card_list_to_yojson tree =
  list_to_yojson configurable_upfront_rate_card_item_to_yojson tree

let configurable_upfront_pricing_term_to_yojson (x : configurable_upfront_pricing_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("rateCards", option_to_yojson configurable_upfront_rate_card_list_to_yojson x.rate_cards);
      ( "configuration",
        option_to_yojson configurable_upfront_pricing_term_configuration_to_yojson x.configuration
      );
    ]

let usage_based_rate_card_item_to_yojson (x : usage_based_rate_card_item) =
  assoc_to_yojson [ ("rateCard", option_to_yojson rate_card_list_to_yojson x.rate_card) ]

let usage_based_rate_card_list_to_yojson tree =
  list_to_yojson usage_based_rate_card_item_to_yojson tree

let usage_based_pricing_term_to_yojson (x : usage_based_pricing_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("rateCards", option_to_yojson usage_based_rate_card_list_to_yojson x.rate_cards);
    ]

let boolean__to_yojson = bool_to_yojson

let renewal_term_configuration_to_yojson (x : renewal_term_configuration) =
  assoc_to_yojson [ ("enableAutoRenew", Some (boolean__to_yojson x.enable_auto_renew)) ]

let renewal_term_to_yojson (x : renewal_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("configuration", option_to_yojson renewal_term_configuration_to_yojson x.configuration);
    ]

let support_term_to_yojson (x : support_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("refundPolicy", option_to_yojson bounded_string_to_yojson x.refund_policy);
    ]

let document_item_to_yojson (x : document_item) =
  assoc_to_yojson
    [
      ("type", option_to_yojson bounded_string_to_yojson x.type_);
      ("url", option_to_yojson bounded_string_to_yojson x.url);
      ("version", option_to_yojson bounded_string_to_yojson x.version);
    ]

let document_list_to_yojson tree = list_to_yojson document_item_to_yojson tree

let legal_term_to_yojson (x : legal_term) =
  assoc_to_yojson
    [
      ("type", option_to_yojson unversioned_term_type_to_yojson x.type_);
      ("id", option_to_yojson term_id_to_yojson x.id);
      ("documents", option_to_yojson document_list_to_yojson x.documents);
    ]

let accepted_term_to_yojson (x : accepted_term) =
  match x with
  | LegalTerm arg -> assoc_to_yojson [ ("legalTerm", Some (legal_term_to_yojson arg)) ]
  | SupportTerm arg -> assoc_to_yojson [ ("supportTerm", Some (support_term_to_yojson arg)) ]
  | RenewalTerm arg -> assoc_to_yojson [ ("renewalTerm", Some (renewal_term_to_yojson arg)) ]
  | UsageBasedPricingTerm arg ->
      assoc_to_yojson [ ("usageBasedPricingTerm", Some (usage_based_pricing_term_to_yojson arg)) ]
  | ConfigurableUpfrontPricingTerm arg ->
      assoc_to_yojson
        [
          ("configurableUpfrontPricingTerm", Some (configurable_upfront_pricing_term_to_yojson arg));
        ]
  | ByolPricingTerm arg ->
      assoc_to_yojson [ ("byolPricingTerm", Some (byol_pricing_term_to_yojson arg)) ]
  | RecurringPaymentTerm arg ->
      assoc_to_yojson [ ("recurringPaymentTerm", Some (recurring_payment_term_to_yojson arg)) ]
  | ValidityTerm arg -> assoc_to_yojson [ ("validityTerm", Some (validity_term_to_yojson arg)) ]
  | PaymentScheduleTerm arg ->
      assoc_to_yojson [ ("paymentScheduleTerm", Some (payment_schedule_term_to_yojson arg)) ]
  | FreeTrialPricingTerm arg ->
      assoc_to_yojson [ ("freeTrialPricingTerm", Some (free_trial_pricing_term_to_yojson arg)) ]
  | FixedUpfrontPricingTerm arg ->
      assoc_to_yojson
        [ ("fixedUpfrontPricingTerm", Some (fixed_upfront_pricing_term_to_yojson arg)) ]
  | VariablePaymentTerm arg ->
      assoc_to_yojson [ ("variablePaymentTerm", Some (variable_payment_term_to_yojson arg)) ]

let accepted_term_list_to_yojson tree = list_to_yojson accepted_term_to_yojson tree

let get_agreement_terms_output_to_yojson (x : get_agreement_terms_output) =
  assoc_to_yojson
    [
      ("acceptedTerms", option_to_yojson accepted_term_list_to_yojson x.accepted_terms);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_agreement_terms_input_to_yojson (x : get_agreement_terms_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (resource_id_to_yojson x.agreement_id));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_agreement_payment_request_output_to_yojson (x : get_agreement_payment_request_output) =
  assoc_to_yojson
    [
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("statusMessage", option_to_yojson payment_request_status_message_to_yojson x.status_message);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("chargeId", option_to_yojson charge_id_to_yojson x.charge_id);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let get_agreement_payment_request_input_to_yojson (x : get_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ("paymentRequestId", Some (payment_request_id_to_yojson x.payment_request_id));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let aws_arn_to_yojson = string_to_yojson

let agreement_entitlement_status_reason_code_to_yojson
    (x : agreement_entitlement_status_reason_code) =
  match x with
  | PROVISIONING_IN_PROGRESS -> `String "PROVISIONING_IN_PROGRESS"
  | FUTURE_START_DATE -> `String "FUTURE_START_DATE"
  | INVALID_PAYMENT_INSTRUMENT -> `String "INVALID_PAYMENT_INSTRUMENT"
  | INCOMPATIBLE_CURRENCY -> `String "INCOMPATIBLE_CURRENCY"
  | ACCOUNT_SUSPENDED -> `String "ACCOUNT_SUSPENDED"
  | UNSUPPORTED_OPERATION -> `String "UNSUPPORTED_OPERATION"
  | AGREEMENT_INACTIVE -> `String "AGREEMENT_INACTIVE"
  | AGREEMENT_ACTIVE -> `String "AGREEMENT_ACTIVE"
  | PRODUCT_RESTRICTED -> `String "PRODUCT_RESTRICTED"

let agreement_entitlement_status_to_yojson (x : agreement_entitlement_status) =
  match x with
  | PROVISIONED -> `String "PROVISIONED"
  | SCHEDULED -> `String "SCHEDULED"
  | PENDING -> `String "PENDING"
  | FAILED -> `String "FAILED"
  | DEPROVISIONED -> `String "DEPROVISIONED"

let registration_token_to_yojson = string_to_yojson
let entitlement_type_to_yojson = string_to_yojson

let agreement_entitlement_to_yojson (x : agreement_entitlement) =
  assoc_to_yojson
    [
      ("resource", option_to_yojson resource_to_yojson x.resource);
      ("type", option_to_yojson entitlement_type_to_yojson x.type_);
      ("registrationToken", option_to_yojson registration_token_to_yojson x.registration_token);
      ("status", option_to_yojson agreement_entitlement_status_to_yojson x.status);
      ( "statusReasonCode",
        option_to_yojson agreement_entitlement_status_reason_code_to_yojson x.status_reason_code );
      ("licenseArn", option_to_yojson aws_arn_to_yojson x.license_arn);
    ]

let agreement_entitlement_list_to_yojson tree = list_to_yojson agreement_entitlement_to_yojson tree

let get_agreement_entitlements_output_to_yojson (x : get_agreement_entitlements_output) =
  assoc_to_yojson
    [
      ( "agreementEntitlements",
        option_to_yojson agreement_entitlement_list_to_yojson x.agreement_entitlements );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_agreement_entitlements_input_to_yojson (x : get_agreement_entitlements_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (resource_id_to_yojson x.agreement_id));
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_agreement_cancellation_request_output_to_yojson
    (x : get_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "statusMessage",
        option_to_yojson agreement_cancellation_request_status_message_to_yojson x.status_message );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let get_agreement_cancellation_request_input_to_yojson
    (x : get_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ( "agreementCancellationRequestId",
        Some (agreement_cancellation_request_id_to_yojson x.agreement_cancellation_request_id) );
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let estimated_charges_to_yojson (x : estimated_charges) =
  assoc_to_yojson
    [
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("agreementValue", option_to_yojson bounded_string_to_yojson x.agreement_value);
    ]

let describe_agreement_output_to_yojson (x : describe_agreement_output) =
  assoc_to_yojson
    [
      ("agreementId", option_to_yojson resource_id_to_yojson x.agreement_id);
      ("acceptor", option_to_yojson acceptor_to_yojson x.acceptor);
      ("proposer", option_to_yojson proposer_to_yojson x.proposer);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("acceptanceTime", option_to_yojson timestamp_to_yojson x.acceptance_time);
      ("agreementType", option_to_yojson agreement_type_to_yojson x.agreement_type);
      ("estimatedCharges", option_to_yojson estimated_charges_to_yojson x.estimated_charges);
      ("proposalSummary", option_to_yojson proposal_summary_to_yojson x.proposal_summary);
      ("status", option_to_yojson agreement_status_to_yojson x.status);
    ]

let describe_agreement_input_to_yojson (x : describe_agreement_input) =
  assoc_to_yojson [ ("agreementId", Some (resource_id_to_yojson x.agreement_id)) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("quotaCode", option_to_yojson bounded_string_to_yojson x.quota_code);
      ("serviceCode", option_to_yojson bounded_string_to_yojson x.service_code);
      ("resourceType", option_to_yojson bounded_string_to_yojson x.resource_type);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
    ]

let itemized_charge_to_yojson (x : itemized_charge) =
  assoc_to_yojson
    [
      ("dimensionKey", option_to_yojson bounded_string_to_yojson x.dimension_key);
      ( "newQuantity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.new_quantity );
      ( "oldQuantity",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.old_quantity );
      ("chargeReference", option_to_yojson resource_id_to_yojson x.charge_reference);
      ( "incrementalChargeAmount",
        option_to_yojson bounded_string_to_yojson x.incremental_charge_amount );
    ]

let itemized_charge_list_to_yojson tree = list_to_yojson itemized_charge_to_yojson tree

let tax_breakdown_item_to_yojson (x : tax_breakdown_item) =
  assoc_to_yojson
    [
      ("amount", option_to_yojson bounded_string_to_yojson x.amount);
      ("rate", option_to_yojson bounded_string_to_yojson x.rate);
      ("type", option_to_yojson bounded_string_to_yojson x.type_);
    ]

let tax_breakdown_to_yojson tree = list_to_yojson tax_breakdown_item_to_yojson tree

let estimated_taxes_to_yojson (x : estimated_taxes) =
  assoc_to_yojson
    [
      ("breakdown", option_to_yojson tax_breakdown_to_yojson x.breakdown);
      ("totalAmount", option_to_yojson bounded_string_to_yojson x.total_amount);
    ]

let timing_to_yojson (x : timing) =
  match x with
  | ON_ACCEPTANCE -> `String "ON_ACCEPTANCE"
  | SCHEDULED -> `String "SCHEDULED"
  | BILLING_PERIOD -> `String "BILLING_PERIOD"

let expected_charge_to_yojson (x : expected_charge) =
  assoc_to_yojson
    [
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("time", option_to_yojson timestamp_to_yojson x.time);
      ("amount", option_to_yojson bounded_string_to_yojson x.amount);
      ("amountAfterTax", option_to_yojson bounded_string_to_yojson x.amount_after_tax);
      ("timing", option_to_yojson timing_to_yojson x.timing);
      ("estimatedTaxes", option_to_yojson estimated_taxes_to_yojson x.estimated_taxes);
    ]

let expected_charge_list_to_yojson tree = list_to_yojson expected_charge_to_yojson tree

let charge_summary_to_yojson (x : charge_summary) =
  assoc_to_yojson
    [
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("newAgreementValue", option_to_yojson bounded_string_to_yojson x.new_agreement_value);
      ( "newAgreementValueAfterTax",
        option_to_yojson bounded_string_to_yojson x.new_agreement_value_after_tax );
      ("expectedCharges", option_to_yojson expected_charge_list_to_yojson x.expected_charges);
      ("estimatedTaxes", option_to_yojson estimated_taxes_to_yojson x.estimated_taxes);
      ("itemizedCharges", option_to_yojson itemized_charge_list_to_yojson x.itemized_charges);
      ("invoicingEntity", option_to_yojson invoicing_entity_to_yojson x.invoicing_entity);
    ]

let agreement_request_id_to_yojson = string_to_yojson

let create_agreement_request_output_to_yojson (x : create_agreement_request_output) =
  assoc_to_yojson
    [
      ("agreementRequestId", option_to_yojson agreement_request_id_to_yojson x.agreement_request_id);
      ("chargeSummary", option_to_yojson charge_summary_to_yojson x.charge_summary);
    ]

let tax_estimation_to_yojson (x : tax_estimation) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let tax_configuration_to_yojson (x : tax_configuration) =
  assoc_to_yojson [ ("taxEstimation", option_to_yojson tax_estimation_to_yojson x.tax_estimation) ]

let agreement_proposal_id_to_yojson = string_to_yojson

let requested_term_configuration_to_yojson (x : requested_term_configuration) =
  match x with
  | ConfigurableUpfrontPricingTermConfiguration arg ->
      assoc_to_yojson
        [
          ( "configurableUpfrontPricingTermConfiguration",
            Some (configurable_upfront_pricing_term_configuration_to_yojson arg) );
        ]
  | RenewalTermConfiguration arg ->
      assoc_to_yojson
        [ ("renewalTermConfiguration", Some (renewal_term_configuration_to_yojson arg)) ]
  | VariablePaymentTermConfiguration arg ->
      assoc_to_yojson
        [
          ( "variablePaymentTermConfiguration",
            Some (variable_payment_term_configuration_to_yojson arg) );
        ]

let requested_term_to_yojson (x : requested_term) =
  assoc_to_yojson
    [
      ("id", Some (term_id_to_yojson x.id));
      ("configuration", option_to_yojson requested_term_configuration_to_yojson x.configuration);
    ]

let requested_term_list_to_yojson tree = list_to_yojson requested_term_to_yojson tree

let intent_to_yojson (x : intent) =
  match x with NEW -> `String "NEW" | AMEND -> `String "AMEND" | REPLACE -> `String "REPLACE"

let create_agreement_request_input_to_yojson (x : create_agreement_request_input) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("intent", Some (intent_to_yojson x.intent));
      ("requestedTerms", Some (requested_term_list_to_yojson x.requested_terms));
      ( "sourceAgreementIdentifier",
        option_to_yojson resource_id_to_yojson x.source_agreement_identifier );
      ( "agreementProposalIdentifier",
        option_to_yojson agreement_proposal_id_to_yojson x.agreement_proposal_identifier );
      ("taxConfiguration", option_to_yojson tax_configuration_to_yojson x.tax_configuration);
    ]

let cancel_agreement_payment_request_output_to_yojson (x : cancel_agreement_payment_request_output)
    =
  assoc_to_yojson
    [
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let cancel_agreement_payment_request_input_to_yojson (x : cancel_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ("paymentRequestId", Some (payment_request_id_to_yojson x.payment_request_id));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let cancel_agreement_cancellation_request_output_to_yojson
    (x : cancel_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "statusMessage",
        option_to_yojson agreement_cancellation_request_status_message_to_yojson x.status_message );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let agreement_cancellation_request_cancellation_reason_to_yojson = string_to_yojson

let cancel_agreement_cancellation_request_input_to_yojson
    (x : cancel_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "agreementCancellationRequestId",
        Some (agreement_cancellation_request_id_to_yojson x.agreement_cancellation_request_id) );
      ( "cancellationReason",
        Some (agreement_cancellation_request_cancellation_reason_to_yojson x.cancellation_reason) );
    ]

let cancel_agreement_output_to_yojson = unit_to_yojson

let cancel_agreement_input_to_yojson (x : cancel_agreement_input) =
  assoc_to_yojson [ ("agreementId", Some (resource_id_to_yojson x.agreement_id)) ]

let billing_adjustment_error_code_to_yojson (x : billing_adjustment_error_code) =
  match x with
  | CONFLICT_EXCEPTION -> `String "CONFLICT_EXCEPTION"
  | VALIDATION_EXCEPTION -> `String "VALIDATION_EXCEPTION"
  | RESOURCE_NOT_FOUND_EXCEPTION -> `String "RESOURCE_NOT_FOUND_EXCEPTION"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"

let batch_create_billing_adjustment_error_to_yojson (x : batch_create_billing_adjustment_error) =
  assoc_to_yojson
    [
      ("code", Some (billing_adjustment_error_code_to_yojson x.code));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("clientToken", Some (client_token_to_yojson x.client_token));
    ]

let batch_create_billing_adjustment_error_list_to_yojson tree =
  list_to_yojson batch_create_billing_adjustment_error_to_yojson tree

let batch_create_billing_adjustment_item_to_yojson (x : batch_create_billing_adjustment_item) =
  assoc_to_yojson
    [
      ( "billingAdjustmentRequestId",
        Some (billing_adjustment_request_id_to_yojson x.billing_adjustment_request_id) );
      ("clientToken", Some (client_token_to_yojson x.client_token));
    ]

let batch_create_billing_adjustment_item_list_to_yojson tree =
  list_to_yojson batch_create_billing_adjustment_item_to_yojson tree

let batch_create_billing_adjustment_request_output_to_yojson
    (x : batch_create_billing_adjustment_request_output) =
  assoc_to_yojson
    [
      ("items", Some (batch_create_billing_adjustment_item_list_to_yojson x.items));
      ("errors", Some (batch_create_billing_adjustment_error_list_to_yojson x.errors));
    ]

let billing_adjustment_description_to_yojson = string_to_yojson

let batch_create_billing_adjustment_request_entry_to_yojson
    (x : batch_create_billing_adjustment_request_entry) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("originalInvoiceId", Some (invoice_id_to_yojson x.original_invoice_id));
      ("adjustmentAmount", Some (positive_amount_upto8_decimals_to_yojson x.adjustment_amount));
      ("currencyCode", Some (currency_code_to_yojson x.currency_code));
      ( "adjustmentReasonCode",
        Some (billing_adjustment_reason_code_to_yojson x.adjustment_reason_code) );
      ("description", option_to_yojson billing_adjustment_description_to_yojson x.description);
      ("clientToken", Some (client_token_to_yojson x.client_token));
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
      ("agreementRequestId", Some (agreement_request_id_to_yojson x.agreement_request_id));
      ("purchaseOrders", option_to_yojson purchase_orders_to_yojson x.purchase_orders);
    ]

let accept_agreement_payment_request_output_to_yojson (x : accept_agreement_payment_request_output)
    =
  assoc_to_yojson
    [
      ("paymentRequestId", option_to_yojson payment_request_id_to_yojson x.payment_request_id);
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("status", option_to_yojson payment_request_status_to_yojson x.status);
      ("name", option_to_yojson payment_request_name_to_yojson x.name);
      ("description", option_to_yojson payment_request_description_to_yojson x.description);
      ("chargeAmount", option_to_yojson positive_amount_upto8_decimals_to_yojson x.charge_amount);
      ("currencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let accept_agreement_payment_request_input_to_yojson (x : accept_agreement_payment_request_input) =
  assoc_to_yojson
    [
      ("paymentRequestId", Some (payment_request_id_to_yojson x.payment_request_id));
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "purchaseOrderReference",
        option_to_yojson purchase_order_reference_to_yojson x.purchase_order_reference );
    ]

let accept_agreement_cancellation_request_output_to_yojson
    (x : accept_agreement_cancellation_request_output) =
  assoc_to_yojson
    [
      ("agreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ( "agreementCancellationRequestId",
        option_to_yojson agreement_cancellation_request_id_to_yojson
          x.agreement_cancellation_request_id );
      ("status", option_to_yojson agreement_cancellation_request_status_to_yojson x.status);
      ( "reasonCode",
        option_to_yojson agreement_cancellation_request_reason_code_to_yojson x.reason_code );
      ( "description",
        option_to_yojson agreement_cancellation_request_description_to_yojson x.description );
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("updatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let accept_agreement_cancellation_request_input_to_yojson
    (x : accept_agreement_cancellation_request_input) =
  assoc_to_yojson
    [
      ("agreementId", Some (agreement_id_to_yojson x.agreement_id));
      ( "agreementCancellationRequestId",
        Some (agreement_cancellation_request_id_to_yojson x.agreement_cancellation_request_id) );
    ]
