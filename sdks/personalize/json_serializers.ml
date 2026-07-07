open Smaws_Lib.Json.SerializeHelpers
open Types

let arn_to_yojson = string_to_yojson

let update_solution_response_to_yojson (x : update_solution_response) =
  assoc_to_yojson [ ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn) ]

let perform_auto_training_to_yojson = bool_to_yojson
let perform_incremental_update_to_yojson = bool_to_yojson
let scheduling_expression_to_yojson = string_to_yojson

let auto_training_config_to_yojson (x : auto_training_config) =
  assoc_to_yojson
    [
      ( "schedulingExpression",
        option_to_yojson scheduling_expression_to_yojson x.scheduling_expression );
    ]

let event_type_to_yojson = string_to_yojson
let event_type_threshold_value_to_yojson = double_to_yojson
let event_type_weight_to_yojson = double_to_yojson

let event_parameters_to_yojson (x : event_parameters) =
  assoc_to_yojson
    [
      ("weight", option_to_yojson event_type_weight_to_yojson x.weight);
      ( "eventValueThreshold",
        option_to_yojson event_type_threshold_value_to_yojson x.event_value_threshold );
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
    ]

let event_parameters_list_to_yojson tree = list_to_yojson event_parameters_to_yojson tree

let events_config_to_yojson (x : events_config) =
  assoc_to_yojson
    [
      ( "eventParametersList",
        option_to_yojson event_parameters_list_to_yojson x.event_parameters_list );
    ]

let solution_update_config_to_yojson (x : solution_update_config) =
  assoc_to_yojson
    [
      ("eventsConfig", option_to_yojson events_config_to_yojson x.events_config);
      ("autoTrainingConfig", option_to_yojson auto_training_config_to_yojson x.auto_training_config);
    ]

let update_solution_request_to_yojson (x : update_solution_request) =
  assoc_to_yojson
    [
      ( "solutionUpdateConfig",
        option_to_yojson solution_update_config_to_yojson x.solution_update_config );
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ( "performAutoTraining",
        option_to_yojson perform_auto_training_to_yojson x.perform_auto_training );
      ("solutionArn", Some (arn_to_yojson x.solution_arn));
    ]

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_recommender_response_to_yojson (x : update_recommender_response) =
  assoc_to_yojson [ ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn) ]

let parameter_value_to_yojson = string_to_yojson
let parameter_name_to_yojson = string_to_yojson

let hyper_parameters_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let transactions_per_second_to_yojson = int_to_yojson
let column_name_to_yojson = string_to_yojson
let column_names_list_to_yojson tree = list_to_yojson column_name_to_yojson tree
let dataset_type_to_yojson = string_to_yojson

let excluded_dataset_columns_to_yojson tree =
  map_to_yojson dataset_type_to_yojson column_names_list_to_yojson tree

let included_dataset_columns_to_yojson tree =
  map_to_yojson dataset_type_to_yojson column_names_list_to_yojson tree

let training_data_config_to_yojson (x : training_data_config) =
  assoc_to_yojson
    [
      ( "includedDatasetColumns",
        option_to_yojson included_dataset_columns_to_yojson x.included_dataset_columns );
      ( "excludedDatasetColumns",
        option_to_yojson excluded_dataset_columns_to_yojson x.excluded_dataset_columns );
    ]

let boolean__to_yojson = bool_to_yojson

let recommender_config_to_yojson (x : recommender_config) =
  assoc_to_yojson
    [
      ( "enableMetadataWithRecommendations",
        option_to_yojson boolean__to_yojson x.enable_metadata_with_recommendations );
      ("trainingDataConfig", option_to_yojson training_data_config_to_yojson x.training_data_config);
      ( "minRecommendationRequestsPerSecond",
        option_to_yojson transactions_per_second_to_yojson x.min_recommendation_requests_per_second
      );
      ( "itemExplorationConfig",
        option_to_yojson hyper_parameters_to_yojson x.item_exploration_config );
    ]

let update_recommender_request_to_yojson (x : update_recommender_request) =
  assoc_to_yojson
    [
      ("recommenderConfig", Some (recommender_config_to_yojson x.recommender_config));
      ("recommenderArn", Some (arn_to_yojson x.recommender_arn));
    ]

let update_metric_attribution_response_to_yojson (x : update_metric_attribution_response) =
  assoc_to_yojson
    [ ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn) ]

let metric_name_to_yojson = string_to_yojson
let metric_expression_to_yojson = string_to_yojson

let metric_attribute_to_yojson (x : metric_attribute) =
  assoc_to_yojson
    [
      ("expression", Some (metric_expression_to_yojson x.expression));
      ("metricName", Some (metric_name_to_yojson x.metric_name));
      ("eventType", Some (event_type_to_yojson x.event_type));
    ]

let metric_attributes_to_yojson tree = list_to_yojson metric_attribute_to_yojson tree
let metric_attributes_names_list_to_yojson tree = list_to_yojson metric_name_to_yojson tree
let s3_location_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson

let s3_data_config_to_yojson (x : s3_data_config) =
  assoc_to_yojson
    [
      ("kmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("path", Some (s3_location_to_yojson x.path));
    ]

let role_arn_to_yojson = string_to_yojson

let metric_attribution_output_to_yojson (x : metric_attribution_output) =
  assoc_to_yojson
    [
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("s3DataDestination", option_to_yojson s3_data_config_to_yojson x.s3_data_destination);
    ]

let update_metric_attribution_request_to_yojson (x : update_metric_attribution_request) =
  assoc_to_yojson
    [
      ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn);
      ( "metricsOutputConfig",
        option_to_yojson metric_attribution_output_to_yojson x.metrics_output_config );
      ("removeMetrics", option_to_yojson metric_attributes_names_list_to_yojson x.remove_metrics);
      ("addMetrics", option_to_yojson metric_attributes_to_yojson x.add_metrics);
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_dataset_response_to_yojson (x : update_dataset_response) =
  assoc_to_yojson [ ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn) ]

let update_dataset_request_to_yojson (x : update_dataset_request) =
  assoc_to_yojson
    [
      ("schemaArn", Some (arn_to_yojson x.schema_arn));
      ("datasetArn", Some (arn_to_yojson x.dataset_arn));
    ]

let update_campaign_response_to_yojson (x : update_campaign_response) =
  assoc_to_yojson [ ("campaignArn", option_to_yojson arn_to_yojson x.campaign_arn) ]

let ranking_influence_weight_to_yojson = double_to_yojson

let ranking_influence_type_to_yojson (x : ranking_influence_type) =
  match x with FRESHNESS -> `String "FRESHNESS" | POPULARITY -> `String "POPULARITY"

let ranking_influence_to_yojson tree =
  map_to_yojson ranking_influence_type_to_yojson ranking_influence_weight_to_yojson tree

