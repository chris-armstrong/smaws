open Types

let make_weighted_quantile_loss ?loss_value:(loss_value_ : double option)
    ?quantile:(quantile_ : double option) () =
  ({ loss_value = loss_value_; quantile = quantile_ } : weighted_quantile_loss)

let make_error_metric ?map_e:(map_e_ : double option) ?mas_e:(mas_e_ : double option)
    ?rms_e:(rms_e_ : double option) ?wap_e:(wap_e_ : double option)
    ?forecast_type:(forecast_type_ : forecast_type option) () =
  ({
     map_e = map_e_;
     mas_e = mas_e_;
     rms_e = rms_e_;
     wap_e = wap_e_;
     forecast_type = forecast_type_;
   }
    : error_metric)

let make_metrics ?average_weighted_quantile_loss:(average_weighted_quantile_loss_ : double option)
    ?error_metrics:(error_metrics_ : error_metrics option)
    ?weighted_quantile_losses:(weighted_quantile_losses_ : weighted_quantile_losses option)
    ?rms_e:(rms_e_ : double option) () =
  ({
     average_weighted_quantile_loss = average_weighted_quantile_loss_;
     error_metrics = error_metrics_;
     weighted_quantile_losses = weighted_quantile_losses_;
     rms_e = rms_e_;
   }
    : metrics)

let make_window_summary ?metrics:(metrics_ : metrics option)
    ?evaluation_type:(evaluation_type_ : evaluation_type option)
    ?item_count:(item_count_ : integer option)
    ?test_window_end:(test_window_end_ : timestamp option)
    ?test_window_start:(test_window_start_ : timestamp option) () =
  ({
     metrics = metrics_;
     evaluation_type = evaluation_type_;
     item_count = item_count_;
     test_window_end = test_window_end_;
     test_window_start = test_window_start_;
   }
    : window_summary)

let make_what_if_forecast_summary
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option)
    ?what_if_forecast_name:(what_if_forecast_name_ : name option)
    ?what_if_forecast_arn:(what_if_forecast_arn_ : long_arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     what_if_analysis_arn = what_if_analysis_arn_;
     what_if_forecast_name = what_if_forecast_name_;
     what_if_forecast_arn = what_if_forecast_arn_;
   }
    : what_if_forecast_summary)

let make_s3_config ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ~role_arn:(role_arn_ : arn)
    ~path:(path_ : s3_path) () =
  ({ kms_key_arn = kms_key_arn_; role_arn = role_arn_; path = path_ } : s3_config)

let make_data_destination ~s3_config:(s3_config_ : s3_config) () =
  ({ s3_config = s3_config_ } : data_destination)

let make_what_if_forecast_export_summary
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?destination:(destination_ : data_destination option)
    ?what_if_forecast_export_name:(what_if_forecast_export_name_ : name option)
    ?what_if_forecast_arns:(what_if_forecast_arns_ : what_if_forecast_arn_list_for_export option)
    ?what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     destination = destination_;
     what_if_forecast_export_name = what_if_forecast_export_name_;
     what_if_forecast_arns = what_if_forecast_arns_;
     what_if_forecast_export_arn = what_if_forecast_export_arn_;
   }
    : what_if_forecast_export_summary)

let make_what_if_analysis_summary
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?forecast_arn:(forecast_arn_ : arn option)
    ?what_if_analysis_name:(what_if_analysis_name_ : name option)
    ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     forecast_arn = forecast_arn_;
     what_if_analysis_name = what_if_analysis_name_;
     what_if_analysis_arn = what_if_analysis_arn_;
   }
    : what_if_analysis_summary)

let make_update_dataset_group_response () = (() : unit)

let make_update_dataset_group_request ~dataset_arns:(dataset_arns_ : arn_list)
    ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_arns = dataset_arns_; dataset_group_arn = dataset_group_arn_ }
    : update_dataset_group_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys) ~resource_arn:(resource_arn_ : arn)
    () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_action ~value:(value_ : double) ~operation:(operation_ : operation)
    ~attribute_name:(attribute_name_ : name) () =
  ({ value = value_; operation = operation_; attribute_name = attribute_name_ } : action)

let make_time_series_condition ~condition:(condition_ : condition)
    ~attribute_value:(attribute_value_ : attribute_value) ~attribute_name:(attribute_name_ : name)
    () =
  ({ condition = condition_; attribute_value = attribute_value_; attribute_name = attribute_name_ }
    : time_series_condition)

let make_time_series_transformation
    ?time_series_conditions:(time_series_conditions_ : time_series_conditions option)
    ?action:(action_ : action option) () =
  ({ time_series_conditions = time_series_conditions_; action = action_ }
    : time_series_transformation)

let make_data_source ~s3_config:(s3_config_ : s3_config) () =
  ({ s3_config = s3_config_ } : data_source)

let make_schema_attribute ?attribute_type:(attribute_type_ : attribute_type option)
    ?attribute_name:(attribute_name_ : name option) () =
  ({ attribute_type = attribute_type_; attribute_name = attribute_name_ } : schema_attribute)

let make_schema ?attributes:(attributes_ : schema_attributes option) () =
  ({ attributes = attributes_ } : schema)

let make_time_series_identifiers ?format:(format_ : format option) ?schema:(schema_ : schema option)
    ?data_source:(data_source_ : data_source option) () =
  ({ format = format_; schema = schema_; data_source = data_source_ } : time_series_identifiers)

let make_time_series_selector
    ?time_series_identifiers:(time_series_identifiers_ : time_series_identifiers option) () =
  ({ time_series_identifiers = time_series_identifiers_ } : time_series_selector)

let make_time_series_replacements_data_source
    ?timestamp_format:(timestamp_format_ : timestamp_format option)
    ?format:(format_ : format option) ~schema:(schema_ : schema) ~s3_config:(s3_config_ : s3_config)
    () =
  ({
     timestamp_format = timestamp_format_;
     format = format_;
     schema = schema_;
     s3_config = s3_config_;
   }
    : time_series_replacements_data_source)

let make_time_alignment_boundary ?hour:(hour_ : hour option)
    ?day_of_week:(day_of_week_ : day_of_week option)
    ?day_of_month:(day_of_month_ : day_of_month option) ?month:(month_ : month option) () =
  ({ hour = hour_; day_of_week = day_of_week_; day_of_month = day_of_month_; month = month_ }
    : time_alignment_boundary)

let make_test_window_summary ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?test_window_end:(test_window_end_ : timestamp option)
    ?test_window_start:(test_window_start_ : timestamp option) () =
  ({
     message = message_;
     status = status_;
     test_window_end = test_window_end_;
     test_window_start = test_window_start_;
   }
    : test_window_summary)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags) ~resource_arn:(resource_arn_ : arn) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_supplementary_feature ~value:(value_ : value) ~name:(name_ : name) () =
  ({ value = value_; name = name_ } : supplementary_feature)

let make_stop_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : stop_resource_request)

