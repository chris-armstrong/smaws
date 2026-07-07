open Smaws_Lib.Json.SerializeHelpers
open Types

let whole_number_version_string_to_yojson = string_to_yojson
let variable_value_to_yojson = string_to_yojson
let variable_type_to_yojson = string_to_yojson
let variable_name_to_yojson = string_to_yojson
let utc_timestamp_is_o8601_to_yojson = string_to_yojson
let time_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let string__to_yojson = string_to_yojson
let sensitive_string_to_yojson = string_to_yojson
let sage_maker_endpoint_identifier_to_yojson = string_to_yojson
let s3_bucket_location_to_yojson = string_to_yojson
let rule_expression_to_yojson = string_to_yojson
let no_dash_identifier_to_yojson = string_to_yojson
let next_token_to_yojson = string_to_yojson
let models_max_page_size_to_yojson = int_to_yojson
let model_identifier_to_yojson = string_to_yojson

let model_type_enum_to_yojson (x : model_type_enum) =
  match x with
  | ACCOUNT_TAKEOVER_INSIGHTS -> `String "ACCOUNT_TAKEOVER_INSIGHTS"
  | TRANSACTION_FRAUD_INSIGHTS -> `String "TRANSACTION_FRAUD_INSIGHTS"
  | ONLINE_FRAUD_INSIGHTS -> `String "ONLINE_FRAUD_INSIGHTS"

let float_version_string_to_yojson = string_to_yojson

let training_data_source_enum_to_yojson (x : training_data_source_enum) =
  match x with
  | INGESTED_EVENTS -> `String "INGESTED_EVENTS"
  | EXTERNAL_EVENTS -> `String "EXTERNAL_EVENTS"

let list_of_strings_to_yojson tree = list_to_yojson string__to_yojson tree
let label_mapper_to_yojson tree = map_to_yojson string__to_yojson list_of_strings_to_yojson tree

let unlabeled_events_treatment_to_yojson (x : unlabeled_events_treatment) =
  match x with
  | AUTO -> `String "AUTO"
  | LEGIT -> `String "LEGIT"
  | FRAUD -> `String "FRAUD"
  | IGNORE -> `String "IGNORE"

let label_schema_to_yojson (x : label_schema) =
  assoc_to_yojson
    [
      ( "unlabeledEventsTreatment",
        option_to_yojson unlabeled_events_treatment_to_yojson x.unlabeled_events_treatment );
      ("labelMapper", option_to_yojson label_mapper_to_yojson x.label_mapper);
    ]

let training_data_schema_to_yojson (x : training_data_schema) =
  assoc_to_yojson
    [
      ("labelSchema", option_to_yojson label_schema_to_yojson x.label_schema);
      ("modelVariables", Some (list_of_strings_to_yojson x.model_variables));
    ]

let iam_role_arn_to_yojson = string_to_yojson

let external_events_detail_to_yojson (x : external_events_detail) =
  assoc_to_yojson
    [
      ("dataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
      ("dataLocation", Some (s3_bucket_location_to_yojson x.data_location));
    ]

let ingested_events_time_window_to_yojson (x : ingested_events_time_window) =
  assoc_to_yojson
    [
      ("endTime", Some (time_to_yojson x.end_time));
      ("startTime", Some (time_to_yojson x.start_time));
    ]

let ingested_events_detail_to_yojson (x : ingested_events_detail) =
  assoc_to_yojson
    [
      ( "ingestedEventsTimeWindow",
        Some (ingested_events_time_window_to_yojson x.ingested_events_time_window) );
    ]

let file_validation_message_to_yojson (x : file_validation_message) =
  assoc_to_yojson
    [
      ("type", option_to_yojson string__to_yojson x.type_);
      ("content", option_to_yojson string__to_yojson x.content);
      ("title", option_to_yojson string__to_yojson x.title);
    ]

let file_validation_message_list_to_yojson tree =
  list_to_yojson file_validation_message_to_yojson tree

let field_validation_message_to_yojson (x : field_validation_message) =
  assoc_to_yojson
    [
      ("type", option_to_yojson string__to_yojson x.type_);
      ("content", option_to_yojson string__to_yojson x.content);
      ("title", option_to_yojson string__to_yojson x.title);
      ("identifier", option_to_yojson string__to_yojson x.identifier);
      ("fieldName", option_to_yojson string__to_yojson x.field_name);
    ]

let field_validation_message_list_to_yojson tree =
  list_to_yojson field_validation_message_to_yojson tree

let data_validation_metrics_to_yojson (x : data_validation_metrics) =
  assoc_to_yojson
    [
      ( "fieldLevelMessages",
        option_to_yojson field_validation_message_list_to_yojson x.field_level_messages );
      ( "fileLevelMessages",
        option_to_yojson file_validation_message_list_to_yojson x.file_level_messages );
    ]

let float__to_yojson = float_to_yojson

let metric_data_point_to_yojson (x : metric_data_point) =
  assoc_to_yojson
    [
      ("threshold", option_to_yojson float__to_yojson x.threshold);
      ("tpr", option_to_yojson float__to_yojson x.tpr);
      ("precision", option_to_yojson float__to_yojson x.precision);
      ("fpr", option_to_yojson float__to_yojson x.fpr);
    ]

let metric_data_points_list_to_yojson tree = list_to_yojson metric_data_point_to_yojson tree

let training_metrics_to_yojson (x : training_metrics) =
  assoc_to_yojson
    [
      ("metricDataPoints", option_to_yojson metric_data_points_list_to_yojson x.metric_data_points);
      ("auc", option_to_yojson float__to_yojson x.auc);
    ]

let log_odds_metric_to_yojson (x : log_odds_metric) =
  assoc_to_yojson
    [
      ("variableImportance", Some (float__to_yojson x.variable_importance));
      ("variableType", Some (string__to_yojson x.variable_type));
      ("variableName", Some (string__to_yojson x.variable_name));
    ]

let list_of_log_odds_metrics_to_yojson tree = list_to_yojson log_odds_metric_to_yojson tree

let variable_importance_metrics_to_yojson (x : variable_importance_metrics) =
  assoc_to_yojson
    [ ("logOddsMetrics", option_to_yojson list_of_log_odds_metrics_to_yojson x.log_odds_metrics) ]

let training_result_to_yojson (x : training_result) =
  assoc_to_yojson
    [
      ( "variableImportanceMetrics",
        option_to_yojson variable_importance_metrics_to_yojson x.variable_importance_metrics );
      ("trainingMetrics", option_to_yojson training_metrics_to_yojson x.training_metrics);
      ( "dataValidationMetrics",
        option_to_yojson data_validation_metrics_to_yojson x.data_validation_metrics );
    ]

let fraud_detector_arn_to_yojson = string_to_yojson

let ofi_metric_data_point_to_yojson (x : ofi_metric_data_point) =
  assoc_to_yojson
    [
      ("threshold", option_to_yojson float__to_yojson x.threshold);
      ("tpr", option_to_yojson float__to_yojson x.tpr);
      ("precision", option_to_yojson float__to_yojson x.precision);
      ("fpr", option_to_yojson float__to_yojson x.fpr);
    ]

let ofi_metric_data_points_list_to_yojson tree = list_to_yojson ofi_metric_data_point_to_yojson tree

let uncertainty_range_to_yojson (x : uncertainty_range) =
  assoc_to_yojson
    [
      ("upperBoundValue", Some (float__to_yojson x.upper_bound_value));
      ("lowerBoundValue", Some (float__to_yojson x.lower_bound_value));
    ]

let ofi_model_performance_to_yojson (x : ofi_model_performance) =
  assoc_to_yojson
    [
      ("uncertaintyRange", option_to_yojson uncertainty_range_to_yojson x.uncertainty_range);
      ("auc", option_to_yojson float__to_yojson x.auc);
    ]

let ofi_training_metrics_value_to_yojson (x : ofi_training_metrics_value) =
  assoc_to_yojson
    [
      ("modelPerformance", option_to_yojson ofi_model_performance_to_yojson x.model_performance);
      ( "metricDataPoints",
        option_to_yojson ofi_metric_data_points_list_to_yojson x.metric_data_points );
    ]

let tfi_metric_data_point_to_yojson (x : tfi_metric_data_point) =
  assoc_to_yojson
    [
      ("threshold", option_to_yojson float__to_yojson x.threshold);
      ("tpr", option_to_yojson float__to_yojson x.tpr);
      ("precision", option_to_yojson float__to_yojson x.precision);
      ("fpr", option_to_yojson float__to_yojson x.fpr);
    ]

let tfi_metric_data_points_list_to_yojson tree = list_to_yojson tfi_metric_data_point_to_yojson tree

let tfi_model_performance_to_yojson (x : tfi_model_performance) =
  assoc_to_yojson
    [
      ("uncertaintyRange", option_to_yojson uncertainty_range_to_yojson x.uncertainty_range);
      ("auc", option_to_yojson float__to_yojson x.auc);
    ]

let tfi_training_metrics_value_to_yojson (x : tfi_training_metrics_value) =
  assoc_to_yojson
    [
      ("modelPerformance", option_to_yojson tfi_model_performance_to_yojson x.model_performance);
      ( "metricDataPoints",
        option_to_yojson tfi_metric_data_points_list_to_yojson x.metric_data_points );
    ]

let ati_metric_data_point_to_yojson (x : ati_metric_data_point) =
  assoc_to_yojson
    [
      ("atodr", option_to_yojson float__to_yojson x.atodr);
      ("threshold", option_to_yojson float__to_yojson x.threshold);
      ("adr", option_to_yojson float__to_yojson x.adr);
      ("cr", option_to_yojson float__to_yojson x.cr);
    ]

let ati_metric_data_points_list_to_yojson tree = list_to_yojson ati_metric_data_point_to_yojson tree

let ati_model_performance_to_yojson (x : ati_model_performance) =
  assoc_to_yojson [ ("asi", option_to_yojson float__to_yojson x.asi) ]

let ati_training_metrics_value_to_yojson (x : ati_training_metrics_value) =
  assoc_to_yojson
    [
      ("modelPerformance", option_to_yojson ati_model_performance_to_yojson x.model_performance);
      ( "metricDataPoints",
        option_to_yojson ati_metric_data_points_list_to_yojson x.metric_data_points );
    ]

let training_metrics_v2_to_yojson (x : training_metrics_v2) =
  assoc_to_yojson
    [
      ("ati", option_to_yojson ati_training_metrics_value_to_yojson x.ati);
      ("tfi", option_to_yojson tfi_training_metrics_value_to_yojson x.tfi);
      ("ofi", option_to_yojson ofi_training_metrics_value_to_yojson x.ofi);
    ]

let aggregated_log_odds_metric_to_yojson (x : aggregated_log_odds_metric) =
  assoc_to_yojson
    [
      ("aggregatedVariablesImportance", Some (float__to_yojson x.aggregated_variables_importance));
      ("variableNames", Some (list_of_strings_to_yojson x.variable_names));
    ]

let list_of_aggregated_log_odds_metrics_to_yojson tree =
  list_to_yojson aggregated_log_odds_metric_to_yojson tree

let aggregated_variables_importance_metrics_to_yojson (x : aggregated_variables_importance_metrics)
    =
  assoc_to_yojson
    [
      ( "logOddsMetrics",
        option_to_yojson list_of_aggregated_log_odds_metrics_to_yojson x.log_odds_metrics );
    ]

let training_result_v2_to_yojson (x : training_result_v2) =
  assoc_to_yojson
    [
      ( "aggregatedVariablesImportanceMetrics",
        option_to_yojson aggregated_variables_importance_metrics_to_yojson
          x.aggregated_variables_importance_metrics );
      ( "variableImportanceMetrics",
        option_to_yojson variable_importance_metrics_to_yojson x.variable_importance_metrics );
      ("trainingMetricsV2", option_to_yojson training_metrics_v2_to_yojson x.training_metrics_v2);
      ( "dataValidationMetrics",
        option_to_yojson data_validation_metrics_to_yojson x.data_validation_metrics );
    ]

let model_version_detail_to_yojson (x : model_version_detail) =
  assoc_to_yojson
    [
      ("trainingResultV2", option_to_yojson training_result_v2_to_yojson x.training_result_v2);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("trainingResult", option_to_yojson training_result_to_yojson x.training_result);
      ( "ingestedEventsDetail",
        option_to_yojson ingested_events_detail_to_yojson x.ingested_events_detail );
      ( "externalEventsDetail",
        option_to_yojson external_events_detail_to_yojson x.external_events_detail );
      ("trainingDataSchema", option_to_yojson training_data_schema_to_yojson x.training_data_schema);
      ( "trainingDataSource",
        option_to_yojson training_data_source_enum_to_yojson x.training_data_source );
      ("status", option_to_yojson string__to_yojson x.status);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
    ]

let model_version_detail_list_to_yojson tree = list_to_yojson model_version_detail_to_yojson tree
let description_to_yojson = string_to_yojson

let model_to_yojson (x : model) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("eventTypeName", option_to_yojson string__to_yojson x.event_type_name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
    ]

let model_list_to_yojson tree = list_to_yojson model_to_yojson tree
let model_input_template_to_yojson = string_to_yojson

let variable_impact_explanation_to_yojson (x : variable_impact_explanation) =
  assoc_to_yojson
    [
      ("logOddsImpact", option_to_yojson float__to_yojson x.log_odds_impact);
      ("relativeImpact", option_to_yojson string__to_yojson x.relative_impact);
      ("eventVariableName", option_to_yojson string__to_yojson x.event_variable_name);
    ]

let list_of_variable_impact_explanations_to_yojson tree =
  list_to_yojson variable_impact_explanation_to_yojson tree

let entity_restricted_string_to_yojson = string_to_yojson

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("entityId", Some (entity_restricted_string_to_yojson x.entity_id));
      ("entityType", Some (string__to_yojson x.entity_type));
    ]

let list_of_entities_to_yojson tree = list_to_yojson entity_to_yojson tree
let labels_max_results_to_yojson = int_to_yojson

let label_to_yojson (x : label) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let label_list_to_yojson tree = list_to_yojson label_to_yojson tree
let identifier_to_yojson = string_to_yojson
let filter_string_to_yojson = string_to_yojson
let event_types_max_results_to_yojson = int_to_yojson
let non_empty_list_of_strings_to_yojson tree = list_to_yojson string__to_yojson tree

let event_ingestion_to_yojson (x : event_ingestion) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let long_to_yojson = long_to_yojson

let ingested_event_statistics_to_yojson (x : ingested_event_statistics) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("mostRecentEvent", option_to_yojson time_to_yojson x.most_recent_event);
      ("leastRecentEvent", option_to_yojson time_to_yojson x.least_recent_event);
      ("eventDataSizeInBytes", option_to_yojson long_to_yojson x.event_data_size_in_bytes);
      ("numberOfEvents", option_to_yojson long_to_yojson x.number_of_events);
    ]

let boolean__to_yojson = bool_to_yojson

let event_orchestration_to_yojson (x : event_orchestration) =
  assoc_to_yojson [ ("eventBridgeEnabled", Some (boolean__to_yojson x.event_bridge_enabled)) ]

let event_type_to_yojson (x : event_type) =
  assoc_to_yojson
    [
      ("eventOrchestration", option_to_yojson event_orchestration_to_yojson x.event_orchestration);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ( "ingestedEventStatistics",
        option_to_yojson ingested_event_statistics_to_yojson x.ingested_event_statistics );
      ("eventIngestion", option_to_yojson event_ingestion_to_yojson x.event_ingestion);
      ("entityTypes", option_to_yojson non_empty_list_of_strings_to_yojson x.entity_types);
      ("labels", option_to_yojson list_of_strings_to_yojson x.labels);
      ("eventVariables", option_to_yojson list_of_strings_to_yojson x.event_variables);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let event_type_list_to_yojson tree = list_to_yojson event_type_to_yojson tree
let entity_types_max_results_to_yojson = int_to_yojson

let entity_type_to_yojson (x : entity_type) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let entity_type_list_to_yojson tree = list_to_yojson entity_type_to_yojson tree
let content_type_to_yojson = string_to_yojson
let blob_to_yojson = blob_to_yojson
let batch_predictions_max_page_size_to_yojson = int_to_yojson
let batch_imports_max_page_size_to_yojson = int_to_yojson
let attribute_value_to_yojson = string_to_yojson
let attribute_key_to_yojson = string_to_yojson
let variables_max_results_to_yojson = int_to_yojson

let data_type_to_yojson (x : data_type) =
  match x with
  | DATETIME -> `String "DATETIME"
  | BOOLEAN -> `String "BOOLEAN"
  | FLOAT -> `String "FLOAT"
  | INTEGER -> `String "INTEGER"
  | STRING -> `String "STRING"

