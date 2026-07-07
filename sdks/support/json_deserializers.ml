open Smaws_Lib.Json.DeserializeHelpers
open Types

let validated_service_code_of_yojson = string_of_yojson
let validated_language_availability_of_yojson = string_of_yojson
let validated_issue_type_string_of_yojson = string_of_yojson
let validated_date_time_of_yojson = string_of_yojson
let validated_communication_body_of_yojson = string_of_yojson
let validated_category_code_of_yojson = string_of_yojson
let type__of_yojson = string_of_yojson
let long_of_yojson = long_of_yojson

let trusted_advisor_resources_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resources_suppressed = value_for_key long_of_yojson "resourcesSuppressed" _list path;
     resources_ignored = value_for_key long_of_yojson "resourcesIgnored" _list path;
     resources_flagged = value_for_key long_of_yojson "resourcesFlagged" _list path;
     resources_processed = value_for_key long_of_yojson "resourcesProcessed" _list path;
   }
    : trusted_advisor_resources_summary)

let string__of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson

let string_list_of_yojson tree path =
  list_of_yojson (nullable_of_yojson string__of_yojson) tree path

let trusted_advisor_resource_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata = value_for_key string_list_of_yojson "metadata" _list path;
     is_suppressed = option_of_yojson (value_for_key boolean__of_yojson "isSuppressed") _list path;
     resource_id = value_for_key string__of_yojson "resourceId" _list path;
     region = option_of_yojson (value_for_key string__of_yojson "region") _list path;
     status = value_for_key string__of_yojson "status" _list path;
   }
    : trusted_advisor_resource_detail)

let trusted_advisor_resource_detail_list_of_yojson tree path =
  list_of_yojson trusted_advisor_resource_detail_of_yojson tree path

let double_of_yojson = double_of_yojson

let trusted_advisor_cost_optimizing_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_percent_monthly_savings =
       value_for_key double_of_yojson "estimatedPercentMonthlySavings" _list path;
     estimated_monthly_savings = value_for_key double_of_yojson "estimatedMonthlySavings" _list path;
   }
    : trusted_advisor_cost_optimizing_summary)

let trusted_advisor_category_specific_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_optimizing =
       option_of_yojson
         (value_for_key trusted_advisor_cost_optimizing_summary_of_yojson "costOptimizing")
         _list path;
   }
    : trusted_advisor_category_specific_summary)

let trusted_advisor_check_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_specific_summary =
       value_for_key trusted_advisor_category_specific_summary_of_yojson "categorySpecificSummary"
         _list path;
     resources_summary =
       value_for_key trusted_advisor_resources_summary_of_yojson "resourcesSummary" _list path;
     has_flagged_resources =
       option_of_yojson (value_for_key boolean__of_yojson "hasFlaggedResources") _list path;
     status = value_for_key string__of_yojson "status" _list path;
     timestamp = value_for_key string__of_yojson "timestamp" _list path;
     check_id = value_for_key string__of_yojson "checkId" _list path;
   }
    : trusted_advisor_check_summary)

let trusted_advisor_check_summary_list_of_yojson tree path =
  list_of_yojson trusted_advisor_check_summary_of_yojson tree path

let trusted_advisor_check_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flagged_resources =
       value_for_key trusted_advisor_resource_detail_list_of_yojson "flaggedResources" _list path;
     category_specific_summary =
       value_for_key trusted_advisor_category_specific_summary_of_yojson "categorySpecificSummary"
         _list path;
     resources_summary =
       value_for_key trusted_advisor_resources_summary_of_yojson "resourcesSummary" _list path;
     status = value_for_key string__of_yojson "status" _list path;
     timestamp = value_for_key string__of_yojson "timestamp" _list path;
     check_id = value_for_key string__of_yojson "checkId" _list path;
   }
    : trusted_advisor_check_result)

let trusted_advisor_check_refresh_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     millis_until_next_refreshable =
       value_for_key long_of_yojson "millisUntilNextRefreshable" _list path;
     status = value_for_key string__of_yojson "status" _list path;
     check_id = value_for_key string__of_yojson "checkId" _list path;
   }
    : trusted_advisor_check_refresh_status)

