open Smaws_Lib.Json.SerializeHelpers
open Types

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let integer_to_yojson = int_to_yojson

let evaluation_type_to_yojson (x : evaluation_type) =
  match x with COMPUTED -> `String "COMPUTED" | SUMMARY -> `String "SUMMARY"

let double_to_yojson = double_to_yojson

let weighted_quantile_loss_to_yojson (x : weighted_quantile_loss) =
  assoc_to_yojson
    [
      ("LossValue", option_to_yojson double_to_yojson x.loss_value);
      ("Quantile", option_to_yojson double_to_yojson x.quantile);
    ]

let weighted_quantile_losses_to_yojson tree = list_to_yojson weighted_quantile_loss_to_yojson tree
let forecast_type_to_yojson = string_to_yojson

let error_metric_to_yojson (x : error_metric) =
  assoc_to_yojson
    [
      ("MAPE", option_to_yojson double_to_yojson x.map_e);
      ("MASE", option_to_yojson double_to_yojson x.mas_e);
      ("RMSE", option_to_yojson double_to_yojson x.rms_e);
      ("WAPE", option_to_yojson double_to_yojson x.wap_e);
      ("ForecastType", option_to_yojson forecast_type_to_yojson x.forecast_type);
    ]

let error_metrics_to_yojson tree = list_to_yojson error_metric_to_yojson tree

let metrics_to_yojson (x : metrics) =
  assoc_to_yojson
    [
      ( "AverageWeightedQuantileLoss",
        option_to_yojson double_to_yojson x.average_weighted_quantile_loss );
      ("ErrorMetrics", option_to_yojson error_metrics_to_yojson x.error_metrics);
      ( "WeightedQuantileLosses",
        option_to_yojson weighted_quantile_losses_to_yojson x.weighted_quantile_losses );
      ("RMSE", option_to_yojson double_to_yojson x.rms_e);
    ]

let window_summary_to_yojson (x : window_summary) =
  assoc_to_yojson
    [
      ("Metrics", option_to_yojson metrics_to_yojson x.metrics);
      ("EvaluationType", option_to_yojson evaluation_type_to_yojson x.evaluation_type);
      ("ItemCount", option_to_yojson integer_to_yojson x.item_count);
      ("TestWindowEnd", option_to_yojson timestamp_to_yojson x.test_window_end);
      ("TestWindowStart", option_to_yojson timestamp_to_yojson x.test_window_start);
    ]

let long_arn_to_yojson = string_to_yojson
let name_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson
let status_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let what_if_forecast_summary_to_yojson (x : what_if_forecast_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("WhatIfAnalysisArn", option_to_yojson arn_to_yojson x.what_if_analysis_arn);
      ("WhatIfForecastName", option_to_yojson name_to_yojson x.what_if_forecast_name);
      ("WhatIfForecastArn", option_to_yojson long_arn_to_yojson x.what_if_forecast_arn);
    ]

let what_if_forecasts_to_yojson tree = list_to_yojson what_if_forecast_summary_to_yojson tree
let what_if_forecast_arn_list_for_export_to_yojson tree = list_to_yojson long_arn_to_yojson tree
let s3_path_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson

