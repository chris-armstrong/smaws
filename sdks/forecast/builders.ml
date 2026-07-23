open Types

let make_action ~attribute_name:(attribute_name_ : name) ~operation:(operation_ : operation)
    ~value:(value_ : double) () =
  ({ attribute_name = attribute_name_; operation = operation_; value = value_ } : action)

let make_additional_dataset ?configuration:(configuration_ : configuration option)
    ~name:(name_ : name) () =
  ({ name = name_; configuration = configuration_ } : additional_dataset)

let make_update_dataset_group_response () = (() : unit)

let make_update_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn)
    ~dataset_arns:(dataset_arns_ : arn_list) () =
  ({ dataset_group_arn = dataset_group_arn_; dataset_arns = dataset_arns_ }
    : update_dataset_group_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : arn) ~tag_keys:(tag_keys_ : tag_keys)
    () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : arn) ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_stop_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : stop_resource_request)

let make_resume_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : resume_resource_request)

let make_what_if_forecast_summary ?what_if_forecast_arn:(what_if_forecast_arn_ : long_arn option)
    ?what_if_forecast_name:(what_if_forecast_name_ : name option)
    ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     what_if_forecast_arn = what_if_forecast_arn_;
     what_if_forecast_name = what_if_forecast_name_;
     what_if_analysis_arn = what_if_analysis_arn_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : what_if_forecast_summary)

let make_list_what_if_forecasts_response
    ?what_if_forecasts:(what_if_forecasts_ : what_if_forecasts option)
    ?next_token:(next_token_ : next_token option) () =
  ({ what_if_forecasts = what_if_forecasts_; next_token = next_token_ }
    : list_what_if_forecasts_response)

let make_filter ~key:(key_ : string_) ~value:(value_ : arn)
    ~condition:(condition_ : filter_condition_string) () =
  ({ key = key_; value = value_; condition = condition_ } : filter)

let make_list_what_if_forecasts_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_what_if_forecasts_request)

let make_s3_config ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ~path:(path_ : s3_path)
    ~role_arn:(role_arn_ : arn) () =
  ({ path = path_; role_arn = role_arn_; kms_key_arn = kms_key_arn_ } : s3_config)

let make_data_destination ~s3_config:(s3_config_ : s3_config) () =
  ({ s3_config = s3_config_ } : data_destination)

let make_what_if_forecast_export_summary
    ?what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn option)
    ?what_if_forecast_arns:(what_if_forecast_arns_ : what_if_forecast_arn_list_for_export option)
    ?what_if_forecast_export_name:(what_if_forecast_export_name_ : name option)
    ?destination:(destination_ : data_destination option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     what_if_forecast_export_arn = what_if_forecast_export_arn_;
     what_if_forecast_arns = what_if_forecast_arns_;
     what_if_forecast_export_name = what_if_forecast_export_name_;
     destination = destination_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : what_if_forecast_export_summary)

let make_list_what_if_forecast_exports_response
    ?what_if_forecast_exports:(what_if_forecast_exports_ : what_if_forecast_exports option)
    ?next_token:(next_token_ : next_token option) () =
  ({ what_if_forecast_exports = what_if_forecast_exports_; next_token = next_token_ }
    : list_what_if_forecast_exports_response)

let make_list_what_if_forecast_exports_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_what_if_forecast_exports_request)

let make_what_if_analysis_summary ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option)
    ?what_if_analysis_name:(what_if_analysis_name_ : name option)
    ?forecast_arn:(forecast_arn_ : arn option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     what_if_analysis_arn = what_if_analysis_arn_;
     what_if_analysis_name = what_if_analysis_name_;
     forecast_arn = forecast_arn_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : what_if_analysis_summary)

let make_list_what_if_analyses_response
    ?what_if_analyses:(what_if_analyses_ : what_if_analyses option)
    ?next_token:(next_token_ : next_token option) () =
  ({ what_if_analyses = what_if_analyses_; next_token = next_token_ }
    : list_what_if_analyses_response)

let make_list_what_if_analyses_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_what_if_analyses_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_reference_predictor_summary ?arn:(arn_ : arn option) ?state:(state_ : state option) () =
  ({ arn = arn_; state = state_ } : reference_predictor_summary)

let make_predictor_summary ?predictor_arn:(predictor_arn_ : arn option)
    ?predictor_name:(predictor_name_ : name option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?is_auto_predictor:(is_auto_predictor_ : boolean_ option)
    ?reference_predictor_summary:(reference_predictor_summary_ : reference_predictor_summary option)
    ?status:(status_ : status option) ?message:(message_ : error_message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     predictor_arn = predictor_arn_;
     predictor_name = predictor_name_;
     dataset_group_arn = dataset_group_arn_;
     is_auto_predictor = is_auto_predictor_;
     reference_predictor_summary = reference_predictor_summary_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : predictor_summary)

let make_list_predictors_response ?predictors:(predictors_ : predictors option)
    ?next_token:(next_token_ : next_token option) () =
  ({ predictors = predictors_; next_token = next_token_ } : list_predictors_response)

let make_list_predictors_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_predictors_request)

let make_predictor_backtest_export_job_summary
    ?predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn option)
    ?predictor_backtest_export_job_name:(predictor_backtest_export_job_name_ : name option)
    ?destination:(destination_ : data_destination option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_;
     predictor_backtest_export_job_name = predictor_backtest_export_job_name_;
     destination = destination_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : predictor_backtest_export_job_summary)

let make_list_predictor_backtest_export_jobs_response
    ?predictor_backtest_export_jobs:
      (predictor_backtest_export_jobs_ : predictor_backtest_export_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ predictor_backtest_export_jobs = predictor_backtest_export_jobs_; next_token = next_token_ }
    : list_predictor_backtest_export_jobs_response)

let make_list_predictor_backtest_export_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_predictor_backtest_export_jobs_request)

let make_monitor_summary ?monitor_arn:(monitor_arn_ : arn option)
    ?monitor_name:(monitor_name_ : name option) ?resource_arn:(resource_arn_ : arn option)
    ?status:(status_ : status option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     monitor_arn = monitor_arn_;
     monitor_name = monitor_name_;
     resource_arn = resource_arn_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : monitor_summary)

let make_list_monitors_response ?monitors:(monitors_ : monitors option)
    ?next_token:(next_token_ : next_token option) () =
  ({ monitors = monitors_; next_token = next_token_ } : list_monitors_response)

let make_list_monitors_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_monitors_request)

let make_monitor_data_source ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option)
    ?forecast_arn:(forecast_arn_ : arn option) ?predictor_arn:(predictor_arn_ : arn option) () =
  ({
     dataset_import_job_arn = dataset_import_job_arn_;
     forecast_arn = forecast_arn_;
     predictor_arn = predictor_arn_;
   }
    : monitor_data_source)

let make_predictor_event ?detail:(detail_ : detail option) ?datetime:(datetime_ : timestamp option)
    () =
  ({ detail = detail_; datetime = datetime_ } : predictor_event)

