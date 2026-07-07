open Smaws_Lib.Json.DeserializeHelpers
open Types

let utilization_pct_of_yojson = double_of_yojson

let update_auto_management_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let opt_in_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NotifyAndAdjust" -> NotifyAndAdjust
    | `String "NotifyOnly" -> NotifyOnly
    | `String value -> raise (deserialize_unknown_enum_value_error path "OptInType" value)
    | _ -> raise (deserialize_wrong_type_error path "OptInType")
     : opt_in_type)
    : opt_in_type)

let amazon_resource_name_of_yojson = string_of_yojson
let excluded_limit_of_yojson = string_of_yojson
let excluded_quota_list_of_yojson tree path = list_of_yojson excluded_limit_of_yojson tree path
let excluded_service_of_yojson = string_of_yojson

let exclusion_list_of_yojson tree path =
  map_of_yojson excluded_service_of_yojson excluded_quota_list_of_yojson tree path

let update_auto_management_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclusion_list =
       option_of_yojson (value_for_key exclusion_list_of_yojson "ExclusionList") _list path;
     notification_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "NotificationArn") _list path;
     opt_in_type = option_of_yojson (value_for_key opt_in_type_of_yojson "OptInType") _list path;
   }
    : update_auto_management_request)

let exception_message_of_yojson = string_of_yojson

let too_many_requests_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : too_many_requests_exception)

let service_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : service_exception)

let no_such_resource_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : no_such_resource_exception)

let illegal_argument_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : illegal_argument_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : access_denied_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let input_tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key input_tag_keys_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let total_count_of_yojson = int_of_yojson

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : too_many_tags_exception)

let templates_not_available_in_region_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : templates_not_available_in_region_exception)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let input_tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key input_tags_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let tag_policy_violation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : tag_policy_violation_exception)

let support_case_allowed_of_yojson = bool_of_yojson

let stop_auto_management_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_auto_management_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let statistic_of_yojson = string_of_yojson
let report_id_of_yojson = string_of_yojson

let report_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportStatus")
     : report_status)
    : report_status)

let report_message_of_yojson = string_of_yojson

let start_quota_utilization_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key report_message_of_yojson "Message") _list path;
     status = option_of_yojson (value_for_key report_status_of_yojson "Status") _list path;
     report_id = option_of_yojson (value_for_key report_id_of_yojson "ReportId") _list path;
   }
    : start_quota_utilization_report_response)

let start_quota_utilization_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let invalid_pagination_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : invalid_pagination_token_exception)

let start_auto_management_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let opt_in_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "OptInLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "OptInLevel")
     : opt_in_level)
    : opt_in_level)

let start_auto_management_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclusion_list =
       option_of_yojson (value_for_key exclusion_list_of_yojson "ExclusionList") _list path;
     notification_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "NotificationArn") _list path;
     opt_in_type = value_for_key opt_in_type_of_yojson "OptInType" _list path;
     opt_in_level = value_for_key opt_in_level_of_yojson "OptInLevel" _list path;
   }
    : start_auto_management_request)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : resource_already_exists_exception)

let quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : quota_exceeded_exception)

let invalid_resource_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : invalid_resource_state_exception)

let dependency_access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : dependency_access_denied_exception)

let request_id_of_yojson = string_of_yojson

let request_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AutomaticManagement" -> AutomaticManagement
    | `String value -> raise (deserialize_unknown_enum_value_error path "RequestType" value)
    | _ -> raise (deserialize_wrong_type_error path "RequestType")
     : request_type)
    : request_type)

let customer_service_engagement_id_of_yojson = string_of_yojson
let service_code_of_yojson = string_of_yojson
let service_name_of_yojson = string_of_yojson
let quota_code_of_yojson = string_of_yojson
let quota_name_of_yojson = string_of_yojson
let quota_value_of_yojson = double_of_yojson

let request_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_REQUEST" -> INVALID_REQUEST
    | `String "NOT_APPROVED" -> NOT_APPROVED
    | `String "CASE_CLOSED" -> CASE_CLOSED
    | `String "DENIED" -> DENIED
    | `String "APPROVED" -> APPROVED
    | `String "CASE_OPENED" -> CASE_OPENED
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "RequestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RequestStatus")
     : request_status)
    : request_status)