let trusted_advisor_check_refresh_status_list_of_yojson tree path =
  list_of_yojson trusted_advisor_check_refresh_status_of_yojson tree path

let trusted_advisor_check_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metadata = value_for_key string_list_of_yojson "metadata" _list path;
     category = value_for_key string__of_yojson "category" _list path;
     description = value_for_key string__of_yojson "description" _list path;
     name = value_for_key string__of_yojson "name" _list path;
     id = value_for_key string__of_yojson "id" _list path;
   }
    : trusted_advisor_check_description)

let trusted_advisor_check_list_of_yojson tree path =
  list_of_yojson trusted_advisor_check_description_of_yojson tree path

let time_created_of_yojson = string_of_yojson
let availability_error_message_of_yojson = string_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key availability_error_message_of_yojson "message") _list path;
   }
    : throttling_exception)

let code_of_yojson = string_of_yojson
let language_of_yojson = string_of_yojson
let display_of_yojson = string_of_yojson

let supported_language_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     display = option_of_yojson (value_for_key display_of_yojson "display") _list path;
     language = option_of_yojson (value_for_key language_of_yojson "language") _list path;
     code = option_of_yojson (value_for_key code_of_yojson "code") _list path;
   }
    : supported_language)

let supported_languages_list_of_yojson tree path =
  list_of_yojson supported_language_of_yojson tree path

let start_time_of_yojson = string_of_yojson
let end_time_of_yojson = string_of_yojson

let supported_hour_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = option_of_yojson (value_for_key end_time_of_yojson "endTime") _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "startTime") _list path;
   }
    : supported_hour)

let supported_hours_list_of_yojson tree path = list_of_yojson supported_hour_of_yojson tree path
let submitted_by_of_yojson = string_of_yojson
let subject_of_yojson = string_of_yojson
let status_of_yojson = string_of_yojson
let severity_level_code_of_yojson = string_of_yojson
let severity_level_name_of_yojson = string_of_yojson

let severity_level_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key severity_level_name_of_yojson "name") _list path;
     code = option_of_yojson (value_for_key severity_level_code_of_yojson "code") _list path;
   }
    : severity_level)

let severity_levels_list_of_yojson tree path = list_of_yojson severity_level_of_yojson tree path
let severity_code_of_yojson = string_of_yojson
let service_name_of_yojson = string_of_yojson
let service_code_of_yojson = string_of_yojson
let category_code_of_yojson = string_of_yojson
let category_name_of_yojson = string_of_yojson

let category_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key category_name_of_yojson "name") _list path;
     code = option_of_yojson (value_for_key category_code_of_yojson "code") _list path;
   }
    : category)

let category_list_of_yojson tree path = list_of_yojson category_of_yojson tree path

let service_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     categories = option_of_yojson (value_for_key category_list_of_yojson "categories") _list path;
     name = option_of_yojson (value_for_key service_name_of_yojson "name") _list path;
     code = option_of_yojson (value_for_key service_code_of_yojson "code") _list path;
   }
    : service)

let service_list_of_yojson tree path = list_of_yojson service_of_yojson tree path
let service_code2_of_yojson = string_of_yojson
let service_code_list_of_yojson tree path = list_of_yojson service_code2_of_yojson tree path
let result__of_yojson = bool_of_yojson
let case_status_of_yojson = string_of_yojson

let resolve_case_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     final_case_status =
       option_of_yojson (value_for_key case_status_of_yojson "finalCaseStatus") _list path;
     initial_case_status =
       option_of_yojson (value_for_key case_status_of_yojson "initialCaseStatus") _list path;
   }
    : resolve_case_response)

let case_id_of_yojson = string_of_yojson

let resolve_case_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ case_id = option_of_yojson (value_for_key case_id_of_yojson "caseId") _list path }
    : resolve_case_request)

let error_message_of_yojson = string_of_yojson

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : internal_server_error)

let case_id_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : case_id_not_found)

let refresh_trusted_advisor_check_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key trusted_advisor_check_refresh_status_of_yojson "status" _list path }
    : refresh_trusted_advisor_check_response)

let refresh_trusted_advisor_check_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ check_id = value_for_key string__of_yojson "checkId" _list path }
    : refresh_trusted_advisor_check_request)

