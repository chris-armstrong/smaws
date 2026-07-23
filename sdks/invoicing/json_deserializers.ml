open Smaws_Lib.Json.DeserializeHelpers
open Types

let invoice_unit_arn_string_of_yojson = string_of_yojson
let basic_string_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key basic_string_of_yojson "message") _list path;
     resource_name =
       option_of_yojson (value_for_key invoice_unit_arn_string_of_yojson "resourceName") _list path;
   }
    : access_denied_exception)

let account_id_string_of_yojson = string_of_yojson
let account_id_list_of_yojson tree path = list_of_yojson account_id_string_of_yojson tree path

let fees_breakdown_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key basic_string_of_yojson "Description") _list path;
     amount = option_of_yojson (value_for_key basic_string_of_yojson "Amount") _list path;
     rate = option_of_yojson (value_for_key basic_string_of_yojson "Rate") _list path;
   }
    : fees_breakdown_amount)

let fees_breakdown_amount_list_of_yojson tree path =
  list_of_yojson fees_breakdown_amount_of_yojson tree path

let fees_breakdown_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     breakdown =
       option_of_yojson (value_for_key fees_breakdown_amount_list_of_yojson "Breakdown") _list path;
     total_amount = option_of_yojson (value_for_key basic_string_of_yojson "TotalAmount") _list path;
   }
    : fees_breakdown)

let taxes_breakdown_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key basic_string_of_yojson "Description") _list path;
     amount = option_of_yojson (value_for_key basic_string_of_yojson "Amount") _list path;
     rate = option_of_yojson (value_for_key basic_string_of_yojson "Rate") _list path;
   }
    : taxes_breakdown_amount)

let taxes_breakdown_amount_list_of_yojson tree path =
  list_of_yojson taxes_breakdown_amount_of_yojson tree path

let taxes_breakdown_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     breakdown =
       option_of_yojson (value_for_key taxes_breakdown_amount_list_of_yojson "Breakdown") _list path;
     total_amount = option_of_yojson (value_for_key basic_string_of_yojson "TotalAmount") _list path;
   }
    : taxes_breakdown)

let discounts_breakdown_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key basic_string_of_yojson "Description") _list path;
     amount = option_of_yojson (value_for_key basic_string_of_yojson "Amount") _list path;
     rate = option_of_yojson (value_for_key basic_string_of_yojson "Rate") _list path;
   }
    : discounts_breakdown_amount)

let discounts_breakdown_amount_list_of_yojson tree path =
  list_of_yojson discounts_breakdown_amount_of_yojson tree path

let discounts_breakdown_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     breakdown =
       option_of_yojson
         (value_for_key discounts_breakdown_amount_list_of_yojson "Breakdown")
         _list path;
     total_amount = option_of_yojson (value_for_key basic_string_of_yojson "TotalAmount") _list path;
   }
    : discounts_breakdown)

let amount_breakdown_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sub_total_amount =
       option_of_yojson (value_for_key basic_string_of_yojson "SubTotalAmount") _list path;
     discounts =
       option_of_yojson (value_for_key discounts_breakdown_of_yojson "Discounts") _list path;
     taxes = option_of_yojson (value_for_key taxes_breakdown_of_yojson "Taxes") _list path;
     fees = option_of_yojson (value_for_key fees_breakdown_of_yojson "Fees") _list path;
   }
    : amount_breakdown)

