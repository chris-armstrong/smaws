open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let access_details_to_yojson (x : access_details) =
  assoc_to_yojson
    [
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
    ]

let validation_exception_error_code_to_yojson (x : validation_exception_error_code) =
  match x with
  | REQUIRED_FIELD_MISSING -> `String "REQUIRED_FIELD_MISSING"
  | INVALID_ENUM_VALUE -> `String "INVALID_ENUM_VALUE"
  | INVALID_STRING_FORMAT -> `String "INVALID_STRING_FORMAT"
  | INVALID_VALUE -> `String "INVALID_VALUE"
  | NOT_ENOUGH_VALUES -> `String "NOT_ENOUGH_VALUES"
  | TOO_MANY_VALUES -> `String "TOO_MANY_VALUES"
  | INVALID_RESOURCE_STATE -> `String "INVALID_RESOURCE_STATE"
  | DUPLICATE_KEY_VALUE -> `String "DUPLICATE_KEY_VALUE"
  | VALUE_OUT_OF_RANGE -> `String "VALUE_OUT_OF_RANGE"
  | ACTION_NOT_PERMITTED -> `String "ACTION_NOT_PERMITTED"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Code", option_to_yojson validation_exception_error_code_to_yojson x.code);
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | OTHER -> `String "other"
  | BUSINESS_VALIDATION_FAILED -> `String "BUSINESS_VALIDATION_FAILED"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("FieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let amend_benefit_application_output_to_yojson = unit_to_yojson

let amendment_to_yojson (x : amendment) =
  assoc_to_yojson
    [
      ("FieldPath", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.field_path));
      ("NewValue", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.new_value));
    ]

let amendment_list_to_yojson tree = list_to_yojson amendment_to_yojson tree
let benefit_application_identifier_to_yojson = string_to_yojson
let catalog_name_to_yojson = string_to_yojson

let amend_benefit_application_input_to_yojson (x : amend_benefit_application_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("ClientToken", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token));
      ("Revision", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision));
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ( "AmendmentReason",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.amendment_reason) );
      ("Amendments", Some (amendment_list_to_yojson x.amendments));
    ]

let arn_to_yojson = string_to_yojson
let arns_to_yojson tree = list_to_yojson arn_to_yojson tree
let benefit_application_id_to_yojson = string_to_yojson

let associate_benefit_application_resource_output_to_yojson
    (x : associate_benefit_application_resource_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
    ]

let associate_benefit_application_resource_input_to_yojson
    (x : associate_benefit_application_resource_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ( "BenefitApplicationIdentifier",
        Some (benefit_application_identifier_to_yojson x.benefit_application_identifier) );
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with
  | OPPORTUNITY -> `String "OPPORTUNITY"
  | BENEFIT_ALLOCATION -> `String "BENEFIT_ALLOCATION"

let associated_resource_to_yojson (x : associated_resource) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "ResourceIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resource_identifier );
      ("ResourceArn", option_to_yojson arn_to_yojson x.resource_arn);
    ]

let associated_resources_to_yojson tree = list_to_yojson associated_resource_to_yojson tree

let attributes_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let benefit_allocation_arn_to_yojson = string_to_yojson
let benefit_allocation_id_to_yojson = string_to_yojson
let benefit_allocation_identifier_to_yojson = string_to_yojson
let benefit_allocation_name_to_yojson = string_to_yojson