let s3_config_to_yojson (x : s3_config) =
  assoc_to_yojson
    [
      ("KMSKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("RoleArn", Some (arn_to_yojson x.role_arn));
      ("Path", Some (s3_path_to_yojson x.path));
    ]

let data_destination_to_yojson (x : data_destination) =
  assoc_to_yojson [ ("S3Config", Some (s3_config_to_yojson x.s3_config)) ]

let what_if_forecast_export_summary_to_yojson (x : what_if_forecast_export_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Destination", option_to_yojson data_destination_to_yojson x.destination);
      ("WhatIfForecastExportName", option_to_yojson name_to_yojson x.what_if_forecast_export_name);
      ( "WhatIfForecastArns",
        option_to_yojson what_if_forecast_arn_list_for_export_to_yojson x.what_if_forecast_arns );
      ("WhatIfForecastExportArn", option_to_yojson long_arn_to_yojson x.what_if_forecast_export_arn);
    ]

let what_if_forecast_exports_to_yojson tree =
  list_to_yojson what_if_forecast_export_summary_to_yojson tree

let what_if_analysis_summary_to_yojson (x : what_if_analysis_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ForecastArn", option_to_yojson arn_to_yojson x.forecast_arn);
      ("WhatIfAnalysisName", option_to_yojson name_to_yojson x.what_if_analysis_name);
      ("WhatIfAnalysisArn", option_to_yojson arn_to_yojson x.what_if_analysis_arn);
    ]

let what_if_analyses_to_yojson tree = list_to_yojson what_if_analysis_summary_to_yojson tree
let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree
let use_geolocation_for_time_zone_to_yojson = bool_to_yojson
let update_dataset_group_response_to_yojson = unit_to_yojson
let arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let update_dataset_group_request_to_yojson (x : update_dataset_group_request) =
  assoc_to_yojson
    [
      ("DatasetArns", Some (arn_list_to_yojson x.dataset_arns));
      ("DatasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let transformations_to_yojson tree = map_to_yojson name_to_yojson value_to_yojson tree
let parameter_value_to_yojson = string_to_yojson
let parameter_key_to_yojson = string_to_yojson

let training_parameters_to_yojson tree =
  map_to_yojson parameter_key_to_yojson parameter_value_to_yojson tree

let timestamp_format_to_yojson = string_to_yojson
let time_zone_to_yojson = string_to_yojson

let operation_to_yojson (x : operation) =
  match x with
  | DIVIDE -> `String "DIVIDE"
  | MULTIPLY -> `String "MULTIPLY"
  | SUBTRACT -> `String "SUBTRACT"
  | ADD -> `String "ADD"

let action_to_yojson (x : action) =
  assoc_to_yojson
    [
      ("Value", Some (double_to_yojson x.value));
      ("Operation", Some (operation_to_yojson x.operation));
      ("AttributeName", Some (name_to_yojson x.attribute_name));
    ]

let attribute_value_to_yojson = string_to_yojson

let condition_to_yojson (x : condition) =
  match x with
  | GREATER_THAN -> `String "GREATER_THAN"
  | LESS_THAN -> `String "LESS_THAN"
  | NOT_EQUALS -> `String "NOT_EQUALS"
  | EQUALS -> `String "EQUALS"

let time_series_condition_to_yojson (x : time_series_condition) =
  assoc_to_yojson
    [
      ("Condition", Some (condition_to_yojson x.condition));
      ("AttributeValue", Some (attribute_value_to_yojson x.attribute_value));
      ("AttributeName", Some (name_to_yojson x.attribute_name));
    ]

let time_series_conditions_to_yojson tree = list_to_yojson time_series_condition_to_yojson tree

let time_series_transformation_to_yojson (x : time_series_transformation) =
  assoc_to_yojson
    [
      ( "TimeSeriesConditions",
        option_to_yojson time_series_conditions_to_yojson x.time_series_conditions );
      ("Action", option_to_yojson action_to_yojson x.action);
    ]

let time_series_transformations_to_yojson tree =
  list_to_yojson time_series_transformation_to_yojson tree

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson [ ("S3Config", Some (s3_config_to_yojson x.s3_config)) ]

let attribute_type_to_yojson (x : attribute_type) =
  match x with
  | GEOLOCATION -> `String "geolocation"
  | TIMESTAMP -> `String "timestamp"
  | FLOAT -> `String "float"
  | INTEGER -> `String "integer"
  | STRING -> `String "string"

let schema_attribute_to_yojson (x : schema_attribute) =
  assoc_to_yojson
    [
      ("AttributeType", option_to_yojson attribute_type_to_yojson x.attribute_type);
      ("AttributeName", option_to_yojson name_to_yojson x.attribute_name);
    ]

let schema_attributes_to_yojson tree = list_to_yojson schema_attribute_to_yojson tree

let schema_to_yojson (x : schema) =
  assoc_to_yojson [ ("Attributes", option_to_yojson schema_attributes_to_yojson x.attributes) ]

let format_to_yojson = string_to_yojson

let time_series_identifiers_to_yojson (x : time_series_identifiers) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("Schema", option_to_yojson schema_to_yojson x.schema);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
    ]

let time_series_selector_to_yojson (x : time_series_selector) =
  assoc_to_yojson
    [
      ( "TimeSeriesIdentifiers",
        option_to_yojson time_series_identifiers_to_yojson x.time_series_identifiers );
    ]

let time_series_replacements_data_source_to_yojson (x : time_series_replacements_data_source) =
  assoc_to_yojson
    [
      ("TimestampFormat", option_to_yojson timestamp_format_to_yojson x.timestamp_format);
      ("Format", option_to_yojson format_to_yojson x.format);
      ("Schema", Some (schema_to_yojson x.schema));
      ("S3Config", Some (s3_config_to_yojson x.s3_config));
    ]

let time_series_granularity_to_yojson (x : time_series_granularity) =
  match x with SPECIFIC -> `String "SPECIFIC" | ALL -> `String "ALL"

let time_point_granularity_to_yojson (x : time_point_granularity) =
  match x with SPECIFIC -> `String "SPECIFIC" | ALL -> `String "ALL"

let month_to_yojson (x : month) =
  match x with
  | DECEMBER -> `String "DECEMBER"
  | NOVEMBER -> `String "NOVEMBER"
  | OCTOBER -> `String "OCTOBER"
  | SEPTEMBER -> `String "SEPTEMBER"
  | AUGUST -> `String "AUGUST"
  | JULY -> `String "JULY"
  | JUNE -> `String "JUNE"
  | MAY -> `String "MAY"
  | APRIL -> `String "APRIL"
  | MARCH -> `String "MARCH"
  | FEBRUARY -> `String "FEBRUARY"
  | JANUARY -> `String "JANUARY"

let day_of_month_to_yojson = int_to_yojson

let day_of_week_to_yojson (x : day_of_week) =
  match x with
  | SUNDAY -> `String "SUNDAY"
  | SATURDAY -> `String "SATURDAY"
  | FRIDAY -> `String "FRIDAY"
  | THURSDAY -> `String "THURSDAY"
  | WEDNESDAY -> `String "WEDNESDAY"
  | TUESDAY -> `String "TUESDAY"
  | MONDAY -> `String "MONDAY"

let hour_to_yojson = int_to_yojson

let time_alignment_boundary_to_yojson (x : time_alignment_boundary) =
  assoc_to_yojson
    [
      ("Hour", option_to_yojson hour_to_yojson x.hour);
      ("DayOfWeek", option_to_yojson day_of_week_to_yojson x.day_of_week);
      ("DayOfMonth", option_to_yojson day_of_month_to_yojson x.day_of_month);
      ("Month", option_to_yojson month_to_yojson x.month);
    ]

let test_windows_to_yojson tree = list_to_yojson window_summary_to_yojson tree

let test_window_summary_to_yojson (x : test_window_summary) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("TestWindowEnd", option_to_yojson timestamp_to_yojson x.test_window_end);
      ("TestWindowStart", option_to_yojson timestamp_to_yojson x.test_window_start);
    ]

let test_window_details_to_yojson tree = list_to_yojson test_window_summary_to_yojson tree
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("Tags", Some (tags_to_yojson x.tags)); ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let supplementary_feature_to_yojson (x : supplementary_feature) =
  assoc_to_yojson
    [ ("Value", Some (value_to_yojson x.value)); ("Name", Some (name_to_yojson x.name)) ]

let supplementary_features_to_yojson tree = list_to_yojson supplementary_feature_to_yojson tree
let string__to_yojson = string_to_yojson

let stop_resource_request_to_yojson (x : stop_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let long_to_yojson = long_to_yojson

let statistics_to_yojson (x : statistics) =
  assoc_to_yojson
    [
      ("CountNanLong", option_to_yojson long_to_yojson x.count_nan_long);
      ("CountNullLong", option_to_yojson long_to_yojson x.count_null_long);
      ("CountDistinctLong", option_to_yojson long_to_yojson x.count_distinct_long);
      ("CountLong", option_to_yojson long_to_yojson x.count_long);
      ("Stddev", option_to_yojson double_to_yojson x.stddev);
      ("Avg", option_to_yojson double_to_yojson x.avg);
      ("Max", option_to_yojson string__to_yojson x.max);
      ("Min", option_to_yojson string__to_yojson x.min);
      ("CountNan", option_to_yojson integer_to_yojson x.count_nan);
      ("CountNull", option_to_yojson integer_to_yojson x.count_null);
      ("CountDistinct", option_to_yojson integer_to_yojson x.count_distinct);
      ("Count", option_to_yojson integer_to_yojson x.count);
    ]

let state_to_yojson (x : state) =
  match x with Deleted -> `String "Deleted" | Active -> `String "Active"

let scaling_type_to_yojson (x : scaling_type) =
  match x with
  | ReverseLogarithmic -> `String "ReverseLogarithmic"
  | Logarithmic -> `String "Logarithmic"
  | Linear -> `String "Linear"
  | Auto -> `String "Auto"

let resume_resource_request_to_yojson (x : resume_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let reference_predictor_summary_to_yojson (x : reference_predictor_summary) =
  assoc_to_yojson
    [
      ("State", option_to_yojson state_to_yojson x.state);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let boolean__to_yojson = bool_to_yojson

let predictor_summary_to_yojson (x : predictor_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ( "ReferencePredictorSummary",
        option_to_yojson reference_predictor_summary_to_yojson x.reference_predictor_summary );
      ("IsAutoPredictor", option_to_yojson boolean__to_yojson x.is_auto_predictor);
      ("DatasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("PredictorName", option_to_yojson name_to_yojson x.predictor_name);
      ("PredictorArn", option_to_yojson arn_to_yojson x.predictor_arn);
    ]

let predictors_to_yojson tree = list_to_yojson predictor_summary_to_yojson tree
let evaluation_state_to_yojson = string_to_yojson
let detail_to_yojson = string_to_yojson

let predictor_event_to_yojson (x : predictor_event) =
  assoc_to_yojson
    [
      ("Datetime", option_to_yojson timestamp_to_yojson x.datetime);
      ("Detail", option_to_yojson detail_to_yojson x.detail);
    ]

let monitor_data_source_to_yojson (x : monitor_data_source) =
  assoc_to_yojson
    [
      ("PredictorArn", option_to_yojson arn_to_yojson x.predictor_arn);
      ("ForecastArn", option_to_yojson arn_to_yojson x.forecast_arn);
      ("DatasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn);
    ]

let metric_name_to_yojson = string_to_yojson

let metric_result_to_yojson (x : metric_result) =
  assoc_to_yojson
    [
      ("MetricValue", option_to_yojson double_to_yojson x.metric_value);
      ("MetricName", option_to_yojson metric_name_to_yojson x.metric_name);
    ]

let metric_results_to_yojson tree = list_to_yojson metric_result_to_yojson tree
let message_to_yojson = string_to_yojson

let predictor_monitor_evaluation_to_yojson (x : predictor_monitor_evaluation) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson message_to_yojson x.message);
      ("NumItemsEvaluated", option_to_yojson long_to_yojson x.num_items_evaluated);
      ("MetricResults", option_to_yojson metric_results_to_yojson x.metric_results);
      ("MonitorDataSource", option_to_yojson monitor_data_source_to_yojson x.monitor_data_source);
      ("PredictorEvent", option_to_yojson predictor_event_to_yojson x.predictor_event);
      ("WindowEndDatetime", option_to_yojson timestamp_to_yojson x.window_end_datetime);
      ("WindowStartDatetime", option_to_yojson timestamp_to_yojson x.window_start_datetime);
      ("EvaluationState", option_to_yojson evaluation_state_to_yojson x.evaluation_state);
      ("EvaluationTime", option_to_yojson timestamp_to_yojson x.evaluation_time);
      ("MonitorArn", option_to_yojson arn_to_yojson x.monitor_arn);
      ("ResourceArn", option_to_yojson arn_to_yojson x.resource_arn);
    ]

let predictor_monitor_evaluations_to_yojson tree =
  list_to_yojson predictor_monitor_evaluation_to_yojson tree

let predictor_execution_to_yojson (x : predictor_execution) =
  assoc_to_yojson
    [
      ("TestWindows", option_to_yojson test_window_details_to_yojson x.test_windows);
      ("AlgorithmArn", option_to_yojson arn_to_yojson x.algorithm_arn);
    ]

let predictor_executions_to_yojson tree = list_to_yojson predictor_execution_to_yojson tree

let predictor_execution_details_to_yojson (x : predictor_execution_details) =
  assoc_to_yojson
    [
      ("PredictorExecutions", option_to_yojson predictor_executions_to_yojson x.predictor_executions);
    ]

let evaluation_result_to_yojson (x : evaluation_result) =
  assoc_to_yojson
    [
      ("TestWindows", option_to_yojson test_windows_to_yojson x.test_windows);
      ("AlgorithmArn", option_to_yojson arn_to_yojson x.algorithm_arn);
    ]

let predictor_evaluation_results_to_yojson tree = list_to_yojson evaluation_result_to_yojson tree

let baseline_metric_to_yojson (x : baseline_metric) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson double_to_yojson x.value);
      ("Name", option_to_yojson name_to_yojson x.name);
    ]

let baseline_metrics_to_yojson tree = list_to_yojson baseline_metric_to_yojson tree

let predictor_baseline_to_yojson (x : predictor_baseline) =
  assoc_to_yojson
    [ ("BaselineMetrics", option_to_yojson baseline_metrics_to_yojson x.baseline_metrics) ]

let predictor_backtest_export_job_summary_to_yojson (x : predictor_backtest_export_job_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Destination", option_to_yojson data_destination_to_yojson x.destination);
      ( "PredictorBacktestExportJobName",
        option_to_yojson name_to_yojson x.predictor_backtest_export_job_name );
      ( "PredictorBacktestExportJobArn",
        option_to_yojson arn_to_yojson x.predictor_backtest_export_job_arn );
    ]

let predictor_backtest_export_jobs_to_yojson tree =
  list_to_yojson predictor_backtest_export_job_summary_to_yojson tree

let categorical_parameter_range_to_yojson (x : categorical_parameter_range) =
  assoc_to_yojson
    [ ("Values", Some (values_to_yojson x.values)); ("Name", Some (name_to_yojson x.name)) ]

let categorical_parameter_ranges_to_yojson tree =
  list_to_yojson categorical_parameter_range_to_yojson tree

let continuous_parameter_range_to_yojson (x : continuous_parameter_range) =
  assoc_to_yojson
    [
      ("ScalingType", option_to_yojson scaling_type_to_yojson x.scaling_type);
      ("MinValue", Some (double_to_yojson x.min_value));
      ("MaxValue", Some (double_to_yojson x.max_value));
      ("Name", Some (name_to_yojson x.name));
    ]

let continuous_parameter_ranges_to_yojson tree =
  list_to_yojson continuous_parameter_range_to_yojson tree

let integer_parameter_range_to_yojson (x : integer_parameter_range) =
  assoc_to_yojson
    [
      ("ScalingType", option_to_yojson scaling_type_to_yojson x.scaling_type);
      ("MinValue", Some (integer_to_yojson x.min_value));
      ("MaxValue", Some (integer_to_yojson x.max_value));
      ("Name", Some (name_to_yojson x.name));
    ]

let integer_parameter_ranges_to_yojson tree = list_to_yojson integer_parameter_range_to_yojson tree

let parameter_ranges_to_yojson (x : parameter_ranges) =
  assoc_to_yojson
    [
      ( "IntegerParameterRanges",
        option_to_yojson integer_parameter_ranges_to_yojson x.integer_parameter_ranges );
      ( "ContinuousParameterRanges",
        option_to_yojson continuous_parameter_ranges_to_yojson x.continuous_parameter_ranges );
      ( "CategoricalParameterRanges",
        option_to_yojson categorical_parameter_ranges_to_yojson x.categorical_parameter_ranges );
    ]

let optimization_metric_to_yojson (x : optimization_metric) =
  match x with
  | MAPE -> `String "MAPE"
  | MASE -> `String "MASE"
  | AverageWeightedQuantileLoss -> `String "AverageWeightedQuantileLoss"
  | RMSE -> `String "RMSE"
  | WAPE -> `String "WAPE"

let next_token_to_yojson = string_to_yojson

let monitor_summary_to_yojson (x : monitor_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ResourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("MonitorName", option_to_yojson name_to_yojson x.monitor_name);
      ("MonitorArn", option_to_yojson arn_to_yojson x.monitor_arn);
    ]

let monitors_to_yojson tree = list_to_yojson monitor_summary_to_yojson tree

let monitor_info_to_yojson (x : monitor_info) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ("MonitorArn", option_to_yojson arn_to_yojson x.monitor_arn);
    ]

let monitor_config_to_yojson (x : monitor_config) =
  assoc_to_yojson [ ("MonitorName", Some (name_to_yojson x.monitor_name)) ]

let max_results_to_yojson = int_to_yojson
let long_arn_list_to_yojson tree = list_to_yojson long_arn_to_yojson tree
let local_date_time_to_yojson = string_to_yojson

let list_what_if_forecasts_response_to_yojson (x : list_what_if_forecasts_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("WhatIfForecasts", option_to_yojson what_if_forecasts_to_yojson x.what_if_forecasts);
    ]

let filter_condition_string_to_yojson (x : filter_condition_string) =
  match x with IS_NOT -> `String "IS_NOT" | IS -> `String "IS"

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Condition", Some (filter_condition_string_to_yojson x.condition));
      ("Value", Some (arn_to_yojson x.value));
      ("Key", Some (string__to_yojson x.key));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let list_what_if_forecasts_request_to_yojson (x : list_what_if_forecasts_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let list_what_if_forecast_exports_response_to_yojson (x : list_what_if_forecast_exports_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "WhatIfForecastExports",
        option_to_yojson what_if_forecast_exports_to_yojson x.what_if_forecast_exports );
    ]

let list_what_if_forecast_exports_request_to_yojson (x : list_what_if_forecast_exports_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_what_if_analyses_response_to_yojson (x : list_what_if_analyses_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("WhatIfAnalyses", option_to_yojson what_if_analyses_to_yojson x.what_if_analyses);
    ]

let list_what_if_analyses_request_to_yojson (x : list_what_if_analyses_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let list_predictors_response_to_yojson (x : list_predictors_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Predictors", option_to_yojson predictors_to_yojson x.predictors);
    ]

let list_predictors_request_to_yojson (x : list_predictors_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_predictor_backtest_export_jobs_response_to_yojson
    (x : list_predictor_backtest_export_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "PredictorBacktestExportJobs",
        option_to_yojson predictor_backtest_export_jobs_to_yojson x.predictor_backtest_export_jobs
      );
    ]

let list_predictor_backtest_export_jobs_request_to_yojson
    (x : list_predictor_backtest_export_jobs_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_monitors_response_to_yojson (x : list_monitors_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Monitors", option_to_yojson monitors_to_yojson x.monitors);
    ]

let list_monitors_request_to_yojson (x : list_monitors_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_monitor_evaluations_response_to_yojson (x : list_monitor_evaluations_response) =
  assoc_to_yojson
    [
      ( "PredictorMonitorEvaluations",
        option_to_yojson predictor_monitor_evaluations_to_yojson x.predictor_monitor_evaluations );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_monitor_evaluations_request_to_yojson (x : list_monitor_evaluations_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MonitorArn", Some (arn_to_yojson x.monitor_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let forecast_summary_to_yojson (x : forecast_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("DatasetGroupArn", option_to_yojson string__to_yojson x.dataset_group_arn);
      ( "CreatedUsingAutoPredictor",
        option_to_yojson boolean__to_yojson x.created_using_auto_predictor );
      ("PredictorArn", option_to_yojson string__to_yojson x.predictor_arn);
      ("ForecastName", option_to_yojson name_to_yojson x.forecast_name);
      ("ForecastArn", option_to_yojson arn_to_yojson x.forecast_arn);
    ]

let forecasts_to_yojson tree = list_to_yojson forecast_summary_to_yojson tree

let list_forecasts_response_to_yojson (x : list_forecasts_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Forecasts", option_to_yojson forecasts_to_yojson x.forecasts);
    ]

let list_forecasts_request_to_yojson (x : list_forecasts_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let forecast_export_job_summary_to_yojson (x : forecast_export_job_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Destination", option_to_yojson data_destination_to_yojson x.destination);
      ("ForecastExportJobName", option_to_yojson name_to_yojson x.forecast_export_job_name);
      ("ForecastExportJobArn", option_to_yojson arn_to_yojson x.forecast_export_job_arn);
    ]

let forecast_export_jobs_to_yojson tree = list_to_yojson forecast_export_job_summary_to_yojson tree

let list_forecast_export_jobs_response_to_yojson (x : list_forecast_export_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ForecastExportJobs", option_to_yojson forecast_export_jobs_to_yojson x.forecast_export_jobs);
    ]

let list_forecast_export_jobs_request_to_yojson (x : list_forecast_export_jobs_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let explainability_export_summary_to_yojson (x : explainability_export_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Destination", option_to_yojson data_destination_to_yojson x.destination);
      ("ExplainabilityExportName", option_to_yojson name_to_yojson x.explainability_export_name);
      ("ExplainabilityExportArn", option_to_yojson arn_to_yojson x.explainability_export_arn);
    ]

let explainability_exports_to_yojson tree =
  list_to_yojson explainability_export_summary_to_yojson tree

let list_explainability_exports_response_to_yojson (x : list_explainability_exports_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ExplainabilityExports",
        option_to_yojson explainability_exports_to_yojson x.explainability_exports );
    ]

let list_explainability_exports_request_to_yojson (x : list_explainability_exports_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let explainability_config_to_yojson (x : explainability_config) =
  assoc_to_yojson
    [
      ("TimePointGranularity", Some (time_point_granularity_to_yojson x.time_point_granularity));
      ("TimeSeriesGranularity", Some (time_series_granularity_to_yojson x.time_series_granularity));
    ]

let explainability_summary_to_yojson (x : explainability_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ( "ExplainabilityConfig",
        option_to_yojson explainability_config_to_yojson x.explainability_config );
      ("ResourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("ExplainabilityName", option_to_yojson name_to_yojson x.explainability_name);
      ("ExplainabilityArn", option_to_yojson arn_to_yojson x.explainability_arn);
    ]

let explainabilities_to_yojson tree = list_to_yojson explainability_summary_to_yojson tree

let list_explainabilities_response_to_yojson (x : list_explainabilities_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Explainabilities", option_to_yojson explainabilities_to_yojson x.explainabilities);
    ]

let list_explainabilities_request_to_yojson (x : list_explainabilities_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let dataset_type_to_yojson (x : dataset_type) =
  match x with
  | ITEM_METADATA -> `String "ITEM_METADATA"
  | RELATED_TIME_SERIES -> `String "RELATED_TIME_SERIES"
  | TARGET_TIME_SERIES -> `String "TARGET_TIME_SERIES"

let domain_to_yojson (x : domain) =
  match x with
  | METRICS -> `String "METRICS"
  | WEB_TRAFFIC -> `String "WEB_TRAFFIC"
  | WORK_FORCE -> `String "WORK_FORCE"
  | EC2_CAPACITY -> `String "EC2_CAPACITY"
  | INVENTORY_PLANNING -> `String "INVENTORY_PLANNING"
  | CUSTOM -> `String "CUSTOM"
  | RETAIL -> `String "RETAIL"

let dataset_summary_to_yojson (x : dataset_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("DatasetName", option_to_yojson name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
    ]

let datasets_to_yojson tree = list_to_yojson dataset_summary_to_yojson tree

let list_datasets_response_to_yojson (x : list_datasets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Datasets", option_to_yojson datasets_to_yojson x.datasets);
    ]

let list_datasets_request_to_yojson (x : list_datasets_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let import_mode_to_yojson (x : import_mode) =
  match x with INCREMENTAL -> `String "INCREMENTAL" | FULL -> `String "FULL"

let dataset_import_job_summary_to_yojson (x : dataset_import_job_summary) =
  assoc_to_yojson
    [
      ("ImportMode", option_to_yojson import_mode_to_yojson x.import_mode);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("DatasetImportJobName", option_to_yojson name_to_yojson x.dataset_import_job_name);
      ("DatasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn);
    ]

let dataset_import_jobs_to_yojson tree = list_to_yojson dataset_import_job_summary_to_yojson tree

let list_dataset_import_jobs_response_to_yojson (x : list_dataset_import_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DatasetImportJobs", option_to_yojson dataset_import_jobs_to_yojson x.dataset_import_jobs);
    ]

let list_dataset_import_jobs_request_to_yojson (x : list_dataset_import_jobs_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let dataset_group_summary_to_yojson (x : dataset_group_summary) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("DatasetGroupName", option_to_yojson name_to_yojson x.dataset_group_name);
      ("DatasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let dataset_groups_to_yojson tree = list_to_yojson dataset_group_summary_to_yojson tree

let list_dataset_groups_response_to_yojson (x : list_dataset_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DatasetGroups", option_to_yojson dataset_groups_to_yojson x.dataset_groups);
    ]

let list_dataset_groups_request_to_yojson (x : list_dataset_groups_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let input_data_config_to_yojson (x : input_data_config) =
  assoc_to_yojson
    [
      ( "SupplementaryFeatures",
        option_to_yojson supplementary_features_to_yojson x.supplementary_features );
      ("DatasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
    ]

let hyper_parameter_tuning_job_config_to_yojson (x : hyper_parameter_tuning_job_config) =
  assoc_to_yojson
    [ ("ParameterRanges", option_to_yojson parameter_ranges_to_yojson x.parameter_ranges) ]

let auto_ml_override_strategy_to_yojson (x : auto_ml_override_strategy) =
  match x with
  | AccuracyOptimized -> `String "AccuracyOptimized"
  | LatencyOptimized -> `String "LatencyOptimized"

let get_accuracy_metrics_response_to_yojson (x : get_accuracy_metrics_response) =
  assoc_to_yojson
    [
      ("OptimizationMetric", option_to_yojson optimization_metric_to_yojson x.optimization_metric);
      ( "AutoMLOverrideStrategy",
        option_to_yojson auto_ml_override_strategy_to_yojson x.auto_ml_override_strategy );
      ("IsAutoPredictor", option_to_yojson boolean__to_yojson x.is_auto_predictor);
      ( "PredictorEvaluationResults",
        option_to_yojson predictor_evaluation_results_to_yojson x.predictor_evaluation_results );
    ]

let get_accuracy_metrics_request_to_yojson (x : get_accuracy_metrics_request) =
  assoc_to_yojson [ ("PredictorArn", Some (arn_to_yojson x.predictor_arn)) ]

let geolocation_format_to_yojson = string_to_yojson
let frequency_to_yojson = string_to_yojson
let forecast_types_to_yojson tree = list_to_yojson forecast_type_to_yojson tree
let forecast_dimensions_to_yojson tree = list_to_yojson name_to_yojson tree
let field_statistics_to_yojson tree = map_to_yojson string__to_yojson statistics_to_yojson tree

let featurization_method_name_to_yojson (x : featurization_method_name) =
  match x with Filling -> `String "filling"

let featurization_method_parameters_to_yojson tree =
  map_to_yojson parameter_key_to_yojson parameter_value_to_yojson tree

let featurization_method_to_yojson (x : featurization_method) =
  assoc_to_yojson
    [
      ( "FeaturizationMethodParameters",
        option_to_yojson featurization_method_parameters_to_yojson x.featurization_method_parameters
      );
      ( "FeaturizationMethodName",
        Some (featurization_method_name_to_yojson x.featurization_method_name) );
    ]

let featurization_pipeline_to_yojson tree = list_to_yojson featurization_method_to_yojson tree

let featurization_to_yojson (x : featurization) =
  assoc_to_yojson
    [
      ( "FeaturizationPipeline",
        option_to_yojson featurization_pipeline_to_yojson x.featurization_pipeline );
      ("AttributeName", Some (name_to_yojson x.attribute_name));
    ]

let featurizations_to_yojson tree = list_to_yojson featurization_to_yojson tree

let featurization_config_to_yojson (x : featurization_config) =
  assoc_to_yojson
    [
      ("Featurizations", option_to_yojson featurizations_to_yojson x.featurizations);
      ("ForecastDimensions", option_to_yojson forecast_dimensions_to_yojson x.forecast_dimensions);
      ("ForecastFrequency", Some (frequency_to_yojson x.forecast_frequency));
    ]

let explainability_info_to_yojson (x : explainability_info) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ExplainabilityArn", option_to_yojson arn_to_yojson x.explainability_arn);
    ]

let evaluation_parameters_to_yojson (x : evaluation_parameters) =
  assoc_to_yojson
    [
      ("BackTestWindowOffset", option_to_yojson integer_to_yojson x.back_test_window_offset);
      ("NumberOfBacktestWindows", option_to_yojson integer_to_yojson x.number_of_backtest_windows);
    ]

let encryption_config_to_yojson (x : encryption_config) =
  assoc_to_yojson
    [
      ("KMSKeyArn", Some (kms_key_arn_to_yojson x.kms_key_arn));
      ("RoleArn", Some (arn_to_yojson x.role_arn));
    ]

let describe_what_if_forecast_response_to_yojson (x : describe_what_if_forecast_response) =
  assoc_to_yojson
    [
      ("ForecastTypes", option_to_yojson forecast_types_to_yojson x.forecast_types);
      ( "TimeSeriesReplacementsDataSource",
        option_to_yojson time_series_replacements_data_source_to_yojson
          x.time_series_replacements_data_source );
      ( "TimeSeriesTransformations",
        option_to_yojson time_series_transformations_to_yojson x.time_series_transformations );
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson string__to_yojson x.status);
      ( "EstimatedTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_time_remaining_in_minutes );
      ("WhatIfAnalysisArn", option_to_yojson arn_to_yojson x.what_if_analysis_arn);
      ("WhatIfForecastArn", option_to_yojson long_arn_to_yojson x.what_if_forecast_arn);
      ("WhatIfForecastName", option_to_yojson name_to_yojson x.what_if_forecast_name);
    ]

let describe_what_if_forecast_request_to_yojson (x : describe_what_if_forecast_request) =
  assoc_to_yojson [ ("WhatIfForecastArn", Some (long_arn_to_yojson x.what_if_forecast_arn)) ]

let describe_what_if_forecast_export_response_to_yojson
    (x : describe_what_if_forecast_export_response) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ( "EstimatedTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_time_remaining_in_minutes );
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Destination", option_to_yojson data_destination_to_yojson x.destination);
      ("WhatIfForecastArns", option_to_yojson long_arn_list_to_yojson x.what_if_forecast_arns);
      ("WhatIfForecastExportName", option_to_yojson name_to_yojson x.what_if_forecast_export_name);
      ("WhatIfForecastExportArn", option_to_yojson long_arn_to_yojson x.what_if_forecast_export_arn);
    ]

let describe_what_if_forecast_export_request_to_yojson
    (x : describe_what_if_forecast_export_request) =
  assoc_to_yojson
    [ ("WhatIfForecastExportArn", Some (long_arn_to_yojson x.what_if_forecast_export_arn)) ]

let describe_what_if_analysis_response_to_yojson (x : describe_what_if_analysis_response) =
  assoc_to_yojson
    [
      ("TimeSeriesSelector", option_to_yojson time_series_selector_to_yojson x.time_series_selector);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson string__to_yojson x.status);
      ( "EstimatedTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_time_remaining_in_minutes );
      ("ForecastArn", option_to_yojson arn_to_yojson x.forecast_arn);
      ("WhatIfAnalysisArn", option_to_yojson arn_to_yojson x.what_if_analysis_arn);
      ("WhatIfAnalysisName", option_to_yojson name_to_yojson x.what_if_analysis_name);
    ]

let describe_what_if_analysis_request_to_yojson (x : describe_what_if_analysis_request) =
  assoc_to_yojson [ ("WhatIfAnalysisArn", Some (arn_to_yojson x.what_if_analysis_arn)) ]

let describe_predictor_response_to_yojson (x : describe_predictor_response) =
  assoc_to_yojson
    [
      ("OptimizationMetric", option_to_yojson optimization_metric_to_yojson x.optimization_metric);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("DatasetImportJobArns", option_to_yojson arn_list_to_yojson x.dataset_import_job_arns);
      ("IsAutoPredictor", option_to_yojson boolean__to_yojson x.is_auto_predictor);
      ( "EstimatedTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_time_remaining_in_minutes );
      ( "PredictorExecutionDetails",
        option_to_yojson predictor_execution_details_to_yojson x.predictor_execution_details );
      ("EncryptionConfig", option_to_yojson encryption_config_to_yojson x.encryption_config);
      ("FeaturizationConfig", option_to_yojson featurization_config_to_yojson x.featurization_config);
      ("InputDataConfig", option_to_yojson input_data_config_to_yojson x.input_data_config);
      ("HPOConfig", option_to_yojson hyper_parameter_tuning_job_config_to_yojson x.hpo_config);
      ( "EvaluationParameters",
        option_to_yojson evaluation_parameters_to_yojson x.evaluation_parameters );
      ("TrainingParameters", option_to_yojson training_parameters_to_yojson x.training_parameters);
      ("PerformHPO", option_to_yojson boolean__to_yojson x.perform_hp_o);
      ( "AutoMLOverrideStrategy",
        option_to_yojson auto_ml_override_strategy_to_yojson x.auto_ml_override_strategy );
      ("PerformAutoML", option_to_yojson boolean__to_yojson x.perform_auto_m_l);
      ("ForecastTypes", option_to_yojson forecast_types_to_yojson x.forecast_types);
      ("ForecastHorizon", option_to_yojson integer_to_yojson x.forecast_horizon);
      ("AutoMLAlgorithmArns", option_to_yojson arn_list_to_yojson x.auto_ml_algorithm_arns);
      ("AlgorithmArn", option_to_yojson arn_to_yojson x.algorithm_arn);
      ("PredictorName", option_to_yojson name_to_yojson x.predictor_name);
      ("PredictorArn", option_to_yojson name_to_yojson x.predictor_arn);
    ]

let describe_predictor_request_to_yojson (x : describe_predictor_request) =
  assoc_to_yojson [ ("PredictorArn", Some (arn_to_yojson x.predictor_arn)) ]

let describe_predictor_backtest_export_job_response_to_yojson
    (x : describe_predictor_backtest_export_job_response) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Destination", option_to_yojson data_destination_to_yojson x.destination);
      ("PredictorArn", option_to_yojson arn_to_yojson x.predictor_arn);
      ( "PredictorBacktestExportJobName",
        option_to_yojson name_to_yojson x.predictor_backtest_export_job_name );
      ( "PredictorBacktestExportJobArn",
        option_to_yojson arn_to_yojson x.predictor_backtest_export_job_arn );
    ]

let describe_predictor_backtest_export_job_request_to_yojson
    (x : describe_predictor_backtest_export_job_request) =
  assoc_to_yojson
    [ ("PredictorBacktestExportJobArn", Some (arn_to_yojson x.predictor_backtest_export_job_arn)) ]

let baseline_to_yojson (x : baseline) =
  assoc_to_yojson
    [ ("PredictorBaseline", option_to_yojson predictor_baseline_to_yojson x.predictor_baseline) ]

let describe_monitor_response_to_yojson (x : describe_monitor_response) =
  assoc_to_yojson
    [
      ( "EstimatedEvaluationTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_evaluation_time_remaining_in_minutes );
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Baseline", option_to_yojson baseline_to_yojson x.baseline);
      ("LastEvaluationState", option_to_yojson evaluation_state_to_yojson x.last_evaluation_state);
      ("LastEvaluationTime", option_to_yojson timestamp_to_yojson x.last_evaluation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ResourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("MonitorArn", option_to_yojson arn_to_yojson x.monitor_arn);
      ("MonitorName", option_to_yojson name_to_yojson x.monitor_name);
    ]

let describe_monitor_request_to_yojson (x : describe_monitor_request) =
  assoc_to_yojson [ ("MonitorArn", Some (arn_to_yojson x.monitor_arn)) ]

let describe_forecast_response_to_yojson (x : describe_forecast_response) =
  assoc_to_yojson
    [
      ("TimeSeriesSelector", option_to_yojson time_series_selector_to_yojson x.time_series_selector);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Status", option_to_yojson string__to_yojson x.status);
      ( "EstimatedTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_time_remaining_in_minutes );
      ("DatasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("PredictorArn", option_to_yojson arn_to_yojson x.predictor_arn);
      ("ForecastTypes", option_to_yojson forecast_types_to_yojson x.forecast_types);
      ("ForecastName", option_to_yojson name_to_yojson x.forecast_name);
      ("ForecastArn", option_to_yojson arn_to_yojson x.forecast_arn);
    ]

let describe_forecast_request_to_yojson (x : describe_forecast_request) =
  assoc_to_yojson [ ("ForecastArn", Some (arn_to_yojson x.forecast_arn)) ]

let describe_forecast_export_job_response_to_yojson (x : describe_forecast_export_job_response) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Destination", option_to_yojson data_destination_to_yojson x.destination);
      ("ForecastArn", option_to_yojson arn_to_yojson x.forecast_arn);
      ("ForecastExportJobName", option_to_yojson name_to_yojson x.forecast_export_job_name);
      ("ForecastExportJobArn", option_to_yojson arn_to_yojson x.forecast_export_job_arn);
    ]

let describe_forecast_export_job_request_to_yojson (x : describe_forecast_export_job_request) =
  assoc_to_yojson [ ("ForecastExportJobArn", Some (arn_to_yojson x.forecast_export_job_arn)) ]

let describe_explainability_response_to_yojson (x : describe_explainability_response) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Message", option_to_yojson message_to_yojson x.message);
      ( "EstimatedTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_time_remaining_in_minutes );
      ("EndDateTime", option_to_yojson local_date_time_to_yojson x.end_date_time);
      ("StartDateTime", option_to_yojson local_date_time_to_yojson x.start_date_time);
      ("Schema", option_to_yojson schema_to_yojson x.schema);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("EnableVisualization", option_to_yojson boolean__to_yojson x.enable_visualization);
      ( "ExplainabilityConfig",
        option_to_yojson explainability_config_to_yojson x.explainability_config );
      ("ResourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("ExplainabilityName", option_to_yojson name_to_yojson x.explainability_name);
      ("ExplainabilityArn", option_to_yojson arn_to_yojson x.explainability_arn);
    ]

let describe_explainability_request_to_yojson (x : describe_explainability_request) =
  assoc_to_yojson [ ("ExplainabilityArn", Some (arn_to_yojson x.explainability_arn)) ]

let describe_explainability_export_response_to_yojson (x : describe_explainability_export_response)
    =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Destination", option_to_yojson data_destination_to_yojson x.destination);
      ("ExplainabilityArn", option_to_yojson arn_to_yojson x.explainability_arn);
      ("ExplainabilityExportName", option_to_yojson name_to_yojson x.explainability_export_name);
      ("ExplainabilityExportArn", option_to_yojson arn_to_yojson x.explainability_export_arn);
    ]

let describe_explainability_export_request_to_yojson (x : describe_explainability_export_request) =
  assoc_to_yojson [ ("ExplainabilityExportArn", Some (arn_to_yojson x.explainability_export_arn)) ]

let describe_dataset_response_to_yojson (x : describe_dataset_response) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("EncryptionConfig", option_to_yojson encryption_config_to_yojson x.encryption_config);
      ("Schema", option_to_yojson schema_to_yojson x.schema);
      ("DataFrequency", option_to_yojson frequency_to_yojson x.data_frequency);
      ("DatasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("DatasetName", option_to_yojson name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
    ]

let describe_dataset_request_to_yojson (x : describe_dataset_request) =
  assoc_to_yojson [ ("DatasetArn", Some (arn_to_yojson x.dataset_arn)) ]

let describe_dataset_import_job_response_to_yojson (x : describe_dataset_import_job_response) =
  assoc_to_yojson
    [
      ("ImportMode", option_to_yojson import_mode_to_yojson x.import_mode);
      ("Format", option_to_yojson format_to_yojson x.format);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("DataSize", option_to_yojson double_to_yojson x.data_size);
      ("FieldStatistics", option_to_yojson field_statistics_to_yojson x.field_statistics);
      ( "EstimatedTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_time_remaining_in_minutes );
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("GeolocationFormat", option_to_yojson geolocation_format_to_yojson x.geolocation_format);
      ( "UseGeolocationForTimeZone",
        option_to_yojson use_geolocation_for_time_zone_to_yojson x.use_geolocation_for_time_zone );
      ("TimeZone", option_to_yojson time_zone_to_yojson x.time_zone);
      ("TimestampFormat", option_to_yojson timestamp_format_to_yojson x.timestamp_format);
      ("DatasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("DatasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn);
      ("DatasetImportJobName", option_to_yojson name_to_yojson x.dataset_import_job_name);
    ]

let describe_dataset_import_job_request_to_yojson (x : describe_dataset_import_job_request) =
  assoc_to_yojson [ ("DatasetImportJobArn", Some (arn_to_yojson x.dataset_import_job_arn)) ]

let describe_dataset_group_response_to_yojson (x : describe_dataset_group_response) =
  assoc_to_yojson
    [
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("DatasetArns", option_to_yojson arn_list_to_yojson x.dataset_arns);
      ("DatasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("DatasetGroupName", option_to_yojson name_to_yojson x.dataset_group_name);
    ]

let describe_dataset_group_request_to_yojson (x : describe_dataset_group_request) =
  assoc_to_yojson [ ("DatasetGroupArn", Some (arn_to_yojson x.dataset_group_arn)) ]

let attribute_config_to_yojson (x : attribute_config) =
  assoc_to_yojson
    [
      ("Transformations", Some (transformations_to_yojson x.transformations));
      ("AttributeName", Some (name_to_yojson x.attribute_name));
    ]

let attribute_configs_to_yojson tree = list_to_yojson attribute_config_to_yojson tree
let configuration_to_yojson tree = map_to_yojson name_to_yojson values_to_yojson tree

let additional_dataset_to_yojson (x : additional_dataset) =
  assoc_to_yojson
    [
      ("Configuration", option_to_yojson configuration_to_yojson x.configuration);
      ("Name", Some (name_to_yojson x.name));
    ]

let additional_datasets_to_yojson tree = list_to_yojson additional_dataset_to_yojson tree

let data_config_to_yojson (x : data_config) =
  assoc_to_yojson
    [
      ("AdditionalDatasets", option_to_yojson additional_datasets_to_yojson x.additional_datasets);
      ("AttributeConfigs", option_to_yojson attribute_configs_to_yojson x.attribute_configs);
      ("DatasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
    ]

let describe_auto_predictor_response_to_yojson (x : describe_auto_predictor_response) =
  assoc_to_yojson
    [
      ( "TimeAlignmentBoundary",
        option_to_yojson time_alignment_boundary_to_yojson x.time_alignment_boundary );
      ("MonitorInfo", option_to_yojson monitor_info_to_yojson x.monitor_info);
      ("ExplainabilityInfo", option_to_yojson explainability_info_to_yojson x.explainability_info);
      ("OptimizationMetric", option_to_yojson optimization_metric_to_yojson x.optimization_metric);
      ("LastModificationTime", option_to_yojson timestamp_to_yojson x.last_modification_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ( "EstimatedTimeRemainingInMinutes",
        option_to_yojson long_to_yojson x.estimated_time_remaining_in_minutes );
      ( "ReferencePredictorSummary",
        option_to_yojson reference_predictor_summary_to_yojson x.reference_predictor_summary );
      ("EncryptionConfig", option_to_yojson encryption_config_to_yojson x.encryption_config);
      ("DataConfig", option_to_yojson data_config_to_yojson x.data_config);
      ("DatasetImportJobArns", option_to_yojson arn_list_to_yojson x.dataset_import_job_arns);
      ("ForecastDimensions", option_to_yojson forecast_dimensions_to_yojson x.forecast_dimensions);
      ("ForecastFrequency", option_to_yojson frequency_to_yojson x.forecast_frequency);
      ("ForecastTypes", option_to_yojson forecast_types_to_yojson x.forecast_types);
      ("ForecastHorizon", option_to_yojson integer_to_yojson x.forecast_horizon);
      ("PredictorName", option_to_yojson name_to_yojson x.predictor_name);
      ("PredictorArn", option_to_yojson arn_to_yojson x.predictor_arn);
    ]

let describe_auto_predictor_request_to_yojson (x : describe_auto_predictor_request) =
  assoc_to_yojson [ ("PredictorArn", Some (arn_to_yojson x.predictor_arn)) ]

let delete_what_if_forecast_request_to_yojson (x : delete_what_if_forecast_request) =
  assoc_to_yojson [ ("WhatIfForecastArn", Some (long_arn_to_yojson x.what_if_forecast_arn)) ]

let delete_what_if_forecast_export_request_to_yojson (x : delete_what_if_forecast_export_request) =
  assoc_to_yojson
    [ ("WhatIfForecastExportArn", Some (long_arn_to_yojson x.what_if_forecast_export_arn)) ]

let delete_what_if_analysis_request_to_yojson (x : delete_what_if_analysis_request) =
  assoc_to_yojson [ ("WhatIfAnalysisArn", Some (arn_to_yojson x.what_if_analysis_arn)) ]

let delete_resource_tree_request_to_yojson (x : delete_resource_tree_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let delete_predictor_request_to_yojson (x : delete_predictor_request) =
  assoc_to_yojson [ ("PredictorArn", Some (arn_to_yojson x.predictor_arn)) ]

let delete_predictor_backtest_export_job_request_to_yojson
    (x : delete_predictor_backtest_export_job_request) =
  assoc_to_yojson
    [ ("PredictorBacktestExportJobArn", Some (arn_to_yojson x.predictor_backtest_export_job_arn)) ]

let delete_monitor_request_to_yojson (x : delete_monitor_request) =
  assoc_to_yojson [ ("MonitorArn", Some (arn_to_yojson x.monitor_arn)) ]

let delete_forecast_request_to_yojson (x : delete_forecast_request) =
  assoc_to_yojson [ ("ForecastArn", Some (arn_to_yojson x.forecast_arn)) ]

let delete_forecast_export_job_request_to_yojson (x : delete_forecast_export_job_request) =
  assoc_to_yojson [ ("ForecastExportJobArn", Some (arn_to_yojson x.forecast_export_job_arn)) ]

let delete_explainability_request_to_yojson (x : delete_explainability_request) =
  assoc_to_yojson [ ("ExplainabilityArn", Some (arn_to_yojson x.explainability_arn)) ]

let delete_explainability_export_request_to_yojson (x : delete_explainability_export_request) =
  assoc_to_yojson [ ("ExplainabilityExportArn", Some (arn_to_yojson x.explainability_export_arn)) ]

let delete_dataset_request_to_yojson (x : delete_dataset_request) =
  assoc_to_yojson [ ("DatasetArn", Some (arn_to_yojson x.dataset_arn)) ]

let delete_dataset_import_job_request_to_yojson (x : delete_dataset_import_job_request) =
  assoc_to_yojson [ ("DatasetImportJobArn", Some (arn_to_yojson x.dataset_import_job_arn)) ]

let delete_dataset_group_request_to_yojson (x : delete_dataset_group_request) =
  assoc_to_yojson [ ("DatasetGroupArn", Some (arn_to_yojson x.dataset_group_arn)) ]

let create_what_if_forecast_response_to_yojson (x : create_what_if_forecast_response) =
  assoc_to_yojson
    [ ("WhatIfForecastArn", option_to_yojson long_arn_to_yojson x.what_if_forecast_arn) ]

let create_what_if_forecast_request_to_yojson (x : create_what_if_forecast_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "TimeSeriesReplacementsDataSource",
        option_to_yojson time_series_replacements_data_source_to_yojson
          x.time_series_replacements_data_source );
      ( "TimeSeriesTransformations",
        option_to_yojson time_series_transformations_to_yojson x.time_series_transformations );
      ("WhatIfAnalysisArn", Some (arn_to_yojson x.what_if_analysis_arn));
      ("WhatIfForecastName", Some (name_to_yojson x.what_if_forecast_name));
    ]

let create_what_if_forecast_export_response_to_yojson (x : create_what_if_forecast_export_response)
    =
  assoc_to_yojson
    [
      ("WhatIfForecastExportArn", option_to_yojson long_arn_to_yojson x.what_if_forecast_export_arn);
    ]

let create_what_if_forecast_export_request_to_yojson (x : create_what_if_forecast_export_request) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Destination", Some (data_destination_to_yojson x.destination));
      ( "WhatIfForecastArns",
        Some (what_if_forecast_arn_list_for_export_to_yojson x.what_if_forecast_arns) );
      ("WhatIfForecastExportName", Some (name_to_yojson x.what_if_forecast_export_name));
    ]

let create_what_if_analysis_response_to_yojson (x : create_what_if_analysis_response) =
  assoc_to_yojson [ ("WhatIfAnalysisArn", option_to_yojson arn_to_yojson x.what_if_analysis_arn) ]

let create_what_if_analysis_request_to_yojson (x : create_what_if_analysis_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("TimeSeriesSelector", option_to_yojson time_series_selector_to_yojson x.time_series_selector);
      ("ForecastArn", Some (arn_to_yojson x.forecast_arn));
      ("WhatIfAnalysisName", Some (name_to_yojson x.what_if_analysis_name));
    ]

let create_predictor_response_to_yojson (x : create_predictor_response) =
  assoc_to_yojson [ ("PredictorArn", option_to_yojson arn_to_yojson x.predictor_arn) ]

let create_predictor_request_to_yojson (x : create_predictor_request) =
  assoc_to_yojson
    [
      ("OptimizationMetric", option_to_yojson optimization_metric_to_yojson x.optimization_metric);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("EncryptionConfig", option_to_yojson encryption_config_to_yojson x.encryption_config);
      ("FeaturizationConfig", Some (featurization_config_to_yojson x.featurization_config));
      ("InputDataConfig", Some (input_data_config_to_yojson x.input_data_config));
      ("HPOConfig", option_to_yojson hyper_parameter_tuning_job_config_to_yojson x.hpo_config);
      ( "EvaluationParameters",
        option_to_yojson evaluation_parameters_to_yojson x.evaluation_parameters );
      ("TrainingParameters", option_to_yojson training_parameters_to_yojson x.training_parameters);
      ("PerformHPO", option_to_yojson boolean__to_yojson x.perform_hp_o);
      ( "AutoMLOverrideStrategy",
        option_to_yojson auto_ml_override_strategy_to_yojson x.auto_ml_override_strategy );
      ("PerformAutoML", option_to_yojson boolean__to_yojson x.perform_auto_m_l);
      ("ForecastTypes", option_to_yojson forecast_types_to_yojson x.forecast_types);
      ("ForecastHorizon", Some (integer_to_yojson x.forecast_horizon));
      ("AlgorithmArn", option_to_yojson arn_to_yojson x.algorithm_arn);
      ("PredictorName", Some (name_to_yojson x.predictor_name));
    ]

let create_predictor_backtest_export_job_response_to_yojson
    (x : create_predictor_backtest_export_job_response) =
  assoc_to_yojson
    [
      ( "PredictorBacktestExportJobArn",
        option_to_yojson arn_to_yojson x.predictor_backtest_export_job_arn );
    ]

let create_predictor_backtest_export_job_request_to_yojson
    (x : create_predictor_backtest_export_job_request) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Destination", Some (data_destination_to_yojson x.destination));
      ("PredictorArn", Some (arn_to_yojson x.predictor_arn));
      ("PredictorBacktestExportJobName", Some (name_to_yojson x.predictor_backtest_export_job_name));
    ]

let create_monitor_response_to_yojson (x : create_monitor_response) =
  assoc_to_yojson [ ("MonitorArn", option_to_yojson arn_to_yojson x.monitor_arn) ]

let create_monitor_request_to_yojson (x : create_monitor_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("MonitorName", Some (name_to_yojson x.monitor_name));
    ]

let create_forecast_response_to_yojson (x : create_forecast_response) =
  assoc_to_yojson [ ("ForecastArn", option_to_yojson arn_to_yojson x.forecast_arn) ]

let create_forecast_request_to_yojson (x : create_forecast_request) =
  assoc_to_yojson
    [
      ("TimeSeriesSelector", option_to_yojson time_series_selector_to_yojson x.time_series_selector);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ForecastTypes", option_to_yojson forecast_types_to_yojson x.forecast_types);
      ("PredictorArn", Some (arn_to_yojson x.predictor_arn));
      ("ForecastName", Some (name_to_yojson x.forecast_name));
    ]

let create_forecast_export_job_response_to_yojson (x : create_forecast_export_job_response) =
  assoc_to_yojson
    [ ("ForecastExportJobArn", option_to_yojson arn_to_yojson x.forecast_export_job_arn) ]

let create_forecast_export_job_request_to_yojson (x : create_forecast_export_job_request) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Destination", Some (data_destination_to_yojson x.destination));
      ("ForecastArn", Some (arn_to_yojson x.forecast_arn));
      ("ForecastExportJobName", Some (name_to_yojson x.forecast_export_job_name));
    ]

let create_explainability_response_to_yojson (x : create_explainability_response) =
  assoc_to_yojson [ ("ExplainabilityArn", option_to_yojson arn_to_yojson x.explainability_arn) ]

let create_explainability_request_to_yojson (x : create_explainability_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("EndDateTime", option_to_yojson local_date_time_to_yojson x.end_date_time);
      ("StartDateTime", option_to_yojson local_date_time_to_yojson x.start_date_time);
      ("EnableVisualization", option_to_yojson boolean__to_yojson x.enable_visualization);
      ("Schema", option_to_yojson schema_to_yojson x.schema);
      ("DataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("ExplainabilityConfig", Some (explainability_config_to_yojson x.explainability_config));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("ExplainabilityName", Some (name_to_yojson x.explainability_name));
    ]

let create_explainability_export_response_to_yojson (x : create_explainability_export_response) =
  assoc_to_yojson
    [ ("ExplainabilityExportArn", option_to_yojson arn_to_yojson x.explainability_export_arn) ]

let create_explainability_export_request_to_yojson (x : create_explainability_export_request) =
  assoc_to_yojson
    [
      ("Format", option_to_yojson format_to_yojson x.format);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Destination", Some (data_destination_to_yojson x.destination));
      ("ExplainabilityArn", Some (arn_to_yojson x.explainability_arn));
      ("ExplainabilityExportName", Some (name_to_yojson x.explainability_export_name));
    ]

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson [ ("DatasetArn", option_to_yojson arn_to_yojson x.dataset_arn) ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("EncryptionConfig", option_to_yojson encryption_config_to_yojson x.encryption_config);
      ("Schema", Some (schema_to_yojson x.schema));
      ("DataFrequency", option_to_yojson frequency_to_yojson x.data_frequency);
      ("DatasetType", Some (dataset_type_to_yojson x.dataset_type));
      ("Domain", Some (domain_to_yojson x.domain));
      ("DatasetName", Some (name_to_yojson x.dataset_name));
    ]

let create_dataset_import_job_response_to_yojson (x : create_dataset_import_job_response) =
  assoc_to_yojson
    [ ("DatasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn) ]

let create_dataset_import_job_request_to_yojson (x : create_dataset_import_job_request) =
  assoc_to_yojson
    [
      ("ImportMode", option_to_yojson import_mode_to_yojson x.import_mode);
      ("Format", option_to_yojson format_to_yojson x.format);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("GeolocationFormat", option_to_yojson geolocation_format_to_yojson x.geolocation_format);
      ( "UseGeolocationForTimeZone",
        option_to_yojson use_geolocation_for_time_zone_to_yojson x.use_geolocation_for_time_zone );
      ("TimeZone", option_to_yojson time_zone_to_yojson x.time_zone);
      ("TimestampFormat", option_to_yojson timestamp_format_to_yojson x.timestamp_format);
      ("DataSource", Some (data_source_to_yojson x.data_source));
      ("DatasetArn", Some (arn_to_yojson x.dataset_arn));
      ("DatasetImportJobName", Some (name_to_yojson x.dataset_import_job_name));
    ]

let create_dataset_group_response_to_yojson (x : create_dataset_group_response) =
  assoc_to_yojson [ ("DatasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn) ]

let create_dataset_group_request_to_yojson (x : create_dataset_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("DatasetArns", option_to_yojson arn_list_to_yojson x.dataset_arns);
      ("Domain", Some (domain_to_yojson x.domain));
      ("DatasetGroupName", Some (name_to_yojson x.dataset_group_name));
    ]

let create_auto_predictor_response_to_yojson (x : create_auto_predictor_response) =
  assoc_to_yojson [ ("PredictorArn", option_to_yojson arn_to_yojson x.predictor_arn) ]

let create_auto_predictor_request_to_yojson (x : create_auto_predictor_request) =
  assoc_to_yojson
    [
      ( "TimeAlignmentBoundary",
        option_to_yojson time_alignment_boundary_to_yojson x.time_alignment_boundary );
      ("MonitorConfig", option_to_yojson monitor_config_to_yojson x.monitor_config);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ExplainPredictor", option_to_yojson boolean__to_yojson x.explain_predictor);
      ("OptimizationMetric", option_to_yojson optimization_metric_to_yojson x.optimization_metric);
      ("ReferencePredictorArn", option_to_yojson arn_to_yojson x.reference_predictor_arn);
      ("EncryptionConfig", option_to_yojson encryption_config_to_yojson x.encryption_config);
      ("DataConfig", option_to_yojson data_config_to_yojson x.data_config);
      ("ForecastFrequency", option_to_yojson frequency_to_yojson x.forecast_frequency);
      ("ForecastDimensions", option_to_yojson forecast_dimensions_to_yojson x.forecast_dimensions);
      ("ForecastTypes", option_to_yojson forecast_types_to_yojson x.forecast_types);
      ("ForecastHorizon", option_to_yojson integer_to_yojson x.forecast_horizon);
      ("PredictorName", Some (name_to_yojson x.predictor_name));
    ]
