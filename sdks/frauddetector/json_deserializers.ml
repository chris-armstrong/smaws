open Smaws_Lib.Json.DeserializeHelpers
open Types

let whole_number_version_string_of_yojson = string_of_yojson
let variable_value_of_yojson = string_of_yojson
let variable_type_of_yojson = string_of_yojson
let variable_name_of_yojson = string_of_yojson
let utc_timestamp_is_o8601_of_yojson = string_of_yojson
let time_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "value" _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let string__of_yojson = string_of_yojson
let sensitive_string_of_yojson = string_of_yojson
let sage_maker_endpoint_identifier_of_yojson = string_of_yojson
let s3_bucket_location_of_yojson = string_of_yojson
let rule_expression_of_yojson = string_of_yojson
let no_dash_identifier_of_yojson = string_of_yojson
let next_token_of_yojson = string_of_yojson
let models_max_page_size_of_yojson = int_of_yojson
let model_identifier_of_yojson = string_of_yojson

let model_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_TAKEOVER_INSIGHTS" -> ACCOUNT_TAKEOVER_INSIGHTS
    | `String "TRANSACTION_FRAUD_INSIGHTS" -> TRANSACTION_FRAUD_INSIGHTS
    | `String "ONLINE_FRAUD_INSIGHTS" -> ONLINE_FRAUD_INSIGHTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelTypeEnum")
     : model_type_enum)
    : model_type_enum)

let float_version_string_of_yojson = string_of_yojson

let training_data_source_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "INGESTED_EVENTS" -> INGESTED_EVENTS
    | `String "EXTERNAL_EVENTS" -> EXTERNAL_EVENTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TrainingDataSourceEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "TrainingDataSourceEnum")
     : training_data_source_enum)
    : training_data_source_enum)

let list_of_strings_of_yojson tree path = list_of_yojson string__of_yojson tree path

let label_mapper_of_yojson tree path =
  map_of_yojson string__of_yojson list_of_strings_of_yojson tree path

let unlabeled_events_treatment_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTO" -> AUTO
    | `String "LEGIT" -> LEGIT
    | `String "FRAUD" -> FRAUD
    | `String "IGNORE" -> IGNORE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UnlabeledEventsTreatment" value)
    | _ -> raise (deserialize_wrong_type_error path "UnlabeledEventsTreatment")
     : unlabeled_events_treatment)
    : unlabeled_events_treatment)

let label_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unlabeled_events_treatment =
       option_of_yojson
         (value_for_key unlabeled_events_treatment_of_yojson "unlabeledEventsTreatment")
         _list path;
     label_mapper = option_of_yojson (value_for_key label_mapper_of_yojson "labelMapper") _list path;
   }
    : label_schema)

let training_data_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_schema = option_of_yojson (value_for_key label_schema_of_yojson "labelSchema") _list path;
     model_variables = value_for_key list_of_strings_of_yojson "modelVariables" _list path;
   }
    : training_data_schema)

let iam_role_arn_of_yojson = string_of_yojson

let external_events_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_access_role_arn = value_for_key iam_role_arn_of_yojson "dataAccessRoleArn" _list path;
     data_location = value_for_key s3_bucket_location_of_yojson "dataLocation" _list path;
   }
    : external_events_detail)

let ingested_events_time_window_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = value_for_key time_of_yojson "endTime" _list path;
     start_time = value_for_key time_of_yojson "startTime" _list path;
   }
    : ingested_events_time_window)

let ingested_events_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingested_events_time_window =
       value_for_key ingested_events_time_window_of_yojson "ingestedEventsTimeWindow" _list path;
   }
    : ingested_events_detail)

let file_validation_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key string__of_yojson "type") _list path;
     content = option_of_yojson (value_for_key string__of_yojson "content") _list path;
     title = option_of_yojson (value_for_key string__of_yojson "title") _list path;
   }
    : file_validation_message)

let file_validation_message_list_of_yojson tree path =
  list_of_yojson file_validation_message_of_yojson tree path

let field_validation_message_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key string__of_yojson "type") _list path;
     content = option_of_yojson (value_for_key string__of_yojson "content") _list path;
     title = option_of_yojson (value_for_key string__of_yojson "title") _list path;
     identifier = option_of_yojson (value_for_key string__of_yojson "identifier") _list path;
     field_name = option_of_yojson (value_for_key string__of_yojson "fieldName") _list path;
   }
    : field_validation_message)

let field_validation_message_list_of_yojson tree path =
  list_of_yojson field_validation_message_of_yojson tree path

let data_validation_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_level_messages =
       option_of_yojson
         (value_for_key field_validation_message_list_of_yojson "fieldLevelMessages")
         _list path;
     file_level_messages =
       option_of_yojson
         (value_for_key file_validation_message_list_of_yojson "fileLevelMessages")
         _list path;
   }
    : data_validation_metrics)

let float__of_yojson = float_of_yojson

let metric_data_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     threshold = option_of_yojson (value_for_key float__of_yojson "threshold") _list path;
     tpr = option_of_yojson (value_for_key float__of_yojson "tpr") _list path;
     precision = option_of_yojson (value_for_key float__of_yojson "precision") _list path;
     fpr = option_of_yojson (value_for_key float__of_yojson "fpr") _list path;
   }
    : metric_data_point)

let metric_data_points_list_of_yojson tree path =
  list_of_yojson metric_data_point_of_yojson tree path

let training_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_data_points =
       option_of_yojson
         (value_for_key metric_data_points_list_of_yojson "metricDataPoints")
         _list path;
     auc = option_of_yojson (value_for_key float__of_yojson "auc") _list path;
   }
    : training_metrics)

let log_odds_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variable_importance = value_for_key float__of_yojson "variableImportance" _list path;
     variable_type = value_for_key string__of_yojson "variableType" _list path;
     variable_name = value_for_key string__of_yojson "variableName" _list path;
   }
    : log_odds_metric)

let list_of_log_odds_metrics_of_yojson tree path =
  list_of_yojson log_odds_metric_of_yojson tree path

let variable_importance_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_odds_metrics =
       option_of_yojson
         (value_for_key list_of_log_odds_metrics_of_yojson "logOddsMetrics")
         _list path;
   }
    : variable_importance_metrics)

let training_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variable_importance_metrics =
       option_of_yojson
         (value_for_key variable_importance_metrics_of_yojson "variableImportanceMetrics")
         _list path;
     training_metrics =
       option_of_yojson (value_for_key training_metrics_of_yojson "trainingMetrics") _list path;
     data_validation_metrics =
       option_of_yojson
         (value_for_key data_validation_metrics_of_yojson "dataValidationMetrics")
         _list path;
   }
    : training_result)

let fraud_detector_arn_of_yojson = string_of_yojson

let ofi_metric_data_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     threshold = option_of_yojson (value_for_key float__of_yojson "threshold") _list path;
     tpr = option_of_yojson (value_for_key float__of_yojson "tpr") _list path;
     precision = option_of_yojson (value_for_key float__of_yojson "precision") _list path;
     fpr = option_of_yojson (value_for_key float__of_yojson "fpr") _list path;
   }
    : ofi_metric_data_point)

let ofi_metric_data_points_list_of_yojson tree path =
  list_of_yojson ofi_metric_data_point_of_yojson tree path

let uncertainty_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upper_bound_value = value_for_key float__of_yojson "upperBoundValue" _list path;
     lower_bound_value = value_for_key float__of_yojson "lowerBoundValue" _list path;
   }
    : uncertainty_range)

let ofi_model_performance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     uncertainty_range =
       option_of_yojson (value_for_key uncertainty_range_of_yojson "uncertaintyRange") _list path;
     auc = option_of_yojson (value_for_key float__of_yojson "auc") _list path;
   }
    : ofi_model_performance)

let ofi_training_metrics_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_performance =
       option_of_yojson
         (value_for_key ofi_model_performance_of_yojson "modelPerformance")
         _list path;
     metric_data_points =
       option_of_yojson
         (value_for_key ofi_metric_data_points_list_of_yojson "metricDataPoints")
         _list path;
   }
    : ofi_training_metrics_value)

