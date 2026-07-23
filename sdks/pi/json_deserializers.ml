open Smaws_Lib.Json.DeserializeHelpers
open Types

let accept_language_of_yojson (tree : t) path =
  ((match tree with
    | `String "EN_US" -> EN_US
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcceptLanguage" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceptLanguage")
     : accept_language)
    : accept_language)

let sanitized_string_of_yojson = string_of_yojson

let additional_metrics_list_of_yojson tree path =
  list_of_yojson sanitized_string_of_yojson tree path

let double_of_yojson = double_of_yojson
let request_string_of_yojson = string_of_yojson

let additional_metrics_map_of_yojson tree path =
  map_of_yojson request_string_of_yojson double_of_yojson tree path

let amazon_resource_name_of_yojson = string_of_yojson
let descriptive_string_of_yojson = string_of_yojson

let descriptive_map_of_yojson tree path =
  map_of_yojson descriptive_string_of_yojson descriptive_string_of_yojson tree path

let performance_insights_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric = option_of_yojson (value_for_key descriptive_string_of_yojson "Metric") _list path;
     display_name =
       option_of_yojson (value_for_key descriptive_string_of_yojson "DisplayName") _list path;
     dimensions = option_of_yojson (value_for_key descriptive_map_of_yojson "Dimensions") _list path;
     filter = option_of_yojson (value_for_key descriptive_map_of_yojson "Filter") _list path;
     value = option_of_yojson (value_for_key double_of_yojson "Value") _list path;
   }
    : performance_insights_metric)

let data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     performance_insights_metric =
       option_of_yojson
         (value_for_key performance_insights_metric_of_yojson "PerformanceInsightsMetric")
         _list path;
   }
    : data)

let data_list_of_yojson tree path = list_of_yojson data_of_yojson tree path
let markdown_string_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson

let recommendation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendation_id =
       option_of_yojson (value_for_key string__of_yojson "RecommendationId") _list path;
     recommendation_description =
       option_of_yojson
         (value_for_key markdown_string_of_yojson "RecommendationDescription")
         _list path;
     recommendation_details =
       option_of_yojson (value_for_key markdown_string_of_yojson "RecommendationDetails") _list path;
   }
    : recommendation)

let recommendation_list_of_yojson tree path = list_of_yojson recommendation_of_yojson tree path

let severity_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOW" -> LOW
    | `String "MEDIUM" -> MEDIUM
    | `String "HIGH" -> HIGH
    | `String value -> raise (deserialize_unknown_enum_value_error path "Severity" value)
    | _ -> raise (deserialize_wrong_type_error path "Severity")
     : severity)
    : severity)

let iso_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let context_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CAUSAL" -> CAUSAL
    | `String "CONTEXTUAL" -> CONTEXTUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContextType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContextType")
     : context_type)
    : context_type)

let rec insight_list_of_yojson tree path = list_of_yojson insight_of_yojson tree path

and insight_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     insight_id = value_for_key string__of_yojson "InsightId" _list path;
     insight_type = option_of_yojson (value_for_key string__of_yojson "InsightType") _list path;
     context = option_of_yojson (value_for_key context_type_of_yojson "Context") _list path;
     start_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "EndTime") _list path;
     severity = option_of_yojson (value_for_key severity_of_yojson "Severity") _list path;
     supporting_insights =
       option_of_yojson (value_for_key insight_list_of_yojson "SupportingInsights") _list path;
     description =
       option_of_yojson (value_for_key markdown_string_of_yojson "Description") _list path;
     recommendations =
       option_of_yojson (value_for_key recommendation_list_of_yojson "Recommendations") _list path;
     insight_data = option_of_yojson (value_for_key data_list_of_yojson "InsightData") _list path;
     baseline_data = option_of_yojson (value_for_key data_list_of_yojson "BaselineData") _list path;
   }
    : insight)

let analysis_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RUNNING" -> RUNNING
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AnalysisStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AnalysisStatus")
     : analysis_status)
    : analysis_status)

let service_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RDS" -> RDS
    | `String "DOCDB" -> DOCDB
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceType")
     : service_type)
    : service_type)

let identifier_string_of_yojson = string_of_yojson
let analysis_report_id_of_yojson = string_of_yojson

let analysis_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_report_id = value_for_key analysis_report_id_of_yojson "AnalysisReportId" _list path;
     identifier =
       option_of_yojson (value_for_key identifier_string_of_yojson "Identifier") _list path;
     service_type = option_of_yojson (value_for_key service_type_of_yojson "ServiceType") _list path;
     create_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "CreateTime") _list path;
     start_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "EndTime") _list path;
     status = option_of_yojson (value_for_key analysis_status_of_yojson "Status") _list path;
     insights = option_of_yojson (value_for_key insight_list_of_yojson "Insights") _list path;
   }
    : analysis_report)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let analysis_report_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_report_id =
       option_of_yojson (value_for_key string__of_yojson "AnalysisReportId") _list path;
     create_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "CreateTime") _list path;
     start_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "EndTime") _list path;
     status = option_of_yojson (value_for_key analysis_status_of_yojson "Status") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : analysis_report_summary)