let as_of_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let basic_string_without_space_of_yojson = string_of_yojson

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key basic_string_of_yojson "name" _list path;
     message = value_for_key basic_string_of_yojson "message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "nonMemberPresent" -> NON_MEMBERS_PRESENT
    | `String "maxAccountsExceeded" -> MAX_ACCOUNTS_EXCEEDED
    | `String "maxInvoiceUnitsExceeded" -> MAX_INVOICE_UNITS_EXCEEDED
    | `String "duplicateInvoiceUnit" -> DUPLICATE_INVOICE_UNIT
    | `String "mutualExclusionError" -> MUTUAL_EXCLUSION_ERROR
    | `String "accountMembershipError" -> ACCOUNT_MEMBERSHIP_ERROR
    | `String "taxSettingsError" -> TAX_SETTINGS_ERROR
    | `String "expiredNextToken" -> EXPIRED_NEXT_TOKEN
    | `String "invalidNextToken" -> INVALID_NEXT_TOKEN
    | `String "invalidInput" -> INVALID_INPUT
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String "other" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key basic_string_of_yojson "message") _list path;
     resource_name =
       option_of_yojson (value_for_key invoice_unit_arn_string_of_yojson "resourceName") _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key basic_string_of_yojson "message") _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key basic_string_of_yojson "message") _list path;
     resource_name =
       option_of_yojson (value_for_key invoice_unit_arn_string_of_yojson "resourceName") _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
     message = option_of_yojson (value_for_key basic_string_of_yojson "message") _list path;
   }
    : internal_server_exception)

let sensitive_basic_string_without_space_of_yojson = string_of_yojson

let receiver_address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address_line1 =
       option_of_yojson (value_for_key basic_string_of_yojson "AddressLine1") _list path;
     address_line2 =
       option_of_yojson (value_for_key basic_string_of_yojson "AddressLine2") _list path;
     address_line3 =
       option_of_yojson (value_for_key basic_string_of_yojson "AddressLine3") _list path;
     district_or_county =
       option_of_yojson (value_for_key basic_string_of_yojson "DistrictOrCounty") _list path;
     city = option_of_yojson (value_for_key basic_string_of_yojson "City") _list path;
     state_or_region =
       option_of_yojson (value_for_key basic_string_of_yojson "StateOrRegion") _list path;
     country_code = option_of_yojson (value_for_key basic_string_of_yojson "CountryCode") _list path;
     company_name = option_of_yojson (value_for_key basic_string_of_yojson "CompanyName") _list path;
     postal_code = option_of_yojson (value_for_key basic_string_of_yojson "PostalCode") _list path;
   }
    : receiver_address)

let invoice_profile_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id =
       option_of_yojson (value_for_key account_id_string_of_yojson "AccountId") _list path;
     receiver_name =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ReceiverName")
         _list path;
     receiver_address =
       option_of_yojson (value_for_key receiver_address_of_yojson "ReceiverAddress") _list path;
     receiver_email =
       option_of_yojson
         (value_for_key sensitive_basic_string_without_space_of_yojson "ReceiverEmail")
         _list path;
     issuer =
       option_of_yojson (value_for_key basic_string_without_space_of_yojson "Issuer") _list path;
     tax_registration_number =
       option_of_yojson
         (value_for_key sensitive_basic_string_without_space_of_yojson "TaxRegistrationNumber")
         _list path;
   }
    : invoice_profile)

let profile_list_of_yojson tree path = list_of_yojson invoice_profile_of_yojson tree path

let batch_get_invoice_profile_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ profiles = option_of_yojson (value_for_key profile_list_of_yojson "Profiles") _list path }
    : batch_get_invoice_profile_response)

let batch_get_invoice_profile_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_ids = value_for_key account_id_list_of_yojson "AccountIds" _list path }
    : batch_get_invoice_profile_request)

let bill_source_account_list_of_yojson tree path =
  list_of_yojson account_id_string_of_yojson tree path

let bill_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ANNIVERSARY" -> ANNIVERSARY
    | `String "PURCHASE" -> PURCHASE
    | `String "REFUND" -> REFUND
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillType" value)
    | _ -> raise (deserialize_wrong_type_error path "BillType")
     : bill_type)
    : bill_type)

let billing_entity_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS" -> AWS
    | `String "AWS_MARKETPLACE" -> AWS_MARKETPLACE
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingEntity" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingEntity")
     : billing_entity)
    : billing_entity)

let year_of_yojson = int_of_yojson
let month_of_yojson = int_of_yojson

let billing_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     month = value_for_key month_of_yojson "Month" _list path;
     year = value_for_key year_of_yojson "Year" _list path;
   }
    : billing_period)

let buyer_domain_of_yojson (tree : t) path =
  ((match tree with
    | `String "NetworkID" -> NetworkID
    | `String value -> raise (deserialize_unknown_enum_value_error path "BuyerDomain" value)
    | _ -> raise (deserialize_wrong_type_error path "BuyerDomain")
     : buyer_domain)
    : buyer_domain)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key basic_string_of_yojson "message") _list path;
     resource_id = option_of_yojson (value_for_key basic_string_of_yojson "resourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key basic_string_of_yojson "resourceType") _list path;
   }
    : conflict_exception)

let connection_testing_method_of_yojson (tree : t) path =
  ((match tree with
    | `String "PROD_ENV_DOLLAR_TEST" -> PROD_ENV_DOLLAR_TEST
    | `String "TEST_ENV_REPLAY_TEST" -> TEST_ENV_REPLAY_TEST
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ConnectionTestingMethod" value)
    | _ -> raise (deserialize_wrong_type_error path "ConnectionTestingMethod")
     : connection_testing_method)
    : connection_testing_method)

let email_string_of_yojson = string_of_yojson

let contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key basic_string_of_yojson "Name") _list path;
     email = option_of_yojson (value_for_key email_string_of_yojson "Email") _list path;
   }
    : contact)

let contacts_of_yojson tree path = list_of_yojson contact_of_yojson tree path

let create_invoice_unit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arn =
       option_of_yojson
         (value_for_key invoice_unit_arn_string_of_yojson "InvoiceUnitArn")
         _list path;
   }
    : create_invoice_unit_response)

let resource_tag_value_of_yojson = string_of_yojson
let resource_tag_key_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key resource_tag_key_of_yojson "Key" _list path;
     value = value_for_key resource_tag_value_of_yojson "Value" _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path
let rule_account_id_list_of_yojson tree path = list_of_yojson account_id_string_of_yojson tree path

let invoice_unit_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     linked_accounts =
       option_of_yojson (value_for_key rule_account_id_list_of_yojson "LinkedAccounts") _list path;
     bill_source_accounts =
       option_of_yojson
         (value_for_key rule_account_id_list_of_yojson "BillSourceAccounts")
         _list path;
   }
    : invoice_unit_rule)

let tax_inheritance_disabled_flag_of_yojson = bool_of_yojson
let description_string_of_yojson = string_of_yojson
let invoice_unit_name_of_yojson = string_of_yojson

