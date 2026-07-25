open Types

val make_default_categorical_hyper_parameter_range :
  ?name:parameter_name ->
  ?values:categorical_values ->
  ?is_tunable:tunable ->
  unit ->
  default_categorical_hyper_parameter_range

val make_default_continuous_hyper_parameter_range :
  ?name:parameter_name ->
  ?min_value:continuous_min_value ->
  ?max_value:continuous_max_value ->
  ?is_tunable:tunable ->
  unit ->
  default_continuous_hyper_parameter_range

val make_default_integer_hyper_parameter_range :
  ?name:parameter_name ->
  ?min_value:integer_min_value ->
  ?max_value:integer_max_value ->
  ?is_tunable:tunable ->
  unit ->
  default_integer_hyper_parameter_range

val make_default_hyper_parameter_ranges :
  ?integer_hyper_parameter_ranges:default_integer_hyper_parameter_ranges ->
  ?continuous_hyper_parameter_ranges:default_continuous_hyper_parameter_ranges ->
  ?categorical_hyper_parameter_ranges:default_categorical_hyper_parameter_ranges ->
  unit ->
  default_hyper_parameter_ranges

val make_algorithm_image : ?name:name -> docker_ur_i:docker_ur_i -> unit -> algorithm_image

val make_algorithm :
  ?name:name ->
  ?algorithm_arn:arn ->
  ?algorithm_image:algorithm_image ->
  ?default_hyper_parameters:hyper_parameters ->
  ?default_hyper_parameter_ranges:default_hyper_parameter_ranges ->
  ?default_resource_config:resource_config ->
  ?training_input_mode:training_input_mode ->
  ?role_arn:arn ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  algorithm

val make_update_solution_response : ?solution_arn:arn -> unit -> update_solution_response

val make_event_parameters :
  ?event_type:event_type ->
  ?event_value_threshold:event_type_threshold_value ->
  ?weight:event_type_weight ->
  unit ->
  event_parameters

val make_events_config : ?event_parameters_list:event_parameters_list -> unit -> events_config

val make_auto_training_config :
  ?scheduling_expression:scheduling_expression -> unit -> auto_training_config

val make_solution_update_config :
  ?auto_training_config:auto_training_config ->
  ?events_config:events_config ->
  unit ->
  solution_update_config

val make_update_solution_request :
  ?perform_auto_training:perform_auto_training ->
  ?perform_incremental_update:perform_incremental_update ->
  ?solution_update_config:solution_update_config ->
  solution_arn:arn ->
  unit ->
  update_solution_request

val make_update_recommender_response : ?recommender_arn:arn -> unit -> update_recommender_response

val make_training_data_config :
  ?excluded_dataset_columns:excluded_dataset_columns ->
  ?included_dataset_columns:included_dataset_columns ->
  unit ->
  training_data_config

val make_recommender_config :
  ?item_exploration_config:hyper_parameters ->
  ?min_recommendation_requests_per_second:transactions_per_second ->
  ?training_data_config:training_data_config ->
  ?enable_metadata_with_recommendations:boolean_ ->
  unit ->
  recommender_config

val make_update_recommender_request :
  recommender_arn:arn -> recommender_config:recommender_config -> unit -> update_recommender_request

val make_update_metric_attribution_response :
  ?metric_attribution_arn:arn -> unit -> update_metric_attribution_response

val make_s3_data_config : ?kms_key_arn:kms_key_arn -> path:s3_location -> unit -> s3_data_config

val make_metric_attribution_output :
  ?s3_data_destination:s3_data_config -> role_arn:role_arn -> unit -> metric_attribution_output

val make_metric_attribute :
  event_type:event_type ->
  metric_name:metric_name ->
  expression:metric_expression ->
  unit ->
  metric_attribute

val make_update_metric_attribution_request :
  ?add_metrics:metric_attributes ->
  ?remove_metrics:metric_attributes_names_list ->
  ?metrics_output_config:metric_attribution_output ->
  ?metric_attribution_arn:arn ->
  unit ->
  update_metric_attribution_request

val make_update_dataset_response : ?dataset_arn:arn -> unit -> update_dataset_response

val make_update_dataset_request :
  dataset_arn:arn -> schema_arn:arn -> unit -> update_dataset_request

