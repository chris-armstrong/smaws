open Types

val make_weighted_quantile_loss :
  ?loss_value:double -> ?quantile:double -> unit -> weighted_quantile_loss

val make_error_metric :
  ?map_e:double ->
  ?mas_e:double ->
  ?rms_e:double ->
  ?wap_e:double ->
  ?forecast_type:forecast_type ->
  unit ->
  error_metric

val make_metrics :
  ?average_weighted_quantile_loss:double ->
  ?error_metrics:error_metrics ->
  ?weighted_quantile_losses:weighted_quantile_losses ->
  ?rms_e:double ->
  unit ->
  metrics

val make_window_summary :
  ?metrics:metrics ->
  ?evaluation_type:evaluation_type ->
  ?item_count:integer ->
  ?test_window_end:timestamp ->
  ?test_window_start:timestamp ->
  unit ->
  window_summary

val make_what_if_forecast_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?what_if_analysis_arn:arn ->
  ?what_if_forecast_name:name ->
  ?what_if_forecast_arn:long_arn ->
  unit ->
  what_if_forecast_summary

val make_s3_config : ?kms_key_arn:kms_key_arn -> role_arn:arn -> path:s3_path -> unit -> s3_config
val make_data_destination : s3_config:s3_config -> unit -> data_destination

val make_what_if_forecast_export_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?destination:data_destination ->
  ?what_if_forecast_export_name:name ->
  ?what_if_forecast_arns:what_if_forecast_arn_list_for_export ->
  ?what_if_forecast_export_arn:long_arn ->
  unit ->
  what_if_forecast_export_summary

val make_what_if_analysis_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?forecast_arn:arn ->
  ?what_if_analysis_name:name ->
  ?what_if_analysis_arn:arn ->
  unit ->
  what_if_analysis_summary

val make_update_dataset_group_response : unit -> unit

val make_update_dataset_group_request :
  dataset_arns:arn_list -> dataset_group_arn:arn -> unit -> update_dataset_group_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:arn -> unit -> untag_resource_request

val make_action : value:double -> operation:operation -> attribute_name:name -> unit -> action

val make_time_series_condition :
  condition:condition ->
  attribute_value:attribute_value ->
  attribute_name:name ->
  unit ->
  time_series_condition

val make_time_series_transformation :
  ?time_series_conditions:time_series_conditions ->
  ?action:action ->
  unit ->
  time_series_transformation

val make_data_source : s3_config:s3_config -> unit -> data_source

val make_schema_attribute :
  ?attribute_type:attribute_type -> ?attribute_name:name -> unit -> schema_attribute

val make_schema : ?attributes:schema_attributes -> unit -> schema

val make_time_series_identifiers :
  ?format:format -> ?schema:schema -> ?data_source:data_source -> unit -> time_series_identifiers

val make_time_series_selector :
  ?time_series_identifiers:time_series_identifiers -> unit -> time_series_selector

val make_time_series_replacements_data_source :
  ?timestamp_format:timestamp_format ->
  ?format:format ->
  schema:schema ->
  s3_config:s3_config ->
  unit ->
  time_series_replacements_data_source

val make_time_alignment_boundary :
  ?hour:hour ->
  ?day_of_week:day_of_week ->
  ?day_of_month:day_of_month ->
  ?month:month ->
  unit ->
  time_alignment_boundary

val make_test_window_summary :
  ?message:error_message ->
  ?status:status ->
  ?test_window_end:timestamp ->
  ?test_window_start:timestamp ->
  unit ->
  test_window_summary

val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tags -> resource_arn:arn -> unit -> tag_resource_request
val make_supplementary_feature : value:value -> name:name -> unit -> supplementary_feature
val make_stop_resource_request : resource_arn:arn -> unit -> stop_resource_request

val make_statistics :
  ?count_nan_long:long ->
  ?count_null_long:long ->
  ?count_distinct_long:long ->
  ?count_long:long ->
  ?stddev:double ->
  ?avg:double ->
  ?max:string_ ->
  ?min:string_ ->
  ?count_nan:integer ->
  ?count_null:integer ->
  ?count_distinct:integer ->
  ?count:integer ->
  unit ->
  statistics

val make_resume_resource_request : resource_arn:arn -> unit -> resume_resource_request

val make_reference_predictor_summary :
  ?state:state -> ?arn:arn -> unit -> reference_predictor_summary

