(** forecast client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module CreateAutoPredictor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_auto_predictor_request ->
    ( create_auto_predictor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_auto_predictor_request ->
    ( create_auto_predictor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Forecast predictor.\n\n\
  \ Amazon Forecast creates predictors with AutoPredictor, which involves applying the optimal \
   combination of algorithms to each time series in your datasets. You can use \
   [CreateAutoPredictor] to create new predictors or upgrade/retrain existing predictors.\n\
  \ \n\
  \   {b Creating new predictors} \n\
  \  \n\
  \   The following parameters are required when creating a new predictor:\n\
  \   \n\
  \    {ul\n\
  \          {-   [PredictorName] - A unique name for the predictor.\n\
  \              \n\
  \               }\n\
  \          {-   [DatasetGroupArn] - The ARN of the dataset group used to train the predictor.\n\
  \              \n\
  \               }\n\
  \          {-   [ForecastFrequency] - The granularity of your forecasts (hourly, daily, weekly, \
   etc).\n\
  \              \n\
  \               }\n\
  \          {-   [ForecastHorizon] - The number of time-steps that the model predicts. The \
   forecast horizon is also called the prediction length.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   When creating a new predictor, do not specify a value for [ReferencePredictorArn].\n\
  \   \n\
  \     {b Upgrading and retraining predictors} \n\
  \    \n\
  \     The following parameters are required when retraining or upgrading a predictor:\n\
  \     \n\
  \      {ul\n\
  \            {-   [PredictorName] - A unique name for the predictor.\n\
  \                \n\
  \                 }\n\
  \            {-   [ReferencePredictorArn] - The ARN of the predictor to retrain or upgrade.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   When upgrading or retraining a predictor, only specify values for the \
   [ReferencePredictorArn] and [PredictorName]. \n\
  \   "]

module CreateDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Forecast dataset. The information about the dataset that you provide helps \
   Forecast understand how to consume the data for model training. This includes the following:\n\n\
  \ {ul\n\
  \       {-   {i  [DataFrequency] } - How frequently your historical time-series data is collected.\n\
  \           \n\
  \            }\n\
  \       {-   {i  [Domain] } and {i  [DatasetType] } - Each dataset has an associated dataset \
   domain and a type within the domain. Amazon Forecast provides a list of predefined domains and \
   types within each domain. For each unique dataset domain and type within the domain, Amazon \
   Forecast requires your data to include a minimum set of predefined fields.\n\
  \           \n\
  \            }\n\
  \       {-   {i  [Schema] } - A schema specifies the fields in the dataset, including the field \
   name and data type.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   After creating a dataset, you import your training data into it and add the dataset to a \
   dataset group. You use the dataset group to create a predictor. For more information, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/howitworks-datasets-groups.html}Importing \
   datasets}.\n\
  \   \n\
  \    To get a list of all your datasets, use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasets.html}ListDatasets} operation.\n\
  \    \n\
  \     For example Forecast datasets, see the \
   {{:https://github.com/aws-samples/amazon-forecast-samples}Amazon Forecast Sample GitHub \
   repository}.\n\
  \     \n\
  \       The [Status] of a dataset must be [ACTIVE] before you can import training data. Use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDataset.html}DescribeDataset} \
   operation to get the status.\n\
  \       \n\
  \        "]

module CreateDatasetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_group_request ->
    ( create_dataset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_group_request ->
    ( create_dataset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a dataset group, which holds a collection of related datasets. You can add datasets to \
   the dataset group when you create the dataset group, or later by using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html}UpdateDatasetGroup} \
   operation.\n\n\
  \ After creating a dataset group and adding datasets, you use the dataset group when you create \
   a predictor. For more information, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/howitworks-datasets-groups.html}Dataset \
   groups}.\n\
  \ \n\
  \  To get a list of all your datasets groups, use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasetGroups.html}ListDatasetGroups} \
   operation.\n\
  \  \n\
  \    The [Status] of a dataset group must be [ACTIVE] before you can use the dataset group to \
   create a predictor. To get the status, use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup} \
   operation.\n\
  \    \n\
  \     "]

module CreateDatasetImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_import_job_request ->
    ( create_dataset_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_import_job_request ->
    ( create_dataset_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Imports your training data to an Amazon Forecast dataset. You provide the location of your \
   training data in an Amazon Simple Storage Service (Amazon S3) bucket and the Amazon Resource \
   Name (ARN) of the dataset that you want to import the data to.\n\n\
  \ You must specify a \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DataSource.html}DataSource} object that \
   includes an Identity and Access Management (IAM) role that Amazon Forecast can assume to access \
   the data, as Amazon Forecast makes a copy of your data and processes it in an internal Amazon \
   Web Services system. For more information, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/aws-forecast-iam-roles.html}Set up \
   permissions}.\n\
  \ \n\
  \  The training data must be in CSV or Parquet format. The delimiter must be a comma (,).\n\
  \  \n\
  \   You can specify the path to a specific file, the S3 bucket, or to a folder in the S3 bucket. \
   For the latter two cases, Amazon Forecast imports all files up to the limit of 10,000 files.\n\
  \   \n\
  \    Because dataset imports are not aggregated, your most recent dataset import is the one that \
   is used when training a predictor or generating a forecast. Make sure that your most recent \
   dataset import contains all of the data you want to model off of, and not just the new data \
   collected since the previous import.\n\
  \    \n\
  \     To get a list of all your dataset import jobs, filtered by specified criteria, use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_ListDatasetImportJobs.html}ListDatasetImportJobs} \
   operation.\n\
  \     "]