let tfi_metric_data_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     threshold = option_of_yojson (value_for_key float__of_yojson "threshold") _list path;
     tpr = option_of_yojson (value_for_key float__of_yojson "tpr") _list path;
     precision = option_of_yojson (value_for_key float__of_yojson "precision") _list path;
     fpr = option_of_yojson (value_for_key float__of_yojson "fpr") _list path;
   }
    : tfi_metric_data_point)

let tfi_metric_data_points_list_of_yojson tree path =
  list_of_yojson tfi_metric_data_point_of_yojson tree path

let tfi_model_performance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     uncertainty_range =
       option_of_yojson (value_for_key uncertainty_range_of_yojson "uncertaintyRange") _list path;
     auc = option_of_yojson (value_for_key float__of_yojson "auc") _list path;
   }
    : tfi_model_performance)

let tfi_training_metrics_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_performance =
       option_of_yojson
         (value_for_key tfi_model_performance_of_yojson "modelPerformance")
         _list path;
     metric_data_points =
       option_of_yojson
         (value_for_key tfi_metric_data_points_list_of_yojson "metricDataPoints")
         _list path;
   }
    : tfi_training_metrics_value)

let ati_metric_data_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     atodr = option_of_yojson (value_for_key float__of_yojson "atodr") _list path;
     threshold = option_of_yojson (value_for_key float__of_yojson "threshold") _list path;
     adr = option_of_yojson (value_for_key float__of_yojson "adr") _list path;
     cr = option_of_yojson (value_for_key float__of_yojson "cr") _list path;
   }
    : ati_metric_data_point)

let ati_metric_data_points_list_of_yojson tree path =
  list_of_yojson ati_metric_data_point_of_yojson tree path

let ati_model_performance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ asi = option_of_yojson (value_for_key float__of_yojson "asi") _list path }
    : ati_model_performance)

let ati_training_metrics_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_performance =
       option_of_yojson
         (value_for_key ati_model_performance_of_yojson "modelPerformance")
         _list path;
     metric_data_points =
       option_of_yojson
         (value_for_key ati_metric_data_points_list_of_yojson "metricDataPoints")
         _list path;
   }
    : ati_training_metrics_value)

let training_metrics_v2_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ati = option_of_yojson (value_for_key ati_training_metrics_value_of_yojson "ati") _list path;
     tfi = option_of_yojson (value_for_key tfi_training_metrics_value_of_yojson "tfi") _list path;
     ofi = option_of_yojson (value_for_key ofi_training_metrics_value_of_yojson "ofi") _list path;
   }
    : training_metrics_v2)

let aggregated_log_odds_metric_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregated_variables_importance =
       value_for_key float__of_yojson "aggregatedVariablesImportance" _list path;
     variable_names = value_for_key list_of_strings_of_yojson "variableNames" _list path;
   }
    : aggregated_log_odds_metric)

let list_of_aggregated_log_odds_metrics_of_yojson tree path =
  list_of_yojson aggregated_log_odds_metric_of_yojson tree path

let aggregated_variables_importance_metrics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_odds_metrics =
       option_of_yojson
         (value_for_key list_of_aggregated_log_odds_metrics_of_yojson "logOddsMetrics")
         _list path;
   }
    : aggregated_variables_importance_metrics)

let training_result_v2_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregated_variables_importance_metrics =
       option_of_yojson
         (value_for_key aggregated_variables_importance_metrics_of_yojson
            "aggregatedVariablesImportanceMetrics")
         _list path;
     variable_importance_metrics =
       option_of_yojson
         (value_for_key variable_importance_metrics_of_yojson "variableImportanceMetrics")
         _list path;
     training_metrics_v2 =
       option_of_yojson (value_for_key training_metrics_v2_of_yojson "trainingMetricsV2") _list path;
     data_validation_metrics =
       option_of_yojson
         (value_for_key data_validation_metrics_of_yojson "dataValidationMetrics")
         _list path;
   }
    : training_result_v2)

let model_version_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     training_result_v2 =
       option_of_yojson (value_for_key training_result_v2_of_yojson "trainingResultV2") _list path;
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     training_result =
       option_of_yojson (value_for_key training_result_of_yojson "trainingResult") _list path;
     ingested_events_detail =
       option_of_yojson
         (value_for_key ingested_events_detail_of_yojson "ingestedEventsDetail")
         _list path;
     external_events_detail =
       option_of_yojson
         (value_for_key external_events_detail_of_yojson "externalEventsDetail")
         _list path;
     training_data_schema =
       option_of_yojson
         (value_for_key training_data_schema_of_yojson "trainingDataSchema")
         _list path;
     training_data_source =
       option_of_yojson
         (value_for_key training_data_source_enum_of_yojson "trainingDataSource")
         _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     model_version_number =
       option_of_yojson
         (value_for_key float_version_string_of_yojson "modelVersionNumber")
         _list path;
     model_type = option_of_yojson (value_for_key model_type_enum_of_yojson "modelType") _list path;
     model_id = option_of_yojson (value_for_key model_identifier_of_yojson "modelId") _list path;
   }
    : model_version_detail)

let model_version_detail_list_of_yojson tree path =
  list_of_yojson model_version_detail_of_yojson tree path

let description_of_yojson = string_of_yojson

let model_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     event_type_name = option_of_yojson (value_for_key string__of_yojson "eventTypeName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     model_type = option_of_yojson (value_for_key model_type_enum_of_yojson "modelType") _list path;
     model_id = option_of_yojson (value_for_key model_identifier_of_yojson "modelId") _list path;
   }
    : model)

let model_list_of_yojson tree path = list_of_yojson model_of_yojson tree path
let model_input_template_of_yojson = string_of_yojson

let variable_impact_explanation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_odds_impact = option_of_yojson (value_for_key float__of_yojson "logOddsImpact") _list path;
     relative_impact =
       option_of_yojson (value_for_key string__of_yojson "relativeImpact") _list path;
     event_variable_name =
       option_of_yojson (value_for_key string__of_yojson "eventVariableName") _list path;
   }
    : variable_impact_explanation)

let list_of_variable_impact_explanations_of_yojson tree path =
  list_of_yojson variable_impact_explanation_of_yojson tree path

let entity_restricted_string_of_yojson = string_of_yojson

let entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity_id = value_for_key entity_restricted_string_of_yojson "entityId" _list path;
     entity_type = value_for_key string__of_yojson "entityType" _list path;
   }
    : entity)

let list_of_entities_of_yojson tree path = list_of_yojson entity_of_yojson tree path
let labels_max_results_of_yojson = int_of_yojson

let label_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : label)

let label_list_of_yojson tree path = list_of_yojson label_of_yojson tree path
let identifier_of_yojson = string_of_yojson
let filter_string_of_yojson = string_of_yojson
let event_types_max_results_of_yojson = int_of_yojson
let non_empty_list_of_strings_of_yojson tree path = list_of_yojson string__of_yojson tree path

let event_ingestion_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventIngestion" value)
    | _ -> raise (deserialize_wrong_type_error path "EventIngestion")
     : event_ingestion)
    : event_ingestion)

let long_of_yojson = long_of_yojson

let ingested_event_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     most_recent_event =
       option_of_yojson (value_for_key time_of_yojson "mostRecentEvent") _list path;
     least_recent_event =
       option_of_yojson (value_for_key time_of_yojson "leastRecentEvent") _list path;
     event_data_size_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "eventDataSizeInBytes") _list path;
     number_of_events = option_of_yojson (value_for_key long_of_yojson "numberOfEvents") _list path;
   }
    : ingested_event_statistics)

let boolean__of_yojson = bool_of_yojson

let event_orchestration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_bridge_enabled = value_for_key boolean__of_yojson "eventBridgeEnabled" _list path }
    : event_orchestration)

let event_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_orchestration =
       option_of_yojson
         (value_for_key event_orchestration_of_yojson "eventOrchestration")
         _list path;
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     ingested_event_statistics =
       option_of_yojson
         (value_for_key ingested_event_statistics_of_yojson "ingestedEventStatistics")
         _list path;
     event_ingestion =
       option_of_yojson (value_for_key event_ingestion_of_yojson "eventIngestion") _list path;
     entity_types =
       option_of_yojson (value_for_key non_empty_list_of_strings_of_yojson "entityTypes") _list path;
     labels = option_of_yojson (value_for_key list_of_strings_of_yojson "labels") _list path;
     event_variables =
       option_of_yojson (value_for_key list_of_strings_of_yojson "eventVariables") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : event_type)

