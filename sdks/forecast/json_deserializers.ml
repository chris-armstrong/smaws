open Smaws_Lib.Json.DeserializeHelpers
open Types

let double_of_yojson = double_of_yojson

let operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "ADD" -> ADD
    | `String "SUBTRACT" -> SUBTRACT
    | `String "MULTIPLY" -> MULTIPLY
    | `String "DIVIDE" -> DIVIDE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Operation" value)
    | _ -> raise (deserialize_wrong_type_error path "Operation")
     : operation)
    : operation)

let name_of_yojson = string_of_yojson

let action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = value_for_key name_of_yojson "AttributeName" _list path;
     operation = value_for_key operation_of_yojson "Operation" _list path;
     value = value_for_key double_of_yojson "Value" _list path;
   }
    : action)

let value_of_yojson = string_of_yojson
let values_of_yojson tree path = list_of_yojson value_of_yojson tree path
let configuration_of_yojson tree path = map_of_yojson name_of_yojson values_of_yojson tree path

let additional_dataset_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "Name" _list path;
     configuration =
       option_of_yojson (value_for_key configuration_of_yojson "Configuration") _list path;
   }
    : additional_dataset)

let additional_datasets_of_yojson tree path = list_of_yojson additional_dataset_of_yojson tree path
let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_in_use_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_input_exception)

let update_dataset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let arn_of_yojson = string_of_yojson
let arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let update_dataset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = value_for_key arn_of_yojson "DatasetGroupArn" _list path;
     dataset_arns = value_for_key arn_list_of_yojson "DatasetArns" _list path;
   }
    : update_dataset_group_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : limit_exceeded_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tags = value_for_key tags_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let stop_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path } : stop_resource_request)

let resume_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path }
    : resume_resource_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_next_token_exception)

let next_token_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let status_of_yojson = string_of_yojson
let long_arn_of_yojson = string_of_yojson

let what_if_forecast_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_arn =
       option_of_yojson (value_for_key long_arn_of_yojson "WhatIfForecastArn") _list path;
     what_if_forecast_name =
       option_of_yojson (value_for_key name_of_yojson "WhatIfForecastName") _list path;
     what_if_analysis_arn =
       option_of_yojson (value_for_key arn_of_yojson "WhatIfAnalysisArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : what_if_forecast_summary)

let what_if_forecasts_of_yojson tree path =
  list_of_yojson what_if_forecast_summary_of_yojson tree path

let list_what_if_forecasts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecasts =
       option_of_yojson (value_for_key what_if_forecasts_of_yojson "WhatIfForecasts") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_what_if_forecasts_response)

let filter_condition_string_of_yojson (tree : t) path =
  ((match tree with
    | `String "IS" -> IS
    | `String "IS_NOT" -> IS_NOT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FilterConditionString" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterConditionString")
     : filter_condition_string)
    : filter_condition_string)

let string__of_yojson = string_of_yojson

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key string__of_yojson "Key" _list path;
     value = value_for_key arn_of_yojson "Value" _list path;
     condition = value_for_key filter_condition_string_of_yojson "Condition" _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path
let max_results_of_yojson = int_of_yojson

let list_what_if_forecasts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_what_if_forecasts_request)

let kms_key_arn_of_yojson = string_of_yojson
let s3_path_of_yojson = string_of_yojson

let s3_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path = value_for_key s3_path_of_yojson "Path" _list path;
     role_arn = value_for_key arn_of_yojson "RoleArn" _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KMSKeyArn") _list path;
   }
    : s3_config)

let data_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_config = value_for_key s3_config_of_yojson "S3Config" _list path } : data_destination)

let what_if_forecast_arn_list_for_export_of_yojson tree path =
  list_of_yojson long_arn_of_yojson tree path

let what_if_forecast_export_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_export_arn =
       option_of_yojson (value_for_key long_arn_of_yojson "WhatIfForecastExportArn") _list path;
     what_if_forecast_arns =
       option_of_yojson
         (value_for_key what_if_forecast_arn_list_for_export_of_yojson "WhatIfForecastArns")
         _list path;
     what_if_forecast_export_name =
       option_of_yojson (value_for_key name_of_yojson "WhatIfForecastExportName") _list path;
     destination =
       option_of_yojson (value_for_key data_destination_of_yojson "Destination") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : what_if_forecast_export_summary)

let what_if_forecast_exports_of_yojson tree path =
  list_of_yojson what_if_forecast_export_summary_of_yojson tree path

let list_what_if_forecast_exports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_exports =
       option_of_yojson
         (value_for_key what_if_forecast_exports_of_yojson "WhatIfForecastExports")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_what_if_forecast_exports_response)

let list_what_if_forecast_exports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_what_if_forecast_exports_request)

let what_if_analysis_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_analysis_arn =
       option_of_yojson (value_for_key arn_of_yojson "WhatIfAnalysisArn") _list path;
     what_if_analysis_name =
       option_of_yojson (value_for_key name_of_yojson "WhatIfAnalysisName") _list path;
     forecast_arn = option_of_yojson (value_for_key arn_of_yojson "ForecastArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : what_if_analysis_summary)

let what_if_analyses_of_yojson tree path =
  list_of_yojson what_if_analysis_summary_of_yojson tree path

let list_what_if_analyses_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_analyses =
       option_of_yojson (value_for_key what_if_analyses_of_yojson "WhatIfAnalyses") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_what_if_analyses_response)

let list_what_if_analyses_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_what_if_analyses_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let state_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> Active
    | `String "Deleted" -> Deleted
    | `String value -> raise (deserialize_unknown_enum_value_error path "State" value)
    | _ -> raise (deserialize_wrong_type_error path "State")
     : state)
    : state)

let reference_predictor_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key arn_of_yojson "Arn") _list path;
     state = option_of_yojson (value_for_key state_of_yojson "State") _list path;
   }
    : reference_predictor_summary)

let boolean__of_yojson = bool_of_yojson

let predictor_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_arn = option_of_yojson (value_for_key arn_of_yojson "PredictorArn") _list path;
     predictor_name = option_of_yojson (value_for_key name_of_yojson "PredictorName") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetGroupArn") _list path;
     is_auto_predictor =
       option_of_yojson (value_for_key boolean__of_yojson "IsAutoPredictor") _list path;
     reference_predictor_summary =
       option_of_yojson
         (value_for_key reference_predictor_summary_of_yojson "ReferencePredictorSummary")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : predictor_summary)

let predictors_of_yojson tree path = list_of_yojson predictor_summary_of_yojson tree path

let list_predictors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictors = option_of_yojson (value_for_key predictors_of_yojson "Predictors") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_predictors_response)

let list_predictors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_predictors_request)

let predictor_backtest_export_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_backtest_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "PredictorBacktestExportJobArn") _list path;
     predictor_backtest_export_job_name =
       option_of_yojson (value_for_key name_of_yojson "PredictorBacktestExportJobName") _list path;
     destination =
       option_of_yojson (value_for_key data_destination_of_yojson "Destination") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : predictor_backtest_export_job_summary)

let predictor_backtest_export_jobs_of_yojson tree path =
  list_of_yojson predictor_backtest_export_job_summary_of_yojson tree path

let list_predictor_backtest_export_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_backtest_export_jobs =
       option_of_yojson
         (value_for_key predictor_backtest_export_jobs_of_yojson "PredictorBacktestExportJobs")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_predictor_backtest_export_jobs_response)

let list_predictor_backtest_export_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_predictor_backtest_export_jobs_request)

let monitor_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitor_arn = option_of_yojson (value_for_key arn_of_yojson "MonitorArn") _list path;
     monitor_name = option_of_yojson (value_for_key name_of_yojson "MonitorName") _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "ResourceArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : monitor_summary)

let monitors_of_yojson tree path = list_of_yojson monitor_summary_of_yojson tree path

let list_monitors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitors = option_of_yojson (value_for_key monitors_of_yojson "Monitors") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_monitors_response)

let list_monitors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_monitors_request)

let message_of_yojson = string_of_yojson
let long_of_yojson = long_of_yojson
let metric_name_of_yojson = string_of_yojson

let metric_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "MetricName") _list path;
     metric_value = option_of_yojson (value_for_key double_of_yojson "MetricValue") _list path;
   }
    : metric_result)

let metric_results_of_yojson tree path = list_of_yojson metric_result_of_yojson tree path

let monitor_data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "DatasetImportJobArn") _list path;
     forecast_arn = option_of_yojson (value_for_key arn_of_yojson "ForecastArn") _list path;
     predictor_arn = option_of_yojson (value_for_key arn_of_yojson "PredictorArn") _list path;
   }
    : monitor_data_source)

let detail_of_yojson = string_of_yojson

let predictor_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detail = option_of_yojson (value_for_key detail_of_yojson "Detail") _list path;
     datetime = option_of_yojson (value_for_key timestamp_of_yojson "Datetime") _list path;
   }
    : predictor_event)

let evaluation_state_of_yojson = string_of_yojson

let predictor_monitor_evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "ResourceArn") _list path;
     monitor_arn = option_of_yojson (value_for_key arn_of_yojson "MonitorArn") _list path;
     evaluation_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EvaluationTime") _list path;
     evaluation_state =
       option_of_yojson (value_for_key evaluation_state_of_yojson "EvaluationState") _list path;
     window_start_datetime =
       option_of_yojson (value_for_key timestamp_of_yojson "WindowStartDatetime") _list path;
     window_end_datetime =
       option_of_yojson (value_for_key timestamp_of_yojson "WindowEndDatetime") _list path;
     predictor_event =
       option_of_yojson (value_for_key predictor_event_of_yojson "PredictorEvent") _list path;
     monitor_data_source =
       option_of_yojson (value_for_key monitor_data_source_of_yojson "MonitorDataSource") _list path;
     metric_results =
       option_of_yojson (value_for_key metric_results_of_yojson "MetricResults") _list path;
     num_items_evaluated =
       option_of_yojson (value_for_key long_of_yojson "NumItemsEvaluated") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
   }
    : predictor_monitor_evaluation)

let predictor_monitor_evaluations_of_yojson tree path =
  list_of_yojson predictor_monitor_evaluation_of_yojson tree path

let list_monitor_evaluations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     predictor_monitor_evaluations =
       option_of_yojson
         (value_for_key predictor_monitor_evaluations_of_yojson "PredictorMonitorEvaluations")
         _list path;
   }
    : list_monitor_evaluations_response)

let list_monitor_evaluations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     monitor_arn = value_for_key arn_of_yojson "MonitorArn" _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_monitor_evaluations_request)

let forecast_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_arn = option_of_yojson (value_for_key arn_of_yojson "ForecastArn") _list path;
     forecast_name = option_of_yojson (value_for_key name_of_yojson "ForecastName") _list path;
     predictor_arn = option_of_yojson (value_for_key string__of_yojson "PredictorArn") _list path;
     created_using_auto_predictor =
       option_of_yojson (value_for_key boolean__of_yojson "CreatedUsingAutoPredictor") _list path;
     dataset_group_arn =
       option_of_yojson (value_for_key string__of_yojson "DatasetGroupArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : forecast_summary)

let forecasts_of_yojson tree path = list_of_yojson forecast_summary_of_yojson tree path

let list_forecasts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecasts = option_of_yojson (value_for_key forecasts_of_yojson "Forecasts") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_forecasts_response)

let list_forecasts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_forecasts_request)

let forecast_export_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "ForecastExportJobArn") _list path;
     forecast_export_job_name =
       option_of_yojson (value_for_key name_of_yojson "ForecastExportJobName") _list path;
     destination =
       option_of_yojson (value_for_key data_destination_of_yojson "Destination") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : forecast_export_job_summary)

let forecast_export_jobs_of_yojson tree path =
  list_of_yojson forecast_export_job_summary_of_yojson tree path

let list_forecast_export_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_export_jobs =
       option_of_yojson
         (value_for_key forecast_export_jobs_of_yojson "ForecastExportJobs")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_forecast_export_jobs_response)

let list_forecast_export_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_forecast_export_jobs_request)

let explainability_export_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_export_arn =
       option_of_yojson (value_for_key arn_of_yojson "ExplainabilityExportArn") _list path;
     explainability_export_name =
       option_of_yojson (value_for_key name_of_yojson "ExplainabilityExportName") _list path;
     destination =
       option_of_yojson (value_for_key data_destination_of_yojson "Destination") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : explainability_export_summary)

let explainability_exports_of_yojson tree path =
  list_of_yojson explainability_export_summary_of_yojson tree path

let list_explainability_exports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_exports =
       option_of_yojson
         (value_for_key explainability_exports_of_yojson "ExplainabilityExports")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_explainability_exports_response)

let list_explainability_exports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_explainability_exports_request)

let time_point_granularity_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "SPECIFIC" -> SPECIFIC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TimePointGranularity" value)
    | _ -> raise (deserialize_wrong_type_error path "TimePointGranularity")
     : time_point_granularity)
    : time_point_granularity)

let time_series_granularity_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "SPECIFIC" -> SPECIFIC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TimeSeriesGranularity" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeSeriesGranularity")
     : time_series_granularity)
    : time_series_granularity)

let explainability_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_series_granularity =
       value_for_key time_series_granularity_of_yojson "TimeSeriesGranularity" _list path;
     time_point_granularity =
       value_for_key time_point_granularity_of_yojson "TimePointGranularity" _list path;
   }
    : explainability_config)

let explainability_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_arn =
       option_of_yojson (value_for_key arn_of_yojson "ExplainabilityArn") _list path;
     explainability_name =
       option_of_yojson (value_for_key name_of_yojson "ExplainabilityName") _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "ResourceArn") _list path;
     explainability_config =
       option_of_yojson
         (value_for_key explainability_config_of_yojson "ExplainabilityConfig")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : explainability_summary)

let explainabilities_of_yojson tree path = list_of_yojson explainability_summary_of_yojson tree path

let list_explainabilities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainabilities =
       option_of_yojson (value_for_key explainabilities_of_yojson "Explainabilities") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_explainabilities_response)

let list_explainabilities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_explainabilities_request)

let domain_of_yojson (tree : t) path =
  ((match tree with
    | `String "RETAIL" -> RETAIL
    | `String "CUSTOM" -> CUSTOM
    | `String "INVENTORY_PLANNING" -> INVENTORY_PLANNING
    | `String "EC2_CAPACITY" -> EC2_CAPACITY
    | `String "WORK_FORCE" -> WORK_FORCE
    | `String "WEB_TRAFFIC" -> WEB_TRAFFIC
    | `String "METRICS" -> METRICS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Domain" value)
    | _ -> raise (deserialize_wrong_type_error path "Domain")
     : domain)
    : domain)

