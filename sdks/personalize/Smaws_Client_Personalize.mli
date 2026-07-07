(** Personalize client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module CreateBatchInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_batch_inference_job_request ->
    ( create_batch_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_batch_inference_job_request ->
    ( create_batch_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates batch recommendations based on a list of items or users stored in Amazon S3 and \
   exports the recommendations to an Amazon S3 bucket.\n\n\
  \ To generate batch recommendations, specify the ARN of a solution version and an Amazon S3 URI \
   for the input and output data. For user personalization, popular items, and personalized \
   ranking solutions, the batch inference job generates a list of recommended items for each user \
   ID in the input file. For related items solutions, the job generates a list of recommended \
   items for each item ID in the input file.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/getting-batch-recommendations.html}Creating \
   a batch inference job }.\n\
  \  \n\
  \    If you use the Similar-Items recipe, Amazon Personalize can add descriptive themes to batch \
   recommendations. To generate themes, set the job's mode to [THEME_GENERATION] and specify the \
   name of the field that contains item names in the input data.\n\
  \   \n\
  \     For more information about generating themes, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/themed-batch-recommendations.html}Batch \
   recommendations with themes from Content Generator }. \n\
  \    \n\
  \     You can't get batch recommendations with the Trending-Now or Next-Best-Action recipes.\n\
  \     "]

module CreateBatchSegmentJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_batch_segment_job_request ->
    ( create_batch_segment_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_batch_segment_job_request ->
    ( create_batch_segment_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a batch segment job. The operation can handle up to 50 million records and the input \
   file must be in JSON format. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/recommendations-batch.html}Getting batch \
   recommendations and user segments}.\n"]

module CreateCampaign : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_campaign_request ->
    ( create_campaign_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_campaign_request ->
    ( create_campaign_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "  You incur campaign costs while it is active. To avoid unnecessary costs, make sure to delete \
   the campaign when you are finished. For information about campaign costs, see \
   {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize pricing}.\n\
  \ \n\
  \   Creates a campaign that deploys a solution version. When a client calls the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   and \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetPersonalizedRanking.html}GetPersonalizedRanking} \
   APIs, a campaign is specified in the request.\n\
  \   \n\
  \     {b Minimum Provisioned TPS and Auto-Scaling} \n\
  \    \n\
  \       A high [minProvisionedTPS] will increase your cost. We recommend starting with 1 for \
   [minProvisionedTPS] (the default). Track your usage using Amazon CloudWatch metrics, and \
   increase the [minProvisionedTPS] as necessary.\n\
  \      \n\
  \         When you create an Amazon Personalize campaign, you can specify the minimum \
   provisioned transactions per second ([minProvisionedTPS]) for the campaign. This is the \
   baseline transaction throughput for the campaign provisioned by Amazon Personalize. It sets the \
   minimum billing charge for the campaign while it is active. A transaction is a single \
   [GetRecommendations] or [GetPersonalizedRanking] request. The default [minProvisionedTPS] is 1.\n\
  \        \n\
  \          If your TPS increases beyond the [minProvisionedTPS], Amazon Personalize auto-scales \
   the provisioned capacity up and down, but never below [minProvisionedTPS]. There's a short time \
   delay while the capacity is increased that might cause loss of transactions. When your traffic \
   reduces, capacity returns to the [minProvisionedTPS]. \n\
  \         \n\
  \          You are charged for the the minimum provisioned TPS or, if your requests exceed the \
   [minProvisionedTPS], the actual TPS. The actual TPS is the total number of recommendation \
   requests you make. We recommend starting with a low [minProvisionedTPS], track your usage using \
   Amazon CloudWatch metrics, and then increase the [minProvisionedTPS] as necessary.\n\
  \          \n\
  \           For more information about campaign costs, see \
   {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize pricing}.\n\
  \           \n\
  \             {b Status} \n\
  \            \n\
  \             A campaign can be in one of the following states:\n\
  \             \n\
  \              {ul\n\
  \                    {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                        \n\
  \                         }\n\
  \                    {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \                        \n\
  \                         }\n\
  \                    }\n\
  \   To get the campaign status, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign}.\n\
  \   \n\
  \     Wait until the [status] of the campaign is [ACTIVE] before asking the campaign for \
   recommendations.\n\
  \     \n\
  \        {b Related APIs} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html}ListCampaigns} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateCampaign.html}UpdateCampaign} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteCampaign.html}DeleteCampaign} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateDataDeletionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_deletion_job_request ->
    ( create_data_deletion_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_deletion_job_request ->
    ( create_data_deletion_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a batch job that deletes all references to specific users from an Amazon Personalize \
   dataset group in batches. You specify the users to delete in a CSV file of userIds in an Amazon \
   S3 bucket. After a job completes, Amazon Personalize no longer trains on the users\226\128\153 \
   data and no longer considers the users when generating user segments. For more information \
   about creating a data deletion job, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/delete-records.html}Deleting users}.\n\n\
  \ {ul\n\
  \       {-  Your input file must be a CSV file with a single USER_ID column that lists the users \
   IDs. For more information about preparing the CSV file, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/prepare-deletion-input-file.html}Preparing \
   your data deletion file and uploading it to Amazon S3}.\n\
  \           \n\
  \            }\n\
  \       {-  To give Amazon Personalize permission to access your input CSV file of userIds, you \
   must specify an IAM service role that has permission to read from the data source. This role \
   needs [GetObject] and [ListBucket] permissions for the bucket and its content. These \
   permissions are the same as importing data. For information on granting access to your Amazon \
   S3 bucket, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html}Giving \
   Amazon Personalize Access to Amazon S3 Resources}. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \    After you create a job, it can take up to a day to delete all references to the users from \
   datasets and models. Until the job completes, Amazon Personalize continues to use the data when \
   training. And if you use a User Segmentation recipe, the users might appear in user segments. \n\
  \   \n\
  \     {b Status} \n\
  \    \n\
  \     A data deletion job can have one of the following statuses:\n\
  \     \n\
  \      {ul\n\
  \            {-  PENDING > IN_PROGRESS > COMPLETED -or- FAILED\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   To get the status of the data deletion job, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataDeletionJob.html}DescribeDataDeletionJob} \
   API operation and specify the Amazon Resource Name (ARN) of the job. If the status is FAILED, \
   the response includes a [failureReason] key, which describes why the job failed.\n\
  \   \n\
  \     {b Related APIs} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListDataDeletionJobs.html}ListDataDeletionJobs} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataDeletionJob.html}DescribeDataDeletionJob} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module CreateDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_request ->
    ( create_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an empty dataset and adds it to the specified dataset group. Use \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob} \
   to import your training data to a dataset.\n\n\
  \ There are 5 types of datasets:\n\
  \ \n\
  \  {ul\n\
  \        {-  Item interactions\n\
  \            \n\
  \             }\n\
  \        {-  Items\n\
  \            \n\
  \             }\n\
  \        {-  Users\n\
  \            \n\
  \             }\n\
  \        {-  Action interactions\n\
  \            \n\
  \             }\n\
  \        {-  Actions\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Each dataset type has an associated schema with required field types. Only the [Item \
   interactions] dataset is required in order to train a model (also referred to as creating a \
   solution).\n\
  \   \n\
  \    A dataset can be in one of the following states:\n\
  \    \n\
  \     {ul\n\
  \           {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \               \n\
  \                }\n\
  \           {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To get the status of the dataset, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html}DescribeDataset}.\n\
  \   \n\
  \     {b Related APIs} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasets.html}ListDatasets} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDataset.html}DescribeDataset} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteDataset.html}DeleteDataset} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module CreateDatasetExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_export_job_request ->
    ( create_dataset_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_export_job_request ->
    ( create_dataset_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a job that exports data from your dataset to an Amazon S3 bucket. To allow Amazon \
   Personalize to export the training data, you must specify an service-linked IAM role that gives \
   Amazon Personalize [PutObject] permissions for your Amazon S3 bucket. For information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/export-data.html}Exporting a dataset} in \
   the Amazon Personalize developer guide. \n\n\
  \  {b Status} \n\
  \ \n\
  \  A dataset export job can be in one of the following states:\n\
  \  \n\
  \   {ul\n\
  \         {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    To get the status of the export job, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetExportJob.html}DescribeDatasetExportJob}, \
   and specify the Amazon Resource Name (ARN) of the dataset export job. The dataset export is \
   complete when the status shows as ACTIVE. If the status shows as CREATE FAILED, the response \
   includes a [failureReason] key, which describes why the job failed. \n\
  \   "]

module CreateDatasetGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_group_request ->
    ( create_dataset_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_dataset_group_request ->
    ( create_dataset_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an empty dataset group. A dataset group is a container for Amazon Personalize \
   resources. A dataset group can contain at most three datasets, one for each type of dataset:\n\n\
  \ {ul\n\
  \       {-  Item interactions\n\
  \           \n\
  \            }\n\
  \       {-  Items\n\
  \           \n\
  \            }\n\
  \       {-  Users\n\
  \           \n\
  \            }\n\
  \       {-  Actions\n\
  \           \n\
  \            }\n\
  \       {-  Action interactions\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    A dataset group can be a Domain dataset group, where you specify a domain and use \
   pre-configured resources like recommenders, or a Custom dataset group, where you use custom \
   resources, such as a solution with a solution version, that you deploy with a campaign. If you \
   start with a Domain dataset group, you can still add custom resources such as solutions and \
   solution versions trained with recipes for custom use cases and deployed with campaigns. \n\
  \   \n\
  \    A dataset group can be in one of the following states:\n\
  \    \n\
  \     {ul\n\
  \           {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \               \n\
  \                }\n\
  \           {-  DELETE PENDING\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   To get the status of the dataset group, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup}. \
   If the status shows as CREATE FAILED, the response includes a [failureReason] key, which \
   describes why the creation failed.\n\
  \   \n\
  \     You must wait until the [status] of the dataset group is [ACTIVE] before adding a dataset \
   to the group.\n\
  \     \n\
  \       You can specify an Key Management Service (KMS) key to encrypt the datasets in the \
   group. If you specify a KMS key, you must also include an Identity and Access Management (IAM) \
   role that has permission to access the key.\n\
  \       \n\
  \         {b APIs that require a dataset group ARN in the request} \n\
  \        \n\
  \         {ul\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset} \n\
  \                   \n\
  \                    }\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html}CreateEventTracker} \n\
  \                   \n\
  \                    }\n\
  \               {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \    {b Related APIs} \n\
  \   \n\
  \    {ul\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasetGroups.html}ListDatasetGroups} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetGroup.html}DescribeDatasetGroup} \n\
  \              \n\
  \               }\n\
  \          {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteDatasetGroup.html}DeleteDatasetGroup} \n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module CreateDatasetImportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
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
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
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
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a job that imports training data from your data source (an Amazon S3 bucket) to an \
   Amazon Personalize dataset. To allow Amazon Personalize to import the training data, you must \
   specify an IAM service role that has permission to read from the data source, as Amazon \
   Personalize makes a copy of your data and processes it internally. For information on granting \
   access to your Amazon S3 bucket, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/granting-personalize-s3-access.html}Giving \
   Amazon Personalize Access to Amazon S3 Resources}. \n\n\
  \ If you already created a recommender or deployed a custom solution version with a campaign, \
   how new bulk records influence recommendations depends on the domain use case or recipe that \
   you use. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/how-new-data-influences-recommendations.html}How \
   new data influences real-time recommendations}.\n\
  \ \n\
  \   By default, a dataset import job replaces any existing data in the dataset that you imported \
   in bulk. To add new records without replacing existing data, specify INCREMENTAL for the import \
   mode in the CreateDatasetImportJob operation.\n\
  \   \n\
  \      {b Status} \n\
  \     \n\
  \      A dataset import job can be in one of the following states:\n\
  \      \n\
  \       {ul\n\
  \             {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   To get the status of the import job, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html}DescribeDatasetImportJob}, \
   providing the Amazon Resource Name (ARN) of the dataset import job. The dataset import is \
   complete when the status shows as ACTIVE. If the status shows as CREATE FAILED, the response \
   includes a [failureReason] key, which describes why the job failed.\n\
  \   \n\
  \     Importing takes time. You must wait until the status shows as ACTIVE before training a \
   model using the dataset.\n\
  \     \n\
  \        {b Related APIs} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListDatasetImportJobs.html}ListDatasetImportJobs} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeDatasetImportJob.html}DescribeDatasetImportJob} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateEventTracker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_event_tracker_request ->
    ( create_event_tracker_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_event_tracker_request ->
    ( create_event_tracker_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an event tracker that you use when adding event data to a specified dataset group using \
   the {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html}PutEvents} \
   API.\n\n\
  \  Only one event tracker can be associated with a dataset group. You will get an error if you \
   call [CreateEventTracker] using the same dataset group as an existing event tracker.\n\
  \  \n\
  \    When you create an event tracker, the response includes a tracking ID, which you pass as a \
   parameter when you use the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UBS_PutEvents.html}PutEvents} \
   operation. Amazon Personalize then appends the event data to the Item interactions dataset of \
   the dataset group you specify in your event tracker. \n\
  \    \n\
  \     The event tracker can be in one of the following states:\n\
  \     \n\
  \      {ul\n\
  \            {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                \n\
  \                 }\n\
  \            {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   To get the status of the event tracker, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html}DescribeEventTracker}.\n\
  \   \n\
  \     The event tracker must be in the ACTIVE state before using the tracking ID.\n\
  \     \n\
  \        {b Related APIs} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListEventTrackers.html}ListEventTrackers} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeEventTracker.html}DescribeEventTracker} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteEventTracker.html}DeleteEventTracker} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_filter_request ->
    ( create_filter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_filter_request ->
    ( create_filter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a recommendation filter. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/filter.html}Filtering recommendations and \
   user segments}.\n"]