let analysis_report_summary_list_of_yojson tree path =
  list_of_yojson analysis_report_summary_of_yojson tree path

let fine_grained_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "DescribeDimensionKeys" -> DESCRIBE_DIMENSION_KEYS
    | `String "GetDimensionKeyDetails" -> GET_DIMENSION_KEY_DETAILS
    | `String "GetResourceMetrics" -> GET_RESOURCE_METRICS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FineGrainedAction" value)
    | _ -> raise (deserialize_wrong_type_error path "FineGrainedAction")
     : fine_grained_action)
    : fine_grained_action)

let authorized_actions_list_of_yojson tree path =
  list_of_yojson fine_grained_action_of_yojson tree path

let boolean__of_yojson = bool_of_yojson
let error_string_of_yojson = string_of_yojson

let not_authorized_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_string_of_yojson "Message") _list path }
    : not_authorized_exception)

let invalid_argument_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_string_of_yojson "Message") _list path }
    : invalid_argument_exception)

let internal_service_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_string_of_yojson "Message") _list path }
    : internal_service_error)

let create_performance_analysis_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_report_id =
       option_of_yojson (value_for_key analysis_report_id_of_yojson "AnalysisReportId") _list path;
   }
    : create_performance_analysis_report_response)

let create_performance_analysis_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     start_time = value_for_key iso_timestamp_of_yojson "StartTime" _list path;
     end_time = option_of_yojson (value_for_key iso_timestamp_of_yojson "EndTime") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
   }
    : create_performance_analysis_report_request)

let data_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp = value_for_key iso_timestamp_of_yojson "Timestamp" _list path;
     value = value_for_key double_of_yojson "Value" _list path;
   }
    : data_point)

let data_points_list_of_yojson tree path = list_of_yojson data_point_of_yojson tree path

let delete_performance_analysis_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_performance_analysis_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     analysis_report_id = value_for_key analysis_report_id_of_yojson "AnalysisReportId" _list path;
   }
    : delete_performance_analysis_report_request)

let next_token_of_yojson = string_of_yojson
let metric_values_list_of_yojson tree path = list_of_yojson double_of_yojson tree path

let dimension_map_of_yojson tree path =
  map_of_yojson request_string_of_yojson request_string_of_yojson tree path

let dimension_key_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimensions = option_of_yojson (value_for_key dimension_map_of_yojson "Dimensions") _list path;
     total = option_of_yojson (value_for_key double_of_yojson "Total") _list path;
     additional_metrics =
       option_of_yojson
         (value_for_key additional_metrics_map_of_yojson "AdditionalMetrics")
         _list path;
     partitions =
       option_of_yojson (value_for_key metric_values_list_of_yojson "Partitions") _list path;
   }
    : dimension_key_description)

let dimension_key_description_list_of_yojson tree path =
  list_of_yojson dimension_key_description_of_yojson tree path

let response_partition_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dimensions = value_for_key dimension_map_of_yojson "Dimensions" _list path }
    : response_partition_key)

let response_partition_key_list_of_yojson tree path =
  list_of_yojson response_partition_key_of_yojson tree path

let describe_dimension_keys_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aligned_start_time =
       option_of_yojson (value_for_key iso_timestamp_of_yojson "AlignedStartTime") _list path;
     aligned_end_time =
       option_of_yojson (value_for_key iso_timestamp_of_yojson "AlignedEndTime") _list path;
     partition_keys =
       option_of_yojson
         (value_for_key response_partition_key_list_of_yojson "PartitionKeys")
         _list path;
     keys =
       option_of_yojson (value_for_key dimension_key_description_list_of_yojson "Keys") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_dimension_keys_response)

let max_results_of_yojson = int_of_yojson

let metric_query_filter_map_of_yojson tree path =
  map_of_yojson sanitized_string_of_yojson request_string_of_yojson tree path

let limit_of_yojson = int_of_yojson
let sanitized_string_list_of_yojson tree path = list_of_yojson sanitized_string_of_yojson tree path

let dimension_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group = value_for_key sanitized_string_of_yojson "Group" _list path;
     dimensions =
       option_of_yojson (value_for_key sanitized_string_list_of_yojson "Dimensions") _list path;
     limit = option_of_yojson (value_for_key limit_of_yojson "Limit") _list path;
   }
    : dimension_group)

let integer_of_yojson = int_of_yojson

