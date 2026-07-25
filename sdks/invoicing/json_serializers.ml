open Smaws_Lib.Json.SerializeHelpers
open Types

let invoice_unit_arn_string_to_yojson = string_to_yojson
let basic_string_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson basic_string_to_yojson x.message);
      ("resourceName", option_to_yojson invoice_unit_arn_string_to_yojson x.resource_name);
    ]

let account_id_string_to_yojson = string_to_yojson
let account_id_list_to_yojson tree = list_to_yojson account_id_string_to_yojson tree

let fees_breakdown_amount_to_yojson (x : fees_breakdown_amount) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson basic_string_to_yojson x.description);
      ("Amount", option_to_yojson basic_string_to_yojson x.amount);
      ("Rate", option_to_yojson basic_string_to_yojson x.rate);
    ]

let fees_breakdown_amount_list_to_yojson tree = list_to_yojson fees_breakdown_amount_to_yojson tree

let fees_breakdown_to_yojson (x : fees_breakdown) =
  assoc_to_yojson
    [
      ("Breakdown", option_to_yojson fees_breakdown_amount_list_to_yojson x.breakdown);
      ("TotalAmount", option_to_yojson basic_string_to_yojson x.total_amount);
    ]

let taxes_breakdown_amount_to_yojson (x : taxes_breakdown_amount) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson basic_string_to_yojson x.description);
      ("Amount", option_to_yojson basic_string_to_yojson x.amount);
      ("Rate", option_to_yojson basic_string_to_yojson x.rate);
    ]

let taxes_breakdown_amount_list_to_yojson tree =
  list_to_yojson taxes_breakdown_amount_to_yojson tree

let taxes_breakdown_to_yojson (x : taxes_breakdown) =
  assoc_to_yojson
    [
      ("Breakdown", option_to_yojson taxes_breakdown_amount_list_to_yojson x.breakdown);
      ("TotalAmount", option_to_yojson basic_string_to_yojson x.total_amount);
    ]

let discounts_breakdown_amount_to_yojson (x : discounts_breakdown_amount) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson basic_string_to_yojson x.description);
      ("Amount", option_to_yojson basic_string_to_yojson x.amount);
      ("Rate", option_to_yojson basic_string_to_yojson x.rate);
    ]

let discounts_breakdown_amount_list_to_yojson tree =
  list_to_yojson discounts_breakdown_amount_to_yojson tree

let discounts_breakdown_to_yojson (x : discounts_breakdown) =
  assoc_to_yojson
    [
      ("Breakdown", option_to_yojson discounts_breakdown_amount_list_to_yojson x.breakdown);
      ("TotalAmount", option_to_yojson basic_string_to_yojson x.total_amount);
    ]

let amount_breakdown_to_yojson (x : amount_breakdown) =
  assoc_to_yojson
    [
      ("SubTotalAmount", option_to_yojson basic_string_to_yojson x.sub_total_amount);
      ("Discounts", option_to_yojson discounts_breakdown_to_yojson x.discounts);
      ("Taxes", option_to_yojson taxes_breakdown_to_yojson x.taxes);
      ("Fees", option_to_yojson fees_breakdown_to_yojson x.fees);
    ]

let as_of_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let basic_string_without_space_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (basic_string_to_yojson x.name));
      ("message", Some (basic_string_to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | NON_MEMBERS_PRESENT -> `String "nonMemberPresent"
  | MAX_ACCOUNTS_EXCEEDED -> `String "maxAccountsExceeded"
  | MAX_INVOICE_UNITS_EXCEEDED -> `String "maxInvoiceUnitsExceeded"
  | DUPLICATE_INVOICE_UNIT -> `String "duplicateInvoiceUnit"
  | MUTUAL_EXCLUSION_ERROR -> `String "mutualExclusionError"
  | ACCOUNT_MEMBERSHIP_ERROR -> `String "accountMembershipError"
  | TAX_SETTINGS_ERROR -> `String "taxSettingsError"
  | EXPIRED_NEXT_TOKEN -> `String "expiredNextToken"
  | INVALID_NEXT_TOKEN -> `String "invalidNextToken"
  | INVALID_INPUT -> `String "invalidInput"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson basic_string_to_yojson x.message);
      ("resourceName", option_to_yojson invoice_unit_arn_string_to_yojson x.resource_name);
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson basic_string_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson basic_string_to_yojson x.message);
      ("resourceName", option_to_yojson invoice_unit_arn_string_to_yojson x.resource_name);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("message", option_to_yojson basic_string_to_yojson x.message);
    ]