let make_statistics ?count_nan_long:(count_nan_long_ : long option)
    ?count_null_long:(count_null_long_ : long option)
    ?count_distinct_long:(count_distinct_long_ : long option)
    ?count_long:(count_long_ : long option) ?stddev:(stddev_ : double option)
    ?avg:(avg_ : double option) ?max:(max_ : string_ option) ?min:(min_ : string_ option)
    ?count_nan:(count_nan_ : integer option) ?count_null:(count_null_ : integer option)
    ?count_distinct:(count_distinct_ : integer option) ?count:(count_ : integer option) () =
  ({
     count_nan_long = count_nan_long_;
     count_null_long = count_null_long_;
     count_distinct_long = count_distinct_long_;
     count_long = count_long_;
     stddev = stddev_;
     avg = avg_;
     max = max_;
     min = min_;
     count_nan = count_nan_;
     count_null = count_null_;
     count_distinct = count_distinct_;
     count = count_;
   }
    : statistics)

let make_resume_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : resume_resource_request)

let make_reference_predictor_summary ?state:(state_ : state option) ?arn:(arn_ : arn option) () =
  ({ state = state_; arn = arn_ } : reference_predictor_summary)

let make_predictor_summary ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option)
    ?reference_predictor_summary:(reference_predictor_summary_ : reference_predictor_summary option)
    ?is_auto_predictor:(is_auto_predictor_ : boolean_ option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?predictor_name:(predictor_name_ : name option) ?predictor_arn:(predictor_arn_ : arn option) ()
    =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     reference_predictor_summary = reference_predictor_summary_;
     is_auto_predictor = is_auto_predictor_;
     dataset_group_arn = dataset_group_arn_;
     predictor_name = predictor_name_;
     predictor_arn = predictor_arn_;
   }
    : predictor_summary)

let make_predictor_event ?datetime:(datetime_ : timestamp option) ?detail:(detail_ : detail option)
    () =
  ({ datetime = datetime_; detail = detail_ } : predictor_event)

let make_monitor_data_source ?predictor_arn:(predictor_arn_ : arn option)
    ?forecast_arn:(forecast_arn_ : arn option)
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option) () =
  ({
     predictor_arn = predictor_arn_;
     forecast_arn = forecast_arn_;
     dataset_import_job_arn = dataset_import_job_arn_;
   }
    : monitor_data_source)

let make_predictor_monitor_evaluation ?message:(message_ : message option)
    ?num_items_evaluated:(num_items_evaluated_ : long option)
    ?metric_results:(metric_results_ : metric_results option)
    ?monitor_data_source:(monitor_data_source_ : monitor_data_source option)
    ?predictor_event:(predictor_event_ : predictor_event option)
    ?window_end_datetime:(window_end_datetime_ : timestamp option)
    ?window_start_datetime:(window_start_datetime_ : timestamp option)
    ?evaluation_state:(evaluation_state_ : evaluation_state option)
    ?evaluation_time:(evaluation_time_ : timestamp option) ?monitor_arn:(monitor_arn_ : arn option)
    ?resource_arn:(resource_arn_ : arn option) () =
  ({
     message = message_;
     num_items_evaluated = num_items_evaluated_;
     metric_results = metric_results_;
     monitor_data_source = monitor_data_source_;
     predictor_event = predictor_event_;
     window_end_datetime = window_end_datetime_;
     window_start_datetime = window_start_datetime_;
     evaluation_state = evaluation_state_;
     evaluation_time = evaluation_time_;
     monitor_arn = monitor_arn_;
     resource_arn = resource_arn_;
   }
    : predictor_monitor_evaluation)

let make_predictor_execution ?test_windows:(test_windows_ : test_window_details option)
    ?algorithm_arn:(algorithm_arn_ : arn option) () =
  ({ test_windows = test_windows_; algorithm_arn = algorithm_arn_ } : predictor_execution)

let make_predictor_execution_details
    ?predictor_executions:(predictor_executions_ : predictor_executions option) () =
  ({ predictor_executions = predictor_executions_ } : predictor_execution_details)

let make_baseline_metric ?value:(value_ : double option) ?name:(name_ : name option) () =
  ({ value = value_; name = name_ } : baseline_metric)

let make_predictor_baseline ?baseline_metrics:(baseline_metrics_ : baseline_metrics option) () =
  ({ baseline_metrics = baseline_metrics_ } : predictor_baseline)

let make_predictor_backtest_export_job_summary
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?destination:(destination_ : data_destination option)
    ?predictor_backtest_export_job_name:(predictor_backtest_export_job_name_ : name option)
    ?predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     destination = destination_;
     predictor_backtest_export_job_name = predictor_backtest_export_job_name_;
     predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_;
   }
    : predictor_backtest_export_job_summary)

let make_categorical_parameter_range ~values:(values_ : values) ~name:(name_ : name) () =
  ({ values = values_; name = name_ } : categorical_parameter_range)

let make_continuous_parameter_range ?scaling_type:(scaling_type_ : scaling_type option)
    ~min_value:(min_value_ : double) ~max_value:(max_value_ : double) ~name:(name_ : name) () =
  ({ scaling_type = scaling_type_; min_value = min_value_; max_value = max_value_; name = name_ }
    : continuous_parameter_range)

let make_integer_parameter_range ?scaling_type:(scaling_type_ : scaling_type option)
    ~min_value:(min_value_ : integer) ~max_value:(max_value_ : integer) ~name:(name_ : name) () =
  ({ scaling_type = scaling_type_; min_value = min_value_; max_value = max_value_; name = name_ }
    : integer_parameter_range)

let make_parameter_ranges
    ?integer_parameter_ranges:(integer_parameter_ranges_ : integer_parameter_ranges option)
    ?continuous_parameter_ranges:(continuous_parameter_ranges_ : continuous_parameter_ranges option)
    ?categorical_parameter_ranges:
      (categorical_parameter_ranges_ : categorical_parameter_ranges option) () =
  ({
     integer_parameter_ranges = integer_parameter_ranges_;
     continuous_parameter_ranges = continuous_parameter_ranges_;
     categorical_parameter_ranges = categorical_parameter_ranges_;
   }
    : parameter_ranges)

let make_monitor_summary ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : status option)
    ?resource_arn:(resource_arn_ : arn option) ?monitor_name:(monitor_name_ : name option)
    ?monitor_arn:(monitor_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     resource_arn = resource_arn_;
     monitor_name = monitor_name_;
     monitor_arn = monitor_arn_;
   }
    : monitor_summary)

let make_monitor_info ?status:(status_ : status option) ?monitor_arn:(monitor_arn_ : arn option) ()
    =
  ({ status = status_; monitor_arn = monitor_arn_ } : monitor_info)

let make_monitor_config ~monitor_name:(monitor_name_ : name) () =
  ({ monitor_name = monitor_name_ } : monitor_config)

let make_list_what_if_forecasts_response ?next_token:(next_token_ : next_token option)
    ?what_if_forecasts:(what_if_forecasts_ : what_if_forecasts option) () =
  ({ next_token = next_token_; what_if_forecasts = what_if_forecasts_ }
    : list_what_if_forecasts_response)

let make_filter ~condition:(condition_ : filter_condition_string) ~value:(value_ : arn)
    ~key:(key_ : string_) () =
  ({ condition = condition_; value = value_; key = key_ } : filter)

