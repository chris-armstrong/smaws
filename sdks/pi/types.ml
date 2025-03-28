open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "pi";
      endpointPrefix = "pi";
      version = "2018-02-27";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec untag_resource_response = unit
type nonrec base_unit = unit
type nonrec service_type =
  | DOCDB 
  | RDS 
type nonrec amazon_resource_name = string
type nonrec tag_key = string
type nonrec tag_key_list = string list option list
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string ;
  service_type: service_type }
type nonrec error_string = string
type nonrec not_authorized_exception = {
  message: string option }
type nonrec invalid_argument_exception = {
  message: string option }
type nonrec internal_service_error = {
  message: string option }
type nonrec text_format =
  | MARKDOWN 
  | PLAIN_TEXT 
type nonrec tag_value = string
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_list = tag list option list
type nonrec tag_resource_request =
  {
  tags: tag list ;
  resource_ar_n: string ;
  service_type: service_type }
type nonrec string_ = string
type nonrec severity =
  | HIGH 
  | MEDIUM 
  | LOW 
type nonrec sanitized_string = string
type nonrec sanitized_string_list = string list option list
type nonrec description = string
type nonrec response_resource_metric =
  {
  unit_: string option ;
  description: string option ;
  metric: string option }
type nonrec response_resource_metric_list =
  response_resource_metric list option list
type nonrec request_string = string
type nonrec dimension_map = (string_ option * string_ option) list
type nonrec response_resource_metric_key =
  {
  dimensions: (string * string) list option ;
  metric: string }
type nonrec response_partition_key = {
  dimensions: (string * string) list }
type nonrec response_partition_key_list =
  response_partition_key list option list
type nonrec requested_dimension_list = string list option list
type nonrec markdown_string = string
type nonrec recommendation =
  {
  recommendation_description: string option ;
  recommendation_id: string option }
type nonrec recommendation_list = recommendation list option list
type nonrec period_alignment =
  | START_TIME 
  | END_TIME 
type nonrec list_tags_for_resource_response = {
  tags: tag list option }
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string ;
  service_type: service_type }
type nonrec iso_timestamp = Timestamp.t
type nonrec analysis_status =
  | FAILED 
  | SUCCEEDED 
  | RUNNING 
type nonrec analysis_report_summary =
  {
  tags: tag list option ;
  status: analysis_status option ;
  end_time: float option ;
  start_time: float option ;
  create_time: float option ;
  analysis_report_id: string option }
type nonrec analysis_report_summary_list =
  analysis_report_summary list option list
type nonrec next_token = string
type nonrec list_performance_analysis_reports_response =
  {
  next_token: string option ;
  analysis_reports: analysis_report_summary list option }
type nonrec identifier_string = string
type nonrec max_results = int
type nonrec boolean_ = bool
type nonrec list_performance_analysis_reports_request =
  {
  list_tags: bool option ;
  max_results: int option ;
  next_token: string option ;
  identifier: string ;
  service_type: service_type }
type nonrec list_available_resource_metrics_response =
  {
  next_token: string option ;
  metrics: response_resource_metric list option }
type nonrec metric_type_list = string list option list
type nonrec list_available_resource_metrics_request =
  {
  max_results: int option ;
  next_token: string option ;
  metric_types: string list ;
  identifier: string ;
  service_type: service_type }
type nonrec dimension_detail = {
  identifier: string option }
type nonrec dimension_detail_list = dimension_detail list option list
type nonrec dimension_group_detail =
  {
  dimensions: dimension_detail list option ;
  group: string option }
type nonrec dimension_group_detail_list =
  dimension_group_detail list option list
type nonrec metric_dimension_groups =
  {
  groups: dimension_group_detail list option ;
  metric: string option }
type nonrec metric_dimensions_list = metric_dimension_groups list option list
type nonrec list_available_resource_dimensions_response =
  {
  next_token: string option ;
  metric_dimensions: metric_dimension_groups list option }
type nonrec dimensions_metric_list = string list option list
type nonrec fine_grained_action =
  | GET_RESOURCE_METRICS 
  | GET_DIMENSION_KEY_DETAILS 
  | DESCRIBE_DIMENSION_KEYS 
type nonrec authorized_actions_list = fine_grained_action list option list
type nonrec list_available_resource_dimensions_request =
  {
  authorized_actions: fine_grained_action list option ;
  next_token: string option ;
  max_results: int option ;
  metrics: string list ;
  identifier: string ;
  service_type: service_type }
type nonrec double = float
type nonrec data_point = {
  value: float ;
  timestamp_: float }
type nonrec data_points_list = data_point list option list
type nonrec metric_key_data_points =
  {
  data_points: data_point list option ;
  key: response_resource_metric_key option }
type nonrec metric_key_data_points_list =
  metric_key_data_points list option list
type nonrec get_resource_metrics_response =
  {
  next_token: string option ;
  metric_list: metric_key_data_points list option ;
  identifier: string option ;
  aligned_end_time: float option ;
  aligned_start_time: float option }
