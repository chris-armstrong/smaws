open Smaws_Lib.Json.SerializeHelpers
open Types

let float__to_yojson = float_to_yojson

let ati_metric_data_point_to_yojson (x : ati_metric_data_point) =
  assoc_to_yojson
    [
      ("cr", option_to_yojson float__to_yojson x.cr);
      ("adr", option_to_yojson float__to_yojson x.adr);
      ("threshold", option_to_yojson float__to_yojson x.threshold);
      ("atodr", option_to_yojson float__to_yojson x.atodr);
    ]

let ati_metric_data_points_list_to_yojson tree = list_to_yojson ati_metric_data_point_to_yojson tree

let ati_model_performance_to_yojson (x : ati_model_performance) =
  assoc_to_yojson [ ("asi", option_to_yojson float__to_yojson x.asi) ]

let ati_training_metrics_value_to_yojson (x : ati_training_metrics_value) =
  assoc_to_yojson
    [
      ( "metricDataPoints",
        option_to_yojson ati_metric_data_points_list_to_yojson x.metric_data_points );
      ("modelPerformance", option_to_yojson ati_model_performance_to_yojson x.model_performance);
    ]

let string__to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", Some (string__to_yojson x.message)) ]

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

let update_variable_result_to_yojson = unit_to_yojson

let update_variable_request_to_yojson (x : update_variable_request) =
  assoc_to_yojson
    [
      ("name", Some (string__to_yojson x.name));
      ("defaultValue", option_to_yojson string__to_yojson x.default_value);
      ("description", option_to_yojson string__to_yojson x.description);
      ("variableType", option_to_yojson string__to_yojson x.variable_type);
    ]

let whole_number_version_string_to_yojson = string_to_yojson
let identifier_to_yojson = string_to_yojson

let rule_to_yojson (x : rule) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("ruleId", Some (identifier_to_yojson x.rule_id));
      ("ruleVersion", Some (whole_number_version_string_to_yojson x.rule_version));
    ]