let data_source_to_yojson (x : data_source) =
  match x with
  | EXTERNAL_MODEL_SCORE -> `String "EXTERNAL_MODEL_SCORE"
  | MODEL_SCORE -> `String "MODEL_SCORE"
  | EVENT -> `String "EVENT"

let variable_to_yojson (x : variable) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("variableType", option_to_yojson string__to_yojson x.variable_type);
      ("description", option_to_yojson string__to_yojson x.description);
      ("defaultValue", option_to_yojson string__to_yojson x.default_value);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("dataType", option_to_yojson data_type_to_yojson x.data_type);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let variable_list_to_yojson tree = list_to_yojson variable_to_yojson tree

let variable_entry_to_yojson (x : variable_entry) =
  assoc_to_yojson
    [
      ("variableType", option_to_yojson string__to_yojson x.variable_type);
      ("description", option_to_yojson string__to_yojson x.description);
      ("defaultValue", option_to_yojson string__to_yojson x.default_value);
      ("dataSource", option_to_yojson string__to_yojson x.data_source);
      ("dataType", option_to_yojson string__to_yojson x.data_type);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let variable_entry_list_to_yojson tree = list_to_yojson variable_entry_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let use_event_variables_to_yojson = bool_to_yojson
let update_variable_result_to_yojson = unit_to_yojson

let update_variable_request_to_yojson (x : update_variable_request) =
  assoc_to_yojson
    [
      ("variableType", option_to_yojson string__to_yojson x.variable_type);
      ("description", option_to_yojson string__to_yojson x.description);
      ("defaultValue", option_to_yojson string__to_yojson x.default_value);
      ("name", Some (string__to_yojson x.name));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("ruleVersion", Some (whole_number_version_string_to_yojson x.rule_version));
      ("ruleId", Some (identifier_to_yojson x.rule_id));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let update_rule_version_result_to_yojson (x : update_rule_version_result) =
  assoc_to_yojson [ ("rule", option_to_yojson rule_to_yojson x.rule) ]

let language_to_yojson (x : language) = match x with DETECTORPL -> `String "DETECTORPL"