let event_type_list_of_yojson tree path = list_of_yojson event_type_of_yojson tree path
let entity_types_max_results_of_yojson = int_of_yojson

let entity_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : entity_type)

let entity_type_list_of_yojson tree path = list_of_yojson entity_type_of_yojson tree path
let content_type_of_yojson = string_of_yojson
let blob_of_yojson = blob_of_yojson
let batch_predictions_max_page_size_of_yojson = int_of_yojson
let batch_imports_max_page_size_of_yojson = int_of_yojson
let attribute_value_of_yojson = string_of_yojson
let attribute_key_of_yojson = string_of_yojson
let variables_max_results_of_yojson = int_of_yojson

let data_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATETIME" -> DATETIME
    | `String "BOOLEAN" -> BOOLEAN
    | `String "FLOAT" -> FLOAT
    | `String "INTEGER" -> INTEGER
    | `String "STRING" -> STRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataType" value)
    | _ -> raise (deserialize_wrong_type_error path "DataType")
     : data_type)
    : data_type)

let data_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXTERNAL_MODEL_SCORE" -> EXTERNAL_MODEL_SCORE
    | `String "MODEL_SCORE" -> MODEL_SCORE
    | `String "EVENT" -> EVENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataSource" value)
    | _ -> raise (deserialize_wrong_type_error path "DataSource")
     : data_source)
    : data_source)

let variable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     variable_type = option_of_yojson (value_for_key string__of_yojson "variableType") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     default_value = option_of_yojson (value_for_key string__of_yojson "defaultValue") _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "dataSource") _list path;
     data_type = option_of_yojson (value_for_key data_type_of_yojson "dataType") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : variable)

let variable_list_of_yojson tree path = list_of_yojson variable_of_yojson tree path

let variable_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variable_type = option_of_yojson (value_for_key string__of_yojson "variableType") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     default_value = option_of_yojson (value_for_key string__of_yojson "defaultValue") _list path;
     data_source = option_of_yojson (value_for_key string__of_yojson "dataSource") _list path;
     data_type = option_of_yojson (value_for_key string__of_yojson "dataType") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : variable_entry)

let variable_entry_list_of_yojson tree path = list_of_yojson variable_entry_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path } : validation_exception)

let use_event_variables_of_yojson = bool_of_yojson

let update_variable_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_variable_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variable_type = option_of_yojson (value_for_key string__of_yojson "variableType") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     default_value = option_of_yojson (value_for_key string__of_yojson "defaultValue") _list path;
     name = value_for_key string__of_yojson "name" _list path;
   }
    : update_variable_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path } : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path } : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path } : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "message" _list path } : access_denied_exception)

let rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_version = value_for_key whole_number_version_string_of_yojson "ruleVersion" _list path;
     rule_id = value_for_key identifier_of_yojson "ruleId" _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : rule)

let update_rule_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule = option_of_yojson (value_for_key rule_of_yojson "rule") _list path }
    : update_rule_version_result)

let language_of_yojson (tree : t) path =
  ((match tree with
    | `String "DETECTORPL" -> DETECTORPL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Language" value)
    | _ -> raise (deserialize_wrong_type_error path "Language")
     : language)
    : language)

let update_rule_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     outcomes = value_for_key non_empty_list_of_strings_of_yojson "outcomes" _list path;
     language = value_for_key language_of_yojson "language" _list path;
     expression = value_for_key rule_expression_of_yojson "expression" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     rule = value_for_key rule_of_yojson "rule" _list path;
   }
    : update_rule_version_request)

let update_rule_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_rule_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = value_for_key description_of_yojson "description" _list path;
     rule = value_for_key rule_of_yojson "rule" _list path;
   }
    : update_rule_metadata_request)

let update_model_version_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let model_version_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRAINING_CANCELLED" -> TRAINING_CANCELLED
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelVersionStatus")
     : model_version_status)
    : model_version_status)

let update_model_version_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key model_version_status_of_yojson "status" _list path;
     model_version_number =
       value_for_key float_version_string_of_yojson "modelVersionNumber" _list path;
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : update_model_version_status_request)

let update_model_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     model_version_number =
       option_of_yojson
         (value_for_key float_version_string_of_yojson "modelVersionNumber")
         _list path;
     model_type = option_of_yojson (value_for_key model_type_enum_of_yojson "modelType") _list path;
     model_id = option_of_yojson (value_for_key model_identifier_of_yojson "modelId") _list path;
   }
    : update_model_version_result)

let update_model_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     ingested_events_detail =
       option_of_yojson
         (value_for_key ingested_events_detail_of_yojson "ingestedEventsDetail")
         _list path;
     external_events_detail =
       option_of_yojson
         (value_for_key external_events_detail_of_yojson "externalEventsDetail")
         _list path;
     major_version_number =
       value_for_key whole_number_version_string_of_yojson "majorVersionNumber" _list path;
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : update_model_version_request)

let update_model_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : update_model_request)

let update_list_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let elements_of_yojson = string_of_yojson
let elements_list_of_yojson tree path = list_of_yojson elements_of_yojson tree path

let list_update_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "REMOVE" -> REMOVE
    | `String "APPEND" -> APPEND
    | `String "REPLACE" -> REPLACE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ListUpdateMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ListUpdateMode")
     : list_update_mode)
    : list_update_mode)

let update_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variable_type =
       option_of_yojson (value_for_key variable_type_of_yojson "variableType") _list path;
     update_mode =
       option_of_yojson (value_for_key list_update_mode_of_yojson "updateMode") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     elements = option_of_yojson (value_for_key elements_list_of_yojson "elements") _list path;
     name = value_for_key no_dash_identifier_of_yojson "name" _list path;
   }
    : update_list_request)

let update_event_label_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_event_label_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_timestamp = value_for_key utc_timestamp_is_o8601_of_yojson "labelTimestamp" _list path;
     assigned_label = value_for_key identifier_of_yojson "assignedLabel" _list path;
     event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path;
     event_id = value_for_key identifier_of_yojson "eventId" _list path;
   }
    : update_event_label_request)

let update_detector_version_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let detector_version_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String "DRAFT" -> DRAFT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DetectorVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DetectorVersionStatus")
     : detector_version_status)
    : detector_version_status)

let update_detector_version_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key detector_version_status_of_yojson "status" _list path;
     detector_version_id =
       value_for_key whole_number_version_string_of_yojson "detectorVersionId" _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : update_detector_version_status_request)

let update_detector_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let rule_list_of_yojson tree path = list_of_yojson rule_of_yojson tree path

let model_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     model_version_number =
       value_for_key float_version_string_of_yojson "modelVersionNumber" _list path;
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : model_version)

let list_of_model_versions_of_yojson tree path = list_of_yojson model_version_of_yojson tree path

let rule_execution_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIRST_MATCHED" -> FIRST_MATCHED
    | `String "ALL_MATCHED" -> ALL_MATCHED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleExecutionMode" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleExecutionMode")
     : rule_execution_mode)
    : rule_execution_mode)

let update_detector_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_execution_mode =
       option_of_yojson (value_for_key rule_execution_mode_of_yojson "ruleExecutionMode") _list path;
     model_versions =
       option_of_yojson (value_for_key list_of_model_versions_of_yojson "modelVersions") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     rules = value_for_key rule_list_of_yojson "rules" _list path;
     external_model_endpoints =
       value_for_key list_of_strings_of_yojson "externalModelEndpoints" _list path;
     detector_version_id =
       value_for_key whole_number_version_string_of_yojson "detectorVersionId" _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : update_detector_version_request)

let update_detector_version_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_detector_version_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = value_for_key description_of_yojson "description" _list path;
     detector_version_id =
       value_for_key whole_number_version_string_of_yojson "detectorVersionId" _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : update_detector_version_metadata_request)

let untag_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_ar_n = value_for_key fraud_detector_arn_of_yojson "resourceARN" _list path;
   }
    : untag_resource_request)

let tags_max_results_of_yojson = int_of_yojson

let tag_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     resource_ar_n = value_for_key fraud_detector_arn_of_yojson "resourceARN" _list path;
   }
    : tag_resource_request)