val make_update_campaign_response : ?campaign_arn:arn -> unit -> update_campaign_response

val make_campaign_config :
  ?item_exploration_config:hyper_parameters ->
  ?enable_metadata_with_recommendations:boolean_ ->
  ?sync_with_latest_solution_version:boolean_ ->
  ?ranking_influence:ranking_influence ->
  unit ->
  campaign_config

val make_update_campaign_request :
  ?solution_version_arn:arn ->
  ?min_provisioned_tp_s:transactions_per_second ->
  ?campaign_config:campaign_config ->
  campaign_arn:arn ->
  unit ->
  update_campaign_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:arn -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : tag_key:tag_key -> tag_value:tag_value -> unit -> tag
val make_tag_resource_request : resource_arn:arn -> tags:tags -> unit -> tag_resource_request

val make_stop_solution_version_creation_request :
  solution_version_arn:arn -> unit -> stop_solution_version_creation_request

val make_stop_recommender_response : ?recommender_arn:arn -> unit -> stop_recommender_response
val make_stop_recommender_request : recommender_arn:arn -> unit -> stop_recommender_request
val make_start_recommender_response : ?recommender_arn:arn -> unit -> start_recommender_response
val make_start_recommender_request : recommender_arn:arn -> unit -> start_recommender_request
val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_solution_version_summary :
  ?solution_version_arn:arn ->
  ?status:status ->
  ?training_mode:training_mode ->
  ?training_type:training_type ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  solution_version_summary

val make_list_solution_versions_response :
  ?solution_versions:solution_versions ->
  ?next_token:next_token ->
  unit ->
  list_solution_versions_response

val make_list_solution_versions_request :
  ?solution_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_solution_versions_request

val make_solution_summary :
  ?name:name ->
  ?solution_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?recipe_arn:arn ->
  unit ->
  solution_summary

val make_list_solutions_response :
  ?solutions:solutions -> ?next_token:next_token -> unit -> list_solutions_response

val make_list_solutions_request :
  ?dataset_group_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_solutions_request

val make_dataset_schema_summary :
  ?name:name ->
  ?schema_arn:arn ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?domain:domain ->
  unit ->
  dataset_schema_summary

val make_list_schemas_response :
  ?schemas:schemas -> ?next_token:next_token -> unit -> list_schemas_response

val make_list_schemas_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_schemas_request

val make_recommender_summary :
  ?name:name ->
  ?recommender_arn:arn ->
  ?dataset_group_arn:arn ->
  ?recipe_arn:arn ->
  ?recommender_config:recommender_config ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  recommender_summary

val make_list_recommenders_response :
  ?recommenders:recommenders -> ?next_token:next_token -> unit -> list_recommenders_response

val make_list_recommenders_request :
  ?dataset_group_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_recommenders_request

val make_recipe_summary :
  ?name:name ->
  ?recipe_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?domain:domain ->
  unit ->
  recipe_summary

val make_list_recipes_response :
  ?recipes:recipes -> ?next_token:next_token -> unit -> list_recipes_response

val make_list_recipes_request :
  ?recipe_provider:recipe_provider ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?domain:domain ->
  unit ->
  list_recipes_request

val make_metric_attribution_summary :
  ?name:name ->
  ?metric_attribution_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  metric_attribution_summary

val make_list_metric_attributions_response :
  ?metric_attributions:metric_attributions ->
  ?next_token:next_token ->
  unit ->
  list_metric_attributions_response

val make_list_metric_attributions_request :
  ?dataset_group_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_metric_attributions_request

val make_list_metric_attribution_metrics_response :
  ?metrics:metric_attributes ->
  ?next_token:next_token ->
  unit ->
  list_metric_attribution_metrics_response

val make_list_metric_attribution_metrics_request :
  ?metric_attribution_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_metric_attribution_metrics_request

val make_filter_summary :
  ?name:name ->
  ?filter_arn:arn ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?dataset_group_arn:arn ->
  ?failure_reason:failure_reason ->
  ?status:status ->
  unit ->
  filter_summary

val make_list_filters_response :
  ?filters:filters -> ?next_token:next_token -> unit -> list_filters_response

