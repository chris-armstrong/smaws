open Types

val make_update_solution_response : ?solution_arn:arn -> unit -> update_solution_response

val make_auto_training_config :
  ?scheduling_expression:scheduling_expression -> unit -> auto_training_config

val make_event_parameters :
  ?weight:event_type_weight ->
  ?event_value_threshold:event_type_threshold_value ->
  ?event_type:event_type ->
  unit ->
  event_parameters

val make_events_config : ?event_parameters_list:event_parameters_list -> unit -> events_config

val make_solution_update_config :
  ?events_config:events_config ->
  ?auto_training_config:auto_training_config ->
  unit ->
  solution_update_config

val make_update_solution_request :
  ?solution_update_config:solution_update_config ->
  ?perform_incremental_update:perform_incremental_update ->
  ?perform_auto_training:perform_auto_training ->
  solution_arn:arn ->
  unit ->
  update_solution_request

val make_update_recommender_response : ?recommender_arn:arn -> unit -> update_recommender_response

val make_training_data_config :
  ?included_dataset_columns:included_dataset_columns ->
  ?excluded_dataset_columns:excluded_dataset_columns ->
  unit ->
  training_data_config

val make_recommender_config :
  ?enable_metadata_with_recommendations:boolean_ ->
  ?training_data_config:training_data_config ->
  ?min_recommendation_requests_per_second:transactions_per_second ->
  ?item_exploration_config:hyper_parameters ->
  unit ->
  recommender_config

val make_update_recommender_request :
  recommender_config:recommender_config -> recommender_arn:arn -> unit -> update_recommender_request

val make_update_metric_attribution_response :
  ?metric_attribution_arn:arn -> unit -> update_metric_attribution_response

val make_metric_attribute :
  expression:metric_expression ->
  metric_name:metric_name ->
  event_type:event_type ->
  unit ->
  metric_attribute

val make_s3_data_config : ?kms_key_arn:kms_key_arn -> path:s3_location -> unit -> s3_data_config

val make_metric_attribution_output :
  ?s3_data_destination:s3_data_config -> role_arn:role_arn -> unit -> metric_attribution_output

val make_update_metric_attribution_request :
  ?metric_attribution_arn:arn ->
  ?metrics_output_config:metric_attribution_output ->
  ?remove_metrics:metric_attributes_names_list ->
  ?add_metrics:metric_attributes ->
  unit ->
  update_metric_attribution_request

val make_update_dataset_response : ?dataset_arn:arn -> unit -> update_dataset_response

val make_update_dataset_request :
  schema_arn:arn -> dataset_arn:arn -> unit -> update_dataset_request

val make_update_campaign_response : ?campaign_arn:arn -> unit -> update_campaign_response

val make_campaign_config :
  ?ranking_influence:ranking_influence ->
  ?sync_with_latest_solution_version:boolean_ ->
  ?enable_metadata_with_recommendations:boolean_ ->
  ?item_exploration_config:hyper_parameters ->
  unit ->
  campaign_config

val make_update_campaign_request :
  ?campaign_config:campaign_config ->
  ?min_provisioned_tp_s:transactions_per_second ->
  ?solution_version_arn:arn ->
  campaign_arn:arn ->
  unit ->
  update_campaign_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:arn -> unit -> untag_resource_request

val make_tuned_hpo_params : ?algorithm_hyper_parameters:hyper_parameters -> unit -> tuned_hpo_params
val make_fields_for_theme_generation : item_name:column_name -> unit -> fields_for_theme_generation

val make_theme_generation_config :
  fields_for_theme_generation:fields_for_theme_generation -> unit -> theme_generation_config

val make_tag : tag_value:tag_value -> tag_key:tag_key -> unit -> tag
val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tags -> resource_arn:arn -> unit -> tag_resource_request

val make_stop_solution_version_creation_request :
  solution_version_arn:arn -> unit -> stop_solution_version_creation_request

val make_stop_recommender_response : ?recommender_arn:arn -> unit -> stop_recommender_response
val make_stop_recommender_request : recommender_arn:arn -> unit -> stop_recommender_request
val make_start_recommender_response : ?recommender_arn:arn -> unit -> start_recommender_response
val make_start_recommender_request : recommender_arn:arn -> unit -> start_recommender_request