let sensitive_basic_string_without_space_to_yojson = string_to_yojson

let receiver_address_to_yojson (x : receiver_address) =
  assoc_to_yojson
    [
      ("AddressLine1", option_to_yojson basic_string_to_yojson x.address_line1);
      ("AddressLine2", option_to_yojson basic_string_to_yojson x.address_line2);
      ("AddressLine3", option_to_yojson basic_string_to_yojson x.address_line3);
      ("DistrictOrCounty", option_to_yojson basic_string_to_yojson x.district_or_county);
      ("City", option_to_yojson basic_string_to_yojson x.city);
      ("StateOrRegion", option_to_yojson basic_string_to_yojson x.state_or_region);
      ("CountryCode", option_to_yojson basic_string_to_yojson x.country_code);
      ("CompanyName", option_to_yojson basic_string_to_yojson x.company_name);
      ("PostalCode", option_to_yojson basic_string_to_yojson x.postal_code);
    ]

let invoice_profile_to_yojson (x : invoice_profile) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_string_to_yojson x.account_id);
      ("ReceiverName", option_to_yojson basic_string_without_space_to_yojson x.receiver_name);
      ("ReceiverAddress", option_to_yojson receiver_address_to_yojson x.receiver_address);
      ( "ReceiverEmail",
        option_to_yojson sensitive_basic_string_without_space_to_yojson x.receiver_email );
      ("Issuer", option_to_yojson basic_string_without_space_to_yojson x.issuer);
      ( "TaxRegistrationNumber",
        option_to_yojson sensitive_basic_string_without_space_to_yojson x.tax_registration_number );
    ]

let profile_list_to_yojson tree = list_to_yojson invoice_profile_to_yojson tree

let batch_get_invoice_profile_response_to_yojson (x : batch_get_invoice_profile_response) =
  assoc_to_yojson [ ("Profiles", option_to_yojson profile_list_to_yojson x.profiles) ]

let batch_get_invoice_profile_request_to_yojson (x : batch_get_invoice_profile_request) =
  assoc_to_yojson [ ("AccountIds", Some (account_id_list_to_yojson x.account_ids)) ]

let bill_source_account_list_to_yojson tree = list_to_yojson account_id_string_to_yojson tree

let bill_type_to_yojson (x : bill_type) =
  match x with
  | ANNIVERSARY -> `String "ANNIVERSARY"
  | PURCHASE -> `String "PURCHASE"
  | REFUND -> `String "REFUND"

let billing_entity_to_yojson (x : billing_entity) =
  match x with AWS -> `String "AWS" | AWS_MARKETPLACE -> `String "AWS_MARKETPLACE"

let year_to_yojson = int_to_yojson
let month_to_yojson = int_to_yojson

let billing_period_to_yojson (x : billing_period) =
  assoc_to_yojson
    [ ("Month", Some (month_to_yojson x.month)); ("Year", Some (year_to_yojson x.year)) ]

let buyer_domain_to_yojson (x : buyer_domain) = match x with NetworkID -> `String "NetworkID"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson basic_string_to_yojson x.message);
      ("resourceId", option_to_yojson basic_string_to_yojson x.resource_id);
      ("resourceType", option_to_yojson basic_string_to_yojson x.resource_type);
    ]

let connection_testing_method_to_yojson (x : connection_testing_method) =
  match x with
  | PROD_ENV_DOLLAR_TEST -> `String "PROD_ENV_DOLLAR_TEST"
  | TEST_ENV_REPLAY_TEST -> `String "TEST_ENV_REPLAY_TEST"

let email_string_to_yojson = string_to_yojson

let contact_to_yojson (x : contact) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson basic_string_to_yojson x.name);
      ("Email", option_to_yojson email_string_to_yojson x.email);
    ]

let contacts_to_yojson tree = list_to_yojson contact_to_yojson tree

