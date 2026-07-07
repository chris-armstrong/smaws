open Smaws_Lib.Json.SerializeHelpers
open Types

let validated_service_code_to_yojson = string_to_yojson
let validated_language_availability_to_yojson = string_to_yojson
let validated_issue_type_string_to_yojson = string_to_yojson
let validated_date_time_to_yojson = string_to_yojson
let validated_communication_body_to_yojson = string_to_yojson
let validated_category_code_to_yojson = string_to_yojson
let type__to_yojson = string_to_yojson
let long_to_yojson = long_to_yojson

let trusted_advisor_resources_summary_to_yojson (x : trusted_advisor_resources_summary) =
  assoc_to_yojson
    [
      ("resourcesSuppressed", Some (long_to_yojson x.resources_suppressed));
      ("resourcesIgnored", Some (long_to_yojson x.resources_ignored));
      ("resourcesFlagged", Some (long_to_yojson x.resources_flagged));
      ("resourcesProcessed", Some (long_to_yojson x.resources_processed));
    ]

let string__to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson
let string_list_to_yojson tree = list_to_yojson (nullable_to_yojson string__to_yojson) tree

let trusted_advisor_resource_detail_to_yojson (x : trusted_advisor_resource_detail) =
  assoc_to_yojson
    [
      ("metadata", Some (string_list_to_yojson x.metadata));
      ("isSuppressed", option_to_yojson boolean__to_yojson x.is_suppressed);
      ("resourceId", Some (string__to_yojson x.resource_id));
      ("region", option_to_yojson string__to_yojson x.region);
      ("status", Some (string__to_yojson x.status));
    ]

let trusted_advisor_resource_detail_list_to_yojson tree =
  list_to_yojson trusted_advisor_resource_detail_to_yojson tree

let double_to_yojson = double_to_yojson

let trusted_advisor_cost_optimizing_summary_to_yojson (x : trusted_advisor_cost_optimizing_summary)
    =
  assoc_to_yojson
    [
      ("estimatedPercentMonthlySavings", Some (double_to_yojson x.estimated_percent_monthly_savings));
      ("estimatedMonthlySavings", Some (double_to_yojson x.estimated_monthly_savings));
    ]

let trusted_advisor_category_specific_summary_to_yojson
    (x : trusted_advisor_category_specific_summary) =
  assoc_to_yojson
    [
      ( "costOptimizing",
        option_to_yojson trusted_advisor_cost_optimizing_summary_to_yojson x.cost_optimizing );
    ]

let trusted_advisor_check_summary_to_yojson (x : trusted_advisor_check_summary) =
  assoc_to_yojson
    [
      ( "categorySpecificSummary",
        Some (trusted_advisor_category_specific_summary_to_yojson x.category_specific_summary) );
      ("resourcesSummary", Some (trusted_advisor_resources_summary_to_yojson x.resources_summary));
      ("hasFlaggedResources", option_to_yojson boolean__to_yojson x.has_flagged_resources);
      ("status", Some (string__to_yojson x.status));
      ("timestamp", Some (string__to_yojson x.timestamp));
      ("checkId", Some (string__to_yojson x.check_id));
    ]

let trusted_advisor_check_summary_list_to_yojson tree =
  list_to_yojson trusted_advisor_check_summary_to_yojson tree

let trusted_advisor_check_result_to_yojson (x : trusted_advisor_check_result) =
  assoc_to_yojson
    [
      ("flaggedResources", Some (trusted_advisor_resource_detail_list_to_yojson x.flagged_resources));
      ( "categorySpecificSummary",
        Some (trusted_advisor_category_specific_summary_to_yojson x.category_specific_summary) );
      ("resourcesSummary", Some (trusted_advisor_resources_summary_to_yojson x.resources_summary));
      ("status", Some (string__to_yojson x.status));
      ("timestamp", Some (string__to_yojson x.timestamp));
      ("checkId", Some (string__to_yojson x.check_id));
    ]

let trusted_advisor_check_refresh_status_to_yojson (x : trusted_advisor_check_refresh_status) =
  assoc_to_yojson
    [
      ("millisUntilNextRefreshable", Some (long_to_yojson x.millis_until_next_refreshable));
      ("status", Some (string__to_yojson x.status));
      ("checkId", Some (string__to_yojson x.check_id));
    ]