let dataset_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TARGET_TIME_SERIES" -> TARGET_TIME_SERIES
    | `String "RELATED_TIME_SERIES" -> RELATED_TIME_SERIES
    | `String "ITEM_METADATA" -> ITEM_METADATA
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatasetType" value)
    | _ -> raise (deserialize_wrong_type_error path "DatasetType")
     : dataset_type)
    : dataset_type)

let dataset_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key name_of_yojson "DatasetName") _list path;
     dataset_type = option_of_yojson (value_for_key dataset_type_of_yojson "DatasetType") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : dataset_summary)

let datasets_of_yojson tree path = list_of_yojson dataset_summary_of_yojson tree path

let list_datasets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datasets = option_of_yojson (value_for_key datasets_of_yojson "Datasets") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_datasets_response)

let list_datasets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_datasets_request)

let import_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FULL" -> FULL
    | `String "INCREMENTAL" -> INCREMENTAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportMode")
     : import_mode)
    : import_mode)

let data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_config = value_for_key s3_config_of_yojson "S3Config" _list path } : data_source)

let dataset_import_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "DatasetImportJobArn") _list path;
     dataset_import_job_name =
       option_of_yojson (value_for_key name_of_yojson "DatasetImportJobName") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     import_mode = option_of_yojson (value_for_key import_mode_of_yojson "ImportMode") _list path;
   }
    : dataset_import_job_summary)

let dataset_import_jobs_of_yojson tree path =
  list_of_yojson dataset_import_job_summary_of_yojson tree path

let list_dataset_import_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_jobs =
       option_of_yojson (value_for_key dataset_import_jobs_of_yojson "DatasetImportJobs") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_dataset_import_jobs_response)

let list_dataset_import_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
   }
    : list_dataset_import_jobs_request)

let dataset_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetGroupArn") _list path;
     dataset_group_name =
       option_of_yojson (value_for_key name_of_yojson "DatasetGroupName") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : dataset_group_summary)

let dataset_groups_of_yojson tree path = list_of_yojson dataset_group_summary_of_yojson tree path

let list_dataset_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_groups =
       option_of_yojson (value_for_key dataset_groups_of_yojson "DatasetGroups") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_dataset_groups_response)

let list_dataset_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_dataset_groups_request)

let optimization_metric_of_yojson (tree : t) path =
  ((match tree with
    | `String "WAPE" -> WAPE
    | `String "RMSE" -> RMSE
    | `String "AverageWeightedQuantileLoss" -> AverageWeightedQuantileLoss
    | `String "MASE" -> MASE
    | `String "MAPE" -> MAPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "OptimizationMetric" value)
    | _ -> raise (deserialize_wrong_type_error path "OptimizationMetric")
     : optimization_metric)
    : optimization_metric)

