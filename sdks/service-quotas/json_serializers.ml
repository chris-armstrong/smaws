open Smaws_Lib.Json.SerializeHelpers
open Types

let utilization_pct_to_yojson = double_to_yojson
let update_auto_management_response_to_yojson = unit_to_yojson

let opt_in_type_to_yojson (x : opt_in_type) =
  match x with NotifyAndAdjust -> `String "NotifyAndAdjust" | NotifyOnly -> `String "NotifyOnly"

let amazon_resource_name_to_yojson = string_to_yojson
let excluded_limit_to_yojson = string_to_yojson
let excluded_quota_list_to_yojson tree = list_to_yojson excluded_limit_to_yojson tree
let excluded_service_to_yojson = string_to_yojson

let exclusion_list_to_yojson tree =
  map_to_yojson excluded_service_to_yojson excluded_quota_list_to_yojson tree

let update_auto_management_request_to_yojson (x : update_auto_management_request) =
  assoc_to_yojson
    [
      ("ExclusionList", option_to_yojson exclusion_list_to_yojson x.exclusion_list);
      ("NotificationArn", option_to_yojson amazon_resource_name_to_yojson x.notification_arn);
      ("OptInType", option_to_yojson opt_in_type_to_yojson x.opt_in_type);
    ]

let exception_message_to_yojson = string_to_yojson

