open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | BUSINESS_VALIDATION_FAILED -> `String "BUSINESS_VALIDATION_FAILED"
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let validation_exception_error_code_to_yojson (x : validation_exception_error_code) =
  match x with
  | ACTION_NOT_PERMITTED -> `String "ACTION_NOT_PERMITTED"
  | VALUE_OUT_OF_RANGE -> `String "VALUE_OUT_OF_RANGE"
  | DUPLICATE_KEY_VALUE -> `String "DUPLICATE_KEY_VALUE"
  | INVALID_RESOURCE_STATE -> `String "INVALID_RESOURCE_STATE"
  | TOO_MANY_VALUES -> `String "TOO_MANY_VALUES"
  | NOT_ENOUGH_VALUES -> `String "NOT_ENOUGH_VALUES"
  | INVALID_VALUE -> `String "INVALID_VALUE"
  | INVALID_STRING_FORMAT -> `String "INVALID_STRING_FORMAT"
  | INVALID_ENUM_VALUE -> `String "INVALID_ENUM_VALUE"
  | REQUIRED_FIELD_MISSING -> `String "REQUIRED_FIELD_MISSING"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson validation_exception_error_code_to_yojson x.code);
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("FieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let benefit_application_id_to_yojson = string_to_yojson

let update_benefit_application_output_to_yojson (x : update_benefit_application_output) =
  assoc_to_yojson
    [
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
    ]

let catalog_name_to_yojson = string_to_yojson
let benefit_application_name_to_yojson = string_to_yojson
let benefit_application_description_to_yojson = string_to_yojson
let benefit_application_identifier_to_yojson = string_to_yojson
let contact_email_to_yojson = string_to_yojson
let contact_first_name_to_yojson = string_to_yojson
let contact_last_name_to_yojson = string_to_yojson
let contact_phone_to_yojson = string_to_yojson

let contact_to_yojson (x : contact) =
  assoc_to_yojson
    [
      ("Phone", option_to_yojson contact_phone_to_yojson x.phone);
      ( "BusinessTitle",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.business_title );
      ("LastName", option_to_yojson contact_last_name_to_yojson x.last_name);
      ("FirstName", option_to_yojson contact_first_name_to_yojson x.first_name);
      ("Email", option_to_yojson contact_email_to_yojson x.email);
    ]

let contacts_to_yojson tree = list_to_yojson contact_to_yojson tree
let file_ur_i_to_yojson = string_to_yojson

let file_input_to_yojson (x : file_input) =
  assoc_to_yojson
    [
      ( "BusinessUseCase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.business_use_case
      );
      ("FileURI", Some (file_ur_i_to_yojson x.file_ur_i));
    ]

let file_input_details_to_yojson tree = list_to_yojson file_input_to_yojson tree

let update_benefit_application_input_to_yojson (x : update_benefit_application_input) =
  assoc_to_yojson
    [
      ("FileDetails", option_to_yojson file_input_details_to_yojson x.file_details);
      ("PartnerContacts", option_to_yojson contacts_to_yojson x.partner_contacts);
      ( "BenefitApplicationDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson
          x.benefit_application_details );
      ("Revision", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision));
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ("Description", option_to_yojson benefit_application_description_to_yojson x.description);
      ("Name", option_to_yojson benefit_application_name_to_yojson x.name);
      ("ClientToken", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token));
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
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

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("QuotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let timestamp_to_yojson = timestamp_iso_8601_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tags_to_yojson x.tags));
      ("resourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let submit_benefit_application_output_to_yojson = unit_to_yojson

let submit_benefit_application_input_to_yojson (x : submit_benefit_application_input) =
  assoc_to_yojson
    [
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let benefit_application_status_to_yojson (x : benefit_application_status) =
  match x with
  | CANCELED -> `String "CANCELED"
  | REJECTED -> `String "REJECTED"
  | APPROVED -> `String "APPROVED"
  | ACTION_REQUIRED -> `String "ACTION_REQUIRED"
  | IN_REVIEW -> `String "IN_REVIEW"
  | PENDING_SUBMISSION -> `String "PENDING_SUBMISSION"

let statuses_to_yojson tree = list_to_yojson benefit_application_status_to_yojson tree
let status_reason_code_to_yojson = string_to_yojson
let status_reason_codes_to_yojson tree = list_to_yojson status_reason_code_to_yojson tree
let benefit_application_stage_to_yojson = string_to_yojson
let stages_to_yojson tree = list_to_yojson benefit_application_stage_to_yojson tree

let resource_type_to_yojson (x : resource_type) =
  match x with
  | BENEFIT_ALLOCATION -> `String "BENEFIT_ALLOCATION"
  | OPPORTUNITY -> `String "OPPORTUNITY"

let recall_benefit_application_output_to_yojson = unit_to_yojson

let recall_benefit_application_input_to_yojson (x : recall_benefit_application_input) =
  assoc_to_yojson
    [
      ("Reason", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason));
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ( "ClientToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token );
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let program_to_yojson = string_to_yojson
let programs_to_yojson tree = list_to_yojson program_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn)) ]

let fulfillment_type_to_yojson (x : fulfillment_type) =
  match x with ACCESS -> `String "ACCESS" | CASH -> `String "CASH" | CREDITS -> `String "CREDITS"