let make_predictor_monitor_evaluation ?resource_arn:(resource_arn_ : arn option)
    ?monitor_arn:(monitor_arn_ : arn option) ?evaluation_time:(evaluation_time_ : timestamp option)
    ?evaluation_state:(evaluation_state_ : evaluation_state option)
    ?window_start_datetime:(window_start_datetime_ : timestamp option)
    ?window_end_datetime:(window_end_datetime_ : timestamp option)
    ?predictor_event:(predictor_event_ : predictor_event option)
    ?monitor_data_source:(monitor_data_source_ : monitor_data_source option)
    ?metric_results:(metric_results_ : metric_results option)
    ?num_items_evaluated:(num_items_evaluated_ : long option) ?message:(message_ : message option)
    () =
  ({
     resource_arn = resource_arn_;
     monitor_arn = monitor_arn_;
     evaluation_time = evaluation_time_;
     evaluation_state = evaluation_state_;
     window_start_datetime = window_start_datetime_;
     window_end_datetime = window_end_datetime_;
     predictor_event = predictor_event_;
     monitor_data_source = monitor_data_source_;
     metric_results = metric_results_;
     num_items_evaluated = num_items_evaluated_;
     message = message_;
   }
    : predictor_monitor_evaluation)

let make_list_monitor_evaluations_response ?next_token:(next_token_ : next_token option)
    ?predictor_monitor_evaluations:
      (predictor_monitor_evaluations_ : predictor_monitor_evaluations option) () =
  ({ next_token = next_token_; predictor_monitor_evaluations = predictor_monitor_evaluations_ }
    : list_monitor_evaluations_response)

let make_list_monitor_evaluations_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option)
    ~monitor_arn:(monitor_arn_ : arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     monitor_arn = monitor_arn_;
     filters = filters_;
   }
    : list_monitor_evaluations_request)

let make_forecast_summary ?forecast_arn:(forecast_arn_ : arn option)
    ?forecast_name:(forecast_name_ : name option) ?predictor_arn:(predictor_arn_ : string_ option)
    ?created_using_auto_predictor:(created_using_auto_predictor_ : boolean_ option)
    ?dataset_group_arn:(dataset_group_arn_ : string_ option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     forecast_arn = forecast_arn_;
     forecast_name = forecast_name_;
     predictor_arn = predictor_arn_;
     created_using_auto_predictor = created_using_auto_predictor_;
     dataset_group_arn = dataset_group_arn_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : forecast_summary)

let make_list_forecasts_response ?forecasts:(forecasts_ : forecasts option)
    ?next_token:(next_token_ : next_token option) () =
  ({ forecasts = forecasts_; next_token = next_token_ } : list_forecasts_response)

let make_list_forecasts_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_forecasts_request)

let make_forecast_export_job_summary
    ?forecast_export_job_arn:(forecast_export_job_arn_ : arn option)
    ?forecast_export_job_name:(forecast_export_job_name_ : name option)
    ?destination:(destination_ : data_destination option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     forecast_export_job_arn = forecast_export_job_arn_;
     forecast_export_job_name = forecast_export_job_name_;
     destination = destination_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : forecast_export_job_summary)

let make_list_forecast_export_jobs_response
    ?forecast_export_jobs:(forecast_export_jobs_ : forecast_export_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ forecast_export_jobs = forecast_export_jobs_; next_token = next_token_ }
    : list_forecast_export_jobs_response)

let make_list_forecast_export_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_forecast_export_jobs_request)

let make_explainability_export_summary
    ?explainability_export_arn:(explainability_export_arn_ : arn option)
    ?explainability_export_name:(explainability_export_name_ : name option)
    ?destination:(destination_ : data_destination option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     explainability_export_arn = explainability_export_arn_;
     explainability_export_name = explainability_export_name_;
     destination = destination_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : explainability_export_summary)

let make_list_explainability_exports_response
    ?explainability_exports:(explainability_exports_ : explainability_exports option)
    ?next_token:(next_token_ : next_token option) () =
  ({ explainability_exports = explainability_exports_; next_token = next_token_ }
    : list_explainability_exports_response)

let make_list_explainability_exports_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_explainability_exports_request)

let make_explainability_config
    ~time_series_granularity:(time_series_granularity_ : time_series_granularity)
    ~time_point_granularity:(time_point_granularity_ : time_point_granularity) () =
  ({
     time_series_granularity = time_series_granularity_;
     time_point_granularity = time_point_granularity_;
   }
    : explainability_config)

let make_explainability_summary ?explainability_arn:(explainability_arn_ : arn option)
    ?explainability_name:(explainability_name_ : name option)
    ?resource_arn:(resource_arn_ : arn option)
    ?explainability_config:(explainability_config_ : explainability_config option)
    ?status:(status_ : status option) ?message:(message_ : message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     explainability_arn = explainability_arn_;
     explainability_name = explainability_name_;
     resource_arn = resource_arn_;
     explainability_config = explainability_config_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : explainability_summary)

let make_list_explainabilities_response
    ?explainabilities:(explainabilities_ : explainabilities option)
    ?next_token:(next_token_ : next_token option) () =
  ({ explainabilities = explainabilities_; next_token = next_token_ }
    : list_explainabilities_response)

let make_list_explainabilities_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_explainabilities_request)

let make_dataset_summary ?dataset_arn:(dataset_arn_ : arn option)
    ?dataset_name:(dataset_name_ : name option) ?dataset_type:(dataset_type_ : dataset_type option)
    ?domain:(domain_ : domain option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     dataset_arn = dataset_arn_;
     dataset_name = dataset_name_;
     dataset_type = dataset_type_;
     domain = domain_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : dataset_summary)

let make_list_datasets_response ?datasets:(datasets_ : datasets option)
    ?next_token:(next_token_ : next_token option) () =
  ({ datasets = datasets_; next_token = next_token_ } : list_datasets_response)

let make_list_datasets_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_datasets_request)

let make_data_source ~s3_config:(s3_config_ : s3_config) () =
  ({ s3_config = s3_config_ } : data_source)

let make_dataset_import_job_summary ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option)
    ?dataset_import_job_name:(dataset_import_job_name_ : name option)
    ?data_source:(data_source_ : data_source option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?import_mode:(import_mode_ : import_mode option) () =
  ({
     dataset_import_job_arn = dataset_import_job_arn_;
     dataset_import_job_name = dataset_import_job_name_;
     data_source = data_source_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     import_mode = import_mode_;
   }
    : dataset_import_job_summary)

let make_list_dataset_import_jobs_response
    ?dataset_import_jobs:(dataset_import_jobs_ : dataset_import_jobs option)
    ?next_token:(next_token_ : next_token option) () =
  ({ dataset_import_jobs = dataset_import_jobs_; next_token = next_token_ }
    : list_dataset_import_jobs_response)

let make_list_dataset_import_jobs_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?filters:(filters_ : filters option) () =
  ({ next_token = next_token_; max_results = max_results_; filters = filters_ }
    : list_dataset_import_jobs_request)

let make_dataset_group_summary ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?dataset_group_name:(dataset_group_name_ : name option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     dataset_group_arn = dataset_group_arn_;
     dataset_group_name = dataset_group_name_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : dataset_group_summary)

let make_list_dataset_groups_response ?dataset_groups:(dataset_groups_ : dataset_groups option)
    ?next_token:(next_token_ : next_token option) () =
  ({ dataset_groups = dataset_groups_; next_token = next_token_ } : list_dataset_groups_response)

let make_list_dataset_groups_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_dataset_groups_request)