val make_list_filters_request :
  ?dataset_group_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_filters_request

val make_event_tracker_summary :
  ?name:name ->
  ?event_tracker_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  event_tracker_summary

val make_list_event_trackers_response :
  ?event_trackers:event_trackers -> ?next_token:next_token -> unit -> list_event_trackers_response

val make_list_event_trackers_request :
  ?dataset_group_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_event_trackers_request

val make_dataset_summary :
  ?name:name ->
  ?dataset_arn:arn ->
  ?dataset_type:dataset_type ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  dataset_summary

val make_list_datasets_response :
  ?datasets:datasets -> ?next_token:next_token -> unit -> list_datasets_response

val make_list_datasets_request :
  ?dataset_group_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_datasets_request

val make_dataset_import_job_summary :
  ?dataset_import_job_arn:arn ->
  ?job_name:name ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  ?import_mode:import_mode ->
  unit ->
  dataset_import_job_summary

val make_list_dataset_import_jobs_response :
  ?dataset_import_jobs:dataset_import_jobs ->
  ?next_token:next_token ->
  unit ->
  list_dataset_import_jobs_response

val make_list_dataset_import_jobs_request :
  ?dataset_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_dataset_import_jobs_request

val make_dataset_group_summary :
  ?name:name ->
  ?dataset_group_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  ?domain:domain ->
  unit ->
  dataset_group_summary

val make_list_dataset_groups_response :
  ?dataset_groups:dataset_groups -> ?next_token:next_token -> unit -> list_dataset_groups_response

val make_list_dataset_groups_request :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_dataset_groups_request

val make_dataset_export_job_summary :
  ?dataset_export_job_arn:arn ->
  ?job_name:name ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  dataset_export_job_summary

val make_list_dataset_export_jobs_response :
  ?dataset_export_jobs:dataset_export_jobs ->
  ?next_token:next_token ->
  unit ->
  list_dataset_export_jobs_response

val make_list_dataset_export_jobs_request :
  ?dataset_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_dataset_export_jobs_request

val make_data_deletion_job_summary :
  ?data_deletion_job_arn:arn ->
  ?dataset_group_arn:arn ->
  ?job_name:name ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  data_deletion_job_summary

val make_list_data_deletion_jobs_response :
  ?data_deletion_jobs:data_deletion_jobs ->
  ?next_token:next_token ->
  unit ->
  list_data_deletion_jobs_response

val make_list_data_deletion_jobs_request :
  ?dataset_group_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_data_deletion_jobs_request

val make_campaign_summary :
  ?name:name ->
  ?campaign_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  campaign_summary

val make_list_campaigns_response :
  ?campaigns:campaigns -> ?next_token:next_token -> unit -> list_campaigns_response

val make_list_campaigns_request :
  ?solution_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_campaigns_request

val make_batch_segment_job_summary :
  ?batch_segment_job_arn:arn ->
  ?job_name:name ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  ?solution_version_arn:arn ->
  unit ->
  batch_segment_job_summary

val make_list_batch_segment_jobs_response :
  ?batch_segment_jobs:batch_segment_jobs ->
  ?next_token:next_token ->
  unit ->
  list_batch_segment_jobs_response

val make_list_batch_segment_jobs_request :
  ?solution_version_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_batch_segment_jobs_request

val make_batch_inference_job_summary :
  ?batch_inference_job_arn:arn ->
  ?job_name:name ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  ?solution_version_arn:arn ->
  ?batch_inference_job_mode:batch_inference_job_mode ->
  unit ->
  batch_inference_job_summary

val make_list_batch_inference_jobs_response :
  ?batch_inference_jobs:batch_inference_jobs ->
  ?next_token:next_token ->
  unit ->
  list_batch_inference_jobs_response

val make_list_batch_inference_jobs_request :
  ?solution_version_arn:arn ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_batch_inference_jobs_request

val make_get_solution_metrics_response :
  ?solution_version_arn:arn -> ?metrics:metrics -> unit -> get_solution_metrics_response

val make_get_solution_metrics_request :
  solution_version_arn:arn -> unit -> get_solution_metrics_request

val make_tuned_hpo_params : ?algorithm_hyper_parameters:hyper_parameters -> unit -> tuned_hpo_params

