open Smaws_Lib.Json.SerializeHelpers
open Types

let accept_language_to_yojson (x : accept_language) = match x with EN_US -> `String "EN_US"
let sanitized_string_to_yojson = string_to_yojson
let additional_metrics_list_to_yojson tree = list_to_yojson sanitized_string_to_yojson tree
let double_to_yojson = double_to_yojson
let request_string_to_yojson = string_to_yojson

let additional_metrics_map_to_yojson tree =
  map_to_yojson request_string_to_yojson double_to_yojson tree

let amazon_resource_name_to_yojson = string_to_yojson
let descriptive_string_to_yojson = string_to_yojson

let descriptive_map_to_yojson tree =
  map_to_yojson descriptive_string_to_yojson descriptive_string_to_yojson tree

let performance_insights_metric_to_yojson (x : performance_insights_metric) =
  assoc_to_yojson
    [
      ("Metric", option_to_yojson descriptive_string_to_yojson x.metric);
      ("DisplayName", option_to_yojson descriptive_string_to_yojson x.display_name);
      ("Dimensions", option_to_yojson descriptive_map_to_yojson x.dimensions);
      ("Filter", option_to_yojson descriptive_map_to_yojson x.filter);
      ("Value", option_to_yojson double_to_yojson x.value);
    ]

let data_to_yojson (x : data) =
  assoc_to_yojson
    [
      ( "PerformanceInsightsMetric",
        option_to_yojson performance_insights_metric_to_yojson x.performance_insights_metric );
    ]

let data_list_to_yojson tree = list_to_yojson data_to_yojson tree
let markdown_string_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let recommendation_to_yojson (x : recommendation) =
  assoc_to_yojson
    [
      ("RecommendationId", option_to_yojson string__to_yojson x.recommendation_id);
      ( "RecommendationDescription",
        option_to_yojson markdown_string_to_yojson x.recommendation_description );
      ("RecommendationDetails", option_to_yojson markdown_string_to_yojson x.recommendation_details);
    ]

let recommendation_list_to_yojson tree = list_to_yojson recommendation_to_yojson tree

let severity_to_yojson (x : severity) =
  match x with LOW -> `String "LOW" | MEDIUM -> `String "MEDIUM" | HIGH -> `String "HIGH"

let iso_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let context_type_to_yojson (x : context_type) =
  match x with CAUSAL -> `String "CAUSAL" | CONTEXTUAL -> `String "CONTEXTUAL"

let rec insight_list_to_yojson tree = list_to_yojson insight_to_yojson tree

and insight_to_yojson (x : insight) =
  assoc_to_yojson
    [
      ("InsightId", Some (string__to_yojson x.insight_id));
      ("InsightType", option_to_yojson string__to_yojson x.insight_type);
      ("Context", option_to_yojson context_type_to_yojson x.context);
      ("StartTime", option_to_yojson iso_timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson iso_timestamp_to_yojson x.end_time);
      ("Severity", option_to_yojson severity_to_yojson x.severity);
      ("SupportingInsights", option_to_yojson insight_list_to_yojson x.supporting_insights);
      ("Description", option_to_yojson markdown_string_to_yojson x.description);
      ("Recommendations", option_to_yojson recommendation_list_to_yojson x.recommendations);
      ("InsightData", option_to_yojson data_list_to_yojson x.insight_data);
      ("BaselineData", option_to_yojson data_list_to_yojson x.baseline_data);
    ]

let analysis_status_to_yojson (x : analysis_status) =
  match x with
  | RUNNING -> `String "RUNNING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"

let service_type_to_yojson (x : service_type) =
  match x with RDS -> `String "RDS" | DOCDB -> `String "DOCDB"

let identifier_string_to_yojson = string_to_yojson
let analysis_report_id_to_yojson = string_to_yojson

let analysis_report_to_yojson (x : analysis_report) =
  assoc_to_yojson
    [
      ("AnalysisReportId", Some (analysis_report_id_to_yojson x.analysis_report_id));
      ("Identifier", option_to_yojson identifier_string_to_yojson x.identifier);
      ("ServiceType", option_to_yojson service_type_to_yojson x.service_type);
      ("CreateTime", option_to_yojson iso_timestamp_to_yojson x.create_time);
      ("StartTime", option_to_yojson iso_timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson iso_timestamp_to_yojson x.end_time);
      ("Status", option_to_yojson analysis_status_to_yojson x.status);
      ("Insights", option_to_yojson insight_list_to_yojson x.insights);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let analysis_report_summary_to_yojson (x : analysis_report_summary) =
  assoc_to_yojson
    [
      ("AnalysisReportId", option_to_yojson string__to_yojson x.analysis_report_id);
      ("CreateTime", option_to_yojson iso_timestamp_to_yojson x.create_time);
      ("StartTime", option_to_yojson iso_timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson iso_timestamp_to_yojson x.end_time);
      ("Status", option_to_yojson analysis_status_to_yojson x.status);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let analysis_report_summary_list_to_yojson tree =
  list_to_yojson analysis_report_summary_to_yojson tree

let fine_grained_action_to_yojson (x : fine_grained_action) =
  match x with
  | DESCRIBE_DIMENSION_KEYS -> `String "DescribeDimensionKeys"
  | GET_DIMENSION_KEY_DETAILS -> `String "GetDimensionKeyDetails"
  | GET_RESOURCE_METRICS -> `String "GetResourceMetrics"

