open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let case_id_not_found_to_yojson (x : case_id_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let case_status_to_yojson = string_to_yojson

let resolve_case_response_to_yojson (x : resolve_case_response) =
  assoc_to_yojson
    [
      ("initialCaseStatus", option_to_yojson case_status_to_yojson x.initial_case_status);
      ("finalCaseStatus", option_to_yojson case_status_to_yojson x.final_case_status);
    ]

let case_id_to_yojson = string_to_yojson

let resolve_case_request_to_yojson (x : resolve_case_request) =
  assoc_to_yojson [ ("caseId", option_to_yojson case_id_to_yojson x.case_id) ]

let long_to_yojson = long_to_yojson
let string__to_yojson = string_to_yojson

let trusted_advisor_check_refresh_status_to_yojson (x : trusted_advisor_check_refresh_status) =
  assoc_to_yojson
    [
      ("checkId", Some (string__to_yojson x.check_id));
      ("status", Some (string__to_yojson x.status));
      ("millisUntilNextRefreshable", Some (long_to_yojson x.millis_until_next_refreshable));
    ]

let refresh_trusted_advisor_check_response_to_yojson (x : refresh_trusted_advisor_check_response) =
  assoc_to_yojson [ ("status", Some (trusted_advisor_check_refresh_status_to_yojson x.status)) ]

let refresh_trusted_advisor_check_request_to_yojson (x : refresh_trusted_advisor_check_request) =
  assoc_to_yojson [ ("checkId", Some (string__to_yojson x.check_id)) ]

let availability_error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson availability_error_message_to_yojson x.message) ]

let double_to_yojson = double_to_yojson

let trusted_advisor_cost_optimizing_summary_to_yojson (x : trusted_advisor_cost_optimizing_summary)
    =
  assoc_to_yojson
    [
      ("estimatedMonthlySavings", Some (double_to_yojson x.estimated_monthly_savings));
      ("estimatedPercentMonthlySavings", Some (double_to_yojson x.estimated_percent_monthly_savings));
    ]

let trusted_advisor_category_specific_summary_to_yojson
    (x : trusted_advisor_category_specific_summary) =
  assoc_to_yojson
    [
      ( "costOptimizing",
        option_to_yojson trusted_advisor_cost_optimizing_summary_to_yojson x.cost_optimizing );
    ]

let trusted_advisor_resources_summary_to_yojson (x : trusted_advisor_resources_summary) =
  assoc_to_yojson
    [
      ("resourcesProcessed", Some (long_to_yojson x.resources_processed));
      ("resourcesFlagged", Some (long_to_yojson x.resources_flagged));
      ("resourcesIgnored", Some (long_to_yojson x.resources_ignored));
      ("resourcesSuppressed", Some (long_to_yojson x.resources_suppressed));
    ]

let boolean__to_yojson = bool_to_yojson

let trusted_advisor_check_summary_to_yojson (x : trusted_advisor_check_summary) =
  assoc_to_yojson
    [
      ("checkId", Some (string__to_yojson x.check_id));
      ("timestamp", Some (string__to_yojson x.timestamp));
      ("status", Some (string__to_yojson x.status));
      ("hasFlaggedResources", option_to_yojson boolean__to_yojson x.has_flagged_resources);
      ("resourcesSummary", Some (trusted_advisor_resources_summary_to_yojson x.resources_summary));
      ( "categorySpecificSummary",
        Some (trusted_advisor_category_specific_summary_to_yojson x.category_specific_summary) );
    ]

let trusted_advisor_check_summary_list_to_yojson tree =
  list_to_yojson trusted_advisor_check_summary_to_yojson tree

let describe_trusted_advisor_check_summaries_response_to_yojson
    (x : describe_trusted_advisor_check_summaries_response) =
  assoc_to_yojson [ ("summaries", Some (trusted_advisor_check_summary_list_to_yojson x.summaries)) ]

let string_list_to_yojson tree = list_to_yojson (nullable_to_yojson string__to_yojson) tree

let describe_trusted_advisor_check_summaries_request_to_yojson
    (x : describe_trusted_advisor_check_summaries_request) =
  assoc_to_yojson [ ("checkIds", Some (string_list_to_yojson x.check_ids)) ]