val make_optimization_objective :
  ?item_attribute:item_attribute ->
  ?objective_sensitivity:objective_sensitivity ->
  unit ->
  optimization_objective

val make_auto_ml_config :
  ?metric_name:metric_name -> ?recipe_list:arn_list -> unit -> auto_ml_config

val make_categorical_hyper_parameter_range :
  ?name:parameter_name -> ?values:categorical_values -> unit -> categorical_hyper_parameter_range

val make_continuous_hyper_parameter_range :
  ?name:parameter_name ->
  ?min_value:continuous_min_value ->
  ?max_value:continuous_max_value ->
  unit ->
  continuous_hyper_parameter_range

val make_integer_hyper_parameter_range :
  ?name:parameter_name ->
  ?min_value:integer_min_value ->
  ?max_value:integer_max_value ->
  unit ->
  integer_hyper_parameter_range

val make_hyper_parameter_ranges :
  ?integer_hyper_parameter_ranges:integer_hyper_parameter_ranges ->
  ?continuous_hyper_parameter_ranges:continuous_hyper_parameter_ranges ->
  ?categorical_hyper_parameter_ranges:categorical_hyper_parameter_ranges ->
  unit ->
  hyper_parameter_ranges

val make_hpo_resource_config :
  ?max_number_of_training_jobs:hpo_resource ->
  ?max_parallel_training_jobs:hpo_resource ->
  unit ->
  hpo_resource_config

val make_hpo_objective :
  ?type_:hpo_objective_type ->
  ?metric_name:metric_name ->
  ?metric_regex:metric_regex ->
  unit ->
  hpo_objective

val make_hpo_config :
  ?hpo_objective:hpo_objective ->
  ?hpo_resource_config:hpo_resource_config ->
  ?algorithm_hyper_parameter_ranges:hyper_parameter_ranges ->
  unit ->
  hpo_config

val make_solution_config :
  ?event_value_threshold:event_value_threshold ->
  ?hpo_config:hpo_config ->
  ?algorithm_hyper_parameters:hyper_parameters ->
  ?feature_transformation_parameters:feature_transformation_parameters ->
  ?auto_ml_config:auto_ml_config ->
  ?events_config:events_config ->
  ?optimization_objective:optimization_objective ->
  ?training_data_config:training_data_config ->
  ?auto_training_config:auto_training_config ->
  unit ->
  solution_config

val make_solution_version :
  ?name:name ->
  ?solution_version_arn:arn ->
  ?solution_arn:arn ->
  ?perform_hp_o:perform_hp_o ->
  ?perform_auto_m_l:perform_auto_m_l ->
  ?perform_incremental_update:perform_incremental_update ->
  ?recipe_arn:arn ->
  ?event_type:event_type ->
  ?dataset_group_arn:arn ->
  ?solution_config:solution_config ->
  ?training_hours:training_hours ->
  ?training_mode:training_mode ->
  ?tuned_hpo_params:tuned_hpo_params ->
  ?status:status ->
  ?failure_reason:failure_reason ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?training_type:training_type ->
  unit ->
  solution_version

val make_describe_solution_version_response :
  ?solution_version:solution_version -> unit -> describe_solution_version_response

val make_describe_solution_version_request :
  solution_version_arn:arn -> unit -> describe_solution_version_request

val make_solution_update_summary :
  ?solution_update_config:solution_update_config ->
  ?status:status ->
  ?perform_auto_training:perform_auto_training ->
  ?perform_incremental_update:perform_incremental_update ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  solution_update_summary

val make_solution :
  ?name:name ->
  ?solution_arn:arn ->
  ?perform_hp_o:perform_hp_o ->
  ?perform_auto_m_l:perform_auto_m_l ->
  ?perform_auto_training:perform_auto_training ->
  ?perform_incremental_update:perform_incremental_update ->
  ?recipe_arn:arn ->
  ?dataset_group_arn:arn ->
  ?event_type:event_type ->
  ?solution_config:solution_config ->
  ?auto_ml_result:auto_ml_result ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?latest_solution_version:solution_version_summary ->
  ?latest_solution_update:solution_update_summary ->
  unit ->
  solution

