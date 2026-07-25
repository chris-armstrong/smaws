open Smaws_Lib.Json.DeserializeHelpers
open Types

let account_id_of_yojson = string_of_yojson
let date_of_yojson = timestamp_epoch_seconds_of_yojson
let arn_of_yojson = string_of_yojson
let training_input_mode_of_yojson = string_of_yojson
let parameter_value_of_yojson = string_of_yojson
let parameter_name_of_yojson = string_of_yojson

let resource_config_of_yojson tree path =
  map_of_yojson parameter_name_of_yojson parameter_value_of_yojson tree path

let tunable_of_yojson = bool_of_yojson
let categorical_value_of_yojson = string_of_yojson
let categorical_values_of_yojson tree path = list_of_yojson categorical_value_of_yojson tree path

let default_categorical_hyper_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key parameter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key categorical_values_of_yojson "values") _list path;
     is_tunable = option_of_yojson (value_for_key tunable_of_yojson "isTunable") _list path;
   }
    : default_categorical_hyper_parameter_range)

let default_categorical_hyper_parameter_ranges_of_yojson tree path =
  list_of_yojson default_categorical_hyper_parameter_range_of_yojson tree path

let continuous_max_value_of_yojson = double_of_yojson
let continuous_min_value_of_yojson = double_of_yojson

let default_continuous_hyper_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key parameter_name_of_yojson "name") _list path;
     min_value =
       option_of_yojson (value_for_key continuous_min_value_of_yojson "minValue") _list path;
     max_value =
       option_of_yojson (value_for_key continuous_max_value_of_yojson "maxValue") _list path;
     is_tunable = option_of_yojson (value_for_key tunable_of_yojson "isTunable") _list path;
   }
    : default_continuous_hyper_parameter_range)

let default_continuous_hyper_parameter_ranges_of_yojson tree path =
  list_of_yojson default_continuous_hyper_parameter_range_of_yojson tree path

let integer_max_value_of_yojson = int_of_yojson
let integer_min_value_of_yojson = int_of_yojson

let default_integer_hyper_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key parameter_name_of_yojson "name") _list path;
     min_value = option_of_yojson (value_for_key integer_min_value_of_yojson "minValue") _list path;
     max_value = option_of_yojson (value_for_key integer_max_value_of_yojson "maxValue") _list path;
     is_tunable = option_of_yojson (value_for_key tunable_of_yojson "isTunable") _list path;
   }
    : default_integer_hyper_parameter_range)

let default_integer_hyper_parameter_ranges_of_yojson tree path =
  list_of_yojson default_integer_hyper_parameter_range_of_yojson tree path

let default_hyper_parameter_ranges_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integer_hyper_parameter_ranges =
       option_of_yojson
         (value_for_key default_integer_hyper_parameter_ranges_of_yojson
            "integerHyperParameterRanges")
         _list path;
     continuous_hyper_parameter_ranges =
       option_of_yojson
         (value_for_key default_continuous_hyper_parameter_ranges_of_yojson
            "continuousHyperParameterRanges")
         _list path;
     categorical_hyper_parameter_ranges =
       option_of_yojson
         (value_for_key default_categorical_hyper_parameter_ranges_of_yojson
            "categoricalHyperParameterRanges")
         _list path;
   }
    : default_hyper_parameter_ranges)

let hyper_parameters_of_yojson tree path =
  map_of_yojson parameter_name_of_yojson parameter_value_of_yojson tree path

let docker_ur_i_of_yojson = string_of_yojson
let name_of_yojson = string_of_yojson

let algorithm_image_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     docker_ur_i = value_for_key docker_ur_i_of_yojson "dockerURI" _list path;
   }
    : algorithm_image)

let algorithm_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     algorithm_arn = option_of_yojson (value_for_key arn_of_yojson "algorithmArn") _list path;
     algorithm_image =
       option_of_yojson (value_for_key algorithm_image_of_yojson "algorithmImage") _list path;
     default_hyper_parameters =
       option_of_yojson
         (value_for_key hyper_parameters_of_yojson "defaultHyperParameters")
         _list path;
     default_hyper_parameter_ranges =
       option_of_yojson
         (value_for_key default_hyper_parameter_ranges_of_yojson "defaultHyperParameterRanges")
         _list path;
     default_resource_config =
       option_of_yojson (value_for_key resource_config_of_yojson "defaultResourceConfig") _list path;
     training_input_mode =
       option_of_yojson (value_for_key training_input_mode_of_yojson "trainingInputMode") _list path;
     role_arn = option_of_yojson (value_for_key arn_of_yojson "roleArn") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : algorithm)

let error_message_of_yojson = string_of_yojson

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_not_found_exception)

let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_in_use_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_input_exception)

let update_solution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ solution_arn = option_of_yojson (value_for_key arn_of_yojson "solutionArn") _list path }
    : update_solution_response)

let event_type_weight_of_yojson = double_of_yojson
let event_type_threshold_value_of_yojson = double_of_yojson
let event_type_of_yojson = string_of_yojson

let event_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_type = option_of_yojson (value_for_key event_type_of_yojson "eventType") _list path;
     event_value_threshold =
       option_of_yojson
         (value_for_key event_type_threshold_value_of_yojson "eventValueThreshold")
         _list path;
     weight = option_of_yojson (value_for_key event_type_weight_of_yojson "weight") _list path;
   }
    : event_parameters)

let event_parameters_list_of_yojson tree path = list_of_yojson event_parameters_of_yojson tree path

let events_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_parameters_list =
       option_of_yojson
         (value_for_key event_parameters_list_of_yojson "eventParametersList")
         _list path;
   }
    : events_config)

let scheduling_expression_of_yojson = string_of_yojson

let auto_training_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduling_expression =
       option_of_yojson
         (value_for_key scheduling_expression_of_yojson "schedulingExpression")
         _list path;
   }
    : auto_training_config)

let solution_update_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_training_config =
       option_of_yojson
         (value_for_key auto_training_config_of_yojson "autoTrainingConfig")
         _list path;
     events_config =
       option_of_yojson (value_for_key events_config_of_yojson "eventsConfig") _list path;
   }
    : solution_update_config)

let perform_incremental_update_of_yojson = bool_of_yojson
let perform_auto_training_of_yojson = bool_of_yojson

let update_solution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_arn = value_for_key arn_of_yojson "solutionArn" _list path;
     perform_auto_training =
       option_of_yojson
         (value_for_key perform_auto_training_of_yojson "performAutoTraining")
         _list path;
     perform_incremental_update =
       option_of_yojson
         (value_for_key perform_incremental_update_of_yojson "performIncrementalUpdate")
         _list path;
     solution_update_config =
       option_of_yojson
         (value_for_key solution_update_config_of_yojson "solutionUpdateConfig")
         _list path;
   }
    : update_solution_request)

let update_recommender_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender_arn = option_of_yojson (value_for_key arn_of_yojson "recommenderArn") _list path }
    : update_recommender_response)

let boolean__of_yojson = bool_of_yojson
let column_name_of_yojson = string_of_yojson
let column_names_list_of_yojson tree path = list_of_yojson column_name_of_yojson tree path
let dataset_type_of_yojson = string_of_yojson