let create_invoice_unit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key invoice_unit_name_of_yojson "Name" _list path;
     invoice_receiver = value_for_key account_id_string_of_yojson "InvoiceReceiver" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     tax_inheritance_disabled =
       option_of_yojson
         (value_for_key tax_inheritance_disabled_flag_of_yojson "TaxInheritanceDisabled")
         _list path;
     rule = value_for_key invoice_unit_rule_of_yojson "Rule" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
     client_token =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ClientToken")
         _list path;
   }
    : create_invoice_unit_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key basic_string_of_yojson "message" _list path }
    : service_quota_exceeded_exception)

let procurement_portal_preference_arn_string_of_yojson = string_of_yojson

let create_procurement_portal_preference_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
   }
    : create_procurement_portal_preference_response)

let purchase_order_data_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ASSOCIATED_PURCHASE_ORDER_REQUIRED" -> ASSOCIATED_PURCHASE_ORDER_REQUIRED
    | `String "PURCHASE_ORDER_NOT_REQUIRED" -> PURCHASE_ORDER_NOT_REQUIRED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PurchaseOrderDataSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "PurchaseOrderDataSourceType")
     : purchase_order_data_source_type)
    : purchase_order_data_source_type)

let einvoice_delivery_document_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_CLOUD_INVOICE" -> AWS_CLOUD_INVOICE
    | `String "AWS_CLOUD_CREDIT_MEMO" -> AWS_CLOUD_CREDIT_MEMO
    | `String "AWS_MARKETPLACE_INVOICE" -> AWS_MARKETPLACE_INVOICE
    | `String "AWS_MARKETPLACE_CREDIT_MEMO" -> AWS_MARKETPLACE_CREDIT_MEMO
    | `String "AWS_REQUEST_FOR_PAYMENT" -> AWS_REQUEST_FOR_PAYMENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EinvoiceDeliveryDocumentType" value)
    | _ -> raise (deserialize_wrong_type_error path "EinvoiceDeliveryDocumentType")
     : einvoice_delivery_document_type)
    : einvoice_delivery_document_type)

let purchase_order_data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     einvoice_delivery_document_type =
       option_of_yojson
         (value_for_key einvoice_delivery_document_type_of_yojson "EinvoiceDeliveryDocumentType")
         _list path;
     purchase_order_data_source_type =
       option_of_yojson
         (value_for_key purchase_order_data_source_type_of_yojson "PurchaseOrderDataSourceType")
         _list path;
   }
    : purchase_order_data_source)

let purchase_order_data_sources_of_yojson tree path =
  list_of_yojson purchase_order_data_source_of_yojson tree path

let protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "CXML" -> CXML
    | `String value -> raise (deserialize_unknown_enum_value_error path "Protocol" value)
    | _ -> raise (deserialize_wrong_type_error path "Protocol")
     : protocol)
    : protocol)

let einvoice_delivery_attachment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVOICE_PDF" -> INVOICE_PDF
    | `String "RFP_PDF" -> RFP_PDF
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EinvoiceDeliveryAttachmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "EinvoiceDeliveryAttachmentType")
     : einvoice_delivery_attachment_type)
    : einvoice_delivery_attachment_type)

let einvoice_delivery_attachment_types_of_yojson tree path =
  list_of_yojson einvoice_delivery_attachment_type_of_yojson tree path

let einvoice_delivery_document_types_of_yojson tree path =
  list_of_yojson einvoice_delivery_document_type_of_yojson tree path

let einvoice_delivery_preference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     einvoice_delivery_document_types =
       value_for_key einvoice_delivery_document_types_of_yojson "EinvoiceDeliveryDocumentTypes"
         _list path;
     einvoice_delivery_attachment_types =
       option_of_yojson
         (value_for_key einvoice_delivery_attachment_types_of_yojson
            "EinvoiceDeliveryAttachmentTypes")
         _list path;
     protocol = value_for_key protocol_of_yojson "Protocol" _list path;
     purchase_order_data_sources =
       value_for_key purchase_order_data_sources_of_yojson "PurchaseOrderDataSources" _list path;
     connection_testing_method =
       value_for_key connection_testing_method_of_yojson "ConnectionTestingMethod" _list path;
     einvoice_delivery_activation_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "EinvoiceDeliveryActivationDate" _list path;
   }
    : einvoice_delivery_preference)

let supplier_domain_of_yojson (tree : t) path =
  ((match tree with
    | `String "NetworkID" -> NetworkID
    | `String value -> raise (deserialize_unknown_enum_value_error path "SupplierDomain" value)
    | _ -> raise (deserialize_wrong_type_error path "SupplierDomain")
     : supplier_domain)
    : supplier_domain)

let test_env_preference_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     buyer_domain = value_for_key buyer_domain_of_yojson "BuyerDomain" _list path;
     buyer_identifier =
       value_for_key basic_string_without_space_of_yojson "BuyerIdentifier" _list path;
     supplier_domain = value_for_key supplier_domain_of_yojson "SupplierDomain" _list path;
     supplier_identifier =
       value_for_key basic_string_without_space_of_yojson "SupplierIdentifier" _list path;
     procurement_portal_shared_secret =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ProcurementPortalSharedSecret")
         _list path;
     procurement_portal_instance_endpoint =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ProcurementPortalInstanceEndpoint")
         _list path;
   }
    : test_env_preference_input)

let seller_of_records_of_yojson tree path =
  list_of_yojson basic_string_without_space_of_yojson tree path

let invoice_unit_arns_of_yojson tree path =
  list_of_yojson invoice_unit_arn_string_of_yojson tree path

let procurement_portal_preference_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arns =
       option_of_yojson (value_for_key invoice_unit_arns_of_yojson "InvoiceUnitArns") _list path;
     seller_of_records =
       option_of_yojson (value_for_key seller_of_records_of_yojson "SellerOfRecords") _list path;
   }
    : procurement_portal_preference_selector)

let procurement_portal_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "SAP_BUSINESS_NETWORK" -> SAP_BUSINESS_NETWORK
    | `String "COUPA" -> COUPA
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProcurementPortalName" value)
    | _ -> raise (deserialize_wrong_type_error path "ProcurementPortalName")
     : procurement_portal_name)
    : procurement_portal_name)