let date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let requester_of_yojson = string_of_yojson
let quota_arn_of_yojson = string_of_yojson
let global_quota_of_yojson = bool_of_yojson
let quota_unit_of_yojson = string_of_yojson

let applied_level_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "RESOURCE" -> RESOURCE
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "AppliedLevelEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "AppliedLevelEnum")
     : applied_level_enum)
    : applied_level_enum)

let quota_context_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "RESOURCE" -> RESOURCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "QuotaContextScope" value)
    | _ -> raise (deserialize_wrong_type_error path "QuotaContextScope")
     : quota_context_scope)
    : quota_context_scope)

let quota_context_scope_type_of_yojson = string_of_yojson
let quota_context_id_of_yojson = string_of_yojson

let quota_context_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_id = option_of_yojson (value_for_key quota_context_id_of_yojson "ContextId") _list path;
     context_scope_type =
       option_of_yojson
         (value_for_key quota_context_scope_type_of_yojson "ContextScopeType")
         _list path;
     context_scope =
       option_of_yojson (value_for_key quota_context_scope_of_yojson "ContextScope") _list path;
   }
    : quota_context_info)

let requested_service_quota_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_context =
       option_of_yojson (value_for_key quota_context_info_of_yojson "QuotaContext") _list path;
     quota_requested_at_level =
       option_of_yojson
         (value_for_key applied_level_enum_of_yojson "QuotaRequestedAtLevel")
         _list path;
     unit_ = option_of_yojson (value_for_key quota_unit_of_yojson "Unit") _list path;
     global_quota = option_of_yojson (value_for_key global_quota_of_yojson "GlobalQuota") _list path;
     quota_arn = option_of_yojson (value_for_key quota_arn_of_yojson "QuotaArn") _list path;
     requester = option_of_yojson (value_for_key requester_of_yojson "Requester") _list path;
     last_updated = option_of_yojson (value_for_key date_time_of_yojson "LastUpdated") _list path;
     created = option_of_yojson (value_for_key date_time_of_yojson "Created") _list path;
     status = option_of_yojson (value_for_key request_status_of_yojson "Status") _list path;
     desired_value =
       option_of_yojson (value_for_key quota_value_of_yojson "DesiredValue") _list path;
     quota_name = option_of_yojson (value_for_key quota_name_of_yojson "QuotaName") _list path;
     quota_code = option_of_yojson (value_for_key quota_code_of_yojson "QuotaCode") _list path;
     service_name = option_of_yojson (value_for_key service_name_of_yojson "ServiceName") _list path;
     service_code = option_of_yojson (value_for_key service_code_of_yojson "ServiceCode") _list path;
     case_id =
       option_of_yojson (value_for_key customer_service_engagement_id_of_yojson "CaseId") _list path;
     request_type = option_of_yojson (value_for_key request_type_of_yojson "RequestType") _list path;
     id = option_of_yojson (value_for_key request_id_of_yojson "Id") _list path;
   }
    : requested_service_quota_change)

let request_service_quota_increase_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requested_quota =
       option_of_yojson
         (value_for_key requested_service_quota_change_of_yojson "RequestedQuota")
         _list path;
   }
    : request_service_quota_increase_response)

let request_service_quota_increase_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     support_case_allowed =
       option_of_yojson
         (value_for_key support_case_allowed_of_yojson "SupportCaseAllowed")
         _list path;
     context_id = option_of_yojson (value_for_key quota_context_id_of_yojson "ContextId") _list path;
     desired_value = value_for_key quota_value_of_yojson "DesiredValue" _list path;
     quota_code = value_for_key quota_code_of_yojson "QuotaCode" _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
   }
    : request_service_quota_increase_request)

let no_available_organization_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : no_available_organization_exception)

let aws_service_access_not_enabled_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : aws_service_access_not_enabled_exception)