val make_solution_summary :
  ?recipe_arn:arn ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?solution_arn:arn ->
  ?name:name ->
  unit ->
  solution_summary

val make_solution_version_summary :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?training_type:training_type ->
  ?training_mode:training_mode ->
  ?status:status ->
  ?solution_version_arn:arn ->
  unit ->
  solution_version_summary

val make_hpo_objective :
  ?metric_regex:metric_regex ->
  ?metric_name:metric_name ->
  ?type_:hpo_objective_type ->
  unit ->
  hpo_objective

val make_hpo_resource_config :
  ?max_parallel_training_jobs:hpo_resource ->
  ?max_number_of_training_jobs:hpo_resource ->
  unit ->
  hpo_resource_config

val make_integer_hyper_parameter_range :
  ?max_value:integer_max_value ->
  ?min_value:integer_min_value ->
  ?name:parameter_name ->
  unit ->
  integer_hyper_parameter_range

val make_continuous_hyper_parameter_range :
  ?max_value:continuous_max_value ->
  ?min_value:continuous_min_value ->
  ?name:parameter_name ->
  unit ->
  continuous_hyper_parameter_range

val make_categorical_hyper_parameter_range :
  ?values:categorical_values -> ?name:parameter_name -> unit -> categorical_hyper_parameter_range

val make_hyper_parameter_ranges :
  ?categorical_hyper_parameter_ranges:categorical_hyper_parameter_ranges ->
  ?continuous_hyper_parameter_ranges:continuous_hyper_parameter_ranges ->
  ?integer_hyper_parameter_ranges:integer_hyper_parameter_ranges ->
  unit ->
  hyper_parameter_ranges

val make_hpo_config :
  ?algorithm_hyper_parameter_ranges:hyper_parameter_ranges ->
  ?hpo_resource_config:hpo_resource_config ->
  ?hpo_objective:hpo_objective ->
  unit ->
  hpo_config

val make_auto_ml_config :
  ?recipe_list:arn_list -> ?metric_name:metric_name -> unit -> auto_ml_config

val make_optimization_objective :
  ?objective_sensitivity:objective_sensitivity ->
  ?item_attribute:item_attribute ->
  unit ->
  optimization_objective

val make_solution_config :
  ?auto_training_config:auto_training_config ->
  ?training_data_config:training_data_config ->
  ?optimization_objective:optimization_objective ->
  ?events_config:events_config ->
  ?auto_ml_config:auto_ml_config ->
  ?feature_transformation_parameters:feature_transformation_parameters ->
  ?algorithm_hyper_parameters:hyper_parameters ->
  ?hpo_config:hpo_config ->
  ?event_value_threshold:event_value_threshold ->
  unit ->
  solution_config

val make_solution_version :
  ?training_type:training_type ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?failure_reason:failure_reason ->
  ?status:status ->
  ?tuned_hpo_params:tuned_hpo_params ->
  ?training_mode:training_mode ->
  ?training_hours:training_hours ->
  ?solution_config:solution_config ->
  ?dataset_group_arn:arn ->
  ?event_type:event_type ->
  ?recipe_arn:arn ->
  ?perform_incremental_update:perform_incremental_update ->
  ?perform_auto_m_l:perform_auto_m_l ->
  ?perform_hp_o:perform_hp_o ->
  ?solution_arn:arn ->
  ?solution_version_arn:arn ->
  ?name:name ->
  unit ->
  solution_version

val make_solution_update_summary :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?perform_incremental_update:perform_incremental_update ->
  ?perform_auto_training:perform_auto_training ->
  ?status:status ->
  ?solution_update_config:solution_update_config ->
  unit ->
  solution_update_summary

val make_solution :
  ?latest_solution_update:solution_update_summary ->
  ?latest_solution_version:solution_version_summary ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?auto_ml_result:auto_ml_result ->
  ?solution_config:solution_config ->
  ?event_type:event_type ->
  ?dataset_group_arn:arn ->
  ?recipe_arn:arn ->
  ?perform_incremental_update:perform_incremental_update ->
  ?perform_auto_training:perform_auto_training ->
  ?perform_auto_m_l:perform_auto_m_l ->
  ?perform_hp_o:perform_hp_o ->
  ?solution_arn:arn ->
  ?name:name ->
  unit ->
  solution