let included_dataset_columns_of_yojson tree path =
  map_of_yojson dataset_type_of_yojson column_names_list_of_yojson tree path

let excluded_dataset_columns_of_yojson tree path =
  map_of_yojson dataset_type_of_yojson column_names_list_of_yojson tree path

let training_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     excluded_dataset_columns =
       option_of_yojson
         (value_for_key excluded_dataset_columns_of_yojson "excludedDatasetColumns")
         _list path;
     included_dataset_columns =
       option_of_yojson
         (value_for_key included_dataset_columns_of_yojson "includedDatasetColumns")
         _list path;
   }
    : training_data_config)

let transactions_per_second_of_yojson = int_of_yojson

let recommender_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_exploration_config =
       option_of_yojson
         (value_for_key hyper_parameters_of_yojson "itemExplorationConfig")
         _list path;
     min_recommendation_requests_per_second =
       option_of_yojson
         (value_for_key transactions_per_second_of_yojson "minRecommendationRequestsPerSecond")
         _list path;
     training_data_config =
       option_of_yojson
         (value_for_key training_data_config_of_yojson "trainingDataConfig")
         _list path;
     enable_metadata_with_recommendations =
       option_of_yojson
         (value_for_key boolean__of_yojson "enableMetadataWithRecommendations")
         _list path;
   }
    : recommender_config)

let update_recommender_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommender_arn = value_for_key arn_of_yojson "recommenderArn" _list path;
     recommender_config = value_for_key recommender_config_of_yojson "recommenderConfig" _list path;
   }
    : update_recommender_request)

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : resource_already_exists_exception)

let update_metric_attribution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_attribution_arn =
       option_of_yojson (value_for_key arn_of_yojson "metricAttributionArn") _list path;
   }
    : update_metric_attribution_response)

let role_arn_of_yojson = string_of_yojson
let kms_key_arn_of_yojson = string_of_yojson
let s3_location_of_yojson = string_of_yojson

let s3_data_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     path = value_for_key s3_location_of_yojson "path" _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "kmsKeyArn") _list path;
   }
    : s3_data_config)

let metric_attribution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_data_destination =
       option_of_yojson (value_for_key s3_data_config_of_yojson "s3DataDestination") _list path;
     role_arn = value_for_key role_arn_of_yojson "roleArn" _list path;
   }
    : metric_attribution_output)

let metric_name_of_yojson = string_of_yojson

let metric_attributes_names_list_of_yojson tree path =
  list_of_yojson metric_name_of_yojson tree path

let metric_expression_of_yojson = string_of_yojson

let metric_attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_type = value_for_key event_type_of_yojson "eventType" _list path;
     metric_name = value_for_key metric_name_of_yojson "metricName" _list path;
     expression = value_for_key metric_expression_of_yojson "expression" _list path;
   }
    : metric_attribute)

let metric_attributes_of_yojson tree path = list_of_yojson metric_attribute_of_yojson tree path

let update_metric_attribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     add_metrics =
       option_of_yojson (value_for_key metric_attributes_of_yojson "addMetrics") _list path;
     remove_metrics =
       option_of_yojson
         (value_for_key metric_attributes_names_list_of_yojson "removeMetrics")
         _list path;
     metrics_output_config =
       option_of_yojson
         (value_for_key metric_attribution_output_of_yojson "metricsOutputConfig")
         _list path;
     metric_attribution_arn =
       option_of_yojson (value_for_key arn_of_yojson "metricAttributionArn") _list path;
   }
    : update_metric_attribution_request)

let update_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = option_of_yojson (value_for_key arn_of_yojson "datasetArn") _list path }
    : update_dataset_response)

let update_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn = value_for_key arn_of_yojson "datasetArn" _list path;
     schema_arn = value_for_key arn_of_yojson "schemaArn" _list path;
   }
    : update_dataset_request)

let update_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ campaign_arn = option_of_yojson (value_for_key arn_of_yojson "campaignArn") _list path }
    : update_campaign_response)

let ranking_influence_weight_of_yojson = double_of_yojson

let ranking_influence_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "POPULARITY" -> POPULARITY
    | `String "FRESHNESS" -> FRESHNESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RankingInfluenceType" value)
    | _ -> raise (deserialize_wrong_type_error path "RankingInfluenceType")
     : ranking_influence_type)
    : ranking_influence_type)

let ranking_influence_of_yojson tree path =
  map_of_yojson ranking_influence_type_of_yojson ranking_influence_weight_of_yojson tree path

let campaign_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_exploration_config =
       option_of_yojson
         (value_for_key hyper_parameters_of_yojson "itemExplorationConfig")
         _list path;
     enable_metadata_with_recommendations =
       option_of_yojson
         (value_for_key boolean__of_yojson "enableMetadataWithRecommendations")
         _list path;
     sync_with_latest_solution_version =
       option_of_yojson
         (value_for_key boolean__of_yojson "syncWithLatestSolutionVersion")
         _list path;
     ranking_influence =
       option_of_yojson (value_for_key ranking_influence_of_yojson "rankingInfluence") _list path;
   }
    : campaign_config)

let update_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     campaign_arn = value_for_key arn_of_yojson "campaignArn" _list path;
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     min_provisioned_tp_s =
       option_of_yojson
         (value_for_key transactions_per_second_of_yojson "minProvisionedTPS")
         _list path;
     campaign_config =
       option_of_yojson (value_for_key campaign_config_of_yojson "campaignConfig") _list path;
   }
    : update_campaign_request)

let too_many_tag_keys_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : too_many_tag_keys_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "tagKeys" _list path;
   }
    : untag_resource_request)

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : too_many_tags_exception)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_key = value_for_key tag_key_of_yojson "tagKey" _list path;
     tag_value = value_for_key tag_value_of_yojson "tagValue" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     tags = value_for_key tags_of_yojson "tags" _list path;
   }
    : tag_resource_request)

let stop_solution_version_creation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ solution_version_arn = value_for_key arn_of_yojson "solutionVersionArn" _list path }
    : stop_solution_version_creation_request)

let stop_recommender_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender_arn = option_of_yojson (value_for_key arn_of_yojson "recommenderArn") _list path }
    : stop_recommender_response)

let stop_recommender_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender_arn = value_for_key arn_of_yojson "recommenderArn" _list path }
    : stop_recommender_request)

let start_recommender_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender_arn = option_of_yojson (value_for_key arn_of_yojson "recommenderArn") _list path }
    : start_recommender_response)

let start_recommender_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender_arn = value_for_key arn_of_yojson "recommenderArn" _list path }
    : start_recommender_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let invalid_next_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "message") _list path }
    : invalid_next_token_exception)

let next_token_of_yojson = string_of_yojson
let failure_reason_of_yojson = string_of_yojson

let training_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String "MANUAL" -> MANUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrainingType" value)
    | _ -> raise (deserialize_wrong_type_error path "TrainingType")
     : training_type)
    : training_type)

let training_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FULL" -> FULL
    | `String "UPDATE" -> UPDATE
    | `String "AUTOTRAIN" -> AUTOTRAIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "TrainingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TrainingMode")
     : training_mode)
    : training_mode)

let status_of_yojson = string_of_yojson

let solution_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     training_mode =
       option_of_yojson (value_for_key training_mode_of_yojson "trainingMode") _list path;
     training_type =
       option_of_yojson (value_for_key training_type_of_yojson "trainingType") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : solution_version_summary)

let solution_versions_of_yojson tree path =
  list_of_yojson solution_version_summary_of_yojson tree path

let list_solution_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_versions =
       option_of_yojson (value_for_key solution_versions_of_yojson "solutionVersions") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_solution_versions_response)

let max_results_of_yojson = int_of_yojson

let list_solution_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_arn = option_of_yojson (value_for_key arn_of_yojson "solutionArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_solution_versions_request)

let solution_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     solution_arn = option_of_yojson (value_for_key arn_of_yojson "solutionArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     recipe_arn = option_of_yojson (value_for_key arn_of_yojson "recipeArn") _list path;
   }
    : solution_summary)

let solutions_of_yojson tree path = list_of_yojson solution_summary_of_yojson tree path

let list_solutions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solutions = option_of_yojson (value_for_key solutions_of_yojson "solutions") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_solutions_response)

let list_solutions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_solutions_request)

let domain_of_yojson (tree : t) path =
  ((match tree with
    | `String "ECOMMERCE" -> ECOMMERCE
    | `String "VIDEO_ON_DEMAND" -> VIDEO_ON_DEMAND
    | `String value -> raise (deserialize_unknown_enum_value_error path "Domain" value)
    | _ -> raise (deserialize_wrong_type_error path "Domain")
     : domain)
    : domain)