let aws_region_of_yojson = string_of_yojson

let service_quota_increase_request_in_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     global_quota = option_of_yojson (value_for_key global_quota_of_yojson "GlobalQuota") _list path;
     unit_ = option_of_yojson (value_for_key quota_unit_of_yojson "Unit") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
     desired_value =
       option_of_yojson (value_for_key quota_value_of_yojson "DesiredValue") _list path;
     quota_name = option_of_yojson (value_for_key quota_name_of_yojson "QuotaName") _list path;
     quota_code = option_of_yojson (value_for_key quota_code_of_yojson "QuotaCode") _list path;
     service_name = option_of_yojson (value_for_key service_name_of_yojson "ServiceName") _list path;
     service_code = option_of_yojson (value_for_key service_code_of_yojson "ServiceCode") _list path;
   }
    : service_quota_increase_request_in_template)

let put_service_quota_increase_request_into_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_quota_increase_request_in_template =
       option_of_yojson
         (value_for_key service_quota_increase_request_in_template_of_yojson
            "ServiceQuotaIncreaseRequestInTemplate")
         _list path;
   }
    : put_service_quota_increase_request_into_template_response)

let put_service_quota_increase_request_into_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     desired_value = value_for_key quota_value_of_yojson "DesiredValue" _list path;
     aws_region = value_for_key aws_region_of_yojson "AwsRegion" _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
     quota_code = value_for_key quota_code_of_yojson "QuotaCode" _list path;
   }
    : put_service_quota_increase_request_into_template_request)

let output_tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key output_tags_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let next_token_of_yojson = string_of_yojson

let service_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_name = option_of_yojson (value_for_key service_name_of_yojson "ServiceName") _list path;
     service_code = option_of_yojson (value_for_key service_code_of_yojson "ServiceCode") _list path;
   }
    : service_info)

let service_info_list_definition_of_yojson tree path =
  list_of_yojson service_info_of_yojson tree path

let list_services_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     services =
       option_of_yojson (value_for_key service_info_list_definition_of_yojson "Services") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_services_response)

let max_results_of_yojson = int_of_yojson

let list_services_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_services_request)

let quota_adjustable_of_yojson = bool_of_yojson
let quota_metric_namespace_of_yojson = string_of_yojson
let quota_metric_name_of_yojson = string_of_yojson
let metric_dimension_value_of_yojson = string_of_yojson
let metric_dimension_name_of_yojson = string_of_yojson

let metric_dimensions_map_definition_of_yojson tree path =
  map_of_yojson metric_dimension_name_of_yojson metric_dimension_value_of_yojson tree path

let metric_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_statistic_recommendation =
       option_of_yojson
         (value_for_key statistic_of_yojson "MetricStatisticRecommendation")
         _list path;
     metric_dimensions =
       option_of_yojson
         (value_for_key metric_dimensions_map_definition_of_yojson "MetricDimensions")
         _list path;
     metric_name =
       option_of_yojson (value_for_key quota_metric_name_of_yojson "MetricName") _list path;
     metric_namespace =
       option_of_yojson
         (value_for_key quota_metric_namespace_of_yojson "MetricNamespace")
         _list path;
   }
    : metric_info)

let period_value_of_yojson = int_of_yojson

let period_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "WEEK" -> WEEK
    | `String "DAY" -> DAY
    | `String "HOUR" -> HOUR
    | `String "MINUTE" -> MINUTE
    | `String "SECOND" -> SECOND
    | `String "MILLISECOND" -> MILLISECOND
    | `String "MICROSECOND" -> MICROSECOND
    | `String value -> raise (deserialize_unknown_enum_value_error path "PeriodUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "PeriodUnit")
     : period_unit)
    : period_unit)

let quota_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     period_unit = option_of_yojson (value_for_key period_unit_of_yojson "PeriodUnit") _list path;
     period_value = option_of_yojson (value_for_key period_value_of_yojson "PeriodValue") _list path;
   }
    : quota_period)

let error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICE_QUOTA_NOT_AVAILABLE_ERROR" -> SERVICE_QUOTA_NOT_AVAILABLE_ERROR
    | `String "DEPENDENCY_SERVICE_ERROR" -> DEPENDENCY_SERVICE_ERROR
    | `String "DEPENDENCY_THROTTLING_ERROR" -> DEPENDENCY_THROTTLING_ERROR
    | `String "DEPENDENCY_ACCESS_DENIED_ERROR" -> DEPENDENCY_ACCESS_DENIED_ERROR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ErrorCode")
     : error_code)
    : error_code)