val make_predictor_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?reference_predictor_summary:reference_predictor_summary ->
  ?is_auto_predictor:boolean_ ->
  ?dataset_group_arn:arn ->
  ?predictor_name:name ->
  ?predictor_arn:arn ->
  unit ->
  predictor_summary

val make_predictor_event : ?datetime:timestamp -> ?detail:detail -> unit -> predictor_event

val make_monitor_data_source :
  ?predictor_arn:arn ->
  ?forecast_arn:arn ->
  ?dataset_import_job_arn:arn ->
  unit ->
  monitor_data_source

val make_predictor_monitor_evaluation :
  ?message:message ->
  ?num_items_evaluated:long ->
  ?metric_results:metric_results ->
  ?monitor_data_source:monitor_data_source ->
  ?predictor_event:predictor_event ->
  ?window_end_datetime:timestamp ->
  ?window_start_datetime:timestamp ->
  ?evaluation_state:evaluation_state ->
  ?evaluation_time:timestamp ->
  ?monitor_arn:arn ->
  ?resource_arn:arn ->
  unit ->
  predictor_monitor_evaluation

val make_predictor_execution :
  ?test_windows:test_window_details -> ?algorithm_arn:arn -> unit -> predictor_execution

val make_predictor_execution_details :
  ?predictor_executions:predictor_executions -> unit -> predictor_execution_details

val make_baseline_metric : ?value:double -> ?name:name -> unit -> baseline_metric
val make_predictor_baseline : ?baseline_metrics:baseline_metrics -> unit -> predictor_baseline

val make_predictor_backtest_export_job_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?destination:data_destination ->
  ?predictor_backtest_export_job_name:name ->
  ?predictor_backtest_export_job_arn:arn ->
  unit ->
  predictor_backtest_export_job_summary

val make_categorical_parameter_range :
  values:values -> name:name -> unit -> categorical_parameter_range

val make_continuous_parameter_range :
  ?scaling_type:scaling_type ->
  min_value:double ->
  max_value:double ->
  name:name ->
  unit ->
  continuous_parameter_range

val make_integer_parameter_range :
  ?scaling_type:scaling_type ->
  min_value:integer ->
  max_value:integer ->
  name:name ->
  unit ->
  integer_parameter_range

val make_parameter_ranges :
  ?integer_parameter_ranges:integer_parameter_ranges ->
  ?continuous_parameter_ranges:continuous_parameter_ranges ->
  ?categorical_parameter_ranges:categorical_parameter_ranges ->
  unit ->
  parameter_ranges

val make_monitor_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:status ->
  ?resource_arn:arn ->
  ?monitor_name:name ->
  ?monitor_arn:arn ->
  unit ->
  monitor_summary

val make_monitor_info : ?status:status -> ?monitor_arn:arn -> unit -> monitor_info
val make_monitor_config : monitor_name:name -> unit -> monitor_config

val make_list_what_if_forecasts_response :
  ?next_token:next_token ->
  ?what_if_forecasts:what_if_forecasts ->
  unit ->
  list_what_if_forecasts_response

val make_filter : condition:filter_condition_string -> value:arn -> key:string_ -> unit -> filter

val make_list_what_if_forecasts_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_what_if_forecasts_request

val make_list_what_if_forecast_exports_response :
  ?next_token:next_token ->
  ?what_if_forecast_exports:what_if_forecast_exports ->
  unit ->
  list_what_if_forecast_exports_response

val make_list_what_if_forecast_exports_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_what_if_forecast_exports_request

val make_list_what_if_analyses_response :
  ?next_token:next_token ->
  ?what_if_analyses:what_if_analyses ->
  unit ->
  list_what_if_analyses_response

val make_list_what_if_analyses_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_what_if_analyses_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_list_predictors_response :
  ?next_token:next_token -> ?predictors:predictors -> unit -> list_predictors_response

val make_list_predictors_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_predictors_request

val make_list_predictor_backtest_export_jobs_response :
  ?next_token:next_token ->
  ?predictor_backtest_export_jobs:predictor_backtest_export_jobs ->
  unit ->
  list_predictor_backtest_export_jobs_response

val make_list_predictor_backtest_export_jobs_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_predictor_backtest_export_jobs_request

val make_list_monitors_response :
  ?next_token:next_token -> ?monitors:monitors -> unit -> list_monitors_response

val make_list_monitors_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_monitors_request

