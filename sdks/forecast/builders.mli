open Types

val make_action : attribute_name:name -> operation:operation -> value:double -> unit -> action

val make_additional_dataset :
  ?configuration:configuration -> name:name -> unit -> additional_dataset

val make_update_dataset_group_response : unit -> unit

val make_update_dataset_group_request :
  dataset_group_arn:arn -> dataset_arns:arn_list -> unit -> update_dataset_group_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag
val make_tag_resource_request : resource_arn:arn -> tags:tags -> unit -> tag_resource_request
val make_stop_resource_request : resource_arn:arn -> unit -> stop_resource_request
val make_resume_resource_request : resource_arn:arn -> unit -> resume_resource_request

val make_what_if_forecast_summary :
  ?what_if_forecast_arn:long_arn ->
  ?what_if_forecast_name:name ->
  ?what_if_analysis_arn:arn ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  what_if_forecast_summary

val make_list_what_if_forecasts_response :
  ?what_if_forecasts:what_if_forecasts ->
  ?next_token:next_token ->
  unit ->
  list_what_if_forecasts_response

val make_filter : key:string_ -> value:arn -> condition:filter_condition_string -> unit -> filter

val make_list_what_if_forecasts_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_what_if_forecasts_request

val make_s3_config : ?kms_key_arn:kms_key_arn -> path:s3_path -> role_arn:arn -> unit -> s3_config
val make_data_destination : s3_config:s3_config -> unit -> data_destination

val make_what_if_forecast_export_summary :
  ?what_if_forecast_export_arn:long_arn ->
  ?what_if_forecast_arns:what_if_forecast_arn_list_for_export ->
  ?what_if_forecast_export_name:name ->
  ?destination:data_destination ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  what_if_forecast_export_summary

val make_list_what_if_forecast_exports_response :
  ?what_if_forecast_exports:what_if_forecast_exports ->
  ?next_token:next_token ->
  unit ->
  list_what_if_forecast_exports_response

val make_list_what_if_forecast_exports_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_what_if_forecast_exports_request

val make_what_if_analysis_summary :
  ?what_if_analysis_arn:arn ->
  ?what_if_analysis_name:name ->
  ?forecast_arn:arn ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  what_if_analysis_summary

val make_list_what_if_analyses_response :
  ?what_if_analyses:what_if_analyses ->
  ?next_token:next_token ->
  unit ->
  list_what_if_analyses_response

val make_list_what_if_analyses_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_what_if_analyses_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_reference_predictor_summary :
  ?arn:arn -> ?state:state -> unit -> reference_predictor_summary

val make_predictor_summary :
  ?predictor_arn:arn ->
  ?predictor_name:name ->
  ?dataset_group_arn:arn ->
  ?is_auto_predictor:boolean_ ->
  ?reference_predictor_summary:reference_predictor_summary ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  predictor_summary

val make_list_predictors_response :
  ?predictors:predictors -> ?next_token:next_token -> unit -> list_predictors_response

val make_list_predictors_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_predictors_request

val make_predictor_backtest_export_job_summary :
  ?predictor_backtest_export_job_arn:arn ->
  ?predictor_backtest_export_job_name:name ->
  ?destination:data_destination ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  predictor_backtest_export_job_summary

val make_list_predictor_backtest_export_jobs_response :
  ?predictor_backtest_export_jobs:predictor_backtest_export_jobs ->
  ?next_token:next_token ->
  unit ->
  list_predictor_backtest_export_jobs_response

val make_list_predictor_backtest_export_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_predictor_backtest_export_jobs_request

val make_monitor_summary :
  ?monitor_arn:arn ->
  ?monitor_name:name ->
  ?resource_arn:arn ->
  ?status:status ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  monitor_summary

val make_list_monitors_response :
  ?monitors:monitors -> ?next_token:next_token -> unit -> list_monitors_response

val make_list_monitors_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_monitors_request

val make_monitor_data_source :
  ?dataset_import_job_arn:arn ->
  ?forecast_arn:arn ->
  ?predictor_arn:arn ->
  unit ->
  monitor_data_source

val make_predictor_event : ?detail:detail -> ?datetime:timestamp -> unit -> predictor_event