let auto_ml_override_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "LatencyOptimized" -> LatencyOptimized
    | `String "AccuracyOptimized" -> AccuracyOptimized
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutoMLOverrideStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoMLOverrideStrategy")
     : auto_ml_override_strategy)
    : auto_ml_override_strategy)

let forecast_type_of_yojson = string_of_yojson

let error_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_type =
       option_of_yojson (value_for_key forecast_type_of_yojson "ForecastType") _list path;
     wap_e = option_of_yojson (value_for_key double_of_yojson "WAPE") _list path;
     rms_e = option_of_yojson (value_for_key double_of_yojson "RMSE") _list path;
     mas_e = option_of_yojson (value_for_key double_of_yojson "MASE") _list path;
     map_e = option_of_yojson (value_for_key double_of_yojson "MAPE") _list path;
   }
    : error_metric)

let error_metrics_of_yojson tree path = list_of_yojson error_metric_of_yojson tree path

let weighted_quantile_loss_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quantile = option_of_yojson (value_for_key double_of_yojson "Quantile") _list path;
     loss_value = option_of_yojson (value_for_key double_of_yojson "LossValue") _list path;
   }
    : weighted_quantile_loss)

let weighted_quantile_losses_of_yojson tree path =
  list_of_yojson weighted_quantile_loss_of_yojson tree path

let metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rms_e = option_of_yojson (value_for_key double_of_yojson "RMSE") _list path;
     weighted_quantile_losses =
       option_of_yojson
         (value_for_key weighted_quantile_losses_of_yojson "WeightedQuantileLosses")
         _list path;
     error_metrics =
       option_of_yojson (value_for_key error_metrics_of_yojson "ErrorMetrics") _list path;
     average_weighted_quantile_loss =
       option_of_yojson (value_for_key double_of_yojson "AverageWeightedQuantileLoss") _list path;
   }
    : metrics)

let evaluation_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUMMARY" -> SUMMARY
    | `String "COMPUTED" -> COMPUTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EvaluationType" value)
    | _ -> raise (deserialize_wrong_type_error path "EvaluationType")
     : evaluation_type)
    : evaluation_type)

let integer_of_yojson = int_of_yojson

let window_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_window_start =
       option_of_yojson (value_for_key timestamp_of_yojson "TestWindowStart") _list path;
     test_window_end =
       option_of_yojson (value_for_key timestamp_of_yojson "TestWindowEnd") _list path;
     item_count = option_of_yojson (value_for_key integer_of_yojson "ItemCount") _list path;
     evaluation_type =
       option_of_yojson (value_for_key evaluation_type_of_yojson "EvaluationType") _list path;
     metrics = option_of_yojson (value_for_key metrics_of_yojson "Metrics") _list path;
   }
    : window_summary)

let test_windows_of_yojson tree path = list_of_yojson window_summary_of_yojson tree path

let evaluation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     algorithm_arn = option_of_yojson (value_for_key arn_of_yojson "AlgorithmArn") _list path;
     test_windows = option_of_yojson (value_for_key test_windows_of_yojson "TestWindows") _list path;
   }
    : evaluation_result)

let predictor_evaluation_results_of_yojson tree path =
  list_of_yojson evaluation_result_of_yojson tree path

let get_accuracy_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_evaluation_results =
       option_of_yojson
         (value_for_key predictor_evaluation_results_of_yojson "PredictorEvaluationResults")
         _list path;
     is_auto_predictor =
       option_of_yojson (value_for_key boolean__of_yojson "IsAutoPredictor") _list path;
     auto_ml_override_strategy =
       option_of_yojson
         (value_for_key auto_ml_override_strategy_of_yojson "AutoMLOverrideStrategy")
         _list path;
     optimization_metric =
       option_of_yojson
         (value_for_key optimization_metric_of_yojson "OptimizationMetric")
         _list path;
   }
    : get_accuracy_metrics_response)

let get_accuracy_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ predictor_arn = value_for_key arn_of_yojson "PredictorArn" _list path }
    : get_accuracy_metrics_request)

let format_of_yojson = string_of_yojson
let long_arn_list_of_yojson tree path = list_of_yojson long_arn_of_yojson tree path

let describe_what_if_forecast_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_export_arn =
       option_of_yojson (value_for_key long_arn_of_yojson "WhatIfForecastExportArn") _list path;
     what_if_forecast_export_name =
       option_of_yojson (value_for_key name_of_yojson "WhatIfForecastExportName") _list path;
     what_if_forecast_arns =
       option_of_yojson (value_for_key long_arn_list_of_yojson "WhatIfForecastArns") _list path;
     destination =
       option_of_yojson (value_for_key data_destination_of_yojson "Destination") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     estimated_time_remaining_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "EstimatedTimeRemainingInMinutes") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : describe_what_if_forecast_export_response)

let describe_what_if_forecast_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_export_arn =
       value_for_key long_arn_of_yojson "WhatIfForecastExportArn" _list path;
   }
    : describe_what_if_forecast_export_request)

let forecast_types_of_yojson tree path = list_of_yojson forecast_type_of_yojson tree path
let timestamp_format_of_yojson = string_of_yojson

let attribute_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "string" -> STRING
    | `String "integer" -> INTEGER
    | `String "float" -> FLOAT
    | `String "timestamp" -> TIMESTAMP
    | `String "geolocation" -> GEOLOCATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "AttributeType" value)
    | _ -> raise (deserialize_wrong_type_error path "AttributeType")
     : attribute_type)
    : attribute_type)

let schema_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = option_of_yojson (value_for_key name_of_yojson "AttributeName") _list path;
     attribute_type =
       option_of_yojson (value_for_key attribute_type_of_yojson "AttributeType") _list path;
   }
    : schema_attribute)

let schema_attributes_of_yojson tree path = list_of_yojson schema_attribute_of_yojson tree path

let schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       option_of_yojson (value_for_key schema_attributes_of_yojson "Attributes") _list path;
   }
    : schema)