let send_event_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let event_variable_map_of_yojson tree path =
  map_of_yojson variable_name_of_yojson variable_value_of_yojson tree path

let send_event_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = value_for_key list_of_entities_of_yojson "entities" _list path;
     label_timestamp =
       option_of_yojson (value_for_key utc_timestamp_is_o8601_of_yojson "labelTimestamp") _list path;
     assigned_label =
       option_of_yojson (value_for_key identifier_of_yojson "assignedLabel") _list path;
     event_variables = value_for_key event_variable_map_of_yojson "eventVariables" _list path;
     event_timestamp = value_for_key utc_timestamp_is_o8601_of_yojson "eventTimestamp" _list path;
     event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path;
     event_id = value_for_key identifier_of_yojson "eventId" _list path;
   }
    : send_event_request)

let rules_max_results_of_yojson = int_of_yojson

let rule_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outcomes = option_of_yojson (value_for_key list_of_strings_of_yojson "outcomes") _list path;
     rule_id = option_of_yojson (value_for_key string__of_yojson "ruleId") _list path;
   }
    : rule_result)

let rule_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     outcomes =
       option_of_yojson (value_for_key non_empty_list_of_strings_of_yojson "outcomes") _list path;
     language = option_of_yojson (value_for_key language_of_yojson "language") _list path;
     expression = option_of_yojson (value_for_key rule_expression_of_yojson "expression") _list path;
     rule_version =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "ruleVersion")
         _list path;
     detector_id = option_of_yojson (value_for_key identifier_of_yojson "detectorId") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     rule_id = option_of_yojson (value_for_key identifier_of_yojson "ruleId") _list path;
   }
    : rule_detail)

let rule_detail_list_of_yojson tree path = list_of_yojson rule_detail_of_yojson tree path

let resource_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key string__of_yojson "message") _list path }
    : resource_unavailable_exception)

let put_outcome_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_outcome_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key identifier_of_yojson "name" _list path;
   }
    : put_outcome_request)

let put_label_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_label_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key identifier_of_yojson "name" _list path;
   }
    : put_label_request)

let put_kms_encryption_key_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let kms_encryption_key_arn_of_yojson = string_of_yojson

let put_kms_encryption_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_encryption_key_arn =
       value_for_key kms_encryption_key_arn_of_yojson "kmsEncryptionKeyArn" _list path;
   }
    : put_kms_encryption_key_request)

let put_external_model_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let model_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "SAGEMAKER" -> SAGEMAKER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelSource" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelSource")
     : model_source)
    : model_source)

let model_input_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPLICATION_JSON" -> JSON
    | `String "TEXT_CSV" -> CSV
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ModelInputDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelInputDataFormat")
     : model_input_data_format)
    : model_input_data_format)

let model_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     csv_input_template =
       option_of_yojson (value_for_key model_input_template_of_yojson "csvInputTemplate") _list path;
     json_input_template =
       option_of_yojson
         (value_for_key model_input_template_of_yojson "jsonInputTemplate")
         _list path;
     use_event_variables =
       value_for_key use_event_variables_of_yojson "useEventVariables" _list path;
     format = option_of_yojson (value_for_key model_input_data_format_of_yojson "format") _list path;
     event_type_name =
       option_of_yojson (value_for_key identifier_of_yojson "eventTypeName") _list path;
   }
    : model_input_configuration)

let model_output_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "APPLICATION_JSONLINES" -> JSONLINES
    | `String "TEXT_CSV" -> CSV
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ModelOutputDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelOutputDataFormat")
     : model_output_data_format)
    : model_output_data_format)

let json_key_to_variable_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let csv_index_to_variable_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let model_output_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     csv_index_to_variable_map =
       option_of_yojson
         (value_for_key csv_index_to_variable_map_of_yojson "csvIndexToVariableMap")
         _list path;
     json_key_to_variable_map =
       option_of_yojson
         (value_for_key json_key_to_variable_map_of_yojson "jsonKeyToVariableMap")
         _list path;
     format = value_for_key model_output_data_format_of_yojson "format" _list path;
   }
    : model_output_configuration)