val make_list_monitor_evaluations_response :
  ?predictor_monitor_evaluations:predictor_monitor_evaluations ->
  ?next_token:next_token ->
  unit ->
  list_monitor_evaluations_response

val make_list_monitor_evaluations_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  monitor_arn:arn ->
  unit ->
  list_monitor_evaluations_request

val make_forecast_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?dataset_group_arn:string_ ->
  ?created_using_auto_predictor:boolean_ ->
  ?predictor_arn:string_ ->
  ?forecast_name:name ->
  ?forecast_arn:arn ->
  unit ->
  forecast_summary

val make_list_forecasts_response :
  ?next_token:next_token -> ?forecasts:forecasts -> unit -> list_forecasts_response

val make_list_forecasts_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_forecasts_request

val make_forecast_export_job_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?destination:data_destination ->
  ?forecast_export_job_name:name ->
  ?forecast_export_job_arn:arn ->
  unit ->
  forecast_export_job_summary

val make_list_forecast_export_jobs_response :
  ?next_token:next_token ->
  ?forecast_export_jobs:forecast_export_jobs ->
  unit ->
  list_forecast_export_jobs_response

val make_list_forecast_export_jobs_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_forecast_export_jobs_request

val make_explainability_export_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?destination:data_destination ->
  ?explainability_export_name:name ->
  ?explainability_export_arn:arn ->
  unit ->
  explainability_export_summary

val make_list_explainability_exports_response :
  ?next_token:next_token ->
  ?explainability_exports:explainability_exports ->
  unit ->
  list_explainability_exports_response

val make_list_explainability_exports_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_explainability_exports_request

val make_explainability_config :
  time_point_granularity:time_point_granularity ->
  time_series_granularity:time_series_granularity ->
  unit ->
  explainability_config

val make_explainability_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:message ->
  ?status:status ->
  ?explainability_config:explainability_config ->
  ?resource_arn:arn ->
  ?explainability_name:name ->
  ?explainability_arn:arn ->
  unit ->
  explainability_summary

val make_list_explainabilities_response :
  ?next_token:next_token ->
  ?explainabilities:explainabilities ->
  unit ->
  list_explainabilities_response

val make_list_explainabilities_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_explainabilities_request

val make_dataset_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?domain:domain ->
  ?dataset_type:dataset_type ->
  ?dataset_name:name ->
  ?dataset_arn:arn ->
  unit ->
  dataset_summary

val make_list_datasets_response :
  ?next_token:next_token -> ?datasets:datasets -> unit -> list_datasets_response

val make_list_datasets_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_datasets_request

val make_dataset_import_job_summary :
  ?import_mode:import_mode ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:status ->
  ?data_source:data_source ->
  ?dataset_import_job_name:name ->
  ?dataset_import_job_arn:arn ->
  unit ->
  dataset_import_job_summary

val make_list_dataset_import_jobs_response :
  ?next_token:next_token ->
  ?dataset_import_jobs:dataset_import_jobs ->
  unit ->
  list_dataset_import_jobs_response

val make_list_dataset_import_jobs_request :
  ?filters:filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_dataset_import_jobs_request

val make_dataset_group_summary :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?dataset_group_name:name ->
  ?dataset_group_arn:arn ->
  unit ->
  dataset_group_summary

val make_list_dataset_groups_response :
  ?next_token:next_token -> ?dataset_groups:dataset_groups -> unit -> list_dataset_groups_response

val make_list_dataset_groups_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_dataset_groups_request

val make_input_data_config :
  ?supplementary_features:supplementary_features ->
  dataset_group_arn:arn ->
  unit ->
  input_data_config

val make_hyper_parameter_tuning_job_config :
  ?parameter_ranges:parameter_ranges -> unit -> hyper_parameter_tuning_job_config

val make_get_accuracy_metrics_response :
  ?optimization_metric:optimization_metric ->
  ?auto_ml_override_strategy:auto_ml_override_strategy ->
  ?is_auto_predictor:boolean_ ->
  ?predictor_evaluation_results:predictor_evaluation_results ->
  unit ->
  get_accuracy_metrics_response

val make_get_accuracy_metrics_request : predictor_arn:arn -> unit -> get_accuracy_metrics_request

val make_featurization_method :
  ?featurization_method_parameters:featurization_method_parameters ->
  featurization_method_name:featurization_method_name ->
  unit ->
  featurization_method