let time_series_replacements_data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_config = value_for_key s3_config_of_yojson "S3Config" _list path;
     schema = value_for_key schema_of_yojson "Schema" _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
     timestamp_format =
       option_of_yojson (value_for_key timestamp_format_of_yojson "TimestampFormat") _list path;
   }
    : time_series_replacements_data_source)

let condition_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String "LESS_THAN" -> LESS_THAN
    | `String "GREATER_THAN" -> GREATER_THAN
    | `String value -> raise (deserialize_unknown_enum_value_error path "Condition" value)
    | _ -> raise (deserialize_wrong_type_error path "Condition")
     : condition)
    : condition)

let attribute_value_of_yojson = string_of_yojson

let time_series_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = value_for_key name_of_yojson "AttributeName" _list path;
     attribute_value = value_for_key attribute_value_of_yojson "AttributeValue" _list path;
     condition = value_for_key condition_of_yojson "Condition" _list path;
   }
    : time_series_condition)

let time_series_conditions_of_yojson tree path =
  list_of_yojson time_series_condition_of_yojson tree path

let time_series_transformation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action = option_of_yojson (value_for_key action_of_yojson "Action") _list path;
     time_series_conditions =
       option_of_yojson
         (value_for_key time_series_conditions_of_yojson "TimeSeriesConditions")
         _list path;
   }
    : time_series_transformation)

let time_series_transformations_of_yojson tree path =
  list_of_yojson time_series_transformation_of_yojson tree path

let describe_what_if_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_name =
       option_of_yojson (value_for_key name_of_yojson "WhatIfForecastName") _list path;
     what_if_forecast_arn =
       option_of_yojson (value_for_key long_arn_of_yojson "WhatIfForecastArn") _list path;
     what_if_analysis_arn =
       option_of_yojson (value_for_key arn_of_yojson "WhatIfAnalysisArn") _list path;
     estimated_time_remaining_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "EstimatedTimeRemainingInMinutes") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     time_series_transformations =
       option_of_yojson
         (value_for_key time_series_transformations_of_yojson "TimeSeriesTransformations")
         _list path;
     time_series_replacements_data_source =
       option_of_yojson
         (value_for_key time_series_replacements_data_source_of_yojson
            "TimeSeriesReplacementsDataSource")
         _list path;
     forecast_types =
       option_of_yojson (value_for_key forecast_types_of_yojson "ForecastTypes") _list path;
   }
    : describe_what_if_forecast_response)

let describe_what_if_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ what_if_forecast_arn = value_for_key long_arn_of_yojson "WhatIfForecastArn" _list path }
    : describe_what_if_forecast_request)

let time_series_identifiers_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     schema = option_of_yojson (value_for_key schema_of_yojson "Schema") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : time_series_identifiers)

let time_series_selector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_series_identifiers =
       option_of_yojson
         (value_for_key time_series_identifiers_of_yojson "TimeSeriesIdentifiers")
         _list path;
   }
    : time_series_selector)

let describe_what_if_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_analysis_name =
       option_of_yojson (value_for_key name_of_yojson "WhatIfAnalysisName") _list path;
     what_if_analysis_arn =
       option_of_yojson (value_for_key arn_of_yojson "WhatIfAnalysisArn") _list path;
     forecast_arn = option_of_yojson (value_for_key arn_of_yojson "ForecastArn") _list path;
     estimated_time_remaining_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "EstimatedTimeRemainingInMinutes") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     time_series_selector =
       option_of_yojson
         (value_for_key time_series_selector_of_yojson "TimeSeriesSelector")
         _list path;
   }
    : describe_what_if_analysis_response)

let describe_what_if_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ what_if_analysis_arn = value_for_key arn_of_yojson "WhatIfAnalysisArn" _list path }
    : describe_what_if_analysis_request)

let describe_predictor_backtest_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_backtest_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "PredictorBacktestExportJobArn") _list path;
     predictor_backtest_export_job_name =
       option_of_yojson (value_for_key name_of_yojson "PredictorBacktestExportJobName") _list path;
     predictor_arn = option_of_yojson (value_for_key arn_of_yojson "PredictorArn") _list path;
     destination =
       option_of_yojson (value_for_key data_destination_of_yojson "Destination") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : describe_predictor_backtest_export_job_response)

let describe_predictor_backtest_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_backtest_export_job_arn =
       value_for_key arn_of_yojson "PredictorBacktestExportJobArn" _list path;
   }
    : describe_predictor_backtest_export_job_request)

let test_window_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_window_start =
       option_of_yojson (value_for_key timestamp_of_yojson "TestWindowStart") _list path;
     test_window_end =
       option_of_yojson (value_for_key timestamp_of_yojson "TestWindowEnd") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : test_window_summary)

let test_window_details_of_yojson tree path = list_of_yojson test_window_summary_of_yojson tree path

let predictor_execution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     algorithm_arn = option_of_yojson (value_for_key arn_of_yojson "AlgorithmArn") _list path;
     test_windows =
       option_of_yojson (value_for_key test_window_details_of_yojson "TestWindows") _list path;
   }
    : predictor_execution)

let predictor_executions_of_yojson tree path =
  list_of_yojson predictor_execution_of_yojson tree path

let predictor_execution_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_executions =
       option_of_yojson
         (value_for_key predictor_executions_of_yojson "PredictorExecutions")
         _list path;
   }
    : predictor_execution_details)

let encryption_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = value_for_key arn_of_yojson "RoleArn" _list path;
     kms_key_arn = value_for_key kms_key_arn_of_yojson "KMSKeyArn" _list path;
   }
    : encryption_config)

let parameter_value_of_yojson = string_of_yojson
let parameter_key_of_yojson = string_of_yojson

let featurization_method_parameters_of_yojson tree path =
  map_of_yojson parameter_key_of_yojson parameter_value_of_yojson tree path

let featurization_method_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "filling" -> Filling
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FeaturizationMethodName" value)
    | _ -> raise (deserialize_wrong_type_error path "FeaturizationMethodName")
     : featurization_method_name)
    : featurization_method_name)

let featurization_method_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     featurization_method_name =
       value_for_key featurization_method_name_of_yojson "FeaturizationMethodName" _list path;
     featurization_method_parameters =
       option_of_yojson
         (value_for_key featurization_method_parameters_of_yojson "FeaturizationMethodParameters")
         _list path;
   }
    : featurization_method)

let featurization_pipeline_of_yojson tree path =
  list_of_yojson featurization_method_of_yojson tree path

let featurization_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = value_for_key name_of_yojson "AttributeName" _list path;
     featurization_pipeline =
       option_of_yojson
         (value_for_key featurization_pipeline_of_yojson "FeaturizationPipeline")
         _list path;
   }
    : featurization)

let featurizations_of_yojson tree path = list_of_yojson featurization_of_yojson tree path
let forecast_dimensions_of_yojson tree path = list_of_yojson name_of_yojson tree path
let frequency_of_yojson = string_of_yojson

let featurization_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_frequency = value_for_key frequency_of_yojson "ForecastFrequency" _list path;
     forecast_dimensions =
       option_of_yojson
         (value_for_key forecast_dimensions_of_yojson "ForecastDimensions")
         _list path;
     featurizations =
       option_of_yojson (value_for_key featurizations_of_yojson "Featurizations") _list path;
   }
    : featurization_config)

let supplementary_feature_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "Name" _list path;
     value = value_for_key value_of_yojson "Value" _list path;
   }
    : supplementary_feature)

let supplementary_features_of_yojson tree path =
  list_of_yojson supplementary_feature_of_yojson tree path

let input_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = value_for_key arn_of_yojson "DatasetGroupArn" _list path;
     supplementary_features =
       option_of_yojson
         (value_for_key supplementary_features_of_yojson "SupplementaryFeatures")
         _list path;
   }
    : input_data_config)

