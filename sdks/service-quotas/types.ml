type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec aws_service_access_not_enabled_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The action you attempted is not allowed unless Service Access with Service Quotas is enabled in \
   your organization.\n"]

type nonrec access_denied_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "You do not have sufficient permission to perform this action.\n"]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec applied_level_enum =
  | ACCOUNT [@ocaml.doc ""]
  | RESOURCE [@ocaml.doc ""]
  | ALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec applied_value = float [@@ocaml.doc ""]

type nonrec too_many_requests_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Due to throttling, the request was denied. Slow down the rate of request calls, or request an \
   increase for this quota.\n"]

type nonrec templates_not_available_in_region_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The Service Quotas template is not available in this Amazon Web Services Region.\n"]

type nonrec service_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Something went wrong.\n"]

type nonrec organization_not_in_all_features_mode_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The organization that your Amazon Web Services account belongs to is not in All Features mode.\n"]

type nonrec no_available_organization_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The Amazon Web Services account making this call is not a member of an organization.\n"]

type nonrec dependency_access_denied_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "You can't perform this action because a dependency does not have access.\n"]

type nonrec associate_service_quota_template_response = unit [@@ocaml.doc ""]

type nonrec associate_service_quota_template_request = unit [@@ocaml.doc ""]

type nonrec aws_region = string [@@ocaml.doc ""]

type nonrec resource_already_exists_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified resource already exists.\n"]

type nonrec no_such_resource_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified resource does not exist.\n"]

type nonrec invalid_resource_state_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The resource is in an invalid state.\n"]

type nonrec illegal_argument_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Invalid input was provided.\n"]

type nonrec create_support_case_response = unit [@@ocaml.doc ""]

type nonrec request_id = string [@@ocaml.doc ""]

type nonrec create_support_case_request = {
  request_id : request_id;
      [@ocaml.doc
        "The ID of the pending quota increase request for which you want to open a Support case. \n"]
}
[@@ocaml.doc ""]

type nonrec customer_service_engagement_id = string [@@ocaml.doc ""]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec default_value = float [@@ocaml.doc ""]

type nonrec delete_service_quota_increase_request_from_template_response = unit [@@ocaml.doc ""]

type nonrec quota_code = string [@@ocaml.doc ""]

type nonrec service_code = string [@@ocaml.doc ""]