let dataset_schema_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     schema_arn = option_of_yojson (value_for_key arn_of_yojson "schemaArn") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
   }
    : dataset_schema_summary)

let schemas_of_yojson tree path = list_of_yojson dataset_schema_summary_of_yojson tree path

let list_schemas_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schemas = option_of_yojson (value_for_key schemas_of_yojson "schemas") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_schemas_response)

let list_schemas_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_schemas_request)

let recommender_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     recommender_arn = option_of_yojson (value_for_key arn_of_yojson "recommenderArn") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     recipe_arn = option_of_yojson (value_for_key arn_of_yojson "recipeArn") _list path;
     recommender_config =
       option_of_yojson (value_for_key recommender_config_of_yojson "recommenderConfig") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : recommender_summary)

let recommenders_of_yojson tree path = list_of_yojson recommender_summary_of_yojson tree path

let list_recommenders_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommenders =
       option_of_yojson (value_for_key recommenders_of_yojson "recommenders") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_recommenders_response)

let list_recommenders_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_recommenders_request)

let recipe_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     recipe_arn = option_of_yojson (value_for_key arn_of_yojson "recipeArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
   }
    : recipe_summary)

let recipes_of_yojson tree path = list_of_yojson recipe_summary_of_yojson tree path

let list_recipes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recipes = option_of_yojson (value_for_key recipes_of_yojson "recipes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_recipes_response)

let recipe_provider_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICE" -> SERVICE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RecipeProvider" value)
    | _ -> raise (deserialize_wrong_type_error path "RecipeProvider")
     : recipe_provider)
    : recipe_provider)

let list_recipes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recipe_provider =
       option_of_yojson (value_for_key recipe_provider_of_yojson "recipeProvider") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
   }
    : list_recipes_request)

let metric_attribution_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     metric_attribution_arn =
       option_of_yojson (value_for_key arn_of_yojson "metricAttributionArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : metric_attribution_summary)

let metric_attributions_of_yojson tree path =
  list_of_yojson metric_attribution_summary_of_yojson tree path

let list_metric_attributions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_attributions =
       option_of_yojson
         (value_for_key metric_attributions_of_yojson "metricAttributions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_metric_attributions_response)

let list_metric_attributions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_metric_attributions_request)

let list_metric_attribution_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metrics = option_of_yojson (value_for_key metric_attributes_of_yojson "metrics") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_metric_attribution_metrics_response)

let list_metric_attribution_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_attribution_arn =
       option_of_yojson (value_for_key arn_of_yojson "metricAttributionArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_metric_attribution_metrics_request)

let filter_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     filter_arn = option_of_yojson (value_for_key arn_of_yojson "filterArn") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
   }
    : filter_summary)

let filters_of_yojson tree path = list_of_yojson filter_summary_of_yojson tree path

let list_filters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_filters_response)

let list_filters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_filters_request)

let event_tracker_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     event_tracker_arn = option_of_yojson (value_for_key arn_of_yojson "eventTrackerArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : event_tracker_summary)

let event_trackers_of_yojson tree path = list_of_yojson event_tracker_summary_of_yojson tree path

let list_event_trackers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_trackers =
       option_of_yojson (value_for_key event_trackers_of_yojson "eventTrackers") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_event_trackers_response)

let list_event_trackers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_event_trackers_request)

let dataset_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "datasetArn") _list path;
     dataset_type = option_of_yojson (value_for_key dataset_type_of_yojson "datasetType") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : dataset_summary)

let datasets_of_yojson tree path = list_of_yojson dataset_summary_of_yojson tree path

let list_datasets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datasets = option_of_yojson (value_for_key datasets_of_yojson "datasets") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_datasets_response)

let list_datasets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_datasets_request)

let import_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FULL" -> FULL
    | `String "INCREMENTAL" -> INCREMENTAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportMode")
     : import_mode)
    : import_mode)

let dataset_import_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "datasetImportJobArn") _list path;
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     import_mode = option_of_yojson (value_for_key import_mode_of_yojson "importMode") _list path;
   }
    : dataset_import_job_summary)

let dataset_import_jobs_of_yojson tree path =
  list_of_yojson dataset_import_job_summary_of_yojson tree path

let list_dataset_import_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_jobs =
       option_of_yojson (value_for_key dataset_import_jobs_of_yojson "datasetImportJobs") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_dataset_import_jobs_response)

let list_dataset_import_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "datasetArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_dataset_import_jobs_request)

let dataset_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
   }
    : dataset_group_summary)

let dataset_groups_of_yojson tree path = list_of_yojson dataset_group_summary_of_yojson tree path

let list_dataset_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_groups =
       option_of_yojson (value_for_key dataset_groups_of_yojson "datasetGroups") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_dataset_groups_response)

let list_dataset_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_dataset_groups_request)

let dataset_export_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "datasetExportJobArn") _list path;
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : dataset_export_job_summary)

let dataset_export_jobs_of_yojson tree path =
  list_of_yojson dataset_export_job_summary_of_yojson tree path

let list_dataset_export_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_export_jobs =
       option_of_yojson (value_for_key dataset_export_jobs_of_yojson "datasetExportJobs") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_dataset_export_jobs_response)

let list_dataset_export_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "datasetArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_dataset_export_jobs_request)

let data_deletion_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_deletion_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "dataDeletionJobArn") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : data_deletion_job_summary)

let data_deletion_jobs_of_yojson tree path =
  list_of_yojson data_deletion_job_summary_of_yojson tree path

let list_data_deletion_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_deletion_jobs =
       option_of_yojson (value_for_key data_deletion_jobs_of_yojson "dataDeletionJobs") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_data_deletion_jobs_response)

let list_data_deletion_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_data_deletion_jobs_request)

let campaign_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     campaign_arn = option_of_yojson (value_for_key arn_of_yojson "campaignArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : campaign_summary)

let campaigns_of_yojson tree path = list_of_yojson campaign_summary_of_yojson tree path

let list_campaigns_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     campaigns = option_of_yojson (value_for_key campaigns_of_yojson "campaigns") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_campaigns_response)

let list_campaigns_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_arn = option_of_yojson (value_for_key arn_of_yojson "solutionArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_campaigns_request)

let batch_segment_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_segment_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "batchSegmentJobArn") _list path;
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
   }
    : batch_segment_job_summary)

let batch_segment_jobs_of_yojson tree path =
  list_of_yojson batch_segment_job_summary_of_yojson tree path

let list_batch_segment_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_segment_jobs =
       option_of_yojson (value_for_key batch_segment_jobs_of_yojson "batchSegmentJobs") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_batch_segment_jobs_response)

let list_batch_segment_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_batch_segment_jobs_request)

let batch_inference_job_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "BATCH_INFERENCE" -> BATCH_INFERENCE
    | `String "THEME_GENERATION" -> THEME_GENERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BatchInferenceJobMode" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchInferenceJobMode")
     : batch_inference_job_mode)
    : batch_inference_job_mode)