let error_message_of_yojson = string_of_yojson

let error_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "ErrorMessage") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
   }
    : error_reason)

let quota_description_of_yojson = string_of_yojson

let service_quota_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson (value_for_key quota_description_of_yojson "Description") _list path;
     quota_context =
       option_of_yojson (value_for_key quota_context_info_of_yojson "QuotaContext") _list path;
     quota_applied_at_level =
       option_of_yojson
         (value_for_key applied_level_enum_of_yojson "QuotaAppliedAtLevel")
         _list path;
     error_reason = option_of_yojson (value_for_key error_reason_of_yojson "ErrorReason") _list path;
     period = option_of_yojson (value_for_key quota_period_of_yojson "Period") _list path;
     usage_metric = option_of_yojson (value_for_key metric_info_of_yojson "UsageMetric") _list path;
     global_quota = option_of_yojson (value_for_key global_quota_of_yojson "GlobalQuota") _list path;
     adjustable =
       option_of_yojson (value_for_key quota_adjustable_of_yojson "Adjustable") _list path;
     unit_ = option_of_yojson (value_for_key quota_unit_of_yojson "Unit") _list path;
     value = option_of_yojson (value_for_key quota_value_of_yojson "Value") _list path;
     quota_name = option_of_yojson (value_for_key quota_name_of_yojson "QuotaName") _list path;
     quota_code = option_of_yojson (value_for_key quota_code_of_yojson "QuotaCode") _list path;
     quota_arn = option_of_yojson (value_for_key quota_arn_of_yojson "QuotaArn") _list path;
     service_name = option_of_yojson (value_for_key service_name_of_yojson "ServiceName") _list path;
     service_code = option_of_yojson (value_for_key service_code_of_yojson "ServiceCode") _list path;
   }
    : service_quota)

let service_quota_list_definition_of_yojson tree path =
  list_of_yojson service_quota_of_yojson tree path

let list_service_quotas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quotas =
       option_of_yojson (value_for_key service_quota_list_definition_of_yojson "Quotas") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_service_quotas_response)

let list_service_quotas_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_applied_at_level =
       option_of_yojson
         (value_for_key applied_level_enum_of_yojson "QuotaAppliedAtLevel")
         _list path;
     quota_code = option_of_yojson (value_for_key quota_code_of_yojson "QuotaCode") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
   }
    : list_service_quotas_request)

let service_quota_increase_request_in_template_list_of_yojson tree path =
  list_of_yojson service_quota_increase_request_in_template_of_yojson tree path

let list_service_quota_increase_requests_in_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     service_quota_increase_request_in_template_list =
       option_of_yojson
         (value_for_key service_quota_increase_request_in_template_list_of_yojson
            "ServiceQuotaIncreaseRequestInTemplateList")
         _list path;
   }
    : list_service_quota_increase_requests_in_template_response)

let list_service_quota_increase_requests_in_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     aws_region = option_of_yojson (value_for_key aws_region_of_yojson "AwsRegion") _list path;
     service_code = option_of_yojson (value_for_key service_code_of_yojson "ServiceCode") _list path;
   }
    : list_service_quota_increase_requests_in_template_request)

let requested_service_quota_change_history_list_definition_of_yojson tree path =
  list_of_yojson requested_service_quota_change_of_yojson tree path

let list_requested_service_quota_change_history_by_quota_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requested_quotas =
       option_of_yojson
         (value_for_key requested_service_quota_change_history_list_definition_of_yojson
            "RequestedQuotas")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_requested_service_quota_change_history_by_quota_response)