val make_dataset_schema_summary :
  ?domain:domain ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?schema_arn:arn ->
  ?name:name ->
  unit ->
  dataset_schema_summary

val make_recommender_summary :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?recommender_config:recommender_config ->
  ?recipe_arn:arn ->
  ?dataset_group_arn:arn ->
  ?recommender_arn:arn ->
  ?name:name ->
  unit ->
  recommender_summary

val make_recommender_update_summary :
  ?failure_reason:failure_reason ->
  ?status:status ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?recommender_config:recommender_config ->
  unit ->
  recommender_update_summary

val make_recommender :
  ?model_metrics:metrics ->
  ?latest_recommender_update:recommender_update_summary ->
  ?failure_reason:failure_reason ->
  ?status:status ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?recommender_config:recommender_config ->
  ?recipe_arn:arn ->
  ?name:name ->
  ?dataset_group_arn:arn ->
  ?recommender_arn:arn ->
  unit ->
  recommender

val make_recipe_summary :
  ?domain:domain ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?recipe_arn:arn ->
  ?name:name ->
  unit ->
  recipe_summary

val make_recipe :
  ?last_updated_date_time:date ->
  ?recipe_type:recipe_type ->
  ?creation_date_time:date ->
  ?description:description ->
  ?status:status ->
  ?feature_transformation_arn:arn ->
  ?algorithm_arn:arn ->
  ?recipe_arn:arn ->
  ?name:name ->
  unit ->
  recipe

val make_metric_attribution_summary :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?metric_attribution_arn:arn ->
  ?name:name ->
  unit ->
  metric_attribution_summary

val make_metric_attribution :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?metrics_output_config:metric_attribution_output ->
  ?dataset_group_arn:arn ->
  ?metric_attribution_arn:arn ->
  ?name:name ->
  unit ->
  metric_attribution

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request : resource_arn:arn -> unit -> list_tags_for_resource_request

val make_list_solutions_response :
  ?next_token:next_token -> ?solutions:solutions -> unit -> list_solutions_response

val make_list_solutions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_group_arn:arn ->
  unit ->
  list_solutions_request

val make_list_solution_versions_response :
  ?next_token:next_token ->
  ?solution_versions:solution_versions ->
  unit ->
  list_solution_versions_response

val make_list_solution_versions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?solution_arn:arn ->
  unit ->
  list_solution_versions_request

val make_list_schemas_response :
  ?next_token:next_token -> ?schemas:schemas -> unit -> list_schemas_response

val make_list_schemas_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_schemas_request

val make_list_recommenders_response :
  ?next_token:next_token -> ?recommenders:recommenders -> unit -> list_recommenders_response

val make_list_recommenders_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_group_arn:arn ->
  unit ->
  list_recommenders_request

val make_list_recipes_response :
  ?next_token:next_token -> ?recipes:recipes -> unit -> list_recipes_response

val make_list_recipes_request :
  ?domain:domain ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?recipe_provider:recipe_provider ->
  unit ->
  list_recipes_request

val make_list_metric_attributions_response :
  ?next_token:next_token ->
  ?metric_attributions:metric_attributions ->
  unit ->
  list_metric_attributions_response

val make_list_metric_attributions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_group_arn:arn ->
  unit ->
  list_metric_attributions_request

val make_list_metric_attribution_metrics_response :
  ?next_token:next_token ->
  ?metrics:metric_attributes ->
  unit ->
  list_metric_attribution_metrics_response

val make_list_metric_attribution_metrics_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?metric_attribution_arn:arn ->
  unit ->
  list_metric_attribution_metrics_request

val make_filter_summary :
  ?status:status ->
  ?failure_reason:failure_reason ->
  ?dataset_group_arn:arn ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?filter_arn:arn ->
  ?name:name ->
  unit ->
  filter_summary

val make_list_filters_response :
  ?next_token:next_token -> ?filters:filters -> unit -> list_filters_response

val make_list_filters_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_group_arn:arn ->
  unit ->
  list_filters_request

