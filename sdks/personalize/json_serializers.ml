open Smaws_Lib.Json.SerializeHelpers
open Types

let account_id_to_yojson = string_to_yojson
let date_to_yojson = timestamp_epoch_seconds_to_yojson
let arn_to_yojson = string_to_yojson
let training_input_mode_to_yojson = string_to_yojson
let parameter_value_to_yojson = string_to_yojson
let parameter_name_to_yojson = string_to_yojson

let resource_config_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let tunable_to_yojson = bool_to_yojson
let categorical_value_to_yojson = string_to_yojson
let categorical_values_to_yojson tree = list_to_yojson categorical_value_to_yojson tree

let default_categorical_hyper_parameter_range_to_yojson
    (x : default_categorical_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("name", option_to_yojson parameter_name_to_yojson x.name);
      ("values", option_to_yojson categorical_values_to_yojson x.values);
      ("isTunable", option_to_yojson tunable_to_yojson x.is_tunable);
    ]

let default_categorical_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson default_categorical_hyper_parameter_range_to_yojson tree

let continuous_max_value_to_yojson = double_to_yojson
let continuous_min_value_to_yojson = double_to_yojson

let default_continuous_hyper_parameter_range_to_yojson
    (x : default_continuous_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("name", option_to_yojson parameter_name_to_yojson x.name);
      ("minValue", option_to_yojson continuous_min_value_to_yojson x.min_value);
      ("maxValue", option_to_yojson continuous_max_value_to_yojson x.max_value);
      ("isTunable", option_to_yojson tunable_to_yojson x.is_tunable);
    ]

let default_continuous_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson default_continuous_hyper_parameter_range_to_yojson tree

let integer_max_value_to_yojson = int_to_yojson
let integer_min_value_to_yojson = int_to_yojson

let default_integer_hyper_parameter_range_to_yojson (x : default_integer_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("name", option_to_yojson parameter_name_to_yojson x.name);
      ("minValue", option_to_yojson integer_min_value_to_yojson x.min_value);
      ("maxValue", option_to_yojson integer_max_value_to_yojson x.max_value);
      ("isTunable", option_to_yojson tunable_to_yojson x.is_tunable);
    ]

let default_integer_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson default_integer_hyper_parameter_range_to_yojson tree

let default_hyper_parameter_ranges_to_yojson (x : default_hyper_parameter_ranges) =
  assoc_to_yojson
    [
      ( "integerHyperParameterRanges",
        option_to_yojson default_integer_hyper_parameter_ranges_to_yojson
          x.integer_hyper_parameter_ranges );
      ( "continuousHyperParameterRanges",
        option_to_yojson default_continuous_hyper_parameter_ranges_to_yojson
          x.continuous_hyper_parameter_ranges );
      ( "categoricalHyperParameterRanges",
        option_to_yojson default_categorical_hyper_parameter_ranges_to_yojson
          x.categorical_hyper_parameter_ranges );
    ]

let hyper_parameters_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let docker_ur_i_to_yojson = string_to_yojson
let name_to_yojson = string_to_yojson

let algorithm_image_to_yojson (x : algorithm_image) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("dockerURI", Some (docker_ur_i_to_yojson x.docker_ur_i));
    ]

let algorithm_to_yojson (x : algorithm) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("algorithmArn", option_to_yojson arn_to_yojson x.algorithm_arn);
      ("algorithmImage", option_to_yojson algorithm_image_to_yojson x.algorithm_image);
      ( "defaultHyperParameters",
        option_to_yojson hyper_parameters_to_yojson x.default_hyper_parameters );
      ( "defaultHyperParameterRanges",
        option_to_yojson default_hyper_parameter_ranges_to_yojson x.default_hyper_parameter_ranges
      );
      ("defaultResourceConfig", option_to_yojson resource_config_to_yojson x.default_resource_config);
      ("trainingInputMode", option_to_yojson training_input_mode_to_yojson x.training_input_mode);
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
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

let update_solution_response_to_yojson (x : update_solution_response) =
  assoc_to_yojson [ ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn) ]

let event_type_weight_to_yojson = double_to_yojson
let event_type_threshold_value_to_yojson = double_to_yojson
let event_type_to_yojson = string_to_yojson

let event_parameters_to_yojson (x : event_parameters) =
  assoc_to_yojson
    [
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ( "eventValueThreshold",
        option_to_yojson event_type_threshold_value_to_yojson x.event_value_threshold );
      ("weight", option_to_yojson event_type_weight_to_yojson x.weight);
    ]

let event_parameters_list_to_yojson tree = list_to_yojson event_parameters_to_yojson tree

let events_config_to_yojson (x : events_config) =
  assoc_to_yojson
    [
      ( "eventParametersList",
        option_to_yojson event_parameters_list_to_yojson x.event_parameters_list );
    ]

let scheduling_expression_to_yojson = string_to_yojson

let auto_training_config_to_yojson (x : auto_training_config) =
  assoc_to_yojson
    [
      ( "schedulingExpression",
        option_to_yojson scheduling_expression_to_yojson x.scheduling_expression );
    ]

let solution_update_config_to_yojson (x : solution_update_config) =
  assoc_to_yojson
    [
      ("autoTrainingConfig", option_to_yojson auto_training_config_to_yojson x.auto_training_config);
      ("eventsConfig", option_to_yojson events_config_to_yojson x.events_config);
    ]

let perform_incremental_update_to_yojson = bool_to_yojson
let perform_auto_training_to_yojson = bool_to_yojson

let update_solution_request_to_yojson (x : update_solution_request) =
  assoc_to_yojson
    [
      ("solutionArn", Some (arn_to_yojson x.solution_arn));
      ( "performAutoTraining",
        option_to_yojson perform_auto_training_to_yojson x.perform_auto_training );
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ( "solutionUpdateConfig",
        option_to_yojson solution_update_config_to_yojson x.solution_update_config );
    ]

let update_recommender_response_to_yojson (x : update_recommender_response) =
  assoc_to_yojson [ ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn) ]

let boolean__to_yojson = bool_to_yojson
let column_name_to_yojson = string_to_yojson
let column_names_list_to_yojson tree = list_to_yojson column_name_to_yojson tree
let dataset_type_to_yojson = string_to_yojson

let included_dataset_columns_to_yojson tree =
  map_to_yojson dataset_type_to_yojson column_names_list_to_yojson tree

let excluded_dataset_columns_to_yojson tree =
  map_to_yojson dataset_type_to_yojson column_names_list_to_yojson tree

let training_data_config_to_yojson (x : training_data_config) =
  assoc_to_yojson
    [
      ( "excludedDatasetColumns",
        option_to_yojson excluded_dataset_columns_to_yojson x.excluded_dataset_columns );
      ( "includedDatasetColumns",
        option_to_yojson included_dataset_columns_to_yojson x.included_dataset_columns );
    ]

let transactions_per_second_to_yojson = int_to_yojson