val make_predictor_monitor_evaluation :
  ?resource_arn:arn ->
  ?monitor_arn:arn ->
  ?evaluation_time:timestamp ->
  ?evaluation_state:evaluation_state ->
  ?window_start_datetime:timestamp ->
  ?window_end_datetime:timestamp ->
  ?predictor_event:predictor_event ->
  ?monitor_data_source:monitor_data_source ->
  ?metric_results:metric_results ->
  ?num_items_evaluated:long ->
  ?message:message ->
  unit ->
  predictor_monitor_evaluation

val make_list_monitor_evaluations_response :
  ?next_token:next_token ->
  ?predictor_monitor_evaluations:predictor_monitor_evaluations ->
  unit ->
  list_monitor_evaluations_response

val make_list_monitor_evaluations_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  monitor_arn:arn ->
  unit ->
  list_monitor_evaluations_request

val make_forecast_summary :
  ?forecast_arn:arn ->
  ?forecast_name:name ->
  ?predictor_arn:string_ ->
  ?created_using_auto_predictor:boolean_ ->
  ?dataset_group_arn:string_ ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  forecast_summary

val make_list_forecasts_response :
  ?forecasts:forecasts -> ?next_token:next_token -> unit -> list_forecasts_response

val make_list_forecasts_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_forecasts_request

val make_forecast_export_job_summary :
  ?forecast_export_job_arn:arn ->
  ?forecast_export_job_name:name ->
  ?destination:data_destination ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  forecast_export_job_summary

val make_list_forecast_export_jobs_response :
  ?forecast_export_jobs:forecast_export_jobs ->
  ?next_token:next_token ->
  unit ->
  list_forecast_export_jobs_response

val make_list_forecast_export_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_forecast_export_jobs_request

val make_explainability_export_summary :
  ?explainability_export_arn:arn ->
  ?explainability_export_name:name ->
  ?destination:data_destination ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  explainability_export_summary

val make_list_explainability_exports_response :
  ?explainability_exports:explainability_exports ->
  ?next_token:next_token ->
  unit ->
  list_explainability_exports_response

val make_list_explainability_exports_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_explainability_exports_request

val make_explainability_config :
  time_series_granularity:time_series_granularity ->
  time_point_granularity:time_point_granularity ->
  unit ->
  explainability_config

val make_explainability_summary :
  ?explainability_arn:arn ->
  ?explainability_name:name ->
  ?resource_arn:arn ->
  ?explainability_config:explainability_config ->
  ?status:status ->
  ?message:message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  explainability_summary

val make_list_explainabilities_response :
  ?explainabilities:explainabilities ->
  ?next_token:next_token ->
  unit ->
  list_explainabilities_response

val make_list_explainabilities_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_explainabilities_request

val make_dataset_summary :
  ?dataset_arn:arn ->
  ?dataset_name:name ->
  ?dataset_type:dataset_type ->
  ?domain:domain ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  dataset_summary

val make_list_datasets_response :
  ?datasets:datasets -> ?next_token:next_token -> unit -> list_datasets_response

val make_list_datasets_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_datasets_request

val make_data_source : s3_config:s3_config -> unit -> data_source

val make_dataset_import_job_summary :
  ?dataset_import_job_arn:arn ->
  ?dataset_import_job_name:name ->
  ?data_source:data_source ->
  ?status:status ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?import_mode:import_mode ->
  unit ->
  dataset_import_job_summary

val make_list_dataset_import_jobs_response :
  ?dataset_import_jobs:dataset_import_jobs ->
  ?next_token:next_token ->
  unit ->
  list_dataset_import_jobs_response

val make_list_dataset_import_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:filters ->
  unit ->
  list_dataset_import_jobs_request

val make_dataset_group_summary :
  ?dataset_group_arn:arn ->
  ?dataset_group_name:name ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  dataset_group_summary

val make_list_dataset_groups_response :
  ?dataset_groups:dataset_groups -> ?next_token:next_token -> unit -> list_dataset_groups_response

val make_list_dataset_groups_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_dataset_groups_request

val make_error_metric :
  ?forecast_type:forecast_type ->
  ?wap_e:double ->
  ?rms_e:double ->
  ?mas_e:double ->
  ?map_e:double ->
  unit ->
  error_metric

val make_weighted_quantile_loss :
  ?quantile:double -> ?loss_value:double -> unit -> weighted_quantile_loss

val make_metrics :
  ?rms_e:double ->
  ?weighted_quantile_losses:weighted_quantile_losses ->
  ?error_metrics:error_metrics ->
  ?average_weighted_quantile_loss:double ->
  unit ->
  metrics