val make_featurization :
  ?featurization_pipeline:featurization_pipeline -> attribute_name:name -> unit -> featurization

val make_featurization_config :
  ?featurizations:featurizations ->
  ?forecast_dimensions:forecast_dimensions ->
  forecast_frequency:frequency ->
  unit ->
  featurization_config

val make_explainability_info :
  ?status:status -> ?explainability_arn:arn -> unit -> explainability_info

val make_evaluation_parameters :
  ?back_test_window_offset:integer ->
  ?number_of_backtest_windows:integer ->
  unit ->
  evaluation_parameters

val make_encryption_config : kms_key_arn:kms_key_arn -> role_arn:arn -> unit -> encryption_config

val make_describe_what_if_forecast_response :
  ?forecast_types:forecast_types ->
  ?time_series_replacements_data_source:time_series_replacements_data_source ->
  ?time_series_transformations:time_series_transformations ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:string_ ->
  ?estimated_time_remaining_in_minutes:long ->
  ?what_if_analysis_arn:arn ->
  ?what_if_forecast_arn:long_arn ->
  ?what_if_forecast_name:name ->
  unit ->
  describe_what_if_forecast_response

val make_describe_what_if_forecast_request :
  what_if_forecast_arn:long_arn -> unit -> describe_what_if_forecast_request

val make_describe_what_if_forecast_export_response :
  ?format:format ->
  ?last_modification_time:timestamp ->
  ?estimated_time_remaining_in_minutes:long ->
  ?creation_time:timestamp ->
  ?status:status ->
  ?message:message ->
  ?destination:data_destination ->
  ?what_if_forecast_arns:long_arn_list ->
  ?what_if_forecast_export_name:name ->
  ?what_if_forecast_export_arn:long_arn ->
  unit ->
  describe_what_if_forecast_export_response

val make_describe_what_if_forecast_export_request :
  what_if_forecast_export_arn:long_arn -> unit -> describe_what_if_forecast_export_request

val make_describe_what_if_analysis_response :
  ?time_series_selector:time_series_selector ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:string_ ->
  ?estimated_time_remaining_in_minutes:long ->
  ?forecast_arn:arn ->
  ?what_if_analysis_arn:arn ->
  ?what_if_analysis_name:name ->
  unit ->
  describe_what_if_analysis_response

val make_describe_what_if_analysis_request :
  what_if_analysis_arn:arn -> unit -> describe_what_if_analysis_request

val make_describe_predictor_response :
  ?optimization_metric:optimization_metric ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:message ->
  ?status:status ->
  ?dataset_import_job_arns:arn_list ->
  ?is_auto_predictor:boolean_ ->
  ?estimated_time_remaining_in_minutes:long ->
  ?predictor_execution_details:predictor_execution_details ->
  ?encryption_config:encryption_config ->
  ?featurization_config:featurization_config ->
  ?input_data_config:input_data_config ->
  ?hpo_config:hyper_parameter_tuning_job_config ->
  ?evaluation_parameters:evaluation_parameters ->
  ?training_parameters:training_parameters ->
  ?perform_hp_o:boolean_ ->
  ?auto_ml_override_strategy:auto_ml_override_strategy ->
  ?perform_auto_m_l:boolean_ ->
  ?forecast_types:forecast_types ->
  ?forecast_horizon:integer ->
  ?auto_ml_algorithm_arns:arn_list ->
  ?algorithm_arn:arn ->
  ?predictor_name:name ->
  ?predictor_arn:name ->
  unit ->
  describe_predictor_response

val make_describe_predictor_request : predictor_arn:arn -> unit -> describe_predictor_request

val make_describe_predictor_backtest_export_job_response :
  ?format:format ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:status ->
  ?message:message ->
  ?destination:data_destination ->
  ?predictor_arn:arn ->
  ?predictor_backtest_export_job_name:name ->
  ?predictor_backtest_export_job_arn:arn ->
  unit ->
  describe_predictor_backtest_export_job_response

val make_describe_predictor_backtest_export_job_request :
  predictor_backtest_export_job_arn:arn -> unit -> describe_predictor_backtest_export_job_request

val make_baseline : ?predictor_baseline:predictor_baseline -> unit -> baseline

val make_describe_monitor_response :
  ?estimated_evaluation_time_remaining_in_minutes:long ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:message ->
  ?baseline:baseline ->
  ?last_evaluation_state:evaluation_state ->
  ?last_evaluation_time:timestamp ->
  ?status:status ->
  ?resource_arn:arn ->
  ?monitor_arn:arn ->
  ?monitor_name:name ->
  unit ->
  describe_monitor_response