let list_requested_service_quota_change_history_by_quota_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_requested_at_level =
       option_of_yojson
         (value_for_key applied_level_enum_of_yojson "QuotaRequestedAtLevel")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     status = option_of_yojson (value_for_key request_status_of_yojson "Status") _list path;
     quota_code = value_for_key quota_code_of_yojson "QuotaCode" _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
   }
    : list_requested_service_quota_change_history_by_quota_request)

let list_requested_service_quota_change_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requested_quotas =
       option_of_yojson
         (value_for_key requested_service_quota_change_history_list_definition_of_yojson
            "RequestedQuotas")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_requested_service_quota_change_history_response)

let list_requested_service_quota_change_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_requested_at_level =
       option_of_yojson
         (value_for_key applied_level_enum_of_yojson "QuotaRequestedAtLevel")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     status = option_of_yojson (value_for_key request_status_of_yojson "Status") _list path;
     service_code = option_of_yojson (value_for_key service_code_of_yojson "ServiceCode") _list path;
   }
    : list_requested_service_quota_change_history_request)

let list_aws_default_service_quotas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quotas =
       option_of_yojson (value_for_key service_quota_list_definition_of_yojson "Quotas") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_aws_default_service_quotas_response)

let list_aws_default_service_quotas_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
   }
    : list_aws_default_service_quotas_request)

let get_service_quota_increase_request_from_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_quota_increase_request_in_template =
       option_of_yojson
         (value_for_key service_quota_increase_request_in_template_of_yojson
            "ServiceQuotaIncreaseRequestInTemplate")
         _list path;
   }
    : get_service_quota_increase_request_from_template_response)

let get_service_quota_increase_request_from_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region = value_for_key aws_region_of_yojson "AwsRegion" _list path;
     quota_code = value_for_key quota_code_of_yojson "QuotaCode" _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
   }
    : get_service_quota_increase_request_from_template_request)

let get_service_quota_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ quota = option_of_yojson (value_for_key service_quota_of_yojson "Quota") _list path }
    : get_service_quota_response)

let get_service_quota_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     context_id = option_of_yojson (value_for_key quota_context_id_of_yojson "ContextId") _list path;
     quota_code = value_for_key quota_code_of_yojson "QuotaCode" _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
   }
    : get_service_quota_request)

let get_requested_service_quota_change_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     requested_quota =
       option_of_yojson
         (value_for_key requested_service_quota_change_of_yojson "RequestedQuota")
         _list path;
   }
    : get_requested_service_quota_change_response)

let get_requested_service_quota_change_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ request_id = value_for_key request_id_of_yojson "RequestId" _list path }
    : get_requested_service_quota_change_request)

let default_value_of_yojson = double_of_yojson
let applied_value_of_yojson = double_of_yojson

let quota_utilization_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     adjustable =
       option_of_yojson (value_for_key quota_adjustable_of_yojson "Adjustable") _list path;
     service_name = option_of_yojson (value_for_key service_name_of_yojson "ServiceName") _list path;
     applied_value =
       option_of_yojson (value_for_key applied_value_of_yojson "AppliedValue") _list path;
     default_value =
       option_of_yojson (value_for_key default_value_of_yojson "DefaultValue") _list path;
     utilization =
       option_of_yojson (value_for_key utilization_pct_of_yojson "Utilization") _list path;
     namespace =
       option_of_yojson (value_for_key quota_metric_namespace_of_yojson "Namespace") _list path;
     quota_name = option_of_yojson (value_for_key quota_name_of_yojson "QuotaName") _list path;
     service_code = option_of_yojson (value_for_key service_code_of_yojson "ServiceCode") _list path;
     quota_code = option_of_yojson (value_for_key quota_code_of_yojson "QuotaCode") _list path;
   }
    : quota_utilization_info)

let quota_utilization_info_list_of_yojson tree path =
  list_of_yojson quota_utilization_info_of_yojson tree path