let batch_inference_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_inference_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "batchInferenceJobArn") _list path;
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     batch_inference_job_mode =
       option_of_yojson
         (value_for_key batch_inference_job_mode_of_yojson "batchInferenceJobMode")
         _list path;
   }
    : batch_inference_job_summary)

let batch_inference_jobs_of_yojson tree path =
  list_of_yojson batch_inference_job_summary_of_yojson tree path

let list_batch_inference_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_inference_jobs =
       option_of_yojson
         (value_for_key batch_inference_jobs_of_yojson "batchInferenceJobs")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_batch_inference_jobs_response)

let list_batch_inference_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
   }
    : list_batch_inference_jobs_request)

let metric_value_of_yojson = double_of_yojson

let metrics_of_yojson tree path =
  map_of_yojson metric_name_of_yojson metric_value_of_yojson tree path

let get_solution_metrics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     metrics = option_of_yojson (value_for_key metrics_of_yojson "metrics") _list path;
   }
    : get_solution_metrics_response)

let get_solution_metrics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ solution_version_arn = value_for_key arn_of_yojson "solutionVersionArn" _list path }
    : get_solution_metrics_request)

let tuned_hpo_params_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     algorithm_hyper_parameters =
       option_of_yojson
         (value_for_key hyper_parameters_of_yojson "algorithmHyperParameters")
         _list path;
   }
    : tuned_hpo_params)

let training_hours_of_yojson = double_of_yojson