let recommender_config_to_yojson (x : recommender_config) =
  assoc_to_yojson
    [
      ( "itemExplorationConfig",
        option_to_yojson hyper_parameters_to_yojson x.item_exploration_config );
      ( "minRecommendationRequestsPerSecond",
        option_to_yojson transactions_per_second_to_yojson x.min_recommendation_requests_per_second
      );
      ("trainingDataConfig", option_to_yojson training_data_config_to_yojson x.training_data_config);
      ( "enableMetadataWithRecommendations",
        option_to_yojson boolean__to_yojson x.enable_metadata_with_recommendations );
    ]

let update_recommender_request_to_yojson (x : update_recommender_request) =
  assoc_to_yojson
    [
      ("recommenderArn", Some (arn_to_yojson x.recommender_arn));
      ("recommenderConfig", Some (recommender_config_to_yojson x.recommender_config));
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let update_metric_attribution_response_to_yojson (x : update_metric_attribution_response) =
  assoc_to_yojson
    [ ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn) ]

let role_arn_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson
let s3_location_to_yojson = string_to_yojson

let s3_data_config_to_yojson (x : s3_data_config) =
  assoc_to_yojson
    [
      ("path", Some (s3_location_to_yojson x.path));
      ("kmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let metric_attribution_output_to_yojson (x : metric_attribution_output) =
  assoc_to_yojson
    [
      ("s3DataDestination", option_to_yojson s3_data_config_to_yojson x.s3_data_destination);
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
    ]

let metric_name_to_yojson = string_to_yojson
let metric_attributes_names_list_to_yojson tree = list_to_yojson metric_name_to_yojson tree
let metric_expression_to_yojson = string_to_yojson

let metric_attribute_to_yojson (x : metric_attribute) =
  assoc_to_yojson
    [
      ("eventType", Some (event_type_to_yojson x.event_type));
      ("metricName", Some (metric_name_to_yojson x.metric_name));
      ("expression", Some (metric_expression_to_yojson x.expression));
    ]

let metric_attributes_to_yojson tree = list_to_yojson metric_attribute_to_yojson tree

let update_metric_attribution_request_to_yojson (x : update_metric_attribution_request) =
  assoc_to_yojson
    [
      ("addMetrics", option_to_yojson metric_attributes_to_yojson x.add_metrics);
      ("removeMetrics", option_to_yojson metric_attributes_names_list_to_yojson x.remove_metrics);
      ( "metricsOutputConfig",
        option_to_yojson metric_attribution_output_to_yojson x.metrics_output_config );
      ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn);
    ]

let update_dataset_response_to_yojson (x : update_dataset_response) =
  assoc_to_yojson [ ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn) ]

let update_dataset_request_to_yojson (x : update_dataset_request) =
  assoc_to_yojson
    [
      ("datasetArn", Some (arn_to_yojson x.dataset_arn));
      ("schemaArn", Some (arn_to_yojson x.schema_arn));
    ]

let update_campaign_response_to_yojson (x : update_campaign_response) =
  assoc_to_yojson [ ("campaignArn", option_to_yojson arn_to_yojson x.campaign_arn) ]

let ranking_influence_weight_to_yojson = double_to_yojson

let ranking_influence_type_to_yojson (x : ranking_influence_type) =
  match x with POPULARITY -> `String "POPULARITY" | FRESHNESS -> `String "FRESHNESS"

let ranking_influence_to_yojson tree =
  map_to_yojson ranking_influence_type_to_yojson ranking_influence_weight_to_yojson tree

let campaign_config_to_yojson (x : campaign_config) =
  assoc_to_yojson
    [
      ( "itemExplorationConfig",
        option_to_yojson hyper_parameters_to_yojson x.item_exploration_config );
      ( "enableMetadataWithRecommendations",
        option_to_yojson boolean__to_yojson x.enable_metadata_with_recommendations );
      ( "syncWithLatestSolutionVersion",
        option_to_yojson boolean__to_yojson x.sync_with_latest_solution_version );
      ("rankingInfluence", option_to_yojson ranking_influence_to_yojson x.ranking_influence);
    ]

let update_campaign_request_to_yojson (x : update_campaign_request) =
  assoc_to_yojson
    [
      ("campaignArn", Some (arn_to_yojson x.campaign_arn));
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ( "minProvisionedTPS",
        option_to_yojson transactions_per_second_to_yojson x.min_provisioned_tp_s );
      ("campaignConfig", option_to_yojson campaign_config_to_yojson x.campaign_config);
    ]

let too_many_tag_keys_exception_to_yojson (x : too_many_tag_keys_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("tagKey", Some (tag_key_to_yojson x.tag_key));
      ("tagValue", Some (tag_value_to_yojson x.tag_value));
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("resourceArn", Some (arn_to_yojson x.resource_arn)); ("tags", Some (tags_to_yojson x.tags)) ]

let stop_solution_version_creation_request_to_yojson (x : stop_solution_version_creation_request) =
  assoc_to_yojson [ ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn)) ]

let stop_recommender_response_to_yojson (x : stop_recommender_response) =
  assoc_to_yojson [ ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn) ]

let stop_recommender_request_to_yojson (x : stop_recommender_request) =
  assoc_to_yojson [ ("recommenderArn", Some (arn_to_yojson x.recommender_arn)) ]

let start_recommender_response_to_yojson (x : start_recommender_response) =
  assoc_to_yojson [ ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn) ]