let create_invoice_unit_response_to_yojson (x : create_invoice_unit_response) =
  assoc_to_yojson
    [ ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn) ]

let resource_tag_value_to_yojson = string_to_yojson
let resource_tag_key_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Key", Some (resource_tag_key_to_yojson x.key));
      ("Value", Some (resource_tag_value_to_yojson x.value));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree
let rule_account_id_list_to_yojson tree = list_to_yojson account_id_string_to_yojson tree

let invoice_unit_rule_to_yojson (x : invoice_unit_rule) =
  assoc_to_yojson
    [
      ("LinkedAccounts", option_to_yojson rule_account_id_list_to_yojson x.linked_accounts);
      ("BillSourceAccounts", option_to_yojson rule_account_id_list_to_yojson x.bill_source_accounts);
    ]

let tax_inheritance_disabled_flag_to_yojson = bool_to_yojson
let description_string_to_yojson = string_to_yojson
let invoice_unit_name_to_yojson = string_to_yojson

let create_invoice_unit_request_to_yojson (x : create_invoice_unit_request) =
  assoc_to_yojson
    [
      ("Name", Some (invoice_unit_name_to_yojson x.name));
      ("InvoiceReceiver", Some (account_id_string_to_yojson x.invoice_receiver));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ( "TaxInheritanceDisabled",
        option_to_yojson tax_inheritance_disabled_flag_to_yojson x.tax_inheritance_disabled );
      ("Rule", Some (invoice_unit_rule_to_yojson x.rule));
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", Some (basic_string_to_yojson x.message)) ]

let procurement_portal_preference_arn_string_to_yojson = string_to_yojson

let create_procurement_portal_preference_response_to_yojson
    (x : create_procurement_portal_preference_response) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let purchase_order_data_source_type_to_yojson (x : purchase_order_data_source_type) =
  match x with
  | ASSOCIATED_PURCHASE_ORDER_REQUIRED -> `String "ASSOCIATED_PURCHASE_ORDER_REQUIRED"
  | PURCHASE_ORDER_NOT_REQUIRED -> `String "PURCHASE_ORDER_NOT_REQUIRED"

let einvoice_delivery_document_type_to_yojson (x : einvoice_delivery_document_type) =
  match x with
  | AWS_CLOUD_INVOICE -> `String "AWS_CLOUD_INVOICE"
  | AWS_CLOUD_CREDIT_MEMO -> `String "AWS_CLOUD_CREDIT_MEMO"
  | AWS_MARKETPLACE_INVOICE -> `String "AWS_MARKETPLACE_INVOICE"
  | AWS_MARKETPLACE_CREDIT_MEMO -> `String "AWS_MARKETPLACE_CREDIT_MEMO"
  | AWS_REQUEST_FOR_PAYMENT -> `String "AWS_REQUEST_FOR_PAYMENT"

let purchase_order_data_source_to_yojson (x : purchase_order_data_source) =
  assoc_to_yojson
    [
      ( "EinvoiceDeliveryDocumentType",
        option_to_yojson einvoice_delivery_document_type_to_yojson x.einvoice_delivery_document_type
      );
      ( "PurchaseOrderDataSourceType",
        option_to_yojson purchase_order_data_source_type_to_yojson x.purchase_order_data_source_type
      );
    ]

let purchase_order_data_sources_to_yojson tree =
  list_to_yojson purchase_order_data_source_to_yojson tree

let protocol_to_yojson (x : protocol) = match x with CXML -> `String "CXML"

let einvoice_delivery_attachment_type_to_yojson (x : einvoice_delivery_attachment_type) =
  match x with INVOICE_PDF -> `String "INVOICE_PDF" | RFP_PDF -> `String "RFP_PDF"

let einvoice_delivery_attachment_types_to_yojson tree =
  list_to_yojson einvoice_delivery_attachment_type_to_yojson tree

let einvoice_delivery_document_types_to_yojson tree =
  list_to_yojson einvoice_delivery_document_type_to_yojson tree

let einvoice_delivery_preference_to_yojson (x : einvoice_delivery_preference) =
  assoc_to_yojson
    [
      ( "EinvoiceDeliveryDocumentTypes",
        Some (einvoice_delivery_document_types_to_yojson x.einvoice_delivery_document_types) );
      ( "EinvoiceDeliveryAttachmentTypes",
        option_to_yojson einvoice_delivery_attachment_types_to_yojson
          x.einvoice_delivery_attachment_types );
      ("Protocol", Some (protocol_to_yojson x.protocol));
      ( "PurchaseOrderDataSources",
        Some (purchase_order_data_sources_to_yojson x.purchase_order_data_sources) );
      ( "ConnectionTestingMethod",
        Some (connection_testing_method_to_yojson x.connection_testing_method) );
      ( "EinvoiceDeliveryActivationDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.einvoice_delivery_activation_date) );
    ]

let supplier_domain_to_yojson (x : supplier_domain) =
  match x with NetworkID -> `String "NetworkID"

let test_env_preference_input_to_yojson (x : test_env_preference_input) =
  assoc_to_yojson
    [
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ( "ProcurementPortalSharedSecret",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_shared_secret );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
    ]

let seller_of_records_to_yojson tree = list_to_yojson basic_string_without_space_to_yojson tree
let invoice_unit_arns_to_yojson tree = list_to_yojson invoice_unit_arn_string_to_yojson tree

let procurement_portal_preference_selector_to_yojson (x : procurement_portal_preference_selector) =
  assoc_to_yojson
    [
      ("InvoiceUnitArns", option_to_yojson invoice_unit_arns_to_yojson x.invoice_unit_arns);
      ("SellerOfRecords", option_to_yojson seller_of_records_to_yojson x.seller_of_records);
    ]

let procurement_portal_name_to_yojson (x : procurement_portal_name) =
  match x with SAP_BUSINESS_NETWORK -> `String "SAP_BUSINESS_NETWORK" | COUPA -> `String "COUPA"

let create_procurement_portal_preference_request_to_yojson
    (x : create_procurement_portal_preference_request) =
  assoc_to_yojson
    [
      ("ProcurementPortalName", Some (procurement_portal_name_to_yojson x.procurement_portal_name));
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ("Selector", option_to_yojson procurement_portal_preference_selector_to_yojson x.selector);
      ( "ProcurementPortalSharedSecret",
        option_to_yojson sensitive_basic_string_without_space_to_yojson
          x.procurement_portal_shared_secret );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "TestEnvPreference",
        option_to_yojson test_env_preference_input_to_yojson x.test_env_preference );
      ( "EinvoiceDeliveryEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.einvoice_delivery_enabled)
      );
      ( "EinvoiceDeliveryPreference",
        option_to_yojson einvoice_delivery_preference_to_yojson x.einvoice_delivery_preference );
      ( "PurchaseOrderRetrievalEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
             x.purchase_order_retrieval_enabled) );
      ("Contacts", Some (contacts_to_yojson x.contacts));
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let currency_code_to_yojson = string_to_yojson

let currency_exchange_details_to_yojson (x : currency_exchange_details) =
  assoc_to_yojson
    [
      ("SourceCurrencyCode", option_to_yojson basic_string_to_yojson x.source_currency_code);
      ("TargetCurrencyCode", option_to_yojson basic_string_to_yojson x.target_currency_code);
      ("Rate", option_to_yojson basic_string_to_yojson x.rate);
    ]

let date_interval_to_yojson (x : date_interval) =
  assoc_to_yojson
    [
      ( "StartDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_date)
      );
      ( "EndDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.end_date) );
    ]

let delete_invoice_unit_response_to_yojson (x : delete_invoice_unit_response) =
  assoc_to_yojson
    [ ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn) ]

let delete_invoice_unit_request_to_yojson (x : delete_invoice_unit_request) =
  assoc_to_yojson
    [
      ("InvoiceUnitArn", Some (invoice_unit_arn_string_to_yojson x.invoice_unit_arn));
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_procurement_portal_preference_response_to_yojson
    (x : delete_procurement_portal_preference_response) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let delete_procurement_portal_preference_request_to_yojson
    (x : delete_procurement_portal_preference_request) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let einvoice_delivery_status_to_yojson (x : einvoice_delivery_status) =
  match x with DELIVERED -> `String "DELIVERED" | NOT_DELIVERED -> `String "NOT_DELIVERED"

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("InvoicingEntity", option_to_yojson basic_string_to_yojson x.invoicing_entity);
      ("BillingEntity", option_to_yojson billing_entity_to_yojson x.billing_entity);
    ]

let invoice_unit_names_to_yojson tree = list_to_yojson invoice_unit_name_to_yojson tree

let filters_to_yojson (x : filters) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson invoice_unit_names_to_yojson x.names);
      ("InvoiceReceivers", option_to_yojson account_id_list_to_yojson x.invoice_receivers);
      ("Accounts", option_to_yojson account_id_list_to_yojson x.accounts);
      ("BillSourceAccounts", option_to_yojson account_id_list_to_yojson x.bill_source_accounts);
    ]

let string_without_new_line_to_yojson = string_to_yojson

let supplemental_document_type_to_yojson (x : supplemental_document_type) =
  match x with
  | GOVERNMENT_INVOICE -> `String "GOVERNMENT_INVOICE"
  | TAX_E_INVOICE -> `String "TAX_E_INVOICE"
  | PAYMENT_RECEIPT -> `String "PAYMENT_RECEIPT"
  | SUPPLEMENT -> `String "SUPPLEMENT"

let supplemental_document_to_yojson (x : supplemental_document) =
  assoc_to_yojson
    [
      ("DocumentType", option_to_yojson supplemental_document_type_to_yojson x.document_type);
      ("DocumentId", option_to_yojson string_without_new_line_to_yojson x.document_id);
      ("DocumentUrl", option_to_yojson string_without_new_line_to_yojson x.document_url);
      ( "DocumentUrlExpirationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.document_url_expiration_date );
    ]

let supplemental_documents_to_yojson tree = list_to_yojson supplemental_document_to_yojson tree

let invoice_pd_f_to_yojson (x : invoice_pd_f) =
  assoc_to_yojson
    [
      ("InvoiceId", option_to_yojson string_without_new_line_to_yojson x.invoice_id);
      ("DocumentUrl", option_to_yojson string_without_new_line_to_yojson x.document_url);
      ( "DocumentUrlExpirationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.document_url_expiration_date );
      ( "SupplementalDocuments",
        option_to_yojson supplemental_documents_to_yojson x.supplemental_documents );
    ]

let get_invoice_pdf_response_to_yojson (x : get_invoice_pdf_response) =
  assoc_to_yojson [ ("InvoicePDF", option_to_yojson invoice_pd_f_to_yojson x.invoice_pd_f) ]

let get_invoice_pdf_request_to_yojson (x : get_invoice_pdf_request) =
  assoc_to_yojson [ ("InvoiceId", Some (string_without_new_line_to_yojson x.invoice_id)) ]

let last_modified_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let get_invoice_unit_response_to_yojson (x : get_invoice_unit_response) =
  assoc_to_yojson
    [
      ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn);
      ("InvoiceReceiver", option_to_yojson account_id_string_to_yojson x.invoice_receiver);
      ("Name", option_to_yojson invoice_unit_name_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ( "TaxInheritanceDisabled",
        option_to_yojson tax_inheritance_disabled_flag_to_yojson x.tax_inheritance_disabled );
      ("Rule", option_to_yojson invoice_unit_rule_to_yojson x.rule);
      ("LastModified", option_to_yojson last_modified_timestamp_to_yojson x.last_modified);
    ]

let get_invoice_unit_request_to_yojson (x : get_invoice_unit_request) =
  assoc_to_yojson
    [
      ("InvoiceUnitArn", Some (invoice_unit_arn_string_to_yojson x.invoice_unit_arn));
      ("AsOf", option_to_yojson as_of_timestamp_to_yojson x.as_of);
    ]

let procurement_portal_preference_status_to_yojson (x : procurement_portal_preference_status) =
  match x with
  | PENDING_VERIFICATION -> `String "PENDING_VERIFICATION"
  | TEST_INITIALIZED -> `String "TEST_INITIALIZED"
  | TEST_INITIALIZATION_FAILED -> `String "TEST_INITIALIZATION_FAILED"
  | TEST_FAILED -> `String "TEST_FAILED"
  | ACTIVE -> `String "ACTIVE"
  | SUSPENDED -> `String "SUSPENDED"

let test_env_preference_to_yojson (x : test_env_preference) =
  assoc_to_yojson
    [
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ( "ProcurementPortalSharedSecret",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_shared_secret );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "PurchaseOrderRetrievalEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.purchase_order_retrieval_endpoint );
    ]

let procurement_portal_preference_to_yojson (x : procurement_portal_preference) =
  assoc_to_yojson
    [
      ("AwsAccountId", Some (account_id_string_to_yojson x.aws_account_id));
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
      ("ProcurementPortalName", Some (procurement_portal_name_to_yojson x.procurement_portal_name));
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ("Selector", option_to_yojson procurement_portal_preference_selector_to_yojson x.selector);
      ( "ProcurementPortalSharedSecret",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_shared_secret );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "PurchaseOrderRetrievalEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.purchase_order_retrieval_endpoint );
      ("TestEnvPreference", option_to_yojson test_env_preference_to_yojson x.test_env_preference);
      ( "EinvoiceDeliveryEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.einvoice_delivery_enabled)
      );
      ( "EinvoiceDeliveryPreference",
        option_to_yojson einvoice_delivery_preference_to_yojson x.einvoice_delivery_preference );
      ( "PurchaseOrderRetrievalEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
             x.purchase_order_retrieval_enabled) );
      ("Contacts", option_to_yojson contacts_to_yojson x.contacts);
      ( "EinvoiceDeliveryPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.einvoice_delivery_preference_status );
      ( "EinvoiceDeliveryPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.einvoice_delivery_preference_status_reason );
      ( "PurchaseOrderRetrievalPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.purchase_order_retrieval_preference_status );
      ( "PurchaseOrderRetrievalPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.purchase_order_retrieval_preference_status_reason
      );
      ("Version", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.version));
      ( "CreateDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.create_date)
      );
      ( "LastUpdateDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_update_date) );
    ]

let get_procurement_portal_preference_response_to_yojson
    (x : get_procurement_portal_preference_response) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreference",
        Some (procurement_portal_preference_to_yojson x.procurement_portal_preference) );
    ]

let get_procurement_portal_preference_request_to_yojson
    (x : get_procurement_portal_preference_request) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let invoice_currency_amount_to_yojson (x : invoice_currency_amount) =
  assoc_to_yojson
    [
      ("TotalAmount", option_to_yojson basic_string_to_yojson x.total_amount);
      ("TotalAmountBeforeTax", option_to_yojson basic_string_to_yojson x.total_amount_before_tax);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("AmountBreakdown", option_to_yojson amount_breakdown_to_yojson x.amount_breakdown);
      ( "CurrencyExchangeDetails",
        option_to_yojson currency_exchange_details_to_yojson x.currency_exchange_details );
    ]

let invoice_frequency_to_yojson (x : invoice_frequency) =
  match x with ONE_TIME -> `String "ONE_TIME" | RECURRING -> `String "RECURRING"

let tax_authority_status_to_yojson (x : tax_authority_status) =
  match x with ISSUED -> `String "ISSUED" | CANCELLED -> `String "CANCELLED"

let invoice_type_to_yojson (x : invoice_type) =
  match x with
  | INVOICE -> `String "INVOICE"
  | CREDIT_MEMO -> `String "CREDIT_MEMO"
  | PAYMENT_RECEIPT -> `String "PAYMENT_RECEIPT"

let receiver_role_to_yojson (x : receiver_role) =
  match x with
  | SELLER -> `String "SELLER"
  | RESELLER -> `String "RESELLER"
  | BUYER -> `String "BUYER"

let invoice_summary_to_yojson (x : invoice_summary) =
  assoc_to_yojson
    [
      ("AccountId", option_to_yojson account_id_string_to_yojson x.account_id);
      ("InvoiceId", option_to_yojson basic_string_to_yojson x.invoice_id);
      ( "IssuedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.issued_date );
      ( "DueDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.due_date );
      ( "BillSourceAccounts",
        option_to_yojson bill_source_account_list_to_yojson x.bill_source_accounts );
      ( "BillSourceAccountsTotalCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.bill_source_accounts_total_count );
      ("ReceiverRole", option_to_yojson receiver_role_to_yojson x.receiver_role);
      ("Entity", option_to_yojson entity_to_yojson x.entity);
      ("BillingPeriod", option_to_yojson billing_period_to_yojson x.billing_period);
      ("InvoiceFrequency", option_to_yojson invoice_frequency_to_yojson x.invoice_frequency);
      ("BillType", option_to_yojson bill_type_to_yojson x.bill_type);
      ("InvoiceType", option_to_yojson invoice_type_to_yojson x.invoice_type);
      ("CommercialInvoiceId", option_to_yojson basic_string_to_yojson x.commercial_invoice_id);
      ("OriginalInvoiceId", option_to_yojson basic_string_to_yojson x.original_invoice_id);
      ("PurchaseOrderNumber", option_to_yojson basic_string_to_yojson x.purchase_order_number);
      ( "EinvoiceDeliveryStatus",
        option_to_yojson einvoice_delivery_status_to_yojson x.einvoice_delivery_status );
      ("TaxAuthorityStatus", option_to_yojson tax_authority_status_to_yojson x.tax_authority_status);
      ( "BaseCurrencyAmount",
        option_to_yojson invoice_currency_amount_to_yojson x.base_currency_amount );
      ("TaxCurrencyAmount", option_to_yojson invoice_currency_amount_to_yojson x.tax_currency_amount);
      ( "PaymentCurrencyAmount",
        option_to_yojson invoice_currency_amount_to_yojson x.payment_currency_amount );
    ]

let invoice_summaries_to_yojson tree = list_to_yojson invoice_summary_to_yojson tree

let invoice_summaries_filter_to_yojson (x : invoice_summaries_filter) =
  assoc_to_yojson
    [
      ("TimeInterval", option_to_yojson date_interval_to_yojson x.time_interval);
      ("BillingPeriod", option_to_yojson billing_period_to_yojson x.billing_period);
      ("InvoicingEntity", option_to_yojson basic_string_to_yojson x.invoicing_entity);
      ("ReceiverRole", option_to_yojson receiver_role_to_yojson x.receiver_role);
    ]

let invoice_summaries_max_results_to_yojson = int_to_yojson

let list_invoice_summaries_resource_type_to_yojson (x : list_invoice_summaries_resource_type) =
  match x with ACCOUNT_ID -> `String "ACCOUNT_ID" | INVOICE_ID -> `String "INVOICE_ID"

let invoice_summaries_selector_to_yojson (x : invoice_summaries_selector) =
  assoc_to_yojson
    [
      ("ResourceType", Some (list_invoice_summaries_resource_type_to_yojson x.resource_type));
      ("Value", Some (string_without_new_line_to_yojson x.value));
    ]

let invoice_unit_to_yojson (x : invoice_unit) =
  assoc_to_yojson
    [
      ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn);
      ("InvoiceReceiver", option_to_yojson account_id_string_to_yojson x.invoice_receiver);
      ("Name", option_to_yojson invoice_unit_name_to_yojson x.name);
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ( "TaxInheritanceDisabled",
        option_to_yojson tax_inheritance_disabled_flag_to_yojson x.tax_inheritance_disabled );
      ("Rule", option_to_yojson invoice_unit_rule_to_yojson x.rule);
      ("LastModified", option_to_yojson last_modified_timestamp_to_yojson x.last_modified);
    ]

let invoice_units_to_yojson tree = list_to_yojson invoice_unit_to_yojson tree

let update_procurement_portal_preference_status_response_to_yojson
    (x : update_procurement_portal_preference_status_response) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let update_procurement_portal_preference_status_request_to_yojson
    (x : update_procurement_portal_preference_status_request) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
      ( "EinvoiceDeliveryPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.einvoice_delivery_preference_status );
      ( "EinvoiceDeliveryPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.einvoice_delivery_preference_status_reason );
      ( "PurchaseOrderRetrievalPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.purchase_order_retrieval_preference_status );
      ( "PurchaseOrderRetrievalPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.purchase_order_retrieval_preference_status_reason
      );
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let update_invoice_unit_response_to_yojson (x : update_invoice_unit_response) =
  assoc_to_yojson
    [ ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn) ]

let update_invoice_unit_request_to_yojson (x : update_invoice_unit_request) =
  assoc_to_yojson
    [
      ("InvoiceUnitArn", Some (invoice_unit_arn_string_to_yojson x.invoice_unit_arn));
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ( "TaxInheritanceDisabled",
        option_to_yojson tax_inheritance_disabled_flag_to_yojson x.tax_inheritance_disabled );
      ("Rule", option_to_yojson invoice_unit_rule_to_yojson x.rule);
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree
let tagris_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (tagris_arn_to_yojson x.resource_arn));
      ("ResourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (tagris_arn_to_yojson x.resource_arn));
      ("ResourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
    ]

let put_procurement_portal_preference_response_to_yojson
    (x : put_procurement_portal_preference_response) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let put_procurement_portal_preference_request_to_yojson
    (x : put_procurement_portal_preference_request) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
      ("Selector", option_to_yojson procurement_portal_preference_selector_to_yojson x.selector);
      ( "ProcurementPortalSharedSecret",
        option_to_yojson sensitive_basic_string_without_space_to_yojson
          x.procurement_portal_shared_secret );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "TestEnvPreference",
        option_to_yojson test_env_preference_input_to_yojson x.test_env_preference );
      ( "EinvoiceDeliveryEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.einvoice_delivery_enabled)
      );
      ( "EinvoiceDeliveryPreference",
        option_to_yojson einvoice_delivery_preference_to_yojson x.einvoice_delivery_preference );
      ( "PurchaseOrderRetrievalEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
             x.purchase_order_retrieval_enabled) );
      ("Contacts", Some (contacts_to_yojson x.contacts));
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (tagris_arn_to_yojson x.resource_arn)) ]

let procurement_portal_preference_summary_to_yojson (x : procurement_portal_preference_summary) =
  assoc_to_yojson
    [
      ("AwsAccountId", Some (account_id_string_to_yojson x.aws_account_id));
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
      ("ProcurementPortalName", Some (procurement_portal_name_to_yojson x.procurement_portal_name));
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ("Selector", option_to_yojson procurement_portal_preference_selector_to_yojson x.selector);
      ( "EinvoiceDeliveryEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.einvoice_delivery_enabled)
      );
      ( "PurchaseOrderRetrievalEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
             x.purchase_order_retrieval_enabled) );
      ( "EinvoiceDeliveryPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.einvoice_delivery_preference_status );
      ( "EinvoiceDeliveryPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.einvoice_delivery_preference_status_reason );
      ( "PurchaseOrderRetrievalPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.purchase_order_retrieval_preference_status );
      ( "PurchaseOrderRetrievalPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.purchase_order_retrieval_preference_status_reason
      );
      ("Version", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.version));
      ( "CreateDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.create_date)
      );
      ( "LastUpdateDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_update_date) );
    ]

let procurement_portal_preference_summaries_to_yojson tree =
  list_to_yojson procurement_portal_preference_summary_to_yojson tree

let list_procurement_portal_preferences_response_to_yojson
    (x : list_procurement_portal_preferences_response) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferences",
        option_to_yojson procurement_portal_preference_summaries_to_yojson
          x.procurement_portal_preferences );
      ("NextToken", option_to_yojson basic_string_without_space_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_procurement_portal_preferences_request_to_yojson
    (x : list_procurement_portal_preferences_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson basic_string_without_space_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let next_token_string_to_yojson = string_to_yojson

let list_invoice_units_response_to_yojson (x : list_invoice_units_response) =
  assoc_to_yojson
    [
      ("InvoiceUnits", option_to_yojson invoice_units_to_yojson x.invoice_units);
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
    ]

let max_results_integer_to_yojson = int_to_yojson

let list_invoice_units_request_to_yojson (x : list_invoice_units_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("AsOf", option_to_yojson as_of_timestamp_to_yojson x.as_of);
    ]

let list_invoice_summaries_response_to_yojson (x : list_invoice_summaries_response) =
  assoc_to_yojson
    [
      ("InvoiceSummaries", Some (invoice_summaries_to_yojson x.invoice_summaries));
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
    ]

let list_invoice_summaries_request_to_yojson (x : list_invoice_summaries_request) =
  assoc_to_yojson
    [
      ("Selector", Some (invoice_summaries_selector_to_yojson x.selector));
      ("Filter", option_to_yojson invoice_summaries_filter_to_yojson x.filter);
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson invoice_summaries_max_results_to_yojson x.max_results);
    ]