let fulfillment_types_to_yojson tree = list_to_yojson fulfillment_type_to_yojson tree

let benefit_status_to_yojson (x : benefit_status) =
  match x with INACTIVE -> `String "INACTIVE" | ACTIVE -> `String "ACTIVE"

let benefit_summary_to_yojson (x : benefit_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson benefit_status_to_yojson x.status);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("Name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
    ]

let benefit_summaries_to_yojson tree = list_to_yojson benefit_summary_to_yojson tree

let list_benefits_output_to_yojson (x : list_benefits_output) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ("BenefitSummaries", option_to_yojson benefit_summaries_to_yojson x.benefit_summaries);
    ]

let benefit_statuses_to_yojson tree = list_to_yojson benefit_status_to_yojson tree

let list_benefits_input_to_yojson (x : list_benefits_input) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("Status", option_to_yojson benefit_statuses_to_yojson x.status);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let benefit_id_to_yojson = string_to_yojson

let attributes_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let arn_to_yojson = string_to_yojson
let arns_to_yojson tree = list_to_yojson arn_to_yojson tree

let benefit_application_summary_to_yojson (x : benefit_application_summary) =
  assoc_to_yojson
    [
      ("AssociatedResources", option_to_yojson arns_to_yojson x.associated_resources);
      ( "BenefitApplicationDetails",
        option_to_yojson attributes_to_yojson x.benefit_application_details );
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Stage", option_to_yojson benefit_application_stage_to_yojson x.stage);
      ("Status", option_to_yojson benefit_application_status_to_yojson x.status);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("BenefitId", option_to_yojson benefit_id_to_yojson x.benefit_id);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
      ("Name", option_to_yojson benefit_application_name_to_yojson x.name);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
    ]

let benefit_application_summaries_to_yojson tree =
  list_to_yojson benefit_application_summary_to_yojson tree

let list_benefit_applications_output_to_yojson (x : list_benefit_applications_output) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "BenefitApplicationSummaries",
        option_to_yojson benefit_application_summaries_to_yojson x.benefit_application_summaries );
    ]

let benefit_identifiers_to_yojson tree = list_to_yojson benefit_id_to_yojson tree

let associated_resource_to_yojson (x : associated_resource) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ( "ResourceIdentifier",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.resource_identifier );
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
    ]

let associated_resources_to_yojson tree = list_to_yojson associated_resource_to_yojson tree

let list_benefit_applications_input_to_yojson (x : list_benefit_applications_input) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("AssociatedResourceArns", option_to_yojson arns_to_yojson x.associated_resource_arns);
      ("AssociatedResources", option_to_yojson associated_resources_to_yojson x.associated_resources);
      ("Stages", option_to_yojson stages_to_yojson x.stages);
      ("Status", option_to_yojson statuses_to_yojson x.status);
      ("BenefitIdentifiers", option_to_yojson benefit_identifiers_to_yojson x.benefit_identifiers);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let benefit_allocation_id_to_yojson = string_to_yojson