let authorized_actions_list_to_yojson tree = list_to_yojson fine_grained_action_to_yojson tree
let boolean__to_yojson = bool_to_yojson
let error_string_to_yojson = string_to_yojson

let not_authorized_exception_to_yojson (x : not_authorized_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_string_to_yojson x.message) ]

let invalid_argument_exception_to_yojson (x : invalid_argument_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_string_to_yojson x.message) ]

let internal_service_error_to_yojson (x : internal_service_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_string_to_yojson x.message) ]

let create_performance_analysis_report_response_to_yojson
    (x : create_performance_analysis_report_response) =
  assoc_to_yojson
    [ ("AnalysisReportId", option_to_yojson analysis_report_id_to_yojson x.analysis_report_id) ]

let create_performance_analysis_report_request_to_yojson
    (x : create_performance_analysis_report_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("StartTime", Some (iso_timestamp_to_yojson x.start_time));
      ("EndTime", option_to_yojson iso_timestamp_to_yojson x.end_time);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let data_point_to_yojson (x : data_point) =
  assoc_to_yojson
    [
      ("Timestamp", Some (iso_timestamp_to_yojson x.timestamp));
      ("Value", Some (double_to_yojson x.value));
    ]

let data_points_list_to_yojson tree = list_to_yojson data_point_to_yojson tree
let delete_performance_analysis_report_response_to_yojson = unit_to_yojson

let delete_performance_analysis_report_request_to_yojson
    (x : delete_performance_analysis_report_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("AnalysisReportId", Some (analysis_report_id_to_yojson x.analysis_report_id));
    ]

let next_token_to_yojson = string_to_yojson
let metric_values_list_to_yojson tree = list_to_yojson double_to_yojson tree

let dimension_map_to_yojson tree =
  map_to_yojson request_string_to_yojson request_string_to_yojson tree

let dimension_key_description_to_yojson (x : dimension_key_description) =
  assoc_to_yojson
    [
      ("Dimensions", option_to_yojson dimension_map_to_yojson x.dimensions);
      ("Total", option_to_yojson double_to_yojson x.total);
      ("AdditionalMetrics", option_to_yojson additional_metrics_map_to_yojson x.additional_metrics);
      ("Partitions", option_to_yojson metric_values_list_to_yojson x.partitions);
    ]

let dimension_key_description_list_to_yojson tree =
  list_to_yojson dimension_key_description_to_yojson tree

let response_partition_key_to_yojson (x : response_partition_key) =
  assoc_to_yojson [ ("Dimensions", Some (dimension_map_to_yojson x.dimensions)) ]

let response_partition_key_list_to_yojson tree =
  list_to_yojson response_partition_key_to_yojson tree

let describe_dimension_keys_response_to_yojson (x : describe_dimension_keys_response) =
  assoc_to_yojson
    [
      ("AlignedStartTime", option_to_yojson iso_timestamp_to_yojson x.aligned_start_time);
      ("AlignedEndTime", option_to_yojson iso_timestamp_to_yojson x.aligned_end_time);
      ("PartitionKeys", option_to_yojson response_partition_key_list_to_yojson x.partition_keys);
      ("Keys", option_to_yojson dimension_key_description_list_to_yojson x.keys);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let metric_query_filter_map_to_yojson tree =
  map_to_yojson sanitized_string_to_yojson request_string_to_yojson tree

let limit_to_yojson = int_to_yojson
let sanitized_string_list_to_yojson tree = list_to_yojson sanitized_string_to_yojson tree

let dimension_group_to_yojson (x : dimension_group) =
  assoc_to_yojson
    [
      ("Group", Some (sanitized_string_to_yojson x.group));
      ("Dimensions", option_to_yojson sanitized_string_list_to_yojson x.dimensions);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
    ]

let integer_to_yojson = int_to_yojson

let describe_dimension_keys_request_to_yojson (x : describe_dimension_keys_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("StartTime", Some (iso_timestamp_to_yojson x.start_time));
      ("EndTime", Some (iso_timestamp_to_yojson x.end_time));
      ("Metric", Some (request_string_to_yojson x.metric));
      ("PeriodInSeconds", option_to_yojson integer_to_yojson x.period_in_seconds);
      ("GroupBy", Some (dimension_group_to_yojson x.group_by));
      ("AdditionalMetrics", option_to_yojson additional_metrics_list_to_yojson x.additional_metrics);
      ("PartitionBy", option_to_yojson dimension_group_to_yojson x.partition_by);
      ("Filter", option_to_yojson metric_query_filter_map_to_yojson x.filter);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let description_to_yojson = string_to_yojson

let detail_status_to_yojson (x : detail_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | PROCESSING -> `String "PROCESSING"
  | UNAVAILABLE -> `String "UNAVAILABLE"

let dimension_detail_to_yojson (x : dimension_detail) =
  assoc_to_yojson [ ("Identifier", option_to_yojson string__to_yojson x.identifier) ]

let dimension_detail_list_to_yojson tree = list_to_yojson dimension_detail_to_yojson tree

let dimension_group_detail_to_yojson (x : dimension_group_detail) =
  assoc_to_yojson
    [
      ("Group", option_to_yojson string__to_yojson x.group);
      ("Dimensions", option_to_yojson dimension_detail_list_to_yojson x.dimensions);
    ]

let dimension_group_detail_list_to_yojson tree =
  list_to_yojson dimension_group_detail_to_yojson tree

let dimension_key_detail_to_yojson (x : dimension_key_detail) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson string__to_yojson x.value);
      ("Dimension", option_to_yojson string__to_yojson x.dimension);
      ("Status", option_to_yojson detail_status_to_yojson x.status);
    ]

let dimension_key_detail_list_to_yojson tree = list_to_yojson dimension_key_detail_to_yojson tree
let dimensions_metric_list_to_yojson tree = list_to_yojson sanitized_string_to_yojson tree

let feature_status_to_yojson (x : feature_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"
  | UNSUPPORTED -> `String "UNSUPPORTED"
  | ENABLED_PENDING_REBOOT -> `String "ENABLED_PENDING_REBOOT"
  | DISABLED_PENDING_REBOOT -> `String "DISABLED_PENDING_REBOOT"
  | UNKNOWN -> `String "UNKNOWN"

let feature_metadata_to_yojson (x : feature_metadata) =
  assoc_to_yojson [ ("Status", option_to_yojson feature_status_to_yojson x.status) ]

let feature_metadata_map_to_yojson tree =
  map_to_yojson string__to_yojson feature_metadata_to_yojson tree

let get_dimension_key_details_response_to_yojson (x : get_dimension_key_details_response) =
  assoc_to_yojson
    [ ("Dimensions", option_to_yojson dimension_key_detail_list_to_yojson x.dimensions) ]

let requested_dimension_list_to_yojson tree = list_to_yojson sanitized_string_to_yojson tree

let get_dimension_key_details_request_to_yojson (x : get_dimension_key_details_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("Group", Some (request_string_to_yojson x.group));
      ("GroupIdentifier", Some (request_string_to_yojson x.group_identifier));
      ( "RequestedDimensions",
        option_to_yojson requested_dimension_list_to_yojson x.requested_dimensions );
    ]

let get_performance_analysis_report_response_to_yojson
    (x : get_performance_analysis_report_response) =
  assoc_to_yojson
    [ ("AnalysisReport", option_to_yojson analysis_report_to_yojson x.analysis_report) ]

let text_format_to_yojson (x : text_format) =
  match x with PLAIN_TEXT -> `String "PLAIN_TEXT" | MARKDOWN -> `String "MARKDOWN"

let get_performance_analysis_report_request_to_yojson (x : get_performance_analysis_report_request)
    =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("AnalysisReportId", Some (analysis_report_id_to_yojson x.analysis_report_id));
      ("TextFormat", option_to_yojson text_format_to_yojson x.text_format);
      ("AcceptLanguage", option_to_yojson accept_language_to_yojson x.accept_language);
    ]

let get_resource_metadata_response_to_yojson (x : get_resource_metadata_response) =
  assoc_to_yojson
    [
      ("Identifier", option_to_yojson string__to_yojson x.identifier);
      ("Features", option_to_yojson feature_metadata_map_to_yojson x.features);
    ]

let get_resource_metadata_request_to_yojson (x : get_resource_metadata_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
    ]

let response_resource_metric_key_to_yojson (x : response_resource_metric_key) =
  assoc_to_yojson
    [
      ("Metric", Some (string__to_yojson x.metric));
      ("Dimensions", option_to_yojson dimension_map_to_yojson x.dimensions);
    ]

let metric_key_data_points_to_yojson (x : metric_key_data_points) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson response_resource_metric_key_to_yojson x.key);
      ("DataPoints", option_to_yojson data_points_list_to_yojson x.data_points);
    ]