let make_list_what_if_forecasts_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_what_if_forecasts_request)

let make_list_what_if_forecast_exports_response ?next_token:(next_token_ : next_token option)
    ?what_if_forecast_exports:(what_if_forecast_exports_ : what_if_forecast_exports option) () =
  ({ next_token = next_token_; what_if_forecast_exports = what_if_forecast_exports_ }
    : list_what_if_forecast_exports_response)

let make_list_what_if_forecast_exports_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_what_if_forecast_exports_request)

let make_list_what_if_analyses_response ?next_token:(next_token_ : next_token option)
    ?what_if_analyses:(what_if_analyses_ : what_if_analyses option) () =
  ({ next_token = next_token_; what_if_analyses = what_if_analyses_ }
    : list_what_if_analyses_response)

let make_list_what_if_analyses_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_what_if_analyses_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_predictors_response ?next_token:(next_token_ : next_token option)
    ?predictors:(predictors_ : predictors option) () =
  ({ next_token = next_token_; predictors = predictors_ } : list_predictors_response)

let make_list_predictors_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_predictors_request)

let make_list_predictor_backtest_export_jobs_response ?next_token:(next_token_ : next_token option)
    ?predictor_backtest_export_jobs:
      (predictor_backtest_export_jobs_ : predictor_backtest_export_jobs option) () =
  ({ next_token = next_token_; predictor_backtest_export_jobs = predictor_backtest_export_jobs_ }
    : list_predictor_backtest_export_jobs_response)

let make_list_predictor_backtest_export_jobs_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_predictor_backtest_export_jobs_request)

let make_list_monitors_response ?next_token:(next_token_ : next_token option)
    ?monitors:(monitors_ : monitors option) () =
  ({ next_token = next_token_; monitors = monitors_ } : list_monitors_response)

let make_list_monitors_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_monitors_request)

let make_list_monitor_evaluations_response
    ?predictor_monitor_evaluations:
      (predictor_monitor_evaluations_ : predictor_monitor_evaluations option)
    ?next_token:(next_token_ : next_token option) () =
  ({ predictor_monitor_evaluations = predictor_monitor_evaluations_; next_token = next_token_ }
    : list_monitor_evaluations_response)

let make_list_monitor_evaluations_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~monitor_arn:(monitor_arn_ : arn) () =
  ({
     filters = filters_;
     monitor_arn = monitor_arn_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_monitor_evaluations_request)

let make_forecast_summary ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?dataset_group_arn:(dataset_group_arn_ : string_ option)
    ?created_using_auto_predictor:(created_using_auto_predictor_ : boolean_ option)
    ?predictor_arn:(predictor_arn_ : string_ option) ?forecast_name:(forecast_name_ : name option)
    ?forecast_arn:(forecast_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     dataset_group_arn = dataset_group_arn_;
     created_using_auto_predictor = created_using_auto_predictor_;
     predictor_arn = predictor_arn_;
     forecast_name = forecast_name_;
     forecast_arn = forecast_arn_;
   }
    : forecast_summary)

let make_list_forecasts_response ?next_token:(next_token_ : next_token option)
    ?forecasts:(forecasts_ : forecasts option) () =
  ({ next_token = next_token_; forecasts = forecasts_ } : list_forecasts_response)

let make_list_forecasts_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_forecasts_request)

let make_forecast_export_job_summary
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?destination:(destination_ : data_destination option)
    ?forecast_export_job_name:(forecast_export_job_name_ : name option)
    ?forecast_export_job_arn:(forecast_export_job_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     destination = destination_;
     forecast_export_job_name = forecast_export_job_name_;
     forecast_export_job_arn = forecast_export_job_arn_;
   }
    : forecast_export_job_summary)

let make_list_forecast_export_jobs_response ?next_token:(next_token_ : next_token option)
    ?forecast_export_jobs:(forecast_export_jobs_ : forecast_export_jobs option) () =
  ({ next_token = next_token_; forecast_export_jobs = forecast_export_jobs_ }
    : list_forecast_export_jobs_response)

let make_list_forecast_export_jobs_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_forecast_export_jobs_request)

let make_explainability_export_summary
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?destination:(destination_ : data_destination option)
    ?explainability_export_name:(explainability_export_name_ : name option)
    ?explainability_export_arn:(explainability_export_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     destination = destination_;
     explainability_export_name = explainability_export_name_;
     explainability_export_arn = explainability_export_arn_;
   }
    : explainability_export_summary)

let make_list_explainability_exports_response ?next_token:(next_token_ : next_token option)
    ?explainability_exports:(explainability_exports_ : explainability_exports option) () =
  ({ next_token = next_token_; explainability_exports = explainability_exports_ }
    : list_explainability_exports_response)

let make_list_explainability_exports_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_explainability_exports_request)

let make_explainability_config
    ~time_point_granularity:(time_point_granularity_ : time_point_granularity)
    ~time_series_granularity:(time_series_granularity_ : time_series_granularity) () =
  ({
     time_point_granularity = time_point_granularity_;
     time_series_granularity = time_series_granularity_;
   }
    : explainability_config)

let make_explainability_summary ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : message option)
    ?status:(status_ : status option)
    ?explainability_config:(explainability_config_ : explainability_config option)
    ?resource_arn:(resource_arn_ : arn option)
    ?explainability_name:(explainability_name_ : name option)
    ?explainability_arn:(explainability_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     explainability_config = explainability_config_;
     resource_arn = resource_arn_;
     explainability_name = explainability_name_;
     explainability_arn = explainability_arn_;
   }
    : explainability_summary)

let make_list_explainabilities_response ?next_token:(next_token_ : next_token option)
    ?explainabilities:(explainabilities_ : explainabilities option) () =
  ({ next_token = next_token_; explainabilities = explainabilities_ }
    : list_explainabilities_response)

let make_list_explainabilities_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_explainabilities_request)

let make_dataset_summary ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?domain:(domain_ : domain option)
    ?dataset_type:(dataset_type_ : dataset_type option) ?dataset_name:(dataset_name_ : name option)
    ?dataset_arn:(dataset_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     domain = domain_;
     dataset_type = dataset_type_;
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
   }
    : dataset_summary)

let make_list_datasets_response ?next_token:(next_token_ : next_token option)
    ?datasets:(datasets_ : datasets option) () =
  ({ next_token = next_token_; datasets = datasets_ } : list_datasets_response)

let make_list_datasets_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_datasets_request)

let make_dataset_import_job_summary ?import_mode:(import_mode_ : import_mode option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : status option) ?data_source:(data_source_ : data_source option)
    ?dataset_import_job_name:(dataset_import_job_name_ : name option)
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option) () =
  ({
     import_mode = import_mode_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     data_source = data_source_;
     dataset_import_job_name = dataset_import_job_name_;
     dataset_import_job_arn = dataset_import_job_arn_;
   }
    : dataset_import_job_summary)