let make_error_metric ?forecast_type:(forecast_type_ : forecast_type option)
    ?wap_e:(wap_e_ : double option) ?rms_e:(rms_e_ : double option) ?mas_e:(mas_e_ : double option)
    ?map_e:(map_e_ : double option) () =
  ({
     forecast_type = forecast_type_;
     wap_e = wap_e_;
     rms_e = rms_e_;
     mas_e = mas_e_;
     map_e = map_e_;
   }
    : error_metric)

let make_weighted_quantile_loss ?quantile:(quantile_ : double option)
    ?loss_value:(loss_value_ : double option) () =
  ({ quantile = quantile_; loss_value = loss_value_ } : weighted_quantile_loss)

let make_metrics ?rms_e:(rms_e_ : double option)
    ?weighted_quantile_losses:(weighted_quantile_losses_ : weighted_quantile_losses option)
    ?error_metrics:(error_metrics_ : error_metrics option)
    ?average_weighted_quantile_loss:(average_weighted_quantile_loss_ : double option) () =
  ({
     rms_e = rms_e_;
     weighted_quantile_losses = weighted_quantile_losses_;
     error_metrics = error_metrics_;
     average_weighted_quantile_loss = average_weighted_quantile_loss_;
   }
    : metrics)

let make_window_summary ?test_window_start:(test_window_start_ : timestamp option)
    ?test_window_end:(test_window_end_ : timestamp option)
    ?item_count:(item_count_ : integer option)
    ?evaluation_type:(evaluation_type_ : evaluation_type option)
    ?metrics:(metrics_ : metrics option) () =
  ({
     test_window_start = test_window_start_;
     test_window_end = test_window_end_;
     item_count = item_count_;
     evaluation_type = evaluation_type_;
     metrics = metrics_;
   }
    : window_summary)

let make_get_accuracy_metrics_response
    ?predictor_evaluation_results:
      (predictor_evaluation_results_ : predictor_evaluation_results option)
    ?is_auto_predictor:(is_auto_predictor_ : boolean_ option)
    ?auto_ml_override_strategy:(auto_ml_override_strategy_ : auto_ml_override_strategy option)
    ?optimization_metric:(optimization_metric_ : optimization_metric option) () =
  ({
     predictor_evaluation_results = predictor_evaluation_results_;
     is_auto_predictor = is_auto_predictor_;
     auto_ml_override_strategy = auto_ml_override_strategy_;
     optimization_metric = optimization_metric_;
   }
    : get_accuracy_metrics_response)

let make_get_accuracy_metrics_request ~predictor_arn:(predictor_arn_ : arn) () =
  ({ predictor_arn = predictor_arn_ } : get_accuracy_metrics_request)

let make_describe_what_if_forecast_export_response
    ?what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn option)
    ?what_if_forecast_export_name:(what_if_forecast_export_name_ : name option)
    ?what_if_forecast_arns:(what_if_forecast_arns_ : long_arn_list option)
    ?destination:(destination_ : data_destination option) ?message:(message_ : message option)
    ?status:(status_ : status option) ?creation_time:(creation_time_ : timestamp option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?format:(format_ : format option) () =
  ({
     what_if_forecast_export_arn = what_if_forecast_export_arn_;
     what_if_forecast_export_name = what_if_forecast_export_name_;
     what_if_forecast_arns = what_if_forecast_arns_;
     destination = destination_;
     message = message_;
     status = status_;
     creation_time = creation_time_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     last_modification_time = last_modification_time_;
     format = format_;
   }
    : describe_what_if_forecast_export_response)

let make_describe_what_if_forecast_export_request
    ~what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn) () =
  ({ what_if_forecast_export_arn = what_if_forecast_export_arn_ }
    : describe_what_if_forecast_export_request)

let make_schema_attribute ?attribute_name:(attribute_name_ : name option)
    ?attribute_type:(attribute_type_ : attribute_type option) () =
  ({ attribute_name = attribute_name_; attribute_type = attribute_type_ } : schema_attribute)

let make_schema ?attributes:(attributes_ : schema_attributes option) () =
  ({ attributes = attributes_ } : schema)

let make_time_series_replacements_data_source ?format:(format_ : format option)
    ?timestamp_format:(timestamp_format_ : timestamp_format option)
    ~s3_config:(s3_config_ : s3_config) ~schema:(schema_ : schema) () =
  ({
     s3_config = s3_config_;
     schema = schema_;
     format = format_;
     timestamp_format = timestamp_format_;
   }
    : time_series_replacements_data_source)

let make_time_series_condition ~attribute_name:(attribute_name_ : name)
    ~attribute_value:(attribute_value_ : attribute_value) ~condition:(condition_ : condition) () =
  ({ attribute_name = attribute_name_; attribute_value = attribute_value_; condition = condition_ }
    : time_series_condition)

let make_time_series_transformation ?action:(action_ : action option)
    ?time_series_conditions:(time_series_conditions_ : time_series_conditions option) () =
  ({ action = action_; time_series_conditions = time_series_conditions_ }
    : time_series_transformation)