let model_endpoint_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISSOCIATED" -> DISSOCIATED
    | `String "ASSOCIATED" -> ASSOCIATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelEndpointStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelEndpointStatus")
     : model_endpoint_status)
    : model_endpoint_status)

let put_external_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     model_endpoint_status =
       value_for_key model_endpoint_status_of_yojson "modelEndpointStatus" _list path;
     output_configuration =
       value_for_key model_output_configuration_of_yojson "outputConfiguration" _list path;
     input_configuration =
       value_for_key model_input_configuration_of_yojson "inputConfiguration" _list path;
     invoke_model_endpoint_role_arn =
       value_for_key string__of_yojson "invokeModelEndpointRoleArn" _list path;
     model_source = value_for_key model_source_of_yojson "modelSource" _list path;
     model_endpoint =
       value_for_key sage_maker_endpoint_identifier_of_yojson "modelEndpoint" _list path;
   }
    : put_external_model_request)

let put_event_type_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_event_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_orchestration =
       option_of_yojson
         (value_for_key event_orchestration_of_yojson "eventOrchestration")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     event_ingestion =
       option_of_yojson (value_for_key event_ingestion_of_yojson "eventIngestion") _list path;
     entity_types = value_for_key non_empty_list_of_strings_of_yojson "entityTypes" _list path;
     labels = option_of_yojson (value_for_key list_of_strings_of_yojson "labels") _list path;
     event_variables = value_for_key non_empty_list_of_strings_of_yojson "eventVariables" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key identifier_of_yojson "name" _list path;
   }
    : put_event_type_request)

let put_entity_type_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_entity_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key identifier_of_yojson "name" _list path;
   }
    : put_entity_type_request)

let put_detector_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_detector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : put_detector_request)

let prediction_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = value_for_key time_of_yojson "endTime" _list path;
     start_time = value_for_key time_of_yojson "startTime" _list path;
   }
    : prediction_time_range)

let aggregated_variables_impact_explanation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_odds_impact = option_of_yojson (value_for_key float__of_yojson "logOddsImpact") _list path;
     relative_impact =
       option_of_yojson (value_for_key string__of_yojson "relativeImpact") _list path;
     event_variable_names =
       option_of_yojson (value_for_key list_of_strings_of_yojson "eventVariableNames") _list path;
   }
    : aggregated_variables_impact_explanation)

let list_of_aggregated_variables_impact_explanations_of_yojson tree path =
  list_of_yojson aggregated_variables_impact_explanation_of_yojson tree path

let prediction_explanations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregated_variables_impact_explanations =
       option_of_yojson
         (value_for_key list_of_aggregated_variables_impact_explanations_of_yojson
            "aggregatedVariablesImpactExplanations")
         _list path;
     variable_impact_explanations =
       option_of_yojson
         (value_for_key list_of_variable_impact_explanations_of_yojson "variableImpactExplanations")
         _list path;
   }
    : prediction_explanations)

let outcomes_max_results_of_yojson = int_of_yojson

let outcome_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key identifier_of_yojson "name") _list path;
   }
    : outcome)

let outcome_list_of_yojson tree path = list_of_yojson outcome_of_yojson tree path
let name_list_of_yojson tree path = list_of_yojson string__of_yojson tree path

let model_version_evaluation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prediction_explanations =
       option_of_yojson
         (value_for_key prediction_explanations_of_yojson "predictionExplanations")
         _list path;
     evaluation_score =
       option_of_yojson (value_for_key string__of_yojson "evaluationScore") _list path;
     output_variable_name =
       option_of_yojson (value_for_key string__of_yojson "outputVariableName") _list path;
   }
    : model_version_evaluation)

let model_prediction_map_of_yojson tree path =
  map_of_yojson string__of_yojson float__of_yojson tree path

let model_scores_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scores = option_of_yojson (value_for_key model_prediction_map_of_yojson "scores") _list path;
     model_version =
       option_of_yojson (value_for_key model_version_of_yojson "modelVersion") _list path;
   }
    : model_scores)

let model_endpoint_data_blob_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     content_type = option_of_yojson (value_for_key content_type_of_yojson "contentType") _list path;
     byte_buffer = option_of_yojson (value_for_key blob_of_yojson "byteBuffer") _list path;
   }
    : model_endpoint_data_blob)

let map_of_strings_of_yojson tree path = map_of_yojson string__of_yojson string__of_yojson tree path
let lists_metadata_max_results_of_yojson = int_of_yojson
let lists_elements_max_results_of_yojson = int_of_yojson

let list_tags_for_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
   }
    : list_tags_for_resource_result)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key tags_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     resource_ar_n = value_for_key fraud_detector_arn_of_yojson "resourceARN" _list path;
   }
    : list_tags_for_resource_request)

let list_of_rule_results_of_yojson tree path = list_of_yojson rule_result_of_yojson tree path

let list_of_model_version_evaluations_of_yojson tree path =
  list_of_yojson model_version_evaluation_of_yojson tree path

let list_of_model_scores_of_yojson tree path = list_of_yojson model_scores_of_yojson tree path

let external_model_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_source = option_of_yojson (value_for_key model_source_of_yojson "modelSource") _list path;
     model_endpoint = option_of_yojson (value_for_key string__of_yojson "modelEndpoint") _list path;
   }
    : external_model_summary)

let external_model_prediction_map_of_yojson tree path =
  map_of_yojson string__of_yojson string__of_yojson tree path

let external_model_outputs_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     outputs =
       option_of_yojson (value_for_key external_model_prediction_map_of_yojson "outputs") _list path;
     external_model =
       option_of_yojson (value_for_key external_model_summary_of_yojson "externalModel") _list path;
   }
    : external_model_outputs)

let list_of_external_model_outputs_of_yojson tree path =
  list_of_yojson external_model_outputs_of_yojson tree path

let event_variable_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key sensitive_string_of_yojson "source") _list path;
     value = option_of_yojson (value_for_key sensitive_string_of_yojson "value") _list path;
     name = option_of_yojson (value_for_key sensitive_string_of_yojson "name") _list path;
   }
    : event_variable_summary)

let list_of_event_variable_summaries_of_yojson tree path =
  list_of_yojson event_variable_summary_of_yojson tree path

let event_prediction_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detector_version_id =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "detectorVersionId")
         _list path;
     detector_id = option_of_yojson (value_for_key identifier_of_yojson "detectorId") _list path;
     prediction_timestamp =
       option_of_yojson (value_for_key time_of_yojson "predictionTimestamp") _list path;
     event_timestamp = option_of_yojson (value_for_key time_of_yojson "eventTimestamp") _list path;
     event_type_name =
       option_of_yojson (value_for_key identifier_of_yojson "eventTypeName") _list path;
     event_id = option_of_yojson (value_for_key identifier_of_yojson "eventId") _list path;
   }
    : event_prediction_summary)

let list_of_event_prediction_summaries_of_yojson tree path =
  list_of_yojson event_prediction_summary_of_yojson tree path

let evaluated_model_version_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluations =
       option_of_yojson
         (value_for_key list_of_model_version_evaluations_of_yojson "evaluations")
         _list path;
     model_type = option_of_yojson (value_for_key string__of_yojson "modelType") _list path;
     model_version = option_of_yojson (value_for_key string__of_yojson "modelVersion") _list path;
     model_id = option_of_yojson (value_for_key string__of_yojson "modelId") _list path;
   }
    : evaluated_model_version)

let list_of_evaluated_model_versions_of_yojson tree path =
  list_of_yojson evaluated_model_version_of_yojson tree path

let evaluated_external_model_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_variables =
       option_of_yojson (value_for_key map_of_strings_of_yojson "outputVariables") _list path;
     input_variables =
       option_of_yojson (value_for_key map_of_strings_of_yojson "inputVariables") _list path;
     use_event_variables =
       option_of_yojson (value_for_key boolean__of_yojson "useEventVariables") _list path;
     model_endpoint = option_of_yojson (value_for_key string__of_yojson "modelEndpoint") _list path;
   }
    : evaluated_external_model)

let list_of_evaluated_external_models_of_yojson tree path =
  list_of_yojson evaluated_external_model_of_yojson tree path

let list_event_predictions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     event_prediction_summaries =
       option_of_yojson
         (value_for_key list_of_event_prediction_summaries_of_yojson "eventPredictionSummaries")
         _list path;
   }
    : list_event_predictions_result)

let filter_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ value = option_of_yojson (value_for_key filter_string_of_yojson "value") _list path }
    : filter_condition)

let event_predictions_max_results_of_yojson = int_of_yojson

let list_event_predictions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key event_predictions_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     prediction_time_range =
       option_of_yojson
         (value_for_key prediction_time_range_of_yojson "predictionTimeRange")
         _list path;
     detector_version_id =
       option_of_yojson (value_for_key filter_condition_of_yojson "detectorVersionId") _list path;
     detector_id =
       option_of_yojson (value_for_key filter_condition_of_yojson "detectorId") _list path;
     event_type = option_of_yojson (value_for_key filter_condition_of_yojson "eventType") _list path;
     event_id = option_of_yojson (value_for_key filter_condition_of_yojson "eventId") _list path;
   }
    : list_event_predictions_request)

let kms_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_encryption_key_arn =
       option_of_yojson
         (value_for_key kms_encryption_key_arn_of_yojson "kmsEncryptionKeyArn")
         _list path;
   }
    : kms_key)

let integer2_of_yojson = int_of_yojson
let integer_of_yojson = int_of_yojson

let get_variables_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     variables = option_of_yojson (value_for_key variable_list_of_yojson "variables") _list path;
   }
    : get_variables_result)

let get_variables_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key variables_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : get_variables_request)

let get_rules_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     rule_details =
       option_of_yojson (value_for_key rule_detail_list_of_yojson "ruleDetails") _list path;
   }
    : get_rules_result)

let get_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key rules_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     rule_version =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "ruleVersion")
         _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
     rule_id = option_of_yojson (value_for_key identifier_of_yojson "ruleId") _list path;
   }
    : get_rules_request)

let get_outcomes_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     outcomes = option_of_yojson (value_for_key outcome_list_of_yojson "outcomes") _list path;
   }
    : get_outcomes_result)

let get_outcomes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key outcomes_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     name = option_of_yojson (value_for_key identifier_of_yojson "name") _list path;
   }
    : get_outcomes_request)

let get_models_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     models = option_of_yojson (value_for_key model_list_of_yojson "models") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
   }
    : get_models_result)

let get_models_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key models_max_page_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     model_type = option_of_yojson (value_for_key model_type_enum_of_yojson "modelType") _list path;
     model_id = option_of_yojson (value_for_key model_identifier_of_yojson "modelId") _list path;
   }
    : get_models_request)

let get_model_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     ingested_events_detail =
       option_of_yojson
         (value_for_key ingested_events_detail_of_yojson "ingestedEventsDetail")
         _list path;
     external_events_detail =
       option_of_yojson
         (value_for_key external_events_detail_of_yojson "externalEventsDetail")
         _list path;
     training_data_schema =
       option_of_yojson
         (value_for_key training_data_schema_of_yojson "trainingDataSchema")
         _list path;
     training_data_source =
       option_of_yojson
         (value_for_key training_data_source_enum_of_yojson "trainingDataSource")
         _list path;
     model_version_number =
       option_of_yojson
         (value_for_key float_version_string_of_yojson "modelVersionNumber")
         _list path;
     model_type = option_of_yojson (value_for_key model_type_enum_of_yojson "modelType") _list path;
     model_id = option_of_yojson (value_for_key model_identifier_of_yojson "modelId") _list path;
   }
    : get_model_version_result)

let get_model_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_version_number =
       value_for_key float_version_string_of_yojson "modelVersionNumber" _list path;
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : get_model_version_request)

let allow_deny_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     updated_time = option_of_yojson (value_for_key time_of_yojson "updatedTime") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     variable_type =
       option_of_yojson (value_for_key variable_type_of_yojson "variableType") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     name = value_for_key no_dash_identifier_of_yojson "name" _list path;
   }
    : allow_deny_list)

let allow_deny_lists_of_yojson tree path = list_of_yojson allow_deny_list_of_yojson tree path

let get_lists_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     lists = option_of_yojson (value_for_key allow_deny_lists_of_yojson "lists") _list path;
   }
    : get_lists_metadata_result)

let get_lists_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key lists_metadata_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     name = option_of_yojson (value_for_key no_dash_identifier_of_yojson "name") _list path;
   }
    : get_lists_metadata_request)

let get_list_elements_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     elements = option_of_yojson (value_for_key elements_list_of_yojson "elements") _list path;
   }
    : get_list_elements_result)

let get_list_elements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key lists_elements_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     name = value_for_key no_dash_identifier_of_yojson "name" _list path;
   }
    : get_list_elements_request)

let get_labels_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     labels = option_of_yojson (value_for_key label_list_of_yojson "labels") _list path;
   }
    : get_labels_result)

let get_labels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key labels_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     name = option_of_yojson (value_for_key identifier_of_yojson "name") _list path;
   }
    : get_labels_request)

let get_kms_encryption_key_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ kms_key = option_of_yojson (value_for_key kms_key_of_yojson "kmsKey") _list path }
    : get_kms_encryption_key_result)

let external_model_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     model_endpoint_status =
       option_of_yojson
         (value_for_key model_endpoint_status_of_yojson "modelEndpointStatus")
         _list path;
     output_configuration =
       option_of_yojson
         (value_for_key model_output_configuration_of_yojson "outputConfiguration")
         _list path;
     input_configuration =
       option_of_yojson
         (value_for_key model_input_configuration_of_yojson "inputConfiguration")
         _list path;
     invoke_model_endpoint_role_arn =
       option_of_yojson (value_for_key string__of_yojson "invokeModelEndpointRoleArn") _list path;
     model_source = option_of_yojson (value_for_key model_source_of_yojson "modelSource") _list path;
     model_endpoint = option_of_yojson (value_for_key string__of_yojson "modelEndpoint") _list path;
   }
    : external_model)

let external_model_list_of_yojson tree path = list_of_yojson external_model_of_yojson tree path

let get_external_models_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     external_models =
       option_of_yojson (value_for_key external_model_list_of_yojson "externalModels") _list path;
   }
    : get_external_models_result)

let external_models_max_results_of_yojson = int_of_yojson

let get_external_models_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key external_models_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     model_endpoint = option_of_yojson (value_for_key string__of_yojson "modelEndpoint") _list path;
   }
    : get_external_models_request)

let get_event_types_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     event_types =
       option_of_yojson (value_for_key event_type_list_of_yojson "eventTypes") _list path;
   }
    : get_event_types_result)

let get_event_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key event_types_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     name = option_of_yojson (value_for_key identifier_of_yojson "name") _list path;
   }
    : get_event_types_request)

let event_attribute_map_of_yojson tree path =
  map_of_yojson attribute_key_of_yojson attribute_value_of_yojson tree path

let event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entities = option_of_yojson (value_for_key list_of_entities_of_yojson "entities") _list path;
     label_timestamp =
       option_of_yojson (value_for_key string__of_yojson "labelTimestamp") _list path;
     current_label = option_of_yojson (value_for_key string__of_yojson "currentLabel") _list path;
     event_variables =
       option_of_yojson (value_for_key event_attribute_map_of_yojson "eventVariables") _list path;
     event_timestamp =
       option_of_yojson (value_for_key string__of_yojson "eventTimestamp") _list path;
     event_type_name = option_of_yojson (value_for_key string__of_yojson "eventTypeName") _list path;
     event_id = option_of_yojson (value_for_key string__of_yojson "eventId") _list path;
   }
    : event)

let get_event_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event = option_of_yojson (value_for_key event_of_yojson "event") _list path }
    : get_event_result)

let get_event_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_type_name = value_for_key string__of_yojson "eventTypeName" _list path;
     event_id = value_for_key string__of_yojson "eventId" _list path;
   }
    : get_event_request)

let get_event_prediction_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_model_outputs =
       option_of_yojson
         (value_for_key list_of_external_model_outputs_of_yojson "externalModelOutputs")
         _list path;
     rule_results =
       option_of_yojson (value_for_key list_of_rule_results_of_yojson "ruleResults") _list path;
     model_scores =
       option_of_yojson (value_for_key list_of_model_scores_of_yojson "modelScores") _list path;
   }
    : get_event_prediction_result)

let external_model_endpoint_data_blob_map_of_yojson tree path =
  map_of_yojson sage_maker_endpoint_identifier_of_yojson model_endpoint_data_blob_of_yojson tree
    path

let get_event_prediction_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     external_model_endpoint_data_blobs =
       option_of_yojson
         (value_for_key external_model_endpoint_data_blob_map_of_yojson
            "externalModelEndpointDataBlobs")
         _list path;
     event_variables = value_for_key event_variable_map_of_yojson "eventVariables" _list path;
     event_timestamp = value_for_key utc_timestamp_is_o8601_of_yojson "eventTimestamp" _list path;
     entities = value_for_key list_of_entities_of_yojson "entities" _list path;
     event_type_name = value_for_key string__of_yojson "eventTypeName" _list path;
     event_id = value_for_key string__of_yojson "eventId" _list path;
     detector_version_id =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "detectorVersionId")
         _list path;
     detector_id = value_for_key string__of_yojson "detectorId" _list path;
   }
    : get_event_prediction_request)

let evaluated_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matched = option_of_yojson (value_for_key boolean__of_yojson "matched") _list path;
     evaluated = option_of_yojson (value_for_key boolean__of_yojson "evaluated") _list path;
     outcomes = option_of_yojson (value_for_key list_of_strings_of_yojson "outcomes") _list path;
     expression_with_values =
       option_of_yojson (value_for_key sensitive_string_of_yojson "expressionWithValues") _list path;
     expression =
       option_of_yojson (value_for_key sensitive_string_of_yojson "expression") _list path;
     rule_version =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "ruleVersion")
         _list path;
     rule_id = option_of_yojson (value_for_key identifier_of_yojson "ruleId") _list path;
   }
    : evaluated_rule)

let evaluated_rule_list_of_yojson tree path = list_of_yojson evaluated_rule_of_yojson tree path

let get_event_prediction_metadata_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prediction_timestamp =
       option_of_yojson (value_for_key time_of_yojson "predictionTimestamp") _list path;
     evaluated_external_models =
       option_of_yojson
         (value_for_key list_of_evaluated_external_models_of_yojson "evaluatedExternalModels")
         _list path;
     evaluated_model_versions =
       option_of_yojson
         (value_for_key list_of_evaluated_model_versions_of_yojson "evaluatedModelVersions")
         _list path;
     outcomes = option_of_yojson (value_for_key list_of_strings_of_yojson "outcomes") _list path;
     rule_execution_mode =
       option_of_yojson (value_for_key rule_execution_mode_of_yojson "ruleExecutionMode") _list path;
     rules = option_of_yojson (value_for_key evaluated_rule_list_of_yojson "rules") _list path;
     event_variables =
       option_of_yojson
         (value_for_key list_of_event_variable_summaries_of_yojson "eventVariables")
         _list path;
     detector_version_status =
       option_of_yojson (value_for_key string__of_yojson "detectorVersionStatus") _list path;
     detector_version_id =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "detectorVersionId")
         _list path;
     detector_id = option_of_yojson (value_for_key identifier_of_yojson "detectorId") _list path;
     event_timestamp = option_of_yojson (value_for_key time_of_yojson "eventTimestamp") _list path;
     entity_type = option_of_yojson (value_for_key string__of_yojson "entityType") _list path;
     entity_id = option_of_yojson (value_for_key string__of_yojson "entityId") _list path;
     event_type_name =
       option_of_yojson (value_for_key identifier_of_yojson "eventTypeName") _list path;
     event_id = option_of_yojson (value_for_key identifier_of_yojson "eventId") _list path;
   }
    : get_event_prediction_metadata_result)

let get_event_prediction_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prediction_timestamp = value_for_key time_of_yojson "predictionTimestamp" _list path;
     detector_version_id =
       value_for_key whole_number_version_string_of_yojson "detectorVersionId" _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
     event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path;
     event_id = value_for_key identifier_of_yojson "eventId" _list path;
   }
    : get_event_prediction_metadata_request)

let get_entity_types_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     entity_types =
       option_of_yojson (value_for_key entity_type_list_of_yojson "entityTypes") _list path;
   }
    : get_entity_types_result)

let get_entity_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key entity_types_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     name = option_of_yojson (value_for_key identifier_of_yojson "name") _list path;
   }
    : get_entity_types_request)

let detector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     event_type_name =
       option_of_yojson (value_for_key identifier_of_yojson "eventTypeName") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     detector_id = option_of_yojson (value_for_key identifier_of_yojson "detectorId") _list path;
   }
    : detector)

let detector_list_of_yojson tree path = list_of_yojson detector_of_yojson tree path

let get_detectors_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     detectors = option_of_yojson (value_for_key detector_list_of_yojson "detectors") _list path;
   }
    : get_detectors_result)

let detectors_max_results_of_yojson = int_of_yojson

let get_detectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key detectors_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     detector_id = option_of_yojson (value_for_key identifier_of_yojson "detectorId") _list path;
   }
    : get_detectors_request)

let get_detector_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     rule_execution_mode =
       option_of_yojson (value_for_key rule_execution_mode_of_yojson "ruleExecutionMode") _list path;
     created_time = option_of_yojson (value_for_key time_of_yojson "createdTime") _list path;
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     status = option_of_yojson (value_for_key detector_version_status_of_yojson "status") _list path;
     rules = option_of_yojson (value_for_key rule_list_of_yojson "rules") _list path;
     model_versions =
       option_of_yojson (value_for_key list_of_model_versions_of_yojson "modelVersions") _list path;
     external_model_endpoints =
       option_of_yojson
         (value_for_key list_of_strings_of_yojson "externalModelEndpoints")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     detector_version_id =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "detectorVersionId")
         _list path;
     detector_id = option_of_yojson (value_for_key identifier_of_yojson "detectorId") _list path;
   }
    : get_detector_version_result)

let get_detector_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detector_version_id =
       value_for_key whole_number_version_string_of_yojson "detectorVersionId" _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : get_detector_version_request)

let async_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETE" -> COMPLETE
    | `String "CANCELED" -> CANCELED
    | `String "CANCEL_IN_PROGRESS" -> CANCEL_IN_PROGRESS
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "IN_PROGRESS_INITIALIZING" -> IN_PROGRESS_INITIALIZING
    | `String value -> raise (deserialize_unknown_enum_value_error path "AsyncJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AsyncJobStatus")
     : async_job_status)
    : async_job_status)