let create_procurement_portal_preference_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_name =
       value_for_key procurement_portal_name_of_yojson "ProcurementPortalName" _list path;
     buyer_domain = value_for_key buyer_domain_of_yojson "BuyerDomain" _list path;
     buyer_identifier =
       value_for_key basic_string_without_space_of_yojson "BuyerIdentifier" _list path;
     supplier_domain = value_for_key supplier_domain_of_yojson "SupplierDomain" _list path;
     supplier_identifier =
       value_for_key basic_string_without_space_of_yojson "SupplierIdentifier" _list path;
     selector =
       option_of_yojson
         (value_for_key procurement_portal_preference_selector_of_yojson "Selector")
         _list path;
     procurement_portal_shared_secret =
       option_of_yojson
         (value_for_key sensitive_basic_string_without_space_of_yojson
            "ProcurementPortalSharedSecret")
         _list path;
     procurement_portal_instance_endpoint =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ProcurementPortalInstanceEndpoint")
         _list path;
     test_env_preference =
       option_of_yojson
         (value_for_key test_env_preference_input_of_yojson "TestEnvPreference")
         _list path;
     einvoice_delivery_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "EinvoiceDeliveryEnabled" _list path;
     einvoice_delivery_preference =
       option_of_yojson
         (value_for_key einvoice_delivery_preference_of_yojson "EinvoiceDeliveryPreference")
         _list path;
     purchase_order_retrieval_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "PurchaseOrderRetrievalEnabled" _list path;
     contacts = value_for_key contacts_of_yojson "Contacts" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
     client_token =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ClientToken")
         _list path;
   }
    : create_procurement_portal_preference_request)

let currency_code_of_yojson = string_of_yojson

let currency_exchange_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_currency_code =
       option_of_yojson (value_for_key basic_string_of_yojson "SourceCurrencyCode") _list path;
     target_currency_code =
       option_of_yojson (value_for_key basic_string_of_yojson "TargetCurrencyCode") _list path;
     rate = option_of_yojson (value_for_key basic_string_of_yojson "Rate") _list path;
   }
    : currency_exchange_details)

let date_interval_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "StartDate" _list path;
     end_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "EndDate" _list path;
   }
    : date_interval)

let delete_invoice_unit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arn =
       option_of_yojson
         (value_for_key invoice_unit_arn_string_of_yojson "InvoiceUnitArn")
         _list path;
   }
    : delete_invoice_unit_response)

let delete_invoice_unit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arn = value_for_key invoice_unit_arn_string_of_yojson "InvoiceUnitArn" _list path;
     client_token =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ClientToken")
         _list path;
   }
    : delete_invoice_unit_request)

let delete_procurement_portal_preference_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
   }
    : delete_procurement_portal_preference_response)

let delete_procurement_portal_preference_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
     client_token =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ClientToken")
         _list path;
   }
    : delete_procurement_portal_preference_request)

let einvoice_delivery_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELIVERED" -> DELIVERED
    | `String "NOT_DELIVERED" -> NOT_DELIVERED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EinvoiceDeliveryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EinvoiceDeliveryStatus")
     : einvoice_delivery_status)
    : einvoice_delivery_status)

let entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoicing_entity =
       option_of_yojson (value_for_key basic_string_of_yojson "InvoicingEntity") _list path;
     billing_entity =
       option_of_yojson (value_for_key billing_entity_of_yojson "BillingEntity") _list path;
   }
    : entity)

let invoice_unit_names_of_yojson tree path = list_of_yojson invoice_unit_name_of_yojson tree path

let filters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     names = option_of_yojson (value_for_key invoice_unit_names_of_yojson "Names") _list path;
     invoice_receivers =
       option_of_yojson (value_for_key account_id_list_of_yojson "InvoiceReceivers") _list path;
     accounts = option_of_yojson (value_for_key account_id_list_of_yojson "Accounts") _list path;
     bill_source_accounts =
       option_of_yojson (value_for_key account_id_list_of_yojson "BillSourceAccounts") _list path;
   }
    : filters)

let string_without_new_line_of_yojson = string_of_yojson

let supplemental_document_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "GOVERNMENT_INVOICE" -> GOVERNMENT_INVOICE
    | `String "TAX_E_INVOICE" -> TAX_E_INVOICE
    | `String "PAYMENT_RECEIPT" -> PAYMENT_RECEIPT
    | `String "SUPPLEMENT" -> SUPPLEMENT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SupplementalDocumentType" value)
    | _ -> raise (deserialize_wrong_type_error path "SupplementalDocumentType")
     : supplemental_document_type)
    : supplemental_document_type)