let attachment_id_of_yojson = string_of_yojson
let file_name_of_yojson = string_of_yojson

let attachment_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_name = option_of_yojson (value_for_key file_name_of_yojson "fileName") _list path;
     attachment_id =
       option_of_yojson (value_for_key attachment_id_of_yojson "attachmentId") _list path;
   }
    : attachment_details)

let attachment_set_of_yojson tree path = list_of_yojson attachment_details_of_yojson tree path

let communication_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_set =
       option_of_yojson (value_for_key attachment_set_of_yojson "attachmentSet") _list path;
     time_created = option_of_yojson (value_for_key time_created_of_yojson "timeCreated") _list path;
     submitted_by = option_of_yojson (value_for_key submitted_by_of_yojson "submittedBy") _list path;
     body =
       option_of_yojson (value_for_key validated_communication_body_of_yojson "body") _list path;
     case_id = option_of_yojson (value_for_key case_id_of_yojson "caseId") _list path;
   }
    : communication)

let communication_list_of_yojson tree path = list_of_yojson communication_of_yojson tree path
let next_token_of_yojson = string_of_yojson

let recent_case_communications_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     communications =
       option_of_yojson (value_for_key communication_list_of_yojson "communications") _list path;
   }
    : recent_case_communications)

let max_results_of_yojson = int_of_yojson
let issue_type_of_yojson = string_of_yojson
let include_resolved_cases_of_yojson = bool_of_yojson
let include_communications_of_yojson = bool_of_yojson
let expiry_time_of_yojson = string_of_yojson
let display_id_of_yojson = string_of_yojson

let describe_trusted_advisor_checks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ checks = value_for_key trusted_advisor_check_list_of_yojson "checks" _list path }
    : describe_trusted_advisor_checks_response)

let describe_trusted_advisor_checks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ language = value_for_key string__of_yojson "language" _list path }
    : describe_trusted_advisor_checks_request)

let describe_trusted_advisor_check_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ summaries = value_for_key trusted_advisor_check_summary_list_of_yojson "summaries" _list path }
    : describe_trusted_advisor_check_summaries_response)

let describe_trusted_advisor_check_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ check_ids = value_for_key string_list_of_yojson "checkIds" _list path }
    : describe_trusted_advisor_check_summaries_request)

let describe_trusted_advisor_check_result_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     result_ =
       option_of_yojson (value_for_key trusted_advisor_check_result_of_yojson "result") _list path;
   }
    : describe_trusted_advisor_check_result_response)

let describe_trusted_advisor_check_result_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language = option_of_yojson (value_for_key string__of_yojson "language") _list path;
     check_id = value_for_key string__of_yojson "checkId" _list path;
   }
    : describe_trusted_advisor_check_result_request)

let describe_trusted_advisor_check_refresh_statuses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     statuses =
       value_for_key trusted_advisor_check_refresh_status_list_of_yojson "statuses" _list path;
   }
    : describe_trusted_advisor_check_refresh_statuses_response)

let describe_trusted_advisor_check_refresh_statuses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ check_ids = value_for_key string_list_of_yojson "checkIds" _list path }
    : describe_trusted_advisor_check_refresh_statuses_request)

let describe_supported_languages_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_languages =
       option_of_yojson
         (value_for_key supported_languages_list_of_yojson "supportedLanguages")
         _list path;
   }
    : describe_supported_languages_response)

let describe_supported_languages_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_code = value_for_key validated_category_code_of_yojson "categoryCode" _list path;
     service_code = value_for_key validated_service_code_of_yojson "serviceCode" _list path;
     issue_type = value_for_key validated_issue_type_string_of_yojson "issueType" _list path;
   }
    : describe_supported_languages_request)

let describe_severity_levels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     severity_levels =
       option_of_yojson (value_for_key severity_levels_list_of_yojson "severityLevels") _list path;
   }
    : describe_severity_levels_response)

let describe_severity_levels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ language = option_of_yojson (value_for_key language_of_yojson "language") _list path }
    : describe_severity_levels_request)

let describe_services_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ services = option_of_yojson (value_for_key service_list_of_yojson "services") _list path }
    : describe_services_response)