module CreateExplainability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_explainability_request ->
    ( create_explainability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_explainability_request ->
    ( create_explainability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Explainability is only available for Forecasts and Predictors generated from an AutoPredictor \
   ([CreateAutoPredictor])\n\
  \ \n\
  \   Creates an Amazon Forecast Explainability.\n\
  \   \n\
  \    Explainability helps you better understand how the attributes in your datasets impact \
   forecast. Amazon Forecast uses a metric called Impact scores to quantify the relative impact of \
   each attribute and determine whether they increase or decrease forecast values.\n\
  \    \n\
  \     To enable Forecast Explainability, your predictor must include at least one of the \
   following: related time series, item metadata, or additional datasets like Holidays and the \
   Weather Index.\n\
  \     \n\
  \      CreateExplainability accepts either a Predictor ARN or Forecast ARN. To receive \
   aggregated Impact scores for all time series and time points in your datasets, provide a \
   Predictor ARN. To receive Impact scores for specific time series and time points, provide a \
   Forecast ARN.\n\
  \      \n\
  \        {b CreateExplainability with a Predictor ARN} \n\
  \       \n\
  \         You can only have one Explainability resource per predictor. If you already enabled \
   [ExplainPredictor] in [CreateAutoPredictor], that predictor already has an Explainability \
   resource.\n\
  \         \n\
  \           The following parameters are required when providing a Predictor ARN:\n\
  \           \n\
  \            {ul\n\
  \                  {-   [ExplainabilityName] - A unique name for the Explainability.\n\
  \                      \n\
  \                       }\n\
  \                  {-   [ResourceArn] - The Arn of the predictor.\n\
  \                      \n\
  \                       }\n\
  \                  {-   [TimePointGranularity] - Must be set to \226\128\156ALL\226\128\157.\n\
  \                      \n\
  \                       }\n\
  \                  {-   [TimeSeriesGranularity] - Must be set to \226\128\156ALL\226\128\157.\n\
  \                      \n\
  \                       }\n\
  \                  }\n\
  \   Do not specify a value for the following parameters:\n\
  \   \n\
  \    {ul\n\
  \          {-   [DataSource] - Only valid when TimeSeriesGranularity is \
   \226\128\156SPECIFIC\226\128\157.\n\
  \              \n\
  \               }\n\
  \          {-   [Schema] - Only valid when TimeSeriesGranularity is \
   \226\128\156SPECIFIC\226\128\157.\n\
  \              \n\
  \               }\n\
  \          {-   [StartDateTime] - Only valid when TimePointGranularity is \
   \226\128\156SPECIFIC\226\128\157.\n\
  \              \n\
  \               }\n\
  \          {-   [EndDateTime] - Only valid when TimePointGranularity is \
   \226\128\156SPECIFIC\226\128\157.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    {b CreateExplainability with a Forecast ARN} \n\
  \   \n\
  \     You can specify a maximum of 50 time series and 500 time points.\n\
  \     \n\
  \       The following parameters are required when providing a Predictor ARN:\n\
  \       \n\
  \        {ul\n\
  \              {-   [ExplainabilityName] - A unique name for the Explainability.\n\
  \                  \n\
  \                   }\n\
  \              {-   [ResourceArn] - The Arn of the forecast.\n\
  \                  \n\
  \                   }\n\
  \              {-   [TimePointGranularity] - Either \226\128\156ALL\226\128\157 or \
   \226\128\156SPECIFIC\226\128\157.\n\
  \                  \n\
  \                   }\n\
  \              {-   [TimeSeriesGranularity] - Either \226\128\156ALL\226\128\157 or \
   \226\128\156SPECIFIC\226\128\157.\n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \   If you set TimeSeriesGranularity to \226\128\156SPECIFIC\226\128\157, you must also provide \
   the following:\n\
  \   \n\
  \    {ul\n\
  \          {-   [DataSource] - The S3 location of the CSV file specifying your time series.\n\
  \              \n\
  \               }\n\
  \          {-   [Schema] - The Schema defines the attributes and attribute types listed in the \
   Data Source.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   If you set TimePointGranularity to \226\128\156SPECIFIC\226\128\157, you must also provide \
   the following:\n\
  \   \n\
  \    {ul\n\
  \          {-   [StartDateTime] - The first timestamp in the range of time points.\n\
  \              \n\
  \               }\n\
  \          {-   [EndDateTime] - The last timestamp in the range of time points.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateExplainabilityExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_explainability_export_request ->
    ( create_explainability_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_explainability_export_request ->
    ( create_explainability_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports an Explainability resource created by the [CreateExplainability] operation. Exported \
   files are exported to an Amazon Simple Storage Service (Amazon S3) bucket.\n\n\
  \ You must specify a [DataDestination] object that includes an Amazon S3 bucket and an Identity \
   and Access Management (IAM) role that Amazon Forecast can assume to access the Amazon S3 \
   bucket. For more information, see [aws-forecast-iam-roles].\n\
  \ \n\
  \   The [Status] of the export job must be [ACTIVE] before you can access the export in your \
   Amazon S3 bucket. To get the status, use the [DescribeExplainabilityExport] operation.\n\
  \   \n\
  \    "]

module CreateForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_forecast_request ->
    ( create_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_forecast_request ->
    ( create_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a forecast for each item in the [TARGET_TIME_SERIES] dataset that was used to train the \
   predictor. This is known as inference. To retrieve the forecast for a single item at low \
   latency, use the operation. To export the complete forecast into your Amazon Simple Storage \
   Service (Amazon S3) bucket, use the [CreateForecastExportJob] operation.\n\n\
  \ The range of the forecast is determined by the [ForecastHorizon] value, which you specify in \
   the [CreatePredictor] request. When you query a forecast, you can request a specific date range \
   within the forecast.\n\
  \ \n\
  \  To get a list of all your forecasts, use the [ListForecasts] operation.\n\
  \  \n\
  \    The forecasts generated by Amazon Forecast are in the same time zone as the dataset that \
   was used to create the predictor.\n\
  \    \n\
  \      For more information, see [howitworks-forecast].\n\
  \      \n\
  \        The [Status] of the forecast must be [ACTIVE] before you can query or export the \
   forecast. Use the [DescribeForecast] operation to get the status.\n\
  \        \n\
  \          By default, a forecast includes predictions for every item ([item_id]) in the dataset \
   group that was used to train the predictor. However, you can use the [TimeSeriesSelector] \
   object to generate a forecast on a subset of time series. Forecast creation is skipped for any \
   time series that you specify that are not in the input dataset. The forecast export file will \
   not contain these time series or their forecasted values.\n\
  \          "]

module CreateForecastExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_forecast_export_job_request ->
    ( create_forecast_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_forecast_export_job_request ->
    ( create_forecast_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports a forecast created by the [CreateForecast] operation to your Amazon Simple Storage \
   Service (Amazon S3) bucket. The forecast file name will match the following conventions:\n\n\
  \ __\n\
  \ \n\
  \  where the  component is in Java SimpleDateFormat (yyyy-MM-ddTHH-mm-ssZ).\n\
  \  \n\
  \   You must specify a [DataDestination] object that includes an Identity and Access Management \
   (IAM) role that Amazon Forecast can assume to access the Amazon S3 bucket. For more \
   information, see [aws-forecast-iam-roles].\n\
  \   \n\
  \    For more information, see [howitworks-forecast].\n\
  \    \n\
  \     To get a list of all your forecast export jobs, use the [ListForecastExportJobs] operation.\n\
  \     \n\
  \       The [Status] of the forecast export job must be [ACTIVE] before you can access the \
   forecast in your Amazon S3 bucket. To get the status, use the [DescribeForecastExportJob] \
   operation.\n\
  \       \n\
  \        "]

module CreateMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_monitor_request ->
    ( create_monitor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_monitor_request ->
    ( create_monitor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a predictor monitor resource for an existing auto predictor. Predictor monitoring \
   allows you to see how your predictor's performance changes over time. For more information, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring.html}Predictor \
   Monitoring}. \n"]

module CreatePredictor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_predictor_request ->
    ( create_predictor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_predictor_request ->
    ( create_predictor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  This operation creates a legacy predictor that does not include all the predictor \
   functionalities provided by Amazon Forecast. To create a predictor that is compatible with all \
   aspects of Forecast, use [CreateAutoPredictor].\n\
  \ \n\
  \   Creates an Amazon Forecast predictor.\n\
  \   \n\
  \    In the request, provide a dataset group and either specify an algorithm or let Amazon \
   Forecast choose an algorithm for you using AutoML. If you specify an algorithm, you also can \
   override algorithm-specific hyperparameters.\n\
  \    \n\
  \     Amazon Forecast uses the algorithm to train a predictor using the latest version of the \
   datasets in the specified dataset group. You can then generate a forecast using the \
   [CreateForecast] operation.\n\
  \     \n\
  \       To see the evaluation metrics, use the [GetAccuracyMetrics] operation. \n\
  \      \n\
  \       You can specify a featurization configuration to fill and aggregate the data fields in \
   the [TARGET_TIME_SERIES] dataset to improve model training. For more information, see \
   [FeaturizationConfig].\n\
  \       \n\
  \        For RELATED_TIME_SERIES datasets, [CreatePredictor] verifies that the [DataFrequency] \
   specified when the dataset was created matches the [ForecastFrequency]. TARGET_TIME_SERIES \
   datasets don't have this restriction. Amazon Forecast also verifies the delimiter and timestamp \
   format. For more information, see [howitworks-datasets-groups].\n\
  \        \n\
  \         By default, predictors are trained and evaluated at the 0.1 (P10), 0.5 (P50), and 0.9 \
   (P90) quantiles. You can choose custom forecast types to train and evaluate your predictor by \
   setting the [ForecastTypes]. \n\
  \         \n\
  \           {b AutoML} \n\
  \          \n\
  \           If you want Amazon Forecast to evaluate each algorithm and choose the one that \
   minimizes the [objective function], set [PerformAutoML] to [true]. The [objective function] is \
   defined as the mean of the weighted losses over the forecast types. By default, these are the \
   p10, p50, and p90 quantile losses. For more information, see [EvaluationResult].\n\
  \           \n\
  \            When AutoML is enabled, the following properties are disallowed:\n\
  \            \n\
  \             {ul\n\
  \                   {-   [AlgorithmArn] \n\
  \                       \n\
  \                        }\n\
  \                   {-   [HPOConfig] \n\
  \                       \n\
  \                        }\n\
  \                   {-   [PerformHPO] \n\
  \                       \n\
  \                        }\n\
  \                   {-   [TrainingParameters] \n\
  \                       \n\
  \                        }\n\
  \                   }\n\
  \   To get a list of all of your predictors, use the [ListPredictors] operation.\n\
  \   \n\
  \     Before you can use the predictor to create a forecast, the [Status] of the predictor must \
   be [ACTIVE], signifying that training has completed. To get the status, use the \
   [DescribePredictor] operation.\n\
  \     \n\
  \      "]

module CreatePredictorBacktestExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_predictor_backtest_export_job_request ->
    ( create_predictor_backtest_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_predictor_backtest_export_job_request ->
    ( create_predictor_backtest_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports backtest forecasts and accuracy metrics generated by the [CreateAutoPredictor] or \
   [CreatePredictor] operations. Two folders containing CSV or Parquet files are exported to your \
   specified S3 bucket.\n\n\
  \  The export file names will match the following conventions:\n\
  \ \n\
  \   \n\
  \  {[\n\
  \  __.csv\n\
  \  ]}\n\
  \   \n\
  \  \n\
  \   The  component is in Java SimpleDate format (yyyy-MM-ddTHH-mm-ssZ).\n\
  \   \n\
  \    You must specify a [DataDestination] object that includes an Amazon S3 bucket and an \
   Identity and Access Management (IAM) role that Amazon Forecast can assume to access the Amazon \
   S3 bucket. For more information, see [aws-forecast-iam-roles].\n\
  \    \n\
  \      The [Status] of the export job must be [ACTIVE] before you can access the export in your \
   Amazon S3 bucket. To get the status, use the [DescribePredictorBacktestExportJob] operation.\n\
  \      \n\
  \       "]

module CreateWhatIfAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_what_if_analysis_request ->
    ( create_what_if_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_what_if_analysis_request ->
    ( create_what_if_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "What-if analysis is a scenario modeling technique where you make a hypothetical change to a \
   time series and compare the forecasts generated by these changes against the baseline, \
   unchanged time series. It is important to remember that the purpose of a what-if analysis is to \
   understand how a forecast can change given different modifications to the baseline time \
   series.\n\n\
  \ For example, imagine you are a clothing retailer who is considering an end of season sale to \
   clear space for new styles. After creating a baseline forecast, you can use a what-if analysis \
   to investigate how different sales tactics might affect your goals.\n\
  \ \n\
  \  You could create a scenario where everything is given a 25% markdown, and another where \
   everything is given a fixed dollar markdown. You could create a scenario where the sale lasts \
   for one week and another where the sale lasts for one month. With a what-if analysis, you can \
   compare many different scenarios against each other.\n\
  \  \n\
  \   Note that a what-if analysis is meant to display what the forecasting model has learned and \
   how it will behave in the scenarios that you are evaluating. Do not blindly use the results of \
   the what-if analysis to make business decisions. For instance, forecasts might not be accurate \
   for novel scenarios where there is no reference available to determine whether a forecast is \
   good.\n\
  \   \n\
  \    The [TimeSeriesSelector] object defines the items that you want in the what-if analysis.\n\
  \    "]

module CreateWhatIfForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_what_if_forecast_request ->
    ( create_what_if_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_what_if_forecast_request ->
    ( create_what_if_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A what-if forecast is a forecast that is created from a modified version of the baseline \
   forecast. Each what-if forecast incorporates either a replacement dataset or a set of \
   transformations to the original dataset. \n"]

module CreateWhatIfForecastExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_what_if_forecast_export_request ->
    ( create_what_if_forecast_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_what_if_forecast_export_request ->
    ( create_what_if_forecast_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Exports a forecast created by the [CreateWhatIfForecast] operation to your Amazon Simple \
   Storage Service (Amazon S3) bucket. The forecast file name will match the following \
   conventions:\n\n\
  \  \n\
  \ {[\n\
  \ \226\137\136__\n\
  \ ]}\n\
  \  \n\
  \ \n\
  \  The  component is in Java SimpleDateFormat (yyyy-MM-ddTHH-mm-ssZ).\n\
  \  \n\
  \   You must specify a [DataDestination] object that includes an Identity and Access Management \
   (IAM) role that Amazon Forecast can assume to access the Amazon S3 bucket. For more \
   information, see [aws-forecast-iam-roles].\n\
  \   \n\
  \    For more information, see [howitworks-forecast].\n\
  \    \n\
  \     To get a list of all your what-if forecast export jobs, use the \
   [ListWhatIfForecastExports] operation.\n\
  \     \n\
  \       The [Status] of the forecast export job must be [ACTIVE] before you can access the \
   forecast in your Amazon S3 bucket. To get the status, use the [DescribeWhatIfForecastExport] \
   operation.\n\
  \       \n\
  \        "]

module DeleteDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon Forecast dataset that was created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html}CreateDataset} \
   operation. You can only delete datasets that have a status of [ACTIVE] or [CREATE_FAILED]. To \
   get the status use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDataset.html}DescribeDataset} \
   operation.\n\n\
  \  Forecast does not automatically update any dataset groups that contain the deleted dataset. \
   In order to update the dataset group, use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_UpdateDatasetGroup.html}UpdateDatasetGroup} \
   operation, omitting the deleted dataset's ARN.\n\
  \  \n\
  \   "]

module DeleteDatasetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_group_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a dataset group created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup} \
   operation. You can only delete dataset groups that have a status of [ACTIVE], [CREATE_FAILED], \
   or [UPDATE_FAILED]. To get the status, use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup} \
   operation.\n\n\
  \ This operation deletes only the dataset group, not the datasets in the group.\n\
  \ "]

module DeleteDatasetImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_import_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_dataset_import_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a dataset import job created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
   operation. You can delete only dataset import jobs that have a status of [ACTIVE] or \
   [CREATE_FAILED]. To get the status, use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetImportJob.html}DescribeDatasetImportJob} \
   operation.\n"]

module DeleteExplainability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_explainability_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_explainability_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Explainability resource.\n\n\
  \ You can delete only predictor that have a status of [ACTIVE] or [CREATE_FAILED]. To get the \
   status, use the [DescribeExplainability] operation.\n\
  \ "]

module DeleteExplainabilityExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_explainability_export_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_explainability_export_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Explainability export.\n"]

module DeleteForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_forecast_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_forecast_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a forecast created using the [CreateForecast] operation. You can delete only forecasts \
   that have a status of [ACTIVE] or [CREATE_FAILED]. To get the status, use the \
   [DescribeForecast] operation.\n\n\
  \ You can't delete a forecast while it is being exported. After a forecast is deleted, you can \
   no longer query the forecast.\n\
  \ "]

module DeleteForecastExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_forecast_export_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_forecast_export_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a forecast export job created using the [CreateForecastExportJob] operation. You can \
   delete only export jobs that have a status of [ACTIVE] or [CREATE_FAILED]. To get the status, \
   use the [DescribeForecastExportJob] operation.\n"]

module DeleteMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_monitor_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_monitor_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a monitor resource. You can only delete a monitor resource with a status of [ACTIVE], \
   [ACTIVE_STOPPED], [CREATE_FAILED], or [CREATE_STOPPED].\n"]

module DeletePredictor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_predictor_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_predictor_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a predictor created using the [DescribePredictor] or [CreatePredictor] operations. You \
   can delete only predictor that have a status of [ACTIVE] or [CREATE_FAILED]. To get the status, \
   use the [DescribePredictor] operation.\n"]

module DeletePredictorBacktestExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_predictor_backtest_export_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_predictor_backtest_export_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a predictor backtest export job.\n"]

module DeleteResourceTree : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_tree_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_tree_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an entire resource tree. This operation will delete the parent resource and its child \
   resources.\n\n\
  \ Child resources are resources that were created from another resource. For example, when a \
   forecast is generated from a predictor, the forecast is the child resource and the predictor is \
   the parent resource.\n\
  \ \n\
  \  Amazon Forecast resources possess the following parent-child resource hierarchies:\n\
  \  \n\
  \   {ul\n\
  \         {-   {b Dataset}: dataset import jobs\n\
  \             \n\
  \              }\n\
  \         {-   {b Dataset Group}: predictors, predictor backtest export jobs, forecasts, \
   forecast export jobs\n\
  \             \n\
  \              }\n\
  \         {-   {b Predictor}: predictor backtest export jobs, forecasts, forecast export jobs\n\
  \             \n\
  \              }\n\
  \         {-   {b Forecast}: forecast export jobs\n\
  \             \n\
  \              }\n\
  \         }\n\
  \     [DeleteResourceTree] will only delete Amazon Forecast resources, and will not delete \
   datasets or exported files stored in Amazon S3. \n\
  \    \n\
  \     "]

module DeleteWhatIfAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_what_if_analysis_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_what_if_analysis_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a what-if analysis created using the [CreateWhatIfAnalysis] operation. You can delete \
   only what-if analyses that have a status of [ACTIVE] or [CREATE_FAILED]. To get the status, use \
   the [DescribeWhatIfAnalysis] operation. \n\n\
  \ You can't delete a what-if analysis while any of its forecasts are being exported.\n\
  \ "]

module DeleteWhatIfForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_what_if_forecast_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_what_if_forecast_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a what-if forecast created using the [CreateWhatIfForecast] operation. You can delete \
   only what-if forecasts that have a status of [ACTIVE] or [CREATE_FAILED]. To get the status, \
   use the [DescribeWhatIfForecast] operation. \n\n\
  \ You can't delete a what-if forecast while it is being exported. After a what-if forecast is \
   deleted, you can no longer query the what-if analysis.\n\
  \ "]

module DeleteWhatIfForecastExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_what_if_forecast_export_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_what_if_forecast_export_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a what-if forecast export created using the [CreateWhatIfForecastExport] operation. You \
   can delete only what-if forecast exports that have a status of [ACTIVE] or [CREATE_FAILED]. To \
   get the status, use the [DescribeWhatIfForecastExport] operation. \n"]

module DescribeAutoPredictor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_predictor_request ->
    ( describe_auto_predictor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_auto_predictor_request ->
    ( describe_auto_predictor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a predictor created using the CreateAutoPredictor operation.\n"]

module DescribeDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_request ->
    ( describe_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes an Amazon Forecast dataset created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html}CreateDataset} \
   operation.\n\n\
  \ In addition to listing the parameters specified in the [CreateDataset] request, this operation \
   includes the following dataset properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeDatasetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_group_request ->
    ( describe_dataset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_group_request ->
    ( describe_dataset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a dataset group created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup} \
   operation.\n\n\
  \ In addition to listing the parameters provided in the [CreateDatasetGroup] request, this \
   operation includes the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [DatasetArns] - The datasets belonging to the group.\n\
  \            \n\
  \             }\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeDatasetImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_import_job_request ->
    ( describe_dataset_import_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_import_job_request ->
    ( describe_dataset_import_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a dataset import job created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
   operation.\n\n\
  \ In addition to listing the parameters provided in the [CreateDatasetImportJob] request, this \
   operation includes the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [DataSize] \n\
  \            \n\
  \             }\n\
  \        {-   [FieldStatistics] \n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [Message] - If an error occurred, information about the error.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeExplainability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_explainability_request ->
    ( describe_explainability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_explainability_request ->
    ( describe_explainability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes an Explainability resource created using the [CreateExplainability] operation.\n"]

module DescribeExplainabilityExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_explainability_export_request ->
    ( describe_explainability_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_explainability_export_request ->
    ( describe_explainability_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes an Explainability export created using the [CreateExplainabilityExport] operation.\n"]

module DescribeForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_forecast_request ->
    ( describe_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_forecast_request ->
    ( describe_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a forecast created using the [CreateForecast] operation.\n\n\
  \ In addition to listing the properties provided in the [CreateForecast] request, this operation \
   lists the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [DatasetGroupArn] - The dataset group that provided the training data.\n\
  \            \n\
  \             }\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [Message] - If an error occurred, information about the error.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeForecastExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_forecast_export_job_request ->
    ( describe_forecast_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_forecast_export_job_request ->
    ( describe_forecast_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a forecast export job created using the [CreateForecastExportJob] operation.\n\n\
  \ In addition to listing the properties provided by the user in the [CreateForecastExportJob] \
   request, this operation lists the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [Message] - If an error occurred, information about the error.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeMonitor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_monitor_request ->
    ( describe_monitor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_monitor_request ->
    ( describe_monitor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a monitor resource. In addition to listing the properties provided in the \
   [CreateMonitor] request, this operation lists the following properties:\n\n\
  \ {ul\n\
  \       {-   [Baseline] \n\
  \           \n\
  \            }\n\
  \       {-   [CreationTime] \n\
  \           \n\
  \            }\n\
  \       {-   [LastEvaluationTime] \n\
  \           \n\
  \            }\n\
  \       {-   [LastEvaluationState] \n\
  \           \n\
  \            }\n\
  \       {-   [LastModificationTime] \n\
  \           \n\
  \            }\n\
  \       {-   [Message] \n\
  \           \n\
  \            }\n\
  \       {-   [Status] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DescribePredictor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_predictor_request ->
    ( describe_predictor_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_predictor_request ->
    ( describe_predictor_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  This operation is only valid for legacy predictors created with CreatePredictor. If you are \
   not using a legacy predictor, use [DescribeAutoPredictor].\n\
  \ \n\
  \   Describes a predictor created using the [CreatePredictor] operation.\n\
  \   \n\
  \    In addition to listing the properties provided in the [CreatePredictor] request, this \
   operation lists the following properties:\n\
  \    \n\
  \     {ul\n\
  \           {-   [DatasetImportJobArns] - The dataset import jobs used to import training data.\n\
  \               \n\
  \                }\n\
  \           {-   [AutoMLAlgorithmArns] - If AutoML is performed, the algorithms that were \
   evaluated.\n\
  \               \n\
  \                }\n\
  \           {-   [CreationTime] \n\
  \               \n\
  \                }\n\
  \           {-   [LastModificationTime] \n\
  \               \n\
  \                }\n\
  \           {-   [Status] \n\
  \               \n\
  \                }\n\
  \           {-   [Message] - If an error occurred, information about the error.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module DescribePredictorBacktestExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_predictor_backtest_export_job_request ->
    ( describe_predictor_backtest_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_predictor_backtest_export_job_request ->
    ( describe_predictor_backtest_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a predictor backtest export job created using the [CreatePredictorBacktestExportJob] \
   operation.\n\n\
  \ In addition to listing the properties provided by the user in the \
   [CreatePredictorBacktestExportJob] request, this operation lists the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        {-   [Message] (if an error occurred)\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeWhatIfAnalysis : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_what_if_analysis_request ->
    ( describe_what_if_analysis_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_what_if_analysis_request ->
    ( describe_what_if_analysis_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the what-if analysis created using the [CreateWhatIfAnalysis] operation.\n\n\
  \ In addition to listing the properties provided in the [CreateWhatIfAnalysis] request, this \
   operation lists the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [Message] - If an error occurred, information about the error.\n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeWhatIfForecast : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_what_if_forecast_request ->
    ( describe_what_if_forecast_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_what_if_forecast_request ->
    ( describe_what_if_forecast_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the what-if forecast created using the [CreateWhatIfForecast] operation.\n\n\
  \ In addition to listing the properties provided in the [CreateWhatIfForecast] request, this \
   operation lists the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [Message] - If an error occurred, information about the error.\n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module DescribeWhatIfForecastExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_what_if_forecast_export_request ->
    ( describe_what_if_forecast_export_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_what_if_forecast_export_request ->
    ( describe_what_if_forecast_export_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the what-if forecast export created using the [CreateWhatIfForecastExport] operation.\n\n\
  \ In addition to listing the properties provided in the [CreateWhatIfForecastExport] request, \
   this operation lists the following properties:\n\
  \ \n\
  \  {ul\n\
  \        {-   [CreationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [LastModificationTime] \n\
  \            \n\
  \             }\n\
  \        {-   [Message] - If an error occurred, information about the error.\n\
  \            \n\
  \             }\n\
  \        {-   [Status] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module GetAccuracyMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_accuracy_metrics_request ->
    ( get_accuracy_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_accuracy_metrics_request ->
    ( get_accuracy_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides metrics on the accuracy of the models that were trained by the [CreatePredictor] \
   operation. Use metrics to see how well the model performed and to decide whether to use the \
   predictor to generate a forecast. For more information, see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/metrics.html}Predictor Metrics}.\n\n\
  \ This operation generates metrics for each backtest window that was evaluated. The number of \
   backtest windows ([NumberOfBacktestWindows]) is specified using the [EvaluationParameters] \
   object, which is optionally included in the [CreatePredictor] request. If \
   [NumberOfBacktestWindows] isn't specified, the number defaults to one.\n\
  \ \n\
  \  The parameters of the [filling] method determine which items contribute to the metrics. If \
   you want all items to contribute, specify [zero]. If you want only those items that have \
   complete data in the range being evaluated to contribute, specify [nan]. For more information, \
   see [FeaturizationMethod].\n\
  \  \n\
  \    Before you can get accuracy metrics, the [Status] of the predictor must be [ACTIVE], \
   signifying that training has completed. To get the status, use the [DescribePredictor] \
   operation.\n\
  \    \n\
  \     "]

module ListDatasetGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_groups_request ->
    ( list_dataset_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_groups_request ->
    ( list_dataset_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of dataset groups created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup} \
   operation. For each dataset group, this operation returns a summary of its properties, \
   including its Amazon Resource Name (ARN). You can retrieve the complete set of properties by \
   using the dataset group ARN with the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup} \
   operation.\n"]

module ListDatasetImportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_import_jobs_request ->
    ( list_dataset_import_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_import_jobs_request ->
    ( list_dataset_import_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of dataset import jobs created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
   operation. For each import job, this operation returns a summary of its properties, including \
   its Amazon Resource Name (ARN). You can retrieve the complete set of properties by using the \
   ARN with the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetImportJob.html}DescribeDatasetImportJob} \
   operation. You can filter the list by providing an array of \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_Filter.html}Filter} objects.\n"]

module ListDatasets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of datasets created using the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_CreateDataset.html}CreateDataset} \
   operation. For each dataset, a summary of its properties, including its Amazon Resource Name \
   (ARN), is returned. To retrieve the complete set of properties, use the ARN with the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDataset.html}DescribeDataset} \
   operation.\n"]

module ListExplainabilities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_explainabilities_request ->
    ( list_explainabilities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_explainabilities_request ->
    ( list_explainabilities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of Explainability resources created using the [CreateExplainability] operation. \
   This operation returns a summary for each Explainability. You can filter the list using an \
   array of [Filter] objects.\n\n\
  \ To retrieve the complete set of properties for a particular Explainability resource, use the \
   ARN with the [DescribeExplainability] operation.\n\
  \ "]

module ListExplainabilityExports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_explainability_exports_request ->
    ( list_explainability_exports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_explainability_exports_request ->
    ( list_explainability_exports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of Explainability exports created using the [CreateExplainabilityExport] \
   operation. This operation returns a summary for each Explainability export. You can filter the \
   list using an array of [Filter] objects.\n\n\
  \ To retrieve the complete set of properties for a particular Explainability export, use the ARN \
   with the [DescribeExplainability] operation.\n\
  \ "]

module ListForecastExportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_forecast_export_jobs_request ->
    ( list_forecast_export_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_forecast_export_jobs_request ->
    ( list_forecast_export_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of forecast export jobs created using the [CreateForecastExportJob] operation. \
   For each forecast export job, this operation returns a summary of its properties, including its \
   Amazon Resource Name (ARN). To retrieve the complete set of properties, use the ARN with the \
   [DescribeForecastExportJob] operation. You can filter the list using an array of [Filter] \
   objects.\n"]

module ListForecasts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_forecasts_request ->
    ( list_forecasts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_forecasts_request ->
    ( list_forecasts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of forecasts created using the [CreateForecast] operation. For each forecast, \
   this operation returns a summary of its properties, including its Amazon Resource Name (ARN). \
   To retrieve the complete set of properties, specify the ARN with the [DescribeForecast] \
   operation. You can filter the list using an array of [Filter] objects.\n"]

module ListMonitorEvaluations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_monitor_evaluations_request ->
    ( list_monitor_evaluations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_monitor_evaluations_request ->
    ( list_monitor_evaluations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the monitoring evaluation results and predictor events collected by the \
   monitor resource during different windows of time.\n\n\
  \ For information about monitoring see [predictor-monitoring]. For more information about \
   retrieving monitoring results see \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/predictor-monitoring-results.html}Viewing \
   Monitoring Results}.\n\
  \ "]

module ListMonitors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_monitors_request ->
    ( list_monitors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_monitors_request ->
    ( list_monitors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of monitors created with the [CreateMonitor] operation and [CreateAutoPredictor] \
   operation. For each monitor resource, this operation returns of a summary of its properties, \
   including its Amazon Resource Name (ARN). You can retrieve a complete set of properties of a \
   monitor resource by specify the monitor's ARN in the [DescribeMonitor] operation.\n"]

module ListPredictorBacktestExportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_predictor_backtest_export_jobs_request ->
    ( list_predictor_backtest_export_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_predictor_backtest_export_jobs_request ->
    ( list_predictor_backtest_export_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of predictor backtest export jobs created using the \
   [CreatePredictorBacktestExportJob] operation. This operation returns a summary for each \
   backtest export job. You can filter the list using an array of [Filter] objects.\n\n\
  \ To retrieve the complete set of properties for a particular backtest export job, use the ARN \
   with the [DescribePredictorBacktestExportJob] operation.\n\
  \ "]

module ListPredictors : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_predictors_request ->
    ( list_predictors_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_predictors_request ->
    ( list_predictors_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of predictors created using the [CreateAutoPredictor] or [CreatePredictor] \
   operations. For each predictor, this operation returns a summary of its properties, including \
   its Amazon Resource Name (ARN). \n\n\
  \ You can retrieve the complete set of properties by using the ARN with the \
   [DescribeAutoPredictor] and [DescribePredictor] operations. You can filter the list using an \
   array of [Filter] objects.\n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the tags for an Amazon Forecast resource.\n"]

module ListWhatIfAnalyses : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_what_if_analyses_request ->
    ( list_what_if_analyses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_what_if_analyses_request ->
    ( list_what_if_analyses_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of what-if analyses created using the [CreateWhatIfAnalysis] operation. For each \
   what-if analysis, this operation returns a summary of its properties, including its Amazon \
   Resource Name (ARN). You can retrieve the complete set of properties by using the what-if \
   analysis ARN with the [DescribeWhatIfAnalysis] operation.\n"]

module ListWhatIfForecastExports : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_what_if_forecast_exports_request ->
    ( list_what_if_forecast_exports_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_what_if_forecast_exports_request ->
    ( list_what_if_forecast_exports_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of what-if forecast exports created using the [CreateWhatIfForecastExport] \
   operation. For each what-if forecast export, this operation returns a summary of its \
   properties, including its Amazon Resource Name (ARN). You can retrieve the complete set of \
   properties by using the what-if forecast export ARN with the [DescribeWhatIfForecastExport] \
   operation.\n"]

module ListWhatIfForecasts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_what_if_forecasts_request ->
    ( list_what_if_forecasts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_what_if_forecasts_request ->
    ( list_what_if_forecasts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of what-if forecasts created using the [CreateWhatIfForecast] operation. For \
   each what-if forecast, this operation returns a summary of its properties, including its Amazon \
   Resource Name (ARN). You can retrieve the complete set of properties by using the what-if \
   forecast ARN with the [DescribeWhatIfForecast] operation.\n"]

module ResumeResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resume_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resume_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Resumes a stopped monitor resource.\n"]

module StopResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a resource.\n\n\
  \ The resource undergoes the following states: [CREATE_STOPPING] and [CREATE_STOPPED]. You \
   cannot resume a resource once it has been stopped.\n\
  \ \n\
  \  This operation can be applied to the following resources (and their corresponding child \
   resources):\n\
  \  \n\
  \   {ul\n\
  \         {-  Dataset Import Job\n\
  \             \n\
  \              }\n\
  \         {-  Predictor Job\n\
  \             \n\
  \              }\n\
  \         {-  Forecast Job\n\
  \             \n\
  \              }\n\
  \         {-  Forecast Export Job\n\
  \             \n\
  \              }\n\
  \         {-  Predictor Backtest Export Job\n\
  \             \n\
  \              }\n\
  \         {-  Explainability Job\n\
  \             \n\
  \              }\n\
  \         {-  Explainability Export Job\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified tags to a resource with the specified [resourceArn]. If existing tags \
   on a resource are not specified in the request parameters, they are not changed. When a \
   resource is deleted, the tags associated with that resource are also deleted.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified tags from a resource.\n"]

(** {1:Serialization and Deserialization} *)
module UpdateDatasetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_dataset_group_request ->
    ( update_dataset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_dataset_group_request ->
    ( update_dataset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the datasets in a dataset group with the specified datasets.\n\n\
  \  The [Status] of the dataset group must be [ACTIVE] before you can use the dataset group to \
   create a predictor. Use the \
   {{:https://docs.aws.amazon.com/forecast/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup} \
   operation to get the status.\n\
  \  \n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