let get_delete_events_by_event_type_status_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events_deletion_status =
       option_of_yojson (value_for_key async_job_status_of_yojson "eventsDeletionStatus") _list path;
     event_type_name =
       option_of_yojson (value_for_key identifier_of_yojson "eventTypeName") _list path;
   }
    : get_delete_events_by_event_type_status_result)

let get_delete_events_by_event_type_status_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path }
    : get_delete_events_by_event_type_status_request)

let batch_prediction_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_records_count =
       option_of_yojson (value_for_key integer_of_yojson "totalRecordsCount") _list path;
     processed_records_count =
       option_of_yojson (value_for_key integer_of_yojson "processedRecordsCount") _list path;
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     iam_role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "iamRoleArn") _list path;
     detector_version =
       option_of_yojson (value_for_key float_version_string_of_yojson "detectorVersion") _list path;
     detector_name = option_of_yojson (value_for_key identifier_of_yojson "detectorName") _list path;
     event_type_name =
       option_of_yojson (value_for_key identifier_of_yojson "eventTypeName") _list path;
     output_path =
       option_of_yojson (value_for_key s3_bucket_location_of_yojson "outputPath") _list path;
     input_path =
       option_of_yojson (value_for_key s3_bucket_location_of_yojson "inputPath") _list path;
     last_heartbeat_time =
       option_of_yojson (value_for_key time_of_yojson "lastHeartbeatTime") _list path;
     completion_time = option_of_yojson (value_for_key time_of_yojson "completionTime") _list path;
     start_time = option_of_yojson (value_for_key time_of_yojson "startTime") _list path;
     failure_reason = option_of_yojson (value_for_key string__of_yojson "failureReason") _list path;
     status = option_of_yojson (value_for_key async_job_status_of_yojson "status") _list path;
     job_id = option_of_yojson (value_for_key identifier_of_yojson "jobId") _list path;
   }
    : batch_prediction)