let describe_services_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language = option_of_yojson (value_for_key language_of_yojson "language") _list path;
     service_code_list =
       option_of_yojson (value_for_key service_code_list_of_yojson "serviceCodeList") _list path;
   }
    : describe_services_request)

let date_interval_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date_time =
       option_of_yojson (value_for_key validated_date_time_of_yojson "endDateTime") _list path;
     start_date_time =
       option_of_yojson (value_for_key validated_date_time_of_yojson "startDateTime") _list path;
   }
    : date_interval)

let dates_without_support_list_of_yojson tree path =
  list_of_yojson date_interval_of_yojson tree path

let communication_type_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dates_without_support =
       option_of_yojson
         (value_for_key dates_without_support_list_of_yojson "datesWithoutSupport")
         _list path;
     supported_hours =
       option_of_yojson (value_for_key supported_hours_list_of_yojson "supportedHours") _list path;
     type_ = option_of_yojson (value_for_key type__of_yojson "type") _list path;
   }
    : communication_type_options)

let communication_type_options_list_of_yojson tree path =
  list_of_yojson communication_type_options_of_yojson tree path

let describe_create_case_options_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     communication_types =
       option_of_yojson
         (value_for_key communication_type_options_list_of_yojson "communicationTypes")
         _list path;
     language_availability =
       option_of_yojson
         (value_for_key validated_language_availability_of_yojson "languageAvailability")
         _list path;
   }
    : describe_create_case_options_response)

let describe_create_case_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     category_code = value_for_key category_code_of_yojson "categoryCode" _list path;
     language = value_for_key language_of_yojson "language" _list path;
     service_code = value_for_key service_code2_of_yojson "serviceCode" _list path;
     issue_type = value_for_key issue_type_of_yojson "issueType" _list path;
   }
    : describe_create_case_options_request)

let describe_communications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     communications =
       option_of_yojson (value_for_key communication_list_of_yojson "communications") _list path;
   }
    : describe_communications_response)

let before_time_of_yojson = string_of_yojson
let after_time_of_yojson = string_of_yojson

let describe_communications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     after_time = option_of_yojson (value_for_key after_time_of_yojson "afterTime") _list path;
     before_time = option_of_yojson (value_for_key before_time_of_yojson "beforeTime") _list path;
     case_id = value_for_key case_id_of_yojson "caseId" _list path;
   }
    : describe_communications_request)

let cc_email_address_of_yojson = string_of_yojson
let cc_email_address_list_of_yojson tree path = list_of_yojson cc_email_address_of_yojson tree path

let case_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     language = option_of_yojson (value_for_key language_of_yojson "language") _list path;
     cc_email_addresses =
       option_of_yojson
         (value_for_key cc_email_address_list_of_yojson "ccEmailAddresses")
         _list path;
     recent_communications =
       option_of_yojson
         (value_for_key recent_case_communications_of_yojson "recentCommunications")
         _list path;
     time_created = option_of_yojson (value_for_key time_created_of_yojson "timeCreated") _list path;
     submitted_by = option_of_yojson (value_for_key submitted_by_of_yojson "submittedBy") _list path;
     severity_code =
       option_of_yojson (value_for_key severity_code_of_yojson "severityCode") _list path;
     category_code =
       option_of_yojson (value_for_key category_code_of_yojson "categoryCode") _list path;
     service_code = option_of_yojson (value_for_key service_code_of_yojson "serviceCode") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     subject = option_of_yojson (value_for_key subject_of_yojson "subject") _list path;
     display_id = option_of_yojson (value_for_key display_id_of_yojson "displayId") _list path;
     case_id = option_of_yojson (value_for_key case_id_of_yojson "caseId") _list path;
   }
    : case_details)

let case_list_of_yojson tree path = list_of_yojson case_details_of_yojson tree path

let describe_cases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     cases = option_of_yojson (value_for_key case_list_of_yojson "cases") _list path;
   }
    : describe_cases_response)

let case_id_list_of_yojson tree path = list_of_yojson case_id_of_yojson tree path