let make_list_dataset_import_jobs_response ?next_token:(next_token_ : next_token option)
    ?dataset_import_jobs:(dataset_import_jobs_ : dataset_import_jobs option) () =
  ({ next_token = next_token_; dataset_import_jobs = dataset_import_jobs_ }
    : list_dataset_import_jobs_response)

let make_list_dataset_import_jobs_request ?filters:(filters_ : filters option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ filters = filters_; max_results = max_results_; next_token = next_token_ }
    : list_dataset_import_jobs_request)

let make_dataset_group_summary ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?dataset_group_name:(dataset_group_name_ : name option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     dataset_group_name = dataset_group_name_;
     dataset_group_arn = dataset_group_arn_;
   }
    : dataset_group_summary)

let make_list_dataset_groups_response ?next_token:(next_token_ : next_token option)
    ?dataset_groups:(dataset_groups_ : dataset_groups option) () =
  ({ next_token = next_token_; dataset_groups = dataset_groups_ } : list_dataset_groups_response)

let make_list_dataset_groups_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_dataset_groups_request)

let make_input_data_config
    ?supplementary_features:(supplementary_features_ : supplementary_features option)
    ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ supplementary_features = supplementary_features_; dataset_group_arn = dataset_group_arn_ }
    : input_data_config)

let make_hyper_parameter_tuning_job_config
    ?parameter_ranges:(parameter_ranges_ : parameter_ranges option) () =
  ({ parameter_ranges = parameter_ranges_ } : hyper_parameter_tuning_job_config)

let make_get_accuracy_metrics_response
    ?optimization_metric:(optimization_metric_ : optimization_metric option)
    ?auto_ml_override_strategy:(auto_ml_override_strategy_ : auto_ml_override_strategy option)
    ?is_auto_predictor:(is_auto_predictor_ : boolean_ option)
    ?predictor_evaluation_results:
      (predictor_evaluation_results_ : predictor_evaluation_results option) () =
  ({
     optimization_metric = optimization_metric_;
     auto_ml_override_strategy = auto_ml_override_strategy_;
     is_auto_predictor = is_auto_predictor_;
     predictor_evaluation_results = predictor_evaluation_results_;
   }
    : get_accuracy_metrics_response)

let make_get_accuracy_metrics_request ~predictor_arn:(predictor_arn_ : arn) () =
  ({ predictor_arn = predictor_arn_ } : get_accuracy_metrics_request)

let make_featurization_method
    ?featurization_method_parameters:
      (featurization_method_parameters_ : featurization_method_parameters option)
    ~featurization_method_name:(featurization_method_name_ : featurization_method_name) () =
  ({
     featurization_method_parameters = featurization_method_parameters_;
     featurization_method_name = featurization_method_name_;
   }
    : featurization_method)

let make_featurization
    ?featurization_pipeline:(featurization_pipeline_ : featurization_pipeline option)
    ~attribute_name:(attribute_name_ : name) () =
  ({ featurization_pipeline = featurization_pipeline_; attribute_name = attribute_name_ }
    : featurization)

let make_featurization_config ?featurizations:(featurizations_ : featurizations option)
    ?forecast_dimensions:(forecast_dimensions_ : forecast_dimensions option)
    ~forecast_frequency:(forecast_frequency_ : frequency) () =
  ({
     featurizations = featurizations_;
     forecast_dimensions = forecast_dimensions_;
     forecast_frequency = forecast_frequency_;
   }
    : featurization_config)

let make_explainability_info ?status:(status_ : status option)
    ?explainability_arn:(explainability_arn_ : arn option) () =
  ({ status = status_; explainability_arn = explainability_arn_ } : explainability_info)

let make_evaluation_parameters ?back_test_window_offset:(back_test_window_offset_ : integer option)
    ?number_of_backtest_windows:(number_of_backtest_windows_ : integer option) () =
  ({
     back_test_window_offset = back_test_window_offset_;
     number_of_backtest_windows = number_of_backtest_windows_;
   }
    : evaluation_parameters)

let make_encryption_config ~kms_key_arn:(kms_key_arn_ : kms_key_arn) ~role_arn:(role_arn_ : arn) ()
    =
  ({ kms_key_arn = kms_key_arn_; role_arn = role_arn_ } : encryption_config)

let make_describe_what_if_forecast_response
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?time_series_replacements_data_source:
      (time_series_replacements_data_source_ : time_series_replacements_data_source option)
    ?time_series_transformations:(time_series_transformations_ : time_series_transformations option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : string_ option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option)
    ?what_if_forecast_arn:(what_if_forecast_arn_ : long_arn option)
    ?what_if_forecast_name:(what_if_forecast_name_ : name option) () =
  ({
     forecast_types = forecast_types_;
     time_series_replacements_data_source = time_series_replacements_data_source_;
     time_series_transformations = time_series_transformations_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     what_if_analysis_arn = what_if_analysis_arn_;
     what_if_forecast_arn = what_if_forecast_arn_;
     what_if_forecast_name = what_if_forecast_name_;
   }
    : describe_what_if_forecast_response)

let make_describe_what_if_forecast_request ~what_if_forecast_arn:(what_if_forecast_arn_ : long_arn)
    () =
  ({ what_if_forecast_arn = what_if_forecast_arn_ } : describe_what_if_forecast_request)

let make_describe_what_if_forecast_export_response ?format:(format_ : format option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : status option)
    ?message:(message_ : message option) ?destination:(destination_ : data_destination option)
    ?what_if_forecast_arns:(what_if_forecast_arns_ : long_arn_list option)
    ?what_if_forecast_export_name:(what_if_forecast_export_name_ : name option)
    ?what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn option) () =
  ({
     format = format_;
     last_modification_time = last_modification_time_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     creation_time = creation_time_;
     status = status_;
     message = message_;
     destination = destination_;
     what_if_forecast_arns = what_if_forecast_arns_;
     what_if_forecast_export_name = what_if_forecast_export_name_;
     what_if_forecast_export_arn = what_if_forecast_export_arn_;
   }
    : describe_what_if_forecast_export_response)

let make_describe_what_if_forecast_export_request
    ~what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn) () =
  ({ what_if_forecast_export_arn = what_if_forecast_export_arn_ }
    : describe_what_if_forecast_export_request)

let make_describe_what_if_analysis_response
    ?time_series_selector:(time_series_selector_ : time_series_selector option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : string_ option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?forecast_arn:(forecast_arn_ : arn option)
    ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option)
    ?what_if_analysis_name:(what_if_analysis_name_ : name option) () =
  ({
     time_series_selector = time_series_selector_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     forecast_arn = forecast_arn_;
     what_if_analysis_arn = what_if_analysis_arn_;
     what_if_analysis_name = what_if_analysis_name_;
   }
    : describe_what_if_analysis_response)

let make_describe_what_if_analysis_request ~what_if_analysis_arn:(what_if_analysis_arn_ : arn) () =
  ({ what_if_analysis_arn = what_if_analysis_arn_ } : describe_what_if_analysis_request)