let scaling_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "Auto" -> Auto
    | `String "Linear" -> Linear
    | `String "Logarithmic" -> Logarithmic
    | `String "ReverseLogarithmic" -> ReverseLogarithmic
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalingType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalingType")
     : scaling_type)
    : scaling_type)

let integer_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "Name" _list path;
     max_value = value_for_key integer_of_yojson "MaxValue" _list path;
     min_value = value_for_key integer_of_yojson "MinValue" _list path;
     scaling_type = option_of_yojson (value_for_key scaling_type_of_yojson "ScalingType") _list path;
   }
    : integer_parameter_range)

let integer_parameter_ranges_of_yojson tree path =
  list_of_yojson integer_parameter_range_of_yojson tree path

let continuous_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "Name" _list path;
     max_value = value_for_key double_of_yojson "MaxValue" _list path;
     min_value = value_for_key double_of_yojson "MinValue" _list path;
     scaling_type = option_of_yojson (value_for_key scaling_type_of_yojson "ScalingType") _list path;
   }
    : continuous_parameter_range)

let continuous_parameter_ranges_of_yojson tree path =
  list_of_yojson continuous_parameter_range_of_yojson tree path

let categorical_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "Name" _list path;
     values = value_for_key values_of_yojson "Values" _list path;
   }
    : categorical_parameter_range)

let categorical_parameter_ranges_of_yojson tree path =
  list_of_yojson categorical_parameter_range_of_yojson tree path

let parameter_ranges_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     categorical_parameter_ranges =
       option_of_yojson
         (value_for_key categorical_parameter_ranges_of_yojson "CategoricalParameterRanges")
         _list path;
     continuous_parameter_ranges =
       option_of_yojson
         (value_for_key continuous_parameter_ranges_of_yojson "ContinuousParameterRanges")
         _list path;
     integer_parameter_ranges =
       option_of_yojson
         (value_for_key integer_parameter_ranges_of_yojson "IntegerParameterRanges")
         _list path;
   }
    : parameter_ranges)

let hyper_parameter_tuning_job_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter_ranges =
       option_of_yojson (value_for_key parameter_ranges_of_yojson "ParameterRanges") _list path;
   }
    : hyper_parameter_tuning_job_config)

let evaluation_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_backtest_windows =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfBacktestWindows") _list path;
     back_test_window_offset =
       option_of_yojson (value_for_key integer_of_yojson "BackTestWindowOffset") _list path;
   }
    : evaluation_parameters)

let training_parameters_of_yojson tree path =
  map_of_yojson parameter_key_of_yojson parameter_value_of_yojson tree path

let describe_predictor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_arn = option_of_yojson (value_for_key name_of_yojson "PredictorArn") _list path;
     predictor_name = option_of_yojson (value_for_key name_of_yojson "PredictorName") _list path;
     algorithm_arn = option_of_yojson (value_for_key arn_of_yojson "AlgorithmArn") _list path;
     auto_ml_algorithm_arns =
       option_of_yojson (value_for_key arn_list_of_yojson "AutoMLAlgorithmArns") _list path;
     forecast_horizon =
       option_of_yojson (value_for_key integer_of_yojson "ForecastHorizon") _list path;
     forecast_types =
       option_of_yojson (value_for_key forecast_types_of_yojson "ForecastTypes") _list path;
     perform_auto_m_l =
       option_of_yojson (value_for_key boolean__of_yojson "PerformAutoML") _list path;
     auto_ml_override_strategy =
       option_of_yojson
         (value_for_key auto_ml_override_strategy_of_yojson "AutoMLOverrideStrategy")
         _list path;
     perform_hp_o = option_of_yojson (value_for_key boolean__of_yojson "PerformHPO") _list path;
     training_parameters =
       option_of_yojson
         (value_for_key training_parameters_of_yojson "TrainingParameters")
         _list path;
     evaluation_parameters =
       option_of_yojson
         (value_for_key evaluation_parameters_of_yojson "EvaluationParameters")
         _list path;
     hpo_config =
       option_of_yojson
         (value_for_key hyper_parameter_tuning_job_config_of_yojson "HPOConfig")
         _list path;
     input_data_config =
       option_of_yojson (value_for_key input_data_config_of_yojson "InputDataConfig") _list path;
     featurization_config =
       option_of_yojson
         (value_for_key featurization_config_of_yojson "FeaturizationConfig")
         _list path;
     encryption_config =
       option_of_yojson (value_for_key encryption_config_of_yojson "EncryptionConfig") _list path;
     predictor_execution_details =
       option_of_yojson
         (value_for_key predictor_execution_details_of_yojson "PredictorExecutionDetails")
         _list path;
     estimated_time_remaining_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "EstimatedTimeRemainingInMinutes") _list path;
     is_auto_predictor =
       option_of_yojson (value_for_key boolean__of_yojson "IsAutoPredictor") _list path;
     dataset_import_job_arns =
       option_of_yojson (value_for_key arn_list_of_yojson "DatasetImportJobArns") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     optimization_metric =
       option_of_yojson
         (value_for_key optimization_metric_of_yojson "OptimizationMetric")
         _list path;
   }
    : describe_predictor_response)

let describe_predictor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ predictor_arn = value_for_key arn_of_yojson "PredictorArn" _list path }
    : describe_predictor_request)

let baseline_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "Name") _list path;
     value = option_of_yojson (value_for_key double_of_yojson "Value") _list path;
   }
    : baseline_metric)

let baseline_metrics_of_yojson tree path = list_of_yojson baseline_metric_of_yojson tree path

let predictor_baseline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline_metrics =
       option_of_yojson (value_for_key baseline_metrics_of_yojson "BaselineMetrics") _list path;
   }
    : predictor_baseline)

let baseline_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_baseline =
       option_of_yojson (value_for_key predictor_baseline_of_yojson "PredictorBaseline") _list path;
   }
    : baseline)

let describe_monitor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitor_name = option_of_yojson (value_for_key name_of_yojson "MonitorName") _list path;
     monitor_arn = option_of_yojson (value_for_key arn_of_yojson "MonitorArn") _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "ResourceArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     last_evaluation_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastEvaluationTime") _list path;
     last_evaluation_state =
       option_of_yojson (value_for_key evaluation_state_of_yojson "LastEvaluationState") _list path;
     baseline = option_of_yojson (value_for_key baseline_of_yojson "Baseline") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     estimated_evaluation_time_remaining_in_minutes =
       option_of_yojson
         (value_for_key long_of_yojson "EstimatedEvaluationTimeRemainingInMinutes")
         _list path;
   }
    : describe_monitor_response)

let describe_monitor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monitor_arn = value_for_key arn_of_yojson "MonitorArn" _list path } : describe_monitor_request)

let describe_forecast_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "ForecastExportJobArn") _list path;
     forecast_export_job_name =
       option_of_yojson (value_for_key name_of_yojson "ForecastExportJobName") _list path;
     forecast_arn = option_of_yojson (value_for_key arn_of_yojson "ForecastArn") _list path;
     destination =
       option_of_yojson (value_for_key data_destination_of_yojson "Destination") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : describe_forecast_export_job_response)

let describe_forecast_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ forecast_export_job_arn = value_for_key arn_of_yojson "ForecastExportJobArn" _list path }
    : describe_forecast_export_job_request)

let describe_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_arn = option_of_yojson (value_for_key arn_of_yojson "ForecastArn") _list path;
     forecast_name = option_of_yojson (value_for_key name_of_yojson "ForecastName") _list path;
     forecast_types =
       option_of_yojson (value_for_key forecast_types_of_yojson "ForecastTypes") _list path;
     predictor_arn = option_of_yojson (value_for_key arn_of_yojson "PredictorArn") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetGroupArn") _list path;
     estimated_time_remaining_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "EstimatedTimeRemainingInMinutes") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     time_series_selector =
       option_of_yojson
         (value_for_key time_series_selector_of_yojson "TimeSeriesSelector")
         _list path;
   }
    : describe_forecast_response)

let describe_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ forecast_arn = value_for_key arn_of_yojson "ForecastArn" _list path }
    : describe_forecast_request)

let describe_explainability_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_export_arn =
       option_of_yojson (value_for_key arn_of_yojson "ExplainabilityExportArn") _list path;
     explainability_export_name =
       option_of_yojson (value_for_key name_of_yojson "ExplainabilityExportName") _list path;
     explainability_arn =
       option_of_yojson (value_for_key arn_of_yojson "ExplainabilityArn") _list path;
     destination =
       option_of_yojson (value_for_key data_destination_of_yojson "Destination") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : describe_explainability_export_response)

let describe_explainability_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ explainability_export_arn = value_for_key arn_of_yojson "ExplainabilityExportArn" _list path }
    : describe_explainability_export_request)

let local_date_time_of_yojson = string_of_yojson

let describe_explainability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_arn =
       option_of_yojson (value_for_key arn_of_yojson "ExplainabilityArn") _list path;
     explainability_name =
       option_of_yojson (value_for_key name_of_yojson "ExplainabilityName") _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "ResourceArn") _list path;
     explainability_config =
       option_of_yojson
         (value_for_key explainability_config_of_yojson "ExplainabilityConfig")
         _list path;
     enable_visualization =
       option_of_yojson (value_for_key boolean__of_yojson "EnableVisualization") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     schema = option_of_yojson (value_for_key schema_of_yojson "Schema") _list path;
     start_date_time =
       option_of_yojson (value_for_key local_date_time_of_yojson "StartDateTime") _list path;
     end_date_time =
       option_of_yojson (value_for_key local_date_time_of_yojson "EndDateTime") _list path;
     estimated_time_remaining_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "EstimatedTimeRemainingInMinutes") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : describe_explainability_response)

let describe_explainability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ explainability_arn = value_for_key arn_of_yojson "ExplainabilityArn" _list path }
    : describe_explainability_request)

let statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     count = option_of_yojson (value_for_key integer_of_yojson "Count") _list path;
     count_distinct = option_of_yojson (value_for_key integer_of_yojson "CountDistinct") _list path;
     count_null = option_of_yojson (value_for_key integer_of_yojson "CountNull") _list path;
     count_nan = option_of_yojson (value_for_key integer_of_yojson "CountNan") _list path;
     min = option_of_yojson (value_for_key string__of_yojson "Min") _list path;
     max = option_of_yojson (value_for_key string__of_yojson "Max") _list path;
     avg = option_of_yojson (value_for_key double_of_yojson "Avg") _list path;
     stddev = option_of_yojson (value_for_key double_of_yojson "Stddev") _list path;
     count_long = option_of_yojson (value_for_key long_of_yojson "CountLong") _list path;
     count_distinct_long =
       option_of_yojson (value_for_key long_of_yojson "CountDistinctLong") _list path;
     count_null_long = option_of_yojson (value_for_key long_of_yojson "CountNullLong") _list path;
     count_nan_long = option_of_yojson (value_for_key long_of_yojson "CountNanLong") _list path;
   }
    : statistics)

let field_statistics_of_yojson tree path =
  map_of_yojson string__of_yojson statistics_of_yojson tree path

let geolocation_format_of_yojson = string_of_yojson
let use_geolocation_for_time_zone_of_yojson = bool_of_yojson
let time_zone_of_yojson = string_of_yojson

let describe_dataset_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_job_name =
       option_of_yojson (value_for_key name_of_yojson "DatasetImportJobName") _list path;
     dataset_import_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "DatasetImportJobArn") _list path;
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetArn") _list path;
     timestamp_format =
       option_of_yojson (value_for_key timestamp_format_of_yojson "TimestampFormat") _list path;
     time_zone = option_of_yojson (value_for_key time_zone_of_yojson "TimeZone") _list path;
     use_geolocation_for_time_zone =
       option_of_yojson
         (value_for_key use_geolocation_for_time_zone_of_yojson "UseGeolocationForTimeZone")
         _list path;
     geolocation_format =
       option_of_yojson (value_for_key geolocation_format_of_yojson "GeolocationFormat") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     estimated_time_remaining_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "EstimatedTimeRemainingInMinutes") _list path;
     field_statistics =
       option_of_yojson (value_for_key field_statistics_of_yojson "FieldStatistics") _list path;
     data_size = option_of_yojson (value_for_key double_of_yojson "DataSize") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
     import_mode = option_of_yojson (value_for_key import_mode_of_yojson "ImportMode") _list path;
   }
    : describe_dataset_import_job_response)

let describe_dataset_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_import_job_arn = value_for_key arn_of_yojson "DatasetImportJobArn" _list path }
    : describe_dataset_import_job_request)

let describe_dataset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_name =
       option_of_yojson (value_for_key name_of_yojson "DatasetGroupName") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetGroupArn") _list path;
     dataset_arns = option_of_yojson (value_for_key arn_list_of_yojson "DatasetArns") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : describe_dataset_group_response)

let describe_dataset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_group_arn = value_for_key arn_of_yojson "DatasetGroupArn" _list path }
    : describe_dataset_group_request)

let describe_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key name_of_yojson "DatasetName") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "Domain") _list path;
     dataset_type = option_of_yojson (value_for_key dataset_type_of_yojson "DatasetType") _list path;
     data_frequency =
       option_of_yojson (value_for_key frequency_of_yojson "DataFrequency") _list path;
     schema = option_of_yojson (value_for_key schema_of_yojson "Schema") _list path;
     encryption_config =
       option_of_yojson (value_for_key encryption_config_of_yojson "EncryptionConfig") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
   }
    : describe_dataset_response)

let describe_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = value_for_key arn_of_yojson "DatasetArn" _list path } : describe_dataset_request)

let hour_of_yojson = int_of_yojson

let day_of_week_of_yojson (tree : t) path =
  ((match tree with
    | `String "MONDAY" -> MONDAY
    | `String "TUESDAY" -> TUESDAY
    | `String "WEDNESDAY" -> WEDNESDAY
    | `String "THURSDAY" -> THURSDAY
    | `String "FRIDAY" -> FRIDAY
    | `String "SATURDAY" -> SATURDAY
    | `String "SUNDAY" -> SUNDAY
    | `String value -> raise (deserialize_unknown_enum_value_error path "DayOfWeek" value)
    | _ -> raise (deserialize_wrong_type_error path "DayOfWeek")
     : day_of_week)
    : day_of_week)

let day_of_month_of_yojson = int_of_yojson

let month_of_yojson (tree : t) path =
  ((match tree with
    | `String "JANUARY" -> JANUARY
    | `String "FEBRUARY" -> FEBRUARY
    | `String "MARCH" -> MARCH
    | `String "APRIL" -> APRIL
    | `String "MAY" -> MAY
    | `String "JUNE" -> JUNE
    | `String "JULY" -> JULY
    | `String "AUGUST" -> AUGUST
    | `String "SEPTEMBER" -> SEPTEMBER
    | `String "OCTOBER" -> OCTOBER
    | `String "NOVEMBER" -> NOVEMBER
    | `String "DECEMBER" -> DECEMBER
    | `String value -> raise (deserialize_unknown_enum_value_error path "Month" value)
    | _ -> raise (deserialize_wrong_type_error path "Month")
     : month)
    : month)