let trusted_advisor_check_refresh_status_list_to_yojson tree =
  list_to_yojson trusted_advisor_check_refresh_status_to_yojson tree

let trusted_advisor_check_description_to_yojson (x : trusted_advisor_check_description) =
  assoc_to_yojson
    [
      ("metadata", Some (string_list_to_yojson x.metadata));
      ("category", Some (string__to_yojson x.category));
      ("description", Some (string__to_yojson x.description));
      ("name", Some (string__to_yojson x.name));
      ("id", Some (string__to_yojson x.id));
    ]

let trusted_advisor_check_list_to_yojson tree =
  list_to_yojson trusted_advisor_check_description_to_yojson tree

let time_created_to_yojson = string_to_yojson
let availability_error_message_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson availability_error_message_to_yojson x.message) ]

let code_to_yojson = string_to_yojson
let language_to_yojson = string_to_yojson
let display_to_yojson = string_to_yojson

let supported_language_to_yojson (x : supported_language) =
  assoc_to_yojson
    [
      ("display", option_to_yojson display_to_yojson x.display);
      ("language", option_to_yojson language_to_yojson x.language);
      ("code", option_to_yojson code_to_yojson x.code);
    ]

let supported_languages_list_to_yojson tree = list_to_yojson supported_language_to_yojson tree
let start_time_to_yojson = string_to_yojson
let end_time_to_yojson = string_to_yojson

let supported_hour_to_yojson (x : supported_hour) =
  assoc_to_yojson
    [
      ("endTime", option_to_yojson end_time_to_yojson x.end_time);
      ("startTime", option_to_yojson start_time_to_yojson x.start_time);
    ]

let supported_hours_list_to_yojson tree = list_to_yojson supported_hour_to_yojson tree
let submitted_by_to_yojson = string_to_yojson
let subject_to_yojson = string_to_yojson
let status_to_yojson = string_to_yojson
let severity_level_code_to_yojson = string_to_yojson
let severity_level_name_to_yojson = string_to_yojson

let severity_level_to_yojson (x : severity_level) =
  assoc_to_yojson
    [
      ("name", option_to_yojson severity_level_name_to_yojson x.name);
      ("code", option_to_yojson severity_level_code_to_yojson x.code);
    ]

let severity_levels_list_to_yojson tree = list_to_yojson severity_level_to_yojson tree
let severity_code_to_yojson = string_to_yojson
let service_name_to_yojson = string_to_yojson
let service_code_to_yojson = string_to_yojson
let category_code_to_yojson = string_to_yojson
let category_name_to_yojson = string_to_yojson

let category_to_yojson (x : category) =
  assoc_to_yojson
    [
      ("name", option_to_yojson category_name_to_yojson x.name);
      ("code", option_to_yojson category_code_to_yojson x.code);
    ]

let category_list_to_yojson tree = list_to_yojson category_to_yojson tree

let service_to_yojson (x : service) =
  assoc_to_yojson
    [
      ("categories", option_to_yojson category_list_to_yojson x.categories);
      ("name", option_to_yojson service_name_to_yojson x.name);
      ("code", option_to_yojson service_code_to_yojson x.code);
    ]

let service_list_to_yojson tree = list_to_yojson service_to_yojson tree
let service_code2_to_yojson = string_to_yojson
let service_code_list_to_yojson tree = list_to_yojson service_code2_to_yojson tree
let result__to_yojson = bool_to_yojson
let case_status_to_yojson = string_to_yojson

let resolve_case_response_to_yojson (x : resolve_case_response) =
  assoc_to_yojson
    [
      ("finalCaseStatus", option_to_yojson case_status_to_yojson x.final_case_status);
      ("initialCaseStatus", option_to_yojson case_status_to_yojson x.initial_case_status);
    ]

let case_id_to_yojson = string_to_yojson

let resolve_case_request_to_yojson (x : resolve_case_request) =
  assoc_to_yojson [ ("caseId", option_to_yojson case_id_to_yojson x.case_id) ]