let benefit_allocation_status_to_yojson (x : benefit_allocation_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | INACTIVE -> `String "INACTIVE"
  | FULFILLED -> `String "FULFILLED"

let benefit_allocation_status_list_to_yojson tree =
  list_to_yojson benefit_allocation_status_to_yojson tree

let benefit_id_to_yojson = string_to_yojson
let benefit_ids_to_yojson tree = list_to_yojson benefit_id_to_yojson tree
let timestamp_to_yojson = timestamp_iso_8601_to_yojson

let fulfillment_type_to_yojson (x : fulfillment_type) =
  match x with CREDITS -> `String "CREDITS" | CASH -> `String "CASH" | ACCESS -> `String "ACCESS"

let fulfillment_types_to_yojson tree = list_to_yojson fulfillment_type_to_yojson tree

let benefit_allocation_summary_to_yojson (x : benefit_allocation_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson benefit_allocation_id_to_yojson x.id);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Status", option_to_yojson benefit_allocation_status_to_yojson x.status);
      ( "StatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("Name", option_to_yojson benefit_allocation_name_to_yojson x.name);
      ("BenefitId", option_to_yojson benefit_id_to_yojson x.benefit_id);
      ( "BenefitApplicationId",
        option_to_yojson benefit_application_id_to_yojson x.benefit_application_id );
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("ExpiresAt", option_to_yojson timestamp_to_yojson x.expires_at);
      ("ApplicableBenefitIds", option_to_yojson benefit_ids_to_yojson x.applicable_benefit_ids);
    ]

let benefit_allocation_summaries_to_yojson tree =
  list_to_yojson benefit_allocation_summary_to_yojson tree

let benefit_application_description_to_yojson = string_to_yojson

let benefit_application_identifier_list_to_yojson tree =
  list_to_yojson benefit_application_identifier_to_yojson tree

let benefit_application_name_to_yojson = string_to_yojson
let benefit_application_stage_to_yojson = string_to_yojson

let benefit_application_status_to_yojson (x : benefit_application_status) =
  match x with
  | PENDING_SUBMISSION -> `String "PENDING_SUBMISSION"
  | IN_REVIEW -> `String "IN_REVIEW"
  | ACTION_REQUIRED -> `String "ACTION_REQUIRED"
  | APPROVED -> `String "APPROVED"
  | REJECTED -> `String "REJECTED"
  | CANCELED -> `String "CANCELED"

let program_to_yojson = string_to_yojson
let programs_to_yojson tree = list_to_yojson program_to_yojson tree

let benefit_application_summary_to_yojson (x : benefit_application_summary) =
  assoc_to_yojson
    [
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Name", option_to_yojson benefit_application_name_to_yojson x.name);
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("BenefitId", option_to_yojson benefit_id_to_yojson x.benefit_id);
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Status", option_to_yojson benefit_application_status_to_yojson x.status);
      ("Stage", option_to_yojson benefit_application_stage_to_yojson x.stage);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ( "BenefitApplicationDetails",
        option_to_yojson attributes_to_yojson x.benefit_application_details );
      ("AssociatedResources", option_to_yojson arns_to_yojson x.associated_resources);
    ]

let benefit_application_summaries_to_yojson tree =
  list_to_yojson benefit_application_summary_to_yojson tree

let benefit_identifiers_to_yojson tree = list_to_yojson benefit_id_to_yojson tree

let benefit_status_to_yojson (x : benefit_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let benefit_statuses_to_yojson tree = list_to_yojson benefit_status_to_yojson tree

let benefit_summary_to_yojson (x : benefit_summary) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Status", option_to_yojson benefit_status_to_yojson x.status);
    ]

let benefit_summaries_to_yojson tree = list_to_yojson benefit_summary_to_yojson tree
let cancel_benefit_application_output_to_yojson = unit_to_yojson

let cancel_benefit_application_input_to_yojson (x : cancel_benefit_application_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("ClientToken", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token));
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ("Reason", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason);
    ]

let currency_code_to_yojson (x : currency_code) =
  match x with
  | AED -> `String "AED"
  | AMD -> `String "AMD"
  | ARS -> `String "ARS"
  | AUD -> `String "AUD"
  | AWG -> `String "AWG"
  | AZN -> `String "AZN"
  | BBD -> `String "BBD"
  | BDT -> `String "BDT"
  | BGN -> `String "BGN"
  | BMD -> `String "BMD"
  | BND -> `String "BND"
  | BOB -> `String "BOB"
  | BRL -> `String "BRL"
  | BSD -> `String "BSD"
  | BYR -> `String "BYR"
  | BZD -> `String "BZD"
  | CAD -> `String "CAD"
  | CHF -> `String "CHF"
  | CLP -> `String "CLP"
  | CNY -> `String "CNY"
  | COP -> `String "COP"
  | CRC -> `String "CRC"
  | CZK -> `String "CZK"
  | DKK -> `String "DKK"
  | DOP -> `String "DOP"
  | EEK -> `String "EEK"
  | EGP -> `String "EGP"
  | EUR -> `String "EUR"
  | GBP -> `String "GBP"
  | GEL -> `String "GEL"
  | GHS -> `String "GHS"
  | GTQ -> `String "GTQ"
  | GYD -> `String "GYD"
  | HKD -> `String "HKD"
  | HNL -> `String "HNL"
  | HRK -> `String "HRK"
  | HTG -> `String "HTG"
  | HUF -> `String "HUF"
  | IDR -> `String "IDR"
  | ILS -> `String "ILS"
  | INR -> `String "INR"
  | ISK -> `String "ISK"
  | JMD -> `String "JMD"
  | JPY -> `String "JPY"
  | KES -> `String "KES"
  | KHR -> `String "KHR"
  | KRW -> `String "KRW"
  | KYD -> `String "KYD"
  | KZT -> `String "KZT"
  | LBP -> `String "LBP"
  | LKR -> `String "LKR"
  | LTL -> `String "LTL"
  | LVL -> `String "LVL"
  | MAD -> `String "MAD"
  | MNT -> `String "MNT"
  | MOP -> `String "MOP"
  | MUR -> `String "MUR"
  | MVR -> `String "MVR"
  | MXN -> `String "MXN"
  | MYR -> `String "MYR"
  | NAD -> `String "NAD"
  | NGN -> `String "NGN"
  | NIO -> `String "NIO"
  | NOK -> `String "NOK"
  | NZD -> `String "NZD"
  | PAB -> `String "PAB"
  | PEN -> `String "PEN"
  | PHP -> `String "PHP"
  | PKR -> `String "PKR"
  | PLN -> `String "PLN"
  | PYG -> `String "PYG"
  | QAR -> `String "QAR"
  | RON -> `String "RON"
  | RUB -> `String "RUB"
  | SAR -> `String "SAR"
  | SEK -> `String "SEK"
  | SGD -> `String "SGD"
  | SIT -> `String "SIT"
  | SKK -> `String "SKK"
  | THB -> `String "THB"
  | TND -> `String "TND"
  | TRY -> `String "TRY"
  | TTD -> `String "TTD"
  | TWD -> `String "TWD"
  | TZS -> `String "TZS"
  | UAH -> `String "UAH"
  | USD -> `String "USD"
  | UYU -> `String "UYU"
  | UZS -> `String "UZS"
  | VND -> `String "VND"
  | XAF -> `String "XAF"
  | XCD -> `String "XCD"
  | XOF -> `String "XOF"
  | XPF -> `String "XPF"
  | ZAR -> `String "ZAR"

let monetary_value_to_yojson (x : monetary_value) =
  assoc_to_yojson
    [
      ("Amount", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.amount));
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
    ]