val make_event_tracker_summary :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?event_tracker_arn:arn ->
  ?name:name ->
  unit ->
  event_tracker_summary

val make_list_event_trackers_response :
  ?next_token:next_token -> ?event_trackers:event_trackers -> unit -> list_event_trackers_response

val make_list_event_trackers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_group_arn:arn ->
  unit ->
  list_event_trackers_request

val make_dataset_summary :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?dataset_type:dataset_type ->
  ?dataset_arn:arn ->
  ?name:name ->
  unit ->
  dataset_summary

val make_list_datasets_response :
  ?next_token:next_token -> ?datasets:datasets -> unit -> list_datasets_response

val make_list_datasets_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_group_arn:arn ->
  unit ->
  list_datasets_request

val make_dataset_import_job_summary :
  ?import_mode:import_mode ->
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?job_name:name ->
  ?dataset_import_job_arn:arn ->
  unit ->
  dataset_import_job_summary

val make_list_dataset_import_jobs_response :
  ?next_token:next_token ->
  ?dataset_import_jobs:dataset_import_jobs ->
  unit ->
  list_dataset_import_jobs_response

val make_list_dataset_import_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_arn:arn ->
  unit ->
  list_dataset_import_jobs_request

val make_dataset_group_summary :
  ?domain:domain ->
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?dataset_group_arn:arn ->
  ?name:name ->
  unit ->
  dataset_group_summary

val make_list_dataset_groups_response :
  ?next_token:next_token -> ?dataset_groups:dataset_groups -> unit -> list_dataset_groups_response

val make_list_dataset_groups_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_dataset_groups_request

val make_dataset_export_job_summary :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?job_name:name ->
  ?dataset_export_job_arn:arn ->
  unit ->
  dataset_export_job_summary

val make_list_dataset_export_jobs_response :
  ?next_token:next_token ->
  ?dataset_export_jobs:dataset_export_jobs ->
  unit ->
  list_dataset_export_jobs_response

val make_list_dataset_export_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_arn:arn ->
  unit ->
  list_dataset_export_jobs_request

val make_data_deletion_job_summary :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?job_name:name ->
  ?dataset_group_arn:arn ->
  ?data_deletion_job_arn:arn ->
  unit ->
  data_deletion_job_summary

val make_list_data_deletion_jobs_response :
  ?next_token:next_token ->
  ?data_deletion_jobs:data_deletion_jobs ->
  unit ->
  list_data_deletion_jobs_response

val make_list_data_deletion_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?dataset_group_arn:arn ->
  unit ->
  list_data_deletion_jobs_request

val make_campaign_summary :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?campaign_arn:arn ->
  ?name:name ->
  unit ->
  campaign_summary

val make_list_campaigns_response :
  ?next_token:next_token -> ?campaigns:campaigns -> unit -> list_campaigns_response

val make_list_campaigns_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?solution_arn:arn ->
  unit ->
  list_campaigns_request

val make_batch_segment_job_summary :
  ?solution_version_arn:arn ->
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?job_name:name ->
  ?batch_segment_job_arn:arn ->
  unit ->
  batch_segment_job_summary

val make_list_batch_segment_jobs_response :
  ?next_token:next_token ->
  ?batch_segment_jobs:batch_segment_jobs ->
  unit ->
  list_batch_segment_jobs_response

val make_list_batch_segment_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?solution_version_arn:arn ->
  unit ->
  list_batch_segment_jobs_request

val make_batch_inference_job_summary :
  ?batch_inference_job_mode:batch_inference_job_mode ->
  ?solution_version_arn:arn ->
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?job_name:name ->
  ?batch_inference_job_arn:arn ->
  unit ->
  batch_inference_job_summary

val make_list_batch_inference_jobs_response :
  ?next_token:next_token ->
  ?batch_inference_jobs:batch_inference_jobs ->
  unit ->
  list_batch_inference_jobs_response

val make_list_batch_inference_jobs_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?solution_version_arn:arn ->
  unit ->
  list_batch_inference_jobs_request

val make_get_solution_metrics_response :
  ?metrics:metrics -> ?solution_version_arn:arn -> unit -> get_solution_metrics_response