let describe_dimension_keys_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     start_time = value_for_key iso_timestamp_of_yojson "StartTime" _list path;
     end_time = value_for_key iso_timestamp_of_yojson "EndTime" _list path;
     metric = value_for_key request_string_of_yojson "Metric" _list path;
     period_in_seconds =
       option_of_yojson (value_for_key integer_of_yojson "PeriodInSeconds") _list path;
     group_by = value_for_key dimension_group_of_yojson "GroupBy" _list path;
     additional_metrics =
       option_of_yojson
         (value_for_key additional_metrics_list_of_yojson "AdditionalMetrics")
         _list path;
     partition_by =
       option_of_yojson (value_for_key dimension_group_of_yojson "PartitionBy") _list path;
     filter = option_of_yojson (value_for_key metric_query_filter_map_of_yojson "Filter") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_dimension_keys_request)

let description_of_yojson = string_of_yojson

let detail_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "PROCESSING" -> PROCESSING
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "DetailStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DetailStatus")
     : detail_status)
    : detail_status)

let dimension_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = option_of_yojson (value_for_key string__of_yojson "Identifier") _list path }
    : dimension_detail)

let dimension_detail_list_of_yojson tree path = list_of_yojson dimension_detail_of_yojson tree path

let dimension_group_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group = option_of_yojson (value_for_key string__of_yojson "Group") _list path;
     dimensions =
       option_of_yojson (value_for_key dimension_detail_list_of_yojson "Dimensions") _list path;
   }
    : dimension_group_detail)

let dimension_group_detail_list_of_yojson tree path =
  list_of_yojson dimension_group_detail_of_yojson tree path

let dimension_key_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key string__of_yojson "Value") _list path;
     dimension = option_of_yojson (value_for_key string__of_yojson "Dimension") _list path;
     status = option_of_yojson (value_for_key detail_status_of_yojson "Status") _list path;
   }
    : dimension_key_detail)

let dimension_key_detail_list_of_yojson tree path =
  list_of_yojson dimension_key_detail_of_yojson tree path

let dimensions_metric_list_of_yojson tree path = list_of_yojson sanitized_string_of_yojson tree path

let feature_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String "UNSUPPORTED" -> UNSUPPORTED
    | `String "ENABLED_PENDING_REBOOT" -> ENABLED_PENDING_REBOOT
    | `String "DISABLED_PENDING_REBOOT" -> DISABLED_PENDING_REBOOT
    | `String "UNKNOWN" -> UNKNOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "FeatureStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "FeatureStatus")
     : feature_status)
    : feature_status)

let feature_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = option_of_yojson (value_for_key feature_status_of_yojson "Status") _list path }
    : feature_metadata)

let feature_metadata_map_of_yojson tree path =
  map_of_yojson string__of_yojson feature_metadata_of_yojson tree path

let get_dimension_key_details_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimensions =
       option_of_yojson (value_for_key dimension_key_detail_list_of_yojson "Dimensions") _list path;
   }
    : get_dimension_key_details_response)

let requested_dimension_list_of_yojson tree path =
  list_of_yojson sanitized_string_of_yojson tree path

let get_dimension_key_details_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     group = value_for_key request_string_of_yojson "Group" _list path;
     group_identifier = value_for_key request_string_of_yojson "GroupIdentifier" _list path;
     requested_dimensions =
       option_of_yojson
         (value_for_key requested_dimension_list_of_yojson "RequestedDimensions")
         _list path;
   }
    : get_dimension_key_details_request)

let get_performance_analysis_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_report =
       option_of_yojson (value_for_key analysis_report_of_yojson "AnalysisReport") _list path;
   }
    : get_performance_analysis_report_response)

let text_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "PLAIN_TEXT" -> PLAIN_TEXT
    | `String "MARKDOWN" -> MARKDOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "TextFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "TextFormat")
     : text_format)
    : text_format)

let get_performance_analysis_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     analysis_report_id = value_for_key analysis_report_id_of_yojson "AnalysisReportId" _list path;
     text_format = option_of_yojson (value_for_key text_format_of_yojson "TextFormat") _list path;
     accept_language =
       option_of_yojson (value_for_key accept_language_of_yojson "AcceptLanguage") _list path;
   }
    : get_performance_analysis_report_request)

let get_resource_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier = option_of_yojson (value_for_key string__of_yojson "Identifier") _list path;
     features =
       option_of_yojson (value_for_key feature_metadata_map_of_yojson "Features") _list path;
   }
    : get_resource_metadata_response)

let get_resource_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
   }
    : get_resource_metadata_request)

let response_resource_metric_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric = value_for_key string__of_yojson "Metric" _list path;
     dimensions = option_of_yojson (value_for_key dimension_map_of_yojson "Dimensions") _list path;
   }
    : response_resource_metric_key)