let supplemental_document_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_type =
       option_of_yojson
         (value_for_key supplemental_document_type_of_yojson "DocumentType")
         _list path;
     document_id =
       option_of_yojson (value_for_key string_without_new_line_of_yojson "DocumentId") _list path;
     document_url =
       option_of_yojson (value_for_key string_without_new_line_of_yojson "DocumentUrl") _list path;
     document_url_expiration_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "DocumentUrlExpirationDate")
         _list path;
   }
    : supplemental_document)

let supplemental_documents_of_yojson tree path =
  list_of_yojson supplemental_document_of_yojson tree path

let invoice_pd_f_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_id =
       option_of_yojson (value_for_key string_without_new_line_of_yojson "InvoiceId") _list path;
     document_url =
       option_of_yojson (value_for_key string_without_new_line_of_yojson "DocumentUrl") _list path;
     document_url_expiration_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "DocumentUrlExpirationDate")
         _list path;
     supplemental_documents =
       option_of_yojson
         (value_for_key supplemental_documents_of_yojson "SupplementalDocuments")
         _list path;
   }
    : invoice_pd_f)

let get_invoice_pdf_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_pd_f = option_of_yojson (value_for_key invoice_pd_f_of_yojson "InvoicePDF") _list path;
   }
    : get_invoice_pdf_response)

let get_invoice_pdf_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ invoice_id = value_for_key string_without_new_line_of_yojson "InvoiceId" _list path }
    : get_invoice_pdf_request)

let last_modified_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let get_invoice_unit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arn =
       option_of_yojson
         (value_for_key invoice_unit_arn_string_of_yojson "InvoiceUnitArn")
         _list path;
     invoice_receiver =
       option_of_yojson (value_for_key account_id_string_of_yojson "InvoiceReceiver") _list path;
     name = option_of_yojson (value_for_key invoice_unit_name_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     tax_inheritance_disabled =
       option_of_yojson
         (value_for_key tax_inheritance_disabled_flag_of_yojson "TaxInheritanceDisabled")
         _list path;
     rule = option_of_yojson (value_for_key invoice_unit_rule_of_yojson "Rule") _list path;
     last_modified =
       option_of_yojson (value_for_key last_modified_timestamp_of_yojson "LastModified") _list path;
   }
    : get_invoice_unit_response)

let get_invoice_unit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arn = value_for_key invoice_unit_arn_string_of_yojson "InvoiceUnitArn" _list path;
     as_of = option_of_yojson (value_for_key as_of_timestamp_of_yojson "AsOf") _list path;
   }
    : get_invoice_unit_request)