let batch_prediction_list_of_yojson tree path = list_of_yojson batch_prediction_of_yojson tree path

let get_batch_prediction_jobs_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     batch_predictions =
       option_of_yojson
         (value_for_key batch_prediction_list_of_yojson "batchPredictions")
         _list path;
   }
    : get_batch_prediction_jobs_result)

let get_batch_prediction_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key batch_predictions_max_page_size_of_yojson "maxResults")
         _list path;
     job_id = option_of_yojson (value_for_key identifier_of_yojson "jobId") _list path;
   }
    : get_batch_prediction_jobs_request)

let batch_import_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_records_count =
       option_of_yojson (value_for_key integer_of_yojson "totalRecordsCount") _list path;
     failed_records_count =
       option_of_yojson (value_for_key integer_of_yojson "failedRecordsCount") _list path;
     processed_records_count =
       option_of_yojson (value_for_key integer_of_yojson "processedRecordsCount") _list path;
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     iam_role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "iamRoleArn") _list path;
     event_type_name =
       option_of_yojson (value_for_key identifier_of_yojson "eventTypeName") _list path;
     output_path =
       option_of_yojson (value_for_key s3_bucket_location_of_yojson "outputPath") _list path;
     input_path =
       option_of_yojson (value_for_key s3_bucket_location_of_yojson "inputPath") _list path;
     completion_time = option_of_yojson (value_for_key time_of_yojson "completionTime") _list path;
     start_time = option_of_yojson (value_for_key time_of_yojson "startTime") _list path;
     failure_reason = option_of_yojson (value_for_key string__of_yojson "failureReason") _list path;
     status = option_of_yojson (value_for_key async_job_status_of_yojson "status") _list path;
     job_id = option_of_yojson (value_for_key identifier_of_yojson "jobId") _list path;
   }
    : batch_import)

let batch_import_list_of_yojson tree path = list_of_yojson batch_import_of_yojson tree path

let get_batch_import_jobs_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     batch_imports =
       option_of_yojson (value_for_key batch_import_list_of_yojson "batchImports") _list path;
   }
    : get_batch_import_jobs_result)

let get_batch_import_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key batch_imports_max_page_size_of_yojson "maxResults")
         _list path;
     job_id = option_of_yojson (value_for_key identifier_of_yojson "jobId") _list path;
   }
    : get_batch_import_jobs_request)

let detector_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key time_of_yojson "lastUpdatedTime") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     status = option_of_yojson (value_for_key detector_version_status_of_yojson "status") _list path;
     detector_version_id =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "detectorVersionId")
         _list path;
   }
    : detector_version_summary)

let detector_version_summary_list_of_yojson tree path =
  list_of_yojson detector_version_summary_of_yojson tree path

let detector_version_max_results_of_yojson = int_of_yojson

let describe_model_versions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     model_version_details =
       option_of_yojson
         (value_for_key model_version_detail_list_of_yojson "modelVersionDetails")
         _list path;
   }
    : describe_model_versions_result)

let describe_model_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key models_max_page_size_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     model_type = option_of_yojson (value_for_key model_type_enum_of_yojson "modelType") _list path;
     model_version_number =
       option_of_yojson
         (value_for_key float_version_string_of_yojson "modelVersionNumber")
         _list path;
     model_id = option_of_yojson (value_for_key model_identifier_of_yojson "modelId") _list path;
   }
    : describe_model_versions_request)

let describe_detector_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = option_of_yojson (value_for_key fraud_detector_arn_of_yojson "arn") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     detector_version_summaries =
       option_of_yojson
         (value_for_key detector_version_summary_list_of_yojson "detectorVersionSummaries")
         _list path;
     detector_id = option_of_yojson (value_for_key identifier_of_yojson "detectorId") _list path;
   }
    : describe_detector_result)

let describe_detector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key detector_version_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "nextToken") _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : describe_detector_request)

let delete_variable_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_variable_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key string__of_yojson "name" _list path } : delete_variable_request)

let delete_rule_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule = value_for_key rule_of_yojson "rule" _list path } : delete_rule_request)

let delete_outcome_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_outcome_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key identifier_of_yojson "name" _list path } : delete_outcome_request)