let too_many_requests_exception_to_yojson (x : too_many_requests_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let service_exception_to_yojson (x : service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let no_such_resource_exception_to_yojson (x : no_such_resource_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let illegal_argument_exception_to_yojson (x : illegal_argument_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let input_tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (input_tag_keys_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let total_count_to_yojson = int_to_yojson

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let templates_not_available_in_region_exception_to_yojson
    (x : templates_not_available_in_region_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let input_tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (input_tags_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let tag_policy_violation_exception_to_yojson (x : tag_policy_violation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let support_case_allowed_to_yojson = bool_to_yojson
let stop_auto_management_response_to_yojson = unit_to_yojson
let stop_auto_management_request_to_yojson = unit_to_yojson
let statistic_to_yojson = string_to_yojson
let report_id_to_yojson = string_to_yojson

let report_status_to_yojson (x : report_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | PENDING -> `String "PENDING"

let report_message_to_yojson = string_to_yojson

let start_quota_utilization_report_response_to_yojson (x : start_quota_utilization_report_response)
    =
  assoc_to_yojson
    [
      ("Message", option_to_yojson report_message_to_yojson x.message);
      ("Status", option_to_yojson report_status_to_yojson x.status);
      ("ReportId", option_to_yojson report_id_to_yojson x.report_id);
    ]

let start_quota_utilization_report_request_to_yojson = unit_to_yojson

let invalid_pagination_token_exception_to_yojson (x : invalid_pagination_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let start_auto_management_response_to_yojson = unit_to_yojson
let opt_in_level_to_yojson (x : opt_in_level) = match x with ACCOUNT -> `String "ACCOUNT"

let start_auto_management_request_to_yojson (x : start_auto_management_request) =
  assoc_to_yojson
    [
      ("ExclusionList", option_to_yojson exclusion_list_to_yojson x.exclusion_list);
      ("NotificationArn", option_to_yojson amazon_resource_name_to_yojson x.notification_arn);
      ("OptInType", Some (opt_in_type_to_yojson x.opt_in_type));
      ("OptInLevel", Some (opt_in_level_to_yojson x.opt_in_level));
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let quota_exceeded_exception_to_yojson (x : quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_resource_state_exception_to_yojson (x : invalid_resource_state_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let dependency_access_denied_exception_to_yojson (x : dependency_access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let request_id_to_yojson = string_to_yojson

let request_type_to_yojson (x : request_type) =
  match x with AutomaticManagement -> `String "AutomaticManagement"

let customer_service_engagement_id_to_yojson = string_to_yojson
let service_code_to_yojson = string_to_yojson
let service_name_to_yojson = string_to_yojson
let quota_code_to_yojson = string_to_yojson
let quota_name_to_yojson = string_to_yojson
let quota_value_to_yojson = double_to_yojson

let request_status_to_yojson (x : request_status) =
  match x with
  | INVALID_REQUEST -> `String "INVALID_REQUEST"
  | NOT_APPROVED -> `String "NOT_APPROVED"
  | CASE_CLOSED -> `String "CASE_CLOSED"
  | DENIED -> `String "DENIED"
  | APPROVED -> `String "APPROVED"
  | CASE_OPENED -> `String "CASE_OPENED"
  | PENDING -> `String "PENDING"

let date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let requester_to_yojson = string_to_yojson
let quota_arn_to_yojson = string_to_yojson
let global_quota_to_yojson = bool_to_yojson
let quota_unit_to_yojson = string_to_yojson

let applied_level_enum_to_yojson (x : applied_level_enum) =
  match x with
  | ALL -> `String "ALL"
  | RESOURCE -> `String "RESOURCE"
  | ACCOUNT -> `String "ACCOUNT"

let quota_context_scope_to_yojson (x : quota_context_scope) =
  match x with ACCOUNT -> `String "ACCOUNT" | RESOURCE -> `String "RESOURCE"

let quota_context_scope_type_to_yojson = string_to_yojson
let quota_context_id_to_yojson = string_to_yojson

let quota_context_info_to_yojson (x : quota_context_info) =
  assoc_to_yojson
    [
      ("ContextId", option_to_yojson quota_context_id_to_yojson x.context_id);
      ("ContextScopeType", option_to_yojson quota_context_scope_type_to_yojson x.context_scope_type);
      ("ContextScope", option_to_yojson quota_context_scope_to_yojson x.context_scope);
    ]

let requested_service_quota_change_to_yojson (x : requested_service_quota_change) =
  assoc_to_yojson
    [
      ("QuotaContext", option_to_yojson quota_context_info_to_yojson x.quota_context);
      ( "QuotaRequestedAtLevel",
        option_to_yojson applied_level_enum_to_yojson x.quota_requested_at_level );
      ("Unit", option_to_yojson quota_unit_to_yojson x.unit_);
      ("GlobalQuota", option_to_yojson global_quota_to_yojson x.global_quota);
      ("QuotaArn", option_to_yojson quota_arn_to_yojson x.quota_arn);
      ("Requester", option_to_yojson requester_to_yojson x.requester);
      ("LastUpdated", option_to_yojson date_time_to_yojson x.last_updated);
      ("Created", option_to_yojson date_time_to_yojson x.created);
      ("Status", option_to_yojson request_status_to_yojson x.status);
      ("DesiredValue", option_to_yojson quota_value_to_yojson x.desired_value);
      ("QuotaName", option_to_yojson quota_name_to_yojson x.quota_name);
      ("QuotaCode", option_to_yojson quota_code_to_yojson x.quota_code);
      ("ServiceName", option_to_yojson service_name_to_yojson x.service_name);
      ("ServiceCode", option_to_yojson service_code_to_yojson x.service_code);
      ("CaseId", option_to_yojson customer_service_engagement_id_to_yojson x.case_id);
      ("RequestType", option_to_yojson request_type_to_yojson x.request_type);
      ("Id", option_to_yojson request_id_to_yojson x.id);
    ]

let request_service_quota_increase_response_to_yojson (x : request_service_quota_increase_response)
    =
  assoc_to_yojson
    [
      ("RequestedQuota", option_to_yojson requested_service_quota_change_to_yojson x.requested_quota);
    ]

let request_service_quota_increase_request_to_yojson (x : request_service_quota_increase_request) =
  assoc_to_yojson
    [
      ("SupportCaseAllowed", option_to_yojson support_case_allowed_to_yojson x.support_case_allowed);
      ("ContextId", option_to_yojson quota_context_id_to_yojson x.context_id);
      ("DesiredValue", Some (quota_value_to_yojson x.desired_value));
      ("QuotaCode", Some (quota_code_to_yojson x.quota_code));
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

let no_available_organization_exception_to_yojson (x : no_available_organization_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let aws_service_access_not_enabled_exception_to_yojson
    (x : aws_service_access_not_enabled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let aws_region_to_yojson = string_to_yojson

let service_quota_increase_request_in_template_to_yojson
    (x : service_quota_increase_request_in_template) =
  assoc_to_yojson
    [
      ("GlobalQuota", option_to_yojson global_quota_to_yojson x.global_quota);
      ("Unit", option_to_yojson quota_unit_to_yojson x.unit_);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
      ("DesiredValue", option_to_yojson quota_value_to_yojson x.desired_value);
      ("QuotaName", option_to_yojson quota_name_to_yojson x.quota_name);
      ("QuotaCode", option_to_yojson quota_code_to_yojson x.quota_code);
      ("ServiceName", option_to_yojson service_name_to_yojson x.service_name);
      ("ServiceCode", option_to_yojson service_code_to_yojson x.service_code);
    ]

let put_service_quota_increase_request_into_template_response_to_yojson
    (x : put_service_quota_increase_request_into_template_response) =
  assoc_to_yojson
    [
      ( "ServiceQuotaIncreaseRequestInTemplate",
        option_to_yojson service_quota_increase_request_in_template_to_yojson
          x.service_quota_increase_request_in_template );
    ]

let put_service_quota_increase_request_into_template_request_to_yojson
    (x : put_service_quota_increase_request_into_template_request) =
  assoc_to_yojson
    [
      ("DesiredValue", Some (quota_value_to_yojson x.desired_value));
      ("AwsRegion", Some (aws_region_to_yojson x.aws_region));
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
      ("QuotaCode", Some (quota_code_to_yojson x.quota_code));
    ]

let output_tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson output_tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let next_token_to_yojson = string_to_yojson

let service_info_to_yojson (x : service_info) =
  assoc_to_yojson
    [
      ("ServiceName", option_to_yojson service_name_to_yojson x.service_name);
      ("ServiceCode", option_to_yojson service_code_to_yojson x.service_code);
    ]

let service_info_list_definition_to_yojson tree = list_to_yojson service_info_to_yojson tree

let list_services_response_to_yojson (x : list_services_response) =
  assoc_to_yojson
    [
      ("Services", option_to_yojson service_info_list_definition_to_yojson x.services);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_services_request_to_yojson (x : list_services_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let quota_adjustable_to_yojson = bool_to_yojson
let quota_metric_namespace_to_yojson = string_to_yojson
let quota_metric_name_to_yojson = string_to_yojson
let metric_dimension_value_to_yojson = string_to_yojson
let metric_dimension_name_to_yojson = string_to_yojson

let metric_dimensions_map_definition_to_yojson tree =
  map_to_yojson metric_dimension_name_to_yojson metric_dimension_value_to_yojson tree

let metric_info_to_yojson (x : metric_info) =
  assoc_to_yojson
    [
      ( "MetricStatisticRecommendation",
        option_to_yojson statistic_to_yojson x.metric_statistic_recommendation );
      ( "MetricDimensions",
        option_to_yojson metric_dimensions_map_definition_to_yojson x.metric_dimensions );
      ("MetricName", option_to_yojson quota_metric_name_to_yojson x.metric_name);
      ("MetricNamespace", option_to_yojson quota_metric_namespace_to_yojson x.metric_namespace);
    ]

let period_value_to_yojson = int_to_yojson

let period_unit_to_yojson (x : period_unit) =
  match x with
  | WEEK -> `String "WEEK"
  | DAY -> `String "DAY"
  | HOUR -> `String "HOUR"
  | MINUTE -> `String "MINUTE"
  | SECOND -> `String "SECOND"
  | MILLISECOND -> `String "MILLISECOND"
  | MICROSECOND -> `String "MICROSECOND"

let quota_period_to_yojson (x : quota_period) =
  assoc_to_yojson
    [
      ("PeriodUnit", option_to_yojson period_unit_to_yojson x.period_unit);
      ("PeriodValue", option_to_yojson period_value_to_yojson x.period_value);
    ]

let error_code_to_yojson (x : error_code) =
  match x with
  | SERVICE_QUOTA_NOT_AVAILABLE_ERROR -> `String "SERVICE_QUOTA_NOT_AVAILABLE_ERROR"
  | DEPENDENCY_SERVICE_ERROR -> `String "DEPENDENCY_SERVICE_ERROR"
  | DEPENDENCY_THROTTLING_ERROR -> `String "DEPENDENCY_THROTTLING_ERROR"
  | DEPENDENCY_ACCESS_DENIED_ERROR -> `String "DEPENDENCY_ACCESS_DENIED_ERROR"

let error_message_to_yojson = string_to_yojson

let error_reason_to_yojson (x : error_reason) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let quota_description_to_yojson = string_to_yojson

let service_quota_to_yojson (x : service_quota) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson quota_description_to_yojson x.description);
      ("QuotaContext", option_to_yojson quota_context_info_to_yojson x.quota_context);
      ("QuotaAppliedAtLevel", option_to_yojson applied_level_enum_to_yojson x.quota_applied_at_level);
      ("ErrorReason", option_to_yojson error_reason_to_yojson x.error_reason);
      ("Period", option_to_yojson quota_period_to_yojson x.period);
      ("UsageMetric", option_to_yojson metric_info_to_yojson x.usage_metric);
      ("GlobalQuota", option_to_yojson global_quota_to_yojson x.global_quota);
      ("Adjustable", option_to_yojson quota_adjustable_to_yojson x.adjustable);
      ("Unit", option_to_yojson quota_unit_to_yojson x.unit_);
      ("Value", option_to_yojson quota_value_to_yojson x.value);
      ("QuotaName", option_to_yojson quota_name_to_yojson x.quota_name);
      ("QuotaCode", option_to_yojson quota_code_to_yojson x.quota_code);
      ("QuotaArn", option_to_yojson quota_arn_to_yojson x.quota_arn);
      ("ServiceName", option_to_yojson service_name_to_yojson x.service_name);
      ("ServiceCode", option_to_yojson service_code_to_yojson x.service_code);
    ]

let service_quota_list_definition_to_yojson tree = list_to_yojson service_quota_to_yojson tree

let list_service_quotas_response_to_yojson (x : list_service_quotas_response) =
  assoc_to_yojson
    [
      ("Quotas", option_to_yojson service_quota_list_definition_to_yojson x.quotas);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_service_quotas_request_to_yojson (x : list_service_quotas_request) =
  assoc_to_yojson
    [
      ("QuotaAppliedAtLevel", option_to_yojson applied_level_enum_to_yojson x.quota_applied_at_level);
      ("QuotaCode", option_to_yojson quota_code_to_yojson x.quota_code);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

let service_quota_increase_request_in_template_list_to_yojson tree =
  list_to_yojson service_quota_increase_request_in_template_to_yojson tree

let list_service_quota_increase_requests_in_template_response_to_yojson
    (x : list_service_quota_increase_requests_in_template_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ServiceQuotaIncreaseRequestInTemplateList",
        option_to_yojson service_quota_increase_request_in_template_list_to_yojson
          x.service_quota_increase_request_in_template_list );
    ]

let list_service_quota_increase_requests_in_template_request_to_yojson
    (x : list_service_quota_increase_requests_in_template_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AwsRegion", option_to_yojson aws_region_to_yojson x.aws_region);
      ("ServiceCode", option_to_yojson service_code_to_yojson x.service_code);
    ]

let requested_service_quota_change_history_list_definition_to_yojson tree =
  list_to_yojson requested_service_quota_change_to_yojson tree

let list_requested_service_quota_change_history_by_quota_response_to_yojson
    (x : list_requested_service_quota_change_history_by_quota_response) =
  assoc_to_yojson
    [
      ( "RequestedQuotas",
        option_to_yojson requested_service_quota_change_history_list_definition_to_yojson
          x.requested_quotas );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_requested_service_quota_change_history_by_quota_request_to_yojson
    (x : list_requested_service_quota_change_history_by_quota_request) =
  assoc_to_yojson
    [
      ( "QuotaRequestedAtLevel",
        option_to_yojson applied_level_enum_to_yojson x.quota_requested_at_level );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Status", option_to_yojson request_status_to_yojson x.status);
      ("QuotaCode", Some (quota_code_to_yojson x.quota_code));
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

let list_requested_service_quota_change_history_response_to_yojson
    (x : list_requested_service_quota_change_history_response) =
  assoc_to_yojson
    [
      ( "RequestedQuotas",
        option_to_yojson requested_service_quota_change_history_list_definition_to_yojson
          x.requested_quotas );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_requested_service_quota_change_history_request_to_yojson
    (x : list_requested_service_quota_change_history_request) =
  assoc_to_yojson
    [
      ( "QuotaRequestedAtLevel",
        option_to_yojson applied_level_enum_to_yojson x.quota_requested_at_level );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Status", option_to_yojson request_status_to_yojson x.status);
      ("ServiceCode", option_to_yojson service_code_to_yojson x.service_code);
    ]

let list_aws_default_service_quotas_response_to_yojson
    (x : list_aws_default_service_quotas_response) =
  assoc_to_yojson
    [
      ("Quotas", option_to_yojson service_quota_list_definition_to_yojson x.quotas);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_aws_default_service_quotas_request_to_yojson (x : list_aws_default_service_quotas_request)
    =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

let get_service_quota_increase_request_from_template_response_to_yojson
    (x : get_service_quota_increase_request_from_template_response) =
  assoc_to_yojson
    [
      ( "ServiceQuotaIncreaseRequestInTemplate",
        option_to_yojson service_quota_increase_request_in_template_to_yojson
          x.service_quota_increase_request_in_template );
    ]

let get_service_quota_increase_request_from_template_request_to_yojson
    (x : get_service_quota_increase_request_from_template_request) =
  assoc_to_yojson
    [
      ("AwsRegion", Some (aws_region_to_yojson x.aws_region));
      ("QuotaCode", Some (quota_code_to_yojson x.quota_code));
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

let get_service_quota_response_to_yojson (x : get_service_quota_response) =
  assoc_to_yojson [ ("Quota", option_to_yojson service_quota_to_yojson x.quota) ]

let get_service_quota_request_to_yojson (x : get_service_quota_request) =
  assoc_to_yojson
    [
      ("ContextId", option_to_yojson quota_context_id_to_yojson x.context_id);
      ("QuotaCode", Some (quota_code_to_yojson x.quota_code));
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

let get_requested_service_quota_change_response_to_yojson
    (x : get_requested_service_quota_change_response) =
  assoc_to_yojson
    [
      ("RequestedQuota", option_to_yojson requested_service_quota_change_to_yojson x.requested_quota);
    ]

let get_requested_service_quota_change_request_to_yojson
    (x : get_requested_service_quota_change_request) =
  assoc_to_yojson [ ("RequestId", Some (request_id_to_yojson x.request_id)) ]

let default_value_to_yojson = double_to_yojson
let applied_value_to_yojson = double_to_yojson

let quota_utilization_info_to_yojson (x : quota_utilization_info) =
  assoc_to_yojson
    [
      ("Adjustable", option_to_yojson quota_adjustable_to_yojson x.adjustable);
      ("ServiceName", option_to_yojson service_name_to_yojson x.service_name);
      ("AppliedValue", option_to_yojson applied_value_to_yojson x.applied_value);
      ("DefaultValue", option_to_yojson default_value_to_yojson x.default_value);
      ("Utilization", option_to_yojson utilization_pct_to_yojson x.utilization);
      ("Namespace", option_to_yojson quota_metric_namespace_to_yojson x.namespace);
      ("QuotaName", option_to_yojson quota_name_to_yojson x.quota_name);
      ("ServiceCode", option_to_yojson service_code_to_yojson x.service_code);
      ("QuotaCode", option_to_yojson quota_code_to_yojson x.quota_code);
    ]

let quota_utilization_info_list_to_yojson tree =
  list_to_yojson quota_utilization_info_to_yojson tree

let report_error_code_to_yojson = string_to_yojson
let report_error_message_to_yojson = string_to_yojson

let get_quota_utilization_report_response_to_yojson (x : get_quota_utilization_report_response) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson report_error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson report_error_code_to_yojson x.error_code);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Quotas", option_to_yojson quota_utilization_info_list_to_yojson x.quotas);
      ("TotalCount", option_to_yojson total_count_to_yojson x.total_count);
      ("GeneratedAt", option_to_yojson date_time_to_yojson x.generated_at);
      ("Status", option_to_yojson report_status_to_yojson x.status);
      ("ReportId", option_to_yojson report_id_to_yojson x.report_id);
    ]

let max_results_utilization_to_yojson = int_to_yojson

let get_quota_utilization_report_request_to_yojson (x : get_quota_utilization_report_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_utilization_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ReportId", Some (report_id_to_yojson x.report_id));
    ]

let get_aws_default_service_quota_response_to_yojson (x : get_aws_default_service_quota_response) =
  assoc_to_yojson [ ("Quota", option_to_yojson service_quota_to_yojson x.quota) ]

let get_aws_default_service_quota_request_to_yojson (x : get_aws_default_service_quota_request) =
  assoc_to_yojson
    [
      ("QuotaCode", Some (quota_code_to_yojson x.quota_code));
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

let opt_in_status_to_yojson (x : opt_in_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let quota_info_to_yojson (x : quota_info) =
  assoc_to_yojson
    [
      ("QuotaName", option_to_yojson quota_name_to_yojson x.quota_name);
      ("QuotaCode", option_to_yojson quota_code_to_yojson x.quota_code);
    ]

let quota_info_list_to_yojson tree = list_to_yojson quota_info_to_yojson tree

let exclusion_quota_list_to_yojson tree =
  map_to_yojson excluded_service_to_yojson quota_info_list_to_yojson tree

let get_auto_management_configuration_response_to_yojson
    (x : get_auto_management_configuration_response) =
  assoc_to_yojson
    [
      ("ExclusionList", option_to_yojson exclusion_quota_list_to_yojson x.exclusion_list);
      ("OptInStatus", option_to_yojson opt_in_status_to_yojson x.opt_in_status);
      ("NotificationArn", option_to_yojson amazon_resource_name_to_yojson x.notification_arn);
      ("OptInType", option_to_yojson opt_in_type_to_yojson x.opt_in_type);
      ("OptInLevel", option_to_yojson opt_in_level_to_yojson x.opt_in_level);
    ]

let get_auto_management_configuration_request_to_yojson = unit_to_yojson

let service_quota_template_not_in_use_exception_to_yojson
    (x : service_quota_template_not_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let service_quota_template_association_status_to_yojson
    (x : service_quota_template_association_status) =
  match x with DISASSOCIATED -> `String "DISASSOCIATED" | ASSOCIATED -> `String "ASSOCIATED"

let get_association_for_service_quota_template_response_to_yojson
    (x : get_association_for_service_quota_template_response) =
  assoc_to_yojson
    [
      ( "ServiceQuotaTemplateAssociationStatus",
        option_to_yojson service_quota_template_association_status_to_yojson
          x.service_quota_template_association_status );
    ]

let get_association_for_service_quota_template_request_to_yojson = unit_to_yojson
let disassociate_service_quota_template_response_to_yojson = unit_to_yojson
let disassociate_service_quota_template_request_to_yojson = unit_to_yojson
let delete_service_quota_increase_request_from_template_response_to_yojson = unit_to_yojson

let delete_service_quota_increase_request_from_template_request_to_yojson
    (x : delete_service_quota_increase_request_from_template_request) =
  assoc_to_yojson
    [
      ("AwsRegion", Some (aws_region_to_yojson x.aws_region));
      ("QuotaCode", Some (quota_code_to_yojson x.quota_code));
      ("ServiceCode", Some (service_code_to_yojson x.service_code));
    ]

let create_support_case_response_to_yojson = unit_to_yojson

let create_support_case_request_to_yojson (x : create_support_case_request) =
  assoc_to_yojson [ ("RequestId", Some (request_id_to_yojson x.request_id)) ]

let organization_not_in_all_features_mode_exception_to_yojson
    (x : organization_not_in_all_features_mode_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let associate_service_quota_template_response_to_yojson = unit_to_yojson
let associate_service_quota_template_request_to_yojson = unit_to_yojson