val make_get_solution_metrics_request :
  solution_version_arn:arn -> unit -> get_solution_metrics_request

val make_filter :
  ?status:status ->
  ?filter_expression:filter_expression ->
  ?failure_reason:failure_reason ->
  ?dataset_group_arn:arn ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?filter_arn:arn ->
  ?name:name ->
  unit ->
  filter

val make_feature_transformation :
  ?status:status ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?default_parameters:featurization_parameters ->
  ?feature_transformation_arn:arn ->
  ?name:name ->
  unit ->
  feature_transformation

val make_event_tracker :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?dataset_group_arn:arn ->
  ?tracking_id:tracking_id ->
  ?account_id:account_id ->
  ?event_tracker_arn:arn ->
  ?name:name ->
  unit ->
  event_tracker

val make_describe_solution_version_response :
  ?solution_version:solution_version -> unit -> describe_solution_version_response

val make_describe_solution_version_request :
  solution_version_arn:arn -> unit -> describe_solution_version_request

val make_describe_solution_response : ?solution:solution -> unit -> describe_solution_response
val make_describe_solution_request : solution_arn:arn -> unit -> describe_solution_request

val make_dataset_schema :
  ?domain:domain ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?schema:avro_schema ->
  ?schema_arn:arn ->
  ?name:name ->
  unit ->
  dataset_schema

val make_describe_schema_response : ?schema:dataset_schema -> unit -> describe_schema_response
val make_describe_schema_request : schema_arn:arn -> unit -> describe_schema_request

val make_describe_recommender_response :
  ?recommender:recommender -> unit -> describe_recommender_response

val make_describe_recommender_request : recommender_arn:arn -> unit -> describe_recommender_request
val make_describe_recipe_response : ?recipe:recipe -> unit -> describe_recipe_response
val make_describe_recipe_request : recipe_arn:arn -> unit -> describe_recipe_request

val make_describe_metric_attribution_response :
  ?metric_attribution:metric_attribution -> unit -> describe_metric_attribution_response

val make_describe_metric_attribution_request :
  metric_attribution_arn:arn -> unit -> describe_metric_attribution_request

val make_describe_filter_response : ?filter:filter -> unit -> describe_filter_response
val make_describe_filter_request : filter_arn:arn -> unit -> describe_filter_request

val make_describe_feature_transformation_response :
  ?feature_transformation:feature_transformation -> unit -> describe_feature_transformation_response

val make_describe_feature_transformation_request :
  feature_transformation_arn:arn -> unit -> describe_feature_transformation_request

val make_describe_event_tracker_response :
  ?event_tracker:event_tracker -> unit -> describe_event_tracker_response

val make_describe_event_tracker_request :
  event_tracker_arn:arn -> unit -> describe_event_tracker_request

val make_dataset_update_summary :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?failure_reason:failure_reason ->
  ?status:status ->
  ?schema_arn:arn ->
  unit ->
  dataset_update_summary

val make_dataset :
  ?tracking_id:tracking_id ->
  ?latest_dataset_update:dataset_update_summary ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?schema_arn:arn ->
  ?dataset_type:dataset_type ->
  ?dataset_group_arn:arn ->
  ?dataset_arn:arn ->
  ?name:name ->
  unit ->
  dataset

val make_describe_dataset_response : ?dataset:dataset -> unit -> describe_dataset_response
val make_describe_dataset_request : dataset_arn:arn -> unit -> describe_dataset_request
val make_data_source : ?data_location:s3_location -> unit -> data_source

val make_dataset_import_job :
  ?publish_attribution_metrics_to_s3:boolean_ ->
  ?import_mode:import_mode ->
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?role_arn:arn ->
  ?data_source:data_source ->
  ?dataset_arn:arn ->
  ?dataset_import_job_arn:arn ->
  ?job_name:name ->
  unit ->
  dataset_import_job

val make_describe_dataset_import_job_response :
  ?dataset_import_job:dataset_import_job -> unit -> describe_dataset_import_job_response

val make_describe_dataset_import_job_request :
  dataset_import_job_arn:arn -> unit -> describe_dataset_import_job_request