let describe_cases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_communications =
       option_of_yojson
         (value_for_key include_communications_of_yojson "includeCommunications")
         _list path;
     language = option_of_yojson (value_for_key language_of_yojson "language") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     include_resolved_cases =
       option_of_yojson
         (value_for_key include_resolved_cases_of_yojson "includeResolvedCases")
         _list path;
     before_time = option_of_yojson (value_for_key before_time_of_yojson "beforeTime") _list path;
     after_time = option_of_yojson (value_for_key after_time_of_yojson "afterTime") _list path;
     display_id = option_of_yojson (value_for_key display_id_of_yojson "displayId") _list path;
     case_id_list = option_of_yojson (value_for_key case_id_list_of_yojson "caseIdList") _list path;
   }
    : describe_cases_request)

let data_of_yojson = blob_of_yojson

let attachment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data = option_of_yojson (value_for_key data_of_yojson "data") _list path;
     file_name = option_of_yojson (value_for_key file_name_of_yojson "fileName") _list path;
   }
    : attachment)

let describe_attachment_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attachment = option_of_yojson (value_for_key attachment_of_yojson "attachment") _list path }
    : describe_attachment_response)

let describe_attachment_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ attachment_id = value_for_key attachment_id_of_yojson "attachmentId" _list path }
    : describe_attachment_request)

let describe_attachment_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : describe_attachment_limit_exceeded)

let attachment_id_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : attachment_id_not_found)

let create_case_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ case_id = option_of_yojson (value_for_key case_id_of_yojson "caseId") _list path }
    : create_case_response)

let communication_body_of_yojson = string_of_yojson
let attachment_set_id_of_yojson = string_of_yojson

let create_case_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_set_id =
       option_of_yojson (value_for_key attachment_set_id_of_yojson "attachmentSetId") _list path;
     issue_type = option_of_yojson (value_for_key issue_type_of_yojson "issueType") _list path;
     language = option_of_yojson (value_for_key language_of_yojson "language") _list path;
     cc_email_addresses =
       option_of_yojson
         (value_for_key cc_email_address_list_of_yojson "ccEmailAddresses")
         _list path;
     communication_body = value_for_key communication_body_of_yojson "communicationBody" _list path;
     category_code =
       option_of_yojson (value_for_key category_code_of_yojson "categoryCode") _list path;
     severity_code =
       option_of_yojson (value_for_key severity_code_of_yojson "severityCode") _list path;
     service_code =
       option_of_yojson (value_for_key service_code2_of_yojson "serviceCode") _list path;
     subject = value_for_key subject_of_yojson "subject" _list path;
   }
    : create_case_request)

let case_creation_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : case_creation_limit_exceeded)

let attachment_set_id_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : attachment_set_id_not_found)

let attachment_set_expired_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : attachment_set_expired)

let attachments_of_yojson tree path = list_of_yojson attachment_of_yojson tree path

let attachment_set_size_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : attachment_set_size_limit_exceeded)

let attachment_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : attachment_limit_exceeded)

let add_communication_to_case_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ result_ = option_of_yojson (value_for_key result__of_yojson "result") _list path }
    : add_communication_to_case_response)

let add_communication_to_case_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachment_set_id =
       option_of_yojson (value_for_key attachment_set_id_of_yojson "attachmentSetId") _list path;
     cc_email_addresses =
       option_of_yojson
         (value_for_key cc_email_address_list_of_yojson "ccEmailAddresses")
         _list path;
     communication_body = value_for_key communication_body_of_yojson "communicationBody" _list path;
     case_id = option_of_yojson (value_for_key case_id_of_yojson "caseId") _list path;
   }
    : add_communication_to_case_request)

let add_attachments_to_set_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expiry_time = option_of_yojson (value_for_key expiry_time_of_yojson "expiryTime") _list path;
     attachment_set_id =
       option_of_yojson (value_for_key attachment_set_id_of_yojson "attachmentSetId") _list path;
   }
    : add_attachments_to_set_response)

let add_attachments_to_set_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attachments = value_for_key attachments_of_yojson "attachments" _list path;
     attachment_set_id =
       option_of_yojson (value_for_key attachment_set_id_of_yojson "attachmentSetId") _list path;
   }
    : add_attachments_to_set_request)