let update_rule_version_request_to_yojson (x : update_rule_version_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("outcomes", Some (non_empty_list_of_strings_to_yojson x.outcomes));
      ("language", Some (language_to_yojson x.language));
      ("expression", Some (rule_expression_to_yojson x.expression));
      ("description", option_to_yojson description_to_yojson x.description);
      ("rule", Some (rule_to_yojson x.rule));
    ]

let update_rule_metadata_result_to_yojson = unit_to_yojson

let update_rule_metadata_request_to_yojson (x : update_rule_metadata_request) =
  assoc_to_yojson
    [
      ("description", Some (description_to_yojson x.description));
      ("rule", Some (rule_to_yojson x.rule));
    ]

let update_model_version_status_result_to_yojson = unit_to_yojson

let model_version_status_to_yojson (x : model_version_status) =
  match x with
  | TRAINING_CANCELLED -> `String "TRAINING_CANCELLED"
  | INACTIVE -> `String "INACTIVE"
  | ACTIVE -> `String "ACTIVE"

let update_model_version_status_request_to_yojson (x : update_model_version_status_request) =
  assoc_to_yojson
    [
      ("status", Some (model_version_status_to_yojson x.status));
      ("modelVersionNumber", Some (float_version_string_to_yojson x.model_version_number));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let update_model_version_result_to_yojson (x : update_model_version_result) =
  assoc_to_yojson
    [
      ("status", option_to_yojson string__to_yojson x.status);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
    ]

let update_model_version_request_to_yojson (x : update_model_version_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ingestedEventsDetail",
        option_to_yojson ingested_events_detail_to_yojson x.ingested_events_detail );
      ( "externalEventsDetail",
        option_to_yojson external_events_detail_to_yojson x.external_events_detail );
      ("majorVersionNumber", Some (whole_number_version_string_to_yojson x.major_version_number));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let update_model_result_to_yojson = unit_to_yojson

let update_model_request_to_yojson (x : update_model_request) =
  assoc_to_yojson
    [
      ("description", option_to_yojson description_to_yojson x.description);
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let update_list_result_to_yojson = unit_to_yojson
let elements_to_yojson = string_to_yojson
let elements_list_to_yojson tree = list_to_yojson elements_to_yojson tree

let list_update_mode_to_yojson (x : list_update_mode) =
  match x with
  | REMOVE -> `String "REMOVE"
  | APPEND -> `String "APPEND"
  | REPLACE -> `String "REPLACE"

let update_list_request_to_yojson (x : update_list_request) =
  assoc_to_yojson
    [
      ("variableType", option_to_yojson variable_type_to_yojson x.variable_type);
      ("updateMode", option_to_yojson list_update_mode_to_yojson x.update_mode);
      ("description", option_to_yojson description_to_yojson x.description);
      ("elements", option_to_yojson elements_list_to_yojson x.elements);
      ("name", Some (no_dash_identifier_to_yojson x.name));
    ]

let update_event_label_result_to_yojson = unit_to_yojson

let update_event_label_request_to_yojson (x : update_event_label_request) =
  assoc_to_yojson
    [
      ("labelTimestamp", Some (utc_timestamp_is_o8601_to_yojson x.label_timestamp));
      ("assignedLabel", Some (identifier_to_yojson x.assigned_label));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("eventId", Some (identifier_to_yojson x.event_id));
    ]

let update_detector_version_status_result_to_yojson = unit_to_yojson