val make_describe_solution_response : ?solution:solution -> unit -> describe_solution_response
val make_describe_solution_request : solution_arn:arn -> unit -> describe_solution_request

val make_dataset_schema :
  ?name:name ->
  ?schema_arn:arn ->
  ?schema:avro_schema ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?domain:domain ->
  unit ->
  dataset_schema

val make_describe_schema_response : ?schema:dataset_schema -> unit -> describe_schema_response
val make_describe_schema_request : schema_arn:arn -> unit -> describe_schema_request

val make_recommender_update_summary :
  ?recommender_config:recommender_config ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?status:status ->
  ?failure_reason:failure_reason ->
  unit ->
  recommender_update_summary

val make_recommender :
  ?recommender_arn:arn ->
  ?dataset_group_arn:arn ->
  ?name:name ->
  ?recipe_arn:arn ->
  ?recommender_config:recommender_config ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?status:status ->
  ?failure_reason:failure_reason ->
  ?latest_recommender_update:recommender_update_summary ->
  ?model_metrics:metrics ->
  unit ->
  recommender

val make_describe_recommender_response :
  ?recommender:recommender -> unit -> describe_recommender_response

val make_describe_recommender_request : recommender_arn:arn -> unit -> describe_recommender_request

val make_recipe :
  ?name:name ->
  ?recipe_arn:arn ->
  ?algorithm_arn:arn ->
  ?feature_transformation_arn:arn ->
  ?status:status ->
  ?description:description ->
  ?creation_date_time:date ->
  ?recipe_type:recipe_type ->
  ?last_updated_date_time:date ->
  unit ->
  recipe

val make_describe_recipe_response : ?recipe:recipe -> unit -> describe_recipe_response
val make_describe_recipe_request : recipe_arn:arn -> unit -> describe_recipe_request

val make_metric_attribution :
  ?name:name ->
  ?metric_attribution_arn:arn ->
  ?dataset_group_arn:arn ->
  ?metrics_output_config:metric_attribution_output ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  metric_attribution

val make_describe_metric_attribution_response :
  ?metric_attribution:metric_attribution -> unit -> describe_metric_attribution_response

val make_describe_metric_attribution_request :
  metric_attribution_arn:arn -> unit -> describe_metric_attribution_request

val make_filter :
  ?name:name ->
  ?filter_arn:arn ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?dataset_group_arn:arn ->
  ?failure_reason:failure_reason ->
  ?filter_expression:filter_expression ->
  ?status:status ->
  unit ->
  filter

val make_describe_filter_response : ?filter:filter -> unit -> describe_filter_response
val make_describe_filter_request : filter_arn:arn -> unit -> describe_filter_request

val make_feature_transformation :
  ?name:name ->
  ?feature_transformation_arn:arn ->
  ?default_parameters:featurization_parameters ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?status:status ->
  unit ->
  feature_transformation

val make_describe_feature_transformation_response :
  ?feature_transformation:feature_transformation -> unit -> describe_feature_transformation_response

val make_describe_feature_transformation_request :
  feature_transformation_arn:arn -> unit -> describe_feature_transformation_request

val make_event_tracker :
  ?name:name ->
  ?event_tracker_arn:arn ->
  ?account_id:account_id ->
  ?tracking_id:tracking_id ->
  ?dataset_group_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  event_tracker

val make_describe_event_tracker_response :
  ?event_tracker:event_tracker -> unit -> describe_event_tracker_response

val make_describe_event_tracker_request :
  event_tracker_arn:arn -> unit -> describe_event_tracker_request

val make_data_source : ?data_location:s3_location -> unit -> data_source

val make_dataset_import_job :
  ?job_name:name ->
  ?dataset_import_job_arn:arn ->
  ?dataset_arn:arn ->
  ?data_source:data_source ->
  ?role_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  ?import_mode:import_mode ->
  ?publish_attribution_metrics_to_s3:boolean_ ->
  unit ->
  dataset_import_job

val make_describe_dataset_import_job_response :
  ?dataset_import_job:dataset_import_job -> unit -> describe_dataset_import_job_response

val make_describe_dataset_import_job_request :
  dataset_import_job_arn:arn -> unit -> describe_dataset_import_job_request