val make_dataset_group :
  ?domain:domain ->
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?kms_key_arn:kms_key_arn ->
  ?role_arn:role_arn ->
  ?status:status ->
  ?dataset_group_arn:arn ->
  ?name:name ->
  unit ->
  dataset_group

val make_describe_dataset_group_response :
  ?dataset_group:dataset_group -> unit -> describe_dataset_group_response

val make_describe_dataset_group_request :
  dataset_group_arn:arn -> unit -> describe_dataset_group_request

val make_dataset_export_job_output :
  s3_data_destination:s3_data_config -> unit -> dataset_export_job_output

val make_dataset_export_job :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?job_output:dataset_export_job_output ->
  ?status:status ->
  ?role_arn:arn ->
  ?ingestion_mode:ingestion_mode ->
  ?dataset_arn:arn ->
  ?dataset_export_job_arn:arn ->
  ?job_name:name ->
  unit ->
  dataset_export_job

val make_describe_dataset_export_job_response :
  ?dataset_export_job:dataset_export_job -> unit -> describe_dataset_export_job_response

val make_describe_dataset_export_job_request :
  dataset_export_job_arn:arn -> unit -> describe_dataset_export_job_request

val make_data_deletion_job :
  ?failure_reason:failure_reason ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?num_deleted:integer ->
  ?status:status ->
  ?role_arn:role_arn ->
  ?data_source:data_source ->
  ?dataset_group_arn:arn ->
  ?data_deletion_job_arn:arn ->
  ?job_name:name ->
  unit ->
  data_deletion_job

val make_describe_data_deletion_job_response :
  ?data_deletion_job:data_deletion_job -> unit -> describe_data_deletion_job_response

val make_describe_data_deletion_job_request :
  data_deletion_job_arn:arn -> unit -> describe_data_deletion_job_request

val make_campaign_update_summary :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?failure_reason:failure_reason ->
  ?status:status ->
  ?campaign_config:campaign_config ->
  ?min_provisioned_tp_s:transactions_per_second ->
  ?solution_version_arn:arn ->
  unit ->
  campaign_update_summary

val make_campaign :
  ?latest_campaign_update:campaign_update_summary ->
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?failure_reason:failure_reason ->
  ?status:status ->
  ?campaign_config:campaign_config ->
  ?min_provisioned_tp_s:transactions_per_second ->
  ?solution_version_arn:arn ->
  ?campaign_arn:arn ->
  ?name:name ->
  unit ->
  campaign

val make_describe_campaign_response : ?campaign:campaign -> unit -> describe_campaign_response
val make_describe_campaign_request : campaign_arn:arn -> unit -> describe_campaign_request
val make_batch_segment_job_input : s3_data_source:s3_data_config -> unit -> batch_segment_job_input

val make_batch_segment_job_output :
  s3_data_destination:s3_data_config -> unit -> batch_segment_job_output

val make_batch_segment_job :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?role_arn:role_arn ->
  ?job_output:batch_segment_job_output ->
  ?job_input:batch_segment_job_input ->
  ?num_results:num_batch_results ->
  ?solution_version_arn:arn ->
  ?failure_reason:failure_reason ->
  ?filter_arn:arn ->
  ?batch_segment_job_arn:arn ->
  ?job_name:name ->
  unit ->
  batch_segment_job

val make_describe_batch_segment_job_response :
  ?batch_segment_job:batch_segment_job -> unit -> describe_batch_segment_job_response

val make_describe_batch_segment_job_request :
  batch_segment_job_arn:arn -> unit -> describe_batch_segment_job_request

val make_batch_inference_job_input :
  s3_data_source:s3_data_config -> unit -> batch_inference_job_input

val make_batch_inference_job_output :
  s3_data_destination:s3_data_config -> unit -> batch_inference_job_output

val make_batch_inference_job_config :
  ?ranking_influence:ranking_influence ->
  ?item_exploration_config:hyper_parameters ->
  unit ->
  batch_inference_job_config