let error_message_to_yojson = string_to_yojson

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let case_id_not_found_to_yojson (x : case_id_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let refresh_trusted_advisor_check_response_to_yojson (x : refresh_trusted_advisor_check_response) =
  assoc_to_yojson [ ("status", Some (trusted_advisor_check_refresh_status_to_yojson x.status)) ]

let refresh_trusted_advisor_check_request_to_yojson (x : refresh_trusted_advisor_check_request) =
  assoc_to_yojson [ ("checkId", Some (string__to_yojson x.check_id)) ]

let attachment_id_to_yojson = string_to_yojson
let file_name_to_yojson = string_to_yojson

let attachment_details_to_yojson (x : attachment_details) =
  assoc_to_yojson
    [
      ("fileName", option_to_yojson file_name_to_yojson x.file_name);
      ("attachmentId", option_to_yojson attachment_id_to_yojson x.attachment_id);
    ]

let attachment_set_to_yojson tree = list_to_yojson attachment_details_to_yojson tree

let communication_to_yojson (x : communication) =
  assoc_to_yojson
    [
      ("attachmentSet", option_to_yojson attachment_set_to_yojson x.attachment_set);
      ("timeCreated", option_to_yojson time_created_to_yojson x.time_created);
      ("submittedBy", option_to_yojson submitted_by_to_yojson x.submitted_by);
      ("body", option_to_yojson validated_communication_body_to_yojson x.body);
      ("caseId", option_to_yojson case_id_to_yojson x.case_id);
    ]

let communication_list_to_yojson tree = list_to_yojson communication_to_yojson tree
let next_token_to_yojson = string_to_yojson

let recent_case_communications_to_yojson (x : recent_case_communications) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("communications", option_to_yojson communication_list_to_yojson x.communications);
    ]

let max_results_to_yojson = int_to_yojson
let issue_type_to_yojson = string_to_yojson
let include_resolved_cases_to_yojson = bool_to_yojson
let include_communications_to_yojson = bool_to_yojson
let expiry_time_to_yojson = string_to_yojson
let display_id_to_yojson = string_to_yojson

let describe_trusted_advisor_checks_response_to_yojson
    (x : describe_trusted_advisor_checks_response) =
  assoc_to_yojson [ ("checks", Some (trusted_advisor_check_list_to_yojson x.checks)) ]

let describe_trusted_advisor_checks_request_to_yojson (x : describe_trusted_advisor_checks_request)
    =
  assoc_to_yojson [ ("language", Some (string__to_yojson x.language)) ]

let describe_trusted_advisor_check_summaries_response_to_yojson
    (x : describe_trusted_advisor_check_summaries_response) =
  assoc_to_yojson [ ("summaries", Some (trusted_advisor_check_summary_list_to_yojson x.summaries)) ]

let describe_trusted_advisor_check_summaries_request_to_yojson
    (x : describe_trusted_advisor_check_summaries_request) =
  assoc_to_yojson [ ("checkIds", Some (string_list_to_yojson x.check_ids)) ]

let describe_trusted_advisor_check_result_response_to_yojson
    (x : describe_trusted_advisor_check_result_response) =
  assoc_to_yojson [ ("result", option_to_yojson trusted_advisor_check_result_to_yojson x.result_) ]

let describe_trusted_advisor_check_result_request_to_yojson
    (x : describe_trusted_advisor_check_result_request) =
  assoc_to_yojson
    [
      ("language", option_to_yojson string__to_yojson x.language);
      ("checkId", Some (string__to_yojson x.check_id));
    ]

let describe_trusted_advisor_check_refresh_statuses_response_to_yojson
    (x : describe_trusted_advisor_check_refresh_statuses_response) =
  assoc_to_yojson
    [ ("statuses", Some (trusted_advisor_check_refresh_status_list_to_yojson x.statuses)) ]

let describe_trusted_advisor_check_refresh_statuses_request_to_yojson
    (x : describe_trusted_advisor_check_refresh_statuses_request) =
  assoc_to_yojson [ ("checkIds", Some (string_list_to_yojson x.check_ids)) ]

let describe_supported_languages_response_to_yojson (x : describe_supported_languages_response) =
  assoc_to_yojson
    [
      ( "supportedLanguages",
        option_to_yojson supported_languages_list_to_yojson x.supported_languages );
    ]

let describe_supported_languages_request_to_yojson (x : describe_supported_languages_request) =
  assoc_to_yojson
    [
      ("categoryCode", Some (validated_category_code_to_yojson x.category_code));
      ("serviceCode", Some (validated_service_code_to_yojson x.service_code));
      ("issueType", Some (validated_issue_type_string_to_yojson x.issue_type));
    ]

let describe_severity_levels_response_to_yojson (x : describe_severity_levels_response) =
  assoc_to_yojson
    [ ("severityLevels", option_to_yojson severity_levels_list_to_yojson x.severity_levels) ]