val make_window_summary :
  ?test_window_start:timestamp ->
  ?test_window_end:timestamp ->
  ?item_count:integer ->
  ?evaluation_type:evaluation_type ->
  ?metrics:metrics ->
  unit ->
  window_summary

val make_get_accuracy_metrics_response :
  ?predictor_evaluation_results:predictor_evaluation_results ->
  ?is_auto_predictor:boolean_ ->
  ?auto_ml_override_strategy:auto_ml_override_strategy ->
  ?optimization_metric:optimization_metric ->
  unit ->
  get_accuracy_metrics_response

val make_get_accuracy_metrics_request : predictor_arn:arn -> unit -> get_accuracy_metrics_request

val make_describe_what_if_forecast_export_response :
  ?what_if_forecast_export_arn:long_arn ->
  ?what_if_forecast_export_name:name ->
  ?what_if_forecast_arns:long_arn_list ->
  ?destination:data_destination ->
  ?message:message ->
  ?status:status ->
  ?creation_time:timestamp ->
  ?estimated_time_remaining_in_minutes:long ->
  ?last_modification_time:timestamp ->
  ?format:format ->
  unit ->
  describe_what_if_forecast_export_response

val make_describe_what_if_forecast_export_request :
  what_if_forecast_export_arn:long_arn -> unit -> describe_what_if_forecast_export_request

val make_schema_attribute :
  ?attribute_name:name -> ?attribute_type:attribute_type -> unit -> schema_attribute

val make_schema : ?attributes:schema_attributes -> unit -> schema

val make_time_series_replacements_data_source :
  ?format:format ->
  ?timestamp_format:timestamp_format ->
  s3_config:s3_config ->
  schema:schema ->
  unit ->
  time_series_replacements_data_source

val make_time_series_condition :
  attribute_name:name ->
  attribute_value:attribute_value ->
  condition:condition ->
  unit ->
  time_series_condition

val make_time_series_transformation :
  ?action:action ->
  ?time_series_conditions:time_series_conditions ->
  unit ->
  time_series_transformation

val make_describe_what_if_forecast_response :
  ?what_if_forecast_name:name ->
  ?what_if_forecast_arn:long_arn ->
  ?what_if_analysis_arn:arn ->
  ?estimated_time_remaining_in_minutes:long ->
  ?status:string_ ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?time_series_transformations:time_series_transformations ->
  ?time_series_replacements_data_source:time_series_replacements_data_source ->
  ?forecast_types:forecast_types ->
  unit ->
  describe_what_if_forecast_response

val make_describe_what_if_forecast_request :
  what_if_forecast_arn:long_arn -> unit -> describe_what_if_forecast_request

val make_time_series_identifiers :
  ?data_source:data_source -> ?schema:schema -> ?format:format -> unit -> time_series_identifiers

val make_time_series_selector :
  ?time_series_identifiers:time_series_identifiers -> unit -> time_series_selector

val make_describe_what_if_analysis_response :
  ?what_if_analysis_name:name ->
  ?what_if_analysis_arn:arn ->
  ?forecast_arn:arn ->
  ?estimated_time_remaining_in_minutes:long ->
  ?status:string_ ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?time_series_selector:time_series_selector ->
  unit ->
  describe_what_if_analysis_response

val make_describe_what_if_analysis_request :
  what_if_analysis_arn:arn -> unit -> describe_what_if_analysis_request

val make_describe_predictor_backtest_export_job_response :
  ?predictor_backtest_export_job_arn:arn ->
  ?predictor_backtest_export_job_name:name ->
  ?predictor_arn:arn ->
  ?destination:data_destination ->
  ?message:message ->
  ?status:status ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?format:format ->
  unit ->
  describe_predictor_backtest_export_job_response

val make_describe_predictor_backtest_export_job_request :
  predictor_backtest_export_job_arn:arn -> unit -> describe_predictor_backtest_export_job_request

val make_test_window_summary :
  ?test_window_start:timestamp ->
  ?test_window_end:timestamp ->
  ?status:status ->
  ?message:error_message ->
  unit ->
  test_window_summary

val make_predictor_execution :
  ?algorithm_arn:arn -> ?test_windows:test_window_details -> unit -> predictor_execution

val make_predictor_execution_details :
  ?predictor_executions:predictor_executions -> unit -> predictor_execution_details