module CreateMetricAttribution : sig
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
    create_metric_attribution_request ->
    ( create_metric_attribution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_metric_attribution_request ->
    ( create_metric_attribution_response Smaws_Lib.Response.t,
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
  "Creates a metric attribution. A metric attribution creates reports on the data that you import \
   into Amazon Personalize. Depending on how you imported the data, you can view reports in Amazon \
   CloudWatch or Amazon S3. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/measuring-recommendation-impact.html}Measuring \
   impact of recommendations}.\n"]

module CreateRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_recommender_request ->
    ( create_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_recommender_request ->
    ( create_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a recommender with the recipe (a Domain dataset group use case) you specify. You create \
   recommenders for a Domain dataset group and specify the recommender's Amazon Resource Name \
   (ARN) when you make a \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   request. \n\n\
  \  {b Minimum recommendation requests per second} \n\
  \ \n\
  \   A high [minRecommendationRequestsPerSecond] will increase your bill. We recommend starting \
   with 1 for [minRecommendationRequestsPerSecond] (the default). Track your usage using Amazon \
   CloudWatch metrics, and increase the [minRecommendationRequestsPerSecond] as necessary.\n\
  \   \n\
  \     When you create a recommender, you can configure the recommender's minimum recommendation \
   requests per second. The minimum recommendation requests per second \
   ([minRecommendationRequestsPerSecond]) specifies the baseline recommendation request throughput \
   provisioned by Amazon Personalize. The default minRecommendationRequestsPerSecond is [1]. A \
   recommendation request is a single [GetRecommendations] operation. Request throughput is \
   measured in requests per second and Amazon Personalize uses your requests per second to derive \
   your requests per hour and the price of your recommender usage. \n\
  \     \n\
  \       If your requests per second increases beyond [minRecommendationRequestsPerSecond], \
   Amazon Personalize auto-scales the provisioned capacity up and down, but never below \
   [minRecommendationRequestsPerSecond]. There's a short time delay while the capacity is \
   increased that might cause loss of requests.\n\
  \      \n\
  \        Your bill is the greater of either the minimum requests per hour (based on \
   minRecommendationRequestsPerSecond) or the actual number of requests. The actual request \
   throughput used is calculated as the average requests/second within a one-hour window. We \
   recommend starting with the default [minRecommendationRequestsPerSecond], track your usage \
   using Amazon CloudWatch metrics, and then increase the [minRecommendationRequestsPerSecond] as \
   necessary. \n\
  \       \n\
  \         {b Status} \n\
  \        \n\
  \         A recommender can be in one of the following states:\n\
  \         \n\
  \          {ul\n\
  \                {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                    \n\
  \                     }\n\
  \                {-  STOP PENDING > STOP IN_PROGRESS > INACTIVE > START PENDING > START \
   IN_PROGRESS > ACTIVE\n\
  \                    \n\
  \                     }\n\
  \                {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \                    \n\
  \                     }\n\
  \                }\n\
  \   To get the recommender status, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html}DescribeRecommender}.\n\
  \   \n\
  \     Wait until the [status] of the recommender is [ACTIVE] before asking the recommender for \
   recommendations.\n\
  \     \n\
  \        {b Related APIs} \n\
  \       \n\
  \        {ul\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListRecommenders.html}ListRecommenders} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html}DescribeRecommender} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateRecommender.html}UpdateRecommender} \n\
  \                  \n\
  \                   }\n\
  \              {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteRecommender.html}DeleteRecommender} \n\
  \                  \n\
  \                   }\n\
  \              }\n\
  \  "]

module CreateSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_schema_request ->
    ( create_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_schema_request ->
    ( create_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Personalize schema from the specified schema string. The schema you create \
   must be in Avro JSON format.\n\n\
  \ Amazon Personalize recognizes three schema variants. Each schema is associated with a dataset \
   type and has a set of required field and keywords. If you are creating a schema for a dataset \
   in a Domain dataset group, you provide the domain of the Domain dataset group. You specify a \
   schema when you call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n\
  \ \n\
  \   {b Related APIs} \n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSchemas.html}ListSchemas} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSchema.html}DescribeSchema} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSchema.html}DeleteSchema} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module CreateSolution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_solution_request ->
    ( create_solution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_solution_request ->
    ( create_solution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " By default, all new solutions use automatic training. With automatic training, you incur \
   training costs while your solution is active. To avoid unnecessary costs, when you are finished \
   you can {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateSolution.html}update the \
   solution} to turn off automatic training. For information about training costs, see \
   {{:https://aws.amazon.com/personalize/pricing/}Amazon Personalize pricing}.\n\
  \ \n\
  \   Creates the configuration for training a model (creating a solution version). This \
   configuration includes the recipe to use for model training and optional training \
   configuration, such as columns to use in training and feature transformation parameters. For \
   more information about configuring a solution, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/customizing-solution-config.html}Creating \
   and configuring a solution}. \n\
  \   \n\
  \     By default, new solutions use automatic training to create solution versions every 7 days. \
   You can change the training frequency. Automatic solution version creation starts within one \
   hour after the solution is ACTIVE. If you manually create a solution version within the hour, \
   the solution skips the first automatic training. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/solution-config-auto-training.html}Configuring \
   automatic training}.\n\
  \    \n\
  \      To turn off automatic training, set [performAutoTraining] to false. If you turn off \
   automatic training, you must manually create a solution version by calling the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolutionVersion.html}CreateSolutionVersion} \
   operation.\n\
  \     \n\
  \      After training starts, you can get the solution version's Amazon Resource Name (ARN) with \
   the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html}ListSolutionVersions} \
   API operation. To get its status, use the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion}. \n\
  \      \n\
  \       After training completes you can evaluate model accuracy by calling \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_GetSolutionMetrics.html}GetSolutionMetrics}. \
   When you are satisfied with the solution version, you deploy it using \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}. \
   The campaign provides recommendations to a client through the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   API.\n\
  \       \n\
  \         Amazon Personalize doesn't support configuring the [hpoObjective] for solution \
   hyperparameter optimization at this time.\n\
  \         \n\
  \            {b Status} \n\
  \           \n\
  \            A solution can be in one of the following states:\n\
  \            \n\
  \             {ul\n\
  \                   {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \                       \n\
  \                        }\n\
  \                   {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \                       \n\
  \                        }\n\
  \                   }\n\
  \   To get the status of the solution, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution}. \
   If you use manual training, the status must be ACTIVE before you call [CreateSolutionVersion].\n\
  \   \n\
  \     {b Related APIs} \n\
  \    \n\
  \     {ul\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_UpdateSolution.html}UpdateSolution} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutions.html}ListSolutions} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolutionVersion.html}CreateSolutionVersion} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution} \n\
  \               \n\
  \                }\n\
  \           {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSolution.html}DeleteSolution} \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html}ListSolutionVersions} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module CreateSolutionVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_solution_version_request ->
    ( create_solution_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_solution_version_request ->
    ( create_solution_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Trains or retrains an active solution in a Custom dataset group. A solution is created using \
   the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \
   operation and must be in the ACTIVE state before calling [CreateSolutionVersion]. A new version \
   of the solution is created every time you call this operation.\n\n\
  \  {b Status} \n\
  \ \n\
  \  A solution version can be in one of the following states:\n\
  \  \n\
  \   {ul\n\
  \         {-  CREATE PENDING\n\
  \             \n\
  \              }\n\
  \         {-  CREATE IN_PROGRESS\n\
  \             \n\
  \              }\n\
  \         {-  ACTIVE\n\
  \             \n\
  \              }\n\
  \         {-  CREATE FAILED\n\
  \             \n\
  \              }\n\
  \         {-  CREATE STOPPING\n\
  \             \n\
  \              }\n\
  \         {-  CREATE STOPPED\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   To get the status of the version, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion}. \
   Wait until the status shows as ACTIVE before calling [CreateCampaign].\n\
  \   \n\
  \    If the status shows as CREATE FAILED, the response includes a [failureReason] key, which \
   describes why the job failed.\n\
  \    \n\
  \      {b Related APIs} \n\
  \     \n\
  \      {ul\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutionVersions.html}ListSolutionVersions} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolutionVersion.html}DescribeSolutionVersion} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListSolutions.html}ListSolutions} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution} \n\
  \                \n\
  \                 }\n\
  \            {-   \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DeleteSolution.html}DeleteSolution} \n\
  \                \n\
  \                 }\n\
  \            }\n\
  \  "]