let detector_version_status_to_yojson (x : detector_version_status) =
  match x with
  | INACTIVE -> `String "INACTIVE"
  | ACTIVE -> `String "ACTIVE"
  | DRAFT -> `String "DRAFT"

let update_detector_version_status_request_to_yojson (x : update_detector_version_status_request) =
  assoc_to_yojson
    [
      ("status", Some (detector_version_status_to_yojson x.status));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let update_detector_version_result_to_yojson = unit_to_yojson
let rule_list_to_yojson tree = list_to_yojson rule_to_yojson tree

let model_version_to_yojson (x : model_version) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("modelVersionNumber", Some (float_version_string_to_yojson x.model_version_number));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let list_of_model_versions_to_yojson tree = list_to_yojson model_version_to_yojson tree

let rule_execution_mode_to_yojson (x : rule_execution_mode) =
  match x with FIRST_MATCHED -> `String "FIRST_MATCHED" | ALL_MATCHED -> `String "ALL_MATCHED"

let update_detector_version_request_to_yojson (x : update_detector_version_request) =
  assoc_to_yojson
    [
      ("ruleExecutionMode", option_to_yojson rule_execution_mode_to_yojson x.rule_execution_mode);
      ("modelVersions", option_to_yojson list_of_model_versions_to_yojson x.model_versions);
      ("description", option_to_yojson description_to_yojson x.description);
      ("rules", Some (rule_list_to_yojson x.rules));
      ("externalModelEndpoints", Some (list_of_strings_to_yojson x.external_model_endpoints));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let update_detector_version_metadata_result_to_yojson = unit_to_yojson

let update_detector_version_metadata_request_to_yojson
    (x : update_detector_version_metadata_request) =
  assoc_to_yojson
    [
      ("description", Some (description_to_yojson x.description));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let untag_resource_result_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceARN", Some (fraud_detector_arn_to_yojson x.resource_ar_n));
    ]

let tags_max_results_to_yojson = int_to_yojson
let tag_resource_result_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("resourceARN", Some (fraud_detector_arn_to_yojson x.resource_ar_n));
    ]

let send_event_result_to_yojson = unit_to_yojson

let event_variable_map_to_yojson tree =
  map_to_yojson variable_name_to_yojson variable_value_to_yojson tree

let send_event_request_to_yojson (x : send_event_request) =
  assoc_to_yojson
    [
      ("entities", Some (list_of_entities_to_yojson x.entities));
      ("labelTimestamp", option_to_yojson utc_timestamp_is_o8601_to_yojson x.label_timestamp);
      ("assignedLabel", option_to_yojson identifier_to_yojson x.assigned_label);
      ("eventVariables", Some (event_variable_map_to_yojson x.event_variables));
      ("eventTimestamp", Some (utc_timestamp_is_o8601_to_yojson x.event_timestamp));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("eventId", Some (identifier_to_yojson x.event_id));
    ]

let rules_max_results_to_yojson = int_to_yojson

let rule_result_to_yojson (x : rule_result) =
  assoc_to_yojson
    [
      ("outcomes", option_to_yojson list_of_strings_to_yojson x.outcomes);
      ("ruleId", option_to_yojson string__to_yojson x.rule_id);
    ]

let rule_detail_to_yojson (x : rule_detail) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("outcomes", option_to_yojson non_empty_list_of_strings_to_yojson x.outcomes);
      ("language", option_to_yojson language_to_yojson x.language);
      ("expression", option_to_yojson rule_expression_to_yojson x.expression);
      ("ruleVersion", option_to_yojson whole_number_version_string_to_yojson x.rule_version);
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ("description", option_to_yojson description_to_yojson x.description);
      ("ruleId", option_to_yojson identifier_to_yojson x.rule_id);
    ]

let rule_detail_list_to_yojson tree = list_to_yojson rule_detail_to_yojson tree

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let put_outcome_result_to_yojson = unit_to_yojson

let put_outcome_request_to_yojson (x : put_outcome_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (identifier_to_yojson x.name));
    ]

let put_label_result_to_yojson = unit_to_yojson

let put_label_request_to_yojson (x : put_label_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (identifier_to_yojson x.name));
    ]

let put_kms_encryption_key_result_to_yojson = unit_to_yojson
let kms_encryption_key_arn_to_yojson = string_to_yojson

let put_kms_encryption_key_request_to_yojson (x : put_kms_encryption_key_request) =
  assoc_to_yojson
    [ ("kmsEncryptionKeyArn", Some (kms_encryption_key_arn_to_yojson x.kms_encryption_key_arn)) ]

let put_external_model_result_to_yojson = unit_to_yojson
let model_source_to_yojson (x : model_source) = match x with SAGEMAKER -> `String "SAGEMAKER"

let model_input_data_format_to_yojson (x : model_input_data_format) =
  match x with JSON -> `String "APPLICATION_JSON" | CSV -> `String "TEXT_CSV"

let model_input_configuration_to_yojson (x : model_input_configuration) =
  assoc_to_yojson
    [
      ("csvInputTemplate", option_to_yojson model_input_template_to_yojson x.csv_input_template);
      ("jsonInputTemplate", option_to_yojson model_input_template_to_yojson x.json_input_template);
      ("useEventVariables", Some (use_event_variables_to_yojson x.use_event_variables));
      ("format", option_to_yojson model_input_data_format_to_yojson x.format);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
    ]

let model_output_data_format_to_yojson (x : model_output_data_format) =
  match x with JSONLINES -> `String "APPLICATION_JSONLINES" | CSV -> `String "TEXT_CSV"

let json_key_to_variable_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let csv_index_to_variable_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let model_output_configuration_to_yojson (x : model_output_configuration) =
  assoc_to_yojson
    [
      ( "csvIndexToVariableMap",
        option_to_yojson csv_index_to_variable_map_to_yojson x.csv_index_to_variable_map );
      ( "jsonKeyToVariableMap",
        option_to_yojson json_key_to_variable_map_to_yojson x.json_key_to_variable_map );
      ("format", Some (model_output_data_format_to_yojson x.format));
    ]

let model_endpoint_status_to_yojson (x : model_endpoint_status) =
  match x with DISSOCIATED -> `String "DISSOCIATED" | ASSOCIATED -> `String "ASSOCIATED"

let put_external_model_request_to_yojson (x : put_external_model_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("modelEndpointStatus", Some (model_endpoint_status_to_yojson x.model_endpoint_status));
      ("outputConfiguration", Some (model_output_configuration_to_yojson x.output_configuration));
      ("inputConfiguration", Some (model_input_configuration_to_yojson x.input_configuration));
      ("invokeModelEndpointRoleArn", Some (string__to_yojson x.invoke_model_endpoint_role_arn));
      ("modelSource", Some (model_source_to_yojson x.model_source));
      ("modelEndpoint", Some (sage_maker_endpoint_identifier_to_yojson x.model_endpoint));
    ]

let put_event_type_result_to_yojson = unit_to_yojson

let put_event_type_request_to_yojson (x : put_event_type_request) =
  assoc_to_yojson
    [
      ("eventOrchestration", option_to_yojson event_orchestration_to_yojson x.event_orchestration);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("eventIngestion", option_to_yojson event_ingestion_to_yojson x.event_ingestion);
      ("entityTypes", Some (non_empty_list_of_strings_to_yojson x.entity_types));
      ("labels", option_to_yojson list_of_strings_to_yojson x.labels);
      ("eventVariables", Some (non_empty_list_of_strings_to_yojson x.event_variables));
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (identifier_to_yojson x.name));
    ]

let put_entity_type_result_to_yojson = unit_to_yojson

let put_entity_type_request_to_yojson (x : put_entity_type_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (identifier_to_yojson x.name));
    ]

let put_detector_result_to_yojson = unit_to_yojson

let put_detector_request_to_yojson (x : put_detector_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let prediction_time_range_to_yojson (x : prediction_time_range) =
  assoc_to_yojson
    [
      ("endTime", Some (time_to_yojson x.end_time));
      ("startTime", Some (time_to_yojson x.start_time));
    ]

let aggregated_variables_impact_explanation_to_yojson (x : aggregated_variables_impact_explanation)
    =
  assoc_to_yojson
    [
      ("logOddsImpact", option_to_yojson float__to_yojson x.log_odds_impact);
      ("relativeImpact", option_to_yojson string__to_yojson x.relative_impact);
      ("eventVariableNames", option_to_yojson list_of_strings_to_yojson x.event_variable_names);
    ]

let list_of_aggregated_variables_impact_explanations_to_yojson tree =
  list_to_yojson aggregated_variables_impact_explanation_to_yojson tree

let prediction_explanations_to_yojson (x : prediction_explanations) =
  assoc_to_yojson
    [
      ( "aggregatedVariablesImpactExplanations",
        option_to_yojson list_of_aggregated_variables_impact_explanations_to_yojson
          x.aggregated_variables_impact_explanations );
      ( "variableImpactExplanations",
        option_to_yojson list_of_variable_impact_explanations_to_yojson
          x.variable_impact_explanations );
    ]

let outcomes_max_results_to_yojson = int_to_yojson

let outcome_to_yojson (x : outcome) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", option_to_yojson identifier_to_yojson x.name);
    ]