let delete_model_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_model_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_version_number =
       value_for_key float_version_string_of_yojson "modelVersionNumber" _list path;
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : delete_model_version_request)

let delete_model_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : delete_model_request)

let delete_list_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key no_dash_identifier_of_yojson "name" _list path } : delete_list_request)

let delete_label_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_label_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key identifier_of_yojson "name" _list path } : delete_label_request)

let delete_external_model_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_external_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_endpoint =
       value_for_key sage_maker_endpoint_identifier_of_yojson "modelEndpoint" _list path;
   }
    : delete_external_model_request)

let delete_events_by_event_type_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     events_deletion_status =
       option_of_yojson (value_for_key string__of_yojson "eventsDeletionStatus") _list path;
     event_type_name =
       option_of_yojson (value_for_key identifier_of_yojson "eventTypeName") _list path;
   }
    : delete_events_by_event_type_result)

let delete_events_by_event_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path }
    : delete_events_by_event_type_request)

let delete_event_type_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_event_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key identifier_of_yojson "name" _list path } : delete_event_type_request)

let delete_event_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_audit_history_of_yojson = bool_of_yojson

let delete_event_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete_audit_history =
       option_of_yojson
         (value_for_key delete_audit_history_of_yojson "deleteAuditHistory")
         _list path;
     event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path;
     event_id = value_for_key identifier_of_yojson "eventId" _list path;
   }
    : delete_event_request)

let delete_entity_type_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_entity_type_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key identifier_of_yojson "name" _list path } : delete_entity_type_request)

let delete_detector_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_detector_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     detector_version_id =
       value_for_key whole_number_version_string_of_yojson "detectorVersionId" _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : delete_detector_version_request)

let delete_detector_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_detector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ detector_id = value_for_key identifier_of_yojson "detectorId" _list path }
    : delete_detector_request)

let delete_batch_prediction_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_batch_prediction_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key identifier_of_yojson "jobId" _list path }
    : delete_batch_prediction_job_request)

let delete_batch_import_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_batch_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key identifier_of_yojson "jobId" _list path }
    : delete_batch_import_job_request)

let create_variable_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_variable_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     variable_type = option_of_yojson (value_for_key string__of_yojson "variableType") _list path;
     description = option_of_yojson (value_for_key string__of_yojson "description") _list path;
     default_value = value_for_key string__of_yojson "defaultValue" _list path;
     data_source = value_for_key data_source_of_yojson "dataSource" _list path;
     data_type = value_for_key data_type_of_yojson "dataType" _list path;
     name = value_for_key string__of_yojson "name" _list path;
   }
    : create_variable_request)

let create_rule_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule = option_of_yojson (value_for_key rule_of_yojson "rule") _list path }
    : create_rule_result)

let create_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     outcomes = value_for_key non_empty_list_of_strings_of_yojson "outcomes" _list path;
     language = value_for_key language_of_yojson "language" _list path;
     expression = value_for_key rule_expression_of_yojson "expression" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
     rule_id = value_for_key identifier_of_yojson "ruleId" _list path;
   }
    : create_rule_request)

let create_model_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key string__of_yojson "status") _list path;
     model_version_number =
       option_of_yojson
         (value_for_key float_version_string_of_yojson "modelVersionNumber")
         _list path;
     model_type = option_of_yojson (value_for_key model_type_enum_of_yojson "modelType") _list path;
     model_id = option_of_yojson (value_for_key model_identifier_of_yojson "modelId") _list path;
   }
    : create_model_version_result)

let create_model_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     ingested_events_detail =
       option_of_yojson
         (value_for_key ingested_events_detail_of_yojson "ingestedEventsDetail")
         _list path;
     external_events_detail =
       option_of_yojson
         (value_for_key external_events_detail_of_yojson "externalEventsDetail")
         _list path;
     training_data_schema =
       value_for_key training_data_schema_of_yojson "trainingDataSchema" _list path;
     training_data_source =
       value_for_key training_data_source_enum_of_yojson "trainingDataSource" _list path;
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : create_model_version_request)

let create_model_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     event_type_name = value_for_key string__of_yojson "eventTypeName" _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     model_type = value_for_key model_type_enum_of_yojson "modelType" _list path;
     model_id = value_for_key model_identifier_of_yojson "modelId" _list path;
   }
    : create_model_request)

let create_list_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_list_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     variable_type =
       option_of_yojson (value_for_key variable_type_of_yojson "variableType") _list path;
     elements = option_of_yojson (value_for_key elements_list_of_yojson "elements") _list path;
     name = value_for_key no_dash_identifier_of_yojson "name" _list path;
   }
    : create_list_request)

let create_detector_version_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key detector_version_status_of_yojson "status") _list path;
     detector_version_id =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "detectorVersionId")
         _list path;
     detector_id = option_of_yojson (value_for_key identifier_of_yojson "detectorId") _list path;
   }
    : create_detector_version_result)

let create_detector_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     rule_execution_mode =
       option_of_yojson (value_for_key rule_execution_mode_of_yojson "ruleExecutionMode") _list path;
     model_versions =
       option_of_yojson (value_for_key list_of_model_versions_of_yojson "modelVersions") _list path;
     rules = value_for_key rule_list_of_yojson "rules" _list path;
     external_model_endpoints =
       option_of_yojson
         (value_for_key list_of_strings_of_yojson "externalModelEndpoints")
         _list path;
     description = option_of_yojson (value_for_key description_of_yojson "description") _list path;
     detector_id = value_for_key identifier_of_yojson "detectorId" _list path;
   }
    : create_detector_version_request)

let create_batch_prediction_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_batch_prediction_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     iam_role_arn = value_for_key iam_role_arn_of_yojson "iamRoleArn" _list path;
     detector_version =
       option_of_yojson
         (value_for_key whole_number_version_string_of_yojson "detectorVersion")
         _list path;
     detector_name = value_for_key identifier_of_yojson "detectorName" _list path;
     event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path;
     output_path = value_for_key s3_bucket_location_of_yojson "outputPath" _list path;
     input_path = value_for_key s3_bucket_location_of_yojson "inputPath" _list path;
     job_id = value_for_key identifier_of_yojson "jobId" _list path;
   }
    : create_batch_prediction_job_request)

let create_batch_import_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let create_batch_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     iam_role_arn = value_for_key iam_role_arn_of_yojson "iamRoleArn" _list path;
     event_type_name = value_for_key identifier_of_yojson "eventTypeName" _list path;
     output_path = value_for_key s3_bucket_location_of_yojson "outputPath" _list path;
     input_path = value_for_key s3_bucket_location_of_yojson "inputPath" _list path;
     job_id = value_for_key identifier_of_yojson "jobId" _list path;
   }
    : create_batch_import_job_request)

let cancel_batch_prediction_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_batch_prediction_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key identifier_of_yojson "jobId" _list path }
    : cancel_batch_prediction_job_request)

let cancel_batch_import_job_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_batch_import_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key identifier_of_yojson "jobId" _list path }
    : cancel_batch_import_job_request)

let batch_get_variable_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     code = option_of_yojson (value_for_key integer2_of_yojson "code") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : batch_get_variable_error)

let batch_get_variable_error_list_of_yojson tree path =
  list_of_yojson batch_get_variable_error_of_yojson tree path

let batch_get_variable_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson (value_for_key batch_get_variable_error_list_of_yojson "errors") _list path;
     variables = option_of_yojson (value_for_key variable_list_of_yojson "variables") _list path;
   }
    : batch_get_variable_result)

let batch_get_variable_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ names = value_for_key name_list_of_yojson "names" _list path } : batch_get_variable_request)

let batch_create_variable_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
     code = option_of_yojson (value_for_key integer2_of_yojson "code") _list path;
     name = option_of_yojson (value_for_key string__of_yojson "name") _list path;
   }
    : batch_create_variable_error)

let batch_create_variable_error_list_of_yojson tree path =
  list_of_yojson batch_create_variable_error_of_yojson tree path

let batch_create_variable_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_create_variable_error_list_of_yojson "errors")
         _list path;
   }
    : batch_create_variable_result)

let batch_create_variable_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     variable_entries = value_for_key variable_entry_list_of_yojson "variableEntries" _list path;
   }
    : batch_create_variable_request)