let campaign_config_to_yojson (x : campaign_config) =
  assoc_to_yojson
    [
      ("rankingInfluence", option_to_yojson ranking_influence_to_yojson x.ranking_influence);
      ( "syncWithLatestSolutionVersion",
        option_to_yojson boolean__to_yojson x.sync_with_latest_solution_version );
      ( "enableMetadataWithRecommendations",
        option_to_yojson boolean__to_yojson x.enable_metadata_with_recommendations );
      ( "itemExplorationConfig",
        option_to_yojson hyper_parameters_to_yojson x.item_exploration_config );
    ]

let update_campaign_request_to_yojson (x : update_campaign_request) =
  assoc_to_yojson
    [
      ("campaignConfig", option_to_yojson campaign_config_to_yojson x.campaign_config);
      ( "minProvisionedTPS",
        option_to_yojson transactions_per_second_to_yojson x.min_provisioned_tp_s );
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("campaignArn", Some (arn_to_yojson x.campaign_arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let too_many_tag_keys_exception_to_yojson (x : too_many_tag_keys_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let tuned_hpo_params_to_yojson (x : tuned_hpo_params) =
  assoc_to_yojson
    [
      ( "algorithmHyperParameters",
        option_to_yojson hyper_parameters_to_yojson x.algorithm_hyper_parameters );
    ]

let tunable_to_yojson = bool_to_yojson

let training_type_to_yojson (x : training_type) =
  match x with MANUAL -> `String "MANUAL" | AUTOMATIC -> `String "AUTOMATIC"

let training_mode_to_yojson (x : training_mode) =
  match x with
  | AUTOTRAIN -> `String "AUTOTRAIN"
  | UPDATE -> `String "UPDATE"
  | FULL -> `String "FULL"

let training_input_mode_to_yojson = string_to_yojson
let training_hours_to_yojson = double_to_yojson
let tracking_id_to_yojson = string_to_yojson

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let fields_for_theme_generation_to_yojson (x : fields_for_theme_generation) =
  assoc_to_yojson [ ("itemName", Some (column_name_to_yojson x.item_name)) ]

let theme_generation_config_to_yojson (x : theme_generation_config) =
  assoc_to_yojson
    [
      ( "fieldsForThemeGeneration",
        Some (fields_for_theme_generation_to_yojson x.fields_for_theme_generation) );
    ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("tagValue", Some (tag_value_to_yojson x.tag_value));
      ("tagKey", Some (tag_key_to_yojson x.tag_key));
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("tags", Some (tags_to_yojson x.tags)); ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let stop_solution_version_creation_request_to_yojson (x : stop_solution_version_creation_request) =
  assoc_to_yojson [ ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn)) ]

let stop_recommender_response_to_yojson (x : stop_recommender_response) =
  assoc_to_yojson [ ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn) ]

let stop_recommender_request_to_yojson (x : stop_recommender_request) =
  assoc_to_yojson [ ("recommenderArn", Some (arn_to_yojson x.recommender_arn)) ]

let status_to_yojson = string_to_yojson

let start_recommender_response_to_yojson (x : start_recommender_response) =
  assoc_to_yojson [ ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn) ]

let start_recommender_request_to_yojson (x : start_recommender_request) =
  assoc_to_yojson [ ("recommenderArn", Some (arn_to_yojson x.recommender_arn)) ]

let name_to_yojson = string_to_yojson
let date_to_yojson = timestamp_epoch_seconds_to_yojson

let solution_summary_to_yojson (x : solution_summary) =
  assoc_to_yojson
    [
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let solutions_to_yojson tree = list_to_yojson solution_summary_to_yojson tree
let failure_reason_to_yojson = string_to_yojson

let solution_version_summary_to_yojson (x : solution_version_summary) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("trainingType", option_to_yojson training_type_to_yojson x.training_type);
      ("trainingMode", option_to_yojson training_mode_to_yojson x.training_mode);
      ("status", option_to_yojson status_to_yojson x.status);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
    ]

let solution_versions_to_yojson tree = list_to_yojson solution_version_summary_to_yojson tree
let perform_hp_o_to_yojson = bool_to_yojson
let perform_auto_m_l_to_yojson = bool_to_yojson
let event_value_threshold_to_yojson = string_to_yojson
let hpo_objective_type_to_yojson = string_to_yojson
let metric_regex_to_yojson = string_to_yojson

let hpo_objective_to_yojson (x : hpo_objective) =
  assoc_to_yojson
    [
      ("metricRegex", option_to_yojson metric_regex_to_yojson x.metric_regex);
      ("metricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("type", option_to_yojson hpo_objective_type_to_yojson x.type_);
    ]

let hpo_resource_to_yojson = string_to_yojson

let hpo_resource_config_to_yojson (x : hpo_resource_config) =
  assoc_to_yojson
    [
      ( "maxParallelTrainingJobs",
        option_to_yojson hpo_resource_to_yojson x.max_parallel_training_jobs );
      ( "maxNumberOfTrainingJobs",
        option_to_yojson hpo_resource_to_yojson x.max_number_of_training_jobs );
    ]

let integer_min_value_to_yojson = int_to_yojson
let integer_max_value_to_yojson = int_to_yojson

let integer_hyper_parameter_range_to_yojson (x : integer_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("maxValue", option_to_yojson integer_max_value_to_yojson x.max_value);
      ("minValue", option_to_yojson integer_min_value_to_yojson x.min_value);
      ("name", option_to_yojson parameter_name_to_yojson x.name);
    ]

let integer_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson integer_hyper_parameter_range_to_yojson tree

let continuous_min_value_to_yojson = double_to_yojson
let continuous_max_value_to_yojson = double_to_yojson

let continuous_hyper_parameter_range_to_yojson (x : continuous_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("maxValue", option_to_yojson continuous_max_value_to_yojson x.max_value);
      ("minValue", option_to_yojson continuous_min_value_to_yojson x.min_value);
      ("name", option_to_yojson parameter_name_to_yojson x.name);
    ]

let continuous_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson continuous_hyper_parameter_range_to_yojson tree

let categorical_value_to_yojson = string_to_yojson
let categorical_values_to_yojson tree = list_to_yojson categorical_value_to_yojson tree

let categorical_hyper_parameter_range_to_yojson (x : categorical_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("values", option_to_yojson categorical_values_to_yojson x.values);
      ("name", option_to_yojson parameter_name_to_yojson x.name);
    ]

let categorical_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson categorical_hyper_parameter_range_to_yojson tree

let hyper_parameter_ranges_to_yojson (x : hyper_parameter_ranges) =
  assoc_to_yojson
    [
      ( "categoricalHyperParameterRanges",
        option_to_yojson categorical_hyper_parameter_ranges_to_yojson
          x.categorical_hyper_parameter_ranges );
      ( "continuousHyperParameterRanges",
        option_to_yojson continuous_hyper_parameter_ranges_to_yojson
          x.continuous_hyper_parameter_ranges );
      ( "integerHyperParameterRanges",
        option_to_yojson integer_hyper_parameter_ranges_to_yojson x.integer_hyper_parameter_ranges
      );
    ]

let hpo_config_to_yojson (x : hpo_config) =
  assoc_to_yojson
    [
      ( "algorithmHyperParameterRanges",
        option_to_yojson hyper_parameter_ranges_to_yojson x.algorithm_hyper_parameter_ranges );
      ("hpoResourceConfig", option_to_yojson hpo_resource_config_to_yojson x.hpo_resource_config);
      ("hpoObjective", option_to_yojson hpo_objective_to_yojson x.hpo_objective);
    ]

let feature_transformation_parameters_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let auto_ml_config_to_yojson (x : auto_ml_config) =
  assoc_to_yojson
    [
      ("recipeList", option_to_yojson arn_list_to_yojson x.recipe_list);
      ("metricName", option_to_yojson metric_name_to_yojson x.metric_name);
    ]

let item_attribute_to_yojson = string_to_yojson

let objective_sensitivity_to_yojson (x : objective_sensitivity) =
  match x with
  | OFF -> `String "OFF"
  | HIGH -> `String "HIGH"
  | MEDIUM -> `String "MEDIUM"
  | LOW -> `String "LOW"

let optimization_objective_to_yojson (x : optimization_objective) =
  assoc_to_yojson
    [
      ( "objectiveSensitivity",
        option_to_yojson objective_sensitivity_to_yojson x.objective_sensitivity );
      ("itemAttribute", option_to_yojson item_attribute_to_yojson x.item_attribute);
    ]

let solution_config_to_yojson (x : solution_config) =
  assoc_to_yojson
    [
      ("autoTrainingConfig", option_to_yojson auto_training_config_to_yojson x.auto_training_config);
      ("trainingDataConfig", option_to_yojson training_data_config_to_yojson x.training_data_config);
      ( "optimizationObjective",
        option_to_yojson optimization_objective_to_yojson x.optimization_objective );
      ("eventsConfig", option_to_yojson events_config_to_yojson x.events_config);
      ("autoMLConfig", option_to_yojson auto_ml_config_to_yojson x.auto_ml_config);
      ( "featureTransformationParameters",
        option_to_yojson feature_transformation_parameters_to_yojson
          x.feature_transformation_parameters );
      ( "algorithmHyperParameters",
        option_to_yojson hyper_parameters_to_yojson x.algorithm_hyper_parameters );
      ("hpoConfig", option_to_yojson hpo_config_to_yojson x.hpo_config);
      ( "eventValueThreshold",
        option_to_yojson event_value_threshold_to_yojson x.event_value_threshold );
    ]

let solution_version_to_yojson (x : solution_version) =
  assoc_to_yojson
    [
      ("trainingType", option_to_yojson training_type_to_yojson x.training_type);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("status", option_to_yojson status_to_yojson x.status);
      ("tunedHPOParams", option_to_yojson tuned_hpo_params_to_yojson x.tuned_hpo_params);
      ("trainingMode", option_to_yojson training_mode_to_yojson x.training_mode);
      ("trainingHours", option_to_yojson training_hours_to_yojson x.training_hours);
      ("solutionConfig", option_to_yojson solution_config_to_yojson x.solution_config);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ("performAutoML", option_to_yojson perform_auto_m_l_to_yojson x.perform_auto_m_l);
      ("performHPO", option_to_yojson perform_hp_o_to_yojson x.perform_hp_o);
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let solution_update_summary_to_yojson (x : solution_update_summary) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ( "performAutoTraining",
        option_to_yojson perform_auto_training_to_yojson x.perform_auto_training );
      ("status", option_to_yojson status_to_yojson x.status);
      ( "solutionUpdateConfig",
        option_to_yojson solution_update_config_to_yojson x.solution_update_config );
    ]

let auto_ml_result_to_yojson (x : auto_ml_result) =
  assoc_to_yojson [ ("bestRecipeArn", option_to_yojson arn_to_yojson x.best_recipe_arn) ]

let solution_to_yojson (x : solution) =
  assoc_to_yojson
    [
      ( "latestSolutionUpdate",
        option_to_yojson solution_update_summary_to_yojson x.latest_solution_update );
      ( "latestSolutionVersion",
        option_to_yojson solution_version_summary_to_yojson x.latest_solution_version );
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("autoMLResult", option_to_yojson auto_ml_result_to_yojson x.auto_ml_result);
      ("solutionConfig", option_to_yojson solution_config_to_yojson x.solution_config);
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ( "performAutoTraining",
        option_to_yojson perform_auto_training_to_yojson x.perform_auto_training );
      ("performAutoML", option_to_yojson perform_auto_m_l_to_yojson x.perform_auto_m_l);
      ("performHPO", option_to_yojson perform_hp_o_to_yojson x.perform_hp_o);
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let domain_to_yojson (x : domain) =
  match x with VIDEO_ON_DEMAND -> `String "VIDEO_ON_DEMAND" | ECOMMERCE -> `String "ECOMMERCE"

let dataset_schema_summary_to_yojson (x : dataset_schema_summary) =
  assoc_to_yojson
    [
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let schemas_to_yojson tree = list_to_yojson dataset_schema_summary_to_yojson tree

let resource_config_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let recommender_summary_to_yojson (x : recommender_summary) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("recommenderConfig", option_to_yojson recommender_config_to_yojson x.recommender_config);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let recommenders_to_yojson tree = list_to_yojson recommender_summary_to_yojson tree

let recommender_update_summary_to_yojson (x : recommender_update_summary) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("status", option_to_yojson status_to_yojson x.status);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("recommenderConfig", option_to_yojson recommender_config_to_yojson x.recommender_config);
    ]

let metric_value_to_yojson = double_to_yojson
let metrics_to_yojson tree = map_to_yojson metric_name_to_yojson metric_value_to_yojson tree

let recommender_to_yojson (x : recommender) =
  assoc_to_yojson
    [
      ("modelMetrics", option_to_yojson metrics_to_yojson x.model_metrics);
      ( "latestRecommenderUpdate",
        option_to_yojson recommender_update_summary_to_yojson x.latest_recommender_update );
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("status", option_to_yojson status_to_yojson x.status);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("recommenderConfig", option_to_yojson recommender_config_to_yojson x.recommender_config);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn);
    ]

let recipe_summary_to_yojson (x : recipe_summary) =
  assoc_to_yojson
    [
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let recipes_to_yojson tree = list_to_yojson recipe_summary_to_yojson tree
let recipe_type_to_yojson = string_to_yojson
let recipe_provider_to_yojson (x : recipe_provider) = match x with SERVICE -> `String "SERVICE"
let description_to_yojson = string_to_yojson

let recipe_to_yojson (x : recipe) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("recipeType", option_to_yojson recipe_type_to_yojson x.recipe_type);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("description", option_to_yojson description_to_yojson x.description);
      ("status", option_to_yojson status_to_yojson x.status);
      ("featureTransformationArn", option_to_yojson arn_to_yojson x.feature_transformation_arn);
      ("algorithmArn", option_to_yojson arn_to_yojson x.algorithm_arn);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let num_batch_results_to_yojson = int_to_yojson
let next_token_to_yojson = string_to_yojson

let metric_attribution_summary_to_yojson (x : metric_attribution_summary) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let metric_attributions_to_yojson tree = list_to_yojson metric_attribution_summary_to_yojson tree

let metric_attribution_to_yojson (x : metric_attribution) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ( "metricsOutputConfig",
        option_to_yojson metric_attribution_output_to_yojson x.metrics_output_config );
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let list_solutions_response_to_yojson (x : list_solutions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("solutions", option_to_yojson solutions_to_yojson x.solutions);
    ]

let list_solutions_request_to_yojson (x : list_solutions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let list_solution_versions_response_to_yojson (x : list_solution_versions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("solutionVersions", option_to_yojson solution_versions_to_yojson x.solution_versions);
    ]

let list_solution_versions_request_to_yojson (x : list_solution_versions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
    ]

let list_schemas_response_to_yojson (x : list_schemas_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("schemas", option_to_yojson schemas_to_yojson x.schemas);
    ]

let list_schemas_request_to_yojson (x : list_schemas_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_recommenders_response_to_yojson (x : list_recommenders_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("recommenders", option_to_yojson recommenders_to_yojson x.recommenders);
    ]

let list_recommenders_request_to_yojson (x : list_recommenders_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let list_recipes_response_to_yojson (x : list_recipes_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("recipes", option_to_yojson recipes_to_yojson x.recipes);
    ]

let list_recipes_request_to_yojson (x : list_recipes_request) =
  assoc_to_yojson
    [
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("recipeProvider", option_to_yojson recipe_provider_to_yojson x.recipe_provider);
    ]

let list_metric_attributions_response_to_yojson (x : list_metric_attributions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("metricAttributions", option_to_yojson metric_attributions_to_yojson x.metric_attributions);
    ]

let list_metric_attributions_request_to_yojson (x : list_metric_attributions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let list_metric_attribution_metrics_response_to_yojson
    (x : list_metric_attribution_metrics_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("metrics", option_to_yojson metric_attributes_to_yojson x.metrics);
    ]

let list_metric_attribution_metrics_request_to_yojson (x : list_metric_attribution_metrics_request)
    =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn);
    ]

let filter_summary_to_yojson (x : filter_summary) =
  assoc_to_yojson
    [
      ("status", option_to_yojson status_to_yojson x.status);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let filters_to_yojson tree = list_to_yojson filter_summary_to_yojson tree

let list_filters_response_to_yojson (x : list_filters_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let list_filters_request_to_yojson (x : list_filters_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let event_tracker_summary_to_yojson (x : event_tracker_summary) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("eventTrackerArn", option_to_yojson arn_to_yojson x.event_tracker_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let event_trackers_to_yojson tree = list_to_yojson event_tracker_summary_to_yojson tree

let list_event_trackers_response_to_yojson (x : list_event_trackers_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("eventTrackers", option_to_yojson event_trackers_to_yojson x.event_trackers);
    ]

let list_event_trackers_request_to_yojson (x : list_event_trackers_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let dataset_summary_to_yojson (x : dataset_summary) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("datasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let datasets_to_yojson tree = list_to_yojson dataset_summary_to_yojson tree

let list_datasets_response_to_yojson (x : list_datasets_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasets", option_to_yojson datasets_to_yojson x.datasets);
    ]

let list_datasets_request_to_yojson (x : list_datasets_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let import_mode_to_yojson (x : import_mode) =
  match x with INCREMENTAL -> `String "INCREMENTAL" | FULL -> `String "FULL"

let dataset_import_job_summary_to_yojson (x : dataset_import_job_summary) =
  assoc_to_yojson
    [
      ("importMode", option_to_yojson import_mode_to_yojson x.import_mode);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("datasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn);
    ]

let dataset_import_jobs_to_yojson tree = list_to_yojson dataset_import_job_summary_to_yojson tree

let list_dataset_import_jobs_response_to_yojson (x : list_dataset_import_jobs_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetImportJobs", option_to_yojson dataset_import_jobs_to_yojson x.dataset_import_jobs);
    ]

let list_dataset_import_jobs_request_to_yojson (x : list_dataset_import_jobs_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
    ]

let dataset_group_summary_to_yojson (x : dataset_group_summary) =
  assoc_to_yojson
    [
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let dataset_groups_to_yojson tree = list_to_yojson dataset_group_summary_to_yojson tree

let list_dataset_groups_response_to_yojson (x : list_dataset_groups_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetGroups", option_to_yojson dataset_groups_to_yojson x.dataset_groups);
    ]

let list_dataset_groups_request_to_yojson (x : list_dataset_groups_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let dataset_export_job_summary_to_yojson (x : dataset_export_job_summary) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("datasetExportJobArn", option_to_yojson arn_to_yojson x.dataset_export_job_arn);
    ]

let dataset_export_jobs_to_yojson tree = list_to_yojson dataset_export_job_summary_to_yojson tree

let list_dataset_export_jobs_response_to_yojson (x : list_dataset_export_jobs_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetExportJobs", option_to_yojson dataset_export_jobs_to_yojson x.dataset_export_jobs);
    ]

let list_dataset_export_jobs_request_to_yojson (x : list_dataset_export_jobs_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
    ]

let data_deletion_job_summary_to_yojson (x : data_deletion_job_summary) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("dataDeletionJobArn", option_to_yojson arn_to_yojson x.data_deletion_job_arn);
    ]

let data_deletion_jobs_to_yojson tree = list_to_yojson data_deletion_job_summary_to_yojson tree

let list_data_deletion_jobs_response_to_yojson (x : list_data_deletion_jobs_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("dataDeletionJobs", option_to_yojson data_deletion_jobs_to_yojson x.data_deletion_jobs);
    ]

let list_data_deletion_jobs_request_to_yojson (x : list_data_deletion_jobs_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let campaign_summary_to_yojson (x : campaign_summary) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("campaignArn", option_to_yojson arn_to_yojson x.campaign_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let campaigns_to_yojson tree = list_to_yojson campaign_summary_to_yojson tree

let list_campaigns_response_to_yojson (x : list_campaigns_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("campaigns", option_to_yojson campaigns_to_yojson x.campaigns);
    ]

let list_campaigns_request_to_yojson (x : list_campaigns_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
    ]

let batch_segment_job_summary_to_yojson (x : batch_segment_job_summary) =
  assoc_to_yojson
    [
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("batchSegmentJobArn", option_to_yojson arn_to_yojson x.batch_segment_job_arn);
    ]

let batch_segment_jobs_to_yojson tree = list_to_yojson batch_segment_job_summary_to_yojson tree

let list_batch_segment_jobs_response_to_yojson (x : list_batch_segment_jobs_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("batchSegmentJobs", option_to_yojson batch_segment_jobs_to_yojson x.batch_segment_jobs);
    ]

let list_batch_segment_jobs_request_to_yojson (x : list_batch_segment_jobs_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
    ]

let batch_inference_job_mode_to_yojson (x : batch_inference_job_mode) =
  match x with
  | THEME_GENERATION -> `String "THEME_GENERATION"
  | BATCH_INFERENCE -> `String "BATCH_INFERENCE"

let batch_inference_job_summary_to_yojson (x : batch_inference_job_summary) =
  assoc_to_yojson
    [
      ( "batchInferenceJobMode",
        option_to_yojson batch_inference_job_mode_to_yojson x.batch_inference_job_mode );
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("batchInferenceJobArn", option_to_yojson arn_to_yojson x.batch_inference_job_arn);
    ]

let batch_inference_jobs_to_yojson tree = list_to_yojson batch_inference_job_summary_to_yojson tree

let list_batch_inference_jobs_response_to_yojson (x : list_batch_inference_jobs_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("batchInferenceJobs", option_to_yojson batch_inference_jobs_to_yojson x.batch_inference_jobs);
    ]

let list_batch_inference_jobs_request_to_yojson (x : list_batch_inference_jobs_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
    ]

let integer_to_yojson = int_to_yojson

let ingestion_mode_to_yojson (x : ingestion_mode) =
  match x with ALL -> `String "ALL" | PUT -> `String "PUT" | BULK -> `String "BULK"

let get_solution_metrics_response_to_yojson (x : get_solution_metrics_response) =
  assoc_to_yojson
    [
      ("metrics", option_to_yojson metrics_to_yojson x.metrics);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
    ]

let get_solution_metrics_request_to_yojson (x : get_solution_metrics_request) =
  assoc_to_yojson [ ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn)) ]

let filter_expression_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("status", option_to_yojson status_to_yojson x.status);
      ("filterExpression", option_to_yojson filter_expression_to_yojson x.filter_expression);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let featurization_parameters_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let feature_transformation_to_yojson (x : feature_transformation) =
  assoc_to_yojson
    [
      ("status", option_to_yojson status_to_yojson x.status);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("defaultParameters", option_to_yojson featurization_parameters_to_yojson x.default_parameters);
      ("featureTransformationArn", option_to_yojson arn_to_yojson x.feature_transformation_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let account_id_to_yojson = string_to_yojson

let event_tracker_to_yojson (x : event_tracker) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("trackingId", option_to_yojson tracking_id_to_yojson x.tracking_id);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("eventTrackerArn", option_to_yojson arn_to_yojson x.event_tracker_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let docker_ur_i_to_yojson = string_to_yojson

let describe_solution_version_response_to_yojson (x : describe_solution_version_response) =
  assoc_to_yojson
    [ ("solutionVersion", option_to_yojson solution_version_to_yojson x.solution_version) ]

let describe_solution_version_request_to_yojson (x : describe_solution_version_request) =
  assoc_to_yojson [ ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn)) ]

let describe_solution_response_to_yojson (x : describe_solution_response) =
  assoc_to_yojson [ ("solution", option_to_yojson solution_to_yojson x.solution) ]

let describe_solution_request_to_yojson (x : describe_solution_request) =
  assoc_to_yojson [ ("solutionArn", Some (arn_to_yojson x.solution_arn)) ]

let avro_schema_to_yojson = string_to_yojson

let dataset_schema_to_yojson (x : dataset_schema) =
  assoc_to_yojson
    [
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("schema", option_to_yojson avro_schema_to_yojson x.schema);
      ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let describe_schema_response_to_yojson (x : describe_schema_response) =
  assoc_to_yojson [ ("schema", option_to_yojson dataset_schema_to_yojson x.schema) ]

let describe_schema_request_to_yojson (x : describe_schema_request) =
  assoc_to_yojson [ ("schemaArn", Some (arn_to_yojson x.schema_arn)) ]

let describe_recommender_response_to_yojson (x : describe_recommender_response) =
  assoc_to_yojson [ ("recommender", option_to_yojson recommender_to_yojson x.recommender) ]

let describe_recommender_request_to_yojson (x : describe_recommender_request) =
  assoc_to_yojson [ ("recommenderArn", Some (arn_to_yojson x.recommender_arn)) ]

let describe_recipe_response_to_yojson (x : describe_recipe_response) =
  assoc_to_yojson [ ("recipe", option_to_yojson recipe_to_yojson x.recipe) ]

let describe_recipe_request_to_yojson (x : describe_recipe_request) =
  assoc_to_yojson [ ("recipeArn", Some (arn_to_yojson x.recipe_arn)) ]

let describe_metric_attribution_response_to_yojson (x : describe_metric_attribution_response) =
  assoc_to_yojson
    [ ("metricAttribution", option_to_yojson metric_attribution_to_yojson x.metric_attribution) ]

let describe_metric_attribution_request_to_yojson (x : describe_metric_attribution_request) =
  assoc_to_yojson [ ("metricAttributionArn", Some (arn_to_yojson x.metric_attribution_arn)) ]

let describe_filter_response_to_yojson (x : describe_filter_response) =
  assoc_to_yojson [ ("filter", option_to_yojson filter_to_yojson x.filter) ]

let describe_filter_request_to_yojson (x : describe_filter_request) =
  assoc_to_yojson [ ("filterArn", Some (arn_to_yojson x.filter_arn)) ]

let describe_feature_transformation_response_to_yojson
    (x : describe_feature_transformation_response) =
  assoc_to_yojson
    [
      ( "featureTransformation",
        option_to_yojson feature_transformation_to_yojson x.feature_transformation );
    ]

let describe_feature_transformation_request_to_yojson (x : describe_feature_transformation_request)
    =
  assoc_to_yojson
    [ ("featureTransformationArn", Some (arn_to_yojson x.feature_transformation_arn)) ]

let describe_event_tracker_response_to_yojson (x : describe_event_tracker_response) =
  assoc_to_yojson [ ("eventTracker", option_to_yojson event_tracker_to_yojson x.event_tracker) ]

let describe_event_tracker_request_to_yojson (x : describe_event_tracker_request) =
  assoc_to_yojson [ ("eventTrackerArn", Some (arn_to_yojson x.event_tracker_arn)) ]

let dataset_update_summary_to_yojson (x : dataset_update_summary) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("status", option_to_yojson status_to_yojson x.status);
      ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn);
    ]

let dataset_to_yojson (x : dataset) =
  assoc_to_yojson
    [
      ("trackingId", option_to_yojson tracking_id_to_yojson x.tracking_id);
      ( "latestDatasetUpdate",
        option_to_yojson dataset_update_summary_to_yojson x.latest_dataset_update );
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn);
      ("datasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let describe_dataset_response_to_yojson (x : describe_dataset_response) =
  assoc_to_yojson [ ("dataset", option_to_yojson dataset_to_yojson x.dataset) ]

let describe_dataset_request_to_yojson (x : describe_dataset_request) =
  assoc_to_yojson [ ("datasetArn", Some (arn_to_yojson x.dataset_arn)) ]

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson [ ("dataLocation", option_to_yojson s3_location_to_yojson x.data_location) ]

let dataset_import_job_to_yojson (x : dataset_import_job) =
  assoc_to_yojson
    [
      ( "publishAttributionMetricsToS3",
        option_to_yojson boolean__to_yojson x.publish_attribution_metrics_to_s3 );
      ("importMode", option_to_yojson import_mode_to_yojson x.import_mode);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("datasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
    ]

let describe_dataset_import_job_response_to_yojson (x : describe_dataset_import_job_response) =
  assoc_to_yojson
    [ ("datasetImportJob", option_to_yojson dataset_import_job_to_yojson x.dataset_import_job) ]

let describe_dataset_import_job_request_to_yojson (x : describe_dataset_import_job_request) =
  assoc_to_yojson [ ("datasetImportJobArn", Some (arn_to_yojson x.dataset_import_job_arn)) ]

let dataset_group_to_yojson (x : dataset_group) =
  assoc_to_yojson
    [
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("kmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let describe_dataset_group_response_to_yojson (x : describe_dataset_group_response) =
  assoc_to_yojson [ ("datasetGroup", option_to_yojson dataset_group_to_yojson x.dataset_group) ]

let describe_dataset_group_request_to_yojson (x : describe_dataset_group_request) =
  assoc_to_yojson [ ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn)) ]

let dataset_export_job_output_to_yojson (x : dataset_export_job_output) =
  assoc_to_yojson [ ("s3DataDestination", Some (s3_data_config_to_yojson x.s3_data_destination)) ]

let dataset_export_job_to_yojson (x : dataset_export_job) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("jobOutput", option_to_yojson dataset_export_job_output_to_yojson x.job_output);
      ("status", option_to_yojson status_to_yojson x.status);
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ("ingestionMode", option_to_yojson ingestion_mode_to_yojson x.ingestion_mode);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("datasetExportJobArn", option_to_yojson arn_to_yojson x.dataset_export_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
    ]

let describe_dataset_export_job_response_to_yojson (x : describe_dataset_export_job_response) =
  assoc_to_yojson
    [ ("datasetExportJob", option_to_yojson dataset_export_job_to_yojson x.dataset_export_job) ]

let describe_dataset_export_job_request_to_yojson (x : describe_dataset_export_job_request) =
  assoc_to_yojson [ ("datasetExportJobArn", Some (arn_to_yojson x.dataset_export_job_arn)) ]

let data_deletion_job_to_yojson (x : data_deletion_job) =
  assoc_to_yojson
    [
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("numDeleted", option_to_yojson integer_to_yojson x.num_deleted);
      ("status", option_to_yojson status_to_yojson x.status);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("dataDeletionJobArn", option_to_yojson arn_to_yojson x.data_deletion_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
    ]

let describe_data_deletion_job_response_to_yojson (x : describe_data_deletion_job_response) =
  assoc_to_yojson
    [ ("dataDeletionJob", option_to_yojson data_deletion_job_to_yojson x.data_deletion_job) ]

let describe_data_deletion_job_request_to_yojson (x : describe_data_deletion_job_request) =
  assoc_to_yojson [ ("dataDeletionJobArn", Some (arn_to_yojson x.data_deletion_job_arn)) ]

let campaign_update_summary_to_yojson (x : campaign_update_summary) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("status", option_to_yojson status_to_yojson x.status);
      ("campaignConfig", option_to_yojson campaign_config_to_yojson x.campaign_config);
      ( "minProvisionedTPS",
        option_to_yojson transactions_per_second_to_yojson x.min_provisioned_tp_s );
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
    ]

let campaign_to_yojson (x : campaign) =
  assoc_to_yojson
    [
      ( "latestCampaignUpdate",
        option_to_yojson campaign_update_summary_to_yojson x.latest_campaign_update );
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("status", option_to_yojson status_to_yojson x.status);
      ("campaignConfig", option_to_yojson campaign_config_to_yojson x.campaign_config);
      ( "minProvisionedTPS",
        option_to_yojson transactions_per_second_to_yojson x.min_provisioned_tp_s );
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("campaignArn", option_to_yojson arn_to_yojson x.campaign_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let describe_campaign_response_to_yojson (x : describe_campaign_response) =
  assoc_to_yojson [ ("campaign", option_to_yojson campaign_to_yojson x.campaign) ]

let describe_campaign_request_to_yojson (x : describe_campaign_request) =
  assoc_to_yojson [ ("campaignArn", Some (arn_to_yojson x.campaign_arn)) ]

let batch_segment_job_input_to_yojson (x : batch_segment_job_input) =
  assoc_to_yojson [ ("s3DataSource", Some (s3_data_config_to_yojson x.s3_data_source)) ]

let batch_segment_job_output_to_yojson (x : batch_segment_job_output) =
  assoc_to_yojson [ ("s3DataDestination", Some (s3_data_config_to_yojson x.s3_data_destination)) ]

let batch_segment_job_to_yojson (x : batch_segment_job) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("jobOutput", option_to_yojson batch_segment_job_output_to_yojson x.job_output);
      ("jobInput", option_to_yojson batch_segment_job_input_to_yojson x.job_input);
      ("numResults", option_to_yojson num_batch_results_to_yojson x.num_results);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("batchSegmentJobArn", option_to_yojson arn_to_yojson x.batch_segment_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
    ]

let describe_batch_segment_job_response_to_yojson (x : describe_batch_segment_job_response) =
  assoc_to_yojson
    [ ("batchSegmentJob", option_to_yojson batch_segment_job_to_yojson x.batch_segment_job) ]

let describe_batch_segment_job_request_to_yojson (x : describe_batch_segment_job_request) =
  assoc_to_yojson [ ("batchSegmentJobArn", Some (arn_to_yojson x.batch_segment_job_arn)) ]

let batch_inference_job_input_to_yojson (x : batch_inference_job_input) =
  assoc_to_yojson [ ("s3DataSource", Some (s3_data_config_to_yojson x.s3_data_source)) ]

let batch_inference_job_output_to_yojson (x : batch_inference_job_output) =
  assoc_to_yojson [ ("s3DataDestination", Some (s3_data_config_to_yojson x.s3_data_destination)) ]

let batch_inference_job_config_to_yojson (x : batch_inference_job_config) =
  assoc_to_yojson
    [
      ("rankingInfluence", option_to_yojson ranking_influence_to_yojson x.ranking_influence);
      ( "itemExplorationConfig",
        option_to_yojson hyper_parameters_to_yojson x.item_exploration_config );
    ]

let batch_inference_job_to_yojson (x : batch_inference_job) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ( "themeGenerationConfig",
        option_to_yojson theme_generation_config_to_yojson x.theme_generation_config );
      ( "batchInferenceJobMode",
        option_to_yojson batch_inference_job_mode_to_yojson x.batch_inference_job_mode );
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "batchInferenceJobConfig",
        option_to_yojson batch_inference_job_config_to_yojson x.batch_inference_job_config );
      ("jobOutput", option_to_yojson batch_inference_job_output_to_yojson x.job_output);
      ("jobInput", option_to_yojson batch_inference_job_input_to_yojson x.job_input);
      ("numResults", option_to_yojson num_batch_results_to_yojson x.num_results);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("batchInferenceJobArn", option_to_yojson arn_to_yojson x.batch_inference_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
    ]

let describe_batch_inference_job_response_to_yojson (x : describe_batch_inference_job_response) =
  assoc_to_yojson
    [ ("batchInferenceJob", option_to_yojson batch_inference_job_to_yojson x.batch_inference_job) ]

let describe_batch_inference_job_request_to_yojson (x : describe_batch_inference_job_request) =
  assoc_to_yojson [ ("batchInferenceJobArn", Some (arn_to_yojson x.batch_inference_job_arn)) ]

let algorithm_image_to_yojson (x : algorithm_image) =
  assoc_to_yojson
    [
      ("dockerURI", Some (docker_ur_i_to_yojson x.docker_ur_i));
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let default_integer_hyper_parameter_range_to_yojson (x : default_integer_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("isTunable", option_to_yojson tunable_to_yojson x.is_tunable);
      ("maxValue", option_to_yojson integer_max_value_to_yojson x.max_value);
      ("minValue", option_to_yojson integer_min_value_to_yojson x.min_value);
      ("name", option_to_yojson parameter_name_to_yojson x.name);
    ]

let default_integer_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson default_integer_hyper_parameter_range_to_yojson tree

let default_continuous_hyper_parameter_range_to_yojson
    (x : default_continuous_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("isTunable", option_to_yojson tunable_to_yojson x.is_tunable);
      ("maxValue", option_to_yojson continuous_max_value_to_yojson x.max_value);
      ("minValue", option_to_yojson continuous_min_value_to_yojson x.min_value);
      ("name", option_to_yojson parameter_name_to_yojson x.name);
    ]

let default_continuous_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson default_continuous_hyper_parameter_range_to_yojson tree

let default_categorical_hyper_parameter_range_to_yojson
    (x : default_categorical_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("isTunable", option_to_yojson tunable_to_yojson x.is_tunable);
      ("values", option_to_yojson categorical_values_to_yojson x.values);
      ("name", option_to_yojson parameter_name_to_yojson x.name);
    ]

let default_categorical_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson default_categorical_hyper_parameter_range_to_yojson tree

let default_hyper_parameter_ranges_to_yojson (x : default_hyper_parameter_ranges) =
  assoc_to_yojson
    [
      ( "categoricalHyperParameterRanges",
        option_to_yojson default_categorical_hyper_parameter_ranges_to_yojson
          x.categorical_hyper_parameter_ranges );
      ( "continuousHyperParameterRanges",
        option_to_yojson default_continuous_hyper_parameter_ranges_to_yojson
          x.continuous_hyper_parameter_ranges );
      ( "integerHyperParameterRanges",
        option_to_yojson default_integer_hyper_parameter_ranges_to_yojson
          x.integer_hyper_parameter_ranges );
    ]

let algorithm_to_yojson (x : algorithm) =
  assoc_to_yojson
    [
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ("trainingInputMode", option_to_yojson training_input_mode_to_yojson x.training_input_mode);
      ("defaultResourceConfig", option_to_yojson resource_config_to_yojson x.default_resource_config);
      ( "defaultHyperParameterRanges",
        option_to_yojson default_hyper_parameter_ranges_to_yojson x.default_hyper_parameter_ranges
      );
      ( "defaultHyperParameters",
        option_to_yojson hyper_parameters_to_yojson x.default_hyper_parameters );
      ("algorithmImage", option_to_yojson algorithm_image_to_yojson x.algorithm_image);
      ("algorithmArn", option_to_yojson arn_to_yojson x.algorithm_arn);
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let describe_algorithm_response_to_yojson (x : describe_algorithm_response) =
  assoc_to_yojson [ ("algorithm", option_to_yojson algorithm_to_yojson x.algorithm) ]

let describe_algorithm_request_to_yojson (x : describe_algorithm_request) =
  assoc_to_yojson [ ("algorithmArn", Some (arn_to_yojson x.algorithm_arn)) ]

let delete_solution_request_to_yojson (x : delete_solution_request) =
  assoc_to_yojson [ ("solutionArn", Some (arn_to_yojson x.solution_arn)) ]

let delete_schema_request_to_yojson (x : delete_schema_request) =
  assoc_to_yojson [ ("schemaArn", Some (arn_to_yojson x.schema_arn)) ]

let delete_recommender_request_to_yojson (x : delete_recommender_request) =
  assoc_to_yojson [ ("recommenderArn", Some (arn_to_yojson x.recommender_arn)) ]

let delete_metric_attribution_request_to_yojson (x : delete_metric_attribution_request) =
  assoc_to_yojson [ ("metricAttributionArn", Some (arn_to_yojson x.metric_attribution_arn)) ]

let delete_filter_request_to_yojson (x : delete_filter_request) =
  assoc_to_yojson [ ("filterArn", Some (arn_to_yojson x.filter_arn)) ]

let delete_event_tracker_request_to_yojson (x : delete_event_tracker_request) =
  assoc_to_yojson [ ("eventTrackerArn", Some (arn_to_yojson x.event_tracker_arn)) ]

let delete_dataset_request_to_yojson (x : delete_dataset_request) =
  assoc_to_yojson [ ("datasetArn", Some (arn_to_yojson x.dataset_arn)) ]

let delete_dataset_group_request_to_yojson (x : delete_dataset_group_request) =
  assoc_to_yojson [ ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn)) ]

let delete_campaign_request_to_yojson (x : delete_campaign_request) =
  assoc_to_yojson [ ("campaignArn", Some (arn_to_yojson x.campaign_arn)) ]

let create_solution_version_response_to_yojson (x : create_solution_version_response) =
  assoc_to_yojson [ ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn) ]

let create_solution_version_request_to_yojson (x : create_solution_version_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("trainingMode", option_to_yojson training_mode_to_yojson x.training_mode);
      ("solutionArn", Some (arn_to_yojson x.solution_arn));
      ("name", option_to_yojson name_to_yojson x.name);
    ]

let create_solution_response_to_yojson (x : create_solution_response) =
  assoc_to_yojson [ ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn) ]

let create_solution_request_to_yojson (x : create_solution_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("solutionConfig", option_to_yojson solution_config_to_yojson x.solution_config);
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ( "performAutoTraining",
        option_to_yojson perform_auto_training_to_yojson x.perform_auto_training );
      ("performAutoML", option_to_yojson perform_auto_m_l_to_yojson x.perform_auto_m_l);
      ("performHPO", option_to_yojson boolean__to_yojson x.perform_hp_o);
      ("name", Some (name_to_yojson x.name));
    ]

let create_schema_response_to_yojson (x : create_schema_response) =
  assoc_to_yojson [ ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn) ]

let create_schema_request_to_yojson (x : create_schema_request) =
  assoc_to_yojson
    [
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("schema", Some (avro_schema_to_yojson x.schema));
      ("name", Some (name_to_yojson x.name));
    ]

let create_recommender_response_to_yojson (x : create_recommender_response) =
  assoc_to_yojson [ ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn) ]

let create_recommender_request_to_yojson (x : create_recommender_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("recommenderConfig", option_to_yojson recommender_config_to_yojson x.recommender_config);
      ("recipeArn", Some (arn_to_yojson x.recipe_arn));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("name", Some (name_to_yojson x.name));
    ]

let create_metric_attribution_response_to_yojson (x : create_metric_attribution_response) =
  assoc_to_yojson
    [ ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn) ]

let create_metric_attribution_request_to_yojson (x : create_metric_attribution_request) =
  assoc_to_yojson
    [
      ("metricsOutputConfig", Some (metric_attribution_output_to_yojson x.metrics_output_config));
      ("metrics", Some (metric_attributes_to_yojson x.metrics));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("name", Some (name_to_yojson x.name));
    ]

let create_filter_response_to_yojson (x : create_filter_response) =
  assoc_to_yojson [ ("filterArn", option_to_yojson arn_to_yojson x.filter_arn) ]

let create_filter_request_to_yojson (x : create_filter_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("filterExpression", Some (filter_expression_to_yojson x.filter_expression));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("name", Some (name_to_yojson x.name));
    ]

let create_event_tracker_response_to_yojson (x : create_event_tracker_response) =
  assoc_to_yojson
    [
      ("trackingId", option_to_yojson tracking_id_to_yojson x.tracking_id);
      ("eventTrackerArn", option_to_yojson arn_to_yojson x.event_tracker_arn);
    ]

let create_event_tracker_request_to_yojson (x : create_event_tracker_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("name", Some (name_to_yojson x.name));
    ]

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson [ ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn) ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("datasetType", Some (dataset_type_to_yojson x.dataset_type));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("schemaArn", Some (arn_to_yojson x.schema_arn));
      ("name", Some (name_to_yojson x.name));
    ]

let create_dataset_import_job_response_to_yojson (x : create_dataset_import_job_response) =
  assoc_to_yojson
    [ ("datasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn) ]

let create_dataset_import_job_request_to_yojson (x : create_dataset_import_job_request) =
  assoc_to_yojson
    [
      ( "publishAttributionMetricsToS3",
        option_to_yojson boolean__to_yojson x.publish_attribution_metrics_to_s3 );
      ("importMode", option_to_yojson import_mode_to_yojson x.import_mode);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("dataSource", Some (data_source_to_yojson x.data_source));
      ("datasetArn", Some (arn_to_yojson x.dataset_arn));
      ("jobName", Some (name_to_yojson x.job_name));
    ]

let create_dataset_group_response_to_yojson (x : create_dataset_group_response) =
  assoc_to_yojson
    [
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
    ]

let create_dataset_group_request_to_yojson (x : create_dataset_group_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("kmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("name", Some (name_to_yojson x.name));
    ]

let create_dataset_export_job_response_to_yojson (x : create_dataset_export_job_response) =
  assoc_to_yojson
    [ ("datasetExportJobArn", option_to_yojson arn_to_yojson x.dataset_export_job_arn) ]

let create_dataset_export_job_request_to_yojson (x : create_dataset_export_job_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("jobOutput", Some (dataset_export_job_output_to_yojson x.job_output));
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("ingestionMode", option_to_yojson ingestion_mode_to_yojson x.ingestion_mode);
      ("datasetArn", Some (arn_to_yojson x.dataset_arn));
      ("jobName", Some (name_to_yojson x.job_name));
    ]

let create_data_deletion_job_response_to_yojson (x : create_data_deletion_job_response) =
  assoc_to_yojson [ ("dataDeletionJobArn", option_to_yojson arn_to_yojson x.data_deletion_job_arn) ]

let create_data_deletion_job_request_to_yojson (x : create_data_deletion_job_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("dataSource", Some (data_source_to_yojson x.data_source));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("jobName", Some (name_to_yojson x.job_name));
    ]

let create_campaign_response_to_yojson (x : create_campaign_response) =
  assoc_to_yojson [ ("campaignArn", option_to_yojson arn_to_yojson x.campaign_arn) ]

let create_campaign_request_to_yojson (x : create_campaign_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("campaignConfig", option_to_yojson campaign_config_to_yojson x.campaign_config);
      ( "minProvisionedTPS",
        option_to_yojson transactions_per_second_to_yojson x.min_provisioned_tp_s );
      ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn));
      ("name", Some (name_to_yojson x.name));
    ]

let create_batch_segment_job_response_to_yojson (x : create_batch_segment_job_response) =
  assoc_to_yojson [ ("batchSegmentJobArn", option_to_yojson arn_to_yojson x.batch_segment_job_arn) ]

let create_batch_segment_job_request_to_yojson (x : create_batch_segment_job_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("jobOutput", Some (batch_segment_job_output_to_yojson x.job_output));
      ("jobInput", Some (batch_segment_job_input_to_yojson x.job_input));
      ("numResults", option_to_yojson num_batch_results_to_yojson x.num_results);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn));
      ("jobName", Some (name_to_yojson x.job_name));
    ]

let create_batch_inference_job_response_to_yojson (x : create_batch_inference_job_response) =
  assoc_to_yojson
    [ ("batchInferenceJobArn", option_to_yojson arn_to_yojson x.batch_inference_job_arn) ]

let create_batch_inference_job_request_to_yojson (x : create_batch_inference_job_request) =
  assoc_to_yojson
    [
      ( "themeGenerationConfig",
        option_to_yojson theme_generation_config_to_yojson x.theme_generation_config );
      ( "batchInferenceJobMode",
        option_to_yojson batch_inference_job_mode_to_yojson x.batch_inference_job_mode );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "batchInferenceJobConfig",
        option_to_yojson batch_inference_job_config_to_yojson x.batch_inference_job_config );
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("jobOutput", Some (batch_inference_job_output_to_yojson x.job_output));
      ("jobInput", Some (batch_inference_job_input_to_yojson x.job_input));
      ("numResults", option_to_yojson num_batch_results_to_yojson x.num_results);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn));
      ("jobName", Some (name_to_yojson x.job_name));
    ]