let benefit_allocation_status_to_yojson (x : benefit_allocation_status) =
  match x with
  | FULFILLED -> `String "FULFILLED"
  | INACTIVE -> `String "INACTIVE"
  | ACTIVE -> `String "ACTIVE"

let benefit_allocation_name_to_yojson = string_to_yojson
let benefit_ids_to_yojson tree = list_to_yojson benefit_id_to_yojson tree

let benefit_allocation_summary_to_yojson (x : benefit_allocation_summary) =
  assoc_to_yojson
    [
      ("ApplicableBenefitIds", option_to_yojson benefit_ids_to_yojson x.applicable_benefit_ids);
      ("ExpiresAt", option_to_yojson timestamp_to_yojson x.expires_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ( "BenefitApplicationId",
        option_to_yojson benefit_application_id_to_yojson x.benefit_application_id );
      ("BenefitId", option_to_yojson benefit_id_to_yojson x.benefit_id);
      ("Name", option_to_yojson benefit_allocation_name_to_yojson x.name);
      ( "StatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("Status", option_to_yojson benefit_allocation_status_to_yojson x.status);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Id", option_to_yojson benefit_allocation_id_to_yojson x.id);
    ]

let benefit_allocation_summaries_to_yojson tree =
  list_to_yojson benefit_allocation_summary_to_yojson tree

let list_benefit_allocations_output_to_yojson (x : list_benefit_allocations_output) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "BenefitAllocationSummaries",
        option_to_yojson benefit_allocation_summaries_to_yojson x.benefit_allocation_summaries );
    ]

let benefit_application_identifier_list_to_yojson tree =
  list_to_yojson benefit_application_identifier_to_yojson tree

let benefit_allocation_status_list_to_yojson tree =
  list_to_yojson benefit_allocation_status_to_yojson tree

let list_benefit_allocations_input_to_yojson (x : list_benefit_allocations_input) =
  assoc_to_yojson
    [
      ( "NextToken",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.next_token );
      ( "MaxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("Status", option_to_yojson benefit_allocation_status_list_to_yojson x.status);
      ( "BenefitApplicationIdentifiers",
        option_to_yojson benefit_application_identifier_list_to_yojson
          x.benefit_application_identifiers );
      ("BenefitIdentifiers", option_to_yojson benefit_identifiers_to_yojson x.benefit_identifiers);
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let file_type_to_yojson (x : file_type) =
  match x with
  | CSV -> `String "text/csv"
  | SVG -> `String "image/svg+xml"
  | JPG -> `String "image/jpeg"
  | PNG -> `String "image/png"
  | PDF -> `String "application/pdf"
  | PPTX -> `String "application/vnd.openxmlformats-officedocument.presentationml.presentation"
  | XLSX -> `String "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
  | DOCX -> `String "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  | DOC -> `String "application/msword"

let file_detail_to_yojson (x : file_detail) =
  assoc_to_yojson
    [
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "CreatedBy",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.created_by );
      ("FileType", option_to_yojson file_type_to_yojson x.file_type);
      ( "FileStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.file_status_reason );
      ( "FileStatus",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.file_status );
      ( "FileName",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.file_name );
      ( "BusinessUseCase",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.business_use_case
      );
      ("FileURI", Some (file_ur_i_to_yojson x.file_ur_i));
    ]

let file_details_to_yojson tree = list_to_yojson file_detail_to_yojson tree