type nonrec limit = int
type nonrec dimension_group =
  {
  limit: int option ;
  dimensions: string list option ;
  group: string }
type nonrec metric_query_filter_map = (string_ option * string_ option) list
type nonrec metric_query =
  {
  filter: (string * string) list option ;
  group_by: dimension_group option ;
  metric: string }
type nonrec metric_query_list = metric_query list option list
type nonrec integer_ = int
type nonrec get_resource_metrics_request =
  {
  period_alignment: period_alignment option ;
  next_token: string option ;
  max_results: int option ;
  period_in_seconds: int option ;
  end_time: float ;
  start_time: float ;
  metric_queries: metric_query list ;
  identifier: string ;
  service_type: service_type }
type nonrec feature_status =
  | UNKNOWN 
  | DISABLED_PENDING_REBOOT 
  | ENABLED_PENDING_REBOOT 
  | UNSUPPORTED 
  | DISABLED 
  | ENABLED 
type nonrec feature_metadata = {
  status: feature_status option }
type nonrec feature_metadata_map =
  (string_ option * feature_metadata option) list
type nonrec get_resource_metadata_response =
  {
  features: (string * feature_metadata) list option ;
  identifier: string option }
type nonrec get_resource_metadata_request =
  {
  identifier: string ;
  service_type: service_type }
type nonrec analysis_report_id = string
type nonrec context_type =
  | CONTEXTUAL 
  | CAUSAL 
type nonrec descriptive_string = string
type nonrec descriptive_map = (string_ option * string_ option) list
type nonrec performance_insights_metric =
  {
  value: float option ;
  dimensions: (string * string) list option ;
  display_name: string option ;
  metric: string option }
type nonrec data =
  {
  performance_insights_metric: performance_insights_metric option }
type nonrec data_list = data list option list
type insight =
  {
  baseline_data: data list option ;
  insight_data: data list option ;
  recommendations: recommendation list option ;
  description: string option ;
  supporting_insights: insight list option ;
  severity: severity option ;
  end_time: float option ;
  start_time: float option ;
  context: context_type option ;
  insight_type: string option ;
  insight_id: string }
and insight_list = insight list option list
type nonrec analysis_report =
  {
  insights: insight list option ;
  status: analysis_status option ;
  end_time: float option ;
  start_time: float option ;
  create_time: float option ;
  service_type: service_type option ;
  identifier: string option ;
  analysis_report_id: string }
type nonrec get_performance_analysis_report_response =
  {
  analysis_report: analysis_report option }
type nonrec accept_language =
  | EN_US 
type nonrec get_performance_analysis_report_request =
  {
  accept_language: accept_language option ;
  text_format: text_format option ;
  analysis_report_id: string ;
  identifier: string ;
  service_type: service_type }
type nonrec detail_status =
  | UNAVAILABLE 
  | PROCESSING 
  | AVAILABLE 
type nonrec dimension_key_detail =
  {
  status: detail_status option ;
  dimension: string option ;
  value: string option }
type nonrec dimension_key_detail_list = dimension_key_detail list option list
type nonrec get_dimension_key_details_response =
  {
  dimensions: dimension_key_detail list option }
type nonrec get_dimension_key_details_request =
  {
  requested_dimensions: string list option ;
  group_identifier: string ;
  group: string ;
  identifier: string ;
  service_type: service_type }
type nonrec additional_metrics_map = (string_ option * float_ option) list
type nonrec metric_values_list = float list option list
type nonrec dimension_key_description =
  {
  partitions: float list option ;
  additional_metrics: (string * float) list option ;
  total: float option ;
  dimensions: (string * string) list option }
type nonrec dimension_key_description_list =
  dimension_key_description list option list
type nonrec describe_dimension_keys_response =
  {
  next_token: string option ;
  keys: dimension_key_description list option ;
  partition_keys: response_partition_key list option ;
  aligned_end_time: float option ;
  aligned_start_time: float option }
type nonrec additional_metrics_list = string list option list
type nonrec describe_dimension_keys_request =
  {
  next_token: string option ;
  max_results: int option ;
  filter: (string * string) list option ;
  partition_by: dimension_group option ;
  additional_metrics: string list option ;
  group_by: dimension_group ;
  period_in_seconds: int option ;
  metric: string ;
  end_time: float ;
  start_time: float ;
  identifier: string ;
  service_type: service_type }
type nonrec delete_performance_analysis_report_response = unit
type nonrec delete_performance_analysis_report_request =
  {
  analysis_report_id: string ;
  identifier: string ;
  service_type: service_type }
type nonrec create_performance_analysis_report_response =
  {
  analysis_report_id: string option }
type nonrec create_performance_analysis_report_request =
  {
  tags: tag list option ;
  end_time: float ;
  start_time: float ;
  identifier: string ;
  service_type: service_type }
type nonrec performance_insightsv20180227 = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t