let time_alignment_boundary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     month = option_of_yojson (value_for_key month_of_yojson "Month") _list path;
     day_of_month = option_of_yojson (value_for_key day_of_month_of_yojson "DayOfMonth") _list path;
     day_of_week = option_of_yojson (value_for_key day_of_week_of_yojson "DayOfWeek") _list path;
     hour = option_of_yojson (value_for_key hour_of_yojson "Hour") _list path;
   }
    : time_alignment_boundary)

let monitor_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitor_arn = option_of_yojson (value_for_key arn_of_yojson "MonitorArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
   }
    : monitor_info)

let explainability_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_arn =
       option_of_yojson (value_for_key arn_of_yojson "ExplainabilityArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
   }
    : explainability_info)

let transformations_of_yojson tree path = map_of_yojson name_of_yojson value_of_yojson tree path

let attribute_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_name = value_for_key name_of_yojson "AttributeName" _list path;
     transformations = value_for_key transformations_of_yojson "Transformations" _list path;
   }
    : attribute_config)

let attribute_configs_of_yojson tree path = list_of_yojson attribute_config_of_yojson tree path

let data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = value_for_key arn_of_yojson "DatasetGroupArn" _list path;
     attribute_configs =
       option_of_yojson (value_for_key attribute_configs_of_yojson "AttributeConfigs") _list path;
     additional_datasets =
       option_of_yojson
         (value_for_key additional_datasets_of_yojson "AdditionalDatasets")
         _list path;
   }
    : data_config)