let outcome_list_to_yojson tree = list_to_yojson outcome_to_yojson tree
let name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let model_version_evaluation_to_yojson (x : model_version_evaluation) =
  assoc_to_yojson
    [
      ( "predictionExplanations",
        option_to_yojson prediction_explanations_to_yojson x.prediction_explanations );
      ("evaluationScore", option_to_yojson string__to_yojson x.evaluation_score);
      ("outputVariableName", option_to_yojson string__to_yojson x.output_variable_name);
    ]

let model_prediction_map_to_yojson tree = map_to_yojson string__to_yojson float__to_yojson tree

let model_scores_to_yojson (x : model_scores) =
  assoc_to_yojson
    [
      ("scores", option_to_yojson model_prediction_map_to_yojson x.scores);
      ("modelVersion", option_to_yojson model_version_to_yojson x.model_version);
    ]

let model_endpoint_data_blob_to_yojson (x : model_endpoint_data_blob) =
  assoc_to_yojson
    [
      ("contentType", option_to_yojson content_type_to_yojson x.content_type);
      ("byteBuffer", option_to_yojson blob_to_yojson x.byte_buffer);
    ]

let map_of_strings_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let lists_metadata_max_results_to_yojson = int_to_yojson
let lists_elements_max_results_to_yojson = int_to_yojson

let list_tags_for_resource_result_to_yojson (x : list_tags_for_resource_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson tags_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("resourceARN", Some (fraud_detector_arn_to_yojson x.resource_ar_n));
    ]

let list_of_rule_results_to_yojson tree = list_to_yojson rule_result_to_yojson tree

let list_of_model_version_evaluations_to_yojson tree =
  list_to_yojson model_version_evaluation_to_yojson tree

let list_of_model_scores_to_yojson tree = list_to_yojson model_scores_to_yojson tree

let external_model_summary_to_yojson (x : external_model_summary) =
  assoc_to_yojson
    [
      ("modelSource", option_to_yojson model_source_to_yojson x.model_source);
      ("modelEndpoint", option_to_yojson string__to_yojson x.model_endpoint);
    ]

let external_model_prediction_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let external_model_outputs_to_yojson (x : external_model_outputs) =
  assoc_to_yojson
    [
      ("outputs", option_to_yojson external_model_prediction_map_to_yojson x.outputs);
      ("externalModel", option_to_yojson external_model_summary_to_yojson x.external_model);
    ]

let list_of_external_model_outputs_to_yojson tree =
  list_to_yojson external_model_outputs_to_yojson tree

let event_variable_summary_to_yojson (x : event_variable_summary) =
  assoc_to_yojson
    [
      ("source", option_to_yojson sensitive_string_to_yojson x.source);
      ("value", option_to_yojson sensitive_string_to_yojson x.value);
      ("name", option_to_yojson sensitive_string_to_yojson x.name);
    ]

let list_of_event_variable_summaries_to_yojson tree =
  list_to_yojson event_variable_summary_to_yojson tree

let event_prediction_summary_to_yojson (x : event_prediction_summary) =
  assoc_to_yojson
    [
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ("predictionTimestamp", option_to_yojson time_to_yojson x.prediction_timestamp);
      ("eventTimestamp", option_to_yojson time_to_yojson x.event_timestamp);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("eventId", option_to_yojson identifier_to_yojson x.event_id);
    ]

let list_of_event_prediction_summaries_to_yojson tree =
  list_to_yojson event_prediction_summary_to_yojson tree

let evaluated_model_version_to_yojson (x : evaluated_model_version) =
  assoc_to_yojson
    [
      ("evaluations", option_to_yojson list_of_model_version_evaluations_to_yojson x.evaluations);
      ("modelType", option_to_yojson string__to_yojson x.model_type);
      ("modelVersion", option_to_yojson string__to_yojson x.model_version);
      ("modelId", option_to_yojson string__to_yojson x.model_id);
    ]

let list_of_evaluated_model_versions_to_yojson tree =
  list_to_yojson evaluated_model_version_to_yojson tree

let evaluated_external_model_to_yojson (x : evaluated_external_model) =
  assoc_to_yojson
    [
      ("outputVariables", option_to_yojson map_of_strings_to_yojson x.output_variables);
      ("inputVariables", option_to_yojson map_of_strings_to_yojson x.input_variables);
      ("useEventVariables", option_to_yojson boolean__to_yojson x.use_event_variables);
      ("modelEndpoint", option_to_yojson string__to_yojson x.model_endpoint);
    ]

let list_of_evaluated_external_models_to_yojson tree =
  list_to_yojson evaluated_external_model_to_yojson tree

let list_event_predictions_result_to_yojson (x : list_event_predictions_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ( "eventPredictionSummaries",
        option_to_yojson list_of_event_prediction_summaries_to_yojson x.event_prediction_summaries
      );
    ]

let filter_condition_to_yojson (x : filter_condition) =
  assoc_to_yojson [ ("value", option_to_yojson filter_string_to_yojson x.value) ]

let event_predictions_max_results_to_yojson = int_to_yojson

let list_event_predictions_request_to_yojson (x : list_event_predictions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson event_predictions_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ( "predictionTimeRange",
        option_to_yojson prediction_time_range_to_yojson x.prediction_time_range );
      ("detectorVersionId", option_to_yojson filter_condition_to_yojson x.detector_version_id);
      ("detectorId", option_to_yojson filter_condition_to_yojson x.detector_id);
      ("eventType", option_to_yojson filter_condition_to_yojson x.event_type);
      ("eventId", option_to_yojson filter_condition_to_yojson x.event_id);
    ]

let kms_key_to_yojson (x : kms_key) =
  assoc_to_yojson
    [
      ( "kmsEncryptionKeyArn",
        option_to_yojson kms_encryption_key_arn_to_yojson x.kms_encryption_key_arn );
    ]

let integer2_to_yojson = int_to_yojson
let integer_to_yojson = int_to_yojson

let get_variables_result_to_yojson (x : get_variables_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("variables", option_to_yojson variable_list_to_yojson x.variables);
    ]