let make_describe_what_if_forecast_response
    ?what_if_forecast_name:(what_if_forecast_name_ : name option)
    ?what_if_forecast_arn:(what_if_forecast_arn_ : long_arn option)
    ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?status:(status_ : string_ option) ?message:(message_ : error_message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?time_series_transformations:(time_series_transformations_ : time_series_transformations option)
    ?time_series_replacements_data_source:
      (time_series_replacements_data_source_ : time_series_replacements_data_source option)
    ?forecast_types:(forecast_types_ : forecast_types option) () =
  ({
     what_if_forecast_name = what_if_forecast_name_;
     what_if_forecast_arn = what_if_forecast_arn_;
     what_if_analysis_arn = what_if_analysis_arn_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     time_series_transformations = time_series_transformations_;
     time_series_replacements_data_source = time_series_replacements_data_source_;
     forecast_types = forecast_types_;
   }
    : describe_what_if_forecast_response)

let make_describe_what_if_forecast_request ~what_if_forecast_arn:(what_if_forecast_arn_ : long_arn)
    () =
  ({ what_if_forecast_arn = what_if_forecast_arn_ } : describe_what_if_forecast_request)

let make_time_series_identifiers ?data_source:(data_source_ : data_source option)
    ?schema:(schema_ : schema option) ?format:(format_ : format option) () =
  ({ data_source = data_source_; schema = schema_; format = format_ } : time_series_identifiers)

let make_time_series_selector
    ?time_series_identifiers:(time_series_identifiers_ : time_series_identifiers option) () =
  ({ time_series_identifiers = time_series_identifiers_ } : time_series_selector)

let make_describe_what_if_analysis_response
    ?what_if_analysis_name:(what_if_analysis_name_ : name option)
    ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option)
    ?forecast_arn:(forecast_arn_ : arn option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?status:(status_ : string_ option) ?message:(message_ : error_message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?time_series_selector:(time_series_selector_ : time_series_selector option) () =
  ({
     what_if_analysis_name = what_if_analysis_name_;
     what_if_analysis_arn = what_if_analysis_arn_;
     forecast_arn = forecast_arn_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     time_series_selector = time_series_selector_;
   }
    : describe_what_if_analysis_response)

let make_describe_what_if_analysis_request ~what_if_analysis_arn:(what_if_analysis_arn_ : arn) () =
  ({ what_if_analysis_arn = what_if_analysis_arn_ } : describe_what_if_analysis_request)

let make_describe_predictor_backtest_export_job_response
    ?predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn option)
    ?predictor_backtest_export_job_name:(predictor_backtest_export_job_name_ : name option)
    ?predictor_arn:(predictor_arn_ : arn option)
    ?destination:(destination_ : data_destination option) ?message:(message_ : message option)
    ?status:(status_ : status option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?format:(format_ : format option) () =
  ({
     predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_;
     predictor_backtest_export_job_name = predictor_backtest_export_job_name_;
     predictor_arn = predictor_arn_;
     destination = destination_;
     message = message_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     format = format_;
   }
    : describe_predictor_backtest_export_job_response)

let make_describe_predictor_backtest_export_job_request
    ~predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn) () =
  ({ predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_ }
    : describe_predictor_backtest_export_job_request)

let make_test_window_summary ?test_window_start:(test_window_start_ : timestamp option)
    ?test_window_end:(test_window_end_ : timestamp option) ?status:(status_ : status option)
    ?message:(message_ : error_message option) () =
  ({
     test_window_start = test_window_start_;
     test_window_end = test_window_end_;
     status = status_;
     message = message_;
   }
    : test_window_summary)

let make_predictor_execution ?algorithm_arn:(algorithm_arn_ : arn option)
    ?test_windows:(test_windows_ : test_window_details option) () =
  ({ algorithm_arn = algorithm_arn_; test_windows = test_windows_ } : predictor_execution)

let make_predictor_execution_details
    ?predictor_executions:(predictor_executions_ : predictor_executions option) () =
  ({ predictor_executions = predictor_executions_ } : predictor_execution_details)

let make_encryption_config ~role_arn:(role_arn_ : arn) ~kms_key_arn:(kms_key_arn_ : kms_key_arn) ()
    =
  ({ role_arn = role_arn_; kms_key_arn = kms_key_arn_ } : encryption_config)

let make_featurization_method
    ?featurization_method_parameters:
      (featurization_method_parameters_ : featurization_method_parameters option)
    ~featurization_method_name:(featurization_method_name_ : featurization_method_name) () =
  ({
     featurization_method_name = featurization_method_name_;
     featurization_method_parameters = featurization_method_parameters_;
   }
    : featurization_method)

let make_featurization
    ?featurization_pipeline:(featurization_pipeline_ : featurization_pipeline option)
    ~attribute_name:(attribute_name_ : name) () =
  ({ attribute_name = attribute_name_; featurization_pipeline = featurization_pipeline_ }
    : featurization)

let make_featurization_config
    ?forecast_dimensions:(forecast_dimensions_ : forecast_dimensions option)
    ?featurizations:(featurizations_ : featurizations option)
    ~forecast_frequency:(forecast_frequency_ : frequency) () =
  ({
     forecast_frequency = forecast_frequency_;
     forecast_dimensions = forecast_dimensions_;
     featurizations = featurizations_;
   }
    : featurization_config)

let make_supplementary_feature ~name:(name_ : name) ~value:(value_ : value) () =
  ({ name = name_; value = value_ } : supplementary_feature)

let make_input_data_config
    ?supplementary_features:(supplementary_features_ : supplementary_features option)
    ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_; supplementary_features = supplementary_features_ }
    : input_data_config)

let make_integer_parameter_range ?scaling_type:(scaling_type_ : scaling_type option)
    ~name:(name_ : name) ~max_value:(max_value_ : integer) ~min_value:(min_value_ : integer) () =
  ({ name = name_; max_value = max_value_; min_value = min_value_; scaling_type = scaling_type_ }
    : integer_parameter_range)

let make_continuous_parameter_range ?scaling_type:(scaling_type_ : scaling_type option)
    ~name:(name_ : name) ~max_value:(max_value_ : double) ~min_value:(min_value_ : double) () =
  ({ name = name_; max_value = max_value_; min_value = min_value_; scaling_type = scaling_type_ }
    : continuous_parameter_range)

let make_categorical_parameter_range ~name:(name_ : name) ~values:(values_ : values) () =
  ({ name = name_; values = values_ } : categorical_parameter_range)

let make_parameter_ranges
    ?categorical_parameter_ranges:
      (categorical_parameter_ranges_ : categorical_parameter_ranges option)
    ?continuous_parameter_ranges:(continuous_parameter_ranges_ : continuous_parameter_ranges option)
    ?integer_parameter_ranges:(integer_parameter_ranges_ : integer_parameter_ranges option) () =
  ({
     categorical_parameter_ranges = categorical_parameter_ranges_;
     continuous_parameter_ranges = continuous_parameter_ranges_;
     integer_parameter_ranges = integer_parameter_ranges_;
   }
    : parameter_ranges)

let make_hyper_parameter_tuning_job_config
    ?parameter_ranges:(parameter_ranges_ : parameter_ranges option) () =
  ({ parameter_ranges = parameter_ranges_ } : hyper_parameter_tuning_job_config)

let make_evaluation_parameters
    ?number_of_backtest_windows:(number_of_backtest_windows_ : integer option)
    ?back_test_window_offset:(back_test_window_offset_ : integer option) () =
  ({
     number_of_backtest_windows = number_of_backtest_windows_;
     back_test_window_offset = back_test_window_offset_;
   }
    : evaluation_parameters)