val make_batch_inference_job :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?status:status ->
  ?theme_generation_config:theme_generation_config ->
  ?batch_inference_job_mode:batch_inference_job_mode ->
  ?role_arn:role_arn ->
  ?batch_inference_job_config:batch_inference_job_config ->
  ?job_output:batch_inference_job_output ->
  ?job_input:batch_inference_job_input ->
  ?num_results:num_batch_results ->
  ?solution_version_arn:arn ->
  ?failure_reason:failure_reason ->
  ?filter_arn:arn ->
  ?batch_inference_job_arn:arn ->
  ?job_name:name ->
  unit ->
  batch_inference_job

val make_describe_batch_inference_job_response :
  ?batch_inference_job:batch_inference_job -> unit -> describe_batch_inference_job_response

val make_describe_batch_inference_job_request :
  batch_inference_job_arn:arn -> unit -> describe_batch_inference_job_request

val make_algorithm_image : ?name:name -> docker_ur_i:docker_ur_i -> unit -> algorithm_image

val make_default_integer_hyper_parameter_range :
  ?is_tunable:tunable ->
  ?max_value:integer_max_value ->
  ?min_value:integer_min_value ->
  ?name:parameter_name ->
  unit ->
  default_integer_hyper_parameter_range

val make_default_continuous_hyper_parameter_range :
  ?is_tunable:tunable ->
  ?max_value:continuous_max_value ->
  ?min_value:continuous_min_value ->
  ?name:parameter_name ->
  unit ->
  default_continuous_hyper_parameter_range

val make_default_categorical_hyper_parameter_range :
  ?is_tunable:tunable ->
  ?values:categorical_values ->
  ?name:parameter_name ->
  unit ->
  default_categorical_hyper_parameter_range

val make_default_hyper_parameter_ranges :
  ?categorical_hyper_parameter_ranges:default_categorical_hyper_parameter_ranges ->
  ?continuous_hyper_parameter_ranges:default_continuous_hyper_parameter_ranges ->
  ?integer_hyper_parameter_ranges:default_integer_hyper_parameter_ranges ->
  unit ->
  default_hyper_parameter_ranges

val make_algorithm :
  ?last_updated_date_time:date ->
  ?creation_date_time:date ->
  ?role_arn:arn ->
  ?training_input_mode:training_input_mode ->
  ?default_resource_config:resource_config ->
  ?default_hyper_parameter_ranges:default_hyper_parameter_ranges ->
  ?default_hyper_parameters:hyper_parameters ->
  ?algorithm_image:algorithm_image ->
  ?algorithm_arn:arn ->
  ?name:name ->
  unit ->
  algorithm

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

val make_delete_dataset_request : dataset_arn:arn -> unit -> delete_dataset_request

val make_delete_dataset_group_request :
  dataset_group_arn:arn -> unit -> delete_dataset_group_request

val make_delete_campaign_request : campaign_arn:arn -> unit -> delete_campaign_request

val make_create_solution_version_response :
  ?solution_version_arn:arn -> unit -> create_solution_version_response

val make_create_solution_version_request :
  ?tags:tags ->
  ?training_mode:training_mode ->
  ?name:name ->
  solution_arn:arn ->
  unit ->
  create_solution_version_request

val make_create_solution_response : ?solution_arn:arn -> unit -> create_solution_response

val make_create_solution_request :
  ?tags:tags ->
  ?solution_config:solution_config ->
  ?event_type:event_type ->
  ?recipe_arn:arn ->
  ?perform_incremental_update:perform_incremental_update ->
  ?perform_auto_training:perform_auto_training ->
  ?perform_auto_m_l:perform_auto_m_l ->
  ?perform_hp_o:boolean_ ->
  dataset_group_arn:arn ->
  name:name ->
  unit ->
  create_solution_request

val make_create_schema_response : ?schema_arn:arn -> unit -> create_schema_response

val make_create_schema_request :
  ?domain:domain -> schema:avro_schema -> name:name -> unit -> create_schema_request

val make_create_recommender_response : ?recommender_arn:arn -> unit -> create_recommender_response

val make_create_recommender_request :
  ?tags:tags ->
  ?recommender_config:recommender_config ->
  recipe_arn:arn ->
  dataset_group_arn:arn ->
  name:name ->
  unit ->
  create_recommender_request

val make_create_metric_attribution_response :
  ?metric_attribution_arn:arn -> unit -> create_metric_attribution_response

