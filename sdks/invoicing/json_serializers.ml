open Smaws_Lib.Json.SerializeHelpers
open Types

let year_to_yojson = int_to_yojson

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | INVALID_INPUT -> `String "invalidInput"
  | INVALID_NEXT_TOKEN -> `String "invalidNextToken"
  | EXPIRED_NEXT_TOKEN -> `String "expiredNextToken"
  | TAX_SETTINGS_ERROR -> `String "taxSettingsError"
  | ACCOUNT_MEMBERSHIP_ERROR -> `String "accountMembershipError"
  | MUTUAL_EXCLUSION_ERROR -> `String "mutualExclusionError"
  | DUPLICATE_INVOICE_UNIT -> `String "duplicateInvoiceUnit"
  | MAX_INVOICE_UNITS_EXCEEDED -> `String "maxInvoiceUnitsExceeded"
  | MAX_ACCOUNTS_EXCEEDED -> `String "maxAccountsExceeded"
  | NON_MEMBERS_PRESENT -> `String "nonMemberPresent"

let basic_string_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (basic_string_to_yojson x.message));
      ("name", Some (basic_string_to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let invoice_unit_arn_string_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("resourceName", option_to_yojson invoice_unit_arn_string_to_yojson x.resource_name);
      ("message", option_to_yojson basic_string_to_yojson x.message);
    ]

let procurement_portal_preference_arn_string_to_yojson = string_to_yojson

let update_procurement_portal_preference_status_response_to_yojson
    (x : update_procurement_portal_preference_status_response) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let procurement_portal_preference_status_to_yojson (x : procurement_portal_preference_status) =
  match x with
  | SUSPENDED -> `String "SUSPENDED"
  | ACTIVE -> `String "ACTIVE"
  | TEST_FAILED -> `String "TEST_FAILED"
  | TEST_INITIALIZATION_FAILED -> `String "TEST_INITIALIZATION_FAILED"
  | TEST_INITIALIZED -> `String "TEST_INITIALIZED"
  | PENDING_VERIFICATION -> `String "PENDING_VERIFICATION"

let basic_string_without_space_to_yojson = string_to_yojson

let update_procurement_portal_preference_status_request_to_yojson
    (x : update_procurement_portal_preference_status_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "PurchaseOrderRetrievalPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.purchase_order_retrieval_preference_status_reason
      );
      ( "PurchaseOrderRetrievalPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.purchase_order_retrieval_preference_status );
      ( "EinvoiceDeliveryPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.einvoice_delivery_preference_status_reason );
      ( "EinvoiceDeliveryPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.einvoice_delivery_preference_status );
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson basic_string_to_yojson x.message) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", Some (basic_string_to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson invoice_unit_arn_string_to_yojson x.resource_name);
      ("message", option_to_yojson basic_string_to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson basic_string_to_yojson x.message);
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("resourceType", option_to_yojson basic_string_to_yojson x.resource_type);
      ("resourceId", option_to_yojson basic_string_to_yojson x.resource_id);
      ("message", option_to_yojson basic_string_to_yojson x.message);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson invoice_unit_arn_string_to_yojson x.resource_name);
      ("message", option_to_yojson basic_string_to_yojson x.message);
    ]

let update_invoice_unit_response_to_yojson (x : update_invoice_unit_response) =
  assoc_to_yojson
    [ ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn) ]

let description_string_to_yojson = string_to_yojson
let tax_inheritance_disabled_flag_to_yojson = bool_to_yojson
let account_id_string_to_yojson = string_to_yojson
let rule_account_id_list_to_yojson tree = list_to_yojson account_id_string_to_yojson tree

let invoice_unit_rule_to_yojson (x : invoice_unit_rule) =
  assoc_to_yojson
    [
      ("BillSourceAccounts", option_to_yojson rule_account_id_list_to_yojson x.bill_source_accounts);
      ("LinkedAccounts", option_to_yojson rule_account_id_list_to_yojson x.linked_accounts);
    ]