let objective_sensitivity_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOW" -> LOW
    | `String "MEDIUM" -> MEDIUM
    | `String "HIGH" -> HIGH
    | `String "OFF" -> OFF
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ObjectiveSensitivity" value)
    | _ -> raise (deserialize_wrong_type_error path "ObjectiveSensitivity")
     : objective_sensitivity)
    : objective_sensitivity)

let item_attribute_of_yojson = string_of_yojson

let optimization_objective_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_attribute =
       option_of_yojson (value_for_key item_attribute_of_yojson "itemAttribute") _list path;
     objective_sensitivity =
       option_of_yojson
         (value_for_key objective_sensitivity_of_yojson "objectiveSensitivity")
         _list path;
   }
    : optimization_objective)

let arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let auto_ml_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "metricName") _list path;
     recipe_list = option_of_yojson (value_for_key arn_list_of_yojson "recipeList") _list path;
   }
    : auto_ml_config)

let feature_transformation_parameters_of_yojson tree path =
  map_of_yojson parameter_name_of_yojson parameter_value_of_yojson tree path

let categorical_hyper_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key parameter_name_of_yojson "name") _list path;
     values = option_of_yojson (value_for_key categorical_values_of_yojson "values") _list path;
   }
    : categorical_hyper_parameter_range)

let categorical_hyper_parameter_ranges_of_yojson tree path =
  list_of_yojson categorical_hyper_parameter_range_of_yojson tree path

let continuous_hyper_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key parameter_name_of_yojson "name") _list path;
     min_value =
       option_of_yojson (value_for_key continuous_min_value_of_yojson "minValue") _list path;
     max_value =
       option_of_yojson (value_for_key continuous_max_value_of_yojson "maxValue") _list path;
   }
    : continuous_hyper_parameter_range)

let continuous_hyper_parameter_ranges_of_yojson tree path =
  list_of_yojson continuous_hyper_parameter_range_of_yojson tree path

let integer_hyper_parameter_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key parameter_name_of_yojson "name") _list path;
     min_value = option_of_yojson (value_for_key integer_min_value_of_yojson "minValue") _list path;
     max_value = option_of_yojson (value_for_key integer_max_value_of_yojson "maxValue") _list path;
   }
    : integer_hyper_parameter_range)

let integer_hyper_parameter_ranges_of_yojson tree path =
  list_of_yojson integer_hyper_parameter_range_of_yojson tree path

let hyper_parameter_ranges_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integer_hyper_parameter_ranges =
       option_of_yojson
         (value_for_key integer_hyper_parameter_ranges_of_yojson "integerHyperParameterRanges")
         _list path;
     continuous_hyper_parameter_ranges =
       option_of_yojson
         (value_for_key continuous_hyper_parameter_ranges_of_yojson "continuousHyperParameterRanges")
         _list path;
     categorical_hyper_parameter_ranges =
       option_of_yojson
         (value_for_key categorical_hyper_parameter_ranges_of_yojson
            "categoricalHyperParameterRanges")
         _list path;
   }
    : hyper_parameter_ranges)

let hpo_resource_of_yojson = string_of_yojson

let hpo_resource_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_number_of_training_jobs =
       option_of_yojson (value_for_key hpo_resource_of_yojson "maxNumberOfTrainingJobs") _list path;
     max_parallel_training_jobs =
       option_of_yojson (value_for_key hpo_resource_of_yojson "maxParallelTrainingJobs") _list path;
   }
    : hpo_resource_config)

let metric_regex_of_yojson = string_of_yojson
let hpo_objective_type_of_yojson = string_of_yojson

let hpo_objective_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key hpo_objective_type_of_yojson "type") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "metricName") _list path;
     metric_regex = option_of_yojson (value_for_key metric_regex_of_yojson "metricRegex") _list path;
   }
    : hpo_objective)

let hpo_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hpo_objective =
       option_of_yojson (value_for_key hpo_objective_of_yojson "hpoObjective") _list path;
     hpo_resource_config =
       option_of_yojson (value_for_key hpo_resource_config_of_yojson "hpoResourceConfig") _list path;
     algorithm_hyper_parameter_ranges =
       option_of_yojson
         (value_for_key hyper_parameter_ranges_of_yojson "algorithmHyperParameterRanges")
         _list path;
   }
    : hpo_config)

let event_value_threshold_of_yojson = string_of_yojson

let solution_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_value_threshold =
       option_of_yojson
         (value_for_key event_value_threshold_of_yojson "eventValueThreshold")
         _list path;
     hpo_config = option_of_yojson (value_for_key hpo_config_of_yojson "hpoConfig") _list path;
     algorithm_hyper_parameters =
       option_of_yojson
         (value_for_key hyper_parameters_of_yojson "algorithmHyperParameters")
         _list path;
     feature_transformation_parameters =
       option_of_yojson
         (value_for_key feature_transformation_parameters_of_yojson
            "featureTransformationParameters")
         _list path;
     auto_ml_config =
       option_of_yojson (value_for_key auto_ml_config_of_yojson "autoMLConfig") _list path;
     events_config =
       option_of_yojson (value_for_key events_config_of_yojson "eventsConfig") _list path;
     optimization_objective =
       option_of_yojson
         (value_for_key optimization_objective_of_yojson "optimizationObjective")
         _list path;
     training_data_config =
       option_of_yojson
         (value_for_key training_data_config_of_yojson "trainingDataConfig")
         _list path;
     auto_training_config =
       option_of_yojson
         (value_for_key auto_training_config_of_yojson "autoTrainingConfig")
         _list path;
   }
    : solution_config)

let perform_auto_m_l_of_yojson = bool_of_yojson
let perform_hp_o_of_yojson = bool_of_yojson

let solution_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     solution_arn = option_of_yojson (value_for_key arn_of_yojson "solutionArn") _list path;
     perform_hp_o = option_of_yojson (value_for_key perform_hp_o_of_yojson "performHPO") _list path;
     perform_auto_m_l =
       option_of_yojson (value_for_key perform_auto_m_l_of_yojson "performAutoML") _list path;
     perform_incremental_update =
       option_of_yojson
         (value_for_key perform_incremental_update_of_yojson "performIncrementalUpdate")
         _list path;
     recipe_arn = option_of_yojson (value_for_key arn_of_yojson "recipeArn") _list path;
     event_type = option_of_yojson (value_for_key event_type_of_yojson "eventType") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     solution_config =
       option_of_yojson (value_for_key solution_config_of_yojson "solutionConfig") _list path;
     training_hours =
       option_of_yojson (value_for_key training_hours_of_yojson "trainingHours") _list path;
     training_mode =
       option_of_yojson (value_for_key training_mode_of_yojson "trainingMode") _list path;
     tuned_hpo_params =
       option_of_yojson (value_for_key tuned_hpo_params_of_yojson "tunedHPOParams") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     training_type =
       option_of_yojson (value_for_key training_type_of_yojson "trainingType") _list path;
   }
    : solution_version)

let describe_solution_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_version =
       option_of_yojson (value_for_key solution_version_of_yojson "solutionVersion") _list path;
   }
    : describe_solution_version_response)

let describe_solution_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ solution_version_arn = value_for_key arn_of_yojson "solutionVersionArn" _list path }
    : describe_solution_version_request)

let solution_update_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_update_config =
       option_of_yojson
         (value_for_key solution_update_config_of_yojson "solutionUpdateConfig")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     perform_auto_training =
       option_of_yojson
         (value_for_key perform_auto_training_of_yojson "performAutoTraining")
         _list path;
     perform_incremental_update =
       option_of_yojson
         (value_for_key perform_incremental_update_of_yojson "performIncrementalUpdate")
         _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : solution_update_summary)

let auto_ml_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ best_recipe_arn = option_of_yojson (value_for_key arn_of_yojson "bestRecipeArn") _list path }
    : auto_ml_result)

let solution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     solution_arn = option_of_yojson (value_for_key arn_of_yojson "solutionArn") _list path;
     perform_hp_o = option_of_yojson (value_for_key perform_hp_o_of_yojson "performHPO") _list path;
     perform_auto_m_l =
       option_of_yojson (value_for_key perform_auto_m_l_of_yojson "performAutoML") _list path;
     perform_auto_training =
       option_of_yojson
         (value_for_key perform_auto_training_of_yojson "performAutoTraining")
         _list path;
     perform_incremental_update =
       option_of_yojson
         (value_for_key perform_incremental_update_of_yojson "performIncrementalUpdate")
         _list path;
     recipe_arn = option_of_yojson (value_for_key arn_of_yojson "recipeArn") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     event_type = option_of_yojson (value_for_key event_type_of_yojson "eventType") _list path;
     solution_config =
       option_of_yojson (value_for_key solution_config_of_yojson "solutionConfig") _list path;
     auto_ml_result =
       option_of_yojson (value_for_key auto_ml_result_of_yojson "autoMLResult") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     latest_solution_version =
       option_of_yojson
         (value_for_key solution_version_summary_of_yojson "latestSolutionVersion")
         _list path;
     latest_solution_update =
       option_of_yojson
         (value_for_key solution_update_summary_of_yojson "latestSolutionUpdate")
         _list path;
   }
    : solution)

let describe_solution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ solution = option_of_yojson (value_for_key solution_of_yojson "solution") _list path }
    : describe_solution_response)

let describe_solution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ solution_arn = value_for_key arn_of_yojson "solutionArn" _list path }
    : describe_solution_request)

let avro_schema_of_yojson = string_of_yojson

let dataset_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     schema_arn = option_of_yojson (value_for_key arn_of_yojson "schemaArn") _list path;
     schema = option_of_yojson (value_for_key avro_schema_of_yojson "schema") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
   }
    : dataset_schema)

let describe_schema_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ schema = option_of_yojson (value_for_key dataset_schema_of_yojson "schema") _list path }
    : describe_schema_response)

let describe_schema_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ schema_arn = value_for_key arn_of_yojson "schemaArn" _list path } : describe_schema_request)

let recommender_update_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommender_config =
       option_of_yojson (value_for_key recommender_config_of_yojson "recommenderConfig") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : recommender_update_summary)

let recommender_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommender_arn = option_of_yojson (value_for_key arn_of_yojson "recommenderArn") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     recipe_arn = option_of_yojson (value_for_key arn_of_yojson "recipeArn") _list path;
     recommender_config =
       option_of_yojson (value_for_key recommender_config_of_yojson "recommenderConfig") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     latest_recommender_update =
       option_of_yojson
         (value_for_key recommender_update_summary_of_yojson "latestRecommenderUpdate")
         _list path;
     model_metrics = option_of_yojson (value_for_key metrics_of_yojson "modelMetrics") _list path;
   }
    : recommender)

let describe_recommender_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender = option_of_yojson (value_for_key recommender_of_yojson "recommender") _list path }
    : describe_recommender_response)

let describe_recommender_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender_arn = value_for_key arn_of_yojson "recommenderArn" _list path }
    : describe_recommender_request)

let recipe_type_of_yojson = string_of_yojson
let description_of_yojson = string_of_yojson

let recipe_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     recipe_arn = option_of_yojson (value_for_key arn_of_yojson "recipeArn") _list path;
     algorithm_arn = option_of_yojson (value_for_key arn_of_yojson "algorithmArn") _list path;
     feature_transformation_arn =
       option_of_yojson (value_for_key arn_of_yojson "featureTransformationArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     recipe_type = option_of_yojson (value_for_key recipe_type_of_yojson "recipeType") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : recipe)

let describe_recipe_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recipe = option_of_yojson (value_for_key recipe_of_yojson "recipe") _list path }
    : describe_recipe_response)

let describe_recipe_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recipe_arn = value_for_key arn_of_yojson "recipeArn" _list path } : describe_recipe_request)

let metric_attribution_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     metric_attribution_arn =
       option_of_yojson (value_for_key arn_of_yojson "metricAttributionArn") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     metrics_output_config =
       option_of_yojson
         (value_for_key metric_attribution_output_of_yojson "metricsOutputConfig")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : metric_attribution)

let describe_metric_attribution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_attribution =
       option_of_yojson (value_for_key metric_attribution_of_yojson "metricAttribution") _list path;
   }
    : describe_metric_attribution_response)

let describe_metric_attribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ metric_attribution_arn = value_for_key arn_of_yojson "metricAttributionArn" _list path }
    : describe_metric_attribution_request)

let filter_expression_of_yojson = string_of_yojson

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     filter_arn = option_of_yojson (value_for_key arn_of_yojson "filterArn") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     filter_expression =
       option_of_yojson (value_for_key filter_expression_of_yojson "filterExpression") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
   }
    : filter)

let describe_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ filter = option_of_yojson (value_for_key filter_of_yojson "filter") _list path }
    : describe_filter_response)

let describe_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ filter_arn = value_for_key arn_of_yojson "filterArn" _list path } : describe_filter_request)

let featurization_parameters_of_yojson tree path =
  map_of_yojson parameter_name_of_yojson parameter_value_of_yojson tree path

let feature_transformation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     feature_transformation_arn =
       option_of_yojson (value_for_key arn_of_yojson "featureTransformationArn") _list path;
     default_parameters =
       option_of_yojson
         (value_for_key featurization_parameters_of_yojson "defaultParameters")
         _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
   }
    : feature_transformation)

let describe_feature_transformation_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feature_transformation =
       option_of_yojson
         (value_for_key feature_transformation_of_yojson "featureTransformation")
         _list path;
   }
    : describe_feature_transformation_response)

let describe_feature_transformation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     feature_transformation_arn = value_for_key arn_of_yojson "featureTransformationArn" _list path;
   }
    : describe_feature_transformation_request)

let tracking_id_of_yojson = string_of_yojson

let event_tracker_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     event_tracker_arn = option_of_yojson (value_for_key arn_of_yojson "eventTrackerArn") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     tracking_id = option_of_yojson (value_for_key tracking_id_of_yojson "trackingId") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : event_tracker)

let describe_event_tracker_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_tracker =
       option_of_yojson (value_for_key event_tracker_of_yojson "eventTracker") _list path;
   }
    : describe_event_tracker_response)

let describe_event_tracker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_tracker_arn = value_for_key arn_of_yojson "eventTrackerArn" _list path }
    : describe_event_tracker_request)

let data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_location =
       option_of_yojson (value_for_key s3_location_of_yojson "dataLocation") _list path;
   }
    : data_source)

let dataset_import_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     dataset_import_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "datasetImportJobArn") _list path;
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "datasetArn") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "dataSource") _list path;
     role_arn = option_of_yojson (value_for_key arn_of_yojson "roleArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     import_mode = option_of_yojson (value_for_key import_mode_of_yojson "importMode") _list path;
     publish_attribution_metrics_to_s3 =
       option_of_yojson
         (value_for_key boolean__of_yojson "publishAttributionMetricsToS3")
         _list path;
   }
    : dataset_import_job)

let describe_dataset_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_job =
       option_of_yojson (value_for_key dataset_import_job_of_yojson "datasetImportJob") _list path;
   }
    : describe_dataset_import_job_response)

let describe_dataset_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_import_job_arn = value_for_key arn_of_yojson "datasetImportJobArn" _list path }
    : describe_dataset_import_job_request)

let dataset_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "kmsKeyArn") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
   }
    : dataset_group)

let describe_dataset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group =
       option_of_yojson (value_for_key dataset_group_of_yojson "datasetGroup") _list path;
   }
    : describe_dataset_group_response)

let describe_dataset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path }
    : describe_dataset_group_request)

let dataset_export_job_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_data_destination = value_for_key s3_data_config_of_yojson "s3DataDestination" _list path }
    : dataset_export_job_output)

let ingestion_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "BULK" -> BULK
    | `String "PUT" -> PUT
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "IngestionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "IngestionMode")
     : ingestion_mode)
    : ingestion_mode)