let get_benefit_application_output_to_yojson (x : get_benefit_application_output) =
  assoc_to_yojson
    [
      ("FileDetails", option_to_yojson file_details_to_yojson x.file_details);
      ("PartnerContacts", option_to_yojson contacts_to_yojson x.partner_contacts);
      ("AssociatedResources", option_to_yojson arns_to_yojson x.associated_resources);
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("StatusReasonCodes", option_to_yojson status_reason_codes_to_yojson x.status_reason_codes);
      ("StatusReasonCode", option_to_yojson status_reason_code_to_yojson x.status_reason_code);
      ( "StatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("Stage", option_to_yojson benefit_application_stage_to_yojson x.stage);
      ("Status", option_to_yojson benefit_application_status_to_yojson x.status);
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ( "BenefitApplicationDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson
          x.benefit_application_details );
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Description", option_to_yojson benefit_application_description_to_yojson x.description);
      ("Name", option_to_yojson benefit_application_name_to_yojson x.name);
      ("BenefitId", option_to_yojson benefit_id_to_yojson x.benefit_id);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
    ]

let get_benefit_application_input_to_yojson (x : get_benefit_application_input) =
  assoc_to_yojson
    [
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let benefit_allocation_arn_to_yojson = string_to_yojson

let currency_code_to_yojson (x : currency_code) =
  match x with
  | ZAR -> `String "ZAR"
  | XPF -> `String "XPF"
  | XOF -> `String "XOF"
  | XCD -> `String "XCD"
  | XAF -> `String "XAF"
  | VND -> `String "VND"
  | UZS -> `String "UZS"
  | UYU -> `String "UYU"
  | USD -> `String "USD"
  | UAH -> `String "UAH"
  | TZS -> `String "TZS"
  | TWD -> `String "TWD"
  | TTD -> `String "TTD"
  | TRY -> `String "TRY"
  | TND -> `String "TND"
  | THB -> `String "THB"
  | SKK -> `String "SKK"
  | SIT -> `String "SIT"
  | SGD -> `String "SGD"
  | SEK -> `String "SEK"
  | SAR -> `String "SAR"
  | RUB -> `String "RUB"
  | RON -> `String "RON"
  | QAR -> `String "QAR"
  | PYG -> `String "PYG"
  | PLN -> `String "PLN"
  | PKR -> `String "PKR"
  | PHP -> `String "PHP"
  | PEN -> `String "PEN"
  | PAB -> `String "PAB"
  | NZD -> `String "NZD"
  | NOK -> `String "NOK"
  | NIO -> `String "NIO"
  | NGN -> `String "NGN"
  | NAD -> `String "NAD"
  | MYR -> `String "MYR"
  | MXN -> `String "MXN"
  | MVR -> `String "MVR"
  | MUR -> `String "MUR"
  | MOP -> `String "MOP"
  | MNT -> `String "MNT"
  | MAD -> `String "MAD"
  | LVL -> `String "LVL"
  | LTL -> `String "LTL"
  | LKR -> `String "LKR"
  | LBP -> `String "LBP"
  | KZT -> `String "KZT"
  | KYD -> `String "KYD"
  | KRW -> `String "KRW"
  | KHR -> `String "KHR"
  | KES -> `String "KES"
  | JPY -> `String "JPY"
  | JMD -> `String "JMD"
  | ISK -> `String "ISK"
  | INR -> `String "INR"
  | ILS -> `String "ILS"
  | IDR -> `String "IDR"
  | HUF -> `String "HUF"
  | HTG -> `String "HTG"
  | HRK -> `String "HRK"
  | HNL -> `String "HNL"
  | HKD -> `String "HKD"
  | GYD -> `String "GYD"
  | GTQ -> `String "GTQ"
  | GHS -> `String "GHS"
  | GEL -> `String "GEL"
  | GBP -> `String "GBP"
  | EUR -> `String "EUR"
  | EGP -> `String "EGP"
  | EEK -> `String "EEK"
  | DOP -> `String "DOP"
  | DKK -> `String "DKK"
  | CZK -> `String "CZK"
  | CRC -> `String "CRC"
  | COP -> `String "COP"
  | CNY -> `String "CNY"
  | CLP -> `String "CLP"
  | CHF -> `String "CHF"
  | CAD -> `String "CAD"
  | BZD -> `String "BZD"
  | BYR -> `String "BYR"
  | BSD -> `String "BSD"
  | BRL -> `String "BRL"
  | BOB -> `String "BOB"
  | BND -> `String "BND"
  | BMD -> `String "BMD"
  | BGN -> `String "BGN"
  | BDT -> `String "BDT"
  | BBD -> `String "BBD"
  | AZN -> `String "AZN"
  | AWG -> `String "AWG"
  | AUD -> `String "AUD"
  | ARS -> `String "ARS"
  | AMD -> `String "AMD"
  | AED -> `String "AED"

let monetary_value_to_yojson (x : monetary_value) =
  assoc_to_yojson
    [
      ("CurrencyCode", Some (currency_code_to_yojson x.currency_code));
      ("Amount", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.amount));
    ]

let issuance_detail_to_yojson (x : issuance_detail) =
  assoc_to_yojson
    [
      ("IssuedAt", option_to_yojson timestamp_to_yojson x.issued_at);
      ("IssuanceAmount", option_to_yojson monetary_value_to_yojson x.issuance_amount);
      ( "IssuanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.issuance_id );
    ]

let disbursement_details_to_yojson (x : disbursement_details) =
  assoc_to_yojson
    [
      ("IssuanceDetails", option_to_yojson issuance_detail_to_yojson x.issuance_details);
      ("DisbursedAmount", option_to_yojson monetary_value_to_yojson x.disbursed_amount);
    ]

let consumable_details_to_yojson (x : consumable_details) =
  assoc_to_yojson
    [
      ("IssuanceDetails", option_to_yojson issuance_detail_to_yojson x.issuance_details);
      ("UtilizedAmount", option_to_yojson monetary_value_to_yojson x.utilized_amount);
      ("RemainingAmount", option_to_yojson monetary_value_to_yojson x.remaining_amount);
      ("AllocatedAmount", option_to_yojson monetary_value_to_yojson x.allocated_amount);
    ]

let credit_code_to_yojson (x : credit_code) =
  assoc_to_yojson
    [
      ("ExpiresAt", Some (timestamp_to_yojson x.expires_at));
      ("IssuedAt", Some (timestamp_to_yojson x.issued_at));
      ("Status", Some (benefit_allocation_status_to_yojson x.status));
      ( "AwsCreditCode",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.aws_credit_code) );
      ("Value", Some (monetary_value_to_yojson x.value));
      ( "AwsAccountId",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.aws_account_id) );
    ]

let credit_codes_to_yojson tree = list_to_yojson credit_code_to_yojson tree

let credit_details_to_yojson (x : credit_details) =
  assoc_to_yojson
    [
      ("Codes", Some (credit_codes_to_yojson x.codes));
      ("IssuedAmount", Some (monetary_value_to_yojson x.issued_amount));
      ("AllocatedAmount", Some (monetary_value_to_yojson x.allocated_amount));
    ]

let access_details_to_yojson (x : access_details) =
  assoc_to_yojson
    [
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
    ]

let fulfillment_details_to_yojson (x : fulfillment_details) =
  match x with
  | AccessDetails arg -> assoc_to_yojson [ ("AccessDetails", Some (access_details_to_yojson arg)) ]
  | CreditDetails arg -> assoc_to_yojson [ ("CreditDetails", Some (credit_details_to_yojson arg)) ]
  | ConsumableDetails arg ->
      assoc_to_yojson [ ("ConsumableDetails", Some (consumable_details_to_yojson arg)) ]
  | DisbursementDetails arg ->
      assoc_to_yojson [ ("DisbursementDetails", Some (disbursement_details_to_yojson arg)) ]

let get_benefit_allocation_output_to_yojson (x : get_benefit_allocation_output) =
  assoc_to_yojson
    [
      ("ExpiresAt", option_to_yojson timestamp_to_yojson x.expires_at);
      ("StartsAt", option_to_yojson timestamp_to_yojson x.starts_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("FulfillmentDetail", option_to_yojson fulfillment_details_to_yojson x.fulfillment_detail);
      ( "ApplicableBenefitIds",
        option_to_yojson benefit_identifiers_to_yojson x.applicable_benefit_ids );
      ("FulfillmentType", option_to_yojson fulfillment_type_to_yojson x.fulfillment_type);
      ("BenefitId", option_to_yojson benefit_id_to_yojson x.benefit_id);
      ( "BenefitApplicationId",
        option_to_yojson benefit_application_id_to_yojson x.benefit_application_id );
      ( "StatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("Status", option_to_yojson benefit_allocation_status_to_yojson x.status);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("Name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ("Arn", option_to_yojson benefit_allocation_arn_to_yojson x.arn);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Id", option_to_yojson benefit_allocation_id_to_yojson x.id);
    ]

let benefit_allocation_identifier_to_yojson = string_to_yojson

let get_benefit_allocation_input_to_yojson (x : get_benefit_allocation_input) =
  assoc_to_yojson
    [
      ("Identifier", Some (benefit_allocation_identifier_to_yojson x.identifier));
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let get_benefit_output_to_yojson (x : get_benefit_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson benefit_status_to_yojson x.status);
      ( "BenefitRequestSchema",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson
          x.benefit_request_schema );
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ("Programs", option_to_yojson programs_to_yojson x.programs);
      ( "Description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("Name", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name);
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Catalog", option_to_yojson catalog_name_to_yojson x.catalog);
      ("Id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
    ]

let get_benefit_input_to_yojson (x : get_benefit_input) =
  assoc_to_yojson
    [
      ("Identifier", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.identifier));
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let disassociate_benefit_application_resource_output_to_yojson
    (x : disassociate_benefit_application_resource_output) =
  assoc_to_yojson
    [
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
    ]

let disassociate_benefit_application_resource_input_to_yojson
    (x : disassociate_benefit_application_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ( "BenefitApplicationIdentifier",
        Some (benefit_application_identifier_to_yojson x.benefit_application_identifier) );
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let create_benefit_application_output_to_yojson (x : create_benefit_application_output) =
  assoc_to_yojson
    [
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
    ]

let create_benefit_application_input_to_yojson (x : create_benefit_application_input) =
  assoc_to_yojson
    [
      ("FileDetails", option_to_yojson file_input_details_to_yojson x.file_details);
      ("PartnerContacts", option_to_yojson contacts_to_yojson x.partner_contacts);
      ("AssociatedResources", option_to_yojson arns_to_yojson x.associated_resources);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "BenefitApplicationDetails",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.document_to_yojson
          x.benefit_application_details );
      ("FulfillmentTypes", option_to_yojson fulfillment_types_to_yojson x.fulfillment_types);
      ( "BenefitIdentifier",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.benefit_identifier) );
      ("Description", option_to_yojson benefit_application_description_to_yojson x.description);
      ("Name", option_to_yojson benefit_application_name_to_yojson x.name);
      ("ClientToken", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token));
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let cancel_benefit_application_output_to_yojson = unit_to_yojson

let cancel_benefit_application_input_to_yojson (x : cancel_benefit_application_input) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason);
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ("ClientToken", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token));
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let associate_benefit_application_resource_output_to_yojson
    (x : associate_benefit_application_resource_output) =
  assoc_to_yojson
    [
      ( "Revision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision );
      ("Arn", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.arn);
      ("Id", option_to_yojson benefit_application_id_to_yojson x.id);
    ]

let associate_benefit_application_resource_input_to_yojson
    (x : associate_benefit_application_resource_input) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ( "BenefitApplicationIdentifier",
        Some (benefit_application_identifier_to_yojson x.benefit_application_identifier) );
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]

let amend_benefit_application_output_to_yojson = unit_to_yojson

let amendment_to_yojson (x : amendment) =
  assoc_to_yojson
    [
      ("NewValue", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.new_value));
      ("FieldPath", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.field_path));
    ]

let amendment_list_to_yojson tree = list_to_yojson amendment_to_yojson tree

let amend_benefit_application_input_to_yojson (x : amend_benefit_application_input) =
  assoc_to_yojson
    [
      ("Amendments", Some (amendment_list_to_yojson x.amendments));
      ( "AmendmentReason",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.amendment_reason) );
      ("Identifier", Some (benefit_application_identifier_to_yojson x.identifier));
      ("Revision", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.revision));
      ("ClientToken", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.client_token));
      ("Catalog", Some (catalog_name_to_yojson x.catalog));
    ]