let start_recommender_request_to_yojson (x : start_recommender_request) =
  assoc_to_yojson [ ("recommenderArn", Some (arn_to_yojson x.recommender_arn)) ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let next_token_to_yojson = string_to_yojson
let failure_reason_to_yojson = string_to_yojson

let training_type_to_yojson (x : training_type) =
  match x with AUTOMATIC -> `String "AUTOMATIC" | MANUAL -> `String "MANUAL"

let training_mode_to_yojson (x : training_mode) =
  match x with
  | FULL -> `String "FULL"
  | UPDATE -> `String "UPDATE"
  | AUTOTRAIN -> `String "AUTOTRAIN"

let status_to_yojson = string_to_yojson

let solution_version_summary_to_yojson (x : solution_version_summary) =
  assoc_to_yojson
    [
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("trainingMode", option_to_yojson training_mode_to_yojson x.training_mode);
      ("trainingType", option_to_yojson training_type_to_yojson x.training_type);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let solution_versions_to_yojson tree = list_to_yojson solution_version_summary_to_yojson tree

let list_solution_versions_response_to_yojson (x : list_solution_versions_response) =
  assoc_to_yojson
    [
      ("solutionVersions", option_to_yojson solution_versions_to_yojson x.solution_versions);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_solution_versions_request_to_yojson (x : list_solution_versions_request) =
  assoc_to_yojson
    [
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let solution_summary_to_yojson (x : solution_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
    ]

let solutions_to_yojson tree = list_to_yojson solution_summary_to_yojson tree

let list_solutions_response_to_yojson (x : list_solutions_response) =
  assoc_to_yojson
    [
      ("solutions", option_to_yojson solutions_to_yojson x.solutions);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_solutions_request_to_yojson (x : list_solutions_request) =
  assoc_to_yojson
    [
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let domain_to_yojson (x : domain) =
  match x with ECOMMERCE -> `String "ECOMMERCE" | VIDEO_ON_DEMAND -> `String "VIDEO_ON_DEMAND"

let dataset_schema_summary_to_yojson (x : dataset_schema_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("domain", option_to_yojson domain_to_yojson x.domain);
    ]

let schemas_to_yojson tree = list_to_yojson dataset_schema_summary_to_yojson tree

let list_schemas_response_to_yojson (x : list_schemas_response) =
  assoc_to_yojson
    [
      ("schemas", option_to_yojson schemas_to_yojson x.schemas);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_schemas_request_to_yojson (x : list_schemas_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let recommender_summary_to_yojson (x : recommender_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("recommenderConfig", option_to_yojson recommender_config_to_yojson x.recommender_config);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let recommenders_to_yojson tree = list_to_yojson recommender_summary_to_yojson tree

let list_recommenders_response_to_yojson (x : list_recommenders_response) =
  assoc_to_yojson
    [
      ("recommenders", option_to_yojson recommenders_to_yojson x.recommenders);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_recommenders_request_to_yojson (x : list_recommenders_request) =
  assoc_to_yojson
    [
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let recipe_summary_to_yojson (x : recipe_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("domain", option_to_yojson domain_to_yojson x.domain);
    ]

let recipes_to_yojson tree = list_to_yojson recipe_summary_to_yojson tree

let list_recipes_response_to_yojson (x : list_recipes_response) =
  assoc_to_yojson
    [
      ("recipes", option_to_yojson recipes_to_yojson x.recipes);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let recipe_provider_to_yojson (x : recipe_provider) = match x with SERVICE -> `String "SERVICE"

let list_recipes_request_to_yojson (x : list_recipes_request) =
  assoc_to_yojson
    [
      ("recipeProvider", option_to_yojson recipe_provider_to_yojson x.recipe_provider);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("domain", option_to_yojson domain_to_yojson x.domain);
    ]

let metric_attribution_summary_to_yojson (x : metric_attribution_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let metric_attributions_to_yojson tree = list_to_yojson metric_attribution_summary_to_yojson tree

let list_metric_attributions_response_to_yojson (x : list_metric_attributions_response) =
  assoc_to_yojson
    [
      ("metricAttributions", option_to_yojson metric_attributions_to_yojson x.metric_attributions);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_metric_attributions_request_to_yojson (x : list_metric_attributions_request) =
  assoc_to_yojson
    [
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_metric_attribution_metrics_response_to_yojson
    (x : list_metric_attribution_metrics_response) =
  assoc_to_yojson
    [
      ("metrics", option_to_yojson metric_attributes_to_yojson x.metrics);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_metric_attribution_metrics_request_to_yojson (x : list_metric_attribution_metrics_request)
    =
  assoc_to_yojson
    [
      ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let filter_summary_to_yojson (x : filter_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("status", option_to_yojson status_to_yojson x.status);
    ]

let filters_to_yojson tree = list_to_yojson filter_summary_to_yojson tree

let list_filters_response_to_yojson (x : list_filters_response) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_filters_request_to_yojson (x : list_filters_request) =
  assoc_to_yojson
    [
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let event_tracker_summary_to_yojson (x : event_tracker_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("eventTrackerArn", option_to_yojson arn_to_yojson x.event_tracker_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let event_trackers_to_yojson tree = list_to_yojson event_tracker_summary_to_yojson tree

let list_event_trackers_response_to_yojson (x : list_event_trackers_response) =
  assoc_to_yojson
    [
      ("eventTrackers", option_to_yojson event_trackers_to_yojson x.event_trackers);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_event_trackers_request_to_yojson (x : list_event_trackers_request) =
  assoc_to_yojson
    [
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let dataset_summary_to_yojson (x : dataset_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("datasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let datasets_to_yojson tree = list_to_yojson dataset_summary_to_yojson tree

let list_datasets_response_to_yojson (x : list_datasets_response) =
  assoc_to_yojson
    [
      ("datasets", option_to_yojson datasets_to_yojson x.datasets);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_datasets_request_to_yojson (x : list_datasets_request) =
  assoc_to_yojson
    [
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let import_mode_to_yojson (x : import_mode) =
  match x with FULL -> `String "FULL" | INCREMENTAL -> `String "INCREMENTAL"

let dataset_import_job_summary_to_yojson (x : dataset_import_job_summary) =
  assoc_to_yojson
    [
      ("datasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("importMode", option_to_yojson import_mode_to_yojson x.import_mode);
    ]

let dataset_import_jobs_to_yojson tree = list_to_yojson dataset_import_job_summary_to_yojson tree

let list_dataset_import_jobs_response_to_yojson (x : list_dataset_import_jobs_response) =
  assoc_to_yojson
    [
      ("datasetImportJobs", option_to_yojson dataset_import_jobs_to_yojson x.dataset_import_jobs);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_dataset_import_jobs_request_to_yojson (x : list_dataset_import_jobs_request) =
  assoc_to_yojson
    [
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let dataset_group_summary_to_yojson (x : dataset_group_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("domain", option_to_yojson domain_to_yojson x.domain);
    ]

let dataset_groups_to_yojson tree = list_to_yojson dataset_group_summary_to_yojson tree

let list_dataset_groups_response_to_yojson (x : list_dataset_groups_response) =
  assoc_to_yojson
    [
      ("datasetGroups", option_to_yojson dataset_groups_to_yojson x.dataset_groups);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_dataset_groups_request_to_yojson (x : list_dataset_groups_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let dataset_export_job_summary_to_yojson (x : dataset_export_job_summary) =
  assoc_to_yojson
    [
      ("datasetExportJobArn", option_to_yojson arn_to_yojson x.dataset_export_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let dataset_export_jobs_to_yojson tree = list_to_yojson dataset_export_job_summary_to_yojson tree

let list_dataset_export_jobs_response_to_yojson (x : list_dataset_export_jobs_response) =
  assoc_to_yojson
    [
      ("datasetExportJobs", option_to_yojson dataset_export_jobs_to_yojson x.dataset_export_jobs);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_dataset_export_jobs_request_to_yojson (x : list_dataset_export_jobs_request) =
  assoc_to_yojson
    [
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let data_deletion_job_summary_to_yojson (x : data_deletion_job_summary) =
  assoc_to_yojson
    [
      ("dataDeletionJobArn", option_to_yojson arn_to_yojson x.data_deletion_job_arn);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let data_deletion_jobs_to_yojson tree = list_to_yojson data_deletion_job_summary_to_yojson tree

let list_data_deletion_jobs_response_to_yojson (x : list_data_deletion_jobs_response) =
  assoc_to_yojson
    [
      ("dataDeletionJobs", option_to_yojson data_deletion_jobs_to_yojson x.data_deletion_jobs);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_data_deletion_jobs_request_to_yojson (x : list_data_deletion_jobs_request) =
  assoc_to_yojson
    [
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let campaign_summary_to_yojson (x : campaign_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("campaignArn", option_to_yojson arn_to_yojson x.campaign_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let campaigns_to_yojson tree = list_to_yojson campaign_summary_to_yojson tree

let list_campaigns_response_to_yojson (x : list_campaigns_response) =
  assoc_to_yojson
    [
      ("campaigns", option_to_yojson campaigns_to_yojson x.campaigns);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_campaigns_request_to_yojson (x : list_campaigns_request) =
  assoc_to_yojson
    [
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let batch_segment_job_summary_to_yojson (x : batch_segment_job_summary) =
  assoc_to_yojson
    [
      ("batchSegmentJobArn", option_to_yojson arn_to_yojson x.batch_segment_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
    ]

let batch_segment_jobs_to_yojson tree = list_to_yojson batch_segment_job_summary_to_yojson tree

let list_batch_segment_jobs_response_to_yojson (x : list_batch_segment_jobs_response) =
  assoc_to_yojson
    [
      ("batchSegmentJobs", option_to_yojson batch_segment_jobs_to_yojson x.batch_segment_jobs);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_batch_segment_jobs_request_to_yojson (x : list_batch_segment_jobs_request) =
  assoc_to_yojson
    [
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let batch_inference_job_mode_to_yojson (x : batch_inference_job_mode) =
  match x with
  | BATCH_INFERENCE -> `String "BATCH_INFERENCE"
  | THEME_GENERATION -> `String "THEME_GENERATION"

let batch_inference_job_summary_to_yojson (x : batch_inference_job_summary) =
  assoc_to_yojson
    [
      ("batchInferenceJobArn", option_to_yojson arn_to_yojson x.batch_inference_job_arn);
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ( "batchInferenceJobMode",
        option_to_yojson batch_inference_job_mode_to_yojson x.batch_inference_job_mode );
    ]

let batch_inference_jobs_to_yojson tree = list_to_yojson batch_inference_job_summary_to_yojson tree

let list_batch_inference_jobs_response_to_yojson (x : list_batch_inference_jobs_response) =
  assoc_to_yojson
    [
      ("batchInferenceJobs", option_to_yojson batch_inference_jobs_to_yojson x.batch_inference_jobs);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_batch_inference_jobs_request_to_yojson (x : list_batch_inference_jobs_request) =
  assoc_to_yojson
    [
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let metric_value_to_yojson = double_to_yojson
let metrics_to_yojson tree = map_to_yojson metric_name_to_yojson metric_value_to_yojson tree

let get_solution_metrics_response_to_yojson (x : get_solution_metrics_response) =
  assoc_to_yojson
    [
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("metrics", option_to_yojson metrics_to_yojson x.metrics);
    ]

let get_solution_metrics_request_to_yojson (x : get_solution_metrics_request) =
  assoc_to_yojson [ ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn)) ]

let tuned_hpo_params_to_yojson (x : tuned_hpo_params) =
  assoc_to_yojson
    [
      ( "algorithmHyperParameters",
        option_to_yojson hyper_parameters_to_yojson x.algorithm_hyper_parameters );
    ]

let training_hours_to_yojson = double_to_yojson

let objective_sensitivity_to_yojson (x : objective_sensitivity) =
  match x with
  | LOW -> `String "LOW"
  | MEDIUM -> `String "MEDIUM"
  | HIGH -> `String "HIGH"
  | OFF -> `String "OFF"

let item_attribute_to_yojson = string_to_yojson

let optimization_objective_to_yojson (x : optimization_objective) =
  assoc_to_yojson
    [
      ("itemAttribute", option_to_yojson item_attribute_to_yojson x.item_attribute);
      ( "objectiveSensitivity",
        option_to_yojson objective_sensitivity_to_yojson x.objective_sensitivity );
    ]

let arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let auto_ml_config_to_yojson (x : auto_ml_config) =
  assoc_to_yojson
    [
      ("metricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("recipeList", option_to_yojson arn_list_to_yojson x.recipe_list);
    ]

let feature_transformation_parameters_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let categorical_hyper_parameter_range_to_yojson (x : categorical_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("name", option_to_yojson parameter_name_to_yojson x.name);
      ("values", option_to_yojson categorical_values_to_yojson x.values);
    ]

let categorical_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson categorical_hyper_parameter_range_to_yojson tree

let continuous_hyper_parameter_range_to_yojson (x : continuous_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("name", option_to_yojson parameter_name_to_yojson x.name);
      ("minValue", option_to_yojson continuous_min_value_to_yojson x.min_value);
      ("maxValue", option_to_yojson continuous_max_value_to_yojson x.max_value);
    ]

let continuous_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson continuous_hyper_parameter_range_to_yojson tree

let integer_hyper_parameter_range_to_yojson (x : integer_hyper_parameter_range) =
  assoc_to_yojson
    [
      ("name", option_to_yojson parameter_name_to_yojson x.name);
      ("minValue", option_to_yojson integer_min_value_to_yojson x.min_value);
      ("maxValue", option_to_yojson integer_max_value_to_yojson x.max_value);
    ]

let integer_hyper_parameter_ranges_to_yojson tree =
  list_to_yojson integer_hyper_parameter_range_to_yojson tree

let hyper_parameter_ranges_to_yojson (x : hyper_parameter_ranges) =
  assoc_to_yojson
    [
      ( "integerHyperParameterRanges",
        option_to_yojson integer_hyper_parameter_ranges_to_yojson x.integer_hyper_parameter_ranges
      );
      ( "continuousHyperParameterRanges",
        option_to_yojson continuous_hyper_parameter_ranges_to_yojson
          x.continuous_hyper_parameter_ranges );
      ( "categoricalHyperParameterRanges",
        option_to_yojson categorical_hyper_parameter_ranges_to_yojson
          x.categorical_hyper_parameter_ranges );
    ]

let hpo_resource_to_yojson = string_to_yojson

let hpo_resource_config_to_yojson (x : hpo_resource_config) =
  assoc_to_yojson
    [
      ( "maxNumberOfTrainingJobs",
        option_to_yojson hpo_resource_to_yojson x.max_number_of_training_jobs );
      ( "maxParallelTrainingJobs",
        option_to_yojson hpo_resource_to_yojson x.max_parallel_training_jobs );
    ]

let metric_regex_to_yojson = string_to_yojson
let hpo_objective_type_to_yojson = string_to_yojson

let hpo_objective_to_yojson (x : hpo_objective) =
  assoc_to_yojson
    [
      ("type", option_to_yojson hpo_objective_type_to_yojson x.type_);
      ("metricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("metricRegex", option_to_yojson metric_regex_to_yojson x.metric_regex);
    ]

let hpo_config_to_yojson (x : hpo_config) =
  assoc_to_yojson
    [
      ("hpoObjective", option_to_yojson hpo_objective_to_yojson x.hpo_objective);
      ("hpoResourceConfig", option_to_yojson hpo_resource_config_to_yojson x.hpo_resource_config);
      ( "algorithmHyperParameterRanges",
        option_to_yojson hyper_parameter_ranges_to_yojson x.algorithm_hyper_parameter_ranges );
    ]

let event_value_threshold_to_yojson = string_to_yojson

let solution_config_to_yojson (x : solution_config) =
  assoc_to_yojson
    [
      ( "eventValueThreshold",
        option_to_yojson event_value_threshold_to_yojson x.event_value_threshold );
      ("hpoConfig", option_to_yojson hpo_config_to_yojson x.hpo_config);
      ( "algorithmHyperParameters",
        option_to_yojson hyper_parameters_to_yojson x.algorithm_hyper_parameters );
      ( "featureTransformationParameters",
        option_to_yojson feature_transformation_parameters_to_yojson
          x.feature_transformation_parameters );
      ("autoMLConfig", option_to_yojson auto_ml_config_to_yojson x.auto_ml_config);
      ("eventsConfig", option_to_yojson events_config_to_yojson x.events_config);
      ( "optimizationObjective",
        option_to_yojson optimization_objective_to_yojson x.optimization_objective );
      ("trainingDataConfig", option_to_yojson training_data_config_to_yojson x.training_data_config);
      ("autoTrainingConfig", option_to_yojson auto_training_config_to_yojson x.auto_training_config);
    ]

let perform_auto_m_l_to_yojson = bool_to_yojson
let perform_hp_o_to_yojson = bool_to_yojson

let solution_version_to_yojson (x : solution_version) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
      ("performHPO", option_to_yojson perform_hp_o_to_yojson x.perform_hp_o);
      ("performAutoML", option_to_yojson perform_auto_m_l_to_yojson x.perform_auto_m_l);
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("solutionConfig", option_to_yojson solution_config_to_yojson x.solution_config);
      ("trainingHours", option_to_yojson training_hours_to_yojson x.training_hours);
      ("trainingMode", option_to_yojson training_mode_to_yojson x.training_mode);
      ("tunedHPOParams", option_to_yojson tuned_hpo_params_to_yojson x.tuned_hpo_params);
      ("status", option_to_yojson status_to_yojson x.status);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("trainingType", option_to_yojson training_type_to_yojson x.training_type);
    ]

let describe_solution_version_response_to_yojson (x : describe_solution_version_response) =
  assoc_to_yojson
    [ ("solutionVersion", option_to_yojson solution_version_to_yojson x.solution_version) ]

let describe_solution_version_request_to_yojson (x : describe_solution_version_request) =
  assoc_to_yojson [ ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn)) ]

let solution_update_summary_to_yojson (x : solution_update_summary) =
  assoc_to_yojson
    [
      ( "solutionUpdateConfig",
        option_to_yojson solution_update_config_to_yojson x.solution_update_config );
      ("status", option_to_yojson status_to_yojson x.status);
      ( "performAutoTraining",
        option_to_yojson perform_auto_training_to_yojson x.perform_auto_training );
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let auto_ml_result_to_yojson (x : auto_ml_result) =
  assoc_to_yojson [ ("bestRecipeArn", option_to_yojson arn_to_yojson x.best_recipe_arn) ]

let solution_to_yojson (x : solution) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn);
      ("performHPO", option_to_yojson perform_hp_o_to_yojson x.perform_hp_o);
      ("performAutoML", option_to_yojson perform_auto_m_l_to_yojson x.perform_auto_m_l);
      ( "performAutoTraining",
        option_to_yojson perform_auto_training_to_yojson x.perform_auto_training );
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ("solutionConfig", option_to_yojson solution_config_to_yojson x.solution_config);
      ("autoMLResult", option_to_yojson auto_ml_result_to_yojson x.auto_ml_result);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ( "latestSolutionVersion",
        option_to_yojson solution_version_summary_to_yojson x.latest_solution_version );
      ( "latestSolutionUpdate",
        option_to_yojson solution_update_summary_to_yojson x.latest_solution_update );
    ]

let describe_solution_response_to_yojson (x : describe_solution_response) =
  assoc_to_yojson [ ("solution", option_to_yojson solution_to_yojson x.solution) ]

let describe_solution_request_to_yojson (x : describe_solution_request) =
  assoc_to_yojson [ ("solutionArn", Some (arn_to_yojson x.solution_arn)) ]

let avro_schema_to_yojson = string_to_yojson

let dataset_schema_to_yojson (x : dataset_schema) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn);
      ("schema", option_to_yojson avro_schema_to_yojson x.schema);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("domain", option_to_yojson domain_to_yojson x.domain);
    ]

let describe_schema_response_to_yojson (x : describe_schema_response) =
  assoc_to_yojson [ ("schema", option_to_yojson dataset_schema_to_yojson x.schema) ]

let describe_schema_request_to_yojson (x : describe_schema_request) =
  assoc_to_yojson [ ("schemaArn", Some (arn_to_yojson x.schema_arn)) ]

let recommender_update_summary_to_yojson (x : recommender_update_summary) =
  assoc_to_yojson
    [
      ("recommenderConfig", option_to_yojson recommender_config_to_yojson x.recommender_config);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let recommender_to_yojson (x : recommender) =
  assoc_to_yojson
    [
      ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("recommenderConfig", option_to_yojson recommender_config_to_yojson x.recommender_config);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ( "latestRecommenderUpdate",
        option_to_yojson recommender_update_summary_to_yojson x.latest_recommender_update );
      ("modelMetrics", option_to_yojson metrics_to_yojson x.model_metrics);
    ]

let describe_recommender_response_to_yojson (x : describe_recommender_response) =
  assoc_to_yojson [ ("recommender", option_to_yojson recommender_to_yojson x.recommender) ]

let describe_recommender_request_to_yojson (x : describe_recommender_request) =
  assoc_to_yojson [ ("recommenderArn", Some (arn_to_yojson x.recommender_arn)) ]

let recipe_type_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let recipe_to_yojson (x : recipe) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("algorithmArn", option_to_yojson arn_to_yojson x.algorithm_arn);
      ("featureTransformationArn", option_to_yojson arn_to_yojson x.feature_transformation_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("description", option_to_yojson description_to_yojson x.description);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("recipeType", option_to_yojson recipe_type_to_yojson x.recipe_type);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let describe_recipe_response_to_yojson (x : describe_recipe_response) =
  assoc_to_yojson [ ("recipe", option_to_yojson recipe_to_yojson x.recipe) ]

let describe_recipe_request_to_yojson (x : describe_recipe_request) =
  assoc_to_yojson [ ("recipeArn", Some (arn_to_yojson x.recipe_arn)) ]

let metric_attribution_to_yojson (x : metric_attribution) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ( "metricsOutputConfig",
        option_to_yojson metric_attribution_output_to_yojson x.metrics_output_config );
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let describe_metric_attribution_response_to_yojson (x : describe_metric_attribution_response) =
  assoc_to_yojson
    [ ("metricAttribution", option_to_yojson metric_attribution_to_yojson x.metric_attribution) ]

let describe_metric_attribution_request_to_yojson (x : describe_metric_attribution_request) =
  assoc_to_yojson [ ("metricAttributionArn", Some (arn_to_yojson x.metric_attribution_arn)) ]

let filter_expression_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("filterExpression", option_to_yojson filter_expression_to_yojson x.filter_expression);
      ("status", option_to_yojson status_to_yojson x.status);
    ]

let describe_filter_response_to_yojson (x : describe_filter_response) =
  assoc_to_yojson [ ("filter", option_to_yojson filter_to_yojson x.filter) ]

let describe_filter_request_to_yojson (x : describe_filter_request) =
  assoc_to_yojson [ ("filterArn", Some (arn_to_yojson x.filter_arn)) ]

let featurization_parameters_to_yojson tree =
  map_to_yojson parameter_name_to_yojson parameter_value_to_yojson tree

let feature_transformation_to_yojson (x : feature_transformation) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("featureTransformationArn", option_to_yojson arn_to_yojson x.feature_transformation_arn);
      ("defaultParameters", option_to_yojson featurization_parameters_to_yojson x.default_parameters);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("status", option_to_yojson status_to_yojson x.status);
    ]

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

let tracking_id_to_yojson = string_to_yojson

let event_tracker_to_yojson (x : event_tracker) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("eventTrackerArn", option_to_yojson arn_to_yojson x.event_tracker_arn);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("trackingId", option_to_yojson tracking_id_to_yojson x.tracking_id);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let describe_event_tracker_response_to_yojson (x : describe_event_tracker_response) =
  assoc_to_yojson [ ("eventTracker", option_to_yojson event_tracker_to_yojson x.event_tracker) ]

let describe_event_tracker_request_to_yojson (x : describe_event_tracker_request) =
  assoc_to_yojson [ ("eventTrackerArn", Some (arn_to_yojson x.event_tracker_arn)) ]

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson [ ("dataLocation", option_to_yojson s3_location_to_yojson x.data_location) ]

let dataset_import_job_to_yojson (x : dataset_import_job) =
  assoc_to_yojson
    [
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("datasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("importMode", option_to_yojson import_mode_to_yojson x.import_mode);
      ( "publishAttributionMetricsToS3",
        option_to_yojson boolean__to_yojson x.publish_attribution_metrics_to_s3 );
    ]

let describe_dataset_import_job_response_to_yojson (x : describe_dataset_import_job_response) =
  assoc_to_yojson
    [ ("datasetImportJob", option_to_yojson dataset_import_job_to_yojson x.dataset_import_job) ]

let describe_dataset_import_job_request_to_yojson (x : describe_dataset_import_job_request) =
  assoc_to_yojson [ ("datasetImportJobArn", Some (arn_to_yojson x.dataset_import_job_arn)) ]

let dataset_group_to_yojson (x : dataset_group) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("kmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("domain", option_to_yojson domain_to_yojson x.domain);
    ]

let describe_dataset_group_response_to_yojson (x : describe_dataset_group_response) =
  assoc_to_yojson [ ("datasetGroup", option_to_yojson dataset_group_to_yojson x.dataset_group) ]

let describe_dataset_group_request_to_yojson (x : describe_dataset_group_request) =
  assoc_to_yojson [ ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn)) ]

let dataset_export_job_output_to_yojson (x : dataset_export_job_output) =
  assoc_to_yojson [ ("s3DataDestination", Some (s3_data_config_to_yojson x.s3_data_destination)) ]

let ingestion_mode_to_yojson (x : ingestion_mode) =
  match x with BULK -> `String "BULK" | PUT -> `String "PUT" | ALL -> `String "ALL"

let dataset_export_job_to_yojson (x : dataset_export_job) =
  assoc_to_yojson
    [
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("datasetExportJobArn", option_to_yojson arn_to_yojson x.dataset_export_job_arn);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("ingestionMode", option_to_yojson ingestion_mode_to_yojson x.ingestion_mode);
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("jobOutput", option_to_yojson dataset_export_job_output_to_yojson x.job_output);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let describe_dataset_export_job_response_to_yojson (x : describe_dataset_export_job_response) =
  assoc_to_yojson
    [ ("datasetExportJob", option_to_yojson dataset_export_job_to_yojson x.dataset_export_job) ]

let describe_dataset_export_job_request_to_yojson (x : describe_dataset_export_job_request) =
  assoc_to_yojson [ ("datasetExportJobArn", Some (arn_to_yojson x.dataset_export_job_arn)) ]

let dataset_update_summary_to_yojson (x : dataset_update_summary) =
  assoc_to_yojson
    [
      ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let dataset_to_yojson (x : dataset) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("datasetType", option_to_yojson dataset_type_to_yojson x.dataset_type);
      ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ( "latestDatasetUpdate",
        option_to_yojson dataset_update_summary_to_yojson x.latest_dataset_update );
      ("trackingId", option_to_yojson tracking_id_to_yojson x.tracking_id);
    ]

let describe_dataset_response_to_yojson (x : describe_dataset_response) =
  assoc_to_yojson [ ("dataset", option_to_yojson dataset_to_yojson x.dataset) ]

let describe_dataset_request_to_yojson (x : describe_dataset_request) =
  assoc_to_yojson [ ("datasetArn", Some (arn_to_yojson x.dataset_arn)) ]

let integer_to_yojson = int_to_yojson

let data_deletion_job_to_yojson (x : data_deletion_job) =
  assoc_to_yojson
    [
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("dataDeletionJobArn", option_to_yojson arn_to_yojson x.data_deletion_job_arn);
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("numDeleted", option_to_yojson integer_to_yojson x.num_deleted);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
    ]

let describe_data_deletion_job_response_to_yojson (x : describe_data_deletion_job_response) =
  assoc_to_yojson
    [ ("dataDeletionJob", option_to_yojson data_deletion_job_to_yojson x.data_deletion_job) ]

let describe_data_deletion_job_request_to_yojson (x : describe_data_deletion_job_request) =
  assoc_to_yojson [ ("dataDeletionJobArn", Some (arn_to_yojson x.data_deletion_job_arn)) ]

let campaign_update_summary_to_yojson (x : campaign_update_summary) =
  assoc_to_yojson
    [
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ( "minProvisionedTPS",
        option_to_yojson transactions_per_second_to_yojson x.min_provisioned_tp_s );
      ("campaignConfig", option_to_yojson campaign_config_to_yojson x.campaign_config);
      ("status", option_to_yojson status_to_yojson x.status);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let campaign_to_yojson (x : campaign) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("campaignArn", option_to_yojson arn_to_yojson x.campaign_arn);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ( "minProvisionedTPS",
        option_to_yojson transactions_per_second_to_yojson x.min_provisioned_tp_s );
      ("campaignConfig", option_to_yojson campaign_config_to_yojson x.campaign_config);
      ("status", option_to_yojson status_to_yojson x.status);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
      ( "latestCampaignUpdate",
        option_to_yojson campaign_update_summary_to_yojson x.latest_campaign_update );
    ]

let describe_campaign_response_to_yojson (x : describe_campaign_response) =
  assoc_to_yojson [ ("campaign", option_to_yojson campaign_to_yojson x.campaign) ]

let describe_campaign_request_to_yojson (x : describe_campaign_request) =
  assoc_to_yojson [ ("campaignArn", Some (arn_to_yojson x.campaign_arn)) ]

let batch_segment_job_output_to_yojson (x : batch_segment_job_output) =
  assoc_to_yojson [ ("s3DataDestination", Some (s3_data_config_to_yojson x.s3_data_destination)) ]

let batch_segment_job_input_to_yojson (x : batch_segment_job_input) =
  assoc_to_yojson [ ("s3DataSource", Some (s3_data_config_to_yojson x.s3_data_source)) ]

let num_batch_results_to_yojson = int_to_yojson

let batch_segment_job_to_yojson (x : batch_segment_job) =
  assoc_to_yojson
    [
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("batchSegmentJobArn", option_to_yojson arn_to_yojson x.batch_segment_job_arn);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("numResults", option_to_yojson num_batch_results_to_yojson x.num_results);
      ("jobInput", option_to_yojson batch_segment_job_input_to_yojson x.job_input);
      ("jobOutput", option_to_yojson batch_segment_job_output_to_yojson x.job_output);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let describe_batch_segment_job_response_to_yojson (x : describe_batch_segment_job_response) =
  assoc_to_yojson
    [ ("batchSegmentJob", option_to_yojson batch_segment_job_to_yojson x.batch_segment_job) ]

let describe_batch_segment_job_request_to_yojson (x : describe_batch_segment_job_request) =
  assoc_to_yojson [ ("batchSegmentJobArn", Some (arn_to_yojson x.batch_segment_job_arn)) ]

let fields_for_theme_generation_to_yojson (x : fields_for_theme_generation) =
  assoc_to_yojson [ ("itemName", Some (column_name_to_yojson x.item_name)) ]

let theme_generation_config_to_yojson (x : theme_generation_config) =
  assoc_to_yojson
    [
      ( "fieldsForThemeGeneration",
        Some (fields_for_theme_generation_to_yojson x.fields_for_theme_generation) );
    ]

let batch_inference_job_config_to_yojson (x : batch_inference_job_config) =
  assoc_to_yojson
    [
      ( "itemExplorationConfig",
        option_to_yojson hyper_parameters_to_yojson x.item_exploration_config );
      ("rankingInfluence", option_to_yojson ranking_influence_to_yojson x.ranking_influence);
    ]

let batch_inference_job_output_to_yojson (x : batch_inference_job_output) =
  assoc_to_yojson [ ("s3DataDestination", Some (s3_data_config_to_yojson x.s3_data_destination)) ]

let batch_inference_job_input_to_yojson (x : batch_inference_job_input) =
  assoc_to_yojson [ ("s3DataSource", Some (s3_data_config_to_yojson x.s3_data_source)) ]

let batch_inference_job_to_yojson (x : batch_inference_job) =
  assoc_to_yojson
    [
      ("jobName", option_to_yojson name_to_yojson x.job_name);
      ("batchInferenceJobArn", option_to_yojson arn_to_yojson x.batch_inference_job_arn);
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("failureReason", option_to_yojson failure_reason_to_yojson x.failure_reason);
      ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn);
      ("numResults", option_to_yojson num_batch_results_to_yojson x.num_results);
      ("jobInput", option_to_yojson batch_inference_job_input_to_yojson x.job_input);
      ("jobOutput", option_to_yojson batch_inference_job_output_to_yojson x.job_output);
      ( "batchInferenceJobConfig",
        option_to_yojson batch_inference_job_config_to_yojson x.batch_inference_job_config );
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ( "batchInferenceJobMode",
        option_to_yojson batch_inference_job_mode_to_yojson x.batch_inference_job_mode );
      ( "themeGenerationConfig",
        option_to_yojson theme_generation_config_to_yojson x.theme_generation_config );
      ("status", option_to_yojson status_to_yojson x.status);
      ("creationDateTime", option_to_yojson date_to_yojson x.creation_date_time);
      ("lastUpdatedDateTime", option_to_yojson date_to_yojson x.last_updated_date_time);
    ]

let describe_batch_inference_job_response_to_yojson (x : describe_batch_inference_job_response) =
  assoc_to_yojson
    [ ("batchInferenceJob", option_to_yojson batch_inference_job_to_yojson x.batch_inference_job) ]

let describe_batch_inference_job_request_to_yojson (x : describe_batch_inference_job_request) =
  assoc_to_yojson [ ("batchInferenceJobArn", Some (arn_to_yojson x.batch_inference_job_arn)) ]

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

let delete_dataset_group_request_to_yojson (x : delete_dataset_group_request) =
  assoc_to_yojson [ ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn)) ]

let delete_dataset_request_to_yojson (x : delete_dataset_request) =
  assoc_to_yojson [ ("datasetArn", Some (arn_to_yojson x.dataset_arn)) ]

let delete_campaign_request_to_yojson (x : delete_campaign_request) =
  assoc_to_yojson [ ("campaignArn", Some (arn_to_yojson x.campaign_arn)) ]

let create_solution_version_response_to_yojson (x : create_solution_version_response) =
  assoc_to_yojson [ ("solutionVersionArn", option_to_yojson arn_to_yojson x.solution_version_arn) ]

let create_solution_version_request_to_yojson (x : create_solution_version_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("solutionArn", Some (arn_to_yojson x.solution_arn));
      ("trainingMode", option_to_yojson training_mode_to_yojson x.training_mode);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_solution_response_to_yojson (x : create_solution_response) =
  assoc_to_yojson [ ("solutionArn", option_to_yojson arn_to_yojson x.solution_arn) ]

let create_solution_request_to_yojson (x : create_solution_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("performHPO", option_to_yojson boolean__to_yojson x.perform_hp_o);
      ("performAutoML", option_to_yojson perform_auto_m_l_to_yojson x.perform_auto_m_l);
      ( "performAutoTraining",
        option_to_yojson perform_auto_training_to_yojson x.perform_auto_training );
      ( "performIncrementalUpdate",
        option_to_yojson perform_incremental_update_to_yojson x.perform_incremental_update );
      ("recipeArn", option_to_yojson arn_to_yojson x.recipe_arn);
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ("solutionConfig", option_to_yojson solution_config_to_yojson x.solution_config);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_schema_response_to_yojson (x : create_schema_response) =
  assoc_to_yojson [ ("schemaArn", option_to_yojson arn_to_yojson x.schema_arn) ]

let create_schema_request_to_yojson (x : create_schema_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("schema", Some (avro_schema_to_yojson x.schema));
      ("domain", option_to_yojson domain_to_yojson x.domain);
    ]

let create_recommender_response_to_yojson (x : create_recommender_response) =
  assoc_to_yojson [ ("recommenderArn", option_to_yojson arn_to_yojson x.recommender_arn) ]

let create_recommender_request_to_yojson (x : create_recommender_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("recipeArn", Some (arn_to_yojson x.recipe_arn));
      ("recommenderConfig", option_to_yojson recommender_config_to_yojson x.recommender_config);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_metric_attribution_response_to_yojson (x : create_metric_attribution_response) =
  assoc_to_yojson
    [ ("metricAttributionArn", option_to_yojson arn_to_yojson x.metric_attribution_arn) ]

let create_metric_attribution_request_to_yojson (x : create_metric_attribution_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("metrics", Some (metric_attributes_to_yojson x.metrics));
      ("metricsOutputConfig", Some (metric_attribution_output_to_yojson x.metrics_output_config));
    ]

let create_filter_response_to_yojson (x : create_filter_response) =
  assoc_to_yojson [ ("filterArn", option_to_yojson arn_to_yojson x.filter_arn) ]

let create_filter_request_to_yojson (x : create_filter_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("filterExpression", Some (filter_expression_to_yojson x.filter_expression));
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_event_tracker_response_to_yojson (x : create_event_tracker_response) =
  assoc_to_yojson
    [
      ("eventTrackerArn", option_to_yojson arn_to_yojson x.event_tracker_arn);
      ("trackingId", option_to_yojson tracking_id_to_yojson x.tracking_id);
    ]

let create_event_tracker_request_to_yojson (x : create_event_tracker_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_dataset_import_job_response_to_yojson (x : create_dataset_import_job_response) =
  assoc_to_yojson
    [ ("datasetImportJobArn", option_to_yojson arn_to_yojson x.dataset_import_job_arn) ]

let create_dataset_import_job_request_to_yojson (x : create_dataset_import_job_request) =
  assoc_to_yojson
    [
      ("jobName", Some (name_to_yojson x.job_name));
      ("datasetArn", Some (arn_to_yojson x.dataset_arn));
      ("dataSource", Some (data_source_to_yojson x.data_source));
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("importMode", option_to_yojson import_mode_to_yojson x.import_mode);
      ( "publishAttributionMetricsToS3",
        option_to_yojson boolean__to_yojson x.publish_attribution_metrics_to_s3 );
    ]

let create_dataset_group_response_to_yojson (x : create_dataset_group_response) =
  assoc_to_yojson
    [
      ("datasetGroupArn", option_to_yojson arn_to_yojson x.dataset_group_arn);
      ("domain", option_to_yojson domain_to_yojson x.domain);
    ]

let create_dataset_group_request_to_yojson (x : create_dataset_group_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("kmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("domain", option_to_yojson domain_to_yojson x.domain);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_dataset_export_job_response_to_yojson (x : create_dataset_export_job_response) =
  assoc_to_yojson
    [ ("datasetExportJobArn", option_to_yojson arn_to_yojson x.dataset_export_job_arn) ]

let create_dataset_export_job_request_to_yojson (x : create_dataset_export_job_request) =
  assoc_to_yojson
    [
      ("jobName", Some (name_to_yojson x.job_name));
      ("datasetArn", Some (arn_to_yojson x.dataset_arn));
      ("ingestionMode", option_to_yojson ingestion_mode_to_yojson x.ingestion_mode);
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("jobOutput", Some (dataset_export_job_output_to_yojson x.job_output));
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson [ ("datasetArn", option_to_yojson arn_to_yojson x.dataset_arn) ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("schemaArn", Some (arn_to_yojson x.schema_arn));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("datasetType", Some (dataset_type_to_yojson x.dataset_type));
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_data_deletion_job_response_to_yojson (x : create_data_deletion_job_response) =
  assoc_to_yojson [ ("dataDeletionJobArn", option_to_yojson arn_to_yojson x.data_deletion_job_arn) ]

let create_data_deletion_job_request_to_yojson (x : create_data_deletion_job_request) =
  assoc_to_yojson
    [
      ("jobName", Some (name_to_yojson x.job_name));
      ("datasetGroupArn", Some (arn_to_yojson x.dataset_group_arn));
      ("dataSource", Some (data_source_to_yojson x.data_source));
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_campaign_response_to_yojson (x : create_campaign_response) =
  assoc_to_yojson [ ("campaignArn", option_to_yojson arn_to_yojson x.campaign_arn) ]

let create_campaign_request_to_yojson (x : create_campaign_request) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn));
      ( "minProvisionedTPS",
        option_to_yojson transactions_per_second_to_yojson x.min_provisioned_tp_s );
      ("campaignConfig", option_to_yojson campaign_config_to_yojson x.campaign_config);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_batch_segment_job_response_to_yojson (x : create_batch_segment_job_response) =
  assoc_to_yojson [ ("batchSegmentJobArn", option_to_yojson arn_to_yojson x.batch_segment_job_arn) ]

let create_batch_segment_job_request_to_yojson (x : create_batch_segment_job_request) =
  assoc_to_yojson
    [
      ("jobName", Some (name_to_yojson x.job_name));
      ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn));
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("numResults", option_to_yojson num_batch_results_to_yojson x.num_results);
      ("jobInput", Some (batch_segment_job_input_to_yojson x.job_input));
      ("jobOutput", Some (batch_segment_job_output_to_yojson x.job_output));
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_batch_inference_job_response_to_yojson (x : create_batch_inference_job_response) =
  assoc_to_yojson
    [ ("batchInferenceJobArn", option_to_yojson arn_to_yojson x.batch_inference_job_arn) ]

let create_batch_inference_job_request_to_yojson (x : create_batch_inference_job_request) =
  assoc_to_yojson
    [
      ("jobName", Some (name_to_yojson x.job_name));
      ("solutionVersionArn", Some (arn_to_yojson x.solution_version_arn));
      ("filterArn", option_to_yojson arn_to_yojson x.filter_arn);
      ("numResults", option_to_yojson num_batch_results_to_yojson x.num_results);
      ("jobInput", Some (batch_inference_job_input_to_yojson x.job_input));
      ("jobOutput", Some (batch_inference_job_output_to_yojson x.job_output));
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ( "batchInferenceJobConfig",
        option_to_yojson batch_inference_job_config_to_yojson x.batch_inference_job_config );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "batchInferenceJobMode",
        option_to_yojson batch_inference_job_mode_to_yojson x.batch_inference_job_mode );
      ( "themeGenerationConfig",
        option_to_yojson theme_generation_config_to_yojson x.theme_generation_config );
    ]