val make_describe_monitor_request : monitor_arn:arn -> unit -> describe_monitor_request

val make_describe_forecast_response :
  ?time_series_selector:time_series_selector ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:error_message ->
  ?status:string_ ->
  ?estimated_time_remaining_in_minutes:long ->
  ?dataset_group_arn:arn ->
  ?predictor_arn:arn ->
  ?forecast_types:forecast_types ->
  ?forecast_name:name ->
  ?forecast_arn:arn ->
  unit ->
  describe_forecast_response

val make_describe_forecast_request : forecast_arn:arn -> unit -> describe_forecast_request

val make_describe_forecast_export_job_response :
  ?format:format ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:status ->
  ?message:message ->
  ?destination:data_destination ->
  ?forecast_arn:arn ->
  ?forecast_export_job_name:name ->
  ?forecast_export_job_arn:arn ->
  unit ->
  describe_forecast_export_job_response

val make_describe_forecast_export_job_request :
  forecast_export_job_arn:arn -> unit -> describe_forecast_export_job_request

val make_describe_explainability_response :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:status ->
  ?message:message ->
  ?estimated_time_remaining_in_minutes:long ->
  ?end_date_time:local_date_time ->
  ?start_date_time:local_date_time ->
  ?schema:schema ->
  ?data_source:data_source ->
  ?enable_visualization:boolean_ ->
  ?explainability_config:explainability_config ->
  ?resource_arn:arn ->
  ?explainability_name:name ->
  ?explainability_arn:arn ->
  unit ->
  describe_explainability_response

val make_describe_explainability_request :
  explainability_arn:arn -> unit -> describe_explainability_request

val make_describe_explainability_export_response :
  ?format:format ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:status ->
  ?message:message ->
  ?destination:data_destination ->
  ?explainability_arn:arn ->
  ?explainability_export_name:name ->
  ?explainability_export_arn:arn ->
  unit ->
  describe_explainability_export_response

val make_describe_explainability_export_request :
  explainability_export_arn:arn -> unit -> describe_explainability_export_request

val make_describe_dataset_response :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:status ->
  ?encryption_config:encryption_config ->
  ?schema:schema ->
  ?data_frequency:frequency ->
  ?dataset_type:dataset_type ->
  ?domain:domain ->
  ?dataset_name:name ->
  ?dataset_arn:arn ->
  unit ->
  describe_dataset_response

val make_describe_dataset_request : dataset_arn:arn -> unit -> describe_dataset_request

val make_describe_dataset_import_job_response :
  ?import_mode:import_mode ->
  ?format:format ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:message ->
  ?status:status ->
  ?data_size:double ->
  ?field_statistics:field_statistics ->
  ?estimated_time_remaining_in_minutes:long ->
  ?data_source:data_source ->
  ?geolocation_format:geolocation_format ->
  ?use_geolocation_for_time_zone:use_geolocation_for_time_zone ->
  ?time_zone:time_zone ->
  ?timestamp_format:timestamp_format ->
  ?dataset_arn:arn ->
  ?dataset_import_job_arn:arn ->
  ?dataset_import_job_name:name ->
  unit ->
  describe_dataset_import_job_response

val make_describe_dataset_import_job_request :
  dataset_import_job_arn:arn -> unit -> describe_dataset_import_job_request

val make_describe_dataset_group_response :
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?status:status ->
  ?domain:domain ->
  ?dataset_arns:arn_list ->
  ?dataset_group_arn:arn ->
  ?dataset_group_name:name ->
  unit ->
  describe_dataset_group_response

val make_describe_dataset_group_request :
  dataset_group_arn:arn -> unit -> describe_dataset_group_request

val make_attribute_config :
  transformations:transformations -> attribute_name:name -> unit -> attribute_config

val make_additional_dataset :
  ?configuration:configuration -> name:name -> unit -> additional_dataset

val make_data_config :
  ?additional_datasets:additional_datasets ->
  ?attribute_configs:attribute_configs ->
  dataset_group_arn:arn ->
  unit ->
  data_config