let update_rule_version_result_to_yojson (x : update_rule_version_result) =
  assoc_to_yojson [ ("rule", option_to_yojson rule_to_yojson x.rule) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let non_empty_list_of_strings_to_yojson tree = list_to_yojson string__to_yojson tree
let language_to_yojson (x : language) = match x with DETECTORPL -> `String "DETECTORPL"
let rule_expression_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let update_rule_version_request_to_yojson (x : update_rule_version_request) =
  assoc_to_yojson
    [
      ("rule", Some (rule_to_yojson x.rule));
      ("description", option_to_yojson description_to_yojson x.description);
      ("expression", Some (rule_expression_to_yojson x.expression));
      ("language", Some (language_to_yojson x.language));
      ("outcomes", Some (non_empty_list_of_strings_to_yojson x.outcomes));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let update_rule_metadata_result_to_yojson = unit_to_yojson

let update_rule_metadata_request_to_yojson (x : update_rule_metadata_request) =
  assoc_to_yojson
    [
      ("rule", Some (rule_to_yojson x.rule));
      ("description", Some (description_to_yojson x.description));
    ]

let update_model_version_status_result_to_yojson = unit_to_yojson

let model_version_status_to_yojson (x : model_version_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | INACTIVE -> `String "INACTIVE"
  | TRAINING_CANCELLED -> `String "TRAINING_CANCELLED"

let float_version_string_to_yojson = string_to_yojson

let model_type_enum_to_yojson (x : model_type_enum) =
  match x with
  | ONLINE_FRAUD_INSIGHTS -> `String "ONLINE_FRAUD_INSIGHTS"
  | TRANSACTION_FRAUD_INSIGHTS -> `String "TRANSACTION_FRAUD_INSIGHTS"
  | ACCOUNT_TAKEOVER_INSIGHTS -> `String "ACCOUNT_TAKEOVER_INSIGHTS"

let model_identifier_to_yojson = string_to_yojson

let update_model_version_status_request_to_yojson (x : update_model_version_status_request) =
  assoc_to_yojson
    [
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelVersionNumber", Some (float_version_string_to_yojson x.model_version_number));
      ("status", Some (model_version_status_to_yojson x.status));
    ]

let update_model_version_result_to_yojson (x : update_model_version_result) =
  assoc_to_yojson
    [
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("status", option_to_yojson string__to_yojson x.status);
    ]

let time_to_yojson = string_to_yojson

let ingested_events_time_window_to_yojson (x : ingested_events_time_window) =
  assoc_to_yojson
    [
      ("startTime", Some (time_to_yojson x.start_time));
      ("endTime", Some (time_to_yojson x.end_time));
    ]

let ingested_events_detail_to_yojson (x : ingested_events_detail) =
  assoc_to_yojson
    [
      ( "ingestedEventsTimeWindow",
        Some (ingested_events_time_window_to_yojson x.ingested_events_time_window) );
    ]

let iam_role_arn_to_yojson = string_to_yojson
let s3_bucket_location_to_yojson = string_to_yojson

let external_events_detail_to_yojson (x : external_events_detail) =
  assoc_to_yojson
    [
      ("dataLocation", Some (s3_bucket_location_to_yojson x.data_location));
      ("dataAccessRoleArn", Some (iam_role_arn_to_yojson x.data_access_role_arn));
    ]

let update_model_version_request_to_yojson (x : update_model_version_request) =
  assoc_to_yojson
    [
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("majorVersionNumber", Some (whole_number_version_string_to_yojson x.major_version_number));
      ( "externalEventsDetail",
        option_to_yojson external_events_detail_to_yojson x.external_events_detail );
      ( "ingestedEventsDetail",
        option_to_yojson ingested_events_detail_to_yojson x.ingested_events_detail );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let update_model_result_to_yojson = unit_to_yojson

let update_model_request_to_yojson (x : update_model_request) =
  assoc_to_yojson
    [
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("description", option_to_yojson description_to_yojson x.description);
    ]

let update_list_result_to_yojson = unit_to_yojson
let variable_type_to_yojson = string_to_yojson

let list_update_mode_to_yojson (x : list_update_mode) =
  match x with
  | REPLACE -> `String "REPLACE"
  | APPEND -> `String "APPEND"
  | REMOVE -> `String "REMOVE"

let elements_to_yojson = string_to_yojson
let elements_list_to_yojson tree = list_to_yojson elements_to_yojson tree
let no_dash_identifier_to_yojson = string_to_yojson

let update_list_request_to_yojson (x : update_list_request) =
  assoc_to_yojson
    [
      ("name", Some (no_dash_identifier_to_yojson x.name));
      ("elements", option_to_yojson elements_list_to_yojson x.elements);
      ("description", option_to_yojson description_to_yojson x.description);
      ("updateMode", option_to_yojson list_update_mode_to_yojson x.update_mode);
      ("variableType", option_to_yojson variable_type_to_yojson x.variable_type);
    ]

let update_event_label_result_to_yojson = unit_to_yojson
let utc_timestamp_is_o8601_to_yojson = string_to_yojson

let update_event_label_request_to_yojson (x : update_event_label_request) =
  assoc_to_yojson
    [
      ("eventId", Some (identifier_to_yojson x.event_id));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("assignedLabel", Some (identifier_to_yojson x.assigned_label));
      ("labelTimestamp", Some (utc_timestamp_is_o8601_to_yojson x.label_timestamp));
    ]

let update_detector_version_status_result_to_yojson = unit_to_yojson

let detector_version_status_to_yojson (x : detector_version_status) =
  match x with
  | DRAFT -> `String "DRAFT"
  | ACTIVE -> `String "ACTIVE"
  | INACTIVE -> `String "INACTIVE"

let update_detector_version_status_request_to_yojson (x : update_detector_version_status_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("status", Some (detector_version_status_to_yojson x.status));
    ]

let update_detector_version_metadata_result_to_yojson = unit_to_yojson

let update_detector_version_metadata_request_to_yojson
    (x : update_detector_version_metadata_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("description", Some (description_to_yojson x.description));
    ]

let update_detector_version_result_to_yojson = unit_to_yojson

let rule_execution_mode_to_yojson (x : rule_execution_mode) =
  match x with ALL_MATCHED -> `String "ALL_MATCHED" | FIRST_MATCHED -> `String "FIRST_MATCHED"

let fraud_detector_arn_to_yojson = string_to_yojson

let model_version_to_yojson (x : model_version) =
  assoc_to_yojson
    [
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelVersionNumber", Some (float_version_string_to_yojson x.model_version_number));
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let list_of_model_versions_to_yojson tree = list_to_yojson model_version_to_yojson tree
let rule_list_to_yojson tree = list_to_yojson rule_to_yojson tree
let list_of_strings_to_yojson tree = list_to_yojson string__to_yojson tree

let update_detector_version_request_to_yojson (x : update_detector_version_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("externalModelEndpoints", Some (list_of_strings_to_yojson x.external_model_endpoints));
      ("rules", Some (rule_list_to_yojson x.rules));
      ("description", option_to_yojson description_to_yojson x.description);
      ("modelVersions", option_to_yojson list_of_model_versions_to_yojson x.model_versions);
      ("ruleExecutionMode", option_to_yojson rule_execution_mode_to_yojson x.rule_execution_mode);
    ]

let untag_resource_result_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceARN", Some (fraud_detector_arn_to_yojson x.resource_ar_n));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_result_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceARN", Some (fraud_detector_arn_to_yojson x.resource_ar_n));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let send_event_result_to_yojson = unit_to_yojson
let entity_restricted_string_to_yojson = string_to_yojson

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("entityType", Some (string__to_yojson x.entity_type));
      ("entityId", Some (entity_restricted_string_to_yojson x.entity_id));
    ]

let list_of_entities_to_yojson tree = list_to_yojson entity_to_yojson tree
let variable_value_to_yojson = string_to_yojson
let variable_name_to_yojson = string_to_yojson

let event_variable_map_to_yojson tree =
  map_to_yojson variable_name_to_yojson variable_value_to_yojson tree

let send_event_request_to_yojson (x : send_event_request) =
  assoc_to_yojson
    [
      ("eventId", Some (identifier_to_yojson x.event_id));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("eventTimestamp", Some (utc_timestamp_is_o8601_to_yojson x.event_timestamp));
      ("eventVariables", Some (event_variable_map_to_yojson x.event_variables));
      ("assignedLabel", option_to_yojson identifier_to_yojson x.assigned_label);
      ("labelTimestamp", option_to_yojson utc_timestamp_is_o8601_to_yojson x.label_timestamp);
      ("entities", Some (list_of_entities_to_yojson x.entities));
    ]

let put_outcome_result_to_yojson = unit_to_yojson

let put_outcome_request_to_yojson (x : put_outcome_request) =
  assoc_to_yojson
    [
      ("name", Some (identifier_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let put_label_result_to_yojson = unit_to_yojson

let put_label_request_to_yojson (x : put_label_request) =
  assoc_to_yojson
    [
      ("name", Some (identifier_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let put_kms_encryption_key_result_to_yojson = unit_to_yojson
let kms_encryption_key_arn_to_yojson = string_to_yojson

let put_kms_encryption_key_request_to_yojson (x : put_kms_encryption_key_request) =
  assoc_to_yojson
    [ ("kmsEncryptionKeyArn", Some (kms_encryption_key_arn_to_yojson x.kms_encryption_key_arn)) ]

let put_external_model_result_to_yojson = unit_to_yojson

let model_endpoint_status_to_yojson (x : model_endpoint_status) =
  match x with ASSOCIATED -> `String "ASSOCIATED" | DISSOCIATED -> `String "DISSOCIATED"

let csv_index_to_variable_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let json_key_to_variable_map_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let model_output_data_format_to_yojson (x : model_output_data_format) =
  match x with CSV -> `String "TEXT_CSV" | JSONLINES -> `String "APPLICATION_JSONLINES"

let model_output_configuration_to_yojson (x : model_output_configuration) =
  assoc_to_yojson
    [
      ("format", Some (model_output_data_format_to_yojson x.format));
      ( "jsonKeyToVariableMap",
        option_to_yojson json_key_to_variable_map_to_yojson x.json_key_to_variable_map );
      ( "csvIndexToVariableMap",
        option_to_yojson csv_index_to_variable_map_to_yojson x.csv_index_to_variable_map );
    ]

let model_input_template_to_yojson = string_to_yojson
let use_event_variables_to_yojson = bool_to_yojson

let model_input_data_format_to_yojson (x : model_input_data_format) =
  match x with CSV -> `String "TEXT_CSV" | JSON -> `String "APPLICATION_JSON"

let model_input_configuration_to_yojson (x : model_input_configuration) =
  assoc_to_yojson
    [
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("format", option_to_yojson model_input_data_format_to_yojson x.format);
      ("useEventVariables", Some (use_event_variables_to_yojson x.use_event_variables));
      ("jsonInputTemplate", option_to_yojson model_input_template_to_yojson x.json_input_template);
      ("csvInputTemplate", option_to_yojson model_input_template_to_yojson x.csv_input_template);
    ]

let model_source_to_yojson (x : model_source) = match x with SAGEMAKER -> `String "SAGEMAKER"
let sage_maker_endpoint_identifier_to_yojson = string_to_yojson

let put_external_model_request_to_yojson (x : put_external_model_request) =
  assoc_to_yojson
    [
      ("modelEndpoint", Some (sage_maker_endpoint_identifier_to_yojson x.model_endpoint));
      ("modelSource", Some (model_source_to_yojson x.model_source));
      ("invokeModelEndpointRoleArn", Some (string__to_yojson x.invoke_model_endpoint_role_arn));
      ("inputConfiguration", Some (model_input_configuration_to_yojson x.input_configuration));
      ("outputConfiguration", Some (model_output_configuration_to_yojson x.output_configuration));
      ("modelEndpointStatus", Some (model_endpoint_status_to_yojson x.model_endpoint_status));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let put_event_type_result_to_yojson = unit_to_yojson
let boolean__to_yojson = bool_to_yojson

let event_orchestration_to_yojson (x : event_orchestration) =
  assoc_to_yojson [ ("eventBridgeEnabled", Some (boolean__to_yojson x.event_bridge_enabled)) ]

let event_ingestion_to_yojson (x : event_ingestion) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let put_event_type_request_to_yojson (x : put_event_type_request) =
  assoc_to_yojson
    [
      ("name", Some (identifier_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("eventVariables", Some (non_empty_list_of_strings_to_yojson x.event_variables));
      ("labels", option_to_yojson list_of_strings_to_yojson x.labels);
      ("entityTypes", Some (non_empty_list_of_strings_to_yojson x.entity_types));
      ("eventIngestion", option_to_yojson event_ingestion_to_yojson x.event_ingestion);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("eventOrchestration", option_to_yojson event_orchestration_to_yojson x.event_orchestration);
    ]

let put_entity_type_result_to_yojson = unit_to_yojson

let put_entity_type_request_to_yojson (x : put_entity_type_request) =
  assoc_to_yojson
    [
      ("name", Some (identifier_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let put_detector_result_to_yojson = unit_to_yojson

let put_detector_request_to_yojson (x : put_detector_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("description", option_to_yojson description_to_yojson x.description);
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_result_to_yojson (x : list_tags_for_resource_result) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let tags_max_results_to_yojson = int_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("resourceARN", Some (fraud_detector_arn_to_yojson x.resource_ar_n));
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson tags_max_results_to_yojson x.max_results);
    ]

let event_prediction_summary_to_yojson (x : event_prediction_summary) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson identifier_to_yojson x.event_id);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("eventTimestamp", option_to_yojson time_to_yojson x.event_timestamp);
      ("predictionTimestamp", option_to_yojson time_to_yojson x.prediction_timestamp);
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
    ]

let list_of_event_prediction_summaries_to_yojson tree =
  list_to_yojson event_prediction_summary_to_yojson tree

let list_event_predictions_result_to_yojson (x : list_event_predictions_result) =
  assoc_to_yojson
    [
      ( "eventPredictionSummaries",
        option_to_yojson list_of_event_prediction_summaries_to_yojson x.event_prediction_summaries
      );
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let event_predictions_max_results_to_yojson = int_to_yojson

let prediction_time_range_to_yojson (x : prediction_time_range) =
  assoc_to_yojson
    [
      ("startTime", Some (time_to_yojson x.start_time));
      ("endTime", Some (time_to_yojson x.end_time));
    ]

let filter_string_to_yojson = string_to_yojson

let filter_condition_to_yojson (x : filter_condition) =
  assoc_to_yojson [ ("value", option_to_yojson filter_string_to_yojson x.value) ]

let list_event_predictions_request_to_yojson (x : list_event_predictions_request) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson filter_condition_to_yojson x.event_id);
      ("eventType", option_to_yojson filter_condition_to_yojson x.event_type);
      ("detectorId", option_to_yojson filter_condition_to_yojson x.detector_id);
      ("detectorVersionId", option_to_yojson filter_condition_to_yojson x.detector_version_id);
      ( "predictionTimeRange",
        option_to_yojson prediction_time_range_to_yojson x.prediction_time_range );
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson event_predictions_max_results_to_yojson x.max_results);
    ]

let data_source_to_yojson (x : data_source) =
  match x with
  | EVENT -> `String "EVENT"
  | MODEL_SCORE -> `String "MODEL_SCORE"
  | EXTERNAL_MODEL_SCORE -> `String "EXTERNAL_MODEL_SCORE"

let data_type_to_yojson (x : data_type) =
  match x with
  | STRING -> `String "STRING"
  | INTEGER -> `String "INTEGER"
  | FLOAT -> `String "FLOAT"
  | BOOLEAN -> `String "BOOLEAN"
  | DATETIME -> `String "DATETIME"

let variable_to_yojson (x : variable) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("dataType", option_to_yojson data_type_to_yojson x.data_type);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("defaultValue", option_to_yojson string__to_yojson x.default_value);
      ("description", option_to_yojson string__to_yojson x.description);
      ("variableType", option_to_yojson string__to_yojson x.variable_type);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let variable_list_to_yojson tree = list_to_yojson variable_to_yojson tree

let get_variables_result_to_yojson (x : get_variables_result) =
  assoc_to_yojson
    [
      ("variables", option_to_yojson variable_list_to_yojson x.variables);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let variables_max_results_to_yojson = int_to_yojson

let get_variables_request_to_yojson (x : get_variables_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson variables_max_results_to_yojson x.max_results);
    ]

let rule_detail_to_yojson (x : rule_detail) =
  assoc_to_yojson
    [
      ("ruleId", option_to_yojson identifier_to_yojson x.rule_id);
      ("description", option_to_yojson description_to_yojson x.description);
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ("ruleVersion", option_to_yojson whole_number_version_string_to_yojson x.rule_version);
      ("expression", option_to_yojson rule_expression_to_yojson x.expression);
      ("language", option_to_yojson language_to_yojson x.language);
      ("outcomes", option_to_yojson non_empty_list_of_strings_to_yojson x.outcomes);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let rule_detail_list_to_yojson tree = list_to_yojson rule_detail_to_yojson tree

let get_rules_result_to_yojson (x : get_rules_result) =
  assoc_to_yojson
    [
      ("ruleDetails", option_to_yojson rule_detail_list_to_yojson x.rule_details);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let rules_max_results_to_yojson = int_to_yojson

let get_rules_request_to_yojson (x : get_rules_request) =
  assoc_to_yojson
    [
      ("ruleId", option_to_yojson identifier_to_yojson x.rule_id);
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("ruleVersion", option_to_yojson whole_number_version_string_to_yojson x.rule_version);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson rules_max_results_to_yojson x.max_results);
    ]

let outcome_to_yojson (x : outcome) =
  assoc_to_yojson
    [
      ("name", option_to_yojson identifier_to_yojson x.name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let outcome_list_to_yojson tree = list_to_yojson outcome_to_yojson tree

let get_outcomes_result_to_yojson (x : get_outcomes_result) =
  assoc_to_yojson
    [
      ("outcomes", option_to_yojson outcome_list_to_yojson x.outcomes);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let outcomes_max_results_to_yojson = int_to_yojson

let get_outcomes_request_to_yojson (x : get_outcomes_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson identifier_to_yojson x.name);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson outcomes_max_results_to_yojson x.max_results);
    ]

let unlabeled_events_treatment_to_yojson (x : unlabeled_events_treatment) =
  match x with
  | IGNORE -> `String "IGNORE"
  | FRAUD -> `String "FRAUD"
  | LEGIT -> `String "LEGIT"
  | AUTO -> `String "AUTO"

let label_mapper_to_yojson tree = map_to_yojson string__to_yojson list_of_strings_to_yojson tree

let label_schema_to_yojson (x : label_schema) =
  assoc_to_yojson
    [
      ("labelMapper", option_to_yojson label_mapper_to_yojson x.label_mapper);
      ( "unlabeledEventsTreatment",
        option_to_yojson unlabeled_events_treatment_to_yojson x.unlabeled_events_treatment );
    ]

let training_data_schema_to_yojson (x : training_data_schema) =
  assoc_to_yojson
    [
      ("modelVariables", Some (list_of_strings_to_yojson x.model_variables));
      ("labelSchema", option_to_yojson label_schema_to_yojson x.label_schema);
    ]

let training_data_source_enum_to_yojson (x : training_data_source_enum) =
  match x with
  | EXTERNAL_EVENTS -> `String "EXTERNAL_EVENTS"
  | INGESTED_EVENTS -> `String "INGESTED_EVENTS"

let get_model_version_result_to_yojson (x : get_model_version_result) =
  assoc_to_yojson
    [
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ( "trainingDataSource",
        option_to_yojson training_data_source_enum_to_yojson x.training_data_source );
      ("trainingDataSchema", option_to_yojson training_data_schema_to_yojson x.training_data_schema);
      ( "externalEventsDetail",
        option_to_yojson external_events_detail_to_yojson x.external_events_detail );
      ( "ingestedEventsDetail",
        option_to_yojson ingested_events_detail_to_yojson x.ingested_events_detail );
      ("status", option_to_yojson string__to_yojson x.status);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let get_model_version_request_to_yojson (x : get_model_version_request) =
  assoc_to_yojson
    [
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelVersionNumber", Some (float_version_string_to_yojson x.model_version_number));
    ]

let model_to_yojson (x : model) =
  assoc_to_yojson
    [
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("description", option_to_yojson description_to_yojson x.description);
      ("eventTypeName", option_to_yojson string__to_yojson x.event_type_name);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let model_list_to_yojson tree = list_to_yojson model_to_yojson tree

let get_models_result_to_yojson (x : get_models_result) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("models", option_to_yojson model_list_to_yojson x.models);
    ]

let models_max_page_size_to_yojson = int_to_yojson

let get_models_request_to_yojson (x : get_models_request) =
  assoc_to_yojson
    [
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson models_max_page_size_to_yojson x.max_results);
    ]

let next_token_to_yojson = string_to_yojson

let allow_deny_list_to_yojson (x : allow_deny_list) =
  assoc_to_yojson
    [
      ("name", Some (no_dash_identifier_to_yojson x.name));
      ("description", option_to_yojson description_to_yojson x.description);
      ("variableType", option_to_yojson variable_type_to_yojson x.variable_type);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("updatedTime", option_to_yojson time_to_yojson x.updated_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let allow_deny_lists_to_yojson tree = list_to_yojson allow_deny_list_to_yojson tree

let get_lists_metadata_result_to_yojson (x : get_lists_metadata_result) =
  assoc_to_yojson
    [
      ("lists", option_to_yojson allow_deny_lists_to_yojson x.lists);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let lists_metadata_max_results_to_yojson = int_to_yojson

let get_lists_metadata_request_to_yojson (x : get_lists_metadata_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson no_dash_identifier_to_yojson x.name);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson lists_metadata_max_results_to_yojson x.max_results);
    ]

let get_list_elements_result_to_yojson (x : get_list_elements_result) =
  assoc_to_yojson
    [
      ("elements", option_to_yojson elements_list_to_yojson x.elements);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let lists_elements_max_results_to_yojson = int_to_yojson

let get_list_elements_request_to_yojson (x : get_list_elements_request) =
  assoc_to_yojson
    [
      ("name", Some (no_dash_identifier_to_yojson x.name));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson lists_elements_max_results_to_yojson x.max_results);
    ]

let label_to_yojson (x : label) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let label_list_to_yojson tree = list_to_yojson label_to_yojson tree

let get_labels_result_to_yojson (x : get_labels_result) =
  assoc_to_yojson
    [
      ("labels", option_to_yojson label_list_to_yojson x.labels);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let labels_max_results_to_yojson = int_to_yojson

let get_labels_request_to_yojson (x : get_labels_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson identifier_to_yojson x.name);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson labels_max_results_to_yojson x.max_results);
    ]

let kms_key_to_yojson (x : kms_key) =
  assoc_to_yojson
    [
      ( "kmsEncryptionKeyArn",
        option_to_yojson kms_encryption_key_arn_to_yojson x.kms_encryption_key_arn );
    ]

let get_kms_encryption_key_result_to_yojson (x : get_kms_encryption_key_result) =
  assoc_to_yojson [ ("kmsKey", option_to_yojson kms_key_to_yojson x.kms_key) ]

let external_model_to_yojson (x : external_model) =
  assoc_to_yojson
    [
      ("modelEndpoint", option_to_yojson string__to_yojson x.model_endpoint);
      ("modelSource", option_to_yojson model_source_to_yojson x.model_source);
      ( "invokeModelEndpointRoleArn",
        option_to_yojson string__to_yojson x.invoke_model_endpoint_role_arn );
      ( "inputConfiguration",
        option_to_yojson model_input_configuration_to_yojson x.input_configuration );
      ( "outputConfiguration",
        option_to_yojson model_output_configuration_to_yojson x.output_configuration );
      ( "modelEndpointStatus",
        option_to_yojson model_endpoint_status_to_yojson x.model_endpoint_status );
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let external_model_list_to_yojson tree = list_to_yojson external_model_to_yojson tree

let get_external_models_result_to_yojson (x : get_external_models_result) =
  assoc_to_yojson
    [
      ("externalModels", option_to_yojson external_model_list_to_yojson x.external_models);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let external_models_max_results_to_yojson = int_to_yojson

let get_external_models_request_to_yojson (x : get_external_models_request) =
  assoc_to_yojson
    [
      ("modelEndpoint", option_to_yojson string__to_yojson x.model_endpoint);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson external_models_max_results_to_yojson x.max_results);
    ]

let long_to_yojson = long_to_yojson

let ingested_event_statistics_to_yojson (x : ingested_event_statistics) =
  assoc_to_yojson
    [
      ("numberOfEvents", option_to_yojson long_to_yojson x.number_of_events);
      ("eventDataSizeInBytes", option_to_yojson long_to_yojson x.event_data_size_in_bytes);
      ("leastRecentEvent", option_to_yojson time_to_yojson x.least_recent_event);
      ("mostRecentEvent", option_to_yojson time_to_yojson x.most_recent_event);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
    ]

let event_type_to_yojson (x : event_type) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("eventVariables", option_to_yojson list_of_strings_to_yojson x.event_variables);
      ("labels", option_to_yojson list_of_strings_to_yojson x.labels);
      ("entityTypes", option_to_yojson non_empty_list_of_strings_to_yojson x.entity_types);
      ("eventIngestion", option_to_yojson event_ingestion_to_yojson x.event_ingestion);
      ( "ingestedEventStatistics",
        option_to_yojson ingested_event_statistics_to_yojson x.ingested_event_statistics );
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("eventOrchestration", option_to_yojson event_orchestration_to_yojson x.event_orchestration);
    ]

let event_type_list_to_yojson tree = list_to_yojson event_type_to_yojson tree

let get_event_types_result_to_yojson (x : get_event_types_result) =
  assoc_to_yojson
    [
      ("eventTypes", option_to_yojson event_type_list_to_yojson x.event_types);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let event_types_max_results_to_yojson = int_to_yojson

let get_event_types_request_to_yojson (x : get_event_types_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson identifier_to_yojson x.name);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson event_types_max_results_to_yojson x.max_results);
    ]

let map_of_strings_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let evaluated_external_model_to_yojson (x : evaluated_external_model) =
  assoc_to_yojson
    [
      ("modelEndpoint", option_to_yojson string__to_yojson x.model_endpoint);
      ("useEventVariables", option_to_yojson boolean__to_yojson x.use_event_variables);
      ("inputVariables", option_to_yojson map_of_strings_to_yojson x.input_variables);
      ("outputVariables", option_to_yojson map_of_strings_to_yojson x.output_variables);
    ]

let list_of_evaluated_external_models_to_yojson tree =
  list_to_yojson evaluated_external_model_to_yojson tree

let aggregated_variables_impact_explanation_to_yojson (x : aggregated_variables_impact_explanation)
    =
  assoc_to_yojson
    [
      ("eventVariableNames", option_to_yojson list_of_strings_to_yojson x.event_variable_names);
      ("relativeImpact", option_to_yojson string__to_yojson x.relative_impact);
      ("logOddsImpact", option_to_yojson float__to_yojson x.log_odds_impact);
    ]

let list_of_aggregated_variables_impact_explanations_to_yojson tree =
  list_to_yojson aggregated_variables_impact_explanation_to_yojson tree

let variable_impact_explanation_to_yojson (x : variable_impact_explanation) =
  assoc_to_yojson
    [
      ("eventVariableName", option_to_yojson string__to_yojson x.event_variable_name);
      ("relativeImpact", option_to_yojson string__to_yojson x.relative_impact);
      ("logOddsImpact", option_to_yojson float__to_yojson x.log_odds_impact);
    ]

let list_of_variable_impact_explanations_to_yojson tree =
  list_to_yojson variable_impact_explanation_to_yojson tree

let prediction_explanations_to_yojson (x : prediction_explanations) =
  assoc_to_yojson
    [
      ( "variableImpactExplanations",
        option_to_yojson list_of_variable_impact_explanations_to_yojson
          x.variable_impact_explanations );
      ( "aggregatedVariablesImpactExplanations",
        option_to_yojson list_of_aggregated_variables_impact_explanations_to_yojson
          x.aggregated_variables_impact_explanations );
    ]

let model_version_evaluation_to_yojson (x : model_version_evaluation) =
  assoc_to_yojson
    [
      ("outputVariableName", option_to_yojson string__to_yojson x.output_variable_name);
      ("evaluationScore", option_to_yojson string__to_yojson x.evaluation_score);
      ( "predictionExplanations",
        option_to_yojson prediction_explanations_to_yojson x.prediction_explanations );
    ]

let list_of_model_version_evaluations_to_yojson tree =
  list_to_yojson model_version_evaluation_to_yojson tree

let evaluated_model_version_to_yojson (x : evaluated_model_version) =
  assoc_to_yojson
    [
      ("modelId", option_to_yojson string__to_yojson x.model_id);
      ("modelVersion", option_to_yojson string__to_yojson x.model_version);
      ("modelType", option_to_yojson string__to_yojson x.model_type);
      ("evaluations", option_to_yojson list_of_model_version_evaluations_to_yojson x.evaluations);
    ]

let list_of_evaluated_model_versions_to_yojson tree =
  list_to_yojson evaluated_model_version_to_yojson tree

let sensitive_string_to_yojson = string_to_yojson

let evaluated_rule_to_yojson (x : evaluated_rule) =
  assoc_to_yojson
    [
      ("ruleId", option_to_yojson identifier_to_yojson x.rule_id);
      ("ruleVersion", option_to_yojson whole_number_version_string_to_yojson x.rule_version);
      ("expression", option_to_yojson sensitive_string_to_yojson x.expression);
      ("expressionWithValues", option_to_yojson sensitive_string_to_yojson x.expression_with_values);
      ("outcomes", option_to_yojson list_of_strings_to_yojson x.outcomes);
      ("evaluated", option_to_yojson boolean__to_yojson x.evaluated);
      ("matched", option_to_yojson boolean__to_yojson x.matched);
    ]

let evaluated_rule_list_to_yojson tree = list_to_yojson evaluated_rule_to_yojson tree

let event_variable_summary_to_yojson (x : event_variable_summary) =
  assoc_to_yojson
    [
      ("name", option_to_yojson sensitive_string_to_yojson x.name);
      ("value", option_to_yojson sensitive_string_to_yojson x.value);
      ("source", option_to_yojson sensitive_string_to_yojson x.source);
    ]

let list_of_event_variable_summaries_to_yojson tree =
  list_to_yojson event_variable_summary_to_yojson tree

let get_event_prediction_metadata_result_to_yojson (x : get_event_prediction_metadata_result) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson identifier_to_yojson x.event_id);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("entityId", option_to_yojson string__to_yojson x.entity_id);
      ("entityType", option_to_yojson string__to_yojson x.entity_type);
      ("eventTimestamp", option_to_yojson time_to_yojson x.event_timestamp);
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("detectorVersionStatus", option_to_yojson string__to_yojson x.detector_version_status);
      ( "eventVariables",
        option_to_yojson list_of_event_variable_summaries_to_yojson x.event_variables );
      ("rules", option_to_yojson evaluated_rule_list_to_yojson x.rules);
      ("ruleExecutionMode", option_to_yojson rule_execution_mode_to_yojson x.rule_execution_mode);
      ("outcomes", option_to_yojson list_of_strings_to_yojson x.outcomes);
      ( "evaluatedModelVersions",
        option_to_yojson list_of_evaluated_model_versions_to_yojson x.evaluated_model_versions );
      ( "evaluatedExternalModels",
        option_to_yojson list_of_evaluated_external_models_to_yojson x.evaluated_external_models );
      ("predictionTimestamp", option_to_yojson time_to_yojson x.prediction_timestamp);
    ]

let get_event_prediction_metadata_request_to_yojson (x : get_event_prediction_metadata_request) =
  assoc_to_yojson
    [
      ("eventId", Some (identifier_to_yojson x.event_id));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
      ("predictionTimestamp", Some (time_to_yojson x.prediction_timestamp));
    ]

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson string__to_yojson x.message) ]

let external_model_prediction_map_to_yojson tree =
  map_to_yojson string__to_yojson string__to_yojson tree

let external_model_summary_to_yojson (x : external_model_summary) =
  assoc_to_yojson
    [
      ("modelEndpoint", option_to_yojson string__to_yojson x.model_endpoint);
      ("modelSource", option_to_yojson model_source_to_yojson x.model_source);
    ]

let external_model_outputs_to_yojson (x : external_model_outputs) =
  assoc_to_yojson
    [
      ("externalModel", option_to_yojson external_model_summary_to_yojson x.external_model);
      ("outputs", option_to_yojson external_model_prediction_map_to_yojson x.outputs);
    ]

let list_of_external_model_outputs_to_yojson tree =
  list_to_yojson external_model_outputs_to_yojson tree

let rule_result_to_yojson (x : rule_result) =
  assoc_to_yojson
    [
      ("ruleId", option_to_yojson string__to_yojson x.rule_id);
      ("outcomes", option_to_yojson list_of_strings_to_yojson x.outcomes);
    ]

let list_of_rule_results_to_yojson tree = list_to_yojson rule_result_to_yojson tree
let model_prediction_map_to_yojson tree = map_to_yojson string__to_yojson float__to_yojson tree

let model_scores_to_yojson (x : model_scores) =
  assoc_to_yojson
    [
      ("modelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("scores", option_to_yojson model_prediction_map_to_yojson x.scores);
    ]

let list_of_model_scores_to_yojson tree = list_to_yojson model_scores_to_yojson tree

let get_event_prediction_result_to_yojson (x : get_event_prediction_result) =
  assoc_to_yojson
    [
      ("modelScores", option_to_yojson list_of_model_scores_to_yojson x.model_scores);
      ("ruleResults", option_to_yojson list_of_rule_results_to_yojson x.rule_results);
      ( "externalModelOutputs",
        option_to_yojson list_of_external_model_outputs_to_yojson x.external_model_outputs );
    ]

let content_type_to_yojson = string_to_yojson
let blob_to_yojson = blob_to_yojson

let model_endpoint_data_blob_to_yojson (x : model_endpoint_data_blob) =
  assoc_to_yojson
    [
      ("byteBuffer", option_to_yojson blob_to_yojson x.byte_buffer);
      ("contentType", option_to_yojson content_type_to_yojson x.content_type);
    ]

let external_model_endpoint_data_blob_map_to_yojson tree =
  map_to_yojson sage_maker_endpoint_identifier_to_yojson model_endpoint_data_blob_to_yojson tree

let get_event_prediction_request_to_yojson (x : get_event_prediction_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (string__to_yojson x.detector_id));
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("eventId", Some (string__to_yojson x.event_id));
      ("eventTypeName", Some (string__to_yojson x.event_type_name));
      ("entities", Some (list_of_entities_to_yojson x.entities));
      ("eventTimestamp", Some (utc_timestamp_is_o8601_to_yojson x.event_timestamp));
      ("eventVariables", Some (event_variable_map_to_yojson x.event_variables));
      ( "externalModelEndpointDataBlobs",
        option_to_yojson external_model_endpoint_data_blob_map_to_yojson
          x.external_model_endpoint_data_blobs );
    ]

let attribute_value_to_yojson = string_to_yojson
let attribute_key_to_yojson = string_to_yojson

let event_attribute_map_to_yojson tree =
  map_to_yojson attribute_key_to_yojson attribute_value_to_yojson tree

let event_to_yojson (x : event) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson string__to_yojson x.event_id);
      ("eventTypeName", option_to_yojson string__to_yojson x.event_type_name);
      ("eventTimestamp", option_to_yojson string__to_yojson x.event_timestamp);
      ("eventVariables", option_to_yojson event_attribute_map_to_yojson x.event_variables);
      ("currentLabel", option_to_yojson string__to_yojson x.current_label);
      ("labelTimestamp", option_to_yojson string__to_yojson x.label_timestamp);
      ("entities", option_to_yojson list_of_entities_to_yojson x.entities);
    ]

let get_event_result_to_yojson (x : get_event_result) =
  assoc_to_yojson [ ("event", option_to_yojson event_to_yojson x.event) ]

let get_event_request_to_yojson (x : get_event_request) =
  assoc_to_yojson
    [
      ("eventId", Some (string__to_yojson x.event_id));
      ("eventTypeName", Some (string__to_yojson x.event_type_name));
    ]

let entity_type_to_yojson (x : entity_type) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("description", option_to_yojson description_to_yojson x.description);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let entity_type_list_to_yojson tree = list_to_yojson entity_type_to_yojson tree

let get_entity_types_result_to_yojson (x : get_entity_types_result) =
  assoc_to_yojson
    [
      ("entityTypes", option_to_yojson entity_type_list_to_yojson x.entity_types);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let entity_types_max_results_to_yojson = int_to_yojson

let get_entity_types_request_to_yojson (x : get_entity_types_request) =
  assoc_to_yojson
    [
      ("name", option_to_yojson identifier_to_yojson x.name);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson entity_types_max_results_to_yojson x.max_results);
    ]

let get_detector_version_result_to_yojson (x : get_detector_version_result) =
  assoc_to_yojson
    [
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("description", option_to_yojson description_to_yojson x.description);
      ( "externalModelEndpoints",
        option_to_yojson list_of_strings_to_yojson x.external_model_endpoints );
      ("modelVersions", option_to_yojson list_of_model_versions_to_yojson x.model_versions);
      ("rules", option_to_yojson rule_list_to_yojson x.rules);
      ("status", option_to_yojson detector_version_status_to_yojson x.status);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("ruleExecutionMode", option_to_yojson rule_execution_mode_to_yojson x.rule_execution_mode);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let get_detector_version_request_to_yojson (x : get_detector_version_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
    ]

let detector_to_yojson (x : detector) =
  assoc_to_yojson
    [
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ("description", option_to_yojson description_to_yojson x.description);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let detector_list_to_yojson tree = list_to_yojson detector_to_yojson tree

let get_detectors_result_to_yojson (x : get_detectors_result) =
  assoc_to_yojson
    [
      ("detectors", option_to_yojson detector_list_to_yojson x.detectors);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let detectors_max_results_to_yojson = int_to_yojson

let get_detectors_request_to_yojson (x : get_detectors_request) =
  assoc_to_yojson
    [
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson detectors_max_results_to_yojson x.max_results);
    ]

let async_job_status_to_yojson (x : async_job_status) =
  match x with
  | IN_PROGRESS_INITIALIZING -> `String "IN_PROGRESS_INITIALIZING"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | CANCEL_IN_PROGRESS -> `String "CANCEL_IN_PROGRESS"
  | CANCELED -> `String "CANCELED"
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"

let get_delete_events_by_event_type_status_result_to_yojson
    (x : get_delete_events_by_event_type_status_result) =
  assoc_to_yojson
    [
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("eventsDeletionStatus", option_to_yojson async_job_status_to_yojson x.events_deletion_status);
    ]

let get_delete_events_by_event_type_status_request_to_yojson
    (x : get_delete_events_by_event_type_status_request) =
  assoc_to_yojson [ ("eventTypeName", Some (identifier_to_yojson x.event_type_name)) ]

let integer_to_yojson = int_to_yojson

let batch_prediction_to_yojson (x : batch_prediction) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson identifier_to_yojson x.job_id);
      ("status", option_to_yojson async_job_status_to_yojson x.status);
      ("failureReason", option_to_yojson string__to_yojson x.failure_reason);
      ("startTime", option_to_yojson time_to_yojson x.start_time);
      ("completionTime", option_to_yojson time_to_yojson x.completion_time);
      ("lastHeartbeatTime", option_to_yojson time_to_yojson x.last_heartbeat_time);
      ("inputPath", option_to_yojson s3_bucket_location_to_yojson x.input_path);
      ("outputPath", option_to_yojson s3_bucket_location_to_yojson x.output_path);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("detectorName", option_to_yojson identifier_to_yojson x.detector_name);
      ("detectorVersion", option_to_yojson float_version_string_to_yojson x.detector_version);
      ("iamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("processedRecordsCount", option_to_yojson integer_to_yojson x.processed_records_count);
      ("totalRecordsCount", option_to_yojson integer_to_yojson x.total_records_count);
    ]

let batch_prediction_list_to_yojson tree = list_to_yojson batch_prediction_to_yojson tree

let get_batch_prediction_jobs_result_to_yojson (x : get_batch_prediction_jobs_result) =
  assoc_to_yojson
    [
      ("batchPredictions", option_to_yojson batch_prediction_list_to_yojson x.batch_predictions);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let batch_predictions_max_page_size_to_yojson = int_to_yojson

let get_batch_prediction_jobs_request_to_yojson (x : get_batch_prediction_jobs_request) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson identifier_to_yojson x.job_id);
      ("maxResults", option_to_yojson batch_predictions_max_page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let batch_import_to_yojson (x : batch_import) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson identifier_to_yojson x.job_id);
      ("status", option_to_yojson async_job_status_to_yojson x.status);
      ("failureReason", option_to_yojson string__to_yojson x.failure_reason);
      ("startTime", option_to_yojson time_to_yojson x.start_time);
      ("completionTime", option_to_yojson time_to_yojson x.completion_time);
      ("inputPath", option_to_yojson s3_bucket_location_to_yojson x.input_path);
      ("outputPath", option_to_yojson s3_bucket_location_to_yojson x.output_path);
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("iamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("processedRecordsCount", option_to_yojson integer_to_yojson x.processed_records_count);
      ("failedRecordsCount", option_to_yojson integer_to_yojson x.failed_records_count);
      ("totalRecordsCount", option_to_yojson integer_to_yojson x.total_records_count);
    ]

let batch_import_list_to_yojson tree = list_to_yojson batch_import_to_yojson tree

let get_batch_import_jobs_result_to_yojson (x : get_batch_import_jobs_result) =
  assoc_to_yojson
    [
      ("batchImports", option_to_yojson batch_import_list_to_yojson x.batch_imports);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let batch_imports_max_page_size_to_yojson = int_to_yojson

let get_batch_import_jobs_request_to_yojson (x : get_batch_import_jobs_request) =
  assoc_to_yojson
    [
      ("jobId", option_to_yojson identifier_to_yojson x.job_id);
      ("maxResults", option_to_yojson batch_imports_max_page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let aggregated_log_odds_metric_to_yojson (x : aggregated_log_odds_metric) =
  assoc_to_yojson
    [
      ("variableNames", Some (list_of_strings_to_yojson x.variable_names));
      ("aggregatedVariablesImportance", Some (float__to_yojson x.aggregated_variables_importance));
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

let log_odds_metric_to_yojson (x : log_odds_metric) =
  assoc_to_yojson
    [
      ("variableName", Some (string__to_yojson x.variable_name));
      ("variableType", Some (string__to_yojson x.variable_type));
      ("variableImportance", Some (float__to_yojson x.variable_importance));
    ]

let list_of_log_odds_metrics_to_yojson tree = list_to_yojson log_odds_metric_to_yojson tree

let variable_importance_metrics_to_yojson (x : variable_importance_metrics) =
  assoc_to_yojson
    [ ("logOddsMetrics", option_to_yojson list_of_log_odds_metrics_to_yojson x.log_odds_metrics) ]

let uncertainty_range_to_yojson (x : uncertainty_range) =
  assoc_to_yojson
    [
      ("lowerBoundValue", Some (float__to_yojson x.lower_bound_value));
      ("upperBoundValue", Some (float__to_yojson x.upper_bound_value));
    ]

let tfi_model_performance_to_yojson (x : tfi_model_performance) =
  assoc_to_yojson
    [
      ("auc", option_to_yojson float__to_yojson x.auc);
      ("uncertaintyRange", option_to_yojson uncertainty_range_to_yojson x.uncertainty_range);
    ]

let tfi_metric_data_point_to_yojson (x : tfi_metric_data_point) =
  assoc_to_yojson
    [
      ("fpr", option_to_yojson float__to_yojson x.fpr);
      ("precision", option_to_yojson float__to_yojson x.precision);
      ("tpr", option_to_yojson float__to_yojson x.tpr);
      ("threshold", option_to_yojson float__to_yojson x.threshold);
    ]

let tfi_metric_data_points_list_to_yojson tree = list_to_yojson tfi_metric_data_point_to_yojson tree

let tfi_training_metrics_value_to_yojson (x : tfi_training_metrics_value) =
  assoc_to_yojson
    [
      ( "metricDataPoints",
        option_to_yojson tfi_metric_data_points_list_to_yojson x.metric_data_points );
      ("modelPerformance", option_to_yojson tfi_model_performance_to_yojson x.model_performance);
    ]

let ofi_model_performance_to_yojson (x : ofi_model_performance) =
  assoc_to_yojson
    [
      ("auc", option_to_yojson float__to_yojson x.auc);
      ("uncertaintyRange", option_to_yojson uncertainty_range_to_yojson x.uncertainty_range);
    ]

let ofi_metric_data_point_to_yojson (x : ofi_metric_data_point) =
  assoc_to_yojson
    [
      ("fpr", option_to_yojson float__to_yojson x.fpr);
      ("precision", option_to_yojson float__to_yojson x.precision);
      ("tpr", option_to_yojson float__to_yojson x.tpr);
      ("threshold", option_to_yojson float__to_yojson x.threshold);
    ]

let ofi_metric_data_points_list_to_yojson tree = list_to_yojson ofi_metric_data_point_to_yojson tree

let ofi_training_metrics_value_to_yojson (x : ofi_training_metrics_value) =
  assoc_to_yojson
    [
      ( "metricDataPoints",
        option_to_yojson ofi_metric_data_points_list_to_yojson x.metric_data_points );
      ("modelPerformance", option_to_yojson ofi_model_performance_to_yojson x.model_performance);
    ]

let training_metrics_v2_to_yojson (x : training_metrics_v2) =
  assoc_to_yojson
    [
      ("ofi", option_to_yojson ofi_training_metrics_value_to_yojson x.ofi);
      ("tfi", option_to_yojson tfi_training_metrics_value_to_yojson x.tfi);
      ("ati", option_to_yojson ati_training_metrics_value_to_yojson x.ati);
    ]

let field_validation_message_to_yojson (x : field_validation_message) =
  assoc_to_yojson
    [
      ("fieldName", option_to_yojson string__to_yojson x.field_name);
      ("identifier", option_to_yojson string__to_yojson x.identifier);
      ("title", option_to_yojson string__to_yojson x.title);
      ("content", option_to_yojson string__to_yojson x.content);
      ("type", option_to_yojson string__to_yojson x.type_);
    ]

let field_validation_message_list_to_yojson tree =
  list_to_yojson field_validation_message_to_yojson tree

let file_validation_message_to_yojson (x : file_validation_message) =
  assoc_to_yojson
    [
      ("title", option_to_yojson string__to_yojson x.title);
      ("content", option_to_yojson string__to_yojson x.content);
      ("type", option_to_yojson string__to_yojson x.type_);
    ]

let file_validation_message_list_to_yojson tree =
  list_to_yojson file_validation_message_to_yojson tree

let data_validation_metrics_to_yojson (x : data_validation_metrics) =
  assoc_to_yojson
    [
      ( "fileLevelMessages",
        option_to_yojson file_validation_message_list_to_yojson x.file_level_messages );
      ( "fieldLevelMessages",
        option_to_yojson field_validation_message_list_to_yojson x.field_level_messages );
    ]

let training_result_v2_to_yojson (x : training_result_v2) =
  assoc_to_yojson
    [
      ( "dataValidationMetrics",
        option_to_yojson data_validation_metrics_to_yojson x.data_validation_metrics );
      ("trainingMetricsV2", option_to_yojson training_metrics_v2_to_yojson x.training_metrics_v2);
      ( "variableImportanceMetrics",
        option_to_yojson variable_importance_metrics_to_yojson x.variable_importance_metrics );
      ( "aggregatedVariablesImportanceMetrics",
        option_to_yojson aggregated_variables_importance_metrics_to_yojson
          x.aggregated_variables_importance_metrics );
    ]

let metric_data_point_to_yojson (x : metric_data_point) =
  assoc_to_yojson
    [
      ("fpr", option_to_yojson float__to_yojson x.fpr);
      ("precision", option_to_yojson float__to_yojson x.precision);
      ("tpr", option_to_yojson float__to_yojson x.tpr);
      ("threshold", option_to_yojson float__to_yojson x.threshold);
    ]

let metric_data_points_list_to_yojson tree = list_to_yojson metric_data_point_to_yojson tree

let training_metrics_to_yojson (x : training_metrics) =
  assoc_to_yojson
    [
      ("auc", option_to_yojson float__to_yojson x.auc);
      ("metricDataPoints", option_to_yojson metric_data_points_list_to_yojson x.metric_data_points);
    ]

let training_result_to_yojson (x : training_result) =
  assoc_to_yojson
    [
      ( "dataValidationMetrics",
        option_to_yojson data_validation_metrics_to_yojson x.data_validation_metrics );
      ("trainingMetrics", option_to_yojson training_metrics_to_yojson x.training_metrics);
      ( "variableImportanceMetrics",
        option_to_yojson variable_importance_metrics_to_yojson x.variable_importance_metrics );
    ]

let model_version_detail_to_yojson (x : model_version_detail) =
  assoc_to_yojson
    [
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("status", option_to_yojson string__to_yojson x.status);
      ( "trainingDataSource",
        option_to_yojson training_data_source_enum_to_yojson x.training_data_source );
      ("trainingDataSchema", option_to_yojson training_data_schema_to_yojson x.training_data_schema);
      ( "externalEventsDetail",
        option_to_yojson external_events_detail_to_yojson x.external_events_detail );
      ( "ingestedEventsDetail",
        option_to_yojson ingested_events_detail_to_yojson x.ingested_events_detail );
      ("trainingResult", option_to_yojson training_result_to_yojson x.training_result);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
      ("createdTime", option_to_yojson time_to_yojson x.created_time);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
      ("trainingResultV2", option_to_yojson training_result_v2_to_yojson x.training_result_v2);
    ]

let model_version_detail_list_to_yojson tree = list_to_yojson model_version_detail_to_yojson tree

let describe_model_versions_result_to_yojson (x : describe_model_versions_result) =
  assoc_to_yojson
    [
      ( "modelVersionDetails",
        option_to_yojson model_version_detail_list_to_yojson x.model_version_details );
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_model_versions_request_to_yojson (x : describe_model_versions_request) =
  assoc_to_yojson
    [
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson models_max_page_size_to_yojson x.max_results);
    ]

let detector_version_summary_to_yojson (x : detector_version_summary) =
  assoc_to_yojson
    [
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("status", option_to_yojson detector_version_status_to_yojson x.status);
      ("description", option_to_yojson description_to_yojson x.description);
      ("lastUpdatedTime", option_to_yojson time_to_yojson x.last_updated_time);
    ]

let detector_version_summary_list_to_yojson tree =
  list_to_yojson detector_version_summary_to_yojson tree

let describe_detector_result_to_yojson (x : describe_detector_result) =
  assoc_to_yojson
    [
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ( "detectorVersionSummaries",
        option_to_yojson detector_version_summary_list_to_yojson x.detector_version_summaries );
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("arn", option_to_yojson fraud_detector_arn_to_yojson x.arn);
    ]

let detector_version_max_results_to_yojson = int_to_yojson

let describe_detector_request_to_yojson (x : describe_detector_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("nextToken", option_to_yojson string__to_yojson x.next_token);
      ("maxResults", option_to_yojson detector_version_max_results_to_yojson x.max_results);
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
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("modelVersionNumber", Some (float_version_string_to_yojson x.model_version_number));
    ]

let delete_model_result_to_yojson = unit_to_yojson

let delete_model_request_to_yojson (x : delete_model_request) =
  assoc_to_yojson
    [
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
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

let delete_event_type_result_to_yojson = unit_to_yojson

let delete_event_type_request_to_yojson (x : delete_event_type_request) =
  assoc_to_yojson [ ("name", Some (identifier_to_yojson x.name)) ]

let delete_events_by_event_type_result_to_yojson (x : delete_events_by_event_type_result) =
  assoc_to_yojson
    [
      ("eventTypeName", option_to_yojson identifier_to_yojson x.event_type_name);
      ("eventsDeletionStatus", option_to_yojson string__to_yojson x.events_deletion_status);
    ]

let delete_events_by_event_type_request_to_yojson (x : delete_events_by_event_type_request) =
  assoc_to_yojson [ ("eventTypeName", Some (identifier_to_yojson x.event_type_name)) ]

let delete_event_result_to_yojson = unit_to_yojson
let delete_audit_history_to_yojson = bool_to_yojson

let delete_event_request_to_yojson (x : delete_event_request) =
  assoc_to_yojson
    [
      ("eventId", Some (identifier_to_yojson x.event_id));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("deleteAuditHistory", option_to_yojson delete_audit_history_to_yojson x.delete_audit_history);
    ]

let delete_entity_type_result_to_yojson = unit_to_yojson

let delete_entity_type_request_to_yojson (x : delete_entity_type_request) =
  assoc_to_yojson [ ("name", Some (identifier_to_yojson x.name)) ]

let delete_detector_version_result_to_yojson = unit_to_yojson

let delete_detector_version_request_to_yojson (x : delete_detector_version_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("detectorVersionId", Some (whole_number_version_string_to_yojson x.detector_version_id));
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
      ("name", Some (string__to_yojson x.name));
      ("dataType", Some (data_type_to_yojson x.data_type));
      ("dataSource", Some (data_source_to_yojson x.data_source));
      ("defaultValue", Some (string__to_yojson x.default_value));
      ("description", option_to_yojson string__to_yojson x.description);
      ("variableType", option_to_yojson string__to_yojson x.variable_type);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_rule_result_to_yojson (x : create_rule_result) =
  assoc_to_yojson [ ("rule", option_to_yojson rule_to_yojson x.rule) ]

let create_rule_request_to_yojson (x : create_rule_request) =
  assoc_to_yojson
    [
      ("ruleId", Some (identifier_to_yojson x.rule_id));
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("description", option_to_yojson description_to_yojson x.description);
      ("expression", Some (rule_expression_to_yojson x.expression));
      ("language", Some (language_to_yojson x.language));
      ("outcomes", Some (non_empty_list_of_strings_to_yojson x.outcomes));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_model_version_result_to_yojson (x : create_model_version_result) =
  assoc_to_yojson
    [
      ("modelId", option_to_yojson model_identifier_to_yojson x.model_id);
      ("modelType", option_to_yojson model_type_enum_to_yojson x.model_type);
      ("modelVersionNumber", option_to_yojson float_version_string_to_yojson x.model_version_number);
      ("status", option_to_yojson string__to_yojson x.status);
    ]

let create_model_version_request_to_yojson (x : create_model_version_request) =
  assoc_to_yojson
    [
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("trainingDataSource", Some (training_data_source_enum_to_yojson x.training_data_source));
      ("trainingDataSchema", Some (training_data_schema_to_yojson x.training_data_schema));
      ( "externalEventsDetail",
        option_to_yojson external_events_detail_to_yojson x.external_events_detail );
      ( "ingestedEventsDetail",
        option_to_yojson ingested_events_detail_to_yojson x.ingested_events_detail );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_model_result_to_yojson = unit_to_yojson

let create_model_request_to_yojson (x : create_model_request) =
  assoc_to_yojson
    [
      ("modelId", Some (model_identifier_to_yojson x.model_id));
      ("modelType", Some (model_type_enum_to_yojson x.model_type));
      ("description", option_to_yojson description_to_yojson x.description);
      ("eventTypeName", Some (string__to_yojson x.event_type_name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_list_result_to_yojson = unit_to_yojson

let create_list_request_to_yojson (x : create_list_request) =
  assoc_to_yojson
    [
      ("name", Some (no_dash_identifier_to_yojson x.name));
      ("elements", option_to_yojson elements_list_to_yojson x.elements);
      ("variableType", option_to_yojson variable_type_to_yojson x.variable_type);
      ("description", option_to_yojson description_to_yojson x.description);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_detector_version_result_to_yojson (x : create_detector_version_result) =
  assoc_to_yojson
    [
      ("detectorId", option_to_yojson identifier_to_yojson x.detector_id);
      ( "detectorVersionId",
        option_to_yojson whole_number_version_string_to_yojson x.detector_version_id );
      ("status", option_to_yojson detector_version_status_to_yojson x.status);
    ]

let create_detector_version_request_to_yojson (x : create_detector_version_request) =
  assoc_to_yojson
    [
      ("detectorId", Some (identifier_to_yojson x.detector_id));
      ("description", option_to_yojson description_to_yojson x.description);
      ( "externalModelEndpoints",
        option_to_yojson list_of_strings_to_yojson x.external_model_endpoints );
      ("rules", Some (rule_list_to_yojson x.rules));
      ("modelVersions", option_to_yojson list_of_model_versions_to_yojson x.model_versions);
      ("ruleExecutionMode", option_to_yojson rule_execution_mode_to_yojson x.rule_execution_mode);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_batch_prediction_job_result_to_yojson = unit_to_yojson

let create_batch_prediction_job_request_to_yojson (x : create_batch_prediction_job_request) =
  assoc_to_yojson
    [
      ("jobId", Some (identifier_to_yojson x.job_id));
      ("inputPath", Some (s3_bucket_location_to_yojson x.input_path));
      ("outputPath", Some (s3_bucket_location_to_yojson x.output_path));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("detectorName", Some (identifier_to_yojson x.detector_name));
      ("detectorVersion", option_to_yojson whole_number_version_string_to_yojson x.detector_version);
      ("iamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_batch_import_job_result_to_yojson = unit_to_yojson

let create_batch_import_job_request_to_yojson (x : create_batch_import_job_request) =
  assoc_to_yojson
    [
      ("jobId", Some (identifier_to_yojson x.job_id));
      ("inputPath", Some (s3_bucket_location_to_yojson x.input_path));
      ("outputPath", Some (s3_bucket_location_to_yojson x.output_path));
      ("eventTypeName", Some (identifier_to_yojson x.event_type_name));
      ("iamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let cancel_batch_prediction_job_result_to_yojson = unit_to_yojson

let cancel_batch_prediction_job_request_to_yojson (x : cancel_batch_prediction_job_request) =
  assoc_to_yojson [ ("jobId", Some (identifier_to_yojson x.job_id)) ]

let cancel_batch_import_job_result_to_yojson = unit_to_yojson

let cancel_batch_import_job_request_to_yojson (x : cancel_batch_import_job_request) =
  assoc_to_yojson [ ("jobId", Some (identifier_to_yojson x.job_id)) ]

let integer2_to_yojson = int_to_yojson

let batch_get_variable_error_to_yojson (x : batch_get_variable_error) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("code", option_to_yojson integer2_to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let batch_get_variable_error_list_to_yojson tree =
  list_to_yojson batch_get_variable_error_to_yojson tree

let batch_get_variable_result_to_yojson (x : batch_get_variable_result) =
  assoc_to_yojson
    [
      ("variables", option_to_yojson variable_list_to_yojson x.variables);
      ("errors", option_to_yojson batch_get_variable_error_list_to_yojson x.errors);
    ]

let name_list_to_yojson tree = list_to_yojson string__to_yojson tree

let batch_get_variable_request_to_yojson (x : batch_get_variable_request) =
  assoc_to_yojson [ ("names", Some (name_list_to_yojson x.names)) ]

let batch_create_variable_error_to_yojson (x : batch_create_variable_error) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("code", option_to_yojson integer2_to_yojson x.code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let batch_create_variable_error_list_to_yojson tree =
  list_to_yojson batch_create_variable_error_to_yojson tree

let batch_create_variable_result_to_yojson (x : batch_create_variable_result) =
  assoc_to_yojson
    [ ("errors", option_to_yojson batch_create_variable_error_list_to_yojson x.errors) ]

let variable_entry_to_yojson (x : variable_entry) =
  assoc_to_yojson
    [
      ("name", option_to_yojson string__to_yojson x.name);
      ("dataType", option_to_yojson string__to_yojson x.data_type);
      ("dataSource", option_to_yojson string__to_yojson x.data_source);
      ("defaultValue", option_to_yojson string__to_yojson x.default_value);
      ("description", option_to_yojson string__to_yojson x.description);
      ("variableType", option_to_yojson string__to_yojson x.variable_type);
    ]

let variable_entry_list_to_yojson tree = list_to_yojson variable_entry_to_yojson tree

let batch_create_variable_request_to_yojson (x : batch_create_variable_request) =
  assoc_to_yojson
    [
      ("variableEntries", Some (variable_entry_list_to_yojson x.variable_entries));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]