let dataset_export_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     dataset_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "datasetExportJobArn") _list path;
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "datasetArn") _list path;
     ingestion_mode =
       option_of_yojson (value_for_key ingestion_mode_of_yojson "ingestionMode") _list path;
     role_arn = option_of_yojson (value_for_key arn_of_yojson "roleArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     job_output =
       option_of_yojson (value_for_key dataset_export_job_output_of_yojson "jobOutput") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : dataset_export_job)

let describe_dataset_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_export_job =
       option_of_yojson (value_for_key dataset_export_job_of_yojson "datasetExportJob") _list path;
   }
    : describe_dataset_export_job_response)

let describe_dataset_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_export_job_arn = value_for_key arn_of_yojson "datasetExportJobArn" _list path }
    : describe_dataset_export_job_request)

let dataset_update_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema_arn = option_of_yojson (value_for_key arn_of_yojson "schemaArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : dataset_update_summary)

let dataset_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     dataset_arn = option_of_yojson (value_for_key arn_of_yojson "datasetArn") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     dataset_type = option_of_yojson (value_for_key dataset_type_of_yojson "datasetType") _list path;
     schema_arn = option_of_yojson (value_for_key arn_of_yojson "schemaArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     latest_dataset_update =
       option_of_yojson
         (value_for_key dataset_update_summary_of_yojson "latestDatasetUpdate")
         _list path;
     tracking_id = option_of_yojson (value_for_key tracking_id_of_yojson "trackingId") _list path;
   }
    : dataset)

let describe_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset = option_of_yojson (value_for_key dataset_of_yojson "dataset") _list path }
    : describe_dataset_response)

let describe_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = value_for_key arn_of_yojson "datasetArn" _list path } : describe_dataset_request)

let integer_of_yojson = int_of_yojson

let data_deletion_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     data_deletion_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "dataDeletionJobArn") _list path;
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "dataSource") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     num_deleted = option_of_yojson (value_for_key integer_of_yojson "numDeleted") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
   }
    : data_deletion_job)

let describe_data_deletion_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_deletion_job =
       option_of_yojson (value_for_key data_deletion_job_of_yojson "dataDeletionJob") _list path;
   }
    : describe_data_deletion_job_response)

let describe_data_deletion_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ data_deletion_job_arn = value_for_key arn_of_yojson "dataDeletionJobArn" _list path }
    : describe_data_deletion_job_request)

let campaign_update_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     min_provisioned_tp_s =
       option_of_yojson
         (value_for_key transactions_per_second_of_yojson "minProvisionedTPS")
         _list path;
     campaign_config =
       option_of_yojson (value_for_key campaign_config_of_yojson "campaignConfig") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : campaign_update_summary)