val make_dataset_group :
  ?name:name ->
  ?dataset_group_arn:arn ->
  ?status:status ->
  ?role_arn:role_arn ->
  ?kms_key_arn:kms_key_arn ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  ?domain:domain ->
  unit ->
  dataset_group

val make_describe_dataset_group_response :
  ?dataset_group:dataset_group -> unit -> describe_dataset_group_response

val make_describe_dataset_group_request :
  dataset_group_arn:arn -> unit -> describe_dataset_group_request

val make_dataset_export_job_output :
  s3_data_destination:s3_data_config -> unit -> dataset_export_job_output

val make_dataset_export_job :
  ?job_name:name ->
  ?dataset_export_job_arn:arn ->
  ?dataset_arn:arn ->
  ?ingestion_mode:ingestion_mode ->
  ?role_arn:arn ->
  ?status:status ->
  ?job_output:dataset_export_job_output ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  dataset_export_job

val make_describe_dataset_export_job_response :
  ?dataset_export_job:dataset_export_job -> unit -> describe_dataset_export_job_response

val make_describe_dataset_export_job_request :
  dataset_export_job_arn:arn -> unit -> describe_dataset_export_job_request

val make_dataset_update_summary :
  ?schema_arn:arn ->
  ?status:status ->
  ?failure_reason:failure_reason ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  dataset_update_summary

val make_dataset :
  ?name:name ->
  ?dataset_arn:arn ->
  ?dataset_group_arn:arn ->
  ?dataset_type:dataset_type ->
  ?schema_arn:arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?latest_dataset_update:dataset_update_summary ->
  ?tracking_id:tracking_id ->
  unit ->
  dataset

val make_describe_dataset_response : ?dataset:dataset -> unit -> describe_dataset_response
val make_describe_dataset_request : dataset_arn:arn -> unit -> describe_dataset_request

val make_data_deletion_job :
  ?job_name:name ->
  ?data_deletion_job_arn:arn ->
  ?dataset_group_arn:arn ->
  ?data_source:data_source ->
  ?role_arn:role_arn ->
  ?status:status ->
  ?num_deleted:integer ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?failure_reason:failure_reason ->
  unit ->
  data_deletion_job

val make_describe_data_deletion_job_response :
  ?data_deletion_job:data_deletion_job -> unit -> describe_data_deletion_job_response

val make_describe_data_deletion_job_request :
  data_deletion_job_arn:arn -> unit -> describe_data_deletion_job_request

val make_campaign_update_summary :
  ?solution_version_arn:arn ->
  ?min_provisioned_tp_s:transactions_per_second ->
  ?campaign_config:campaign_config ->
  ?status:status ->
  ?failure_reason:failure_reason ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  campaign_update_summary

val make_campaign :
  ?name:name ->
  ?campaign_arn:arn ->
  ?solution_version_arn:arn ->
  ?min_provisioned_tp_s:transactions_per_second ->
  ?campaign_config:campaign_config ->
  ?status:status ->
  ?failure_reason:failure_reason ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  ?latest_campaign_update:campaign_update_summary ->
  unit ->
  campaign

val make_describe_campaign_response : ?campaign:campaign -> unit -> describe_campaign_response
val make_describe_campaign_request : campaign_arn:arn -> unit -> describe_campaign_request

val make_batch_segment_job_output :
  s3_data_destination:s3_data_config -> unit -> batch_segment_job_output

val make_batch_segment_job_input : s3_data_source:s3_data_config -> unit -> batch_segment_job_input

val make_batch_segment_job :
  ?job_name:name ->
  ?batch_segment_job_arn:arn ->
  ?filter_arn:arn ->
  ?failure_reason:failure_reason ->
  ?solution_version_arn:arn ->
  ?num_results:num_batch_results ->
  ?job_input:batch_segment_job_input ->
  ?job_output:batch_segment_job_output ->
  ?role_arn:role_arn ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  batch_segment_job

val make_describe_batch_segment_job_response :
  ?batch_segment_job:batch_segment_job -> unit -> describe_batch_segment_job_response

val make_describe_batch_segment_job_request :
  batch_segment_job_arn:arn -> unit -> describe_batch_segment_job_request