let issuance_detail_to_yojson (x : issuance_detail) =
  assoc_to_yojson
    [
      ( "IssuanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.issuance_id );
      ("IssuanceAmount", option_to_yojson monetary_value_to_yojson x.issuance_amount);
      ("IssuedAt", option_to_yojson timestamp_to_yojson x.issued_at);
    ]

let consumable_details_to_yojson (x : consumable_details) =
  assoc_to_yojson
    [
      ("AllocatedAmount", option_to_yojson monetary_value_to_yojson x.allocated_amount);
      ("RemainingAmount", option_to_yojson monetary_value_to_yojson x.remaining_amount);
      ("UtilizedAmount", option_to_yojson monetary_value_to_yojson x.utilized_amount);
      ("IssuanceDetails", option_to_yojson issuance_detail_to_yojson x.issuance_details);
    ]

let contact_phone_to_yojson = string_to_yojson
let contact_last_name_to_yojson = string_to_yojson
let contact_first_name_to_yojson = string_to_yojson
let contact_email_to_yojson = string_to_yojson

let contact_to_yojson (x : contact) =
  assoc_to_yojson
    [
      ("Email", option_to_yojson contact_email_to_yojson x.email);
      ("FirstName", option_to_yojson contact_first_name_to_yojson x.first_name);
      ("LastName", option_to_yojson contact_last_name_to_yojson x.last_name);
      ( "BusinessTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.business_title );
      ("Phone", option_to_yojson contact_phone_to_yojson x.phone);
    ]

let contacts_to_yojson tree = list_to_yojson contact_to_yojson tree

let create_benefit_application_output_to_yojson (x : create_benefit_application_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
    ]

let file_ur_i_to_yojson = string_to_yojson

let file_input_to_yojson (x : file_input) =
  assoc_to_yojson
    [
      ("FileURI", Some (file_ur_i_to_yojson x.file_ur_i));
      ( "BusinessUseCase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.business_use_case
      );
    ]

let file_input_details_to_yojson tree = list_to_yojson file_input_to_yojson tree
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_benefit_application_input_to_yojson (x : create_benefit_application_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("ClientToken", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token));
      ("Name", option_to_yojson benefit_application_name_to_yojson x.name);
      ("Description", option_to_yojson benefit_application_description_to_yojson x.description);
      ( "BenefitIdentifier",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.benefit_identifier) );
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ( "BenefitApplicationDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson
          x.benefit_application_details );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("AssociatedResources", option_to_yojson arns_to_yojson x.associated_resources);
      ("PartnerContacts", option_to_yojson contacts_to_yojson x.partner_contacts);
      ("FileDetails", option_to_yojson file_input_details_to_yojson x.file_details);
    ]