val make_encryption_config : role_arn:arn -> kms_key_arn:kms_key_arn -> unit -> encryption_config

val make_featurization_method :
  ?featurization_method_parameters:featurization_method_parameters ->
  featurization_method_name:featurization_method_name ->
  unit ->
  featurization_method

val make_featurization :
  ?featurization_pipeline:featurization_pipeline -> attribute_name:name -> unit -> featurization

val make_featurization_config :
  ?forecast_dimensions:forecast_dimensions ->
  ?featurizations:featurizations ->
  forecast_frequency:frequency ->
  unit ->
  featurization_config

val make_supplementary_feature : name:name -> value:value -> unit -> supplementary_feature

val make_input_data_config :
  ?supplementary_features:supplementary_features ->
  dataset_group_arn:arn ->
  unit ->
  input_data_config

val make_integer_parameter_range :
  ?scaling_type:scaling_type ->
  name:name ->
  max_value:integer ->
  min_value:integer ->
  unit ->
  integer_parameter_range

val make_continuous_parameter_range :
  ?scaling_type:scaling_type ->
  name:name ->
  max_value:double ->
  min_value:double ->
  unit ->
  continuous_parameter_range

val make_categorical_parameter_range :
  name:name -> values:values -> unit -> categorical_parameter_range

val make_parameter_ranges :
  ?categorical_parameter_ranges:categorical_parameter_ranges ->
  ?continuous_parameter_ranges:continuous_parameter_ranges ->
  ?integer_parameter_ranges:integer_parameter_ranges ->
  unit ->
  parameter_ranges

val make_hyper_parameter_tuning_job_config :
  ?parameter_ranges:parameter_ranges -> unit -> hyper_parameter_tuning_job_config

val make_evaluation_parameters :
  ?number_of_backtest_windows:integer ->
  ?back_test_window_offset:integer ->
  unit ->
  evaluation_parameters

val make_describe_predictor_response :
  ?predictor_arn:name ->
  ?predictor_name:name ->
  ?algorithm_arn:arn ->
  ?auto_ml_algorithm_arns:arn_list ->
  ?forecast_horizon:integer ->
  ?forecast_types:forecast_types ->
  ?perform_auto_m_l:boolean_ ->
  ?auto_ml_override_strategy:auto_ml_override_strategy ->
  ?perform_hp_o:boolean_ ->
  ?training_parameters:training_parameters ->
  ?evaluation_parameters:evaluation_parameters ->
  ?hpo_config:hyper_parameter_tuning_job_config ->
  ?input_data_config:input_data_config ->
  ?featurization_config:featurization_config ->
  ?encryption_config:encryption_config ->
  ?predictor_execution_details:predictor_execution_details ->
  ?estimated_time_remaining_in_minutes:long ->
  ?is_auto_predictor:boolean_ ->
  ?dataset_import_job_arns:arn_list ->
  ?status:status ->
  ?message:message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?optimization_metric:optimization_metric ->
  unit ->
  describe_predictor_response

val make_describe_predictor_request : predictor_arn:arn -> unit -> describe_predictor_request
val make_baseline_metric : ?name:name -> ?value:double -> unit -> baseline_metric
val make_predictor_baseline : ?baseline_metrics:baseline_metrics -> unit -> predictor_baseline
val make_baseline : ?predictor_baseline:predictor_baseline -> unit -> baseline

val make_describe_monitor_response :
  ?monitor_name:name ->
  ?monitor_arn:arn ->
  ?resource_arn:arn ->
  ?status:status ->
  ?last_evaluation_time:timestamp ->
  ?last_evaluation_state:evaluation_state ->
  ?baseline:baseline ->
  ?message:message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?estimated_evaluation_time_remaining_in_minutes:long ->
  unit ->
  describe_monitor_response

val make_describe_monitor_request : monitor_arn:arn -> unit -> describe_monitor_request

val make_describe_forecast_export_job_response :
  ?forecast_export_job_arn:arn ->
  ?forecast_export_job_name:name ->
  ?forecast_arn:arn ->
  ?destination:data_destination ->
  ?message:message ->
  ?status:status ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?format:format ->
  unit ->
  describe_forecast_export_job_response

val make_describe_forecast_export_job_request :
  forecast_export_job_arn:arn -> unit -> describe_forecast_export_job_request