let make_describe_predictor_response ?predictor_arn:(predictor_arn_ : name option)
    ?predictor_name:(predictor_name_ : name option) ?algorithm_arn:(algorithm_arn_ : arn option)
    ?auto_ml_algorithm_arns:(auto_ml_algorithm_arns_ : arn_list option)
    ?forecast_horizon:(forecast_horizon_ : integer option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?perform_auto_m_l:(perform_auto_m_l_ : boolean_ option)
    ?auto_ml_override_strategy:(auto_ml_override_strategy_ : auto_ml_override_strategy option)
    ?perform_hp_o:(perform_hp_o_ : boolean_ option)
    ?training_parameters:(training_parameters_ : training_parameters option)
    ?evaluation_parameters:(evaluation_parameters_ : evaluation_parameters option)
    ?hpo_config:(hpo_config_ : hyper_parameter_tuning_job_config option)
    ?input_data_config:(input_data_config_ : input_data_config option)
    ?featurization_config:(featurization_config_ : featurization_config option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?predictor_execution_details:(predictor_execution_details_ : predictor_execution_details option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?is_auto_predictor:(is_auto_predictor_ : boolean_ option)
    ?dataset_import_job_arns:(dataset_import_job_arns_ : arn_list option)
    ?status:(status_ : status option) ?message:(message_ : message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?optimization_metric:(optimization_metric_ : optimization_metric option) () =
  ({
     predictor_arn = predictor_arn_;
     predictor_name = predictor_name_;
     algorithm_arn = algorithm_arn_;
     auto_ml_algorithm_arns = auto_ml_algorithm_arns_;
     forecast_horizon = forecast_horizon_;
     forecast_types = forecast_types_;
     perform_auto_m_l = perform_auto_m_l_;
     auto_ml_override_strategy = auto_ml_override_strategy_;
     perform_hp_o = perform_hp_o_;
     training_parameters = training_parameters_;
     evaluation_parameters = evaluation_parameters_;
     hpo_config = hpo_config_;
     input_data_config = input_data_config_;
     featurization_config = featurization_config_;
     encryption_config = encryption_config_;
     predictor_execution_details = predictor_execution_details_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     is_auto_predictor = is_auto_predictor_;
     dataset_import_job_arns = dataset_import_job_arns_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     optimization_metric = optimization_metric_;
   }
    : describe_predictor_response)

let make_describe_predictor_request ~predictor_arn:(predictor_arn_ : arn) () =
  ({ predictor_arn = predictor_arn_ } : describe_predictor_request)

let make_baseline_metric ?name:(name_ : name option) ?value:(value_ : double option) () =
  ({ name = name_; value = value_ } : baseline_metric)

let make_predictor_baseline ?baseline_metrics:(baseline_metrics_ : baseline_metrics option) () =
  ({ baseline_metrics = baseline_metrics_ } : predictor_baseline)

let make_baseline ?predictor_baseline:(predictor_baseline_ : predictor_baseline option) () =
  ({ predictor_baseline = predictor_baseline_ } : baseline)

let make_describe_monitor_response ?monitor_name:(monitor_name_ : name option)
    ?monitor_arn:(monitor_arn_ : arn option) ?resource_arn:(resource_arn_ : arn option)
    ?status:(status_ : status option)
    ?last_evaluation_time:(last_evaluation_time_ : timestamp option)
    ?last_evaluation_state:(last_evaluation_state_ : evaluation_state option)
    ?baseline:(baseline_ : baseline option) ?message:(message_ : message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?estimated_evaluation_time_remaining_in_minutes:
      (estimated_evaluation_time_remaining_in_minutes_ : long option) () =
  ({
     monitor_name = monitor_name_;
     monitor_arn = monitor_arn_;
     resource_arn = resource_arn_;
     status = status_;
     last_evaluation_time = last_evaluation_time_;
     last_evaluation_state = last_evaluation_state_;
     baseline = baseline_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     estimated_evaluation_time_remaining_in_minutes =
       estimated_evaluation_time_remaining_in_minutes_;
   }
    : describe_monitor_response)

let make_describe_monitor_request ~monitor_arn:(monitor_arn_ : arn) () =
  ({ monitor_arn = monitor_arn_ } : describe_monitor_request)

let make_describe_forecast_export_job_response
    ?forecast_export_job_arn:(forecast_export_job_arn_ : arn option)
    ?forecast_export_job_name:(forecast_export_job_name_ : name option)
    ?forecast_arn:(forecast_arn_ : arn option) ?destination:(destination_ : data_destination option)
    ?message:(message_ : message option) ?status:(status_ : status option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?format:(format_ : format option) () =
  ({
     forecast_export_job_arn = forecast_export_job_arn_;
     forecast_export_job_name = forecast_export_job_name_;
     forecast_arn = forecast_arn_;
     destination = destination_;
     message = message_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     format = format_;
   }
    : describe_forecast_export_job_response)

let make_describe_forecast_export_job_request
    ~forecast_export_job_arn:(forecast_export_job_arn_ : arn) () =
  ({ forecast_export_job_arn = forecast_export_job_arn_ } : describe_forecast_export_job_request)

let make_describe_forecast_response ?forecast_arn:(forecast_arn_ : arn option)
    ?forecast_name:(forecast_name_ : name option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?predictor_arn:(predictor_arn_ : arn option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?status:(status_ : string_ option) ?message:(message_ : error_message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?time_series_selector:(time_series_selector_ : time_series_selector option) () =
  ({
     forecast_arn = forecast_arn_;
     forecast_name = forecast_name_;
     forecast_types = forecast_types_;
     predictor_arn = predictor_arn_;
     dataset_group_arn = dataset_group_arn_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     time_series_selector = time_series_selector_;
   }
    : describe_forecast_response)

let make_describe_forecast_request ~forecast_arn:(forecast_arn_ : arn) () =
  ({ forecast_arn = forecast_arn_ } : describe_forecast_request)

let make_describe_explainability_export_response
    ?explainability_export_arn:(explainability_export_arn_ : arn option)
    ?explainability_export_name:(explainability_export_name_ : name option)
    ?explainability_arn:(explainability_arn_ : arn option)
    ?destination:(destination_ : data_destination option) ?message:(message_ : message option)
    ?status:(status_ : status option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?format:(format_ : format option) () =
  ({
     explainability_export_arn = explainability_export_arn_;
     explainability_export_name = explainability_export_name_;
     explainability_arn = explainability_arn_;
     destination = destination_;
     message = message_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     format = format_;
   }
    : describe_explainability_export_response)

let make_describe_explainability_export_request
    ~explainability_export_arn:(explainability_export_arn_ : arn) () =
  ({ explainability_export_arn = explainability_export_arn_ }
    : describe_explainability_export_request)

let make_describe_explainability_response ?explainability_arn:(explainability_arn_ : arn option)
    ?explainability_name:(explainability_name_ : name option)
    ?resource_arn:(resource_arn_ : arn option)
    ?explainability_config:(explainability_config_ : explainability_config option)
    ?enable_visualization:(enable_visualization_ : boolean_ option)
    ?data_source:(data_source_ : data_source option) ?schema:(schema_ : schema option)
    ?start_date_time:(start_date_time_ : local_date_time option)
    ?end_date_time:(end_date_time_ : local_date_time option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?message:(message_ : message option) ?status:(status_ : status option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     explainability_arn = explainability_arn_;
     explainability_name = explainability_name_;
     resource_arn = resource_arn_;
     explainability_config = explainability_config_;
     enable_visualization = enable_visualization_;
     data_source = data_source_;
     schema = schema_;
     start_date_time = start_date_time_;
     end_date_time = end_date_time_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     message = message_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : describe_explainability_response)

let make_describe_explainability_request ~explainability_arn:(explainability_arn_ : arn) () =
  ({ explainability_arn = explainability_arn_ } : describe_explainability_request)

let make_statistics ?count:(count_ : integer option)
    ?count_distinct:(count_distinct_ : integer option) ?count_null:(count_null_ : integer option)
    ?count_nan:(count_nan_ : integer option) ?min:(min_ : string_ option)
    ?max:(max_ : string_ option) ?avg:(avg_ : double option) ?stddev:(stddev_ : double option)
    ?count_long:(count_long_ : long option)
    ?count_distinct_long:(count_distinct_long_ : long option)
    ?count_null_long:(count_null_long_ : long option)
    ?count_nan_long:(count_nan_long_ : long option) () =
  ({
     count = count_;
     count_distinct = count_distinct_;
     count_null = count_null_;
     count_nan = count_nan_;
     min = min_;
     max = max_;
     avg = avg_;
     stddev = stddev_;
     count_long = count_long_;
     count_distinct_long = count_distinct_long_;
     count_null_long = count_null_long_;
     count_nan_long = count_nan_long_;
   }
    : statistics)

let make_describe_dataset_import_job_response
    ?dataset_import_job_name:(dataset_import_job_name_ : name option)
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option)
    ?dataset_arn:(dataset_arn_ : arn option)
    ?timestamp_format:(timestamp_format_ : timestamp_format option)
    ?time_zone:(time_zone_ : time_zone option)
    ?use_geolocation_for_time_zone:
      (use_geolocation_for_time_zone_ : use_geolocation_for_time_zone option)
    ?geolocation_format:(geolocation_format_ : geolocation_format option)
    ?data_source:(data_source_ : data_source option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?field_statistics:(field_statistics_ : field_statistics option)
    ?data_size:(data_size_ : double option) ?status:(status_ : status option)
    ?message:(message_ : message option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?format:(format_ : format option) ?import_mode:(import_mode_ : import_mode option) () =
  ({
     dataset_import_job_name = dataset_import_job_name_;
     dataset_import_job_arn = dataset_import_job_arn_;
     dataset_arn = dataset_arn_;
     timestamp_format = timestamp_format_;
     time_zone = time_zone_;
     use_geolocation_for_time_zone = use_geolocation_for_time_zone_;
     geolocation_format = geolocation_format_;
     data_source = data_source_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     field_statistics = field_statistics_;
     data_size = data_size_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     format = format_;
     import_mode = import_mode_;
   }
    : describe_dataset_import_job_response)

let make_describe_dataset_import_job_request ~dataset_import_job_arn:(dataset_import_job_arn_ : arn)
    () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : describe_dataset_import_job_request)

let make_describe_dataset_group_response ?dataset_group_name:(dataset_group_name_ : name option)
    ?dataset_group_arn:(dataset_group_arn_ : arn option)
    ?dataset_arns:(dataset_arns_ : arn_list option) ?domain:(domain_ : domain option)
    ?status:(status_ : status option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     dataset_group_name = dataset_group_name_;
     dataset_group_arn = dataset_group_arn_;
     dataset_arns = dataset_arns_;
     domain = domain_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : describe_dataset_group_response)

let make_describe_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_ } : describe_dataset_group_request)

let make_describe_dataset_response ?dataset_arn:(dataset_arn_ : arn option)
    ?dataset_name:(dataset_name_ : name option) ?domain:(domain_ : domain option)
    ?dataset_type:(dataset_type_ : dataset_type option)
    ?data_frequency:(data_frequency_ : frequency option) ?schema:(schema_ : schema option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?status:(status_ : status option) ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option) () =
  ({
     dataset_arn = dataset_arn_;
     dataset_name = dataset_name_;
     domain = domain_;
     dataset_type = dataset_type_;
     data_frequency = data_frequency_;
     schema = schema_;
     encryption_config = encryption_config_;
     status = status_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
   }
    : describe_dataset_response)

let make_describe_dataset_request ~dataset_arn:(dataset_arn_ : arn) () =
  ({ dataset_arn = dataset_arn_ } : describe_dataset_request)

let make_time_alignment_boundary ?month:(month_ : month option)
    ?day_of_month:(day_of_month_ : day_of_month option)
    ?day_of_week:(day_of_week_ : day_of_week option) ?hour:(hour_ : hour option) () =
  ({ month = month_; day_of_month = day_of_month_; day_of_week = day_of_week_; hour = hour_ }
    : time_alignment_boundary)

let make_monitor_info ?monitor_arn:(monitor_arn_ : arn option) ?status:(status_ : status option) ()
    =
  ({ monitor_arn = monitor_arn_; status = status_ } : monitor_info)

let make_explainability_info ?explainability_arn:(explainability_arn_ : arn option)
    ?status:(status_ : status option) () =
  ({ explainability_arn = explainability_arn_; status = status_ } : explainability_info)

let make_attribute_config ~attribute_name:(attribute_name_ : name)
    ~transformations:(transformations_ : transformations) () =
  ({ attribute_name = attribute_name_; transformations = transformations_ } : attribute_config)

let make_data_config ?attribute_configs:(attribute_configs_ : attribute_configs option)
    ?additional_datasets:(additional_datasets_ : additional_datasets option)
    ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({
     dataset_group_arn = dataset_group_arn_;
     attribute_configs = attribute_configs_;
     additional_datasets = additional_datasets_;
   }
    : data_config)

let make_describe_auto_predictor_response ?predictor_arn:(predictor_arn_ : arn option)
    ?predictor_name:(predictor_name_ : name option)
    ?forecast_horizon:(forecast_horizon_ : integer option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?forecast_frequency:(forecast_frequency_ : frequency option)
    ?forecast_dimensions:(forecast_dimensions_ : forecast_dimensions option)
    ?dataset_import_job_arns:(dataset_import_job_arns_ : arn_list option)
    ?data_config:(data_config_ : data_config option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?reference_predictor_summary:(reference_predictor_summary_ : reference_predictor_summary option)
    ?estimated_time_remaining_in_minutes:(estimated_time_remaining_in_minutes_ : long option)
    ?status:(status_ : status option) ?message:(message_ : message option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_modification_time:(last_modification_time_ : timestamp option)
    ?optimization_metric:(optimization_metric_ : optimization_metric option)
    ?explainability_info:(explainability_info_ : explainability_info option)
    ?monitor_info:(monitor_info_ : monitor_info option)
    ?time_alignment_boundary:(time_alignment_boundary_ : time_alignment_boundary option) () =
  ({
     predictor_arn = predictor_arn_;
     predictor_name = predictor_name_;
     forecast_horizon = forecast_horizon_;
     forecast_types = forecast_types_;
     forecast_frequency = forecast_frequency_;
     forecast_dimensions = forecast_dimensions_;
     dataset_import_job_arns = dataset_import_job_arns_;
     data_config = data_config_;
     encryption_config = encryption_config_;
     reference_predictor_summary = reference_predictor_summary_;
     estimated_time_remaining_in_minutes = estimated_time_remaining_in_minutes_;
     status = status_;
     message = message_;
     creation_time = creation_time_;
     last_modification_time = last_modification_time_;
     optimization_metric = optimization_metric_;
     explainability_info = explainability_info_;
     monitor_info = monitor_info_;
     time_alignment_boundary = time_alignment_boundary_;
   }
    : describe_auto_predictor_response)

let make_describe_auto_predictor_request ~predictor_arn:(predictor_arn_ : arn) () =
  ({ predictor_arn = predictor_arn_ } : describe_auto_predictor_request)

let make_delete_what_if_forecast_export_request
    ~what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn) () =
  ({ what_if_forecast_export_arn = what_if_forecast_export_arn_ }
    : delete_what_if_forecast_export_request)

let make_delete_what_if_forecast_request ~what_if_forecast_arn:(what_if_forecast_arn_ : long_arn) ()
    =
  ({ what_if_forecast_arn = what_if_forecast_arn_ } : delete_what_if_forecast_request)

let make_delete_what_if_analysis_request ~what_if_analysis_arn:(what_if_analysis_arn_ : arn) () =
  ({ what_if_analysis_arn = what_if_analysis_arn_ } : delete_what_if_analysis_request)

let make_delete_resource_tree_request ~resource_arn:(resource_arn_ : arn) () =
  ({ resource_arn = resource_arn_ } : delete_resource_tree_request)

let make_delete_predictor_backtest_export_job_request
    ~predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn) () =
  ({ predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_ }
    : delete_predictor_backtest_export_job_request)

let make_delete_predictor_request ~predictor_arn:(predictor_arn_ : arn) () =
  ({ predictor_arn = predictor_arn_ } : delete_predictor_request)

let make_delete_monitor_request ~monitor_arn:(monitor_arn_ : arn) () =
  ({ monitor_arn = monitor_arn_ } : delete_monitor_request)

let make_delete_forecast_export_job_request
    ~forecast_export_job_arn:(forecast_export_job_arn_ : arn) () =
  ({ forecast_export_job_arn = forecast_export_job_arn_ } : delete_forecast_export_job_request)

let make_delete_forecast_request ~forecast_arn:(forecast_arn_ : arn) () =
  ({ forecast_arn = forecast_arn_ } : delete_forecast_request)

let make_delete_explainability_export_request
    ~explainability_export_arn:(explainability_export_arn_ : arn) () =
  ({ explainability_export_arn = explainability_export_arn_ }
    : delete_explainability_export_request)

let make_delete_explainability_request ~explainability_arn:(explainability_arn_ : arn) () =
  ({ explainability_arn = explainability_arn_ } : delete_explainability_request)

let make_delete_dataset_import_job_request ~dataset_import_job_arn:(dataset_import_job_arn_ : arn)
    () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : delete_dataset_import_job_request)

let make_delete_dataset_group_request ~dataset_group_arn:(dataset_group_arn_ : arn) () =
  ({ dataset_group_arn = dataset_group_arn_ } : delete_dataset_group_request)

let make_delete_dataset_request ~dataset_arn:(dataset_arn_ : arn) () =
  ({ dataset_arn = dataset_arn_ } : delete_dataset_request)

let make_create_what_if_forecast_export_response
    ?what_if_forecast_export_arn:(what_if_forecast_export_arn_ : long_arn option) () =
  ({ what_if_forecast_export_arn = what_if_forecast_export_arn_ }
    : create_what_if_forecast_export_response)

let make_create_what_if_forecast_export_request ?tags:(tags_ : tags option)
    ?format:(format_ : format option)
    ~what_if_forecast_export_name:(what_if_forecast_export_name_ : name)
    ~what_if_forecast_arns:(what_if_forecast_arns_ : what_if_forecast_arn_list_for_export)
    ~destination:(destination_ : data_destination) () =
  ({
     what_if_forecast_export_name = what_if_forecast_export_name_;
     what_if_forecast_arns = what_if_forecast_arns_;
     destination = destination_;
     tags = tags_;
     format = format_;
   }
    : create_what_if_forecast_export_request)

let make_create_what_if_forecast_response
    ?what_if_forecast_arn:(what_if_forecast_arn_ : long_arn option) () =
  ({ what_if_forecast_arn = what_if_forecast_arn_ } : create_what_if_forecast_response)

let make_create_what_if_forecast_request
    ?time_series_transformations:(time_series_transformations_ : time_series_transformations option)
    ?time_series_replacements_data_source:
      (time_series_replacements_data_source_ : time_series_replacements_data_source option)
    ?tags:(tags_ : tags option) ~what_if_forecast_name:(what_if_forecast_name_ : name)
    ~what_if_analysis_arn:(what_if_analysis_arn_ : arn) () =
  ({
     what_if_forecast_name = what_if_forecast_name_;
     what_if_analysis_arn = what_if_analysis_arn_;
     time_series_transformations = time_series_transformations_;
     time_series_replacements_data_source = time_series_replacements_data_source_;
     tags = tags_;
   }
    : create_what_if_forecast_request)

let make_create_what_if_analysis_response ?what_if_analysis_arn:(what_if_analysis_arn_ : arn option)
    () =
  ({ what_if_analysis_arn = what_if_analysis_arn_ } : create_what_if_analysis_response)

let make_create_what_if_analysis_request
    ?time_series_selector:(time_series_selector_ : time_series_selector option)
    ?tags:(tags_ : tags option) ~what_if_analysis_name:(what_if_analysis_name_ : name)
    ~forecast_arn:(forecast_arn_ : arn) () =
  ({
     what_if_analysis_name = what_if_analysis_name_;
     forecast_arn = forecast_arn_;
     time_series_selector = time_series_selector_;
     tags = tags_;
   }
    : create_what_if_analysis_request)

let make_create_predictor_backtest_export_job_response
    ?predictor_backtest_export_job_arn:(predictor_backtest_export_job_arn_ : arn option) () =
  ({ predictor_backtest_export_job_arn = predictor_backtest_export_job_arn_ }
    : create_predictor_backtest_export_job_response)

let make_create_predictor_backtest_export_job_request ?tags:(tags_ : tags option)
    ?format:(format_ : format option)
    ~predictor_backtest_export_job_name:(predictor_backtest_export_job_name_ : name)
    ~predictor_arn:(predictor_arn_ : arn) ~destination:(destination_ : data_destination) () =
  ({
     predictor_backtest_export_job_name = predictor_backtest_export_job_name_;
     predictor_arn = predictor_arn_;
     destination = destination_;
     tags = tags_;
     format = format_;
   }
    : create_predictor_backtest_export_job_request)

let make_create_predictor_response ?predictor_arn:(predictor_arn_ : arn option) () =
  ({ predictor_arn = predictor_arn_ } : create_predictor_response)

let make_create_predictor_request ?algorithm_arn:(algorithm_arn_ : arn option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?perform_auto_m_l:(perform_auto_m_l_ : boolean_ option)
    ?auto_ml_override_strategy:(auto_ml_override_strategy_ : auto_ml_override_strategy option)
    ?perform_hp_o:(perform_hp_o_ : boolean_ option)
    ?training_parameters:(training_parameters_ : training_parameters option)
    ?evaluation_parameters:(evaluation_parameters_ : evaluation_parameters option)
    ?hpo_config:(hpo_config_ : hyper_parameter_tuning_job_config option)
    ?encryption_config:(encryption_config_ : encryption_config option) ?tags:(tags_ : tags option)
    ?optimization_metric:(optimization_metric_ : optimization_metric option)
    ~predictor_name:(predictor_name_ : name) ~forecast_horizon:(forecast_horizon_ : integer)
    ~input_data_config:(input_data_config_ : input_data_config)
    ~featurization_config:(featurization_config_ : featurization_config) () =
  ({
     predictor_name = predictor_name_;
     algorithm_arn = algorithm_arn_;
     forecast_horizon = forecast_horizon_;
     forecast_types = forecast_types_;
     perform_auto_m_l = perform_auto_m_l_;
     auto_ml_override_strategy = auto_ml_override_strategy_;
     perform_hp_o = perform_hp_o_;
     training_parameters = training_parameters_;
     evaluation_parameters = evaluation_parameters_;
     hpo_config = hpo_config_;
     input_data_config = input_data_config_;
     featurization_config = featurization_config_;
     encryption_config = encryption_config_;
     tags = tags_;
     optimization_metric = optimization_metric_;
   }
    : create_predictor_request)

let make_create_monitor_response ?monitor_arn:(monitor_arn_ : arn option) () =
  ({ monitor_arn = monitor_arn_ } : create_monitor_response)

let make_create_monitor_request ?tags:(tags_ : tags option) ~monitor_name:(monitor_name_ : name)
    ~resource_arn:(resource_arn_ : arn) () =
  ({ monitor_name = monitor_name_; resource_arn = resource_arn_; tags = tags_ }
    : create_monitor_request)

let make_create_forecast_export_job_response
    ?forecast_export_job_arn:(forecast_export_job_arn_ : arn option) () =
  ({ forecast_export_job_arn = forecast_export_job_arn_ } : create_forecast_export_job_response)

let make_create_forecast_export_job_request ?tags:(tags_ : tags option)
    ?format:(format_ : format option) ~forecast_export_job_name:(forecast_export_job_name_ : name)
    ~forecast_arn:(forecast_arn_ : arn) ~destination:(destination_ : data_destination) () =
  ({
     forecast_export_job_name = forecast_export_job_name_;
     forecast_arn = forecast_arn_;
     destination = destination_;
     tags = tags_;
     format = format_;
   }
    : create_forecast_export_job_request)

let make_create_forecast_response ?forecast_arn:(forecast_arn_ : arn option) () =
  ({ forecast_arn = forecast_arn_ } : create_forecast_response)

let make_create_forecast_request ?forecast_types:(forecast_types_ : forecast_types option)
    ?tags:(tags_ : tags option)
    ?time_series_selector:(time_series_selector_ : time_series_selector option)
    ~forecast_name:(forecast_name_ : name) ~predictor_arn:(predictor_arn_ : arn) () =
  ({
     forecast_name = forecast_name_;
     predictor_arn = predictor_arn_;
     forecast_types = forecast_types_;
     tags = tags_;
     time_series_selector = time_series_selector_;
   }
    : create_forecast_request)

let make_create_explainability_export_response
    ?explainability_export_arn:(explainability_export_arn_ : arn option) () =
  ({ explainability_export_arn = explainability_export_arn_ }
    : create_explainability_export_response)

let make_create_explainability_export_request ?tags:(tags_ : tags option)
    ?format:(format_ : format option)
    ~explainability_export_name:(explainability_export_name_ : name)
    ~explainability_arn:(explainability_arn_ : arn) ~destination:(destination_ : data_destination)
    () =
  ({
     explainability_export_name = explainability_export_name_;
     explainability_arn = explainability_arn_;
     destination = destination_;
     tags = tags_;
     format = format_;
   }
    : create_explainability_export_request)

let make_create_explainability_response ?explainability_arn:(explainability_arn_ : arn option) () =
  ({ explainability_arn = explainability_arn_ } : create_explainability_response)

let make_create_explainability_request ?data_source:(data_source_ : data_source option)
    ?schema:(schema_ : schema option)
    ?enable_visualization:(enable_visualization_ : boolean_ option)
    ?start_date_time:(start_date_time_ : local_date_time option)
    ?end_date_time:(end_date_time_ : local_date_time option) ?tags:(tags_ : tags option)
    ~explainability_name:(explainability_name_ : name) ~resource_arn:(resource_arn_ : arn)
    ~explainability_config:(explainability_config_ : explainability_config) () =
  ({
     explainability_name = explainability_name_;
     resource_arn = resource_arn_;
     explainability_config = explainability_config_;
     data_source = data_source_;
     schema = schema_;
     enable_visualization = enable_visualization_;
     start_date_time = start_date_time_;
     end_date_time = end_date_time_;
     tags = tags_;
   }
    : create_explainability_request)

let make_create_dataset_import_job_response
    ?dataset_import_job_arn:(dataset_import_job_arn_ : arn option) () =
  ({ dataset_import_job_arn = dataset_import_job_arn_ } : create_dataset_import_job_response)

let make_create_dataset_import_job_request
    ?timestamp_format:(timestamp_format_ : timestamp_format option)
    ?time_zone:(time_zone_ : time_zone option)
    ?use_geolocation_for_time_zone:
      (use_geolocation_for_time_zone_ : use_geolocation_for_time_zone option)
    ?geolocation_format:(geolocation_format_ : geolocation_format option)
    ?tags:(tags_ : tags option) ?format:(format_ : format option)
    ?import_mode:(import_mode_ : import_mode option)
    ~dataset_import_job_name:(dataset_import_job_name_ : name) ~dataset_arn:(dataset_arn_ : arn)
    ~data_source:(data_source_ : data_source) () =
  ({
     dataset_import_job_name = dataset_import_job_name_;
     dataset_arn = dataset_arn_;
     data_source = data_source_;
     timestamp_format = timestamp_format_;
     time_zone = time_zone_;
     use_geolocation_for_time_zone = use_geolocation_for_time_zone_;
     geolocation_format = geolocation_format_;
     tags = tags_;
     format = format_;
     import_mode = import_mode_;
   }
    : create_dataset_import_job_request)

let make_create_dataset_group_response ?dataset_group_arn:(dataset_group_arn_ : arn option) () =
  ({ dataset_group_arn = dataset_group_arn_ } : create_dataset_group_response)

let make_create_dataset_group_request ?dataset_arns:(dataset_arns_ : arn_list option)
    ?tags:(tags_ : tags option) ~dataset_group_name:(dataset_group_name_ : name)
    ~domain:(domain_ : domain) () =
  ({
     dataset_group_name = dataset_group_name_;
     domain = domain_;
     dataset_arns = dataset_arns_;
     tags = tags_;
   }
    : create_dataset_group_request)

let make_create_dataset_response ?dataset_arn:(dataset_arn_ : arn option) () =
  ({ dataset_arn = dataset_arn_ } : create_dataset_response)

let make_create_dataset_request ?data_frequency:(data_frequency_ : frequency option)
    ?encryption_config:(encryption_config_ : encryption_config option) ?tags:(tags_ : tags option)
    ~dataset_name:(dataset_name_ : name) ~domain:(domain_ : domain)
    ~dataset_type:(dataset_type_ : dataset_type) ~schema:(schema_ : schema) () =
  ({
     dataset_name = dataset_name_;
     domain = domain_;
     dataset_type = dataset_type_;
     data_frequency = data_frequency_;
     schema = schema_;
     encryption_config = encryption_config_;
     tags = tags_;
   }
    : create_dataset_request)

let make_create_auto_predictor_response ?predictor_arn:(predictor_arn_ : arn option) () =
  ({ predictor_arn = predictor_arn_ } : create_auto_predictor_response)

let make_monitor_config ~monitor_name:(monitor_name_ : name) () =
  ({ monitor_name = monitor_name_ } : monitor_config)

let make_create_auto_predictor_request ?forecast_horizon:(forecast_horizon_ : integer option)
    ?forecast_types:(forecast_types_ : forecast_types option)
    ?forecast_dimensions:(forecast_dimensions_ : forecast_dimensions option)
    ?forecast_frequency:(forecast_frequency_ : frequency option)
    ?data_config:(data_config_ : data_config option)
    ?encryption_config:(encryption_config_ : encryption_config option)
    ?reference_predictor_arn:(reference_predictor_arn_ : arn option)
    ?optimization_metric:(optimization_metric_ : optimization_metric option)
    ?explain_predictor:(explain_predictor_ : boolean_ option) ?tags:(tags_ : tags option)
    ?monitor_config:(monitor_config_ : monitor_config option)
    ?time_alignment_boundary:(time_alignment_boundary_ : time_alignment_boundary option)
    ~predictor_name:(predictor_name_ : name) () =
  ({
     predictor_name = predictor_name_;
     forecast_horizon = forecast_horizon_;
     forecast_types = forecast_types_;
     forecast_dimensions = forecast_dimensions_;
     forecast_frequency = forecast_frequency_;
     data_config = data_config_;
     encryption_config = encryption_config_;
     reference_predictor_arn = reference_predictor_arn_;
     optimization_metric = optimization_metric_;
     explain_predictor = explain_predictor_;
     tags = tags_;
     monitor_config = monitor_config_;
     time_alignment_boundary = time_alignment_boundary_;
   }
    : create_auto_predictor_request)