let metric_key_data_points_list_to_yojson tree =
  list_to_yojson metric_key_data_points_to_yojson tree

let get_resource_metrics_response_to_yojson (x : get_resource_metrics_response) =
  assoc_to_yojson
    [
      ("AlignedStartTime", option_to_yojson iso_timestamp_to_yojson x.aligned_start_time);
      ("AlignedEndTime", option_to_yojson iso_timestamp_to_yojson x.aligned_end_time);
      ("Identifier", option_to_yojson string__to_yojson x.identifier);
      ("MetricList", option_to_yojson metric_key_data_points_list_to_yojson x.metric_list);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let period_alignment_to_yojson (x : period_alignment) =
  match x with END_TIME -> `String "END_TIME" | START_TIME -> `String "START_TIME"

let metric_query_to_yojson (x : metric_query) =
  assoc_to_yojson
    [
      ("Metric", Some (sanitized_string_to_yojson x.metric));
      ("GroupBy", option_to_yojson dimension_group_to_yojson x.group_by);
      ("Filter", option_to_yojson metric_query_filter_map_to_yojson x.filter);
    ]

let metric_query_list_to_yojson tree = list_to_yojson metric_query_to_yojson tree

let get_resource_metrics_request_to_yojson (x : get_resource_metrics_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("MetricQueries", Some (metric_query_list_to_yojson x.metric_queries));
      ("StartTime", Some (iso_timestamp_to_yojson x.start_time));
      ("EndTime", Some (iso_timestamp_to_yojson x.end_time));
      ("PeriodInSeconds", option_to_yojson integer_to_yojson x.period_in_seconds);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("PeriodAlignment", option_to_yojson period_alignment_to_yojson x.period_alignment);
    ]

let metric_dimension_groups_to_yojson (x : metric_dimension_groups) =
  assoc_to_yojson
    [
      ("Metric", option_to_yojson string__to_yojson x.metric);
      ("Groups", option_to_yojson dimension_group_detail_list_to_yojson x.groups);
    ]

let metric_dimensions_list_to_yojson tree = list_to_yojson metric_dimension_groups_to_yojson tree

let list_available_resource_dimensions_response_to_yojson
    (x : list_available_resource_dimensions_response) =
  assoc_to_yojson
    [
      ("MetricDimensions", option_to_yojson metric_dimensions_list_to_yojson x.metric_dimensions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_available_resource_dimensions_request_to_yojson
    (x : list_available_resource_dimensions_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("Metrics", Some (dimensions_metric_list_to_yojson x.metrics));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("AuthorizedActions", option_to_yojson authorized_actions_list_to_yojson x.authorized_actions);
    ]

let response_resource_metric_to_yojson (x : response_resource_metric) =
  assoc_to_yojson
    [
      ("Metric", option_to_yojson string__to_yojson x.metric);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Unit", option_to_yojson string__to_yojson x.unit_);
    ]

let response_resource_metric_list_to_yojson tree =
  list_to_yojson response_resource_metric_to_yojson tree

let list_available_resource_metrics_response_to_yojson
    (x : list_available_resource_metrics_response) =
  assoc_to_yojson
    [
      ("Metrics", option_to_yojson response_resource_metric_list_to_yojson x.metrics);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let metric_type_list_to_yojson tree = list_to_yojson sanitized_string_to_yojson tree

let list_available_resource_metrics_request_to_yojson (x : list_available_resource_metrics_request)
    =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("MetricTypes", Some (metric_type_list_to_yojson x.metric_types));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_performance_analysis_report_recommendations_response_to_yojson
    (x : list_performance_analysis_report_recommendations_response) =
  assoc_to_yojson
    [
      ("Recommendations", option_to_yojson recommendation_list_to_yojson x.recommendations);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let recommendation_id_list_to_yojson tree = list_to_yojson string__to_yojson tree

let list_performance_analysis_report_recommendations_request_to_yojson
    (x : list_performance_analysis_report_recommendations_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("AnalysisReportId", Some (analysis_report_id_to_yojson x.analysis_report_id));
      ("RecommendationIds", option_to_yojson recommendation_id_list_to_yojson x.recommendation_ids);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_performance_analysis_reports_response_to_yojson
    (x : list_performance_analysis_reports_response) =
  assoc_to_yojson
    [
      ("AnalysisReports", option_to_yojson analysis_report_summary_list_to_yojson x.analysis_reports);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_performance_analysis_reports_request_to_yojson
    (x : list_performance_analysis_reports_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("Identifier", Some (identifier_string_to_yojson x.identifier));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ListTags", option_to_yojson boolean__to_yojson x.list_tags);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ServiceType", Some (service_type_to_yojson x.service_type));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]