let report_error_code_of_yojson = string_of_yojson
let report_error_message_of_yojson = string_of_yojson

let get_quota_utilization_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key report_error_message_of_yojson "ErrorMessage") _list path;
     error_code =
       option_of_yojson (value_for_key report_error_code_of_yojson "ErrorCode") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     quotas =
       option_of_yojson (value_for_key quota_utilization_info_list_of_yojson "Quotas") _list path;
     total_count = option_of_yojson (value_for_key total_count_of_yojson "TotalCount") _list path;
     generated_at = option_of_yojson (value_for_key date_time_of_yojson "GeneratedAt") _list path;
     status = option_of_yojson (value_for_key report_status_of_yojson "Status") _list path;
     report_id = option_of_yojson (value_for_key report_id_of_yojson "ReportId") _list path;
   }
    : get_quota_utilization_report_response)

let max_results_utilization_of_yojson = int_of_yojson

let get_quota_utilization_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key max_results_utilization_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     report_id = value_for_key report_id_of_yojson "ReportId" _list path;
   }
    : get_quota_utilization_report_request)

let get_aws_default_service_quota_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ quota = option_of_yojson (value_for_key service_quota_of_yojson "Quota") _list path }
    : get_aws_default_service_quota_response)

let get_aws_default_service_quota_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_code = value_for_key quota_code_of_yojson "QuotaCode" _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
   }
    : get_aws_default_service_quota_request)

let opt_in_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "OptInStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "OptInStatus")
     : opt_in_status)
    : opt_in_status)

let quota_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_name = option_of_yojson (value_for_key quota_name_of_yojson "QuotaName") _list path;
     quota_code = option_of_yojson (value_for_key quota_code_of_yojson "QuotaCode") _list path;
   }
    : quota_info)

let quota_info_list_of_yojson tree path = list_of_yojson quota_info_of_yojson tree path

let exclusion_quota_list_of_yojson tree path =
  map_of_yojson excluded_service_of_yojson quota_info_list_of_yojson tree path

let get_auto_management_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclusion_list =
       option_of_yojson (value_for_key exclusion_quota_list_of_yojson "ExclusionList") _list path;
     opt_in_status =
       option_of_yojson (value_for_key opt_in_status_of_yojson "OptInStatus") _list path;
     notification_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "NotificationArn") _list path;
     opt_in_type = option_of_yojson (value_for_key opt_in_type_of_yojson "OptInType") _list path;
     opt_in_level = option_of_yojson (value_for_key opt_in_level_of_yojson "OptInLevel") _list path;
   }
    : get_auto_management_configuration_response)

let get_auto_management_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let service_quota_template_not_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : service_quota_template_not_in_use_exception)

let service_quota_template_association_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISASSOCIATED" -> DISASSOCIATED
    | `String "ASSOCIATED" -> ASSOCIATED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ServiceQuotaTemplateAssociationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceQuotaTemplateAssociationStatus")
     : service_quota_template_association_status)
    : service_quota_template_association_status)

let get_association_for_service_quota_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_quota_template_association_status =
       option_of_yojson
         (value_for_key service_quota_template_association_status_of_yojson
            "ServiceQuotaTemplateAssociationStatus")
         _list path;
   }
    : get_association_for_service_quota_template_response)

let get_association_for_service_quota_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_service_quota_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_service_quota_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_service_quota_increase_request_from_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_service_quota_increase_request_from_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_region = value_for_key aws_region_of_yojson "AwsRegion" _list path;
     quota_code = value_for_key quota_code_of_yojson "QuotaCode" _list path;
     service_code = value_for_key service_code_of_yojson "ServiceCode" _list path;
   }
    : delete_service_quota_increase_request_from_template_request)

let create_support_case_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_support_case_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ request_id = value_for_key request_id_of_yojson "RequestId" _list path }
    : create_support_case_request)

let organization_not_in_all_features_mode_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key exception_message_of_yojson "Message") _list path }
    : organization_not_in_all_features_mode_exception)

let associate_service_quota_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_service_quota_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)