let trusted_advisor_check_description_to_yojson (x : trusted_advisor_check_description) =
  assoc_to_yojson
    [
      ("id", Some (string__to_yojson x.id));
      ("name", Some (string__to_yojson x.name));
      ("description", Some (string__to_yojson x.description));
      ("category", Some (string__to_yojson x.category));
      ("metadata", Some (string_list_to_yojson x.metadata));
    ]

let trusted_advisor_check_list_to_yojson tree =
  list_to_yojson trusted_advisor_check_description_to_yojson tree

let describe_trusted_advisor_checks_response_to_yojson
    (x : describe_trusted_advisor_checks_response) =
  assoc_to_yojson [ ("checks", Some (trusted_advisor_check_list_to_yojson x.checks)) ]

let describe_trusted_advisor_checks_request_to_yojson (x : describe_trusted_advisor_checks_request)
    =
  assoc_to_yojson [ ("language", Some (string__to_yojson x.language)) ]

let trusted_advisor_resource_detail_to_yojson (x : trusted_advisor_resource_detail) =
  assoc_to_yojson
    [
      ("status", Some (string__to_yojson x.status));
      ("region", option_to_yojson string__to_yojson x.region);
      ("resourceId", Some (string__to_yojson x.resource_id));
      ("isSuppressed", option_to_yojson boolean__to_yojson x.is_suppressed);
      ("metadata", Some (string_list_to_yojson x.metadata));
    ]

let trusted_advisor_resource_detail_list_to_yojson tree =
  list_to_yojson trusted_advisor_resource_detail_to_yojson tree

let trusted_advisor_check_result_to_yojson (x : trusted_advisor_check_result) =
  assoc_to_yojson
    [
      ("checkId", Some (string__to_yojson x.check_id));
      ("timestamp", Some (string__to_yojson x.timestamp));
      ("status", Some (string__to_yojson x.status));
      ("resourcesSummary", Some (trusted_advisor_resources_summary_to_yojson x.resources_summary));
      ( "categorySpecificSummary",
        Some (trusted_advisor_category_specific_summary_to_yojson x.category_specific_summary) );
      ("flaggedResources", Some (trusted_advisor_resource_detail_list_to_yojson x.flagged_resources));
    ]

let describe_trusted_advisor_check_result_response_to_yojson
    (x : describe_trusted_advisor_check_result_response) =
  assoc_to_yojson [ ("result", option_to_yojson trusted_advisor_check_result_to_yojson x.result_) ]

let describe_trusted_advisor_check_result_request_to_yojson
    (x : describe_trusted_advisor_check_result_request) =
  assoc_to_yojson
    [
      ("checkId", Some (string__to_yojson x.check_id));
      ("language", option_to_yojson string__to_yojson x.language);
    ]

let trusted_advisor_check_refresh_status_list_to_yojson tree =
  list_to_yojson trusted_advisor_check_refresh_status_to_yojson tree

let describe_trusted_advisor_check_refresh_statuses_response_to_yojson
    (x : describe_trusted_advisor_check_refresh_statuses_response) =
  assoc_to_yojson
    [ ("statuses", Some (trusted_advisor_check_refresh_status_list_to_yojson x.statuses)) ]

let describe_trusted_advisor_check_refresh_statuses_request_to_yojson
    (x : describe_trusted_advisor_check_refresh_statuses_request) =
  assoc_to_yojson [ ("checkIds", Some (string_list_to_yojson x.check_ids)) ]

let display_to_yojson = string_to_yojson
let language_to_yojson = string_to_yojson
let code_to_yojson = string_to_yojson

let supported_language_to_yojson (x : supported_language) =
  assoc_to_yojson
    [
      ("code", option_to_yojson code_to_yojson x.code);
      ("language", option_to_yojson language_to_yojson x.language);
      ("display", option_to_yojson display_to_yojson x.display);
    ]

let supported_languages_list_to_yojson tree = list_to_yojson supported_language_to_yojson tree

let describe_supported_languages_response_to_yojson (x : describe_supported_languages_response) =
  assoc_to_yojson
    [
      ( "supportedLanguages",
        option_to_yojson supported_languages_list_to_yojson x.supported_languages );
    ]

let validated_category_code_to_yojson = string_to_yojson
let validated_service_code_to_yojson = string_to_yojson
let validated_issue_type_string_to_yojson = string_to_yojson