let credit_code_to_yojson (x : credit_code) =
  assoc_to_yojson
    [
      ( "AwsAccountId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.aws_account_id) );
      ("Value", Some (monetary_value_to_yojson x.value));
      ( "AwsCreditCode",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.aws_credit_code) );
      ("Status", Some (benefit_allocation_status_to_yojson x.status));
      ("IssuedAt", Some (timestamp_to_yojson x.issued_at));
      ("ExpiresAt", Some (timestamp_to_yojson x.expires_at));
    ]

let credit_codes_to_yojson tree = list_to_yojson credit_code_to_yojson tree

let credit_details_to_yojson (x : credit_details) =
  assoc_to_yojson
    [
      ("AllocatedAmount", Some (monetary_value_to_yojson x.allocated_amount));
      ("IssuedAmount", Some (monetary_value_to_yojson x.issued_amount));
      ("Codes", Some (credit_codes_to_yojson x.codes));
    ]

let disassociate_benefit_application_resource_output_to_yojson
    (x : disassociate_benefit_application_resource_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
    ]

let disassociate_benefit_application_resource_input_to_yojson
    (x : disassociate_benefit_application_resource_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ( "BenefitApplicationIdentifier",
        Some (benefit_application_identifier_to_yojson x.benefit_application_identifier) );
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let disbursement_details_to_yojson (x : disbursement_details) =
  assoc_to_yojson
    [
      ("DisbursedAmount", option_to_yojson monetary_value_to_yojson x.disbursed_amount);
      ("IssuanceDetails", option_to_yojson issuance_detail_to_yojson x.issuance_details);
    ]

let file_type_to_yojson (x : file_type) =
  match x with
  | DOC -> `String "application/msword"
  | DOCX -> `String "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  | XLSX -> `String "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  | PPTX -> `String "application/vnd.openxmlformats-officedocument.presentationml.presentation"
  | PDF -> `String "application/pdf"
  | PNG -> `String "image/png"
  | JPG -> `String "image/jpeg"
  | SVG -> `String "image/svg+xml"
  | CSV -> `String "text/csv"

let file_detail_to_yojson (x : file_detail) =
  assoc_to_yojson
    [
      ("FileURI", Some (file_ur_i_to_yojson x.file_ur_i));
      ( "BusinessUseCase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.business_use_case
      );
      ( "FileName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.file_name );
      ( "FileStatus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.file_status );
      ( "FileStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.file_status_reason );
      ("FileType", option_to_yojson file_type_to_yojson x.file_type);
      ( "CreatedBy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.created_by );
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let file_details_to_yojson tree = list_to_yojson file_detail_to_yojson tree

let fulfillment_details_to_yojson (x : fulfillment_details) =
  match x with
  | DisbursementDetails arg ->
      assoc_to_yojson [ ("DisbursementDetails", Some (disbursement_details_to_yojson arg)) ]
  | ConsumableDetails arg ->
      assoc_to_yojson [ ("ConsumableDetails", Some (consumable_details_to_yojson arg)) ]
  | CreditDetails arg -> assoc_to_yojson [ ("CreditDetails", Some (credit_details_to_yojson arg)) ]
  | AccessDetails arg -> assoc_to_yojson [ ("AccessDetails", Some (access_details_to_yojson arg)) ]

let get_benefit_output_to_yojson (x : get_benefit_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ( "BenefitRequestSchema",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson
          x.benefit_request_schema );
      ("Status", option_to_yojson benefit_status_to_yojson x.status);
    ]

let get_benefit_input_to_yojson (x : get_benefit_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("Identifier", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.identifier));
    ]

let get_benefit_allocation_output_to_yojson (x : get_benefit_allocation_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson benefit_allocation_id_to_yojson x.id);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Arn", option_to_yojson benefit_allocation_arn_to_yojson x.arn);
      ("Name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("Status", option_to_yojson benefit_allocation_status_to_yojson x.status);
      ( "StatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "BenefitApplicationId",
        option_to_yojson benefit_application_id_to_yojson x.benefit_application_id );
      ("BenefitId", option_to_yojson benefit_id_to_yojson x.benefit_id);
      ("FulfillmentType", option_to_yojson fulfillment_type_to_yojson x.fulfillment_type);
      ( "ApplicableBenefitIds",
        option_to_yojson benefit_identifiers_to_yojson x.applicable_benefit_ids );
      ("FulfillmentDetail", option_to_yojson fulfillment_details_to_yojson x.fulfillment_detail);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("StartsAt", option_to_yojson timestamp_to_yojson x.starts_at);
      ("ExpiresAt", option_to_yojson timestamp_to_yojson x.expires_at);
    ]

let get_benefit_allocation_input_to_yojson (x : get_benefit_allocation_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("Identifier", Some (benefit_allocation_identifier_to_yojson x.identifier));
    ]

let status_reason_code_to_yojson = string_to_yojson
let status_reason_codes_to_yojson tree = list_to_yojson status_reason_code_to_yojson tree

let get_benefit_application_output_to_yojson (x : get_benefit_application_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("BenefitId", option_to_yojson benefit_id_to_yojson x.benefit_id);
      ("Name", option_to_yojson benefit_application_name_to_yojson x.name);
      ("Description", option_to_yojson benefit_application_description_to_yojson x.description);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ( "BenefitApplicationDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson
          x.benefit_application_details );
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("Status", option_to_yojson benefit_application_status_to_yojson x.status);
      ("Stage", option_to_yojson benefit_application_stage_to_yojson x.stage);
      ( "StatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("StatusReasonCode", option_to_yojson status_reason_code_to_yojson x.status_reason_code);
      ("StatusReasonCodes", option_to_yojson status_reason_codes_to_yojson x.status_reason_codes);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
      ("AssociatedResources", option_to_yojson arns_to_yojson x.associated_resources);
      ("PartnerContacts", option_to_yojson contacts_to_yojson x.partner_contacts);
      ("FileDetails", option_to_yojson file_details_to_yojson x.file_details);
    ]

let get_benefit_application_input_to_yojson (x : get_benefit_application_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
    ]

let list_benefit_allocations_output_to_yojson (x : list_benefit_allocations_output) =
  assoc_to_yojson
    [
      ( "BenefitAllocationSummaries",
        option_to_yojson benefit_allocation_summaries_to_yojson x.benefit_allocation_summaries );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_benefit_allocations_input_to_yojson (x : list_benefit_allocations_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("BenefitIdentifiers", option_to_yojson benefit_identifiers_to_yojson x.benefit_identifiers);
      ( "BenefitApplicationIdentifiers",
        option_to_yojson benefit_application_identifier_list_to_yojson
          x.benefit_application_identifiers );
      ("Status", option_to_yojson benefit_allocation_status_list_to_yojson x.status);
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_benefit_applications_output_to_yojson (x : list_benefit_applications_output) =
  assoc_to_yojson
    [
      ( "BenefitApplicationSummaries",
        option_to_yojson benefit_application_summaries_to_yojson x.benefit_application_summaries );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let stages_to_yojson tree = list_to_yojson benefit_application_stage_to_yojson tree
let statuses_to_yojson tree = list_to_yojson benefit_application_status_to_yojson tree

let list_benefit_applications_input_to_yojson (x : list_benefit_applications_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("BenefitIdentifiers", option_to_yojson benefit_identifiers_to_yojson x.benefit_identifiers);
      ("Status", option_to_yojson statuses_to_yojson x.status);
      ("Stages", option_to_yojson stages_to_yojson x.stages);
      ("AssociatedResources", option_to_yojson associated_resources_to_yojson x.associated_resources);
      ("AssociatedResourceArns", option_to_yojson arns_to_yojson x.associated_resource_arns);
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_benefits_output_to_yojson (x : list_benefits_output) =
  assoc_to_yojson
    [
      ("BenefitSummaries", option_to_yojson benefit_summaries_to_yojson x.benefit_summaries);
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_benefits_input_to_yojson (x : list_benefits_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Status", option_to_yojson benefit_statuses_to_yojson x.status);
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let taggable_resource_arn_to_yojson = string_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let update_benefit_application_output_to_yojson (x : update_benefit_application_output) =
  assoc_to_yojson
    [
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
    ]

let update_benefit_application_input_to_yojson (x : update_benefit_application_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("ClientToken", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token));
      ("Name", option_to_yojson benefit_application_name_to_yojson x.name);
      ("Description", option_to_yojson benefit_application_description_to_yojson x.description);
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ("Revision", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision));
      ( "BenefitApplicationDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson
          x.benefit_application_details );
      ("PartnerContacts", option_to_yojson contacts_to_yojson x.partner_contacts);
      ("FileDetails", option_to_yojson file_input_details_to_yojson x.file_details);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("QuotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("tags", Some (tags_to_yojson x.tags));
    ]

let submit_benefit_application_output_to_yojson = unit_to_yojson

let submit_benefit_application_input_to_yojson (x : submit_benefit_application_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
    ]

let recall_benefit_application_output_to_yojson = unit_to_yojson

let recall_benefit_application_input_to_yojson (x : recall_benefit_application_input) =
  assoc_to_yojson
    [
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
      ( "ClientToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token );
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ("Reason", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason));
    ]