let campaign_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     campaign_arn = option_of_yojson (value_for_key arn_of_yojson "campaignArn") _list path;
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     min_provisioned_tp_s =
       option_of_yojson
         (value_for_key transactions_per_second_of_yojson "minProvisionedTPS")
         _list path;
     campaign_config =
       option_of_yojson (value_for_key campaign_config_of_yojson "campaignConfig") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
     latest_campaign_update =
       option_of_yojson
         (value_for_key campaign_update_summary_of_yojson "latestCampaignUpdate")
         _list path;
   }
    : campaign)

let describe_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ campaign = option_of_yojson (value_for_key campaign_of_yojson "campaign") _list path }
    : describe_campaign_response)

let describe_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ campaign_arn = value_for_key arn_of_yojson "campaignArn" _list path }
    : describe_campaign_request)

let batch_segment_job_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_data_destination = value_for_key s3_data_config_of_yojson "s3DataDestination" _list path }
    : batch_segment_job_output)

let batch_segment_job_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_data_source = value_for_key s3_data_config_of_yojson "s3DataSource" _list path }
    : batch_segment_job_input)

let num_batch_results_of_yojson = int_of_yojson

let batch_segment_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     batch_segment_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "batchSegmentJobArn") _list path;
     filter_arn = option_of_yojson (value_for_key arn_of_yojson "filterArn") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     num_results =
       option_of_yojson (value_for_key num_batch_results_of_yojson "numResults") _list path;
     job_input =
       option_of_yojson (value_for_key batch_segment_job_input_of_yojson "jobInput") _list path;
     job_output =
       option_of_yojson (value_for_key batch_segment_job_output_of_yojson "jobOutput") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : batch_segment_job)

let describe_batch_segment_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_segment_job =
       option_of_yojson (value_for_key batch_segment_job_of_yojson "batchSegmentJob") _list path;
   }
    : describe_batch_segment_job_response)

let describe_batch_segment_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ batch_segment_job_arn = value_for_key arn_of_yojson "batchSegmentJobArn" _list path }
    : describe_batch_segment_job_request)

let fields_for_theme_generation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ item_name = value_for_key column_name_of_yojson "itemName" _list path }
    : fields_for_theme_generation)

let theme_generation_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields_for_theme_generation =
       value_for_key fields_for_theme_generation_of_yojson "fieldsForThemeGeneration" _list path;
   }
    : theme_generation_config)

let batch_inference_job_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     item_exploration_config =
       option_of_yojson
         (value_for_key hyper_parameters_of_yojson "itemExplorationConfig")
         _list path;
     ranking_influence =
       option_of_yojson (value_for_key ranking_influence_of_yojson "rankingInfluence") _list path;
   }
    : batch_inference_job_config)

let batch_inference_job_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_data_destination = value_for_key s3_data_config_of_yojson "s3DataDestination" _list path }
    : batch_inference_job_output)

let batch_inference_job_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_data_source = value_for_key s3_data_config_of_yojson "s3DataSource" _list path }
    : batch_inference_job_input)

let batch_inference_job_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = option_of_yojson (value_for_key name_of_yojson "jobName") _list path;
     batch_inference_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "batchInferenceJobArn") _list path;
     filter_arn = option_of_yojson (value_for_key arn_of_yojson "filterArn") _list path;
     failure_reason =
       option_of_yojson (value_for_key failure_reason_of_yojson "failureReason") _list path;
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
     num_results =
       option_of_yojson (value_for_key num_batch_results_of_yojson "numResults") _list path;
     job_input =
       option_of_yojson (value_for_key batch_inference_job_input_of_yojson "jobInput") _list path;
     job_output =
       option_of_yojson (value_for_key batch_inference_job_output_of_yojson "jobOutput") _list path;
     batch_inference_job_config =
       option_of_yojson
         (value_for_key batch_inference_job_config_of_yojson "batchInferenceJobConfig")
         _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     batch_inference_job_mode =
       option_of_yojson
         (value_for_key batch_inference_job_mode_of_yojson "batchInferenceJobMode")
         _list path;
     theme_generation_config =
       option_of_yojson
         (value_for_key theme_generation_config_of_yojson "themeGenerationConfig")
         _list path;
     status = option_of_yojson (value_for_key status_of_yojson "status") _list path;
     creation_date_time =
       option_of_yojson (value_for_key date_of_yojson "creationDateTime") _list path;
     last_updated_date_time =
       option_of_yojson (value_for_key date_of_yojson "lastUpdatedDateTime") _list path;
   }
    : batch_inference_job)

let describe_batch_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_inference_job =
       option_of_yojson (value_for_key batch_inference_job_of_yojson "batchInferenceJob") _list path;
   }
    : describe_batch_inference_job_response)

let describe_batch_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ batch_inference_job_arn = value_for_key arn_of_yojson "batchInferenceJobArn" _list path }
    : describe_batch_inference_job_request)

let describe_algorithm_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ algorithm = option_of_yojson (value_for_key algorithm_of_yojson "algorithm") _list path }
    : describe_algorithm_response)

let describe_algorithm_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ algorithm_arn = value_for_key arn_of_yojson "algorithmArn" _list path }
    : describe_algorithm_request)

let delete_solution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ solution_arn = value_for_key arn_of_yojson "solutionArn" _list path }
    : delete_solution_request)

let delete_schema_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ schema_arn = value_for_key arn_of_yojson "schemaArn" _list path } : delete_schema_request)

let delete_recommender_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender_arn = value_for_key arn_of_yojson "recommenderArn" _list path }
    : delete_recommender_request)

let delete_metric_attribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ metric_attribution_arn = value_for_key arn_of_yojson "metricAttributionArn" _list path }
    : delete_metric_attribution_request)

let delete_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ filter_arn = value_for_key arn_of_yojson "filterArn" _list path } : delete_filter_request)

let delete_event_tracker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_tracker_arn = value_for_key arn_of_yojson "eventTrackerArn" _list path }
    : delete_event_tracker_request)

let delete_dataset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path }
    : delete_dataset_group_request)

let delete_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = value_for_key arn_of_yojson "datasetArn" _list path } : delete_dataset_request)

let delete_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ campaign_arn = value_for_key arn_of_yojson "campaignArn" _list path }
    : delete_campaign_request)

let create_solution_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     solution_version_arn =
       option_of_yojson (value_for_key arn_of_yojson "solutionVersionArn") _list path;
   }
    : create_solution_version_response)

let create_solution_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key name_of_yojson "name") _list path;
     solution_arn = value_for_key arn_of_yojson "solutionArn" _list path;
     training_mode =
       option_of_yojson (value_for_key training_mode_of_yojson "trainingMode") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_solution_version_request)

let create_solution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ solution_arn = option_of_yojson (value_for_key arn_of_yojson "solutionArn") _list path }
    : create_solution_response)

let create_solution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     perform_hp_o = option_of_yojson (value_for_key boolean__of_yojson "performHPO") _list path;
     perform_auto_m_l =
       option_of_yojson (value_for_key perform_auto_m_l_of_yojson "performAutoML") _list path;
     perform_auto_training =
       option_of_yojson
         (value_for_key perform_auto_training_of_yojson "performAutoTraining")
         _list path;
     perform_incremental_update =
       option_of_yojson
         (value_for_key perform_incremental_update_of_yojson "performIncrementalUpdate")
         _list path;
     recipe_arn = option_of_yojson (value_for_key arn_of_yojson "recipeArn") _list path;
     dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path;
     event_type = option_of_yojson (value_for_key event_type_of_yojson "eventType") _list path;
     solution_config =
       option_of_yojson (value_for_key solution_config_of_yojson "solutionConfig") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_solution_request)