let metric_key_data_points_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key response_resource_metric_key_of_yojson "Key") _list path;
     data_points =
       option_of_yojson (value_for_key data_points_list_of_yojson "DataPoints") _list path;
   }
    : metric_key_data_points)

let metric_key_data_points_list_of_yojson tree path =
  list_of_yojson metric_key_data_points_of_yojson tree path

let get_resource_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aligned_start_time =
       option_of_yojson (value_for_key iso_timestamp_of_yojson "AlignedStartTime") _list path;
     aligned_end_time =
       option_of_yojson (value_for_key iso_timestamp_of_yojson "AlignedEndTime") _list path;
     identifier = option_of_yojson (value_for_key string__of_yojson "Identifier") _list path;
     metric_list =
       option_of_yojson
         (value_for_key metric_key_data_points_list_of_yojson "MetricList")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : get_resource_metrics_response)

let period_alignment_of_yojson (tree : t) path =
  ((match tree with
    | `String "END_TIME" -> END_TIME
    | `String "START_TIME" -> START_TIME
    | `String value -> raise (deserialize_unknown_enum_value_error path "PeriodAlignment" value)
    | _ -> raise (deserialize_wrong_type_error path "PeriodAlignment")
     : period_alignment)
    : period_alignment)

let metric_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric = value_for_key sanitized_string_of_yojson "Metric" _list path;
     group_by = option_of_yojson (value_for_key dimension_group_of_yojson "GroupBy") _list path;
     filter = option_of_yojson (value_for_key metric_query_filter_map_of_yojson "Filter") _list path;
   }
    : metric_query)

let metric_query_list_of_yojson tree path = list_of_yojson metric_query_of_yojson tree path

let get_resource_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     metric_queries = value_for_key metric_query_list_of_yojson "MetricQueries" _list path;
     start_time = value_for_key iso_timestamp_of_yojson "StartTime" _list path;
     end_time = value_for_key iso_timestamp_of_yojson "EndTime" _list path;
     period_in_seconds =
       option_of_yojson (value_for_key integer_of_yojson "PeriodInSeconds") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     period_alignment =
       option_of_yojson (value_for_key period_alignment_of_yojson "PeriodAlignment") _list path;
   }
    : get_resource_metrics_request)

let metric_dimension_groups_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric = option_of_yojson (value_for_key string__of_yojson "Metric") _list path;
     groups =
       option_of_yojson (value_for_key dimension_group_detail_list_of_yojson "Groups") _list path;
   }
    : metric_dimension_groups)

let metric_dimensions_list_of_yojson tree path =
  list_of_yojson metric_dimension_groups_of_yojson tree path

let list_available_resource_dimensions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_dimensions =
       option_of_yojson
         (value_for_key metric_dimensions_list_of_yojson "MetricDimensions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_available_resource_dimensions_response)

let list_available_resource_dimensions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     metrics = value_for_key dimensions_metric_list_of_yojson "Metrics" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     authorized_actions =
       option_of_yojson
         (value_for_key authorized_actions_list_of_yojson "AuthorizedActions")
         _list path;
   }
    : list_available_resource_dimensions_request)

let response_resource_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric = option_of_yojson (value_for_key string__of_yojson "Metric") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     unit_ = option_of_yojson (value_for_key string__of_yojson "Unit") _list path;
   }
    : response_resource_metric)

let response_resource_metric_list_of_yojson tree path =
  list_of_yojson response_resource_metric_of_yojson tree path

let list_available_resource_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metrics =
       option_of_yojson (value_for_key response_resource_metric_list_of_yojson "Metrics") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_available_resource_metrics_response)

let metric_type_list_of_yojson tree path = list_of_yojson sanitized_string_of_yojson tree path

let list_available_resource_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     metric_types = value_for_key metric_type_list_of_yojson "MetricTypes" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_available_resource_metrics_request)

let list_performance_analysis_report_recommendations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommendations =
       option_of_yojson (value_for_key recommendation_list_of_yojson "Recommendations") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_performance_analysis_report_recommendations_response)

let recommendation_id_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let list_performance_analysis_report_recommendations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     analysis_report_id = value_for_key analysis_report_id_of_yojson "AnalysisReportId" _list path;
     recommendation_ids =
       option_of_yojson
         (value_for_key recommendation_id_list_of_yojson "RecommendationIds")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_performance_analysis_report_recommendations_request)

let list_performance_analysis_reports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     analysis_reports =
       option_of_yojson
         (value_for_key analysis_report_summary_list_of_yojson "AnalysisReports")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_performance_analysis_reports_response)

let list_performance_analysis_reports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     identifier = value_for_key identifier_string_of_yojson "Identifier" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     list_tags = option_of_yojson (value_for_key boolean__of_yojson "ListTags") _list path;
   }
    : list_performance_analysis_reports_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : list_tags_for_resource_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_type = value_for_key service_type_of_yojson "ServiceType" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)