let update_invoice_unit_request_to_yojson (x : update_invoice_unit_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Rule", option_to_yojson invoice_unit_rule_to_yojson x.rule);
      ( "TaxInheritanceDisabled",
        option_to_yojson tax_inheritance_disabled_flag_to_yojson x.tax_inheritance_disabled );
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("InvoiceUnitArn", Some (invoice_unit_arn_string_to_yojson x.invoice_unit_arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tagris_arn_to_yojson = string_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
      ("ResourceArn", Some (tagris_arn_to_yojson x.resource_arn));
    ]

let buyer_domain_to_yojson (x : buyer_domain) = match x with NetworkID -> `String "NetworkID"

let supplier_domain_to_yojson (x : supplier_domain) =
  match x with NetworkID -> `String "NetworkID"

let test_env_preference_input_to_yojson (x : test_env_preference_input) =
  assoc_to_yojson
    [
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "ProcurementPortalSharedSecret",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_shared_secret );
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
    ]

let test_env_preference_to_yojson (x : test_env_preference) =
  assoc_to_yojson
    [
      ( "PurchaseOrderRetrievalEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.purchase_order_retrieval_endpoint );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "ProcurementPortalSharedSecret",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_shared_secret );
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
    ]

let taxes_breakdown_amount_to_yojson (x : taxes_breakdown_amount) =
  assoc_to_yojson
    [
      ("Rate", option_to_yojson basic_string_to_yojson x.rate);
      ("Amount", option_to_yojson basic_string_to_yojson x.amount);
      ("Description", option_to_yojson basic_string_to_yojson x.description);
    ]

let taxes_breakdown_amount_list_to_yojson tree =
  list_to_yojson taxes_breakdown_amount_to_yojson tree

let taxes_breakdown_to_yojson (x : taxes_breakdown) =
  assoc_to_yojson
    [
      ("TotalAmount", option_to_yojson basic_string_to_yojson x.total_amount);
      ("Breakdown", option_to_yojson taxes_breakdown_amount_list_to_yojson x.breakdown);
    ]

let tax_authority_status_to_yojson (x : tax_authority_status) =
  match x with CANCELLED -> `String "CANCELLED" | ISSUED -> `String "ISSUED"

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Value", Some (resource_tag_value_to_yojson x.value));
      ("Key", Some (resource_tag_key_to_yojson x.key));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
      ("ResourceArn", Some (tagris_arn_to_yojson x.resource_arn));
    ]

let supplemental_document_type_to_yojson (x : supplemental_document_type) =
  match x with
  | SUPPLEMENT -> `String "SUPPLEMENT"
  | PAYMENT_RECEIPT -> `String "PAYMENT_RECEIPT"
  | TAX_E_INVOICE -> `String "TAX_E_INVOICE"
  | GOVERNMENT_INVOICE -> `String "GOVERNMENT_INVOICE"

let string_without_new_line_to_yojson = string_to_yojson

let supplemental_document_to_yojson (x : supplemental_document) =
  assoc_to_yojson
    [
      ( "DocumentUrlExpirationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.document_url_expiration_date );
      ("DocumentUrl", option_to_yojson string_without_new_line_to_yojson x.document_url);
      ("DocumentId", option_to_yojson string_without_new_line_to_yojson x.document_id);
      ("DocumentType", option_to_yojson supplemental_document_type_to_yojson x.document_type);
    ]

let supplemental_documents_to_yojson tree = list_to_yojson supplemental_document_to_yojson tree
let sensitive_basic_string_without_space_to_yojson = string_to_yojson
let seller_of_records_to_yojson tree = list_to_yojson basic_string_without_space_to_yojson tree

let receiver_role_to_yojson (x : receiver_role) =
  match x with
  | BUYER -> `String "BUYER"
  | RESELLER -> `String "RESELLER"
  | SELLER -> `String "SELLER"

let receiver_address_to_yojson (x : receiver_address) =
  assoc_to_yojson
    [
      ("PostalCode", option_to_yojson basic_string_to_yojson x.postal_code);
      ("CompanyName", option_to_yojson basic_string_to_yojson x.company_name);
      ("CountryCode", option_to_yojson basic_string_to_yojson x.country_code);
      ("StateOrRegion", option_to_yojson basic_string_to_yojson x.state_or_region);
      ("City", option_to_yojson basic_string_to_yojson x.city);
      ("DistrictOrCounty", option_to_yojson basic_string_to_yojson x.district_or_county);
      ("AddressLine3", option_to_yojson basic_string_to_yojson x.address_line3);
      ("AddressLine2", option_to_yojson basic_string_to_yojson x.address_line2);
      ("AddressLine1", option_to_yojson basic_string_to_yojson x.address_line1);
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

let invoice_unit_arns_to_yojson tree = list_to_yojson invoice_unit_arn_string_to_yojson tree

let procurement_portal_preference_selector_to_yojson (x : procurement_portal_preference_selector) =
  assoc_to_yojson
    [
      ("SellerOfRecords", option_to_yojson seller_of_records_to_yojson x.seller_of_records);
      ("InvoiceUnitArns", option_to_yojson invoice_unit_arns_to_yojson x.invoice_unit_arns);
    ]

let einvoice_delivery_document_type_to_yojson (x : einvoice_delivery_document_type) =
  match x with
  | AWS_REQUEST_FOR_PAYMENT -> `String "AWS_REQUEST_FOR_PAYMENT"
  | AWS_MARKETPLACE_CREDIT_MEMO -> `String "AWS_MARKETPLACE_CREDIT_MEMO"
  | AWS_MARKETPLACE_INVOICE -> `String "AWS_MARKETPLACE_INVOICE"
  | AWS_CLOUD_CREDIT_MEMO -> `String "AWS_CLOUD_CREDIT_MEMO"
  | AWS_CLOUD_INVOICE -> `String "AWS_CLOUD_INVOICE"

let einvoice_delivery_document_types_to_yojson tree =
  list_to_yojson einvoice_delivery_document_type_to_yojson tree

let einvoice_delivery_attachment_type_to_yojson (x : einvoice_delivery_attachment_type) =
  match x with RFP_PDF -> `String "RFP_PDF" | INVOICE_PDF -> `String "INVOICE_PDF"

let einvoice_delivery_attachment_types_to_yojson tree =
  list_to_yojson einvoice_delivery_attachment_type_to_yojson tree

let protocol_to_yojson (x : protocol) = match x with CXML -> `String "CXML"

let purchase_order_data_source_type_to_yojson (x : purchase_order_data_source_type) =
  match x with
  | PURCHASE_ORDER_NOT_REQUIRED -> `String "PURCHASE_ORDER_NOT_REQUIRED"
  | ASSOCIATED_PURCHASE_ORDER_REQUIRED -> `String "ASSOCIATED_PURCHASE_ORDER_REQUIRED"

let purchase_order_data_source_to_yojson (x : purchase_order_data_source) =
  assoc_to_yojson
    [
      ( "PurchaseOrderDataSourceType",
        option_to_yojson purchase_order_data_source_type_to_yojson x.purchase_order_data_source_type
      );
      ( "EinvoiceDeliveryDocumentType",
        option_to_yojson einvoice_delivery_document_type_to_yojson x.einvoice_delivery_document_type
      );
    ]

let purchase_order_data_sources_to_yojson tree =
  list_to_yojson purchase_order_data_source_to_yojson tree

let connection_testing_method_to_yojson (x : connection_testing_method) =
  match x with
  | TEST_ENV_REPLAY_TEST -> `String "TEST_ENV_REPLAY_TEST"
  | PROD_ENV_DOLLAR_TEST -> `String "PROD_ENV_DOLLAR_TEST"

let einvoice_delivery_preference_to_yojson (x : einvoice_delivery_preference) =
  assoc_to_yojson
    [
      ( "EinvoiceDeliveryActivationDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.einvoice_delivery_activation_date) );
      ( "ConnectionTestingMethod",
        Some (connection_testing_method_to_yojson x.connection_testing_method) );
      ( "PurchaseOrderDataSources",
        Some (purchase_order_data_sources_to_yojson x.purchase_order_data_sources) );
      ("Protocol", Some (protocol_to_yojson x.protocol));
      ( "EinvoiceDeliveryAttachmentTypes",
        option_to_yojson einvoice_delivery_attachment_types_to_yojson
          x.einvoice_delivery_attachment_types );
      ( "EinvoiceDeliveryDocumentTypes",
        Some (einvoice_delivery_document_types_to_yojson x.einvoice_delivery_document_types) );
    ]

let email_string_to_yojson = string_to_yojson

let contact_to_yojson (x : contact) =
  assoc_to_yojson
    [
      ("Email", option_to_yojson email_string_to_yojson x.email);
      ("Name", option_to_yojson basic_string_to_yojson x.name);
    ]

let contacts_to_yojson tree = list_to_yojson contact_to_yojson tree

let put_procurement_portal_preference_request_to_yojson
    (x : put_procurement_portal_preference_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Contacts", Some (contacts_to_yojson x.contacts));
      ( "PurchaseOrderRetrievalEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
             x.purchase_order_retrieval_enabled) );
      ( "EinvoiceDeliveryPreference",
        option_to_yojson einvoice_delivery_preference_to_yojson x.einvoice_delivery_preference );
      ( "EinvoiceDeliveryEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.einvoice_delivery_enabled)
      );
      ( "TestEnvPreference",
        option_to_yojson test_env_preference_input_to_yojson x.test_env_preference );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "ProcurementPortalSharedSecret",
        option_to_yojson sensitive_basic_string_without_space_to_yojson
          x.procurement_portal_shared_secret );
      ("Selector", option_to_yojson procurement_portal_preference_selector_to_yojson x.selector);
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let invoice_profile_to_yojson (x : invoice_profile) =
  assoc_to_yojson
    [
      ( "TaxRegistrationNumber",
        option_to_yojson sensitive_basic_string_without_space_to_yojson x.tax_registration_number );
      ("Issuer", option_to_yojson basic_string_without_space_to_yojson x.issuer);
      ( "ReceiverEmail",
        option_to_yojson sensitive_basic_string_without_space_to_yojson x.receiver_email );
      ("ReceiverAddress", option_to_yojson receiver_address_to_yojson x.receiver_address);
      ("ReceiverName", option_to_yojson basic_string_without_space_to_yojson x.receiver_name);
      ("AccountId", option_to_yojson account_id_string_to_yojson x.account_id);
    ]

let profile_list_to_yojson tree = list_to_yojson invoice_profile_to_yojson tree

let procurement_portal_name_to_yojson (x : procurement_portal_name) =
  match x with COUPA -> `String "COUPA" | SAP_BUSINESS_NETWORK -> `String "SAP_BUSINESS_NETWORK"

let procurement_portal_preference_summary_to_yojson (x : procurement_portal_preference_summary) =
  assoc_to_yojson
    [
      ( "LastUpdateDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_update_date) );
      ( "CreateDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.create_date)
      );
      ("Version", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.version));
      ( "PurchaseOrderRetrievalPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.purchase_order_retrieval_preference_status_reason
      );
      ( "PurchaseOrderRetrievalPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.purchase_order_retrieval_preference_status );
      ( "EinvoiceDeliveryPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.einvoice_delivery_preference_status_reason );
      ( "EinvoiceDeliveryPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.einvoice_delivery_preference_status );
      ( "PurchaseOrderRetrievalEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
             x.purchase_order_retrieval_enabled) );
      ( "EinvoiceDeliveryEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.einvoice_delivery_enabled)
      );
      ("Selector", option_to_yojson procurement_portal_preference_selector_to_yojson x.selector);
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
      ("ProcurementPortalName", Some (procurement_portal_name_to_yojson x.procurement_portal_name));
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
      ("AwsAccountId", Some (account_id_string_to_yojson x.aws_account_id));
    ]

let procurement_portal_preference_summaries_to_yojson tree =
  list_to_yojson procurement_portal_preference_summary_to_yojson tree

let procurement_portal_preference_to_yojson (x : procurement_portal_preference) =
  assoc_to_yojson
    [
      ( "LastUpdateDate",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_update_date) );
      ( "CreateDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.create_date)
      );
      ("Version", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.version));
      ( "PurchaseOrderRetrievalPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.purchase_order_retrieval_preference_status_reason
      );
      ( "PurchaseOrderRetrievalPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.purchase_order_retrieval_preference_status );
      ( "EinvoiceDeliveryPreferenceStatusReason",
        option_to_yojson basic_string_to_yojson x.einvoice_delivery_preference_status_reason );
      ( "EinvoiceDeliveryPreferenceStatus",
        option_to_yojson procurement_portal_preference_status_to_yojson
          x.einvoice_delivery_preference_status );
      ("Contacts", option_to_yojson contacts_to_yojson x.contacts);
      ( "PurchaseOrderRetrievalEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
             x.purchase_order_retrieval_enabled) );
      ( "EinvoiceDeliveryPreference",
        option_to_yojson einvoice_delivery_preference_to_yojson x.einvoice_delivery_preference );
      ( "EinvoiceDeliveryEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.einvoice_delivery_enabled)
      );
      ("TestEnvPreference", option_to_yojson test_env_preference_to_yojson x.test_env_preference);
      ( "PurchaseOrderRetrievalEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.purchase_order_retrieval_endpoint );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "ProcurementPortalSharedSecret",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_shared_secret );
      ("Selector", option_to_yojson procurement_portal_preference_selector_to_yojson x.selector);
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
      ("ProcurementPortalName", Some (procurement_portal_name_to_yojson x.procurement_portal_name));
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
      ("AwsAccountId", Some (account_id_string_to_yojson x.aws_account_id));
    ]

let next_token_string_to_yojson = string_to_yojson
let month_to_yojson = int_to_yojson
let max_results_integer_to_yojson = int_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (tagris_arn_to_yojson x.resource_arn)) ]

let list_procurement_portal_preferences_response_to_yojson
    (x : list_procurement_portal_preferences_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson basic_string_without_space_to_yojson x.next_token);
      ( "ProcurementPortalPreferences",
        option_to_yojson procurement_portal_preference_summaries_to_yojson
          x.procurement_portal_preferences );
    ]

let list_procurement_portal_preferences_request_to_yojson
    (x : list_procurement_portal_preferences_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson basic_string_without_space_to_yojson x.next_token);
    ]

let invoice_unit_name_to_yojson = string_to_yojson
let last_modified_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let invoice_unit_to_yojson (x : invoice_unit) =
  assoc_to_yojson
    [
      ("LastModified", option_to_yojson last_modified_timestamp_to_yojson x.last_modified);
      ("Rule", option_to_yojson invoice_unit_rule_to_yojson x.rule);
      ( "TaxInheritanceDisabled",
        option_to_yojson tax_inheritance_disabled_flag_to_yojson x.tax_inheritance_disabled );
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson invoice_unit_name_to_yojson x.name);
      ("InvoiceReceiver", option_to_yojson account_id_string_to_yojson x.invoice_receiver);
      ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn);
    ]

let invoice_units_to_yojson tree = list_to_yojson invoice_unit_to_yojson tree

let list_invoice_units_response_to_yojson (x : list_invoice_units_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
      ("InvoiceUnits", option_to_yojson invoice_units_to_yojson x.invoice_units);
    ]

let invoice_unit_names_to_yojson tree = list_to_yojson invoice_unit_name_to_yojson tree
let account_id_list_to_yojson tree = list_to_yojson account_id_string_to_yojson tree

let filters_to_yojson (x : filters) =
  assoc_to_yojson
    [
      ("BillSourceAccounts", option_to_yojson account_id_list_to_yojson x.bill_source_accounts);
      ("Accounts", option_to_yojson account_id_list_to_yojson x.accounts);
      ("InvoiceReceivers", option_to_yojson account_id_list_to_yojson x.invoice_receivers);
      ("Names", option_to_yojson invoice_unit_names_to_yojson x.names);
    ]

let as_of_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let list_invoice_units_request_to_yojson (x : list_invoice_units_request) =
  assoc_to_yojson
    [
      ("AsOf", option_to_yojson as_of_timestamp_to_yojson x.as_of);
      ("MaxResults", option_to_yojson max_results_integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let bill_source_account_list_to_yojson tree = list_to_yojson account_id_string_to_yojson tree

let billing_entity_to_yojson (x : billing_entity) =
  match x with AWS_MARKETPLACE -> `String "AWS_MARKETPLACE" | AWS -> `String "AWS"

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("BillingEntity", option_to_yojson billing_entity_to_yojson x.billing_entity);
      ("InvoicingEntity", option_to_yojson basic_string_to_yojson x.invoicing_entity);
    ]

let billing_period_to_yojson (x : billing_period) =
  assoc_to_yojson
    [ ("Year", Some (year_to_yojson x.year)); ("Month", Some (month_to_yojson x.month)) ]

let invoice_frequency_to_yojson (x : invoice_frequency) =
  match x with RECURRING -> `String "RECURRING" | ONE_TIME -> `String "ONE_TIME"

let bill_type_to_yojson (x : bill_type) =
  match x with
  | REFUND -> `String "REFUND"
  | PURCHASE -> `String "PURCHASE"
  | ANNIVERSARY -> `String "ANNIVERSARY"

let invoice_type_to_yojson (x : invoice_type) =
  match x with
  | PAYMENT_RECEIPT -> `String "PAYMENT_RECEIPT"
  | CREDIT_MEMO -> `String "CREDIT_MEMO"
  | INVOICE -> `String "INVOICE"

let einvoice_delivery_status_to_yojson (x : einvoice_delivery_status) =
  match x with NOT_DELIVERED -> `String "NOT_DELIVERED" | DELIVERED -> `String "DELIVERED"

let currency_code_to_yojson = string_to_yojson

let discounts_breakdown_amount_to_yojson (x : discounts_breakdown_amount) =
  assoc_to_yojson
    [
      ("Rate", option_to_yojson basic_string_to_yojson x.rate);
      ("Amount", option_to_yojson basic_string_to_yojson x.amount);
      ("Description", option_to_yojson basic_string_to_yojson x.description);
    ]

let discounts_breakdown_amount_list_to_yojson tree =
  list_to_yojson discounts_breakdown_amount_to_yojson tree

let discounts_breakdown_to_yojson (x : discounts_breakdown) =
  assoc_to_yojson
    [
      ("TotalAmount", option_to_yojson basic_string_to_yojson x.total_amount);
      ("Breakdown", option_to_yojson discounts_breakdown_amount_list_to_yojson x.breakdown);
    ]

let fees_breakdown_amount_to_yojson (x : fees_breakdown_amount) =
  assoc_to_yojson
    [
      ("Rate", option_to_yojson basic_string_to_yojson x.rate);
      ("Amount", option_to_yojson basic_string_to_yojson x.amount);
      ("Description", option_to_yojson basic_string_to_yojson x.description);
    ]

let fees_breakdown_amount_list_to_yojson tree = list_to_yojson fees_breakdown_amount_to_yojson tree

let fees_breakdown_to_yojson (x : fees_breakdown) =
  assoc_to_yojson
    [
      ("TotalAmount", option_to_yojson basic_string_to_yojson x.total_amount);
      ("Breakdown", option_to_yojson fees_breakdown_amount_list_to_yojson x.breakdown);
    ]

let amount_breakdown_to_yojson (x : amount_breakdown) =
  assoc_to_yojson
    [
      ("Fees", option_to_yojson fees_breakdown_to_yojson x.fees);
      ("Taxes", option_to_yojson taxes_breakdown_to_yojson x.taxes);
      ("Discounts", option_to_yojson discounts_breakdown_to_yojson x.discounts);
      ("SubTotalAmount", option_to_yojson basic_string_to_yojson x.sub_total_amount);
    ]

let currency_exchange_details_to_yojson (x : currency_exchange_details) =
  assoc_to_yojson
    [
      ("Rate", option_to_yojson basic_string_to_yojson x.rate);
      ("TargetCurrencyCode", option_to_yojson basic_string_to_yojson x.target_currency_code);
      ("SourceCurrencyCode", option_to_yojson basic_string_to_yojson x.source_currency_code);
    ]

let invoice_currency_amount_to_yojson (x : invoice_currency_amount) =
  assoc_to_yojson
    [
      ( "CurrencyExchangeDetails",
        option_to_yojson currency_exchange_details_to_yojson x.currency_exchange_details );
      ("AmountBreakdown", option_to_yojson amount_breakdown_to_yojson x.amount_breakdown);
      ("CurrencyCode", option_to_yojson currency_code_to_yojson x.currency_code);
      ("TotalAmountBeforeTax", option_to_yojson basic_string_to_yojson x.total_amount_before_tax);
      ("TotalAmount", option_to_yojson basic_string_to_yojson x.total_amount);
    ]

let invoice_summary_to_yojson (x : invoice_summary) =
  assoc_to_yojson
    [
      ( "PaymentCurrencyAmount",
        option_to_yojson invoice_currency_amount_to_yojson x.payment_currency_amount );
      ("TaxCurrencyAmount", option_to_yojson invoice_currency_amount_to_yojson x.tax_currency_amount);
      ( "BaseCurrencyAmount",
        option_to_yojson invoice_currency_amount_to_yojson x.base_currency_amount );
      ("TaxAuthorityStatus", option_to_yojson tax_authority_status_to_yojson x.tax_authority_status);
      ( "EinvoiceDeliveryStatus",
        option_to_yojson einvoice_delivery_status_to_yojson x.einvoice_delivery_status );
      ("PurchaseOrderNumber", option_to_yojson basic_string_to_yojson x.purchase_order_number);
      ("OriginalInvoiceId", option_to_yojson basic_string_to_yojson x.original_invoice_id);
      ("CommercialInvoiceId", option_to_yojson basic_string_to_yojson x.commercial_invoice_id);
      ("InvoiceType", option_to_yojson invoice_type_to_yojson x.invoice_type);
      ("BillType", option_to_yojson bill_type_to_yojson x.bill_type);
      ("InvoiceFrequency", option_to_yojson invoice_frequency_to_yojson x.invoice_frequency);
      ("BillingPeriod", option_to_yojson billing_period_to_yojson x.billing_period);
      ("Entity", option_to_yojson entity_to_yojson x.entity);
      ("ReceiverRole", option_to_yojson receiver_role_to_yojson x.receiver_role);
      ( "BillSourceAccountsTotalCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.bill_source_accounts_total_count );
      ( "BillSourceAccounts",
        option_to_yojson bill_source_account_list_to_yojson x.bill_source_accounts );
      ( "DueDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.due_date );
      ( "IssuedDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.issued_date );
      ("InvoiceId", option_to_yojson basic_string_to_yojson x.invoice_id);
      ("AccountId", option_to_yojson account_id_string_to_yojson x.account_id);
    ]

let invoice_summaries_to_yojson tree = list_to_yojson invoice_summary_to_yojson tree

let list_invoice_summaries_response_to_yojson (x : list_invoice_summaries_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
      ("InvoiceSummaries", Some (invoice_summaries_to_yojson x.invoice_summaries));
    ]

let list_invoice_summaries_resource_type_to_yojson (x : list_invoice_summaries_resource_type) =
  match x with INVOICE_ID -> `String "INVOICE_ID" | ACCOUNT_ID -> `String "ACCOUNT_ID"

let invoice_summaries_selector_to_yojson (x : invoice_summaries_selector) =
  assoc_to_yojson
    [
      ("Value", Some (string_without_new_line_to_yojson x.value));
      ("ResourceType", Some (list_invoice_summaries_resource_type_to_yojson x.resource_type));
    ]

let date_interval_to_yojson (x : date_interval) =
  assoc_to_yojson
    [
      ( "EndDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.end_date) );
      ( "StartDate",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_date)
      );
    ]

let invoice_summaries_filter_to_yojson (x : invoice_summaries_filter) =
  assoc_to_yojson
    [
      ("ReceiverRole", option_to_yojson receiver_role_to_yojson x.receiver_role);
      ("InvoicingEntity", option_to_yojson basic_string_to_yojson x.invoicing_entity);
      ("BillingPeriod", option_to_yojson billing_period_to_yojson x.billing_period);
      ("TimeInterval", option_to_yojson date_interval_to_yojson x.time_interval);
    ]

let invoice_summaries_max_results_to_yojson = int_to_yojson

let list_invoice_summaries_request_to_yojson (x : list_invoice_summaries_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson invoice_summaries_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_string_to_yojson x.next_token);
      ("Filter", option_to_yojson invoice_summaries_filter_to_yojson x.filter);
      ("Selector", Some (invoice_summaries_selector_to_yojson x.selector));
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

let get_invoice_unit_response_to_yojson (x : get_invoice_unit_response) =
  assoc_to_yojson
    [
      ("LastModified", option_to_yojson last_modified_timestamp_to_yojson x.last_modified);
      ("Rule", option_to_yojson invoice_unit_rule_to_yojson x.rule);
      ( "TaxInheritanceDisabled",
        option_to_yojson tax_inheritance_disabled_flag_to_yojson x.tax_inheritance_disabled );
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("Name", option_to_yojson invoice_unit_name_to_yojson x.name);
      ("InvoiceReceiver", option_to_yojson account_id_string_to_yojson x.invoice_receiver);
      ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn);
    ]

let get_invoice_unit_request_to_yojson (x : get_invoice_unit_request) =
  assoc_to_yojson
    [
      ("AsOf", option_to_yojson as_of_timestamp_to_yojson x.as_of);
      ("InvoiceUnitArn", Some (invoice_unit_arn_string_to_yojson x.invoice_unit_arn));
    ]

let invoice_pd_f_to_yojson (x : invoice_pd_f) =
  assoc_to_yojson
    [
      ( "SupplementalDocuments",
        option_to_yojson supplemental_documents_to_yojson x.supplemental_documents );
      ( "DocumentUrlExpirationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.document_url_expiration_date );
      ("DocumentUrl", option_to_yojson string_without_new_line_to_yojson x.document_url);
      ("InvoiceId", option_to_yojson string_without_new_line_to_yojson x.invoice_id);
    ]

let get_invoice_pdf_response_to_yojson (x : get_invoice_pdf_response) =
  assoc_to_yojson [ ("InvoicePDF", option_to_yojson invoice_pd_f_to_yojson x.invoice_pd_f) ]

let get_invoice_pdf_request_to_yojson (x : get_invoice_pdf_request) =
  assoc_to_yojson [ ("InvoiceId", Some (string_without_new_line_to_yojson x.invoice_id)) ]

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
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let delete_invoice_unit_response_to_yojson (x : delete_invoice_unit_response) =
  assoc_to_yojson
    [ ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn) ]

let delete_invoice_unit_request_to_yojson (x : delete_invoice_unit_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("InvoiceUnitArn", Some (invoice_unit_arn_string_to_yojson x.invoice_unit_arn));
    ]

let create_procurement_portal_preference_response_to_yojson
    (x : create_procurement_portal_preference_response) =
  assoc_to_yojson
    [
      ( "ProcurementPortalPreferenceArn",
        Some
          (procurement_portal_preference_arn_string_to_yojson x.procurement_portal_preference_arn)
      );
    ]

let create_procurement_portal_preference_request_to_yojson
    (x : create_procurement_portal_preference_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("Contacts", Some (contacts_to_yojson x.contacts));
      ( "PurchaseOrderRetrievalEnabled",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
             x.purchase_order_retrieval_enabled) );
      ( "EinvoiceDeliveryPreference",
        option_to_yojson einvoice_delivery_preference_to_yojson x.einvoice_delivery_preference );
      ( "EinvoiceDeliveryEnabled",
        Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.einvoice_delivery_enabled)
      );
      ( "TestEnvPreference",
        option_to_yojson test_env_preference_input_to_yojson x.test_env_preference );
      ( "ProcurementPortalInstanceEndpoint",
        option_to_yojson basic_string_without_space_to_yojson x.procurement_portal_instance_endpoint
      );
      ( "ProcurementPortalSharedSecret",
        option_to_yojson sensitive_basic_string_without_space_to_yojson
          x.procurement_portal_shared_secret );
      ("Selector", option_to_yojson procurement_portal_preference_selector_to_yojson x.selector);
      ("SupplierIdentifier", Some (basic_string_without_space_to_yojson x.supplier_identifier));
      ("SupplierDomain", Some (supplier_domain_to_yojson x.supplier_domain));
      ("BuyerIdentifier", Some (basic_string_without_space_to_yojson x.buyer_identifier));
      ("BuyerDomain", Some (buyer_domain_to_yojson x.buyer_domain));
      ("ProcurementPortalName", Some (procurement_portal_name_to_yojson x.procurement_portal_name));
    ]

let create_invoice_unit_response_to_yojson (x : create_invoice_unit_response) =
  assoc_to_yojson
    [ ("InvoiceUnitArn", option_to_yojson invoice_unit_arn_string_to_yojson x.invoice_unit_arn) ]

let create_invoice_unit_request_to_yojson (x : create_invoice_unit_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (basic_string_without_space_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("Rule", Some (invoice_unit_rule_to_yojson x.rule));
      ( "TaxInheritanceDisabled",
        option_to_yojson tax_inheritance_disabled_flag_to_yojson x.tax_inheritance_disabled );
      ("Description", option_to_yojson description_string_to_yojson x.description);
      ("InvoiceReceiver", Some (account_id_string_to_yojson x.invoice_receiver));
      ("Name", Some (invoice_unit_name_to_yojson x.name));
    ]

let batch_get_invoice_profile_response_to_yojson (x : batch_get_invoice_profile_response) =
  assoc_to_yojson [ ("Profiles", option_to_yojson profile_list_to_yojson x.profiles) ]

let batch_get_invoice_profile_request_to_yojson (x : batch_get_invoice_profile_request) =
  assoc_to_yojson [ ("AccountIds", Some (account_id_list_to_yojson x.account_ids)) ]