let create_schema_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ schema_arn = option_of_yojson (value_for_key arn_of_yojson "schemaArn") _list path }
    : create_schema_response)

let create_schema_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     schema = value_for_key avro_schema_of_yojson "schema" _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
   }
    : create_schema_request)

let create_recommender_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ recommender_arn = option_of_yojson (value_for_key arn_of_yojson "recommenderArn") _list path }
    : create_recommender_response)

let create_recommender_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path;
     recipe_arn = value_for_key arn_of_yojson "recipeArn" _list path;
     recommender_config =
       option_of_yojson (value_for_key recommender_config_of_yojson "recommenderConfig") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_recommender_request)

let create_metric_attribution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_attribution_arn =
       option_of_yojson (value_for_key arn_of_yojson "metricAttributionArn") _list path;
   }
    : create_metric_attribution_response)

let create_metric_attribution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path;
     metrics = value_for_key metric_attributes_of_yojson "metrics" _list path;
     metrics_output_config =
       value_for_key metric_attribution_output_of_yojson "metricsOutputConfig" _list path;
   }
    : create_metric_attribution_request)

let create_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ filter_arn = option_of_yojson (value_for_key arn_of_yojson "filterArn") _list path }
    : create_filter_response)

let create_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path;
     filter_expression = value_for_key filter_expression_of_yojson "filterExpression" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_filter_request)

let create_event_tracker_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_tracker_arn = option_of_yojson (value_for_key arn_of_yojson "eventTrackerArn") _list path;
     tracking_id = option_of_yojson (value_for_key tracking_id_of_yojson "trackingId") _list path;
   }
    : create_event_tracker_response)

let create_event_tracker_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_event_tracker_request)

let create_dataset_import_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_import_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "datasetImportJobArn") _list path;
   }
    : create_dataset_import_job_response)

let create_dataset_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = value_for_key name_of_yojson "jobName" _list path;
     dataset_arn = value_for_key arn_of_yojson "datasetArn" _list path;
     data_source = value_for_key data_source_of_yojson "dataSource" _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     import_mode = option_of_yojson (value_for_key import_mode_of_yojson "importMode") _list path;
     publish_attribution_metrics_to_s3 =
       option_of_yojson
         (value_for_key boolean__of_yojson "publishAttributionMetricsToS3")
         _list path;
   }
    : create_dataset_import_job_request)

let create_dataset_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_group_arn = option_of_yojson (value_for_key arn_of_yojson "datasetGroupArn") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
   }
    : create_dataset_group_response)

let create_dataset_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "kmsKeyArn") _list path;
     domain = option_of_yojson (value_for_key domain_of_yojson "domain") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_dataset_group_request)

let create_dataset_export_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_export_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "datasetExportJobArn") _list path;
   }
    : create_dataset_export_job_response)

let create_dataset_export_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = value_for_key name_of_yojson "jobName" _list path;
     dataset_arn = value_for_key arn_of_yojson "datasetArn" _list path;
     ingestion_mode =
       option_of_yojson (value_for_key ingestion_mode_of_yojson "ingestionMode") _list path;
     role_arn = value_for_key role_arn_of_yojson "roleArn" _list path;
     job_output = value_for_key dataset_export_job_output_of_yojson "jobOutput" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_dataset_export_job_request)

let create_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_arn = option_of_yojson (value_for_key arn_of_yojson "datasetArn") _list path }
    : create_dataset_response)

let create_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     schema_arn = value_for_key arn_of_yojson "schemaArn" _list path;
     dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path;
     dataset_type = value_for_key dataset_type_of_yojson "datasetType" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_dataset_request)

let create_data_deletion_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_deletion_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "dataDeletionJobArn") _list path;
   }
    : create_data_deletion_job_response)

let create_data_deletion_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = value_for_key name_of_yojson "jobName" _list path;
     dataset_group_arn = value_for_key arn_of_yojson "datasetGroupArn" _list path;
     data_source = value_for_key data_source_of_yojson "dataSource" _list path;
     role_arn = value_for_key role_arn_of_yojson "roleArn" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_data_deletion_job_request)

let create_campaign_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ campaign_arn = option_of_yojson (value_for_key arn_of_yojson "campaignArn") _list path }
    : create_campaign_response)

let create_campaign_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key name_of_yojson "name" _list path;
     solution_version_arn = value_for_key arn_of_yojson "solutionVersionArn" _list path;
     min_provisioned_tp_s =
       option_of_yojson
         (value_for_key transactions_per_second_of_yojson "minProvisionedTPS")
         _list path;
     campaign_config =
       option_of_yojson (value_for_key campaign_config_of_yojson "campaignConfig") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_campaign_request)

let create_batch_segment_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_segment_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "batchSegmentJobArn") _list path;
   }
    : create_batch_segment_job_response)

let create_batch_segment_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = value_for_key name_of_yojson "jobName" _list path;
     solution_version_arn = value_for_key arn_of_yojson "solutionVersionArn" _list path;
     filter_arn = option_of_yojson (value_for_key arn_of_yojson "filterArn") _list path;
     num_results =
       option_of_yojson (value_for_key num_batch_results_of_yojson "numResults") _list path;
     job_input = value_for_key batch_segment_job_input_of_yojson "jobInput" _list path;
     job_output = value_for_key batch_segment_job_output_of_yojson "jobOutput" _list path;
     role_arn = value_for_key role_arn_of_yojson "roleArn" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
   }
    : create_batch_segment_job_request)

let create_batch_inference_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_inference_job_arn =
       option_of_yojson (value_for_key arn_of_yojson "batchInferenceJobArn") _list path;
   }
    : create_batch_inference_job_response)

let create_batch_inference_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_name = value_for_key name_of_yojson "jobName" _list path;
     solution_version_arn = value_for_key arn_of_yojson "solutionVersionArn" _list path;
     filter_arn = option_of_yojson (value_for_key arn_of_yojson "filterArn") _list path;
     num_results =
       option_of_yojson (value_for_key num_batch_results_of_yojson "numResults") _list path;
     job_input = value_for_key batch_inference_job_input_of_yojson "jobInput" _list path;
     job_output = value_for_key batch_inference_job_output_of_yojson "jobOutput" _list path;
     role_arn = value_for_key role_arn_of_yojson "roleArn" _list path;
     batch_inference_job_config =
       option_of_yojson
         (value_for_key batch_inference_job_config_of_yojson "batchInferenceJobConfig")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     batch_inference_job_mode =
       option_of_yojson
         (value_for_key batch_inference_job_mode_of_yojson "batchInferenceJobMode")
         _list path;
     theme_generation_config =
       option_of_yojson
         (value_for_key theme_generation_config_of_yojson "themeGenerationConfig")
         _list path;
   }
    : create_batch_inference_job_request)