let make_describe_predictor_response
    ?optimization_metric:(optimization_metric_ : optimization_metric option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : message option)
    ?status:(status_ : status option)
    ?dataset_import_job_arns:(dataset_import_job_arns_ : arn_list option)
    ?is_auto_predictor:(is_auto_predictor_ : boolean_ option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?predictor_execution_details:(predictor_execution_details_ : predictor_execution_details option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?featurization_config:(featurization_config_ : featurization_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?hpo_config:(hpo_config_ : hyper_parameter_tuning_job_config option)
    ?evaluation_parameters:(evaluation_parameters_ : evaluation_parameters option)
    ?training_parameters:(training_parameters_ : training_parameters option)
    ?perform_hp_o:(perform_hp_o_ : boolean_ option)
    ?auto_ml_override_strategy:(auto_ml_override_strategy_ : auto_ml_override_strategy option)
    ?perform_auto_m_l:(perform_auto_m_l_ : boolean_ option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?forecast_horizon:(forecast_horizon_ : integer option)
    ?auto_ml_algorithm_arns:(auto_ml_algorithm_arns_ : arn_list option)
    ?algorithm_arn:(algorithm_arn_ : arn option) ?predictor_name:(predictor_name_ : name option)
    ?predictor_arn:(predictor_arn_ : name option) () =
  ({
     optimization_metric = optimization_metric_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     dataset_import_job_arns = dataset_import_job_arns_;
     is_auto_predictor = is_auto_predictor_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     predictor_execution_details = predictor_execution_details_;
     encryption_config = encryption_config_;
     featurization_config = featurization_config_;
     input_data_config = input_data_config_;
     hpo_config = hpo_config_;
     evaluation_parameters = evaluation_parameters_;
     training_parameters = training_parameters_;
     perform_hp_o = perform_hp_o_;
     auto_ml_override_strategy = auto_ml_override_strategy_;
     perform_auto_m_l = perform_auto_m_l_;
     forecast_types = forecast_types_;
     forecast_horizon = forecast_horizon_;
     auto_ml_algorithm_arns = auto_ml_algorithm_arns_;
     algorithm_arn = algorithm_arn_;
     predictor_name = predictor_name_;
     predictor_arn = predictor_arn_;
   }
    : describe_predictor_response)

let make_describe_predictor_request ~predictor_arn:(predictor_arn_ : arn) () =
  ({ predictor_arn = predictor_arn_ } : describe_predictor_request)

let make_describe_predictor_backtest_export_job_response ?format:(format_ : format option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : status option)
    ?message:(message_ : message option) ?destination:(destination_ : data_destination option)
    ?predictor_arn:(predictor_arn_ : arn option)
    ?predictor_backtest_export_job_name:(predictor_backtest_export_job_name_ : name option)
    ?predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn option) () =
  ({
     format = format_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     message = message_;
     destination = destination_;
     predictor_arn = predictor_arn_;
     predictor_backtest_export_job_name = predictor_backtest_export_job_name_;
     predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_;
   }
    : describe_predictor_backtest_export_job_response)

let make_describe_predictor_backtest_export_job_request
    ~predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn) () =
  ({ predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_ }
    : describe_predictor_backtest_export_job_request)

let make_baseline ?predictor_baseline:(predictor_baseline_ : predictor_baseline option) () =
  ({ predictor_baseline = predictor_baseline_ } : baseline)

let make_describe_monitor_response
    ?estimated_evaluation_time_remaining_in_minutes:
      (estimated_evaluation_time_remaining_in_minutes_ : long option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : message option)
    ?baseline:(baseline_ : baseline option)
    ?last_evaluation_state:(last_evaluation_state_ : evaluation_state option)
    ?last_evaluation_time:(last_evaluation_time_ : timestamp option)
    ?status:(status_ : status option) ?resource_arn:(resource_arn_ : arn option)
    ?monitor_arn:(monitor_arn_ : arn option) ?monitor_name:(monitor_name_ : name option) () =
  ({
     estimated_evaluation_time_remaining_in_minutes =
       estimated_evaluation_time_remaining_in_minutes_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     baseline = baseline_;
     last_evaluation_state = last_evaluation_state_;
     last_evaluation_time = last_evaluation_time_;
     status = status_;
     resource_arn = resource_arn_;
     monitor_arn = monitor_arn_;
     monitor_name = monitor_name_;
   }
    : describe_monitor_response)

let make_describe_monitor_request ~monitor_arn:(monitor_arn_ : arn) () =
  ({ monitor_arn = monitor_arn_ } : describe_monitor_request)

let make_describe_forecast_response
    ?time_series_selector:(time_series_selector_ : time_series_selector option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : error_message option)
    ?status:(status_ : string_ option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?predictor_arn:(predictor_arn_ : arn option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?forecast_name:(forecast_name_ : name option) ?forecast_arn:(forecast_arn_ : arn option) () =
  ({
     time_series_selector = time_series_selector_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     dataset_group_arn = dataset_group_arn_;
     predictor_arn = predictor_arn_;
     forecast_types = forecast_types_;
     forecast_name = forecast_name_;
     forecast_arn = forecast_arn_;
   }
    : describe_forecast_response)

let make_describe_forecast_request ~forecast_arn:(forecast_arn_ : arn) () =
  ({ forecast_arn = forecast_arn_ } : describe_forecast_request)

let make_describe_forecast_export_job_response ?format:(format_ : format option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : status option)
    ?message:(message_ : message option) ?destination:(destination_ : data_destination option)
    ?forecast_arn:(forecast_arn_ : arn option)
    ?forecast_export_job_name:(forecast_export_job_name_ : name option)
    ?forecast_export_job_arn:(forecast_export_job_arn_ : arn option) () =
  ({
     format = format_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     message = message_;
     destination = destination_;
     forecast_arn = forecast_arn_;
     forecast_export_job_name = forecast_export_job_name_;
     forecast_export_job_arn = forecast_export_job_arn_;
   }
    : describe_forecast_export_job_response)

let make_describe_forecast_export_job_request
    ~forecast_export_job_arn:(forecast_export_job_arn_ : arn) () =
  ({ forecast_export_job_arn = forecast_export_job_arn_ } : describe_forecast_export_job_request)

let make_describe_explainability_response
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : status option)
    ?message:(message_ : message option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?end_date_time:(end_date_time_ : local_date_time option)
    ?start_date_time:(start_date_time_ : local_date_time option) ?schema:(schema_ : schema option)
    ?data_source:(data_source_ : data_source option)
    ?enable_visualization:(enable_visualization_ : boolean_ option)
    ?explainability_config:(explainability_config_ : explainability_config option)
    ?resource_arn:(resource_arn_ : arn option)
    ?explainability_name:(explainability_name_ : name option)
    ?explainability_arn:(explainability_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     message = message_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     end_date_time = end_date_time_;
     start_date_time = start_date_time_;
     schema = schema_;
     data_source = data_source_;
     enable_visualization = enable_visualization_;
     explainability_config = explainability_config_;
     resource_arn = resource_arn_;
     explainability_name = explainability_name_;
     explainability_arn = explainability_arn_;
   }
    : describe_explainability_response)

let make_describe_explainability_request ~explainability_arn:(explainability_arn_ : arn) () =
  ({ explainability_arn = explainability_arn_ } : describe_explainability_request)

let make_describe_explainability_export_response ?format:(format_ : format option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : status option)
    ?message:(message_ : message option) ?destination:(destination_ : data_destination option)
    ?explainability_arn:(explainability_arn_ : arn option)
    ?explainability_export_name:(explainability_export_name_ : name option)
    ?explainability_export_arn:(explainability_export_arn_ : arn option) () =
  ({
     format = format_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     message = message_;
     destination = destination_;
     explainability_arn = explainability_arn_;
     explainability_export_name = explainability_export_name_;
     explainability_export_arn = explainability_export_arn_;
   }
    : describe_explainability_export_response)

let make_describe_explainability_export_request
    ~explainability_export_arn:(explainability_export_arn_ : arn) () =
  ({ explainability_export_arn = explainability_export_arn_ }
    : describe_explainability_export_request)

let make_describe_dataset_response
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : status option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?schema:(schema_ : schema option) ?data_frequency:(data_frequency_ : frequency option)
    ?dataset_type:(dataset_type_ : dataset_type option) ?domain:(domain_ : domain option)
    ?dataset_name:(dataset_name_ : name option) ?dataset_arn:(dataset_arn_ : arn option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     encryption_config = encryption_config_;
     schema = schema_;
     data_frequency = data_frequency_;
     dataset_type = dataset_type_;
     domain = domain_;
     dataset_name = dataset_name_;
     dataset_arn = dataset_arn_;
   }
    : describe_dataset_response)

let make_describe_dataset_request ~dataset_arn:(dataset_arn_ : arn) () =
  ({ dataset_arn = dataset_arn_ } : describe_dataset_request)

let make_describe_dataset_import_job_response ?import_mode:(import_mode_ : import_mode option)
    ?format:(format_ : format option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : message option)
    ?status:(status_ : status option) ?data_size:(data_size_ : double option)
    ?field_statistics:(field_statistics_ : field_statistics option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?data_source:(data_source_ : data_source option)
    ?geolocation_format:(geolocation_format_ : geolocation_format option)
    ?use_geolocation_for_time_zone:
      (use_geolocation_for_time_zone_ : use_geolocation_for_time_zone option)
    ?time_zone:(time_zone_ : time_zone option)
    ?timestamp_format:(timestamp_format_ : timestamp_format option)
    ?dataset_arn:(dataset_arn_ : arn option)
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option)
    ?dataset_import_job_name:(dataset_import_job_name_ : name option) () =
  ({
     import_mode = import_mode_;
     format = format_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     data_size = data_size_;
     field_statistics = field_statistics_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     data_source = data_source_;
     geolocation_format = geolocation_format_;
     use_geolocation_for_time_zone = use_geolocation_for_time_zone_;
     time_zone = time_zone_;
     timestamp_format = timestamp_format_;
     dataset_arn = dataset_arn_;
     dataset_import_job_arn = dataset_import_job_arn_;
     dataset_import_job_name = dataset_import_job_name_;
   }
    : describe_dataset_import_job_response)

let make_describe_dataset_import_job_request ~dataset_import_job_arn:(dataset_import_job_arn_ : arn)
    () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : describe_dataset_import_job_request)

let make_describe_dataset_group_response
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : status option)
    ?domain:(domain_ : domain option) ?dataset_arns:(dataset_arns_ : arn_list option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?dataset_group_name:(dataset_group_name_ : name option) () =
  ({
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     status = status_;
     domain = domain_;
     dataset_arns = dataset_arns_;
     dataset_group_arn = dataset_group_arn_;
     dataset_group_name = dataset_group_name_;
   }
    : describe_dataset_group_response)

let make_describe_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_ } : describe_dataset_group_request)