let procurement_portal_preference_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_VERIFICATION" -> PENDING_VERIFICATION
    | `String "TEST_INITIALIZED" -> TEST_INITIALIZED
    | `String "TEST_INITIALIZATION_FAILED" -> TEST_INITIALIZATION_FAILED
    | `String "TEST_FAILED" -> TEST_FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String "SUSPENDED" -> SUSPENDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ProcurementPortalPreferenceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ProcurementPortalPreferenceStatus")
     : procurement_portal_preference_status)
    : procurement_portal_preference_status)

let test_env_preference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     buyer_domain = value_for_key buyer_domain_of_yojson "BuyerDomain" _list path;
     buyer_identifier =
       value_for_key basic_string_without_space_of_yojson "BuyerIdentifier" _list path;
     supplier_domain = value_for_key supplier_domain_of_yojson "SupplierDomain" _list path;
     supplier_identifier =
       value_for_key basic_string_without_space_of_yojson "SupplierIdentifier" _list path;
     procurement_portal_shared_secret =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ProcurementPortalSharedSecret")
         _list path;
     procurement_portal_instance_endpoint =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ProcurementPortalInstanceEndpoint")
         _list path;
     purchase_order_retrieval_endpoint =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "PurchaseOrderRetrievalEndpoint")
         _list path;
   }
    : test_env_preference)

let procurement_portal_preference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id = value_for_key account_id_string_of_yojson "AwsAccountId" _list path;
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
     procurement_portal_name =
       value_for_key procurement_portal_name_of_yojson "ProcurementPortalName" _list path;
     buyer_domain = value_for_key buyer_domain_of_yojson "BuyerDomain" _list path;
     buyer_identifier =
       value_for_key basic_string_without_space_of_yojson "BuyerIdentifier" _list path;
     supplier_domain = value_for_key supplier_domain_of_yojson "SupplierDomain" _list path;
     supplier_identifier =
       value_for_key basic_string_without_space_of_yojson "SupplierIdentifier" _list path;
     selector =
       option_of_yojson
         (value_for_key procurement_portal_preference_selector_of_yojson "Selector")
         _list path;
     procurement_portal_shared_secret =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ProcurementPortalSharedSecret")
         _list path;
     procurement_portal_instance_endpoint =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ProcurementPortalInstanceEndpoint")
         _list path;
     purchase_order_retrieval_endpoint =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "PurchaseOrderRetrievalEndpoint")
         _list path;
     test_env_preference =
       option_of_yojson (value_for_key test_env_preference_of_yojson "TestEnvPreference") _list path;
     einvoice_delivery_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "EinvoiceDeliveryEnabled" _list path;
     einvoice_delivery_preference =
       option_of_yojson
         (value_for_key einvoice_delivery_preference_of_yojson "EinvoiceDeliveryPreference")
         _list path;
     purchase_order_retrieval_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "PurchaseOrderRetrievalEnabled" _list path;
     contacts = option_of_yojson (value_for_key contacts_of_yojson "Contacts") _list path;
     einvoice_delivery_preference_status =
       option_of_yojson
         (value_for_key procurement_portal_preference_status_of_yojson
            "EinvoiceDeliveryPreferenceStatus")
         _list path;
     einvoice_delivery_preference_status_reason =
       option_of_yojson
         (value_for_key basic_string_of_yojson "EinvoiceDeliveryPreferenceStatusReason")
         _list path;
     purchase_order_retrieval_preference_status =
       option_of_yojson
         (value_for_key procurement_portal_preference_status_of_yojson
            "PurchaseOrderRetrievalPreferenceStatus")
         _list path;
     purchase_order_retrieval_preference_status_reason =
       option_of_yojson
         (value_for_key basic_string_of_yojson "PurchaseOrderRetrievalPreferenceStatusReason")
         _list path;
     version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "Version" _list path;
     create_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreateDate" _list path;
     last_update_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "LastUpdateDate" _list path;
   }
    : procurement_portal_preference)

let get_procurement_portal_preference_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference =
       value_for_key procurement_portal_preference_of_yojson "ProcurementPortalPreference" _list
         path;
   }
    : get_procurement_portal_preference_response)

let get_procurement_portal_preference_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
   }
    : get_procurement_portal_preference_request)

let invoice_currency_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_amount = option_of_yojson (value_for_key basic_string_of_yojson "TotalAmount") _list path;
     total_amount_before_tax =
       option_of_yojson (value_for_key basic_string_of_yojson "TotalAmountBeforeTax") _list path;
     currency_code =
       option_of_yojson (value_for_key currency_code_of_yojson "CurrencyCode") _list path;
     amount_breakdown =
       option_of_yojson (value_for_key amount_breakdown_of_yojson "AmountBreakdown") _list path;
     currency_exchange_details =
       option_of_yojson
         (value_for_key currency_exchange_details_of_yojson "CurrencyExchangeDetails")
         _list path;
   }
    : invoice_currency_amount)

let invoice_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONE_TIME" -> ONE_TIME
    | `String "RECURRING" -> RECURRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "InvoiceFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "InvoiceFrequency")
     : invoice_frequency)
    : invoice_frequency)

let tax_authority_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ISSUED" -> ISSUED
    | `String "CANCELLED" -> CANCELLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaxAuthorityStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaxAuthorityStatus")
     : tax_authority_status)
    : tax_authority_status)

let invoice_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVOICE" -> INVOICE
    | `String "CREDIT_MEMO" -> CREDIT_MEMO
    | `String "PAYMENT_RECEIPT" -> PAYMENT_RECEIPT
    | `String value -> raise (deserialize_unknown_enum_value_error path "InvoiceType" value)
    | _ -> raise (deserialize_wrong_type_error path "InvoiceType")
     : invoice_type)
    : invoice_type)