val make_describe_forecast_response :
  ?forecast_arn:arn ->
  ?forecast_name:name ->
  ?forecast_types:forecast_types ->
  ?predictor_arn:arn ->
  ?dataset_group_arn:arn ->
  ?estimated_time_remaining_in_minutes:long ->
  ?status:string_ ->
  ?message:error_message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?time_series_selector:time_series_selector ->
  unit ->
  describe_forecast_response

val make_describe_forecast_request : forecast_arn:arn -> unit -> describe_forecast_request

val make_describe_explainability_export_response :
  ?explainability_export_arn:arn ->
  ?explainability_export_name:name ->
  ?explainability_arn:arn ->
  ?destination:data_destination ->
  ?message:message ->
  ?status:status ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?format:format ->
  unit ->
  describe_explainability_export_response

val make_describe_explainability_export_request :
  explainability_export_arn:arn -> unit -> describe_explainability_export_request

val make_describe_explainability_response :
  ?explainability_arn:arn ->
  ?explainability_name:name ->
  ?resource_arn:arn ->
  ?explainability_config:explainability_config ->
  ?enable_visualization:boolean_ ->
  ?data_source:data_source ->
  ?schema:schema ->
  ?start_date_time:local_date_time ->
  ?end_date_time:local_date_time ->
  ?estimated_time_remaining_in_minutes:long ->
  ?message:message ->
  ?status:status ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  describe_explainability_response

val make_describe_explainability_request :
  explainability_arn:arn -> unit -> describe_explainability_request

val make_statistics :
  ?count:integer ->
  ?count_distinct:integer ->
  ?count_null:integer ->
  ?count_nan:integer ->
  ?min:string_ ->
  ?max:string_ ->
  ?avg:double ->
  ?stddev:double ->
  ?count_long:long ->
  ?count_distinct_long:long ->
  ?count_null_long:long ->
  ?count_nan_long:long ->
  unit ->
  statistics

val make_describe_dataset_import_job_response :
  ?dataset_import_job_name:name ->
  ?dataset_import_job_arn:arn ->
  ?dataset_arn:arn ->
  ?timestamp_format:timestamp_format ->
  ?time_zone:time_zone ->
  ?use_geolocation_for_time_zone:use_geolocation_for_time_zone ->
  ?geolocation_format:geolocation_format ->
  ?data_source:data_source ->
  ?estimated_time_remaining_in_minutes:long ->
  ?field_statistics:field_statistics ->
  ?data_size:double ->
  ?status:status ->
  ?message:message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?format:format ->
  ?import_mode:import_mode ->
  unit ->
  describe_dataset_import_job_response

val make_describe_dataset_import_job_request :
  dataset_import_job_arn:arn -> unit -> describe_dataset_import_job_request

val make_describe_dataset_group_response :
  ?dataset_group_name:name ->
  ?dataset_group_arn:arn ->
  ?dataset_arns:arn_list ->
  ?domain:domain ->
  ?status:status ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  describe_dataset_group_response

val make_describe_dataset_group_request :
  dataset_group_arn:arn -> unit -> describe_dataset_group_request

val make_describe_dataset_response :
  ?dataset_arn:arn ->
  ?dataset_name:name ->
  ?domain:domain ->
  ?dataset_type:dataset_type ->
  ?data_frequency:frequency ->
  ?schema:schema ->
  ?encryption_config:encryption_config ->
  ?status:status ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  unit ->
  describe_dataset_response

val make_describe_dataset_request : dataset_arn:arn -> unit -> describe_dataset_request

val make_time_alignment_boundary :
  ?month:month ->
  ?day_of_month:day_of_month ->
  ?day_of_week:day_of_week ->
  ?hour:hour ->
  unit ->
  time_alignment_boundary

val make_monitor_info : ?monitor_arn:arn -> ?status:status -> unit -> monitor_info

val make_explainability_info :
  ?explainability_arn:arn -> ?status:status -> unit -> explainability_info

val make_attribute_config :
  attribute_name:name -> transformations:transformations -> unit -> attribute_config

val make_data_config :
  ?attribute_configs:attribute_configs ->
  ?additional_datasets:additional_datasets ->
  dataset_group_arn:arn ->
  unit ->
  data_config