let describe_auto_predictor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_arn = option_of_yojson (value_for_key arn_of_yojson "PredictorArn") _list path;
     predictor_name = option_of_yojson (value_for_key name_of_yojson "PredictorName") _list path;
     forecast_horizon =
       option_of_yojson (value_for_key integer_of_yojson "ForecastHorizon") _list path;
     forecast_types =
       option_of_yojson (value_for_key forecast_types_of_yojson "ForecastTypes") _list path;
     forecast_frequency =
       option_of_yojson (value_for_key frequency_of_yojson "ForecastFrequency") _list path;
     forecast_dimensions =
       option_of_yojson
         (value_for_key forecast_dimensions_of_yojson "ForecastDimensions")
         _list path;
     dataset_import_job_arns =
       option_of_yojson (value_for_key arn_list_of_yojson "DatasetImportJobArns") _list path;
     data_config = option_of_yojson (value_for_key data_config_of_yojson "DataConfig") _list path;
     encryption_config =
       option_of_yojson (value_for_key encryption_config_of_yojson "EncryptionConfig") _list path;
     reference_predictor_summary =
       option_of_yojson
         (value_for_key reference_predictor_summary_of_yojson "ReferencePredictorSummary")
         _list path;
     estimated_time_remaining_in_minutes =
       option_of_yojson (value_for_key long_of_yojson "EstimatedTimeRemainingInMinutes") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "Message") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     last_modification_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModificationTime") _list path;
     optimization_metric =
       option_of_yojson
         (value_for_key optimization_metric_of_yojson "OptimizationMetric")
         _list path;
     explainability_info =
       option_of_yojson
         (value_for_key explainability_info_of_yojson "ExplainabilityInfo")
         _list path;
     monitor_info = option_of_yojson (value_for_key monitor_info_of_yojson "MonitorInfo") _list path;
     time_alignment_boundary =
       option_of_yojson
         (value_for_key time_alignment_boundary_of_yojson "TimeAlignmentBoundary")
         _list path;
   }
    : describe_auto_predictor_response)

let describe_auto_predictor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ predictor_arn = value_for_key arn_of_yojson "PredictorArn" _list path }
    : describe_auto_predictor_request)

let delete_what_if_forecast_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_export_arn =
       value_for_key long_arn_of_yojson "WhatIfForecastExportArn" _list path;
   }
    : delete_what_if_forecast_export_request)

let delete_what_if_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ what_if_forecast_arn = value_for_key long_arn_of_yojson "WhatIfForecastArn" _list path }
    : delete_what_if_forecast_request)

let delete_what_if_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ what_if_analysis_arn = value_for_key arn_of_yojson "WhatIfAnalysisArn" _list path }
    : delete_what_if_analysis_request)

let delete_resource_tree_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path }
    : delete_resource_tree_request)

let delete_predictor_backtest_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_backtest_export_job_arn =
       value_for_key arn_of_yojson "PredictorBacktestExportJobArn" _list path;
   }
    : delete_predictor_backtest_export_job_request)

let delete_predictor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ predictor_arn = value_for_key arn_of_yojson "PredictorArn" _list path }
    : delete_predictor_request)

let delete_monitor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monitor_arn = value_for_key arn_of_yojson "MonitorArn" _list path } : delete_monitor_request)

let delete_forecast_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ forecast_export_job_arn = value_for_key arn_of_yojson "ForecastExportJobArn" _list path }
    : delete_forecast_export_job_request)

let delete_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ forecast_arn = value_for_key arn_of_yojson "ForecastArn" _list path }
    : delete_forecast_request)

let delete_explainability_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ explainability_export_arn = value_for_key arn_of_yojson "ExplainabilityExportArn" _list path }
    : delete_explainability_export_request)

let delete_explainability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ explainability_arn = value_for_key arn_of_yojson "ExplainabilityArn" _list path }
    : delete_explainability_request)

let delete_dataset_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_import_job_arn = value_for_key arn_of_yojson "DatasetImportJobArn" _list path }
    : delete_dataset_import_job_request)

let delete_dataset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_group_arn = value_for_key arn_of_yojson "DatasetGroupArn" _list path }
    : delete_dataset_group_request)

let delete_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = value_for_key arn_of_yojson "DatasetArn" _list path } : delete_dataset_request)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_already_exists_exception)

let create_what_if_forecast_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_export_arn =
       option_of_yojson (value_for_key long_arn_of_yojson "WhatIfForecastExportArn") _list path;
   }
    : create_what_if_forecast_export_response)

let create_what_if_forecast_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_export_name =
       value_for_key name_of_yojson "WhatIfForecastExportName" _list path;
     what_if_forecast_arns =
       value_for_key what_if_forecast_arn_list_for_export_of_yojson "WhatIfForecastArns" _list path;
     destination = value_for_key data_destination_of_yojson "Destination" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : create_what_if_forecast_export_request)

let create_what_if_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_arn =
       option_of_yojson (value_for_key long_arn_of_yojson "WhatIfForecastArn") _list path;
   }
    : create_what_if_forecast_response)

let create_what_if_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_forecast_name = value_for_key name_of_yojson "WhatIfForecastName" _list path;
     what_if_analysis_arn = value_for_key arn_of_yojson "WhatIfAnalysisArn" _list path;
     time_series_transformations =
       option_of_yojson
         (value_for_key time_series_transformations_of_yojson "TimeSeriesTransformations")
         _list path;
     time_series_replacements_data_source =
       option_of_yojson
         (value_for_key time_series_replacements_data_source_of_yojson
            "TimeSeriesReplacementsDataSource")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_what_if_forecast_request)

let create_what_if_analysis_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_analysis_arn =
       option_of_yojson (value_for_key arn_of_yojson "WhatIfAnalysisArn") _list path;
   }
    : create_what_if_analysis_response)

let create_what_if_analysis_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     what_if_analysis_name = value_for_key name_of_yojson "WhatIfAnalysisName" _list path;
     forecast_arn = value_for_key arn_of_yojson "ForecastArn" _list path;
     time_series_selector =
       option_of_yojson
         (value_for_key time_series_selector_of_yojson "TimeSeriesSelector")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_what_if_analysis_request)

let create_predictor_backtest_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_backtest_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "PredictorBacktestExportJobArn") _list path;
   }
    : create_predictor_backtest_export_job_response)

let create_predictor_backtest_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_backtest_export_job_name =
       value_for_key name_of_yojson "PredictorBacktestExportJobName" _list path;
     predictor_arn = value_for_key arn_of_yojson "PredictorArn" _list path;
     destination = value_for_key data_destination_of_yojson "Destination" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : create_predictor_backtest_export_job_request)

let create_predictor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ predictor_arn = option_of_yojson (value_for_key arn_of_yojson "PredictorArn") _list path }
    : create_predictor_response)