let make_attribute_config ~transformations:(transformations_ : transformations)
    ~attribute_name:(attribute_name_ : name) () =
  ({ transformations = transformations_; attribute_name = attribute_name_ } : attribute_config)

let make_additional_dataset ?configuration:(configuration_ : configuration option)
    ~name:(name_ : name) () =
  ({ configuration = configuration_; name = name_ } : additional_dataset)

let make_data_config ?additional_datasets:(additional_datasets_ : additional_datasets option)
    ?attribute_configs:(attribute_configs_ : attribute_configs option)
    ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({
     additional_datasets = additional_datasets_;
     attribute_configs = attribute_configs_;
     dataset_group_arn = dataset_group_arn_;
   }
    : data_config)

let make_describe_auto_predictor_response
    ?time_alignment_boundary:(time_alignment_boundary_ : time_alignment_boundary option)
    ?monitor_info:(monitor_info_ : monitor_info option)
    ?explainability_info:(explainability_info_ : explainability_info option)
    ?optimization_metric:(optimization_metric_ : optimization_metric option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?message:(message_ : message option)
    ?status:(status_ : status option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?reference_predictor_summary:(reference_predictor_summary_ : reference_predictor_summary option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?data_config:(data_config_ : data_config option)
    ?dataset_import_job_arns:(dataset_import_job_arns_ : arn_list option)
    ?forecast_dimensions:(forecast_dimensions_ : forecast_dimensions option)
    ?forecast_frequency:(forecast_frequency_ : frequency option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?forecast_horizon:(forecast_horizon_ : integer option)
    ?predictor_name:(predictor_name_ : name option) ?predictor_arn:(predictor_arn_ : arn option) ()
    =
  ({
     time_alignment_boundary = time_alignment_boundary_;
     monitor_info = monitor_info_;
     explainability_info = explainability_info_;
     optimization_metric = optimization_metric_;
     last_modification_time = last_modification_time_;
     creation_time = creation_time_;
     message = message_;
     status = status_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     reference_predictor_summary = reference_predictor_summary_;
     encryption_config = encryption_config_;
     data_config = data_config_;
     dataset_import_job_arns = dataset_import_job_arns_;
     forecast_dimensions = forecast_dimensions_;
     forecast_frequency = forecast_frequency_;
     forecast_types = forecast_types_;
     forecast_horizon = forecast_horizon_;
     predictor_name = predictor_name_;
     predictor_arn = predictor_arn_;
   }
    : describe_auto_predictor_response)

let make_describe_auto_predictor_request ~predictor_arn:(predictor_arn_ : arn) () =
  ({ predictor_arn = predictor_arn_ } : describe_auto_predictor_request)

let make_delete_what_if_forecast_request ~what_if_forecast_arn:(what_if_forecast_arn_ : long_arn) ()
    =
  ({ what_if_forecast_arn = what_if_forecast_arn_ } : delete_what_if_forecast_request)

let make_delete_what_if_forecast_export_request
    ~what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn) () =
  ({ what_if_forecast_export_arn = what_if_forecast_export_arn_ }
    : delete_what_if_forecast_export_request)

let make_delete_what_if_analysis_request ~what_if_analysis_arn:(what_if_analysis_arn_ : arn) () =
  ({ what_if_analysis_arn = what_if_analysis_arn_ } : delete_what_if_analysis_request)

let make_delete_resource_tree_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : delete_resource_tree_request)

let make_delete_predictor_request ~predictor_arn:(predictor_arn_ : arn) () =
  ({ predictor_arn = predictor_arn_ } : delete_predictor_request)

let make_delete_predictor_backtest_export_job_request
    ~predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn) () =
  ({ predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_ }
    : delete_predictor_backtest_export_job_request)

let make_delete_monitor_request ~monitor_arn:(monitor_arn_ : arn) () =
  ({ monitor_arn = monitor_arn_ } : delete_monitor_request)

let make_delete_forecast_request ~forecast_arn:(forecast_arn_ : arn) () =
  ({ forecast_arn = forecast_arn_ } : delete_forecast_request)

let make_delete_forecast_export_job_request
    ~forecast_export_job_arn:(forecast_export_job_arn_ : arn) () =
  ({ forecast_export_job_arn = forecast_export_job_arn_ } : delete_forecast_export_job_request)

let make_delete_explainability_request ~explainability_arn:(explainability_arn_ : arn) () =
  ({ explainability_arn = explainability_arn_ } : delete_explainability_request)

let make_delete_explainability_export_request
    ~explainability_export_arn:(explainability_export_arn_ : arn) () =
  ({ explainability_export_arn = explainability_export_arn_ }
    : delete_explainability_export_request)

let make_delete_dataset_request ~dataset_arn:(dataset_arn_ : arn) () =
  ({ dataset_arn = dataset_arn_ } : delete_dataset_request)

let make_delete_dataset_import_job_request ~dataset_import_job_arn:(dataset_import_job_arn_ : arn)
    () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : delete_dataset_import_job_request)