let describe_severity_levels_request_to_yojson (x : describe_severity_levels_request) =
  assoc_to_yojson [ ("language", option_to_yojson language_to_yojson x.language) ]

let describe_services_response_to_yojson (x : describe_services_response) =
  assoc_to_yojson [ ("services", option_to_yojson service_list_to_yojson x.services) ]

let describe_services_request_to_yojson (x : describe_services_request) =
  assoc_to_yojson
    [
      ("language", option_to_yojson language_to_yojson x.language);
      ("serviceCodeList", option_to_yojson service_code_list_to_yojson x.service_code_list);
    ]

let date_interval_to_yojson (x : date_interval) =
  assoc_to_yojson
    [
      ("endDateTime", option_to_yojson validated_date_time_to_yojson x.end_date_time);
      ("startDateTime", option_to_yojson validated_date_time_to_yojson x.start_date_time);
    ]

let dates_without_support_list_to_yojson tree = list_to_yojson date_interval_to_yojson tree

let communication_type_options_to_yojson (x : communication_type_options) =
  assoc_to_yojson
    [
      ( "datesWithoutSupport",
        option_to_yojson dates_without_support_list_to_yojson x.dates_without_support );
      ("supportedHours", option_to_yojson supported_hours_list_to_yojson x.supported_hours);
      ("type", option_to_yojson type__to_yojson x.type_);
    ]

let communication_type_options_list_to_yojson tree =
  list_to_yojson communication_type_options_to_yojson tree

let describe_create_case_options_response_to_yojson (x : describe_create_case_options_response) =
  assoc_to_yojson
    [
      ( "communicationTypes",
        option_to_yojson communication_type_options_list_to_yojson x.communication_types );
      ( "languageAvailability",
        option_to_yojson validated_language_availability_to_yojson x.language_availability );
    ]

let describe_create_case_options_request_to_yojson (x : describe_create_case_options_request) =
  assoc_to_yojson
    [
      ("categoryCode", Some (category_code_to_yojson x.category_code));
      ("language", Some (language_to_yojson x.language));
      ("serviceCode", Some (service_code2_to_yojson x.service_code));
      ("issueType", Some (issue_type_to_yojson x.issue_type));
    ]

let describe_communications_response_to_yojson (x : describe_communications_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("communications", option_to_yojson communication_list_to_yojson x.communications);
    ]

let before_time_to_yojson = string_to_yojson
let after_time_to_yojson = string_to_yojson

let describe_communications_request_to_yojson (x : describe_communications_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("afterTime", option_to_yojson after_time_to_yojson x.after_time);
      ("beforeTime", option_to_yojson before_time_to_yojson x.before_time);
      ("caseId", Some (case_id_to_yojson x.case_id));
    ]

let cc_email_address_to_yojson = string_to_yojson
let cc_email_address_list_to_yojson tree = list_to_yojson cc_email_address_to_yojson tree

let case_details_to_yojson (x : case_details) =
  assoc_to_yojson
    [
      ("language", option_to_yojson language_to_yojson x.language);
      ("ccEmailAddresses", option_to_yojson cc_email_address_list_to_yojson x.cc_email_addresses);
      ( "recentCommunications",
        option_to_yojson recent_case_communications_to_yojson x.recent_communications );
      ("timeCreated", option_to_yojson time_created_to_yojson x.time_created);
      ("submittedBy", option_to_yojson submitted_by_to_yojson x.submitted_by);
      ("severityCode", option_to_yojson severity_code_to_yojson x.severity_code);
      ("categoryCode", option_to_yojson category_code_to_yojson x.category_code);
      ("serviceCode", option_to_yojson service_code_to_yojson x.service_code);
      ("status", option_to_yojson status_to_yojson x.status);
      ("subject", option_to_yojson subject_to_yojson x.subject);
      ("displayId", option_to_yojson display_id_to_yojson x.display_id);
      ("caseId", option_to_yojson case_id_to_yojson x.case_id);
    ]

let case_list_to_yojson tree = list_to_yojson case_details_to_yojson tree

let describe_cases_response_to_yojson (x : describe_cases_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("cases", option_to_yojson case_list_to_yojson x.cases);
    ]

let case_id_list_to_yojson tree = list_to_yojson case_id_to_yojson tree