module DeleteCampaign : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_campaign_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_campaign_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes a campaign by deleting the solution deployment. The solution that the campaign is based \
   on is not deleted and can be redeployed when needed. A deleted campaign can no longer be \
   specified in a \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   request. For information on creating campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}.\n"]

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
  "Deletes a dataset. You can't delete a dataset if an associated [DatasetImportJob] or \
   [SolutionVersion] is in the CREATE PENDING or IN PROGRESS state. For more information about \
   deleting datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/delete-dataset.html}Deleting a dataset}. \n"]

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
  "Deletes a dataset group. Before you delete a dataset group, you must delete the following:\n\n\
  \ {ul\n\
  \       {-  All associated event trackers.\n\
  \           \n\
  \            }\n\
  \       {-  All associated solutions.\n\
  \           \n\
  \            }\n\
  \       {-  All datasets in the dataset group.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DeleteEventTracker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_event_tracker_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_event_tracker_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the event tracker. Does not delete the dataset from the dataset group. For more \
   information on event trackers, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html}CreateEventTracker}.\n"]

module DeleteFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_filter_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a filter.\n"]

module DeleteMetricAttribution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_attribution_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_metric_attribution_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a metric attribution.\n"]

module DeleteRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_recommender_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_recommender_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deactivates and removes a recommender. A deleted recommender can no longer be specified in a \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   request.\n"]

module DeleteSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_schema_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a schema. Before deleting a schema, you must delete all datasets referencing the \
   schema. For more information on schemas, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html}CreateSchema}.\n"]

module DeleteSolution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_solution_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_solution_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes all versions of a solution and the [Solution] object itself. Before deleting a \
   solution, you must delete all campaigns based on the solution. To determine what campaigns are \
   using the solution, call \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_ListCampaigns.html}ListCampaigns} and \
   supply the Amazon Resource Name (ARN) of the solution. You can't delete a solution if an \
   associated [SolutionVersion] is in the CREATE PENDING or IN PROGRESS state. For more \
   information on solutions, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}.\n"]

module DescribeAlgorithm : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_algorithm_request ->
    ( describe_algorithm_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_algorithm_request ->
    ( describe_algorithm_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the given algorithm.\n"]

module DescribeBatchInferenceJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_inference_job_request ->
    ( describe_batch_inference_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_inference_job_request ->
    ( describe_batch_inference_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties of a batch inference job including name, Amazon Resource Name (ARN), \
   status, input and output configurations, and the ARN of the solution version used to generate \
   the recommendations.\n"]

module DescribeBatchSegmentJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_segment_job_request ->
    ( describe_batch_segment_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_segment_job_request ->
    ( describe_batch_segment_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the properties of a batch segment job including name, Amazon Resource Name (ARN), status, \
   input and output configurations, and the ARN of the solution version used to generate segments.\n"]

module DescribeCampaign : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_campaign_request ->
    ( describe_campaign_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_campaign_request ->
    ( describe_campaign_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the given campaign, including its status.\n\n\
  \ A campaign can be in one of the following states:\n\
  \ \n\
  \  {ul\n\
  \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \            \n\
  \             }\n\
  \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   When the [status] is [CREATE FAILED], the response includes the [failureReason] key, which \
   describes why.\n\
  \   \n\
  \    For more information on campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}.\n\
  \    "]

module DescribeDataDeletionJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_deletion_job_request ->
    ( describe_data_deletion_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_deletion_job_request ->
    ( describe_data_deletion_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the data deletion job created by \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataDeletionJob.html}CreateDataDeletionJob}, \
   including the job status.\n"]

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
  "Describes the given dataset. For more information on datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n"]

module DescribeDatasetExportJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_export_job_request ->
    ( describe_dataset_export_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_dataset_export_job_request ->
    ( describe_dataset_export_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the dataset export job created by \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html}CreateDatasetExportJob}, \
   including the export job status.\n"]

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
  "Describes the given dataset group. For more information on dataset groups, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup}.\n"]

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
  "Describes the dataset import job created by \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob}, \
   including the import job status.\n"]

module DescribeEventTracker : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_tracker_request ->
    ( describe_event_tracker_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_tracker_request ->
    ( describe_event_tracker_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes an event tracker. The response includes the [trackingId] and [status] of the event \
   tracker. For more information on event trackers, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html}CreateEventTracker}.\n"]

module DescribeFeatureTransformation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_feature_transformation_request ->
    ( describe_feature_transformation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_feature_transformation_request ->
    ( describe_feature_transformation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the given feature transformation.\n"]

module DescribeFilter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_filter_request ->
    ( describe_filter_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_filter_request ->
    ( describe_filter_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a filter's properties.\n"]

module DescribeMetricAttribution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_metric_attribution_request ->
    ( describe_metric_attribution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_metric_attribution_request ->
    ( describe_metric_attribution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a metric attribution.\n"]

module DescribeRecipe : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_recipe_request ->
    ( describe_recipe_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_recipe_request ->
    ( describe_recipe_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a recipe.\n\n\
  \ A recipe contains three items:\n\
  \ \n\
  \  {ul\n\
  \        {-  An algorithm that trains a model.\n\
  \            \n\
  \             }\n\
  \        {-  Hyperparameters that govern the training.\n\
  \            \n\
  \             }\n\
  \        {-  Feature transformation information for modifying the input data before training.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Amazon Personalize provides a set of predefined recipes. You specify a recipe when you \
   create a solution with the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \
   API. [CreateSolution] trains a model by using the algorithm in the specified recipe and a \
   training dataset. The solution, when deployed as a campaign, can provide recommendations using \
   the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_RS_GetRecommendations.html}GetRecommendations} \
   API.\n\
  \   "]

module DescribeRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_recommender_request ->
    ( describe_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_recommender_request ->
    ( describe_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the given recommender, including its status.\n\n\
  \ A recommender can be in one of the following states:\n\
  \ \n\
  \  {ul\n\
  \        {-  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \            \n\
  \             }\n\
  \        {-  STOP PENDING > STOP IN_PROGRESS > INACTIVE > START PENDING > START IN_PROGRESS > \
   ACTIVE\n\
  \            \n\
  \             }\n\
  \        {-  DELETE PENDING > DELETE IN_PROGRESS\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   When the [status] is [CREATE FAILED], the response includes the [failureReason] key, which \
   describes why.\n\
  \   \n\
  \    The [modelMetrics] key is null when the recommender is being created or deleted.\n\
  \    \n\
  \     For more information on recommenders, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateRecommender.html}CreateRecommender}.\n\
  \     "]

module DescribeSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_schema_request ->
    ( describe_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_schema_request ->
    ( describe_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a schema. For more information on schemas, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html}CreateSchema}.\n"]

module DescribeSolution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_solution_request ->
    ( describe_solution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_solution_request ->
    ( describe_solution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a solution. For more information on solutions, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}.\n"]

module DescribeSolutionVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_solution_version_request ->
    ( describe_solution_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_solution_version_request ->
    ( describe_solution_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a specific version of a solution. For more information on solutions, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution} \n"]

module GetSolutionMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_solution_metrics_request ->
    ( get_solution_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_solution_metrics_request ->
    ( get_solution_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the metrics for the specified solution version.\n"]

module ListBatchInferenceJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_batch_inference_jobs_request ->
    ( list_batch_inference_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_batch_inference_jobs_request ->
    ( list_batch_inference_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of the batch inference jobs that have been performed off of a solution version.\n"]

module ListBatchSegmentJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_batch_segment_jobs_request ->
    ( list_batch_segment_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_batch_segment_jobs_request ->
    ( list_batch_segment_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of the batch segment jobs that have been performed off of a solution version that \
   you specify.\n"]

module ListCampaigns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_campaigns_request ->
    ( list_campaigns_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_campaigns_request ->
    ( list_campaigns_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of campaigns that use the given solution. When a solution is not specified, all \
   the campaigns associated with the account are listed. The response provides the properties for \
   each campaign, including the Amazon Resource Name (ARN). For more information on campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateCampaign.html}CreateCampaign}.\n"]

module ListDataDeletionJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_deletion_jobs_request ->
    ( list_data_deletion_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_deletion_jobs_request ->
    ( list_data_deletion_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of data deletion jobs for a dataset group ordered by creation time, with the \
   most recent first. When a dataset group is not specified, all the data deletion jobs associated \
   with the account are listed. The response provides the properties for each job, including the \
   Amazon Resource Name (ARN). For more information on data deletion jobs, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/delete-records.html}Deleting users}.\n"]

module ListDatasetExportJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_export_jobs_request ->
    ( list_dataset_export_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_dataset_export_jobs_request ->
    ( list_dataset_export_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of dataset export jobs that use the given dataset. When a dataset is not \
   specified, all the dataset export jobs associated with the account are listed. The response \
   provides the properties for each dataset export job, including the Amazon Resource Name (ARN). \
   For more information on dataset export jobs, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetExportJob.html}CreateDatasetExportJob}. \
   For more information on datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n"]

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
  "Returns a list of dataset groups. The response provides the properties for each dataset group, \
   including the Amazon Resource Name (ARN). For more information on dataset groups, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetGroup.html}CreateDatasetGroup}.\n"]

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
  "Returns a list of dataset import jobs that use the given dataset. When a dataset is not \
   specified, all the dataset import jobs associated with the account are listed. The response \
   provides the properties for each dataset import job, including the Amazon Resource Name (ARN). \
   For more information on dataset import jobs, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDatasetImportJob.html}CreateDatasetImportJob}. \
   For more information on datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n"]

module ListDatasets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_datasets_request ->
    ( list_datasets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the list of datasets contained in the given dataset group. The response provides the \
   properties for each dataset, including the Amazon Resource Name (ARN). For more information on \
   datasets, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateDataset.html}CreateDataset}.\n"]

module ListEventTrackers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_event_trackers_request ->
    ( list_event_trackers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_event_trackers_request ->
    ( list_event_trackers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the list of event trackers associated with the account. The response provides the \
   properties for each event tracker, including the Amazon Resource Name (ARN) and tracking ID. \
   For more information on event trackers, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateEventTracker.html}CreateEventTracker}.\n"]

module ListFilters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_filters_request ->
    ( list_filters_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_filters_request ->
    ( list_filters_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all filters that belong to a given dataset group.\n"]

module ListMetricAttributionMetrics : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_metric_attribution_metrics_request ->
    ( list_metric_attribution_metrics_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_metric_attribution_metrics_request ->
    ( list_metric_attribution_metrics_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the metrics for the metric attribution.\n"]

module ListMetricAttributions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_metric_attributions_request ->
    ( list_metric_attributions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_metric_attributions_request ->
    ( list_metric_attributions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists metric attributions.\n"]

module ListRecipes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recipes_request ->
    ( list_recipes_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recipes_request ->
    ( list_recipes_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of available recipes. The response provides the properties for each recipe, \
   including the recipe's Amazon Resource Name (ARN).\n"]

module ListRecommenders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommenders_request ->
    ( list_recommenders_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommenders_request ->
    ( list_recommenders_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of recommenders in a given Domain dataset group. When a Domain dataset group is \
   not specified, all the recommenders associated with the account are listed. The response \
   provides the properties for each recommender, including the Amazon Resource Name (ARN). For \
   more information on recommenders, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateRecommender.html}CreateRecommender}.\n"]

module ListSchemas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_request ->
    ( list_schemas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_schemas_request ->
    ( list_schemas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the list of schemas associated with the account. The response provides the properties \
   for each schema, including the Amazon Resource Name (ARN). For more information on schemas, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSchema.html}CreateSchema}.\n"]

module ListSolutionVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_solution_versions_request ->
    ( list_solution_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_solution_versions_request ->
    ( list_solution_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of solution versions for the given solution. When a solution is not specified, \
   all the solution versions associated with the account are listed. The response provides the \
   properties for each solution version, including the Amazon Resource Name (ARN).\n"]

module ListSolutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `InvalidNextTokenException of invalid_next_token_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_solutions_request ->
    ( list_solutions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_solutions_request ->
    ( list_solutions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `InvalidNextTokenException of invalid_next_token_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of solutions in a given dataset group. When a dataset group is not specified, \
   all the solutions associated with the account are listed. The response provides the properties \
   for each solution, including the Amazon Resource Name (ARN). For more information on solutions, \
   see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_CreateSolution.html}CreateSolution}.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get a list of {{:https://docs.aws.amazon.com/personalize/latest/dg/tagging-resources.html}tags} \
   attached to a resource.\n"]

module StartRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_recommender_request ->
    ( start_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_recommender_request ->
    ( start_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a recommender that is INACTIVE. Starting a recommender does not create any new models, \
   but resumes billing and automatic retraining for the recommender.\n"]

module StopRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_recommender_request ->
    ( stop_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_recommender_request ->
    ( stop_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a recommender that is ACTIVE. Stopping a recommender halts billing and automatic \
   retraining for the recommender.\n"]

module StopSolutionVersionCreation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_solution_version_creation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_solution_version_creation_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops creating a solution version that is in a state of CREATE_PENDING or CREATE IN_PROGRESS. \n\n\
  \ Depending on the current state of the solution version, the solution version state changes as \
   follows:\n\
  \ \n\
  \  {ul\n\
  \        {-  CREATE_PENDING > CREATE_STOPPED\n\
  \            \n\
  \             or\n\
  \             \n\
  \              }\n\
  \        {-  CREATE_IN_PROGRESS > CREATE_STOPPING > CREATE_STOPPED\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   You are billed for all of the training completed up until you stop the solution version \
   creation. You cannot resume creating a solution version once it has been stopped.\n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Add a list of tags to a resource.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagKeysException of too_many_tag_keys_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagKeysException of too_many_tag_keys_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagKeysException of too_many_tag_keys_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified tags that are attached to a resource. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/tags-remove.html}Removing tags from Amazon \
   Personalize resources}.\n"]

module UpdateCampaign : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_campaign_request ->
    ( update_campaign_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_campaign_request ->
    ( update_campaign_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Updates a campaign to deploy a retrained solution version with an existing campaign, change \
   your campaign's [minProvisionedTPS], or modify your campaign's configuration. For example, you \
   can set [enableMetadataWithRecommendations] to true for an existing campaign.\n\n\
  \  To update a campaign to start automatically using the latest solution version, specify the \
   following:\n\
  \ \n\
  \  {ul\n\
  \        {-  For the [SolutionVersionArn] parameter, specify the Amazon Resource Name (ARN) of \
   your solution in [SolutionArn/$LATEST] format. \n\
  \            \n\
  \             }\n\
  \        {-   In the [campaignConfig], set [syncWithLatestSolutionVersion] to [true]. \n\
  \            \n\
  \             }\n\
  \        }\n\
  \   To update a campaign, the campaign status must be ACTIVE or CREATE FAILED. Check the \
   campaign status using the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeCampaign.html}DescribeCampaign} \
   operation.\n\
  \   \n\
  \     You can still get recommendations from a campaign while an update is in progress. The \
   campaign will use the previous solution version and campaign configuration to generate \
   recommendations until the latest campaign update status is [Active]. \n\
  \     \n\
  \       For more information about updating a campaign, including code samples, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/update-campaigns.html}Updating a \
   campaign}. For more information about campaigns, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/campaigns.html}Creating a campaign}.\n\
  \       "]

module UpdateDataset : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_dataset_request ->
    ( update_dataset_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_dataset_request ->
    ( update_dataset_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update a dataset to replace its schema with a new or existing one. For more information, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/updating-dataset-schema.html}Replacing a \
   dataset's schema}. \n"]

module UpdateMetricAttribution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_metric_attribution_request ->
    ( update_metric_attribution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_metric_attribution_request ->
    ( update_metric_attribution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a metric attribution.\n"]

module UpdateRecommender : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_recommender_request ->
    ( update_recommender_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_recommender_request ->
    ( update_recommender_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the recommender to modify the recommender configuration. If you update the recommender \
   to modify the columns used in training, Amazon Personalize automatically starts a full \
   retraining of the models backing your recommender. While the update completes, you can still \
   get recommendations from the recommender. The recommender uses the previous configuration until \
   the update completes. To track the status of this update, use the [latestRecommenderUpdate] \
   returned in the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeRecommender.html}DescribeRecommender} \
   operation. \n"]

(** {1:Serialization and Deserialization} *)
module UpdateSolution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_solution_request ->
    ( update_solution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_solution_request ->
    ( update_solution_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an Amazon Personalize solution to use a different automatic training configuration. \
   When you update a solution, you can change whether the solution uses automatic training, and \
   you can change the training frequency. For more information about updating a solution, see \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/updating-solution.html}Updating a \
   solution}.\n\n\
  \ A solution update can be in one of the following states:\n\
  \ \n\
  \  CREATE PENDING > CREATE IN_PROGRESS > ACTIVE -or- CREATE FAILED\n\
  \  \n\
  \   To get the status of a solution update, call the \
   {{:https://docs.aws.amazon.com/personalize/latest/dg/API_DescribeSolution.html}DescribeSolution} \
   API operation and find the status in the [latestSolutionUpdate]. \n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