let make_delete_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_ } : delete_dataset_group_request)

let make_create_what_if_forecast_response
    ?what_if_forecast_arn:(what_if_forecast_arn_ : long_arn option) () =
  ({ what_if_forecast_arn = what_if_forecast_arn_ } : create_what_if_forecast_response)

let make_create_what_if_forecast_request ?tags:(tags_ : tags option)
    ?time_series_replacements_data_source:
      (time_series_replacements_data_source_ : time_series_replacements_data_source option)
    ?time_series_transformations:(time_series_transformations_ : time_series_transformations option)
    ~what_if_analysis_arn:(what_if_analysis_arn_ : arn)
    ~what_if_forecast_name:(what_if_forecast_name_ : name) () =
  ({
     tags = tags_;
     time_series_replacements_data_source = time_series_replacements_data_source_;
     time_series_transformations = time_series_transformations_;
     what_if_analysis_arn = what_if_analysis_arn_;
     what_if_forecast_name = what_if_forecast_name_;
   }
    : create_what_if_forecast_request)

let make_create_what_if_forecast_export_response
    ?what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn option) () =
  ({ what_if_forecast_export_arn = what_if_forecast_export_arn_ }
    : create_what_if_forecast_export_response)

let make_create_what_if_forecast_export_request ?format:(format_ : format option)
    ?tags:(tags_ : tags option) ~destination:(destination_ : data_destination)
    ~what_if_forecast_arns:(what_if_forecast_arns_ : what_if_forecast_arn_list_for_export)
    ~what_if_forecast_export_name:(what_if_forecast_export_name_ : name) () =
  ({
     format = format_;
     tags = tags_;
     destination = destination_;
     what_if_forecast_arns = what_if_forecast_arns_;
     what_if_forecast_export_name = what_if_forecast_export_name_;
   }
    : create_what_if_forecast_export_request)

let make_create_what_if_analysis_response ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option)
    () =
  ({ what_if_analysis_arn = what_if_analysis_arn_ } : create_what_if_analysis_response)

let make_create_what_if_analysis_request ?tags:(tags_ : tags option)
    ?time_series_selector:(time_series_selector_ : time_series_selector option)
    ~forecast_arn:(forecast_arn_ : arn) ~what_if_analysis_name:(what_if_analysis_name_ : name) () =
  ({
     tags = tags_;
     time_series_selector = time_series_selector_;
     forecast_arn = forecast_arn_;
     what_if_analysis_name = what_if_analysis_name_;
   }
    : create_what_if_analysis_request)

let make_create_predictor_response ?predictor_arn:(predictor_arn_ : arn option) () =
  ({ predictor_arn = predictor_arn_ } : create_predictor_response)

let make_create_predictor_request
    ?optimization_metric:(optimization_metric_ : optimization_metric option)
    ?tags:(tags_ : tags option) ?encryption_config:(encryption_config_ : encryption_config option)
    ?hpo_config:(hpo_config_ : hyper_parameter_tuning_job_config option)
    ?evaluation_parameters:(evaluation_parameters_ : evaluation_parameters option)
    ?training_parameters:(training_parameters_ : training_parameters option)
    ?perform_hp_o:(perform_hp_o_ : boolean_ option)
    ?auto_ml_override_strategy:(auto_ml_override_strategy_ : auto_ml_override_strategy option)
    ?perform_auto_m_l:(perform_auto_m_l_ : boolean_ option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?algorithm_arn:(algorithm_arn_ : arn option)
    ~featurization_config:(featurization_config_ : featurization_config)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~forecast_horizon:(forecast_horizon_ : integer) ~predictor_name:(predictor_name_ : name) () =
  ({
     optimization_metric = optimization_metric_;
     tags = tags_;
     encryption_config = encryption_config_;
     featurization_config = featurization_config_;
     input_data_config = input_data_config_;
     hpo_config = hpo_config_;
     evaluation_parameters = evaluation_parameters_;
     training_parameters = training_parameters_;
     perform_hp_o = perform_hp_o_;
     auto_ml_override_strategy = auto_ml_override_strategy_;
     perform_auto_m_l = perform_auto_m_l_;
     forecast_types = forecast_types_;
     forecast_horizon = forecast_horizon_;
     algorithm_arn = algorithm_arn_;
     predictor_name = predictor_name_;
   }
    : create_predictor_request)

let make_create_predictor_backtest_export_job_response
    ?predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn option) () =
  ({ predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_ }
    : create_predictor_backtest_export_job_response)

let make_create_predictor_backtest_export_job_request ?format:(format_ : format option)
    ?tags:(tags_ : tags option) ~destination:(destination_ : data_destination)
    ~predictor_arn:(predictor_arn_ : arn)
    ~predictor_backtest_export_job_name:(predictor_backtest_export_job_name_ : name) () =
  ({
     format = format_;
     tags = tags_;
     destination = destination_;
     predictor_arn = predictor_arn_;
     predictor_backtest_export_job_name = predictor_backtest_export_job_name_;
   }
    : create_predictor_backtest_export_job_request)

let make_create_monitor_response ?monitor_arn:(monitor_arn_ : arn option) () =
  ({ monitor_arn = monitor_arn_ } : create_monitor_response)

let make_create_monitor_request ?tags:(tags_ : tags option) ~resource_arn:(resource_arn_ : arn)
    ~monitor_name:(monitor_name_ : name) () =
  ({ tags = tags_; resource_arn = resource_arn_; monitor_name = monitor_name_ }
    : create_monitor_request)

let make_create_forecast_response ?forecast_arn:(forecast_arn_ : arn option) () =
  ({ forecast_arn = forecast_arn_ } : create_forecast_response)