let create_predictor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_name = value_for_key name_of_yojson "PredictorName" _list path;
     algorithm_arn = option_of_yojson (value_for_key arn_of_yojson "AlgorithmArn") _list path;
     forecast_horizon = value_for_key integer_of_yojson "ForecastHorizon" _list path;
     forecast_types =
       option_of_yojson (value_for_key forecast_types_of_yojson "ForecastTypes") _list path;
     perform_auto_m_l =
       option_of_yojson (value_for_key boolean__of_yojson "PerformAutoML") _list path;
     auto_ml_override_strategy =
       option_of_yojson
         (value_for_key auto_ml_override_strategy_of_yojson "AutoMLOverrideStrategy")
         _list path;
     perform_hp_o = option_of_yojson (value_for_key boolean__of_yojson "PerformHPO") _list path;
     training_parameters =
       option_of_yojson
         (value_for_key training_parameters_of_yojson "TrainingParameters")
         _list path;
     evaluation_parameters =
       option_of_yojson
         (value_for_key evaluation_parameters_of_yojson "EvaluationParameters")
         _list path;
     hpo_config =
       option_of_yojson
         (value_for_key hyper_parameter_tuning_job_config_of_yojson "HPOConfig")
         _list path;
     input_data_config = value_for_key input_data_config_of_yojson "InputDataConfig" _list path;
     featurization_config =
       value_for_key featurization_config_of_yojson "FeaturizationConfig" _list path;
     encryption_config =
       option_of_yojson (value_for_key encryption_config_of_yojson "EncryptionConfig") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     optimization_metric =
       option_of_yojson
         (value_for_key optimization_metric_of_yojson "OptimizationMetric")
         _list path;
   }
    : create_predictor_request)

let create_monitor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monitor_arn = option_of_yojson (value_for_key arn_of_yojson "MonitorArn") _list path }
    : create_monitor_response)

let create_monitor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monitor_name = value_for_key name_of_yojson "MonitorName" _list path;
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_monitor_request)

let create_forecast_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "ForecastExportJobArn") _list path;
   }
    : create_forecast_export_job_response)

let create_forecast_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_export_job_name = value_for_key name_of_yojson "ForecastExportJobName" _list path;
     forecast_arn = value_for_key arn_of_yojson "ForecastArn" _list path;
     destination = value_for_key data_destination_of_yojson "Destination" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : create_forecast_export_job_request)

let create_forecast_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ forecast_arn = option_of_yojson (value_for_key arn_of_yojson "ForecastArn") _list path }
    : create_forecast_response)

let create_forecast_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     forecast_name = value_for_key name_of_yojson "ForecastName" _list path;
     predictor_arn = value_for_key arn_of_yojson "PredictorArn" _list path;
     forecast_types =
       option_of_yojson (value_for_key forecast_types_of_yojson "ForecastTypes") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     time_series_selector =
       option_of_yojson
         (value_for_key time_series_selector_of_yojson "TimeSeriesSelector")
         _list path;
   }
    : create_forecast_request)

let create_explainability_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_export_arn =
       option_of_yojson (value_for_key arn_of_yojson "ExplainabilityExportArn") _list path;
   }
    : create_explainability_export_response)

let create_explainability_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_export_name = value_for_key name_of_yojson "ExplainabilityExportName" _list path;
     explainability_arn = value_for_key arn_of_yojson "ExplainabilityArn" _list path;
     destination = value_for_key data_destination_of_yojson "Destination" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
   }
    : create_explainability_export_request)

let create_explainability_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_arn =
       option_of_yojson (value_for_key arn_of_yojson "ExplainabilityArn") _list path;
   }
    : create_explainability_response)

let create_explainability_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     explainability_name = value_for_key name_of_yojson "ExplainabilityName" _list path;
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     explainability_config =
       value_for_key explainability_config_of_yojson "ExplainabilityConfig" _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "DataSource") _list path;
     schema = option_of_yojson (value_for_key schema_of_yojson "Schema") _list path;
     enable_visualization =
       option_of_yojson (value_for_key boolean__of_yojson "EnableVisualization") _list path;
     start_date_time =
       option_of_yojson (value_for_key local_date_time_of_yojson "StartDateTime") _list path;
     end_date_time =
       option_of_yojson (value_for_key local_date_time_of_yojson "EndDateTime") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_explainability_request)

let create_dataset_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "DatasetImportJobArn") _list path;
   }
    : create_dataset_import_job_response)

let create_dataset_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_job_name = value_for_key name_of_yojson "DatasetImportJobName" _list path;
     dataset_arn = value_for_key arn_of_yojson "DatasetArn" _list path;
     data_source = value_for_key data_source_of_yojson "DataSource" _list path;
     timestamp_format =
       option_of_yojson (value_for_key timestamp_format_of_yojson "TimestampFormat") _list path;
     time_zone = option_of_yojson (value_for_key time_zone_of_yojson "TimeZone") _list path;
     use_geolocation_for_time_zone =
       option_of_yojson
         (value_for_key use_geolocation_for_time_zone_of_yojson "UseGeolocationForTimeZone")
         _list path;
     geolocation_format =
       option_of_yojson (value_for_key geolocation_format_of_yojson "GeolocationFormat") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     format = option_of_yojson (value_for_key format_of_yojson "Format") _list path;
     import_mode = option_of_yojson (value_for_key import_mode_of_yojson "ImportMode") _list path;
   }
    : create_dataset_import_job_request)

let create_dataset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetGroupArn") _list path;
   }
    : create_dataset_group_response)

let create_dataset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_name = value_for_key name_of_yojson "DatasetGroupName" _list path;
     domain = value_for_key domain_of_yojson "Domain" _list path;
     dataset_arns = option_of_yojson (value_for_key arn_list_of_yojson "DatasetArns") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_dataset_group_request)

let create_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = option_of_yojson (value_for_key arn_of_yojson "DatasetArn") _list path }
    : create_dataset_response)

let create_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_name = value_for_key name_of_yojson "DatasetName" _list path;
     domain = value_for_key domain_of_yojson "Domain" _list path;
     dataset_type = value_for_key dataset_type_of_yojson "DatasetType" _list path;
     data_frequency =
       option_of_yojson (value_for_key frequency_of_yojson "DataFrequency") _list path;
     schema = value_for_key schema_of_yojson "Schema" _list path;
     encryption_config =
       option_of_yojson (value_for_key encryption_config_of_yojson "EncryptionConfig") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_dataset_request)

let create_auto_predictor_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ predictor_arn = option_of_yojson (value_for_key arn_of_yojson "PredictorArn") _list path }
    : create_auto_predictor_response)

let monitor_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ monitor_name = value_for_key name_of_yojson "MonitorName" _list path } : monitor_config)

let create_auto_predictor_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     predictor_name = value_for_key name_of_yojson "PredictorName" _list path;
     forecast_horizon =
       option_of_yojson (value_for_key integer_of_yojson "ForecastHorizon") _list path;
     forecast_types =
       option_of_yojson (value_for_key forecast_types_of_yojson "ForecastTypes") _list path;
     forecast_dimensions =
       option_of_yojson
         (value_for_key forecast_dimensions_of_yojson "ForecastDimensions")
         _list path;
     forecast_frequency =
       option_of_yojson (value_for_key frequency_of_yojson "ForecastFrequency") _list path;
     data_config = option_of_yojson (value_for_key data_config_of_yojson "DataConfig") _list path;
     encryption_config =
       option_of_yojson (value_for_key encryption_config_of_yojson "EncryptionConfig") _list path;
     reference_predictor_arn =
       option_of_yojson (value_for_key arn_of_yojson "ReferencePredictorArn") _list path;
     optimization_metric =
       option_of_yojson
         (value_for_key optimization_metric_of_yojson "OptimizationMetric")
         _list path;
     explain_predictor =
       option_of_yojson (value_for_key boolean__of_yojson "ExplainPredictor") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     monitor_config =
       option_of_yojson (value_for_key monitor_config_of_yojson "MonitorConfig") _list path;
     time_alignment_boundary =
       option_of_yojson
         (value_for_key time_alignment_boundary_of_yojson "TimeAlignmentBoundary")
         _list path;
   }
    : create_auto_predictor_request)