type nonrec delete_service_quota_increase_request_from_template_request = {
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  quota_code : quota_code;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  aws_region : aws_region;
      [@ocaml.doc "Specifies the Amazon Web Services Region for which the request was made.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_template_not_in_use_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The quota request template is not associated with your organization.\n"]

type nonrec disassociate_service_quota_template_response = unit [@@ocaml.doc ""]

type nonrec disassociate_service_quota_template_request = unit [@@ocaml.doc ""]

type nonrec error_code =
  | DEPENDENCY_ACCESS_DENIED_ERROR [@ocaml.doc ""]
  | DEPENDENCY_THROTTLING_ERROR [@ocaml.doc ""]
  | DEPENDENCY_SERVICE_ERROR [@ocaml.doc ""]
  | SERVICE_QUOTA_NOT_AVAILABLE_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_reason = {
  error_code : error_code option;
      [@ocaml.doc
        "Service Quotas returns the following error values:\n\n\
        \ {ul\n\
        \       {-   [DEPENDENCY_ACCESS_DENIED_ERROR] - The caller does not have the required \
         permissions to complete the action. To resolve the error, you must have permission to \
         access the Amazon Web Services service or quota.\n\
        \           \n\
        \            }\n\
        \       {-   [DEPENDENCY_THROTTLING_ERROR] - The Amazon Web Services service is throttling \
         Service Quotas. \n\
        \           \n\
        \            }\n\
        \       {-   [DEPENDENCY_SERVICE_ERROR] - The Amazon Web Services service is not available.\n\
        \           \n\
        \            }\n\
        \       {-   [SERVICE_QUOTA_NOT_AVAILABLE_ERROR] - There was an error in Service Quotas.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  error_message : error_message option; [@ocaml.doc "The error message.\n"]
}
[@@ocaml.doc "An error that explains why an action did not succeed.\n"]

type nonrec excluded_limit = string [@@ocaml.doc ""]

type nonrec excluded_quota_list = excluded_limit list [@@ocaml.doc ""]

type nonrec excluded_service = string [@@ocaml.doc ""]

type nonrec exclusion_list = (excluded_service * excluded_quota_list) list [@@ocaml.doc ""]

type nonrec quota_name = string [@@ocaml.doc ""]

type nonrec quota_info = {
  quota_code : quota_code option;
      [@ocaml.doc
        "The Service Quotas code for the Amazon Web Services service monitored with Automatic \
         Management.\n"]
  quota_name : quota_name option;
      [@ocaml.doc
        "The Service Quotas name for the Amazon Web Services service monitored with Automatic \
         Management.\n"]
}
[@@ocaml.doc
  "Information on your Service Quotas for \
   {{:https://docs.aws.amazon.com/servicequotas/latest/userguide/automatic-management.html}Service \
   Quotas Automatic Management}. Automatic Management monitors your Service Quotas utilization and \
   notifies you before you run out of your allocated quotas.\n"]

type nonrec quota_info_list = quota_info list [@@ocaml.doc ""]

type nonrec exclusion_quota_list = (excluded_service * quota_info_list) list [@@ocaml.doc ""]

type nonrec quota_description = string [@@ocaml.doc ""]

type nonrec quota_context_id = string [@@ocaml.doc ""]

type nonrec quota_context_scope_type = string [@@ocaml.doc ""]

type nonrec quota_context_scope = RESOURCE [@ocaml.doc ""] | ACCOUNT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec quota_context_info = {
  context_scope : quota_context_scope option;
      [@ocaml.doc
        "Specifies the scope to which the quota value is applied. If the scope is [RESOURCE], the \
         quota value is applied to each resource in the Amazon Web Services account. If the scope \
         is [ACCOUNT], the quota value is applied to the Amazon Web Services account.\n"]
  context_scope_type : quota_context_scope_type option;
      [@ocaml.doc "Specifies the resource type to which the quota can be applied.\n"]
  context_id : quota_context_id option;
      [@ocaml.doc
        "Specifies the resource, or resources, to which the quota applies. The value for this \
         field is either an Amazon Resource Name (ARN) or *. If the value is an ARN, the quota \
         value applies to that resource. If the value is *, then the quota value applies to all \
         resources listed in the [ContextScopeType] field. The quota value applies to all \
         resources for which you haven\226\128\153t previously applied a quota value, and any new \
         resources you create in your Amazon Web Services account.\n"]
}
[@@ocaml.doc
  "A structure that describes the context for a resource-level quota. For resource-level quotas, \
   such as [Instances per OpenSearch Service Domain], you can apply the quota value at the \
   resource-level for each OpenSearch Service Domain in your Amazon Web Services account. Together \
   the attributes of this structure help you understand how the quota is implemented by Amazon Web \
   Services and how you can manage it. For quotas such as [Amazon OpenSearch Service Domains] \
   which can be managed at the account-level for each Amazon Web Services Region, the \
   [QuotaContext] field is absent. See the attribute descriptions below to further understand how \
   to use them.\n"]

type nonrec period_unit =
  | MICROSECOND [@ocaml.doc ""]
  | MILLISECOND [@ocaml.doc ""]
  | SECOND [@ocaml.doc ""]
  | MINUTE [@ocaml.doc ""]
  | HOUR [@ocaml.doc ""]
  | DAY [@ocaml.doc ""]
  | WEEK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec period_value = int [@@ocaml.doc ""]

type nonrec quota_period = {
  period_value : period_value option;
      [@ocaml.doc "The value associated with the reported [PeriodUnit].\n"]
  period_unit : period_unit option; [@ocaml.doc "The time unit.\n"]
}
[@@ocaml.doc "Information about the quota period.\n"]

type nonrec statistic = string [@@ocaml.doc ""]

type nonrec metric_dimension_value = string [@@ocaml.doc ""]

type nonrec metric_dimension_name = string [@@ocaml.doc ""]

type nonrec metric_dimensions_map_definition = (metric_dimension_name * metric_dimension_value) list
[@@ocaml.doc ""]

type nonrec quota_metric_name = string [@@ocaml.doc ""]

type nonrec quota_metric_namespace = string [@@ocaml.doc ""]

type nonrec metric_info = {
  metric_namespace : quota_metric_namespace option; [@ocaml.doc "The namespace of the metric.\n"]
  metric_name : quota_metric_name option; [@ocaml.doc "The name of the metric.\n"]
  metric_dimensions : metric_dimensions_map_definition option;
      [@ocaml.doc
        "The metric dimension. This is a name/value pair that is part of the identity of a metric.\n"]
  metric_statistic_recommendation : statistic option;
      [@ocaml.doc "The metric statistic that we recommend you use when determining quota usage.\n"]
}
[@@ocaml.doc "Information about the CloudWatch metric that reflects quota usage.\n"]

type nonrec global_quota = bool [@@ocaml.doc ""]

type nonrec quota_adjustable = bool [@@ocaml.doc ""]

type nonrec quota_unit = string [@@ocaml.doc ""]

type nonrec quota_value = float [@@ocaml.doc ""]

type nonrec quota_arn = string [@@ocaml.doc ""]

type nonrec service_name = string [@@ocaml.doc ""]

type nonrec service_quota = {
  service_code : service_code option;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  service_name : service_name option; [@ocaml.doc "Specifies the service name.\n"]
  quota_arn : quota_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the quota.\n"]
  quota_code : quota_code option;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  quota_name : quota_name option; [@ocaml.doc "Specifies the quota name.\n"]
  value : quota_value option; [@ocaml.doc "The quota value.\n"]
  unit_ : quota_unit option; [@ocaml.doc "The unit of measurement.\n"]
  adjustable : quota_adjustable option;
      [@ocaml.doc "Indicates whether the quota value can be increased.\n"]
  global_quota : global_quota option; [@ocaml.doc "Indicates whether the quota is global.\n"]
  usage_metric : metric_info option; [@ocaml.doc "Information about the measurement.\n"]
  period : quota_period option; [@ocaml.doc "The period of time.\n"]
  error_reason : error_reason option; [@ocaml.doc "The error code and error reason.\n"]
  quota_applied_at_level : applied_level_enum option;
      [@ocaml.doc
        "Filters the response to return applied quota values for the [ACCOUNT], [RESOURCE], or \
         [ALL] levels. [ACCOUNT] is the default.\n"]
  quota_context : quota_context_info option; [@ocaml.doc "The context for this service quota.\n"]
  description : quota_description option; [@ocaml.doc "The quota description. \n"]
}
[@@ocaml.doc "Information about a quota.\n"]

type nonrec get_aws_default_service_quota_response = {
  quota : service_quota option; [@ocaml.doc "Information about the quota.\n"]
}
[@@ocaml.doc ""]

type nonrec get_aws_default_service_quota_request = {
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  quota_code : quota_code;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_template_association_status =
  | ASSOCIATED [@ocaml.doc ""]
  | DISASSOCIATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_association_for_service_quota_template_response = {
  service_quota_template_association_status : service_quota_template_association_status option;
      [@ocaml.doc
        "The association status. If the status is [ASSOCIATED], the quota increase requests in the \
         template are automatically applied to new Amazon Web Services accounts in your \
         organization.\n"]
}
[@@ocaml.doc ""]

type nonrec get_association_for_service_quota_template_request = unit [@@ocaml.doc ""]

type nonrec opt_in_status = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec opt_in_type = NotifyOnly [@ocaml.doc ""] | NotifyAndAdjust [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec opt_in_level = ACCOUNT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec get_auto_management_configuration_response = {
  opt_in_level : opt_in_level option;
      [@ocaml.doc
        "Information on the opt-in level for Automatic Management. Only Amazon Web Services \
         account level is supported.\n"]
  opt_in_type : opt_in_type option;
      [@ocaml.doc
        "Information on the opt-in type for Automatic Management. There are two modes: Notify only \
         and Notify and Auto-Adjust. Currently, only NotifyOnly is available.\n"]
  notification_arn : amazon_resource_name option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/notifications/latest/userguide/resource-level-permissions.html#rlp-table}User \
         Notifications} Amazon Resource Name (ARN) for Automatic Management notifications.\n"]
  opt_in_status : opt_in_status option;
      [@ocaml.doc "Status on whether Automatic Management is started or stopped.\n"]
  exclusion_list : exclusion_quota_list option;
      [@ocaml.doc
        "List of Amazon Web Services services excluded from Automatic Management. You won't be \
         notified of Service Quotas utilization for Amazon Web Services services added to the \
         Automatic Management exclusion list. \n"]
}
[@@ocaml.doc ""]

type nonrec get_auto_management_configuration_request = unit [@@ocaml.doc ""]

type nonrec report_error_message = string [@@ocaml.doc ""]

type nonrec report_error_code = string [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec utilization_pct = float [@@ocaml.doc ""]

type nonrec quota_utilization_info = {
  quota_code : quota_code option; [@ocaml.doc "The quota identifier.\n"]
  service_code : service_code option; [@ocaml.doc "The service identifier.\n"]
  quota_name : quota_name option; [@ocaml.doc "The quota name.\n"]
  namespace : quota_metric_namespace option;
      [@ocaml.doc "The namespace of the metric used to track quota usage.\n"]
  utilization : utilization_pct option;
      [@ocaml.doc
        "The utilization percentage of the quota, calculated as (current usage / applied value) \
         \195\151 100. Values range from 0.0 to 100.0 or higher if usage exceeds the quota limit.\n"]
  default_value : default_value option; [@ocaml.doc "The default value of the quota.\n"]
  applied_value : applied_value option;
      [@ocaml.doc
        "The applied value of the quota, which may be higher than the default value if a quota \
         increase has been requested and approved.\n"]
  service_name : service_name option; [@ocaml.doc "The service name.\n"]
  adjustable : quota_adjustable option;
      [@ocaml.doc "Indicates whether the quota value can be increased.\n"]
}
[@@ocaml.doc
  "Information about a quota's utilization, including the quota code, service information, current \
   usage, and applied limits.\n"]

type nonrec quota_utilization_info_list = quota_utilization_info list [@@ocaml.doc ""]

type nonrec total_count = int [@@ocaml.doc ""]

type nonrec report_status =
  | PENDING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec report_id = string [@@ocaml.doc ""]

type nonrec get_quota_utilization_report_response = {
  report_id : report_id option;
      [@ocaml.doc "The unique identifier for the quota utilization report.\n"]
  status : report_status option;
      [@ocaml.doc
        "The current status of the report generation. Possible values are:\n\n\
        \ {ul\n\
        \       {-   [PENDING] - The report generation is in progress. Retry this operation after \
         a few seconds.\n\
        \           \n\
        \            }\n\
        \       {-   [IN_PROGRESS] - The report is being processed. Continue polling until the \
         status changes to [COMPLETED].\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETED] - The report is ready and quota utilization data is available in \
         the response.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - The report generation failed. Check the [ErrorCode] and \
         [ErrorMessage] fields for details.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  generated_at : date_time option;
      [@ocaml.doc "The timestamp when the report was generated, in ISO 8601 format.\n"]
  total_count : total_count option;
      [@ocaml.doc "The total number of quotas included in the report across all pages.\n"]
  quotas : quota_utilization_info_list option;
      [@ocaml.doc
        "A list of quota utilization records, sorted by utilization percentage in descending \
         order. Each record includes the quota code, service code, service name, quota name, \
         namespace, utilization percentage, default value, applied value, and whether the quota is \
         adjustable. Up to 1,000 records are returned per page.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token that indicates more results are available. Include this token in the next request \
         to retrieve the next page of results. If this field is not present, you have retrieved \
         all available results.\n"]
  error_code : report_error_code option;
      [@ocaml.doc
        "An error code indicating the reason for failure when the report status is [FAILED]. This \
         field is only present when the status is [FAILED].\n"]
  error_message : report_error_message option;
      [@ocaml.doc
        "A detailed error message describing the failure when the report status is [FAILED]. This \
         field is only present when the status is [FAILED].\n"]
}
[@@ocaml.doc ""]

type nonrec max_results_utilization = int [@@ocaml.doc ""]

type nonrec get_quota_utilization_report_request = {
  report_id : report_id;
      [@ocaml.doc
        "The unique identifier for the quota utilization report. This identifier is returned by \
         the [StartQuotaUtilizationReport] operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "A token that indicates the next page of results to retrieve. This token is returned in \
         the response when there are more results available. Omit this parameter for the first \
         request.\n"]
  max_results : max_results_utilization option;
      [@ocaml.doc
        "The maximum number of results to return per page. The default value is 1,000 and the \
         maximum allowed value is 1,000.\n"]
}
[@@ocaml.doc ""]

type nonrec requester = string [@@ocaml.doc ""]

type nonrec request_status =
  | PENDING [@ocaml.doc ""]
  | CASE_OPENED [@ocaml.doc ""]
  | APPROVED [@ocaml.doc ""]
  | DENIED [@ocaml.doc ""]
  | CASE_CLOSED [@ocaml.doc ""]
  | NOT_APPROVED [@ocaml.doc ""]
  | INVALID_REQUEST [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec request_type = AutomaticManagement [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec requested_service_quota_change = {
  id : request_id option; [@ocaml.doc "The unique identifier.\n"]
  request_type : request_type option;
      [@ocaml.doc
        "The type of quota increase request. Possible values include:\n\n\
        \ {ul\n\
        \       {-   [AutomaticManagement] - The request was automatically created by Service \
         Quotas Automatic Management when quota utilization approached the limit.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If this field is not present, the request was manually created by a user.\n\
        \   "]
  case_id : customer_service_engagement_id option; [@ocaml.doc "The case ID.\n"]
  service_code : service_code option;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  service_name : service_name option; [@ocaml.doc "Specifies the service name.\n"]
  quota_code : quota_code option;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  quota_name : quota_name option; [@ocaml.doc "Specifies the quota name.\n"]
  desired_value : quota_value option; [@ocaml.doc "The new, increased value for the quota.\n"]
  status : request_status option;
      [@ocaml.doc
        "The state of the quota increase request.\n\n\
        \ {ul\n\
        \       {-   [PENDING]: The quota increase request is under review by Amazon Web Services. \n\
        \           \n\
        \            }\n\
        \       {-   [CASE_OPENED]: Service Quotas opened a support case to process the quota \
         increase request. Follow-up on the support case for more information.\n\
        \           \n\
        \            }\n\
        \       {-   [APPROVED]: The quota increase request is approved. \n\
        \           \n\
        \            }\n\
        \       {-   [DENIED]: The quota increase request can't be approved by Service Quotas. \
         Contact Amazon Web Services Support for more details.\n\
        \           \n\
        \            }\n\
        \       {-   [NOT APPROVED]: The quota increase request can't be approved by Service \
         Quotas. Contact Amazon Web Services Support for more details.\n\
        \           \n\
        \            }\n\
        \       {-   [CASE_CLOSED]: The support case associated with this quota increase request \
         was closed. Check the support case correspondence for the outcome of your quota request.\n\
        \           \n\
        \            }\n\
        \       {-   [INVALID_REQUEST]: Service Quotas couldn't process your resource-level quota \
         increase request because the Amazon Resource Name (ARN) specified as part of the \
         [ContextId] is invalid.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  created : date_time option;
      [@ocaml.doc
        "The date and time when the quota increase request was received and the case ID was created.\n"]
  last_updated : date_time option; [@ocaml.doc "The date and time of the most recent change.\n"]
  requester : requester option; [@ocaml.doc "The IAM identity of the requester.\n"]
  quota_arn : quota_arn option; [@ocaml.doc "The Amazon Resource Name (ARN) of the quota.\n"]
  global_quota : global_quota option; [@ocaml.doc "Indicates whether the quota is global.\n"]
  unit_ : quota_unit option; [@ocaml.doc "The unit of measurement.\n"]
  quota_requested_at_level : applied_level_enum option;
      [@ocaml.doc
        "Filters the response to return quota requests for the [ACCOUNT], [RESOURCE], or [ALL] \
         levels. [ACCOUNT] is the default.\n"]
  quota_context : quota_context_info option; [@ocaml.doc "The context for this service quota.\n"]
}
[@@ocaml.doc "Information about a quota increase request.\n"]

type nonrec get_requested_service_quota_change_response = {
  requested_quota : requested_service_quota_change option;
      [@ocaml.doc "Information about the quota increase request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_requested_service_quota_change_request = {
  request_id : request_id; [@ocaml.doc "Specifies the ID of the quota increase request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_quota_response = {
  quota : service_quota option; [@ocaml.doc "Information about the quota.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_quota_request = {
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  quota_code : quota_code;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  context_id : quota_context_id option;
      [@ocaml.doc "Specifies the resource with an Amazon Resource Name (ARN).\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_increase_request_in_template = {
  service_code : service_code option;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  service_name : service_name option; [@ocaml.doc "Specifies the service name.\n"]
  quota_code : quota_code option;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  quota_name : quota_name option; [@ocaml.doc "Specifies the quota name.\n"]
  desired_value : quota_value option; [@ocaml.doc "The new, increased value of the quota.\n"]
  aws_region : aws_region option; [@ocaml.doc "The Amazon Web Services Region.\n"]
  unit_ : quota_unit option; [@ocaml.doc "The unit of measurement.\n"]
  global_quota : global_quota option; [@ocaml.doc "Indicates whether the quota is global.\n"]
}
[@@ocaml.doc "Information about a quota increase request.\n"]

type nonrec get_service_quota_increase_request_from_template_response = {
  service_quota_increase_request_in_template : service_quota_increase_request_in_template option;
      [@ocaml.doc "Information about the quota increase request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_service_quota_increase_request_from_template_request = {
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  quota_code : quota_code;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  aws_region : aws_region;
      [@ocaml.doc "Specifies the Amazon Web Services Region for which you made the request.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec input_tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "A string that contains a tag key. The string length should be between 1 and 128 \
         characters. Valid characters include a-z, A-Z, 0-9, space, and the special characters _ - \
         . : / = + \\@.\n"]
  value : tag_value;
      [@ocaml.doc
        "A string that contains an optional tag value. The string length should be between 0 and \
         256 characters. Valid characters include a-z, A-Z, 0-9, space, and the special characters \
         _ - . : / = + \\@.\n"]
}
[@@ocaml.doc "A complex data type that contains a tag key and tag value.\n"]

type nonrec input_tags = tag list [@@ocaml.doc ""]

type nonrec invalid_pagination_token_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "Invalid input was provided.\n"]

type nonrec service_quota_list_definition = service_quota list [@@ocaml.doc ""]

type nonrec list_aws_default_service_quotas_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
  quotas : service_quota_list_definition option; [@ocaml.doc "Information about the quotas.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_aws_default_service_quotas_request = {
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies a value for receiving additional results after you receive a [NextToken] \
         response in a previous request. A [NextToken] response indicates that more output is \
         available. Set this parameter to the value of the previous call's [NextToken] response to \
         indicate where the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the maximum number of results that you want included on each page of the \
         response. If you do not include this parameter, it defaults to a value appropriate to the \
         operation. If additional items exist beyond those included in the current response, the \
         [NextToken] response element is present and has a value (is not null). Include that value \
         as the [NextToken] request parameter in the next call to the operation to get the next \
         part of the results.\n\n\
        \  An API operation can return fewer results than the maximum even when there are more \
         results available. You should check [NextToken] after every operation to ensure that you \
         receive all of the results.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec requested_service_quota_change_history_list_definition =
  requested_service_quota_change list
[@@ocaml.doc ""]

type nonrec list_requested_service_quota_change_history_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
  requested_quotas : requested_service_quota_change_history_list_definition option;
      [@ocaml.doc "Information about the quota increase requests.\n"]
}
[@@ocaml.doc ""]

type nonrec list_requested_service_quota_change_history_request = {
  service_code : service_code option;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  status : request_status option;
      [@ocaml.doc
        "Specifies that you want to filter the results to only the requests with the matching \
         status.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies a value for receiving additional results after you receive a [NextToken] \
         response in a previous request. A [NextToken] response indicates that more output is \
         available. Set this parameter to the value of the previous call's [NextToken] response to \
         indicate where the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the maximum number of results that you want included on each page of the \
         response. If you do not include this parameter, it defaults to a value appropriate to the \
         operation. If additional items exist beyond those included in the current response, the \
         [NextToken] response element is present and has a value (is not null). Include that value \
         as the [NextToken] request parameter in the next call to the operation to get the next \
         part of the results.\n\n\
        \  An API operation can return fewer results than the maximum even when there are more \
         results available. You should check [NextToken] after every operation to ensure that you \
         receive all of the results.\n\
        \  \n\
        \   "]
  quota_requested_at_level : applied_level_enum option;
      [@ocaml.doc
        "Filters the response to return quota requests for the [ACCOUNT], [RESOURCE], or [ALL] \
         levels. [ACCOUNT] is the default.\n"]
}
[@@ocaml.doc ""]

type nonrec list_requested_service_quota_change_history_by_quota_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
  requested_quotas : requested_service_quota_change_history_list_definition option;
      [@ocaml.doc "Information about the quota increase requests.\n"]
}
[@@ocaml.doc ""]

type nonrec list_requested_service_quota_change_history_by_quota_request = {
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  quota_code : quota_code;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  status : request_status option;
      [@ocaml.doc
        "Specifies that you want to filter the results to only the requests with the matching \
         status.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies a value for receiving additional results after you receive a [NextToken] \
         response in a previous request. A [NextToken] response indicates that more output is \
         available. Set this parameter to the value of the previous call's [NextToken] response to \
         indicate where the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the maximum number of results that you want included on each page of the \
         response. If you do not include this parameter, it defaults to a value appropriate to the \
         operation. If additional items exist beyond those included in the current response, the \
         [NextToken] response element is present and has a value (is not null). Include that value \
         as the [NextToken] request parameter in the next call to the operation to get the next \
         part of the results.\n\n\
        \  An API operation can return fewer results than the maximum even when there are more \
         results available. You should check [NextToken] after every operation to ensure that you \
         receive all of the results.\n\
        \  \n\
        \   "]
  quota_requested_at_level : applied_level_enum option;
      [@ocaml.doc
        "Filters the response to return quota requests for the [ACCOUNT], [RESOURCE], or [ALL] \
         levels. [ACCOUNT] is the default.\n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_increase_request_in_template_list =
  service_quota_increase_request_in_template list
[@@ocaml.doc ""]

type nonrec list_service_quota_increase_requests_in_template_response = {
  service_quota_increase_request_in_template_list :
    service_quota_increase_request_in_template_list option;
      [@ocaml.doc "Information about the quota increase requests.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
}
[@@ocaml.doc ""]

type nonrec list_service_quota_increase_requests_in_template_request = {
  service_code : service_code option;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  aws_region : aws_region option;
      [@ocaml.doc "Specifies the Amazon Web Services Region for which you made the request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies a value for receiving additional results after you receive a [NextToken] \
         response in a previous request. A [NextToken] response indicates that more output is \
         available. Set this parameter to the value of the previous call's [NextToken] response to \
         indicate where the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the maximum number of results that you want included on each page of the \
         response. If you do not include this parameter, it defaults to a value appropriate to the \
         operation. If additional items exist beyond those included in the current response, the \
         [NextToken] response element is present and has a value (is not null). Include that value \
         as the [NextToken] request parameter in the next call to the operation to get the next \
         part of the results.\n\n\
        \  An API operation can return fewer results than the maximum even when there are more \
         results available. You should check [NextToken] after every operation to ensure that you \
         receive all of the results.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec list_service_quotas_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
  quotas : service_quota_list_definition option; [@ocaml.doc "Information about the quotas.\n"]
}
[@@ocaml.doc ""]

type nonrec list_service_quotas_request = {
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "Specifies a value for receiving additional results after you receive a [NextToken] \
         response in a previous request. A [NextToken] response indicates that more output is \
         available. Set this parameter to the value of the previous call's [NextToken] response to \
         indicate where the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the maximum number of results that you want included on each page of the \
         response. If you do not include this parameter, it defaults to a value appropriate to the \
         operation. If additional items exist beyond those included in the current response, the \
         [NextToken] response element is present and has a value (is not null). Include that value \
         as the [NextToken] request parameter in the next call to the operation to get the next \
         part of the results.\n\n\
        \  An API operation can return fewer results than the maximum even when there are more \
         results available. You should check [NextToken] after every operation to ensure that you \
         receive all of the results.\n\
        \  \n\
        \   "]
  quota_code : quota_code option;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  quota_applied_at_level : applied_level_enum option;
      [@ocaml.doc
        "Filters the response to return applied quota values for the [ACCOUNT], [RESOURCE], or \
         [ALL] levels. [ACCOUNT] is the default.\n"]
}
[@@ocaml.doc ""]

type nonrec service_info = {
  service_code : service_code option;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  service_name : service_name option; [@ocaml.doc "Specifies the service name.\n"]
}
[@@ocaml.doc "Information about an Amazon Web Services service.\n"]

type nonrec service_info_list_definition = service_info list [@@ocaml.doc ""]

type nonrec list_services_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If present, indicates that more output is available than is included in the current \
         response. Use this value in the [NextToken] request parameter in a subsequent call to the \
         operation to get the next part of the output. You should repeat this until the \
         [NextToken] response element comes back as [null].\n"]
  services : service_info_list_definition option;
      [@ocaml.doc "The list of the Amazon Web Services service names and service codes.\n"]
}
[@@ocaml.doc ""]

type nonrec list_services_request = {
  next_token : next_token option;
      [@ocaml.doc
        "Specifies a value for receiving additional results after you receive a [NextToken] \
         response in a previous request. A [NextToken] response indicates that more output is \
         available. Set this parameter to the value of the previous call's [NextToken] response to \
         indicate where the output should continue from.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "Specifies the maximum number of results that you want included on each page of the \
         response. If you do not include this parameter, it defaults to a value appropriate to the \
         operation. If additional items exist beyond those included in the current response, the \
         [NextToken] response element is present and has a value (is not null). Include that value \
         as the [NextToken] request parameter in the next call to the operation to get the next \
         part of the results.\n\n\
        \  An API operation can return fewer results than the maximum even when there are more \
         results available. You should check [NextToken] after every operation to ensure that you \
         receive all of the results.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec output_tags = tag list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : output_tags option;
      [@ocaml.doc "A complex data type that contains zero or more tag elements.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the applied quota for which you want to list tags. You \
         can get this information by using the Service Quotas console, or by listing the quotas \
         using the \
         {{:https://docs.aws.amazon.com/cli/latest/reference/service-quotas/list-service-quotas.html}list-service-quotas} \
         CLI command or the \
         {{:https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html}ListServiceQuotas} \
         Amazon Web Services API operation.\n"]
}
[@@ocaml.doc ""]

type nonrec quota_exceeded_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You have exceeded your service quota. To perform the requested action, remove some of the \
   relevant resources, or use Service Quotas to request a service quota increase.\n"]

type nonrec put_service_quota_increase_request_into_template_response = {
  service_quota_increase_request_in_template : service_quota_increase_request_in_template option;
      [@ocaml.doc "Information about the quota increase request.\n"]
}
[@@ocaml.doc ""]

type nonrec put_service_quota_increase_request_into_template_request = {
  quota_code : quota_code;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  aws_region : aws_region;
      [@ocaml.doc "Specifies the Amazon Web Services Region to which the template applies.\n"]
  desired_value : quota_value; [@ocaml.doc "Specifies the new, increased value for the quota.\n"]
}
[@@ocaml.doc ""]

type nonrec report_message = string [@@ocaml.doc ""]

type nonrec request_service_quota_increase_response = {
  requested_quota : requested_service_quota_change option;
      [@ocaml.doc "Information about the quota increase request.\n"]
}
[@@ocaml.doc ""]

type nonrec support_case_allowed = bool [@@ocaml.doc ""]

type nonrec request_service_quota_increase_request = {
  service_code : service_code;
      [@ocaml.doc
        "Specifies the service identifier. To find the service code value for an Amazon Web \
         Services service, use the [ListServices] operation.\n"]
  quota_code : quota_code;
      [@ocaml.doc
        "Specifies the quota identifier. To find the quota code for a specific quota, use the \
         [ListServiceQuotas] operation, and look for the [QuotaCode] response in the output for \
         the quota you want.\n"]
  desired_value : quota_value; [@ocaml.doc "Specifies the new, increased value for the quota.\n"]
  context_id : quota_context_id option;
      [@ocaml.doc "Specifies the resource with an Amazon Resource Name (ARN).\n"]
  support_case_allowed : support_case_allowed option;
      [@ocaml.doc
        "Specifies if an Amazon Web Services Support case can be opened for the quota increase \
         request. This parameter is optional. \n\n\
        \ By default, this flag is set to [True] and Amazon Web Services may create a support case \
         for some quota increase requests. You can set this flag to [False] if you do not want a \
         support case created when you request a quota increase. If you set the flag to [False], \
         Amazon Web Services does not open a support case and updates the request status to [Not \
         approved]. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec update_auto_management_response = unit [@@ocaml.doc ""]

type nonrec update_auto_management_request = {
  opt_in_type : opt_in_type option;
      [@ocaml.doc
        "Information on the opt-in type for your Automatic Management configuration. There are two \
         modes: Notify only and Notify and Auto-Adjust. Currently, only NotifyOnly is available.\n"]
  notification_arn : amazon_resource_name option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/notifications/latest/userguide/resource-level-permissions.html#rlp-table}User \
         Notifications} Amazon Resource Name (ARN) for Automatic Management notifications you want \
         to update.\n"]
  exclusion_list : exclusion_list option;
      [@ocaml.doc
        "List of Amazon Web Services services you want to exclude from Automatic Management. You \
         won't be notified of Service Quotas utilization for Amazon Web Services services added to \
         the Automatic Management exclusion list. \n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the applied quota that you want to untag. You can get \
         this information by using the Service Quotas console, or by listing the quotas using the \
         {{:https://docs.aws.amazon.com/cli/latest/reference/service-quotas/list-service-quotas.html}list-service-quotas} \
         CLI command or the \
         {{:https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html}ListServiceQuotas} \
         Amazon Web Services API operation.\n"]
  tag_keys : input_tag_keys;
      [@ocaml.doc "The keys of the tags that you want to remove from the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "You've exceeded the number of tags allowed for a resource. For more information, see \
   {{:https://docs.aws.amazon.com/servicequotas/latest/userguide/sq-tagging.html#sq-tagging-restrictions}Tag \
   restrictions} in the {i Service Quotas User Guide}.\n"]

type nonrec tag_policy_violation_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified tag is a reserved word and cannot be used.\n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) for the applied quota. You can get this information by \
         using the Service Quotas console, or by listing the quotas using the \
         {{:https://docs.aws.amazon.com/cli/latest/reference/service-quotas/list-service-quotas.html}list-service-quotas} \
         CLI command or the \
         {{:https://docs.aws.amazon.com/servicequotas/2019-06-24/apireference/API_ListServiceQuotas.html}ListServiceQuotas} \
         Amazon Web Services API operation.\n"]
  tags : input_tags; [@ocaml.doc "The tags that you want to add to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_auto_management_response = unit [@@ocaml.doc ""]

type nonrec stop_auto_management_request = unit [@@ocaml.doc ""]

type nonrec start_quota_utilization_report_response = {
  report_id : report_id option;
      [@ocaml.doc
        "A unique identifier for the quota utilization report. Use this identifier with the \
         [GetQuotaUtilizationReport] operation to retrieve the report results.\n"]
  status : report_status option;
      [@ocaml.doc
        "The current status of the report generation. The status will be [PENDING] when the report \
         is first initiated.\n"]
  message : report_message option;
      [@ocaml.doc
        "An optional message providing additional information about the report generation status. \
         This field may contain details about the report initiation or indicate if an existing \
         recent report is being reused.\n"]
}
[@@ocaml.doc ""]

type nonrec start_quota_utilization_report_request = unit [@@ocaml.doc ""]

type nonrec start_auto_management_response = unit [@@ocaml.doc ""]

type nonrec start_auto_management_request = {
  opt_in_level : opt_in_level;
      [@ocaml.doc
        "Sets the opt-in level for Automatic Management. Only Amazon Web Services account level is \
         supported.\n"]
  opt_in_type : opt_in_type;
      [@ocaml.doc
        "Sets the opt-in type for Automatic Management. There are two modes: Notify only and \
         Notify and Auto-Adjust. Currently, only NotifyOnly is available.\n"]
  notification_arn : amazon_resource_name option;
      [@ocaml.doc
        "The \
         {{:https://docs.aws.amazon.com/notifications/latest/userguide/resource-level-permissions.html#rlp-table}User \
         Notifications} Amazon Resource Name (ARN) for Automatic Management notifications.\n"]
  exclusion_list : exclusion_list option;
      [@ocaml.doc
        "List of Amazon Web Services services excluded from Automatic Management. You won't be \
         notified of Service Quotas utilization for Amazon Web Services services added to the \
         Automatic Management exclusion list. \n"]
}
[@@ocaml.doc ""]