val make_describe_auto_predictor_response :
  ?predictor_arn:arn ->
  ?predictor_name:name ->
  ?forecast_horizon:integer ->
  ?forecast_types:forecast_types ->
  ?forecast_frequency:frequency ->
  ?forecast_dimensions:forecast_dimensions ->
  ?dataset_import_job_arns:arn_list ->
  ?data_config:data_config ->
  ?encryption_config:encryption_config ->
  ?reference_predictor_summary:reference_predictor_summary ->
  ?estimated_time_remaining_in_minutes:long ->
  ?status:status ->
  ?message:message ->
  ?creation_time:timestamp ->
  ?last_modification_time:timestamp ->
  ?optimization_metric:optimization_metric ->
  ?explainability_info:explainability_info ->
  ?monitor_info:monitor_info ->
  ?time_alignment_boundary:time_alignment_boundary ->
  unit ->
  describe_auto_predictor_response

val make_describe_auto_predictor_request :
  predictor_arn:arn -> unit -> describe_auto_predictor_request

val make_delete_what_if_forecast_export_request :
  what_if_forecast_export_arn:long_arn -> unit -> delete_what_if_forecast_export_request

val make_delete_what_if_forecast_request :
  what_if_forecast_arn:long_arn -> unit -> delete_what_if_forecast_request

val make_delete_what_if_analysis_request :
  what_if_analysis_arn:arn -> unit -> delete_what_if_analysis_request

val make_delete_resource_tree_request : resource_arn:arn -> unit -> delete_resource_tree_request

val make_delete_predictor_backtest_export_job_request :
  predictor_backtest_export_job_arn:arn -> unit -> delete_predictor_backtest_export_job_request

val make_delete_predictor_request : predictor_arn:arn -> unit -> delete_predictor_request
val make_delete_monitor_request : monitor_arn:arn -> unit -> delete_monitor_request

val make_delete_forecast_export_job_request :
  forecast_export_job_arn:arn -> unit -> delete_forecast_export_job_request

val make_delete_forecast_request : forecast_arn:arn -> unit -> delete_forecast_request

val make_delete_explainability_export_request :
  explainability_export_arn:arn -> unit -> delete_explainability_export_request

val make_delete_explainability_request :
  explainability_arn:arn -> unit -> delete_explainability_request

val make_delete_dataset_import_job_request :
  dataset_import_job_arn:arn -> unit -> delete_dataset_import_job_request

val make_delete_dataset_group_request :
  dataset_group_arn:arn -> unit -> delete_dataset_group_request

val make_delete_dataset_request : dataset_arn:arn -> unit -> delete_dataset_request

val make_create_what_if_forecast_export_response :
  ?what_if_forecast_export_arn:long_arn -> unit -> create_what_if_forecast_export_response

val make_create_what_if_forecast_export_request :
  ?tags:tags ->
  ?format:format ->
  what_if_forecast_export_name:name ->
  what_if_forecast_arns:what_if_forecast_arn_list_for_export ->
  destination:data_destination ->
  unit ->
  create_what_if_forecast_export_request

val make_create_what_if_forecast_response :
  ?what_if_forecast_arn:long_arn -> unit -> create_what_if_forecast_response

val make_create_what_if_forecast_request :
  ?time_series_transformations:time_series_transformations ->
  ?time_series_replacements_data_source:time_series_replacements_data_source ->
  ?tags:tags ->
  what_if_forecast_name:name ->
  what_if_analysis_arn:arn ->
  unit ->
  create_what_if_forecast_request

val make_create_what_if_analysis_response :
  ?what_if_analysis_arn:arn -> unit -> create_what_if_analysis_response

val make_create_what_if_analysis_request :
  ?time_series_selector:time_series_selector ->
  ?tags:tags ->
  what_if_analysis_name:name ->
  forecast_arn:arn ->
  unit ->
  create_what_if_analysis_request

val make_create_predictor_backtest_export_job_response :
  ?predictor_backtest_export_job_arn:arn -> unit -> create_predictor_backtest_export_job_response

val make_create_predictor_backtest_export_job_request :
  ?tags:tags ->
  ?format:format ->
  predictor_backtest_export_job_name:name ->
  predictor_arn:arn ->
  destination:data_destination ->
  unit ->
  create_predictor_backtest_export_job_request

val make_create_predictor_response : ?predictor_arn:arn -> unit -> create_predictor_response