let receiver_role_of_yojson (tree : t) path =
  ((match tree with
    | `String "SELLER" -> SELLER
    | `String "RESELLER" -> RESELLER
    | `String "BUYER" -> BUYER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReceiverRole" value)
    | _ -> raise (deserialize_wrong_type_error path "ReceiverRole")
     : receiver_role)
    : receiver_role)

let invoice_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id =
       option_of_yojson (value_for_key account_id_string_of_yojson "AccountId") _list path;
     invoice_id = option_of_yojson (value_for_key basic_string_of_yojson "InvoiceId") _list path;
     issued_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "IssuedDate")
         _list path;
     due_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "DueDate")
         _list path;
     bill_source_accounts =
       option_of_yojson
         (value_for_key bill_source_account_list_of_yojson "BillSourceAccounts")
         _list path;
     bill_source_accounts_total_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "BillSourceAccountsTotalCount")
         _list path;
     receiver_role =
       option_of_yojson (value_for_key receiver_role_of_yojson "ReceiverRole") _list path;
     entity = option_of_yojson (value_for_key entity_of_yojson "Entity") _list path;
     billing_period =
       option_of_yojson (value_for_key billing_period_of_yojson "BillingPeriod") _list path;
     invoice_frequency =
       option_of_yojson (value_for_key invoice_frequency_of_yojson "InvoiceFrequency") _list path;
     bill_type = option_of_yojson (value_for_key bill_type_of_yojson "BillType") _list path;
     invoice_type = option_of_yojson (value_for_key invoice_type_of_yojson "InvoiceType") _list path;
     commercial_invoice_id =
       option_of_yojson (value_for_key basic_string_of_yojson "CommercialInvoiceId") _list path;
     original_invoice_id =
       option_of_yojson (value_for_key basic_string_of_yojson "OriginalInvoiceId") _list path;
     purchase_order_number =
       option_of_yojson (value_for_key basic_string_of_yojson "PurchaseOrderNumber") _list path;
     einvoice_delivery_status =
       option_of_yojson
         (value_for_key einvoice_delivery_status_of_yojson "EinvoiceDeliveryStatus")
         _list path;
     tax_authority_status =
       option_of_yojson
         (value_for_key tax_authority_status_of_yojson "TaxAuthorityStatus")
         _list path;
     base_currency_amount =
       option_of_yojson
         (value_for_key invoice_currency_amount_of_yojson "BaseCurrencyAmount")
         _list path;
     tax_currency_amount =
       option_of_yojson
         (value_for_key invoice_currency_amount_of_yojson "TaxCurrencyAmount")
         _list path;
     payment_currency_amount =
       option_of_yojson
         (value_for_key invoice_currency_amount_of_yojson "PaymentCurrencyAmount")
         _list path;
   }
    : invoice_summary)

let invoice_summaries_of_yojson tree path = list_of_yojson invoice_summary_of_yojson tree path

let invoice_summaries_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_interval =
       option_of_yojson (value_for_key date_interval_of_yojson "TimeInterval") _list path;
     billing_period =
       option_of_yojson (value_for_key billing_period_of_yojson "BillingPeriod") _list path;
     invoicing_entity =
       option_of_yojson (value_for_key basic_string_of_yojson "InvoicingEntity") _list path;
     receiver_role =
       option_of_yojson (value_for_key receiver_role_of_yojson "ReceiverRole") _list path;
   }
    : invoice_summaries_filter)

let invoice_summaries_max_results_of_yojson = int_of_yojson

let list_invoice_summaries_resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_ID" -> ACCOUNT_ID
    | `String "INVOICE_ID" -> INVOICE_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListInvoiceSummariesResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ListInvoiceSummariesResourceType")
     : list_invoice_summaries_resource_type)
    : list_invoice_summaries_resource_type)

let invoice_summaries_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key list_invoice_summaries_resource_type_of_yojson "ResourceType" _list path;
     value = value_for_key string_without_new_line_of_yojson "Value" _list path;
   }
    : invoice_summaries_selector)

let invoice_unit_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arn =
       option_of_yojson
         (value_for_key invoice_unit_arn_string_of_yojson "InvoiceUnitArn")
         _list path;
     invoice_receiver =
       option_of_yojson (value_for_key account_id_string_of_yojson "InvoiceReceiver") _list path;
     name = option_of_yojson (value_for_key invoice_unit_name_of_yojson "Name") _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     tax_inheritance_disabled =
       option_of_yojson
         (value_for_key tax_inheritance_disabled_flag_of_yojson "TaxInheritanceDisabled")
         _list path;
     rule = option_of_yojson (value_for_key invoice_unit_rule_of_yojson "Rule") _list path;
     last_modified =
       option_of_yojson (value_for_key last_modified_timestamp_of_yojson "LastModified") _list path;
   }
    : invoice_unit)

let invoice_units_of_yojson tree path = list_of_yojson invoice_unit_of_yojson tree path

let update_procurement_portal_preference_status_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
   }
    : update_procurement_portal_preference_status_response)

let update_procurement_portal_preference_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
     einvoice_delivery_preference_status =
       option_of_yojson
         (value_for_key procurement_portal_preference_status_of_yojson
            "EinvoiceDeliveryPreferenceStatus")
         _list path;
     einvoice_delivery_preference_status_reason =
       option_of_yojson
         (value_for_key basic_string_of_yojson "EinvoiceDeliveryPreferenceStatusReason")
         _list path;
     purchase_order_retrieval_preference_status =
       option_of_yojson
         (value_for_key procurement_portal_preference_status_of_yojson
            "PurchaseOrderRetrievalPreferenceStatus")
         _list path;
     purchase_order_retrieval_preference_status_reason =
       option_of_yojson
         (value_for_key basic_string_of_yojson "PurchaseOrderRetrievalPreferenceStatusReason")
         _list path;
     client_token =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ClientToken")
         _list path;
   }
    : update_procurement_portal_preference_status_request)

let update_invoice_unit_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arn =
       option_of_yojson
         (value_for_key invoice_unit_arn_string_of_yojson "InvoiceUnitArn")
         _list path;
   }
    : update_invoice_unit_response)

let update_invoice_unit_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_unit_arn = value_for_key invoice_unit_arn_string_of_yojson "InvoiceUnitArn" _list path;
     description =
       option_of_yojson (value_for_key description_string_of_yojson "Description") _list path;
     tax_inheritance_disabled =
       option_of_yojson
         (value_for_key tax_inheritance_disabled_flag_of_yojson "TaxInheritanceDisabled")
         _list path;
     rule = option_of_yojson (value_for_key invoice_unit_rule_of_yojson "Rule") _list path;
     client_token =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ClientToken")
         _list path;
   }
    : update_invoice_unit_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path
let tagris_arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key tagris_arn_of_yojson "ResourceArn" _list path;
     resource_tag_keys = value_for_key resource_tag_key_list_of_yojson "ResourceTagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key tagris_arn_of_yojson "ResourceArn" _list path;
     resource_tags = value_for_key resource_tag_list_of_yojson "ResourceTags" _list path;
   }
    : tag_resource_request)