let get_variables_request_to_yojson (x : get_variables_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson variables_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let get_rules_result_to_yojson (x : get_rules_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("ruleDetails", option_to_yojson rule_detail_list_to_yojson x.rule_details);
    ]

let get_rules_request_to_yojson (x : get_rules_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson rules_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("ruleVersion", option_to_yojson whole_number_version_string_to_yojson x.rule_version);
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("ruleId", option_to_yojson identifier_to_yojson x.rule_id);
    ]

let get_outcomes_result_to_yojson (x : get_outcomes_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("outcomes", option_to_yojson outcome_list_to_yojson x.outcomes);
    ]

let get_outcomes_request_to_yojson (x : get_outcomes_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson outcomes_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("name", option_to_yojson identifier_to_yojson x.name);
    ]

let get_models_result_to_yojson (x : get_models_result) =
  assoc_to_yojson
    [
      ("models", option_to_yojson model_list_to_yojson x.models);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let get_models_request_to_yojson (x : get_models_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson models_max_page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
    ]

let get_model_version_result_to_yojson (x : get_model_version_result) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("status", option_to_yojson string__to_yojson x.status);
      ( "ingestedEventsDetail",
        option_to_yojson ingested_events_detail_to_yojson x.ingested_events_detail );
      ( "externalEventsDetail",
        option_to_yojson external_events_detail_to_yojson x.external_events_detail );
      ("trainingDataSchema", option_to_yojson training_data_schema_to_yojson x.training_data_schema);
      ( "trainingDataSource",
        option_to_yojson training_data_source_enum_to_yojson x.training_data_source );
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
    ]

let get_model_version_request_to_yojson (x : get_model_version_request) =
  assoc_to_yojson
    [
      ("modelVersionNumber", Some (float_version_string_to_yojson x.model_version_number));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let allow_deny_list_to_yojson (x : allow_deny_list) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("updatedTime", option_to_yojson time_to_yojson x.updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("variableType", option_to_yojson variable_type_to_yojson x.variable_type);
      ("description", option_to_yojson description_to_yojson x.description);
      ("name", Some (no_dash_identifier_to_yojson x.name));
    ]

let allow_deny_lists_to_yojson tree = list_to_yojson allow_deny_list_to_yojson tree

let get_lists_metadata_result_to_yojson (x : get_lists_metadata_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("lists", option_to_yojson allow_deny_lists_to_yojson x.lists);
    ]

let get_lists_metadata_request_to_yojson (x : get_lists_metadata_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson lists_metadata_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("name", option_to_yojson no_dash_identifier_to_yojson x.name);
    ]

let get_list_elements_result_to_yojson (x : get_list_elements_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("elements", option_to_yojson elements_list_to_yojson x.elements);
    ]

let get_list_elements_request_to_yojson (x : get_list_elements_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson lists_elements_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("name", Some (no_dash_identifier_to_yojson x.name));
    ]

let get_labels_result_to_yojson (x : get_labels_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("labels", option_to_yojson label_list_to_yojson x.labels);
    ]

let get_labels_request_to_yojson (x : get_labels_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson labels_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("name", option_to_yojson identifier_to_yojson x.name);
    ]

let get_kms_encryption_key_result_to_yojson (x : get_kms_encryption_key_result) =
  assoc_to_yojson [ ("kmsKey", option_to_yojson kms_key_to_yojson x.kms_key) ]

let external_model_to_yojson (x : external_model) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ( "modelEndpointStatus",
        option_to_yojson model_endpoint_status_to_yojson x.model_endpoint_status );
      ( "outputConfiguration",
        option_to_yojson model_output_configuration_to_yojson x.output_configuration );
      ( "inputConfiguration",
        option_to_yojson model_input_configuration_to_yojson x.input_configuration );
      ( "invokeModelEndpointRoleArn",
        option_to_yojson string__to_yojson x.invoke_model_endpoint_role_arn );
      ("modelSource", option_to_yojson model_source_to_yojson x.model_source);
      ("modelEndpoint", option_to_yojson string__to_yojson x.model_endpoint);
    ]

let external_model_list_to_yojson tree = list_to_yojson external_model_to_yojson tree

let get_external_models_result_to_yojson (x : get_external_models_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("externalModels", option_to_yojson external_model_list_to_yojson x.external_models);
    ]

let external_models_max_results_to_yojson = int_to_yojson

let get_external_models_request_to_yojson (x : get_external_models_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson external_models_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("modelEndpoint", option_to_yojson string__to_yojson x.model_endpoint);
    ]

let get_event_types_result_to_yojson (x : get_event_types_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("eventTypes", option_to_yojson event_type_list_to_yojson x.event_types);
    ]

let get_event_types_request_to_yojson (x : get_event_types_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson event_types_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("name", option_to_yojson identifier_to_yojson x.name);
    ]

let event_attribute_map_to_yojson tree =
  map_to_yojson attribute_key_to_yojson attribute_value_to_yojson tree

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("entities", option_to_yojson list_of_entities_to_yojson x.entities);
      ("labelTimestamp", option_to_yojson string__to_yojson x.label_timestamp);
      ("currentLabel", option_to_yojson string__to_yojson x.current_label);
      ("eventVariables", option_to_yojson event_attribute_map_to_yojson x.event_variables);
      ("eventTimestamp", option_to_yojson string__to_yojson x.event_timestamp);
      ("eventTypeName", option_to_yojson string__to_yojson x.event_type_name);
      ("eventId", option_to_yojson string__to_yojson x.event_id);
    ]

let get_event_result_to_yojson (x : get_event_result) =
  assoc_to_yojson [ ("event", option_to_yojson event_to_yojson x.event) ]

let get_event_request_to_yojson (x : get_event_request) =
  assoc_to_yojson
    [
      ("eventTypeName", Some (string__to_yojson x.event_type_name));
      ("eventId", Some (string__to_yojson x.event_id));
    ]

let get_event_prediction_result_to_yojson (x : get_event_prediction_result) =
  assoc_to_yojson
    [
      ( "externalModelOutputs",
        option_to_yojson list_of_external_model_outputs_to_yojson x.external_model_outputs );
      ("ruleResults", option_to_yojson list_of_rule_results_to_yojson x.rule_results);
      ("modelScores", option_to_yojson list_of_model_scores_to_yojson x.model_scores);
    ]

let external_model_endpoint_data_blob_map_to_yojson tree =
  map_to_yojson sage_maker_endpoint_identifier_to_yojson model_endpoint_data_blob_to_yojson tree

let get_event_prediction_request_to_yojson (x : get_event_prediction_request) =
  assoc_to_yojson
    [
      ( "externalModelEndpointDataBlobs",
        option_to_yojson external_model_endpoint_data_blob_map_to_yojson
          x.external_model_endpoint_data_blobs );
      ("eventVariables", Some (event_variable_map_to_yojson x.event_variables));
      ("eventTimestamp", Some (utc_timestamp_is_o8601_to_yojson x.event_timestamp));
      ("entities", Some (list_of_entities_to_yojson x.entities));
      ("eventTypeName", Some (string__to_yojson x.event_type_name));
      ("eventId", Some (string__to_yojson x.event_id));
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("detectorId", Some (string__to_yojson x.detector_id));
    ]

let evaluated_rule_to_yojson (x : evaluated_rule) =
  assoc_to_yojson
    [
      ("matched", option_to_yojson boolean__to_yojson x.matched);
      ("evaluated", option_to_yojson boolean__to_yojson x.evaluated);
      ("outcomes", option_to_yojson list_of_strings_to_yojson x.outcomes);
      ("expressionWithValues", option_to_yojson sensitive_string_to_yojson x.expression_with_values);
      ("expression", option_to_yojson sensitive_string_to_yojson x.expression);
      ("ruleVersion", option_to_yojson whole_number_version_string_to_yojson x.rule_version);
      ("ruleId", option_to_yojson identifier_to_yojson x.rule_id);
    ]

let evaluated_rule_list_to_yojson tree = list_to_yojson evaluated_rule_to_yojson tree

let get_event_prediction_metadata_result_to_yojson (x : get_event_prediction_metadata_result) =
  assoc_to_yojson
    [
      ("predictionTimestamp", option_to_yojson time_to_yojson x.prediction_timestamp);
      ( "evaluatedExternalModels",
        option_to_yojson list_of_evaluated_external_models_to_yojson x.evaluated_external_models );
      ( "evaluatedModelVersions",
        option_to_yojson list_of_evaluated_model_versions_to_yojson x.evaluated_model_versions );
      ("outcomes", option_to_yojson list_of_strings_to_yojson x.outcomes);
      ("ruleExecutionMode", option_to_yojson rule_execution_mode_to_yojson x.rule_execution_mode);
      ("rules", option_to_yojson evaluated_rule_list_to_yojson x.rules);
      ( "eventVariables",
        option_to_yojson list_of_event_variable_summaries_to_yojson x.event_variables );
      ("detectorVersionStatus", option_to_yojson string__to_yojson x.detector_version_status);
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ("eventTimestamp", option_to_yojson time_to_yojson x.event_timestamp);
      ("entityType", option_to_yojson string__to_yojson x.entity_type);
      ("entityId", option_to_yojson string__to_yojson x.entity_id);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("eventId", option_to_yojson identifier_to_yojson x.event_id);
    ]

let get_event_prediction_metadata_request_to_yojson (x : get_event_prediction_metadata_request) =
  assoc_to_yojson
    [
      ("predictionTimestamp", Some (time_to_yojson x.prediction_timestamp));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("eventId", Some (identifier_to_yojson x.event_id));
    ]

let get_entity_types_result_to_yojson (x : get_entity_types_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("entityTypes", option_to_yojson entity_type_list_to_yojson x.entity_types);
    ]

let get_entity_types_request_to_yojson (x : get_entity_types_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson entity_types_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("name", option_to_yojson identifier_to_yojson x.name);
    ]