val make_create_predictor_request :
  ?algorithm_arn:arn ->
  ?forecast_types:forecast_types ->
  ?perform_auto_m_l:boolean_ ->
  ?auto_ml_override_strategy:auto_ml_override_strategy ->
  ?perform_hp_o:boolean_ ->
  ?training_parameters:training_parameters ->
  ?evaluation_parameters:evaluation_parameters ->
  ?hpo_config:hyper_parameter_tuning_job_config ->
  ?encryption_config:encryption_config ->
  ?tags:tags ->
  ?optimization_metric:optimization_metric ->
  predictor_name:name ->
  forecast_horizon:integer ->
  input_data_config:input_data_config ->
  featurization_config:featurization_config ->
  unit ->
  create_predictor_request

val make_create_monitor_response : ?monitor_arn:arn -> unit -> create_monitor_response

val make_create_monitor_request :
  ?tags:tags -> monitor_name:name -> resource_arn:arn -> unit -> create_monitor_request

val make_create_forecast_export_job_response :
  ?forecast_export_job_arn:arn -> unit -> create_forecast_export_job_response

val make_create_forecast_export_job_request :
  ?tags:tags ->
  ?format:format ->
  forecast_export_job_name:name ->
  forecast_arn:arn ->
  destination:data_destination ->
  unit ->
  create_forecast_export_job_request

val make_create_forecast_response : ?forecast_arn:arn -> unit -> create_forecast_response

val make_create_forecast_request :
  ?forecast_types:forecast_types ->
  ?tags:tags ->
  ?time_series_selector:time_series_selector ->
  forecast_name:name ->
  predictor_arn:arn ->
  unit ->
  create_forecast_request

val make_create_explainability_export_response :
  ?explainability_export_arn:arn -> unit -> create_explainability_export_response

val make_create_explainability_export_request :
  ?tags:tags ->
  ?format:format ->
  explainability_export_name:name ->
  explainability_arn:arn ->
  destination:data_destination ->
  unit ->
  create_explainability_export_request

val make_create_explainability_response :
  ?explainability_arn:arn -> unit -> create_explainability_response

val make_create_explainability_request :
  ?data_source:data_source ->
  ?schema:schema ->
  ?enable_visualization:boolean_ ->
  ?start_date_time:local_date_time ->
  ?end_date_time:local_date_time ->
  ?tags:tags ->
  explainability_name:name ->
  resource_arn:arn ->
  explainability_config:explainability_config ->
  unit ->
  create_explainability_request

val make_create_dataset_import_job_response :
  ?dataset_import_job_arn:arn -> unit -> create_dataset_import_job_response

val make_create_dataset_import_job_request :
  ?timestamp_format:timestamp_format ->
  ?time_zone:time_zone ->
  ?use_geolocation_for_time_zone:use_geolocation_for_time_zone ->
  ?geolocation_format:geolocation_format ->
  ?tags:tags ->
  ?format:format ->
  ?import_mode:import_mode ->
  dataset_import_job_name:name ->
  dataset_arn:arn ->
  data_source:data_source ->
  unit ->
  create_dataset_import_job_request

val make_create_dataset_group_response :
  ?dataset_group_arn:arn -> unit -> create_dataset_group_response

val make_create_dataset_group_request :
  ?dataset_arns:arn_list ->
  ?tags:tags ->
  dataset_group_name:name ->
  domain:domain ->
  unit ->
  create_dataset_group_request

val make_create_dataset_response : ?dataset_arn:arn -> unit -> create_dataset_response

val make_create_dataset_request :
  ?data_frequency:frequency ->
  ?encryption_config:encryption_config ->
  ?tags:tags ->
  dataset_name:name ->
  domain:domain ->
  dataset_type:dataset_type ->
  schema:schema ->
  unit ->
  create_dataset_request

val make_create_auto_predictor_response :
  ?predictor_arn:arn -> unit -> create_auto_predictor_response

val make_monitor_config : monitor_name:name -> unit -> monitor_config

val make_create_auto_predictor_request :
  ?forecast_horizon:integer ->
  ?forecast_types:forecast_types ->
  ?forecast_dimensions:forecast_dimensions ->
  ?forecast_frequency:frequency ->
  ?data_config:data_config ->
  ?encryption_config:encryption_config ->
  ?reference_predictor_arn:arn ->
  ?optimization_metric:optimization_metric ->
  ?explain_predictor:boolean_ ->
  ?tags:tags ->
  ?monitor_config:monitor_config ->
  ?time_alignment_boundary:time_alignment_boundary ->
  predictor_name:name ->
  unit ->
  create_auto_predictor_request