let put_procurement_portal_preference_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
   }
    : put_procurement_portal_preference_response)

let put_procurement_portal_preference_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
     selector =
       option_of_yojson
         (value_for_key procurement_portal_preference_selector_of_yojson "Selector")
         _list path;
     procurement_portal_shared_secret =
       option_of_yojson
         (value_for_key sensitive_basic_string_without_space_of_yojson
            "ProcurementPortalSharedSecret")
         _list path;
     procurement_portal_instance_endpoint =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ProcurementPortalInstanceEndpoint")
         _list path;
     test_env_preference =
       option_of_yojson
         (value_for_key test_env_preference_input_of_yojson "TestEnvPreference")
         _list path;
     einvoice_delivery_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "EinvoiceDeliveryEnabled" _list path;
     einvoice_delivery_preference =
       option_of_yojson
         (value_for_key einvoice_delivery_preference_of_yojson "EinvoiceDeliveryPreference")
         _list path;
     purchase_order_retrieval_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "PurchaseOrderRetrievalEnabled" _list path;
     contacts = value_for_key contacts_of_yojson "Contacts" _list path;
     client_token =
       option_of_yojson
         (value_for_key basic_string_without_space_of_yojson "ClientToken")
         _list path;
   }
    : put_procurement_portal_preference_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key tagris_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let procurement_portal_preference_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_account_id = value_for_key account_id_string_of_yojson "AwsAccountId" _list path;
     procurement_portal_preference_arn =
       value_for_key procurement_portal_preference_arn_string_of_yojson
         "ProcurementPortalPreferenceArn" _list path;
     procurement_portal_name =
       value_for_key procurement_portal_name_of_yojson "ProcurementPortalName" _list path;
     buyer_domain = value_for_key buyer_domain_of_yojson "BuyerDomain" _list path;
     buyer_identifier =
       value_for_key basic_string_without_space_of_yojson "BuyerIdentifier" _list path;
     supplier_domain = value_for_key supplier_domain_of_yojson "SupplierDomain" _list path;
     supplier_identifier =
       value_for_key basic_string_without_space_of_yojson "SupplierIdentifier" _list path;
     selector =
       option_of_yojson
         (value_for_key procurement_portal_preference_selector_of_yojson "Selector")
         _list path;
     einvoice_delivery_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "EinvoiceDeliveryEnabled" _list path;
     purchase_order_retrieval_enabled =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
         "PurchaseOrderRetrievalEnabled" _list path;
     einvoice_delivery_preference_status =
       option_of_yojson
         (value_for_key procurement_portal_preference_status_of_yojson
            "EinvoiceDeliveryPreferenceStatus")
         _list path;
     einvoice_delivery_preference_status_reason =
       option_of_yojson
         (value_for_key basic_string_of_yojson "EinvoiceDeliveryPreferenceStatusReason")
         _list path;
     purchase_order_retrieval_preference_status =
       option_of_yojson
         (value_for_key procurement_portal_preference_status_of_yojson
            "PurchaseOrderRetrievalPreferenceStatus")
         _list path;
     purchase_order_retrieval_preference_status_reason =
       option_of_yojson
         (value_for_key basic_string_of_yojson "PurchaseOrderRetrievalPreferenceStatusReason")
         _list path;
     version =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "Version" _list path;
     create_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "CreateDate" _list path;
     last_update_date =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "LastUpdateDate" _list path;
   }
    : procurement_portal_preference_summary)

let procurement_portal_preference_summaries_of_yojson tree path =
  list_of_yojson procurement_portal_preference_summary_of_yojson tree path

let list_procurement_portal_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     procurement_portal_preferences =
       option_of_yojson
         (value_for_key procurement_portal_preference_summaries_of_yojson
            "ProcurementPortalPreferences")
         _list path;
     next_token =
       option_of_yojson (value_for_key basic_string_without_space_of_yojson "NextToken") _list path;
   }
    : list_procurement_portal_preferences_response)

let max_results_of_yojson = int_of_yojson

let list_procurement_portal_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson (value_for_key basic_string_without_space_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_procurement_portal_preferences_request)

let next_token_string_of_yojson = string_of_yojson

let list_invoice_units_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_units =
       option_of_yojson (value_for_key invoice_units_of_yojson "InvoiceUnits") _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
   }
    : list_invoice_units_response)

let max_results_integer_of_yojson = int_of_yojson

let list_invoice_units_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson (value_for_key max_results_integer_of_yojson "MaxResults") _list path;
     as_of = option_of_yojson (value_for_key as_of_timestamp_of_yojson "AsOf") _list path;
   }
    : list_invoice_units_request)

let list_invoice_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invoice_summaries = value_for_key invoice_summaries_of_yojson "InvoiceSummaries" _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
   }
    : list_invoice_summaries_response)

let list_invoice_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selector = value_for_key invoice_summaries_selector_of_yojson "Selector" _list path;
     filter =
       option_of_yojson (value_for_key invoice_summaries_filter_of_yojson "Filter") _list path;
     next_token =
       option_of_yojson (value_for_key next_token_string_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key invoice_summaries_max_results_of_yojson "MaxResults")
         _list path;
   }
    : list_invoice_summaries_request)