let detector_to_yojson (x : detector) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
    ]

let detector_list_to_yojson tree = list_to_yojson detector_to_yojson tree

let get_detectors_result_to_yojson (x : get_detectors_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("detectors", option_to_yojson detector_list_to_yojson x.detectors);
    ]

let detectors_max_results_to_yojson = int_to_yojson

let get_detectors_request_to_yojson (x : get_detectors_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson detectors_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
    ]

let get_detector_version_result_to_yojson (x : get_detector_version_result) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("ruleExecutionMode", option_to_yojson rule_execution_mode_to_yojson x.rule_execution_mode);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("status", option_to_yojson detector_version_status_to_yojson x.status);
      ("rules", option_to_yojson rule_list_to_yojson x.rules);
      ("modelVersions", option_to_yojson list_of_model_versions_to_yojson x.model_versions);
      ( "externalModelEndpoints",
        option_to_yojson list_of_strings_to_yojson x.external_model_endpoints );
      ("description", option_to_yojson description_to_yojson x.description);
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
    ]

let get_detector_version_request_to_yojson (x : get_detector_version_request) =
  assoc_to_yojson
    [
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let async_job_status_to_yojson (x : async_job_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"
  | CANCELED -> `String "CANCELED"
  | CANCEL_IN_PROGRESS -> `String "CANCEL_IN_PROGRESS"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | IN_PROGRESS_INITIALIZING -> `String "IN_PROGRESS_INITIALIZING"

let get_delete_events_by_event_type_status_result_to_yojson
    (x : get_delete_events_by_event_type_status_result) =
  assoc_to_yojson
    [
      ("eventsDeletionStatus", option_to_yojson async_job_status_to_yojson x.events_deletion_status);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
    ]

let get_delete_events_by_event_type_status_request_to_yojson
    (x : get_delete_events_by_event_type_status_request) =
  assoc_to_yojson [ ("eventTypeName", Some (identifier_to_yojson x.event_type_name)) ]

let batch_prediction_to_yojson (x : batch_prediction) =
  assoc_to_yojson
    [
      ("totalRecordsCount", option_to_yojson integer_to_yojson x.total_records_count);
      ("processedRecordsCount", option_to_yojson integer_to_yojson x.processed_records_count);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("iamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
      ("detectorVersion", option_to_yojson float_version_string_to_yojson x.detector_version);
      ("detectorName", option_to_yojson identifier_to_yojson x.detector_name);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("outputPath", option_to_yojson s3_bucket_location_to_yojson x.output_path);
      ("inputPath", option_to_yojson s3_bucket_location_to_yojson x.input_path);
      ("lastHeartbeatTime", option_to_yojson time_to_yojson x.last_heartbeat_time);
      ("completionTime", option_to_yojson time_to_yojson x.completion_time);
      ("startTime", option_to_yojson time_to_yojson x.start_time);
      ("failureReason", option_to_yojson string__to_yojson x.failure_reason);
      ("status", option_to_yojson async_job_status_to_yojson x.status);
      ("jobId", option_to_yojson identifier_to_yojson x.job_id);
    ]

let batch_prediction_list_to_yojson tree = list_to_yojson batch_prediction_to_yojson tree

let get_batch_prediction_jobs_result_to_yojson (x : get_batch_prediction_jobs_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("batchPredictions", option_to_yojson batch_prediction_list_to_yojson x.batch_predictions);
    ]

let get_batch_prediction_jobs_request_to_yojson (x : get_batch_prediction_jobs_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson batch_predictions_max_page_size_to_yojson x.max_results);
      ("jobId", option_to_yojson identifier_to_yojson x.job_id);
    ]

let batch_import_to_yojson (x : batch_import) =
  assoc_to_yojson
    [
      ("totalRecordsCount", option_to_yojson integer_to_yojson x.total_records_count);
      ("failedRecordsCount", option_to_yojson integer_to_yojson x.failed_records_count);
      ("processedRecordsCount", option_to_yojson integer_to_yojson x.processed_records_count);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("iamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("outputPath", option_to_yojson s3_bucket_location_to_yojson x.output_path);
      ("inputPath", option_to_yojson s3_bucket_location_to_yojson x.input_path);
      ("completionTime", option_to_yojson time_to_yojson x.completion_time);
      ("startTime", option_to_yojson time_to_yojson x.start_time);
      ("failureReason", option_to_yojson string__to_yojson x.failure_reason);
      ("status", option_to_yojson async_job_status_to_yojson x.status);
      ("jobId", option_to_yojson identifier_to_yojson x.job_id);
    ]

let batch_import_list_to_yojson tree = list_to_yojson batch_import_to_yojson tree

let get_batch_import_jobs_result_to_yojson (x : get_batch_import_jobs_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("batchImports", option_to_yojson batch_import_list_to_yojson x.batch_imports);
    ]

let get_batch_import_jobs_request_to_yojson (x : get_batch_import_jobs_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson batch_imports_max_page_size_to_yojson x.max_results);
      ("jobId", option_to_yojson identifier_to_yojson x.job_id);
    ]

let detector_version_summary_to_yojson (x : detector_version_summary) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("description", option_to_yojson description_to_yojson x.description);
      ("status", option_to_yojson detector_version_status_to_yojson x.status);
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
    ]

let detector_version_summary_list_to_yojson tree =
  list_to_yojson detector_version_summary_to_yojson tree

let detector_version_max_results_to_yojson = int_to_yojson

let describe_model_versions_result_to_yojson (x : describe_model_versions_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ( "modelVersionDetails",
        option_to_yojson model_version_detail_list_to_yojson x.model_version_details );
    ]

let describe_model_versions_request_to_yojson (x : describe_model_versions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson models_max_page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
    ]

let describe_detector_result_to_yojson (x : describe_detector_result) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ( "detectorVersionSummaries",
        option_to_yojson detector_version_summary_list_to_yojson x.detector_version_summaries );
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
    ]

let describe_detector_request_to_yojson (x : describe_detector_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson detector_version_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let delete_variable_result_to_yojson = unit_to_yojson

let delete_variable_request_to_yojson (x : delete_variable_request) =
  assoc_to_yojson [ ("name", Some (string__to_yojson x.name)) ]

let delete_rule_result_to_yojson = unit_to_yojson

let delete_rule_request_to_yojson (x : delete_rule_request) =
  assoc_to_yojson [ ("rule", Some (rule_to_yojson x.rule)) ]

let delete_outcome_result_to_yojson = unit_to_yojson

let delete_outcome_request_to_yojson (x : delete_outcome_request) =
  assoc_to_yojson [ ("name", Some (identifier_to_yojson x.name)) ]

let delete_model_version_result_to_yojson = unit_to_yojson

let delete_model_version_request_to_yojson (x : delete_model_version_request) =
  assoc_to_yojson
    [
      ("modelVersionNumber", Some (float_version_string_to_yojson x.model_version_number));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let delete_model_result_to_yojson = unit_to_yojson

let delete_model_request_to_yojson (x : delete_model_request) =
  assoc_to_yojson
    [
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let delete_list_result_to_yojson = unit_to_yojson

let delete_list_request_to_yojson (x : delete_list_request) =
  assoc_to_yojson [ ("name", Some (no_dash_identifier_to_yojson x.name)) ]

let delete_label_result_to_yojson = unit_to_yojson

let delete_label_request_to_yojson (x : delete_label_request) =
  assoc_to_yojson [ ("name", Some (identifier_to_yojson x.name)) ]

let delete_external_model_result_to_yojson = unit_to_yojson

let delete_external_model_request_to_yojson (x : delete_external_model_request) =
  assoc_to_yojson
    [ ("modelEndpoint", Some (sage_maker_endpoint_identifier_to_yojson x.model_endpoint)) ]

let delete_events_by_event_type_result_to_yojson (x : delete_events_by_event_type_result) =
  assoc_to_yojson
    [
      ("eventsDeletionStatus", option_to_yojson string__to_yojson x.events_deletion_status);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
    ]

let delete_events_by_event_type_request_to_yojson (x : delete_events_by_event_type_request) =
  assoc_to_yojson [ ("eventTypeName", Some (identifier_to_yojson x.event_type_name)) ]

let delete_event_type_result_to_yojson = unit_to_yojson

let delete_event_type_request_to_yojson (x : delete_event_type_request) =
  assoc_to_yojson [ ("name", Some (identifier_to_yojson x.name)) ]

let delete_event_result_to_yojson = unit_to_yojson
let delete_audit_history_to_yojson = bool_to_yojson

let delete_event_request_to_yojson (x : delete_event_request) =
  assoc_to_yojson
    [
      ("deleteAuditHistory", option_to_yojson delete_audit_history_to_yojson x.delete_audit_history);
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("eventId", Some (identifier_to_yojson x.event_id));
    ]

let delete_entity_type_result_to_yojson = unit_to_yojson

let delete_entity_type_request_to_yojson (x : delete_entity_type_request) =
  assoc_to_yojson [ ("name", Some (identifier_to_yojson x.name)) ]

let delete_detector_version_result_to_yojson = unit_to_yojson

let delete_detector_version_request_to_yojson (x : delete_detector_version_request) =
  assoc_to_yojson
    [
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let delete_detector_result_to_yojson = unit_to_yojson

let delete_detector_request_to_yojson (x : delete_detector_request) =
  assoc_to_yojson [ ("detectorId", Some (identifier_to_yojson x.detector_id)) ]

let delete_batch_prediction_job_result_to_yojson = unit_to_yojson

let delete_batch_prediction_job_request_to_yojson (x : delete_batch_prediction_job_request) =
  assoc_to_yojson [ ("jobId", Some (identifier_to_yojson x.job_id)) ]

let delete_batch_import_job_result_to_yojson = unit_to_yojson

let delete_batch_import_job_request_to_yojson (x : delete_batch_import_job_request) =
  assoc_to_yojson [ ("jobId", Some (identifier_to_yojson x.job_id)) ]

let create_variable_result_to_yojson = unit_to_yojson

let create_variable_request_to_yojson (x : create_variable_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("variableType", option_to_yojson string__to_yojson x.variable_type);
      ("description", option_to_yojson string__to_yojson x.description);
      ("defaultValue", Some (string__to_yojson x.default_value));
      ("dataSource", Some (data_source_to_yojson x.data_source));
      ("dataType", Some (data_type_to_yojson x.data_type));
      ("name", Some (string__to_yojson x.name));
    ]

let create_rule_result_to_yojson (x : create_rule_result) =
  assoc_to_yojson [ ("rule", option_to_yojson rule_to_yojson x.rule) ]

let create_rule_request_to_yojson (x : create_rule_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("outcomes", Some (non_empty_list_of_strings_to_yojson x.outcomes));
      ("language", Some (language_to_yojson x.language));
      ("expression", Some (rule_expression_to_yojson x.expression));
      ("description", option_to_yojson description_to_yojson x.description);
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("ruleId", Some (identifier_to_yojson x.rule_id));
    ]

let create_model_version_result_to_yojson (x : create_model_version_result) =
  assoc_to_yojson
    [
      ("status", option_to_yojson string__to_yojson x.status);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
    ]

let create_model_version_request_to_yojson (x : create_model_version_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ingestedEventsDetail",
        option_to_yojson ingested_events_detail_to_yojson x.ingested_events_detail );
      ( "externalEventsDetail",
        option_to_yojson external_events_detail_to_yojson x.external_events_detail );
      ("trainingDataSchema", Some (training_data_schema_to_yojson x.training_data_schema));
      ("trainingDataSource", Some (training_data_source_enum_to_yojson x.training_data_source));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let create_model_result_to_yojson = unit_to_yojson

let create_model_request_to_yojson (x : create_model_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("eventTypeName", Some (string__to_yojson x.event_type_name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelId", Some (model_identifier_to_yojson x.model_id));
    ]

let create_list_result_to_yojson = unit_to_yojson

let create_list_request_to_yojson (x : create_list_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("description", option_to_yojson description_to_yojson x.description);
      ("variableType", option_to_yojson variable_type_to_yojson x.variable_type);
      ("elements", option_to_yojson elements_list_to_yojson x.elements);
      ("name", Some (no_dash_identifier_to_yojson x.name));
    ]

let create_detector_version_result_to_yojson (x : create_detector_version_result) =
  assoc_to_yojson
    [
      ("status", option_to_yojson detector_version_status_to_yojson x.status);
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
    ]

let create_detector_version_request_to_yojson (x : create_detector_version_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ruleExecutionMode", option_to_yojson rule_execution_mode_to_yojson x.rule_execution_mode);
      ("modelVersions", option_to_yojson list_of_model_versions_to_yojson x.model_versions);
      ("rules", Some (rule_list_to_yojson x.rules));
      ( "externalModelEndpoints",
        option_to_yojson list_of_strings_to_yojson x.external_model_endpoints );
      ("description", option_to_yojson description_to_yojson x.description);
      ("detectorId", Some (identifier_to_yojson x.detector_id));
    ]

let create_batch_prediction_job_result_to_yojson = unit_to_yojson

let create_batch_prediction_job_request_to_yojson (x : create_batch_prediction_job_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("iamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
      ("detectorVersion", option_to_yojson whole_number_version_string_to_yojson x.detector_version);
      ("detectorName", Some (identifier_to_yojson x.detector_name));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("outputPath", Some (s3_bucket_location_to_yojson x.output_path));
      ("inputPath", Some (s3_bucket_location_to_yojson x.input_path));
      ("jobId", Some (identifier_to_yojson x.job_id));
    ]

let create_batch_import_job_result_to_yojson = unit_to_yojson

let create_batch_import_job_request_to_yojson (x : create_batch_import_job_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("iamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("outputPath", Some (s3_bucket_location_to_yojson x.output_path));
      ("inputPath", Some (s3_bucket_location_to_yojson x.input_path));
      ("jobId", Some (identifier_to_yojson x.job_id));
    ]

let cancel_batch_prediction_job_result_to_yojson = unit_to_yojson

let cancel_batch_prediction_job_request_to_yojson (x : cancel_batch_prediction_job_request) =
  assoc_to_yojson [ ("jobId", Some (identifier_to_yojson x.job_id)) ]

let cancel_batch_import_job_result_to_yojson = unit_to_yojson

let cancel_batch_import_job_request_to_yojson (x : cancel_batch_import_job_request) =
  assoc_to_yojson [ ("jobId", Some (identifier_to_yojson x.job_id)) ]

let batch_get_variable_error_to_yojson (x : batch_get_variable_error) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("code", option_to_yojson integer2_to_yojson x.code);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let batch_get_variable_error_list_to_yojson tree =
  list_to_yojson batch_get_variable_error_to_yojson tree

let batch_get_variable_result_to_yojson (x : batch_get_variable_result) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson batch_get_variable_error_list_to_yojson x.errors);
      ("variables", option_to_yojson variable_list_to_yojson x.variables);
    ]

let batch_get_variable_request_to_yojson (x : batch_get_variable_request) =
  assoc_to_yojson [ ("names", Some (name_list_to_yojson x.names)) ]

let batch_create_variable_error_to_yojson (x : batch_create_variable_error) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("code", option_to_yojson integer2_to_yojson x.code);
      ("name", option_to_yojson string__to_yojson x.name);
    ]

let batch_create_variable_error_list_to_yojson tree =
  list_to_yojson batch_create_variable_error_to_yojson tree

let batch_create_variable_result_to_yojson (x : batch_create_variable_result) =
  assoc_to_yojson
    [ ("errors", option_to_yojson batch_create_variable_error_list_to_yojson x.errors) ]

let batch_create_variable_request_to_yojson (x : batch_create_variable_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("variableEntries", Some (variable_entry_list_to_yojson x.variable_entries));
    ]