val make_fields_for_theme_generation : item_name:column_name -> unit -> fields_for_theme_generation

val make_theme_generation_config :
  fields_for_theme_generation:fields_for_theme_generation -> unit -> theme_generation_config

val make_batch_inference_job_config :
  ?item_exploration_config:hyper_parameters ->
  ?ranking_influence:ranking_influence ->
  unit ->
  batch_inference_job_config

val make_batch_inference_job_output :
  s3_data_destination:s3_data_config -> unit -> batch_inference_job_output

val make_batch_inference_job_input :
  s3_data_source:s3_data_config -> unit -> batch_inference_job_input

val make_batch_inference_job :
  ?job_name:name ->
  ?batch_inference_job_arn:arn ->
  ?filter_arn:arn ->
  ?failure_reason:failure_reason ->
  ?solution_version_arn:arn ->
  ?num_results:num_batch_results ->
  ?job_input:batch_inference_job_input ->
  ?job_output:batch_inference_job_output ->
  ?batch_inference_job_config:batch_inference_job_config ->
  ?role_arn:role_arn ->
  ?batch_inference_job_mode:batch_inference_job_mode ->
  ?theme_generation_config:theme_generation_config ->
  ?status:status ->
  ?creation_date_time:date ->
  ?last_updated_date_time:date ->
  unit ->
  batch_inference_job

val make_describe_batch_inference_job_response :
  ?batch_inference_job:batch_inference_job -> unit -> describe_batch_inference_job_response

val make_describe_batch_inference_job_request :
  batch_inference_job_arn:arn -> unit -> describe_batch_inference_job_request

val make_describe_algorithm_response : ?algorithm:algorithm -> unit -> describe_algorithm_response
val make_describe_algorithm_request : algorithm_arn:arn -> unit -> describe_algorithm_request
val make_delete_solution_request : solution_arn:arn -> unit -> delete_solution_request
val make_delete_schema_request : schema_arn:arn -> unit -> delete_schema_request
val make_delete_recommender_request : recommender_arn:arn -> unit -> delete_recommender_request

val make_delete_metric_attribution_request :
  metric_attribution_arn:arn -> unit -> delete_metric_attribution_request

val make_delete_filter_request : filter_arn:arn -> unit -> delete_filter_request

val make_delete_event_tracker_request :
  event_tracker_arn:arn -> unit -> delete_event_tracker_request

val make_delete_dataset_group_request :
  dataset_group_arn:arn -> unit -> delete_dataset_group_request

val make_delete_dataset_request : dataset_arn:arn -> unit -> delete_dataset_request
val make_delete_campaign_request : campaign_arn:arn -> unit -> delete_campaign_request

val make_create_solution_version_response :
  ?solution_version_arn:arn -> unit -> create_solution_version_response

val make_create_solution_version_request :
  ?name:name ->
  ?training_mode:training_mode ->
  ?tags:tags ->
  solution_arn:arn ->
  unit ->
  create_solution_version_request

val make_create_solution_response : ?solution_arn:arn -> unit -> create_solution_response

val make_create_solution_request :
  ?perform_hp_o:boolean_ ->
  ?perform_auto_m_l:perform_auto_m_l ->
  ?perform_auto_training:perform_auto_training ->
  ?perform_incremental_update:perform_incremental_update ->
  ?recipe_arn:arn ->
  ?event_type:event_type ->
  ?solution_config:solution_config ->
  ?tags:tags ->
  name:name ->
  dataset_group_arn:arn ->
  unit ->
  create_solution_request

val make_create_schema_response : ?schema_arn:arn -> unit -> create_schema_response

val make_create_schema_request :
  ?domain:domain -> name:name -> schema:avro_schema -> unit -> create_schema_request

val make_create_recommender_response : ?recommender_arn:arn -> unit -> create_recommender_response

val make_create_recommender_request :
  ?recommender_config:recommender_config ->
  ?tags:tags ->
  name:name ->
  dataset_group_arn:arn ->
  recipe_arn:arn ->
  unit ->
  create_recommender_request

val make_create_metric_attribution_response :
  ?metric_attribution_arn:arn -> unit -> create_metric_attribution_response