val make_describe_auto_predictor_response :
  ?time_alignment_boundary:time_alignment_boundary ->
  ?monitor_info:monitor_info ->
  ?explainability_info:explainability_info ->
  ?optimization_metric:optimization_metric ->
  ?last_modification_time:timestamp ->
  ?creation_time:timestamp ->
  ?message:message ->
  ?status:status ->
  ?estimated_time_remaining_in_minutes:long ->
  ?reference_predictor_summary:reference_predictor_summary ->
  ?encryption_config:encryption_config ->
  ?data_config:data_config ->
  ?dataset_import_job_arns:arn_list ->
  ?forecast_dimensions:forecast_dimensions ->
  ?forecast_frequency:frequency ->
  ?forecast_types:forecast_types ->
  ?forecast_horizon:integer ->
  ?predictor_name:name ->
  ?predictor_arn:arn ->
  unit ->
  describe_auto_predictor_response

val make_describe_auto_predictor_request :
  predictor_arn:arn -> unit -> describe_auto_predictor_request

val make_delete_what_if_forecast_request :
  what_if_forecast_arn:long_arn -> unit -> delete_what_if_forecast_request

val make_delete_what_if_forecast_export_request :
  what_if_forecast_export_arn:long_arn -> unit -> delete_what_if_forecast_export_request

val make_delete_what_if_analysis_request :
  what_if_analysis_arn:arn -> unit -> delete_what_if_analysis_request

val make_delete_resource_tree_request : resource_arn:arn -> unit -> delete_resource_tree_request
val make_delete_predictor_request : predictor_arn:arn -> unit -> delete_predictor_request

val make_delete_predictor_backtest_export_job_request :
  predictor_backtest_export_job_arn:arn -> unit -> delete_predictor_backtest_export_job_request

val make_delete_monitor_request : monitor_arn:arn -> unit -> delete_monitor_request
val make_delete_forecast_request : forecast_arn:arn -> unit -> delete_forecast_request

val make_delete_forecast_export_job_request :
  forecast_export_job_arn:arn -> unit -> delete_forecast_export_job_request

val make_delete_explainability_request :
  explainability_arn:arn -> unit -> delete_explainability_request

val make_delete_explainability_export_request :
  explainability_export_arn:arn -> unit -> delete_explainability_export_request

val make_delete_dataset_request : dataset_arn:arn -> unit -> delete_dataset_request

val make_delete_dataset_import_job_request :
  dataset_import_job_arn:arn -> unit -> delete_dataset_import_job_request

val make_delete_dataset_group_request :
  dataset_group_arn:arn -> unit -> delete_dataset_group_request

val make_create_what_if_forecast_response :
  ?what_if_forecast_arn:long_arn -> unit -> create_what_if_forecast_response

val make_create_what_if_forecast_request :
  ?tags:tags ->
  ?time_series_replacements_data_source:time_series_replacements_data_source ->
  ?time_series_transformations:time_series_transformations ->
  what_if_analysis_arn:arn ->
  what_if_forecast_name:name ->
  unit ->
  create_what_if_forecast_request

val make_create_what_if_forecast_export_response :
  ?what_if_forecast_export_arn:long_arn -> unit -> create_what_if_forecast_export_response

val make_create_what_if_forecast_export_request :
  ?format:format ->
  ?tags:tags ->
  destination:data_destination ->
  what_if_forecast_arns:what_if_forecast_arn_list_for_export ->
  what_if_forecast_export_name:name ->
  unit ->
  create_what_if_forecast_export_request

val make_create_what_if_analysis_response :
  ?what_if_analysis_arn:arn -> unit -> create_what_if_analysis_response

val make_create_what_if_analysis_request :
  ?tags:tags ->
  ?time_series_selector:time_series_selector ->
  forecast_arn:arn ->
  what_if_analysis_name:name ->
  unit ->
  create_what_if_analysis_request

val make_create_predictor_response : ?predictor_arn:arn -> unit -> create_predictor_response

val make_create_predictor_request :
  ?optimization_metric:optimization_metric ->
  ?tags:tags ->
  ?encryption_config:encryption_config ->
  ?hpo_config:hyper_parameter_tuning_job_config ->
  ?evaluation_parameters:evaluation_parameters ->
  ?training_parameters:training_parameters ->
  ?perform_hp_o:boolean_ ->
  ?auto_ml_override_strategy:auto_ml_override_strategy ->
  ?perform_auto_m_l:boolean_ ->
  ?forecast_types:forecast_types ->
  ?algorithm_arn:arn ->
  featurization_config:featurization_config ->
  input_data_config:input_data_config ->
  forecast_horizon:integer ->
  predictor_name:name ->
  unit ->
  create_predictor_request