let make_create_forecast_request
    ?time_series_selector:(time_series_selector_ : time_series_selector option)
    ?tags:(tags_ : tags option) ?forecast_types:(forecast_types_ : forecast_types option)
    ~predictor_arn:(predictor_arn_ : arn) ~forecast_name:(forecast_name_ : name) () =
  ({
     time_series_selector = time_series_selector_;
     tags = tags_;
     forecast_types = forecast_types_;
     predictor_arn = predictor_arn_;
     forecast_name = forecast_name_;
   }
    : create_forecast_request)

let make_create_forecast_export_job_response
    ?forecast_export_job_arn:(forecast_export_job_arn_ : arn option) () =
  ({ forecast_export_job_arn = forecast_export_job_arn_ } : create_forecast_export_job_response)

let make_create_forecast_export_job_request ?format:(format_ : format option)
    ?tags:(tags_ : tags option) ~destination:(destination_ : data_destination)
    ~forecast_arn:(forecast_arn_ : arn) ~forecast_export_job_name:(forecast_export_job_name_ : name)
    () =
  ({
     format = format_;
     tags = tags_;
     destination = destination_;
     forecast_arn = forecast_arn_;
     forecast_export_job_name = forecast_export_job_name_;
   }
    : create_forecast_export_job_request)

let make_create_explainability_response ?explainability_arn:(explainability_arn_ : arn option) () =
  ({ explainability_arn = explainability_arn_ } : create_explainability_response)

let make_create_explainability_request ?tags:(tags_ : tags option)
    ?end_date_time:(end_date_time_ : local_date_time option)
    ?start_date_time:(start_date_time_ : local_date_time option)
    ?enable_visualization:(enable_visualization_ : boolean_ option)
    ?schema:(schema_ : schema option) ?data_source:(data_source_ : data_source option)
    ~explainability_config:(explainability_config_ : explainability_config)
    ~resource_arn:(resource_arn_ : arn) ~explainability_name:(explainability_name_ : name) () =
  ({
     tags = tags_;
     end_date_time = end_date_time_;
     start_date_time = start_date_time_;
     enable_visualization = enable_visualization_;
     schema = schema_;
     data_source = data_source_;
     explainability_config = explainability_config_;
     resource_arn = resource_arn_;
     explainability_name = explainability_name_;
   }
    : create_explainability_request)

let make_create_explainability_export_response
    ?explainability_export_arn:(explainability_export_arn_ : arn option) () =
  ({ explainability_export_arn = explainability_export_arn_ }
    : create_explainability_export_response)

let make_create_explainability_export_request ?format:(format_ : format option)
    ?tags:(tags_ : tags option) ~destination:(destination_ : data_destination)
    ~explainability_arn:(explainability_arn_ : arn)
    ~explainability_export_name:(explainability_export_name_ : name) () =
  ({
     format = format_;
     tags = tags_;
     destination = destination_;
     explainability_arn = explainability_arn_;
     explainability_export_name = explainability_export_name_;
   }
    : create_explainability_export_request)

let make_create_dataset_response ?dataset_arn:(dataset_arn_ : arn option) () =
  ({ dataset_arn = dataset_arn_ } : create_dataset_response)

let make_create_dataset_request ?tags:(tags_ : tags option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?data_frequency:(data_frequency_ : frequency option) ~schema:(schema_ : schema)
    ~dataset_type:(dataset_type_ : dataset_type) ~domain:(domain_ : domain)
    ~dataset_name:(dataset_name_ : name) () =
  ({
     tags = tags_;
     encryption_config = encryption_config_;
     schema = schema_;
     data_frequency = data_frequency_;
     dataset_type = dataset_type_;
     domain = domain_;
     dataset_name = dataset_name_;
   }
    : create_dataset_request)

let make_create_dataset_import_job_response
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option) () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : create_dataset_import_job_response)

let make_create_dataset_import_job_request ?import_mode:(import_mode_ : import_mode option)
    ?format:(format_ : format option) ?tags:(tags_ : tags option)
    ?geolocation_format:(geolocation_format_ : geolocation_format option)
    ?use_geolocation_for_time_zone:
      (use_geolocation_for_time_zone_ : use_geolocation_for_time_zone option)
    ?time_zone:(time_zone_ : time_zone option)
    ?timestamp_format:(timestamp_format_ : timestamp_format option)
    ~data_source:(data_source_ : data_source) ~dataset_arn:(dataset_arn_ : arn)
    ~dataset_import_job_name:(dataset_import_job_name_ : name) () =
  ({
     import_mode = import_mode_;
     format = format_;
     tags = tags_;
     geolocation_format = geolocation_format_;
     use_geolocation_for_time_zone = use_geolocation_for_time_zone_;
     time_zone = time_zone_;
     timestamp_format = timestamp_format_;
     data_source = data_source_;
     dataset_arn = dataset_arn_;
     dataset_import_job_name = dataset_import_job_name_;
   }
    : create_dataset_import_job_request)

let make_create_dataset_group_response ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ dataset_group_arn = dataset_group_arn_ } : create_dataset_group_response)

let make_create_dataset_group_request ?tags:(tags_ : tags option)
    ?dataset_arns:(dataset_arns_ : arn_list option) ~domain:(domain_ : domain)
    ~dataset_group_name:(dataset_group_name_ : name) () =
  ({
     tags = tags_;
     dataset_arns = dataset_arns_;
     domain = domain_;
     dataset_group_name = dataset_group_name_;
   }
    : create_dataset_group_request)

let make_create_auto_predictor_response ?predictor_arn:(predictor_arn_ : arn option) () =
  ({ predictor_arn = predictor_arn_ } : create_auto_predictor_response)

let make_create_auto_predictor_request
    ?time_alignment_boundary:(time_alignment_boundary_ : time_alignment_boundary option)
    ?monitor_config:(monitor_config_ : monitor_config option) ?tags:(tags_ : tags option)
    ?explain_predictor:(explain_predictor_ : boolean_ option)
    ?optimization_metric:(optimization_metric_ : optimization_metric option)
    ?reference_predictor_arn:(reference_predictor_arn_ : arn option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?data_config:(data_config_ : data_config option)
    ?forecast_frequency:(forecast_frequency_ : frequency option)
    ?forecast_dimensions:(forecast_dimensions_ : forecast_dimensions option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?forecast_horizon:(forecast_horizon_ : integer option) ~predictor_name:(predictor_name_ : name)
    () =
  ({
     time_alignment_boundary = time_alignment_boundary_;
     monitor_config = monitor_config_;
     tags = tags_;
     explain_predictor = explain_predictor_;
     optimization_metric = optimization_metric_;
     reference_predictor_arn = reference_predictor_arn_;
     encryption_config = encryption_config_;
     data_config = data_config_;
     forecast_frequency = forecast_frequency_;
     forecast_dimensions = forecast_dimensions_;
     forecast_types = forecast_types_;
     forecast_horizon = forecast_horizon_;
     predictor_name = predictor_name_;
   }
    : create_auto_predictor_request)