let describe_cases_request_to_yojson (x : describe_cases_request) =
  assoc_to_yojson
    [
      ( "includeCommunications",
        option_to_yojson include_communications_to_yojson x.include_communications );
      ("language", option_to_yojson language_to_yojson x.language);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "includeResolvedCases",
        option_to_yojson include_resolved_cases_to_yojson x.include_resolved_cases );
      ("beforeTime", option_to_yojson before_time_to_yojson x.before_time);
      ("afterTime", option_to_yojson after_time_to_yojson x.after_time);
      ("displayId", option_to_yojson display_id_to_yojson x.display_id);
      ("caseIdList", option_to_yojson case_id_list_to_yojson x.case_id_list);
    ]

let data_to_yojson = blob_to_yojson

let attachment_to_yojson (x : attachment) =
  assoc_to_yojson
    [
      ("data", option_to_yojson data_to_yojson x.data);
      ("fileName", option_to_yojson file_name_to_yojson x.file_name);
    ]

let describe_attachment_response_to_yojson (x : describe_attachment_response) =
  assoc_to_yojson [ ("attachment", option_to_yojson attachment_to_yojson x.attachment) ]

let describe_attachment_request_to_yojson (x : describe_attachment_request) =
  assoc_to_yojson [ ("attachmentId", Some (attachment_id_to_yojson x.attachment_id)) ]

let describe_attachment_limit_exceeded_to_yojson (x : describe_attachment_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_id_not_found_to_yojson (x : attachment_id_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let create_case_response_to_yojson (x : create_case_response) =
  assoc_to_yojson [ ("caseId", option_to_yojson case_id_to_yojson x.case_id) ]

let communication_body_to_yojson = string_to_yojson
let attachment_set_id_to_yojson = string_to_yojson

let create_case_request_to_yojson (x : create_case_request) =
  assoc_to_yojson
    [
      ("attachmentSetId", option_to_yojson attachment_set_id_to_yojson x.attachment_set_id);
      ("issueType", option_to_yojson issue_type_to_yojson x.issue_type);
      ("language", option_to_yojson language_to_yojson x.language);
      ("ccEmailAddresses", option_to_yojson cc_email_address_list_to_yojson x.cc_email_addresses);
      ("communicationBody", Some (communication_body_to_yojson x.communication_body));
      ("categoryCode", option_to_yojson category_code_to_yojson x.category_code);
      ("severityCode", option_to_yojson severity_code_to_yojson x.severity_code);
      ("serviceCode", option_to_yojson service_code2_to_yojson x.service_code);
      ("subject", Some (subject_to_yojson x.subject));
    ]

let case_creation_limit_exceeded_to_yojson (x : case_creation_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_set_id_not_found_to_yojson (x : attachment_set_id_not_found) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_set_expired_to_yojson (x : attachment_set_expired) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachments_to_yojson tree = list_to_yojson attachment_to_yojson tree

let attachment_set_size_limit_exceeded_to_yojson (x : attachment_set_size_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let attachment_limit_exceeded_to_yojson (x : attachment_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let add_communication_to_case_response_to_yojson (x : add_communication_to_case_response) =
  assoc_to_yojson [ ("result", option_to_yojson result__to_yojson x.result_) ]

let add_communication_to_case_request_to_yojson (x : add_communication_to_case_request) =
  assoc_to_yojson
    [
      ("attachmentSetId", option_to_yojson attachment_set_id_to_yojson x.attachment_set_id);
      ("ccEmailAddresses", option_to_yojson cc_email_address_list_to_yojson x.cc_email_addresses);
      ("communicationBody", Some (communication_body_to_yojson x.communication_body));
      ("caseId", option_to_yojson case_id_to_yojson x.case_id);
    ]

let add_attachments_to_set_response_to_yojson (x : add_attachments_to_set_response) =
  assoc_to_yojson
    [
      ("expiryTime", option_to_yojson expiry_time_to_yojson x.expiry_time);
      ("attachmentSetId", option_to_yojson attachment_set_id_to_yojson x.attachment_set_id);
    ]

let add_attachments_to_set_request_to_yojson (x : add_attachments_to_set_request) =
  assoc_to_yojson
    [
      ("attachments", Some (attachments_to_yojson x.attachments));
      ("attachmentSetId", option_to_yojson attachment_set_id_to_yojson x.attachment_set_id);
    ]