let describe_supported_languages_request_to_yojson (x : describe_supported_languages_request) =
  assoc_to_yojson
    [
      ("issueType", Some (validated_issue_type_string_to_yojson x.issue_type));
      ("serviceCode", Some (validated_service_code_to_yojson x.service_code));
      ("categoryCode", Some (validated_category_code_to_yojson x.category_code));
    ]

let severity_level_name_to_yojson = string_to_yojson
let severity_level_code_to_yojson = string_to_yojson

let severity_level_to_yojson (x : severity_level) =
  assoc_to_yojson
    [
      ("code", option_to_yojson severity_level_code_to_yojson x.code);
      ("name", option_to_yojson severity_level_name_to_yojson x.name);
    ]

let severity_levels_list_to_yojson tree = list_to_yojson severity_level_to_yojson tree

let describe_severity_levels_response_to_yojson (x : describe_severity_levels_response) =
  assoc_to_yojson
    [ ("severityLevels", option_to_yojson severity_levels_list_to_yojson x.severity_levels) ]

let describe_severity_levels_request_to_yojson (x : describe_severity_levels_request) =
  assoc_to_yojson [ ("language", option_to_yojson language_to_yojson x.language) ]

let category_name_to_yojson = string_to_yojson
let category_code_to_yojson = string_to_yojson

let category_to_yojson (x : category) =
  assoc_to_yojson
    [
      ("code", option_to_yojson category_code_to_yojson x.code);
      ("name", option_to_yojson category_name_to_yojson x.name);
    ]

let category_list_to_yojson tree = list_to_yojson category_to_yojson tree
let service_name_to_yojson = string_to_yojson
let service_code_to_yojson = string_to_yojson

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("code", option_to_yojson service_code_to_yojson x.code);
      ("name", option_to_yojson service_name_to_yojson x.name);
      ("categories", option_to_yojson category_list_to_yojson x.categories);
    ]

let service_list_to_yojson tree = list_to_yojson service_to_yojson tree

let describe_services_response_to_yojson (x : describe_services_response) =
  assoc_to_yojson [ ("services", option_to_yojson service_list_to_yojson x.services) ]

let service_code2_to_yojson = string_to_yojson
let service_code_list_to_yojson tree = list_to_yojson service_code2_to_yojson tree

let describe_services_request_to_yojson (x : describe_services_request) =
  assoc_to_yojson
    [
      ("serviceCodeList", option_to_yojson service_code_list_to_yojson x.service_code_list);
      ("language", option_to_yojson language_to_yojson x.language);
    ]

let validated_date_time_to_yojson = string_to_yojson

let date_interval_to_yojson (x : date_interval) =
  assoc_to_yojson
    [
      ("startDateTime", option_to_yojson validated_date_time_to_yojson x.start_date_time);
      ("endDateTime", option_to_yojson validated_date_time_to_yojson x.end_date_time);
    ]

let dates_without_support_list_to_yojson tree = list_to_yojson date_interval_to_yojson tree
let end_time_to_yojson = string_to_yojson
let start_time_to_yojson = string_to_yojson

let supported_hour_to_yojson (x : supported_hour) =
  assoc_to_yojson
    [
      ("startTime", option_to_yojson start_time_to_yojson x.start_time);
      ("endTime", option_to_yojson end_time_to_yojson x.end_time);
    ]

let supported_hours_list_to_yojson tree = list_to_yojson supported_hour_to_yojson tree
let type__to_yojson = string_to_yojson

let communication_type_options_to_yojson (x : communication_type_options) =
  assoc_to_yojson
    [
      ("type", option_to_yojson type__to_yojson x.type_);
      ("supportedHours", option_to_yojson supported_hours_list_to_yojson x.supported_hours);
      ( "datesWithoutSupport",
        option_to_yojson dates_without_support_list_to_yojson x.dates_without_support );
    ]

let communication_type_options_list_to_yojson tree =
  list_to_yojson communication_type_options_to_yojson tree

let validated_language_availability_to_yojson = string_to_yojson

let describe_create_case_options_response_to_yojson (x : describe_create_case_options_response) =
  assoc_to_yojson
    [
      ( "languageAvailability",
        option_to_yojson validated_language_availability_to_yojson x.language_availability );
      ( "communicationTypes",
        option_to_yojson communication_type_options_list_to_yojson x.communication_types );
    ]

let issue_type_to_yojson = string_to_yojson