val make_create_metric_attribution_request :
  metrics_output_config:metric_attribution_output ->
  metrics:metric_attributes ->
  dataset_group_arn:arn ->
  name:name ->
  unit ->
  create_metric_attribution_request

val make_create_filter_response : ?filter_arn:arn -> unit -> create_filter_response

val make_create_filter_request :
  ?tags:tags ->
  filter_expression:filter_expression ->
  dataset_group_arn:arn ->
  name:name ->
  unit ->
  create_filter_request

val make_create_event_tracker_response :
  ?tracking_id:tracking_id -> ?event_tracker_arn:arn -> unit -> create_event_tracker_response

val make_create_event_tracker_request :
  ?tags:tags -> dataset_group_arn:arn -> name:name -> unit -> create_event_tracker_request

val make_create_dataset_response : ?dataset_arn:arn -> unit -> create_dataset_response

val make_create_dataset_request :
  ?tags:tags ->
  dataset_type:dataset_type ->
  dataset_group_arn:arn ->
  schema_arn:arn ->
  name:name ->
  unit ->
  create_dataset_request

val make_create_dataset_import_job_response :
  ?dataset_import_job_arn:arn -> unit -> create_dataset_import_job_response

val make_create_dataset_import_job_request :
  ?publish_attribution_metrics_to_s3:boolean_ ->
  ?import_mode:import_mode ->
  ?tags:tags ->
  ?role_arn:role_arn ->
  data_source:data_source ->
  dataset_arn:arn ->
  job_name:name ->
  unit ->
  create_dataset_import_job_request

val make_create_dataset_group_response :
  ?domain:domain -> ?dataset_group_arn:arn -> unit -> create_dataset_group_response

val make_create_dataset_group_request :
  ?tags:tags ->
  ?domain:domain ->
  ?kms_key_arn:kms_key_arn ->
  ?role_arn:role_arn ->
  name:name ->
  unit ->
  create_dataset_group_request

val make_create_dataset_export_job_response :
  ?dataset_export_job_arn:arn -> unit -> create_dataset_export_job_response

val make_create_dataset_export_job_request :
  ?tags:tags ->
  ?ingestion_mode:ingestion_mode ->
  job_output:dataset_export_job_output ->
  role_arn:role_arn ->
  dataset_arn:arn ->
  job_name:name ->
  unit ->
  create_dataset_export_job_request

val make_create_data_deletion_job_response :
  ?data_deletion_job_arn:arn -> unit -> create_data_deletion_job_response

val make_create_data_deletion_job_request :
  ?tags:tags ->
  role_arn:role_arn ->
  data_source:data_source ->
  dataset_group_arn:arn ->
  job_name:name ->
  unit ->
  create_data_deletion_job_request

val make_create_campaign_response : ?campaign_arn:arn -> unit -> create_campaign_response

val make_create_campaign_request :
  ?tags:tags ->
  ?campaign_config:campaign_config ->
  ?min_provisioned_tp_s:transactions_per_second ->
  solution_version_arn:arn ->
  name:name ->
  unit ->
  create_campaign_request

val make_create_batch_segment_job_response :
  ?batch_segment_job_arn:arn -> unit -> create_batch_segment_job_response

val make_create_batch_segment_job_request :
  ?tags:tags ->
  ?num_results:num_batch_results ->
  ?filter_arn:arn ->
  role_arn:role_arn ->
  job_output:batch_segment_job_output ->
  job_input:batch_segment_job_input ->
  solution_version_arn:arn ->
  job_name:name ->
  unit ->
  create_batch_segment_job_request

val make_create_batch_inference_job_response :
  ?batch_inference_job_arn:arn -> unit -> create_batch_inference_job_response

val make_create_batch_inference_job_request :
  ?theme_generation_config:theme_generation_config ->
  ?batch_inference_job_mode:batch_inference_job_mode ->
  ?tags:tags ->
  ?batch_inference_job_config:batch_inference_job_config ->
  ?num_results:num_batch_results ->
  ?filter_arn:arn ->
  role_arn:role_arn ->
  job_output:batch_inference_job_output ->
  job_input:batch_inference_job_input ->
  solution_version_arn:arn ->
  job_name:name ->
  unit ->
  create_batch_inference_job_request