val make_create_predictor_backtest_export_job_response :
  ?predictor_backtest_export_job_arn:arn -> unit -> create_predictor_backtest_export_job_response

val make_create_predictor_backtest_export_job_request :
  ?format:format ->
  ?tags:tags ->
  destination:data_destination ->
  predictor_arn:arn ->
  predictor_backtest_export_job_name:name ->
  unit ->
  create_predictor_backtest_export_job_request

val make_create_monitor_response : ?monitor_arn:arn -> unit -> create_monitor_response

val make_create_monitor_request :
  ?tags:tags -> resource_arn:arn -> monitor_name:name -> unit -> create_monitor_request

val make_create_forecast_response : ?forecast_arn:arn -> unit -> create_forecast_response

val make_create_forecast_request :
  ?time_series_selector:time_series_selector ->
  ?tags:tags ->
  ?forecast_types:forecast_types ->
  predictor_arn:arn ->
  forecast_name:name ->
  unit ->
  create_forecast_request

val make_create_forecast_export_job_response :
  ?forecast_export_job_arn:arn -> unit -> create_forecast_export_job_response

val make_create_forecast_export_job_request :
  ?format:format ->
  ?tags:tags ->
  destination:data_destination ->
  forecast_arn:arn ->
  forecast_export_job_name:name ->
  unit ->
  create_forecast_export_job_request

val make_create_explainability_response :
  ?explainability_arn:arn -> unit -> create_explainability_response

val make_create_explainability_request :
  ?tags:tags ->
  ?end_date_time:local_date_time ->
  ?start_date_time:local_date_time ->
  ?enable_visualization:boolean_ ->
  ?schema:schema ->
  ?data_source:data_source ->
  explainability_config:explainability_config ->
  resource_arn:arn ->
  explainability_name:name ->
  unit ->
  create_explainability_request

val make_create_explainability_export_response :
  ?explainability_export_arn:arn -> unit -> create_explainability_export_response

val make_create_explainability_export_request :
  ?format:format ->
  ?tags:tags ->
  destination:data_destination ->
  explainability_arn:arn ->
  explainability_export_name:name ->
  unit ->
  create_explainability_export_request

val make_create_dataset_response : ?dataset_arn:arn -> unit -> create_dataset_response

val make_create_dataset_request :
  ?tags:tags ->
  ?encryption_config:encryption_config ->
  ?data_frequency:frequency ->
  schema:schema ->
  dataset_type:dataset_type ->
  domain:domain ->
  dataset_name:name ->
  unit ->
  create_dataset_request

val make_create_dataset_import_job_response :
  ?dataset_import_job_arn:arn -> unit -> create_dataset_import_job_response

val make_create_dataset_import_job_request :
  ?import_mode:import_mode ->
  ?format:format ->
  ?tags:tags ->
  ?geolocation_format:geolocation_format ->
  ?use_geolocation_for_time_zone:use_geolocation_for_time_zone ->
  ?time_zone:time_zone ->
  ?timestamp_format:timestamp_format ->
  data_source:data_source ->
  dataset_arn:arn ->
  dataset_import_job_name:name ->
  unit ->
  create_dataset_import_job_request

val make_create_dataset_group_response :
  ?dataset_group_arn:arn -> unit -> create_dataset_group_response

val make_create_dataset_group_request :
  ?tags:tags ->
  ?dataset_arns:arn_list ->
  domain:domain ->
  dataset_group_name:name ->
  unit ->
  create_dataset_group_request

val make_create_auto_predictor_response :
  ?predictor_arn:arn -> unit -> create_auto_predictor_response

val make_create_auto_predictor_request :
  ?time_alignment_boundary:time_alignment_boundary ->
  ?monitor_config:monitor_config ->
  ?tags:tags ->
  ?explain_predictor:boolean_ ->
  ?optimization_metric:optimization_metric ->
  ?reference_predictor_arn:arn ->
  ?encryption_config:encryption_config ->
  ?data_config:data_config ->
  ?forecast_frequency:frequency ->
  ?forecast_dimensions:forecast_dimensions ->
  ?forecast_types:forecast_types ->
  ?forecast_horizon:integer ->
  predictor_name:name ->
  unit ->
  create_auto_predictor_request