let describe_create_case_options_request_to_yojson (x : describe_create_case_options_request) =
  assoc_to_yojson
    [
      ("issueType", Some (issue_type_to_yojson x.issue_type));
      ("serviceCode", Some (service_code2_to_yojson x.service_code));
      ("language", Some (language_to_yojson x.language));
      ("categoryCode", Some (category_code_to_yojson x.category_code));
    ]

let next_token_to_yojson = string_to_yojson
let file_name_to_yojson = string_to_yojson
let attachment_id_to_yojson = string_to_yojson

let attachment_details_to_yojson (x : attachment_details) =
  assoc_to_yojson
    [
      ("attachmentId", option_to_yojson attachment_id_to_yojson x.attachment_id);
      ("fileName", option_to_yojson file_name_to_yojson x.file_name);
    ]

let attachment_set_to_yojson tree = list_to_yojson attachment_details_to_yojson tree
let time_created_to_yojson = string_to_yojson
let submitted_by_to_yojson = string_to_yojson
let validated_communication_body_to_yojson = string_to_yojson

let communication_to_yojson (x : communication) =
  assoc_to_yojson
    [
      ("caseId", option_to_yojson case_id_to_yojson x.case_id);
      ("body", option_to_yojson validated_communication_body_to_yojson x.body);
      ("submittedBy", option_to_yojson submitted_by_to_yojson x.submitted_by);
      ("timeCreated", option_to_yojson time_created_to_yojson x.time_created);
      ("attachmentSet", option_to_yojson attachment_set_to_yojson x.attachment_set);
    ]

let communication_list_to_yojson tree = list_to_yojson communication_to_yojson tree