val make_create_metric_attribution_request :
  name:name ->
  dataset_group_arn:arn ->
  metrics:metric_attributes ->
  metrics_output_config:metric_attribution_output ->
  unit ->
  create_metric_attribution_request

val make_create_filter_response : ?filter_arn:arn -> unit -> create_filter_response

val make_create_filter_request :
  ?tags:tags ->
  name:name ->
  dataset_group_arn:arn ->
  filter_expression:filter_expression ->
  unit ->
  create_filter_request

val make_create_event_tracker_response :
  ?event_tracker_arn:arn -> ?tracking_id:tracking_id -> unit -> create_event_tracker_response

val make_create_event_tracker_request :
  ?tags:tags -> name:name -> dataset_group_arn:arn -> unit -> create_event_tracker_request

val make_create_dataset_import_job_response :
  ?dataset_import_job_arn:arn -> unit -> create_dataset_import_job_response

val make_create_dataset_import_job_request :
  ?role_arn:role_arn ->
  ?tags:tags ->
  ?import_mode:import_mode ->
  ?publish_attribution_metrics_to_s3:boolean_ ->
  job_name:name ->
  dataset_arn:arn ->
  data_source:data_source ->
  unit ->
  create_dataset_import_job_request

val make_create_dataset_group_response :
  ?dataset_group_arn:arn -> ?domain:domain -> unit -> create_dataset_group_response

val make_create_dataset_group_request :
  ?role_arn:role_arn ->
  ?kms_key_arn:kms_key_arn ->
  ?domain:domain ->
  ?tags:tags ->
  name:name ->
  unit ->
  create_dataset_group_request

val make_create_dataset_export_job_response :
  ?dataset_export_job_arn:arn -> unit -> create_dataset_export_job_response

val make_create_dataset_export_job_request :
  ?ingestion_mode:ingestion_mode ->
  ?tags:tags ->
  job_name:name ->
  dataset_arn:arn ->
  role_arn:role_arn ->
  job_output:dataset_export_job_output ->
  unit ->
  create_dataset_export_job_request

val make_create_dataset_response : ?dataset_arn:arn -> unit -> create_dataset_response

val make_create_dataset_request :
  ?tags:tags ->
  name:name ->
  schema_arn:arn ->
  dataset_group_arn:arn ->
  dataset_type:dataset_type ->
  unit ->
  create_dataset_request

val make_create_data_deletion_job_response :
  ?data_deletion_job_arn:arn -> unit -> create_data_deletion_job_response

val make_create_data_deletion_job_request :
  ?tags:tags ->
  job_name:name ->
  dataset_group_arn:arn ->
  data_source:data_source ->
  role_arn:role_arn ->
  unit ->
  create_data_deletion_job_request

val make_create_campaign_response : ?campaign_arn:arn -> unit -> create_campaign_response

val make_create_campaign_request :
  ?min_provisioned_tp_s:transactions_per_second ->
  ?campaign_config:campaign_config ->
  ?tags:tags ->
  name:name ->
  solution_version_arn:arn ->
  unit ->
  create_campaign_request

val make_create_batch_segment_job_response :
  ?batch_segment_job_arn:arn -> unit -> create_batch_segment_job_response

val make_create_batch_segment_job_request :
  ?filter_arn:arn ->
  ?num_results:num_batch_results ->
  ?tags:tags ->
  job_name:name ->
  solution_version_arn:arn ->
  job_input:batch_segment_job_input ->
  job_output:batch_segment_job_output ->
  role_arn:role_arn ->
  unit ->
  create_batch_segment_job_request

val make_create_batch_inference_job_response :
  ?batch_inference_job_arn:arn -> unit -> create_batch_inference_job_response

val make_create_batch_inference_job_request :
  ?filter_arn:arn ->
  ?num_results:num_batch_results ->
  ?batch_inference_job_config:batch_inference_job_config ->
  ?tags:tags ->
  ?batch_inference_job_mode:batch_inference_job_mode ->
  ?theme_generation_config:theme_generation_config ->
  job_name:name ->
  solution_version_arn:arn ->
  job_input:batch_inference_job_input ->
  job_output:batch_inference_job_output ->
  role_arn:role_arn ->
  unit ->
  create_batch_inference_job_request