let describe_communications_response_to_yojson (x : describe_communications_response) =
  assoc_to_yojson
    [
      ("communications", option_to_yojson communication_list_to_yojson x.communications);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let after_time_to_yojson = string_to_yojson
let before_time_to_yojson = string_to_yojson

let describe_communications_request_to_yojson (x : describe_communications_request) =
  assoc_to_yojson
    [
      ("caseId", Some (case_id_to_yojson x.case_id));
      ("beforeTime", option_to_yojson before_time_to_yojson x.before_time);
      ("afterTime", option_to_yojson after_time_to_yojson x.after_time);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let cc_email_address_to_yojson = string_to_yojson
let cc_email_address_list_to_yojson tree = list_to_yojson cc_email_address_to_yojson tree

let recent_case_communications_to_yojson (x : recent_case_communications) =
  assoc_to_yojson
    [
      ("communications", option_to_yojson communication_list_to_yojson x.communications);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let severity_code_to_yojson = string_to_yojson
let status_to_yojson = string_to_yojson
let subject_to_yojson = string_to_yojson
let display_id_to_yojson = string_to_yojson

let case_details_to_yojson (x : case_details) =
  assoc_to_yojson
    [
      ("caseId", option_to_yojson case_id_to_yojson x.case_id);
      ("displayId", option_to_yojson display_id_to_yojson x.display_id);
      ("subject", option_to_yojson subject_to_yojson x.subject);
      ("status", option_to_yojson status_to_yojson x.status);
      ("serviceCode", option_to_yojson service_code_to_yojson x.service_code);
      ("categoryCode", option_to_yojson category_code_to_yojson x.category_code);
      ("severityCode", option_to_yojson severity_code_to_yojson x.severity_code);
      ("submittedBy", option_to_yojson submitted_by_to_yojson x.submitted_by);
      ("timeCreated", option_to_yojson time_created_to_yojson x.time_created);
      ( "recentCommunications",
        option_to_yojson recent_case_communications_to_yojson x.recent_communications );
      ("ccEmailAddresses", option_to_yojson cc_email_address_list_to_yojson x.cc_email_addresses);
      ("language", option_to_yojson language_to_yojson x.language);
    ]

let case_list_to_yojson tree = list_to_yojson case_details_to_yojson tree

let describe_cases_response_to_yojson (x : describe_cases_response) =
  assoc_to_yojson
    [
      ("cases", option_to_yojson case_list_to_yojson x.cases);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let include_communications_to_yojson = bool_to_yojson
let include_resolved_cases_to_yojson = bool_to_yojson
let case_id_list_to_yojson tree = list_to_yojson case_id_to_yojson tree

let describe_cases_request_to_yojson (x : describe_cases_request) =
  assoc_to_yojson
    [
      ("caseIdList", option_to_yojson case_id_list_to_yojson x.case_id_list);
      ("displayId", option_to_yojson display_id_to_yojson x.display_id);
      ("afterTime", option_to_yojson after_time_to_yojson x.after_time);
      ("beforeTime", option_to_yojson before_time_to_yojson x.before_time);
      ( "includeResolvedCases",
        option_to_yojson include_resolved_cases_to_yojson x.include_resolved_cases );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("language", option_to_yojson language_to_yojson x.language);
      ( "includeCommunications",
        option_to_yojson include_communications_to_yojson x.include_communications );
    ]

let describe_attachment_limit_exceeded_to_yojson (x : describe_attachment_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_id_not_found_to_yojson (x : attachment_id_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let data_to_yojson = blob_to_yojson

let attachment_to_yojson (x : attachment) =
  assoc_to_yojson
    [
      ("fileName", option_to_yojson file_name_to_yojson x.file_name);
      ("data", option_to_yojson data_to_yojson x.data);
    ]

let describe_attachment_response_to_yojson (x : describe_attachment_response) =
  assoc_to_yojson [ ("attachment", option_to_yojson attachment_to_yojson x.attachment) ]

let describe_attachment_request_to_yojson (x : describe_attachment_request) =
  assoc_to_yojson [ ("attachmentId", Some (attachment_id_to_yojson x.attachment_id)) ]

let case_creation_limit_exceeded_to_yojson (x : case_creation_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_set_id_not_found_to_yojson (x : attachment_set_id_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_set_expired_to_yojson (x : attachment_set_expired) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let create_case_response_to_yojson (x : create_case_response) =
  assoc_to_yojson [ ("caseId", option_to_yojson case_id_to_yojson x.case_id) ]

let attachment_set_id_to_yojson = string_to_yojson
let communication_body_to_yojson = string_to_yojson

let create_case_request_to_yojson (x : create_case_request) =
  assoc_to_yojson
    [
      ("subject", Some (subject_to_yojson x.subject));
      ("serviceCode", option_to_yojson service_code2_to_yojson x.service_code);
      ("severityCode", option_to_yojson severity_code_to_yojson x.severity_code);
      ("categoryCode", option_to_yojson category_code_to_yojson x.category_code);
      ("communicationBody", Some (communication_body_to_yojson x.communication_body));
      ("ccEmailAddresses", option_to_yojson cc_email_address_list_to_yojson x.cc_email_addresses);
      ("language", option_to_yojson language_to_yojson x.language);
      ("issueType", option_to_yojson issue_type_to_yojson x.issue_type);
      ("attachmentSetId", option_to_yojson attachment_set_id_to_yojson x.attachment_set_id);
    ]

let result__to_yojson = bool_to_yojson

let add_communication_to_case_response_to_yojson (x : add_communication_to_case_response) =
  assoc_to_yojson [ ("result", option_to_yojson result__to_yojson x.result_) ]

let add_communication_to_case_request_to_yojson (x : add_communication_to_case_request) =
  assoc_to_yojson
    [
      ("caseId", option_to_yojson case_id_to_yojson x.case_id);
      ("communicationBody", Some (communication_body_to_yojson x.communication_body));
      ("ccEmailAddresses", option_to_yojson cc_email_address_list_to_yojson x.cc_email_addresses);
      ("attachmentSetId", option_to_yojson attachment_set_id_to_yojson x.attachment_set_id);
    ]

let attachment_set_size_limit_exceeded_to_yojson (x : attachment_set_size_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_limit_exceeded_to_yojson (x : attachment_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let expiry_time_to_yojson = string_to_yojson

let add_attachments_to_set_response_to_yojson (x : add_attachments_to_set_response) =
  assoc_to_yojson
    [
      ("attachmentSetId", option_to_yojson attachment_set_id_to_yojson x.attachment_set_id);
      ("expiryTime", option_to_yojson expiry_time_to_yojson x.expiry_time);
    ]

let attachments_to_yojson tree = list_to_yojson attachment_to_yojson tree

let add_attachments_to_set_request_to_yojson (x : add_attachments_to_set_request) =
  assoc_to_yojson
    [
      ("attachmentSetId", option_to_yojson attachment_set_id_to_yojson x.attachment_set_id);
      ("attachments", Some (attachments_to_yojson x.attachments));
    ]
