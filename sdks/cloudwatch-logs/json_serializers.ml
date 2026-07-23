open Smaws_Lib.Json.SerializeHelpers
open Types

let message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let access_policy_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson
let account_ids_to_yojson tree = list_to_yojson account_id_to_yojson tree
let selection_criteria_to_yojson = string_to_yojson
let scope_to_yojson (x : scope) = match x with ALL -> `String "ALL"

let policy_type_to_yojson (x : policy_type) =
  match x with
  | DATA_PROTECTION_POLICY -> `String "DATA_PROTECTION_POLICY"
  | SUBSCRIPTION_FILTER_POLICY -> `String "SUBSCRIPTION_FILTER_POLICY"
  | FIELD_INDEX_POLICY -> `String "FIELD_INDEX_POLICY"
  | TRANSFORMER_POLICY -> `String "TRANSFORMER_POLICY"
  | METRIC_EXTRACTION_POLICY -> `String "METRIC_EXTRACTION_POLICY"

let timestamp_to_yojson = long_to_yojson
let account_policy_document_to_yojson = string_to_yojson
let policy_name_to_yojson = string_to_yojson

let account_policy_to_yojson (x : account_policy) =
  assoc_to_yojson
    [
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("policyDocument", option_to_yojson account_policy_document_to_yojson x.policy_document);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("policyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("selectionCriteria", option_to_yojson selection_criteria_to_yojson x.selection_criteria);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
    ]

let account_policies_to_yojson tree = list_to_yojson account_policy_to_yojson tree

let action_status_to_yojson (x : action_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | CLIENT_ERROR -> `String "CLIENT_ERROR"
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"

let overwrite_if_exists_to_yojson = bool_to_yojson
let add_key_value_to_yojson = string_to_yojson
let key_to_yojson = string_to_yojson

let add_key_entry_to_yojson (x : add_key_entry) =
  assoc_to_yojson
    [
      ("key", Some (key_to_yojson x.key));
      ("value", Some (add_key_value_to_yojson x.value));
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
    ]

let add_key_entries_to_yojson tree = list_to_yojson add_key_entry_to_yojson tree

let add_keys_to_yojson (x : add_keys) =
  assoc_to_yojson [ ("entries", Some (add_key_entries_to_yojson x.entries)) ]

let grouping_identifier_value_to_yojson = string_to_yojson
let grouping_identifier_key_to_yojson = string_to_yojson

let grouping_identifier_to_yojson (x : grouping_identifier) =
  assoc_to_yojson
    [
      ("key", option_to_yojson grouping_identifier_key_to_yojson x.key);
      ("value", option_to_yojson grouping_identifier_value_to_yojson x.value);
    ]

let grouping_identifiers_to_yojson tree = list_to_yojson grouping_identifier_to_yojson tree
let log_group_count_to_yojson = int_to_yojson

let aggregate_log_group_summary_to_yojson (x : aggregate_log_group_summary) =
  assoc_to_yojson
    [
      ("logGroupCount", option_to_yojson log_group_count_to_yojson x.log_group_count);
      ("groupingIdentifiers", option_to_yojson grouping_identifiers_to_yojson x.grouping_identifiers);
    ]

let aggregate_log_group_summaries_to_yojson tree =
  list_to_yojson aggregate_log_group_summary_to_yojson tree

let allowed_action_for_allow_vended_logs_delivery_for_resource_to_yojson = string_to_yojson
let field_delimiter_to_yojson = string_to_yojson
let allowed_field_delimiters_to_yojson tree = list_to_yojson field_delimiter_to_yojson tree
let boolean__to_yojson = bool_to_yojson
let field_header_to_yojson = string_to_yojson

let record_field_to_yojson (x : record_field) =
  assoc_to_yojson
    [
      ("name", option_to_yojson field_header_to_yojson x.name);
      ("mandatory", option_to_yojson boolean__to_yojson x.mandatory);
    ]

let allowed_fields_to_yojson tree = list_to_yojson record_field_to_yojson tree
let amazon_resource_name_to_yojson = string_to_yojson
let epoch_millis_to_yojson = long_to_yojson
let log_group_arn_to_yojson = string_to_yojson
let log_group_arn_list_to_yojson tree = list_to_yojson log_group_arn_to_yojson tree
let inferred_token_name_to_yojson = string_to_yojson
let token_value_to_yojson = long_to_yojson
let token_string_to_yojson = string_to_yojson
let enumerations_to_yojson tree = map_to_yojson token_string_to_yojson token_value_to_yojson tree
let dynamic_token_position_to_yojson = int_to_yojson

let pattern_token_to_yojson (x : pattern_token) =
  assoc_to_yojson
    [
      ( "dynamicTokenPosition",
        option_to_yojson dynamic_token_position_to_yojson x.dynamic_token_position );
      ("isDynamic", option_to_yojson boolean__to_yojson x.is_dynamic);
      ("tokenString", option_to_yojson token_string_to_yojson x.token_string);
      ("enumerations", option_to_yojson enumerations_to_yojson x.enumerations);
      ("inferredTokenName", option_to_yojson inferred_token_name_to_yojson x.inferred_token_name);
    ]

let pattern_tokens_to_yojson tree = list_to_yojson pattern_token_to_yojson tree
let event_message_to_yojson = string_to_yojson

let log_event_to_yojson (x : log_event) =
  assoc_to_yojson
    [
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("message", option_to_yojson event_message_to_yojson x.message);
    ]

let log_samples_to_yojson tree = list_to_yojson log_event_to_yojson tree
let count_to_yojson = long_to_yojson
let time_to_yojson = string_to_yojson
let histogram_to_yojson tree = map_to_yojson time_to_yojson count_to_yojson tree

let state_to_yojson (x : state) =
  match x with
  | Active -> `String "Active"
  | Suppressed -> `String "Suppressed"
  | Baseline -> `String "Baseline"

let description_to_yojson = string_to_yojson
let priority_to_yojson = string_to_yojson
let pattern_regex_to_yojson = string_to_yojson
let pattern_string_to_yojson = string_to_yojson
let anomaly_detector_arn_to_yojson = string_to_yojson
let pattern_id_to_yojson = string_to_yojson
let anomaly_id_to_yojson = string_to_yojson

let anomaly_to_yojson (x : anomaly) =
  assoc_to_yojson
    [
      ("anomalyId", Some (anomaly_id_to_yojson x.anomaly_id));
      ("patternId", Some (pattern_id_to_yojson x.pattern_id));
      ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn));
      ("patternString", Some (pattern_string_to_yojson x.pattern_string));
      ("patternRegex", option_to_yojson pattern_regex_to_yojson x.pattern_regex);
      ("priority", option_to_yojson priority_to_yojson x.priority);
      ("firstSeen", Some (epoch_millis_to_yojson x.first_seen));
      ("lastSeen", Some (epoch_millis_to_yojson x.last_seen));
      ("description", Some (description_to_yojson x.description));
      ("active", Some (boolean__to_yojson x.active));
      ("state", Some (state_to_yojson x.state));
      ("histogram", Some (histogram_to_yojson x.histogram));
      ("logSamples", Some (log_samples_to_yojson x.log_samples));
      ("patternTokens", Some (pattern_tokens_to_yojson x.pattern_tokens));
      ("logGroupArnList", Some (log_group_arn_list_to_yojson x.log_group_arn_list));
      ("suppressed", option_to_yojson boolean__to_yojson x.suppressed);
      ("suppressedDate", option_to_yojson epoch_millis_to_yojson x.suppressed_date);
      ("suppressedUntil", option_to_yojson epoch_millis_to_yojson x.suppressed_until);
      ( "isPatternLevelSuppression",
        option_to_yojson boolean__to_yojson x.is_pattern_level_suppression );
    ]

let anomalies_to_yojson tree = list_to_yojson anomaly_to_yojson tree
let anomaly_visibility_time_to_yojson = long_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let anomaly_detector_status_to_yojson (x : anomaly_detector_status) =
  match x with
  | INITIALIZING -> `String "INITIALIZING"
  | TRAINING -> `String "TRAINING"
  | ANALYZING -> `String "ANALYZING"
  | FAILED -> `String "FAILED"
  | DELETED -> `String "DELETED"
  | PAUSED -> `String "PAUSED"

let filter_pattern_to_yojson = string_to_yojson

let evaluation_frequency_to_yojson (x : evaluation_frequency) =
  match x with
  | ONE_MIN -> `String "ONE_MIN"
  | FIVE_MIN -> `String "FIVE_MIN"
  | TEN_MIN -> `String "TEN_MIN"
  | FIFTEEN_MIN -> `String "FIFTEEN_MIN"
  | THIRTY_MIN -> `String "THIRTY_MIN"
  | ONE_HOUR -> `String "ONE_HOUR"

let detector_name_to_yojson = string_to_yojson

let anomaly_detector_to_yojson (x : anomaly_detector) =
  assoc_to_yojson
    [
      ("anomalyDetectorArn", option_to_yojson anomaly_detector_arn_to_yojson x.anomaly_detector_arn);
      ("detectorName", option_to_yojson detector_name_to_yojson x.detector_name);
      ("logGroupArnList", option_to_yojson log_group_arn_list_to_yojson x.log_group_arn_list);
      ("evaluationFrequency", option_to_yojson evaluation_frequency_to_yojson x.evaluation_frequency);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ( "anomalyDetectorStatus",
        option_to_yojson anomaly_detector_status_to_yojson x.anomaly_detector_status );
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("creationTimeStamp", option_to_yojson epoch_millis_to_yojson x.creation_time_stamp);
      ("lastModifiedTimeStamp", option_to_yojson epoch_millis_to_yojson x.last_modified_time_stamp);
      ( "anomalyVisibilityTime",
        option_to_yojson anomaly_visibility_time_to_yojson x.anomaly_visibility_time );
    ]

let anomaly_detectors_to_yojson tree = list_to_yojson anomaly_detector_to_yojson tree
let apply_on_transformed_logs_to_yojson = bool_to_yojson
let arn_to_yojson = string_to_yojson

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let operation_aborted_exception_to_yojson (x : operation_aborted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_identifier_to_yojson = string_to_yojson
let log_group_name_to_yojson = string_to_yojson

let associate_kms_key_request_to_yojson (x : associate_kms_key_request) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("kmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id));
      ("resourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
    ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let s3_table_integration_source_identifier_to_yojson = string_to_yojson

let associate_source_to_s3_table_integration_response_to_yojson
    (x : associate_source_to_s3_table_integration_response) =
  assoc_to_yojson
    [
      ("identifier", option_to_yojson s3_table_integration_source_identifier_to_yojson x.identifier);
    ]

let data_source_type_to_yojson = string_to_yojson
let data_source_name_to_yojson = string_to_yojson

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson
    [
      ("name", Some (data_source_name_to_yojson x.name));
      ("type", option_to_yojson data_source_type_to_yojson x.type_);
    ]

let associate_source_to_s3_table_integration_request_to_yojson
    (x : associate_source_to_s3_table_integration_request) =
  assoc_to_yojson
    [
      ("integrationArn", Some (arn_to_yojson x.integration_arn));
      ("dataSource", Some (data_source_to_yojson x.data_source));
    ]

let baseline_to_yojson = bool_to_yojson
let batch_id_to_yojson = string_to_yojson
let bearer_token_authentication_enabled_to_yojson = bool_to_yojson
let bytes_scanned_value_to_yojson = double_to_yojson
let destination_field_to_yojson = string_to_yojson
let source_to_yojson = string_to_yojson
let column_to_yojson = string_to_yojson
let columns_to_yojson tree = list_to_yojson column_to_yojson tree
let delimiter_to_yojson = string_to_yojson
let quote_character_to_yojson = string_to_yojson

let cs_v_to_yojson (x : cs_v) =
  assoc_to_yojson
    [
      ("quoteCharacter", option_to_yojson quote_character_to_yojson x.quote_character);
      ("delimiter", option_to_yojson delimiter_to_yojson x.delimiter);
      ("columns", option_to_yojson columns_to_yojson x.columns);
      ("source", option_to_yojson source_to_yojson x.source);
      ("destination", option_to_yojson destination_field_to_yojson x.destination);
    ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let export_task_id_to_yojson = string_to_yojson

let cancel_export_task_request_to_yojson (x : cancel_export_task_request) =
  assoc_to_yojson [ ("taskId", Some (export_task_id_to_yojson x.task_id)) ]

let import_status_to_yojson (x : import_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | CANCELLED -> `String "CANCELLED"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let stored_bytes_to_yojson = long_to_yojson

let import_statistics_to_yojson (x : import_statistics) =
  assoc_to_yojson [ ("bytesImported", option_to_yojson stored_bytes_to_yojson x.bytes_imported) ]

let import_id_to_yojson = string_to_yojson

let cancel_import_task_response_to_yojson (x : cancel_import_task_response) =
  assoc_to_yojson
    [
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
      ("importStatistics", option_to_yojson import_statistics_to_yojson x.import_statistics);
      ("importStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let cancel_import_task_request_to_yojson (x : cancel_import_task_request) =
  assoc_to_yojson [ ("importId", Some (import_id_to_yojson x.import_id)) ]

let client_token_to_yojson = string_to_yojson
let collection_retention_days_to_yojson = int_to_yojson
let s3_tables_datasource_type_to_yojson = string_to_yojson
let s3_tables_datasource_name_to_yojson = string_to_yojson

let s3_tables_integration_to_yojson (x : s3_tables_integration) =
  assoc_to_yojson
    [
      ("datasourceName", option_to_yojson s3_tables_datasource_name_to_yojson x.datasource_name);
      ("datasourceType", option_to_yojson s3_tables_datasource_type_to_yojson x.datasource_type);
    ]

let delivery_source_configuration_numeric_value_to_yojson = double_to_yojson
let delivery_source_configuration_schema_field_to_yojson = string_to_yojson

let delivery_source_configuration_supported_values_to_yojson tree =
  list_to_yojson delivery_source_configuration_schema_field_to_yojson tree

let delivery_source_configuration_schema_value_type_to_yojson
    (x : delivery_source_configuration_schema_value_type) =
  match x with
  | STRING -> `String "string"
  | BOOLEAN -> `String "boolean"
  | INT -> `String "int"
  | DOUBLE -> `String "double"
  | LONG -> `String "long"

let delivery_source_configuration_schema_to_yojson (x : delivery_source_configuration_schema) =
  assoc_to_yojson
    [
      ("keyName", Some (delivery_source_configuration_schema_field_to_yojson x.key_name));
      ("valueType", Some (delivery_source_configuration_schema_value_type_to_yojson x.value_type));
      ("defaultValue", Some (delivery_source_configuration_schema_field_to_yojson x.default_value));
      ( "supportedValues",
        option_to_yojson delivery_source_configuration_supported_values_to_yojson x.supported_values
      );
      ( "minValue",
        option_to_yojson delivery_source_configuration_numeric_value_to_yojson x.min_value );
      ( "maxValue",
        option_to_yojson delivery_source_configuration_numeric_value_to_yojson x.max_value );
    ]

let delivery_source_configuration_schemas_to_yojson tree =
  list_to_yojson delivery_source_configuration_schema_to_yojson tree

let record_fields_to_yojson tree = list_to_yojson field_header_to_yojson tree

let output_format_to_yojson (x : output_format) =
  match x with
  | JSON -> `String "json"
  | PLAIN -> `String "plain"
  | W3C -> `String "w3c"
  | RAW -> `String "raw"
  | PARQUET -> `String "parquet"

let output_formats_to_yojson tree = list_to_yojson output_format_to_yojson tree
let delivery_suffix_path_to_yojson = string_to_yojson

let s3_delivery_configuration_to_yojson (x : s3_delivery_configuration) =
  assoc_to_yojson
    [
      ("suffixPath", option_to_yojson delivery_suffix_path_to_yojson x.suffix_path);
      ("enableHiveCompatiblePath", option_to_yojson boolean__to_yojson x.enable_hive_compatible_path);
    ]

let configuration_template_delivery_config_values_to_yojson
    (x : configuration_template_delivery_config_values) =
  assoc_to_yojson
    [
      ("recordFields", option_to_yojson record_fields_to_yojson x.record_fields);
      ("fieldDelimiter", option_to_yojson field_delimiter_to_yojson x.field_delimiter);
      ( "s3DeliveryConfiguration",
        option_to_yojson s3_delivery_configuration_to_yojson x.s3_delivery_configuration );
    ]

let delivery_destination_type_to_yojson (x : delivery_destination_type) =
  match x with
  | S3 -> `String "S3"
  | CWL -> `String "CWL"
  | FH -> `String "FH"
  | XRAY -> `String "XRAY"

let resource_type_to_yojson = string_to_yojson
let log_type_to_yojson = string_to_yojson
let service_to_yojson = string_to_yojson

let configuration_template_to_yojson (x : configuration_template) =
  assoc_to_yojson
    [
      ("service", option_to_yojson service_to_yojson x.service);
      ("logType", option_to_yojson log_type_to_yojson x.log_type);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "deliveryDestinationType",
        option_to_yojson delivery_destination_type_to_yojson x.delivery_destination_type );
      ( "defaultDeliveryConfigValues",
        option_to_yojson configuration_template_delivery_config_values_to_yojson
          x.default_delivery_config_values );
      ("allowedFields", option_to_yojson allowed_fields_to_yojson x.allowed_fields);
      ("allowedOutputFormats", option_to_yojson output_formats_to_yojson x.allowed_output_formats);
      ( "allowedActionForAllowVendedLogsDeliveryForResource",
        option_to_yojson allowed_action_for_allow_vended_logs_delivery_for_resource_to_yojson
          x.allowed_action_for_allow_vended_logs_delivery_for_resource );
      ( "allowedFieldDelimiters",
        option_to_yojson allowed_field_delimiters_to_yojson x.allowed_field_delimiters );
      ( "allowedSuffixPathFields",
        option_to_yojson record_fields_to_yojson x.allowed_suffix_path_fields );
      ( "deliverySourceConfiguration",
        option_to_yojson delivery_source_configuration_schemas_to_yojson
          x.delivery_source_configuration );
      ( "s3TablesIntegration",
        option_to_yojson s3_tables_integration_to_yojson x.s3_tables_integration );
    ]

let configuration_templates_to_yojson tree = list_to_yojson configuration_template_to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let target_to_yojson = string_to_yojson

let copy_value_entry_to_yojson (x : copy_value_entry) =
  assoc_to_yojson
    [
      ("source", Some (source_to_yojson x.source));
      ("target", Some (target_to_yojson x.target));
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
    ]

let copy_value_entries_to_yojson tree = list_to_yojson copy_value_entry_to_yojson tree

let copy_value_to_yojson (x : copy_value) =
  assoc_to_yojson [ ("entries", Some (copy_value_entries_to_yojson x.entries)) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let delivery_source_name_to_yojson = string_to_yojson
let delivery_id_to_yojson = string_to_yojson

let delivery_to_yojson (x : delivery) =
  assoc_to_yojson
    [
      ("id", option_to_yojson delivery_id_to_yojson x.id);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("deliverySourceName", option_to_yojson delivery_source_name_to_yojson x.delivery_source_name);
      ("deliveryDestinationArn", option_to_yojson arn_to_yojson x.delivery_destination_arn);
      ( "deliveryDestinationType",
        option_to_yojson delivery_destination_type_to_yojson x.delivery_destination_type );
      ("recordFields", option_to_yojson record_fields_to_yojson x.record_fields);
      ("fieldDelimiter", option_to_yojson field_delimiter_to_yojson x.field_delimiter);
      ( "s3DeliveryConfiguration",
        option_to_yojson s3_delivery_configuration_to_yojson x.s3_delivery_configuration );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_delivery_response_to_yojson (x : create_delivery_response) =
  assoc_to_yojson [ ("delivery", option_to_yojson delivery_to_yojson x.delivery) ]

let create_delivery_request_to_yojson (x : create_delivery_request) =
  assoc_to_yojson
    [
      ("deliverySourceName", Some (delivery_source_name_to_yojson x.delivery_source_name));
      ("deliveryDestinationArn", Some (arn_to_yojson x.delivery_destination_arn));
      ("recordFields", option_to_yojson record_fields_to_yojson x.record_fields);
      ("fieldDelimiter", option_to_yojson field_delimiter_to_yojson x.field_delimiter);
      ( "s3DeliveryConfiguration",
        option_to_yojson s3_delivery_configuration_to_yojson x.s3_delivery_configuration );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let create_export_task_response_to_yojson (x : create_export_task_response) =
  assoc_to_yojson [ ("taskId", option_to_yojson export_task_id_to_yojson x.task_id) ]

let export_destination_prefix_to_yojson = string_to_yojson
let export_destination_bucket_to_yojson = string_to_yojson
let log_stream_name_to_yojson = string_to_yojson
let export_task_name_to_yojson = string_to_yojson

let create_export_task_request_to_yojson (x : create_export_task_request) =
  assoc_to_yojson
    [
      ("taskName", option_to_yojson export_task_name_to_yojson x.task_name);
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("logStreamNamePrefix", option_to_yojson log_stream_name_to_yojson x.log_stream_name_prefix);
      ("from", Some (timestamp_to_yojson x.from_));
      ("to", Some (timestamp_to_yojson x.to_));
      ("destination", Some (export_destination_bucket_to_yojson x.destination));
      ( "destinationPrefix",
        option_to_yojson export_destination_prefix_to_yojson x.destination_prefix );
    ]

let create_import_task_response_to_yojson (x : create_import_task_response) =
  assoc_to_yojson
    [
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
      ("importDestinationArn", option_to_yojson arn_to_yojson x.import_destination_arn);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let import_filter_to_yojson (x : import_filter) =
  assoc_to_yojson
    [
      ("startEventTime", option_to_yojson timestamp_to_yojson x.start_event_time);
      ("endEventTime", option_to_yojson timestamp_to_yojson x.end_event_time);
    ]

let role_arn_to_yojson = string_to_yojson

let create_import_task_request_to_yojson (x : create_import_task_request) =
  assoc_to_yojson
    [
      ("importSourceArn", Some (arn_to_yojson x.import_source_arn));
      ("importRoleArn", Some (role_arn_to_yojson x.import_role_arn));
      ("importFilter", option_to_yojson import_filter_to_yojson x.import_filter);
    ]

let create_log_anomaly_detector_response_to_yojson (x : create_log_anomaly_detector_response) =
  assoc_to_yojson
    [
      ("anomalyDetectorArn", option_to_yojson anomaly_detector_arn_to_yojson x.anomaly_detector_arn);
    ]

let detector_kms_key_arn_to_yojson = string_to_yojson

let create_log_anomaly_detector_request_to_yojson (x : create_log_anomaly_detector_request) =
  assoc_to_yojson
    [
      ("logGroupArnList", Some (log_group_arn_list_to_yojson x.log_group_arn_list));
      ("detectorName", option_to_yojson detector_name_to_yojson x.detector_name);
      ("evaluationFrequency", option_to_yojson evaluation_frequency_to_yojson x.evaluation_frequency);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("kmsKeyId", option_to_yojson detector_kms_key_arn_to_yojson x.kms_key_id);
      ( "anomalyVisibilityTime",
        option_to_yojson anomaly_visibility_time_to_yojson x.anomaly_visibility_time );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let deletion_protection_enabled_to_yojson = bool_to_yojson

let log_group_class_to_yojson (x : log_group_class) =
  match x with
  | STANDARD -> `String "STANDARD"
  | INFREQUENT_ACCESS -> `String "INFREQUENT_ACCESS"
  | DELIVERY -> `String "DELIVERY"

let create_log_group_request_to_yojson (x : create_log_group_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ( "deletionProtectionEnabled",
        option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled );
    ]

let create_log_stream_request_to_yojson (x : create_log_stream_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("logStreamName", Some (log_stream_name_to_yojson x.log_stream_name));
    ]

let create_lookup_table_response_to_yojson (x : create_lookup_table_response) =
  assoc_to_yojson
    [
      ("lookupTableArn", option_to_yojson arn_to_yojson x.lookup_table_arn);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let table_body_to_yojson = string_to_yojson
let lookup_table_description_to_yojson = string_to_yojson
let lookup_table_name_to_yojson = string_to_yojson

let create_lookup_table_request_to_yojson (x : create_lookup_table_request) =
  assoc_to_yojson
    [
      ("lookupTableName", Some (lookup_table_name_to_yojson x.lookup_table_name));
      ("description", option_to_yojson lookup_table_description_to_yojson x.description);
      ("tableBody", Some (table_body_to_yojson x.table_body));
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let scheduled_query_state_to_yojson (x : scheduled_query_state) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let create_scheduled_query_response_to_yojson (x : create_scheduled_query_response) =
  assoc_to_yojson
    [
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
    ]

let s3_uri_to_yojson = string_to_yojson

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("destinationIdentifier", Some (s3_uri_to_yojson x.destination_identifier));
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let destination_configuration_to_yojson (x : destination_configuration) =
  assoc_to_yojson [ ("s3Configuration", Some (s3_configuration_to_yojson x.s3_configuration)) ]

let end_time_offset_to_yojson = long_to_yojson
let start_time_offset_to_yojson = long_to_yojson
let schedule_timezone_to_yojson = string_to_yojson
let schedule_expression_to_yojson = string_to_yojson
let log_group_identifier_to_yojson = string_to_yojson

let scheduled_query_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let query_string_to_yojson = string_to_yojson

let query_language_to_yojson (x : query_language) =
  match x with CWLI -> `String "CWLI" | SQL -> `String "SQL" | PPL -> `String "PPL"

let scheduled_query_description_to_yojson = string_to_yojson
let scheduled_query_name_to_yojson = string_to_yojson

let create_scheduled_query_request_to_yojson (x : create_scheduled_query_request) =
  assoc_to_yojson
    [
      ("name", Some (scheduled_query_name_to_yojson x.name));
      ("description", option_to_yojson scheduled_query_description_to_yojson x.description);
      ("queryLanguage", Some (query_language_to_yojson x.query_language));
      ("queryString", Some (query_string_to_yojson x.query_string));
      ( "logGroupIdentifiers",
        option_to_yojson scheduled_query_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("scheduleExpression", Some (schedule_expression_to_yojson x.schedule_expression));
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("startTimeOffset", option_to_yojson start_time_offset_to_yojson x.start_time_offset);
      ("endTimeOffset", option_to_yojson end_time_offset_to_yojson x.end_time_offset);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("scheduleStartTime", option_to_yojson timestamp_to_yojson x.schedule_start_time);
      ("scheduleEndTime", option_to_yojson timestamp_to_yojson x.schedule_end_time);
      ("executionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let dashboard_viewer_principals_to_yojson tree = list_to_yojson arn_to_yojson tree
let data_to_yojson = blob_to_yojson
let sequence_token_to_yojson = string_to_yojson

let data_already_accepted_exception_to_yojson (x : data_already_accepted_exception) =
  assoc_to_yojson
    [
      ("expectedSequenceToken", option_to_yojson sequence_token_to_yojson x.expected_sequence_token);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let data_protection_policy_document_to_yojson = string_to_yojson

let data_protection_status_to_yojson (x : data_protection_status) =
  match x with
  | ACTIVATED -> `String "ACTIVATED"
  | DELETED -> `String "DELETED"
  | ARCHIVED -> `String "ARCHIVED"
  | DISABLED -> `String "DISABLED"

let data_source_filter_to_yojson (x : data_source_filter) =
  assoc_to_yojson
    [
      ("name", Some (data_source_name_to_yojson x.name));
      ("type", option_to_yojson data_source_type_to_yojson x.type_);
    ]

let data_source_filters_to_yojson tree = list_to_yojson data_source_filter_to_yojson tree
let data_type_to_yojson = string_to_yojson
let locale_to_yojson = string_to_yojson
let target_timezone_to_yojson = string_to_yojson
let source_timezone_to_yojson = string_to_yojson
let match_pattern_to_yojson = string_to_yojson
let match_patterns_to_yojson tree = list_to_yojson match_pattern_to_yojson tree
let target_format_to_yojson = string_to_yojson

let date_time_converter_to_yojson (x : date_time_converter) =
  assoc_to_yojson
    [
      ("source", Some (source_to_yojson x.source));
      ("target", Some (target_to_yojson x.target));
      ("targetFormat", option_to_yojson target_format_to_yojson x.target_format);
      ("matchPatterns", Some (match_patterns_to_yojson x.match_patterns));
      ("sourceTimezone", option_to_yojson source_timezone_to_yojson x.source_timezone);
      ("targetTimezone", option_to_yojson target_timezone_to_yojson x.target_timezone);
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let days_to_yojson = int_to_yojson
let default_value_to_yojson = double_to_yojson

let delete_account_policy_request_to_yojson (x : delete_account_policy_request) =
  assoc_to_yojson
    [
      ("policyName", Some (policy_name_to_yojson x.policy_name));
      ("policyType", Some (policy_type_to_yojson x.policy_type));
    ]

let delete_data_protection_policy_request_to_yojson (x : delete_data_protection_policy_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let delete_delivery_request_to_yojson (x : delete_delivery_request) =
  assoc_to_yojson [ ("id", Some (delivery_id_to_yojson x.id)) ]

let delivery_destination_name_to_yojson = string_to_yojson

let delete_delivery_destination_request_to_yojson (x : delete_delivery_destination_request) =
  assoc_to_yojson [ ("name", Some (delivery_destination_name_to_yojson x.name)) ]

let delete_delivery_destination_policy_request_to_yojson
    (x : delete_delivery_destination_policy_request) =
  assoc_to_yojson
    [
      ( "deliveryDestinationName",
        Some (delivery_destination_name_to_yojson x.delivery_destination_name) );
    ]

let delete_delivery_source_request_to_yojson (x : delete_delivery_source_request) =
  assoc_to_yojson [ ("name", Some (delivery_source_name_to_yojson x.name)) ]

let destination_name_to_yojson = string_to_yojson

let delete_destination_request_to_yojson (x : delete_destination_request) =
  assoc_to_yojson [ ("destinationName", Some (destination_name_to_yojson x.destination_name)) ]

let delete_index_policy_response_to_yojson = unit_to_yojson

let delete_index_policy_request_to_yojson (x : delete_index_policy_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let delete_integration_response_to_yojson = unit_to_yojson
let force_to_yojson = bool_to_yojson
let integration_name_to_yojson = string_to_yojson

let delete_integration_request_to_yojson (x : delete_integration_request) =
  assoc_to_yojson
    [
      ("integrationName", Some (integration_name_to_yojson x.integration_name));
      ("force", option_to_yojson force_to_yojson x.force);
    ]

let with_key_to_yojson = string_to_yojson
let delete_with_keys_to_yojson tree = list_to_yojson with_key_to_yojson tree

let delete_keys_to_yojson (x : delete_keys) =
  assoc_to_yojson [ ("withKeys", Some (delete_with_keys_to_yojson x.with_keys)) ]

let delete_log_anomaly_detector_request_to_yojson (x : delete_log_anomaly_detector_request) =
  assoc_to_yojson
    [ ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn)) ]

let delete_log_group_request_to_yojson (x : delete_log_group_request) =
  assoc_to_yojson [ ("logGroupName", Some (log_group_name_to_yojson x.log_group_name)) ]

let delete_log_stream_request_to_yojson (x : delete_log_stream_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("logStreamName", Some (log_stream_name_to_yojson x.log_stream_name));
    ]

let delete_lookup_table_request_to_yojson (x : delete_lookup_table_request) =
  assoc_to_yojson [ ("lookupTableArn", Some (arn_to_yojson x.lookup_table_arn)) ]

let filter_name_to_yojson = string_to_yojson

let delete_metric_filter_request_to_yojson (x : delete_metric_filter_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("filterName", Some (filter_name_to_yojson x.filter_name));
    ]

let success_to_yojson = bool_to_yojson

let delete_query_definition_response_to_yojson (x : delete_query_definition_response) =
  assoc_to_yojson [ ("success", option_to_yojson success_to_yojson x.success) ]

let query_id_to_yojson = string_to_yojson

let delete_query_definition_request_to_yojson (x : delete_query_definition_request) =
  assoc_to_yojson [ ("queryDefinitionId", Some (query_id_to_yojson x.query_definition_id)) ]

let expected_revision_id_to_yojson = string_to_yojson

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson
    [
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("expectedRevisionId", option_to_yojson expected_revision_id_to_yojson x.expected_revision_id);
    ]

let delete_retention_policy_request_to_yojson (x : delete_retention_policy_request) =
  assoc_to_yojson [ ("logGroupName", Some (log_group_name_to_yojson x.log_group_name)) ]

let delete_scheduled_query_response_to_yojson = unit_to_yojson
let scheduled_query_identifier_to_yojson = string_to_yojson

let delete_scheduled_query_request_to_yojson (x : delete_scheduled_query_request) =
  assoc_to_yojson [ ("identifier", Some (scheduled_query_identifier_to_yojson x.identifier)) ]

let delete_subscription_filter_request_to_yojson (x : delete_subscription_filter_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("filterName", Some (filter_name_to_yojson x.filter_name));
    ]

let vpc_endpoint_id_to_yojson = string_to_yojson

let delete_syslog_configuration_request_to_yojson (x : delete_syslog_configuration_request) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
      ("vpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
    ]

let delete_transformer_request_to_yojson (x : delete_transformer_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let deliveries_to_yojson tree = list_to_yojson delivery_to_yojson tree

let delivery_destination_configuration_to_yojson (x : delivery_destination_configuration) =
  assoc_to_yojson [ ("destinationResourceArn", Some (arn_to_yojson x.destination_resource_arn)) ]

let delivery_destination_to_yojson (x : delivery_destination) =
  assoc_to_yojson
    [
      ("name", option_to_yojson delivery_destination_name_to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ( "deliveryDestinationType",
        option_to_yojson delivery_destination_type_to_yojson x.delivery_destination_type );
      ("outputFormat", option_to_yojson output_format_to_yojson x.output_format);
      ( "deliveryDestinationConfiguration",
        option_to_yojson delivery_destination_configuration_to_yojson
          x.delivery_destination_configuration );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let delivery_destination_policy_to_yojson = string_to_yojson

let delivery_destination_types_to_yojson tree =
  list_to_yojson delivery_destination_type_to_yojson tree

let delivery_destinations_to_yojson tree = list_to_yojson delivery_destination_to_yojson tree

let delivery_source_status_reason_to_yojson (x : delivery_source_status_reason) =
  match x with RESOURCE_DELETED -> `String "RESOURCE_DELETED"

let delivery_source_status_to_yojson (x : delivery_source_status) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let delivery_source_configuration_value_to_yojson = string_to_yojson
let delivery_source_configuration_key_to_yojson = string_to_yojson

let delivery_source_configuration_to_yojson tree =
  map_to_yojson delivery_source_configuration_key_to_yojson
    delivery_source_configuration_value_to_yojson tree

let resource_arns_to_yojson tree = list_to_yojson arn_to_yojson tree

let delivery_source_to_yojson (x : delivery_source) =
  assoc_to_yojson
    [
      ("name", option_to_yojson delivery_source_name_to_yojson x.name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("resourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns);
      ("service", option_to_yojson service_to_yojson x.service);
      ("logType", option_to_yojson log_type_to_yojson x.log_type);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "deliverySourceConfiguration",
        option_to_yojson delivery_source_configuration_to_yojson x.delivery_source_configuration );
      ("status", option_to_yojson delivery_source_status_to_yojson x.status);
      ("statusReason", option_to_yojson delivery_source_status_reason_to_yojson x.status_reason);
    ]

let delivery_sources_to_yojson tree = list_to_yojson delivery_source_to_yojson tree
let descending_to_yojson = bool_to_yojson
let next_token_to_yojson = string_to_yojson

let describe_account_policies_response_to_yojson (x : describe_account_policies_response) =
  assoc_to_yojson
    [
      ("accountPolicies", option_to_yojson account_policies_to_yojson x.account_policies);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_account_policies_request_to_yojson (x : describe_account_policies_request) =
  assoc_to_yojson
    [
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("accountIdentifiers", option_to_yojson account_ids_to_yojson x.account_identifiers);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_configuration_templates_response_to_yojson
    (x : describe_configuration_templates_response) =
  assoc_to_yojson
    [
      ( "configurationTemplates",
        option_to_yojson configuration_templates_to_yojson x.configuration_templates );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_limit_to_yojson = int_to_yojson
let resource_types_to_yojson tree = list_to_yojson resource_type_to_yojson tree
let log_types_to_yojson tree = list_to_yojson log_type_to_yojson tree

let describe_configuration_templates_request_to_yojson
    (x : describe_configuration_templates_request) =
  assoc_to_yojson
    [
      ("service", option_to_yojson service_to_yojson x.service);
      ("logTypes", option_to_yojson log_types_to_yojson x.log_types);
      ("resourceTypes", option_to_yojson resource_types_to_yojson x.resource_types);
      ( "deliveryDestinationTypes",
        option_to_yojson delivery_destination_types_to_yojson x.delivery_destination_types );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
    ]

let describe_deliveries_response_to_yojson (x : describe_deliveries_response) =
  assoc_to_yojson
    [
      ("deliveries", option_to_yojson deliveries_to_yojson x.deliveries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_deliveries_request_to_yojson (x : describe_deliveries_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
    ]

let describe_delivery_destinations_response_to_yojson (x : describe_delivery_destinations_response)
    =
  assoc_to_yojson
    [
      ( "deliveryDestinations",
        option_to_yojson delivery_destinations_to_yojson x.delivery_destinations );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_delivery_destinations_request_to_yojson (x : describe_delivery_destinations_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
    ]

let describe_delivery_sources_response_to_yojson (x : describe_delivery_sources_response) =
  assoc_to_yojson
    [
      ("deliverySources", option_to_yojson delivery_sources_to_yojson x.delivery_sources);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_delivery_sources_request_to_yojson (x : describe_delivery_sources_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
    ]

let target_arn_to_yojson = string_to_yojson

let destination_to_yojson (x : destination) =
  assoc_to_yojson
    [
      ("destinationName", option_to_yojson destination_name_to_yojson x.destination_name);
      ("targetArn", option_to_yojson target_arn_to_yojson x.target_arn);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("accessPolicy", option_to_yojson access_policy_to_yojson x.access_policy);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let destinations_to_yojson tree = list_to_yojson destination_to_yojson tree

let describe_destinations_response_to_yojson (x : describe_destinations_response) =
  assoc_to_yojson
    [
      ("destinations", option_to_yojson destinations_to_yojson x.destinations);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_destinations_request_to_yojson (x : describe_destinations_request) =
  assoc_to_yojson
    [
      ( "DestinationNamePrefix",
        option_to_yojson destination_name_to_yojson x.destination_name_prefix );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
    ]

let export_task_execution_info_to_yojson (x : export_task_execution_info) =
  assoc_to_yojson
    [
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("completionTime", option_to_yojson timestamp_to_yojson x.completion_time);
    ]

let export_task_status_message_to_yojson = string_to_yojson

let export_task_status_code_to_yojson (x : export_task_status_code) =
  match x with
  | CANCELLED -> `String "CANCELLED"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | PENDING -> `String "PENDING"
  | PENDING_CANCEL -> `String "PENDING_CANCEL"
  | RUNNING -> `String "RUNNING"

let export_task_status_to_yojson (x : export_task_status) =
  assoc_to_yojson
    [
      ("code", option_to_yojson export_task_status_code_to_yojson x.code);
      ("message", option_to_yojson export_task_status_message_to_yojson x.message);
    ]

let export_task_to_yojson (x : export_task) =
  assoc_to_yojson
    [
      ("taskId", option_to_yojson export_task_id_to_yojson x.task_id);
      ("taskName", option_to_yojson export_task_name_to_yojson x.task_name);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("from", option_to_yojson timestamp_to_yojson x.from_);
      ("to", option_to_yojson timestamp_to_yojson x.to_);
      ("destination", option_to_yojson export_destination_bucket_to_yojson x.destination);
      ( "destinationPrefix",
        option_to_yojson export_destination_prefix_to_yojson x.destination_prefix );
      ("status", option_to_yojson export_task_status_to_yojson x.status);
      ("executionInfo", option_to_yojson export_task_execution_info_to_yojson x.execution_info);
    ]

let export_tasks_to_yojson tree = list_to_yojson export_task_to_yojson tree

let describe_export_tasks_response_to_yojson (x : describe_export_tasks_response) =
  assoc_to_yojson
    [
      ("exportTasks", option_to_yojson export_tasks_to_yojson x.export_tasks);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_export_tasks_request_to_yojson (x : describe_export_tasks_request) =
  assoc_to_yojson
    [
      ("taskId", option_to_yojson export_task_id_to_yojson x.task_id);
      ("statusCode", option_to_yojson export_task_status_code_to_yojson x.status_code);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
    ]

let index_type_to_yojson (x : index_type) =
  match x with FACET -> `String "FACET" | FIELD_INDEX -> `String "FIELD_INDEX"

let field_index_name_to_yojson = string_to_yojson

let field_index_to_yojson (x : field_index) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("fieldIndexName", option_to_yojson field_index_name_to_yojson x.field_index_name);
      ("lastScanTime", option_to_yojson timestamp_to_yojson x.last_scan_time);
      ("firstEventTime", option_to_yojson timestamp_to_yojson x.first_event_time);
      ("lastEventTime", option_to_yojson timestamp_to_yojson x.last_event_time);
      ("type", option_to_yojson index_type_to_yojson x.type_);
    ]

let field_indexes_to_yojson tree = list_to_yojson field_index_to_yojson tree

let describe_field_indexes_response_to_yojson (x : describe_field_indexes_response) =
  assoc_to_yojson
    [
      ("fieldIndexes", option_to_yojson field_indexes_to_yojson x.field_indexes);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_field_indexes_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let describe_field_indexes_request_to_yojson (x : describe_field_indexes_request) =
  assoc_to_yojson
    [
      ( "logGroupIdentifiers",
        Some (describe_field_indexes_log_group_identifiers_to_yojson x.log_group_identifiers) );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let error_message_to_yojson = string_to_yojson

let import_batch_to_yojson (x : import_batch) =
  assoc_to_yojson
    [
      ("batchId", Some (batch_id_to_yojson x.batch_id));
      ("status", Some (import_status_to_yojson x.status));
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let import_batch_list_to_yojson tree = list_to_yojson import_batch_to_yojson tree

let describe_import_task_batches_response_to_yojson (x : describe_import_task_batches_response) =
  assoc_to_yojson
    [
      ("importSourceArn", option_to_yojson arn_to_yojson x.import_source_arn);
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
      ("importBatches", option_to_yojson import_batch_list_to_yojson x.import_batches);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let import_status_list_to_yojson tree = list_to_yojson import_status_to_yojson tree

let describe_import_task_batches_request_to_yojson (x : describe_import_task_batches_request) =
  assoc_to_yojson
    [
      ("importId", Some (import_id_to_yojson x.import_id));
      ("batchImportStatus", option_to_yojson import_status_list_to_yojson x.batch_import_status);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let import_to_yojson (x : import) =
  assoc_to_yojson
    [
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
      ("importSourceArn", option_to_yojson arn_to_yojson x.import_source_arn);
      ("importStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("importDestinationArn", option_to_yojson arn_to_yojson x.import_destination_arn);
      ("importStatistics", option_to_yojson import_statistics_to_yojson x.import_statistics);
      ("importFilter", option_to_yojson import_filter_to_yojson x.import_filter);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let import_list_to_yojson tree = list_to_yojson import_to_yojson tree

let describe_import_tasks_response_to_yojson (x : describe_import_tasks_response) =
  assoc_to_yojson
    [
      ("imports", option_to_yojson import_list_to_yojson x.imports);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_import_tasks_request_to_yojson (x : describe_import_tasks_request) =
  assoc_to_yojson
    [
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
      ("importStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("importSourceArn", option_to_yojson arn_to_yojson x.import_source_arn);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let index_source_to_yojson (x : index_source) =
  match x with ACCOUNT -> `String "ACCOUNT" | LOG_GROUP -> `String "LOG_GROUP"

let policy_document_to_yojson = string_to_yojson

let index_policy_to_yojson (x : index_policy) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("lastUpdateTime", option_to_yojson timestamp_to_yojson x.last_update_time);
      ("policyDocument", option_to_yojson policy_document_to_yojson x.policy_document);
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("source", option_to_yojson index_source_to_yojson x.source);
    ]

let index_policies_to_yojson tree = list_to_yojson index_policy_to_yojson tree

let describe_index_policies_response_to_yojson (x : describe_index_policies_response) =
  assoc_to_yojson
    [
      ("indexPolicies", option_to_yojson index_policies_to_yojson x.index_policies);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_index_policies_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let describe_index_policies_request_to_yojson (x : describe_index_policies_request) =
  assoc_to_yojson
    [
      ( "logGroupIdentifiers",
        Some (describe_index_policies_log_group_identifiers_to_yojson x.log_group_identifiers) );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let inherited_property_to_yojson (x : inherited_property) =
  match x with ACCOUNT_DATA_PROTECTION -> `String "ACCOUNT_DATA_PROTECTION"

let inherited_properties_to_yojson tree = list_to_yojson inherited_property_to_yojson tree
let filter_count_to_yojson = int_to_yojson

let log_group_to_yojson (x : log_group) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("retentionInDays", option_to_yojson days_to_yojson x.retention_in_days);
      ("metricFilterCount", option_to_yojson filter_count_to_yojson x.metric_filter_count);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("storedBytes", option_to_yojson stored_bytes_to_yojson x.stored_bytes);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "dataProtectionStatus",
        option_to_yojson data_protection_status_to_yojson x.data_protection_status );
      ("inheritedProperties", option_to_yojson inherited_properties_to_yojson x.inherited_properties);
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ("logGroupArn", option_to_yojson arn_to_yojson x.log_group_arn);
      ( "deletionProtectionEnabled",
        option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled );
      ( "bearerTokenAuthenticationEnabled",
        option_to_yojson bearer_token_authentication_enabled_to_yojson
          x.bearer_token_authentication_enabled );
    ]

let log_groups_to_yojson tree = list_to_yojson log_group_to_yojson tree

let describe_log_groups_response_to_yojson (x : describe_log_groups_response) =
  assoc_to_yojson
    [
      ("logGroups", option_to_yojson log_groups_to_yojson x.log_groups);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_log_groups_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let include_linked_accounts_to_yojson = bool_to_yojson
let log_group_name_pattern_to_yojson = string_to_yojson

let describe_log_groups_request_to_yojson (x : describe_log_groups_request) =
  assoc_to_yojson
    [
      ("accountIdentifiers", option_to_yojson account_ids_to_yojson x.account_identifiers);
      ("logGroupNamePrefix", option_to_yojson log_group_name_to_yojson x.log_group_name_prefix);
      ( "logGroupNamePattern",
        option_to_yojson log_group_name_pattern_to_yojson x.log_group_name_pattern );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ( "includeLinkedAccounts",
        option_to_yojson include_linked_accounts_to_yojson x.include_linked_accounts );
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ( "logGroupIdentifiers",
        option_to_yojson describe_log_groups_log_group_identifiers_to_yojson x.log_group_identifiers
      );
    ]

let log_stream_to_yojson (x : log_stream) =
  assoc_to_yojson
    [
      ("logStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("firstEventTimestamp", option_to_yojson timestamp_to_yojson x.first_event_timestamp);
      ("lastEventTimestamp", option_to_yojson timestamp_to_yojson x.last_event_timestamp);
      ("lastIngestionTime", option_to_yojson timestamp_to_yojson x.last_ingestion_time);
      ("uploadSequenceToken", option_to_yojson sequence_token_to_yojson x.upload_sequence_token);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("storedBytes", option_to_yojson stored_bytes_to_yojson x.stored_bytes);
    ]

let log_streams_to_yojson tree = list_to_yojson log_stream_to_yojson tree

let describe_log_streams_response_to_yojson (x : describe_log_streams_response) =
  assoc_to_yojson
    [
      ("logStreams", option_to_yojson log_streams_to_yojson x.log_streams);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let order_by_to_yojson (x : order_by) =
  match x with LogStreamName -> `String "LogStreamName" | LastEventTime -> `String "LastEventTime"

let describe_log_streams_request_to_yojson (x : describe_log_streams_request) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("logStreamNamePrefix", option_to_yojson log_stream_name_to_yojson x.log_stream_name_prefix);
      ("orderBy", option_to_yojson order_by_to_yojson x.order_by);
      ("descending", option_to_yojson descending_to_yojson x.descending);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
    ]

let records_count_to_yojson = long_to_yojson
let string__to_yojson = string_to_yojson
let table_fields_to_yojson tree = list_to_yojson string__to_yojson tree

let lookup_table_to_yojson (x : lookup_table) =
  assoc_to_yojson
    [
      ("lookupTableArn", option_to_yojson arn_to_yojson x.lookup_table_arn);
      ("lookupTableName", option_to_yojson lookup_table_name_to_yojson x.lookup_table_name);
      ("description", option_to_yojson lookup_table_description_to_yojson x.description);
      ("tableFields", option_to_yojson table_fields_to_yojson x.table_fields);
      ("recordsCount", option_to_yojson records_count_to_yojson x.records_count);
      ("sizeBytes", option_to_yojson stored_bytes_to_yojson x.size_bytes);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let lookup_tables_to_yojson tree = list_to_yojson lookup_table_to_yojson tree

let describe_lookup_tables_response_to_yojson (x : describe_lookup_tables_response) =
  assoc_to_yojson
    [
      ("lookupTables", option_to_yojson lookup_tables_to_yojson x.lookup_tables);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_lookup_tables_max_results_to_yojson = int_to_yojson

let describe_lookup_tables_request_to_yojson (x : describe_lookup_tables_request) =
  assoc_to_yojson
    [
      ( "lookupTableNamePrefix",
        option_to_yojson lookup_table_name_to_yojson x.lookup_table_name_prefix );
      ("maxResults", option_to_yojson describe_lookup_tables_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let system_field_to_yojson = string_to_yojson
let emit_system_fields_to_yojson tree = list_to_yojson system_field_to_yojson tree
let field_selection_criteria_to_yojson = string_to_yojson

let standard_unit_to_yojson (x : standard_unit) =
  match x with
  | Seconds -> `String "Seconds"
  | Microseconds -> `String "Microseconds"
  | Milliseconds -> `String "Milliseconds"
  | Bytes -> `String "Bytes"
  | Kilobytes -> `String "Kilobytes"
  | Megabytes -> `String "Megabytes"
  | Gigabytes -> `String "Gigabytes"
  | Terabytes -> `String "Terabytes"
  | Bits -> `String "Bits"
  | Kilobits -> `String "Kilobits"
  | Megabits -> `String "Megabits"
  | Gigabits -> `String "Gigabits"
  | Terabits -> `String "Terabits"
  | Percent -> `String "Percent"
  | Count -> `String "Count"
  | BytesSecond -> `String "Bytes/Second"
  | KilobytesSecond -> `String "Kilobytes/Second"
  | MegabytesSecond -> `String "Megabytes/Second"
  | GigabytesSecond -> `String "Gigabytes/Second"
  | TerabytesSecond -> `String "Terabytes/Second"
  | BitsSecond -> `String "Bits/Second"
  | KilobitsSecond -> `String "Kilobits/Second"
  | MegabitsSecond -> `String "Megabits/Second"
  | GigabitsSecond -> `String "Gigabits/Second"
  | TerabitsSecond -> `String "Terabits/Second"
  | CountSecond -> `String "Count/Second"
  | None_ -> `String "None"

let dimensions_value_to_yojson = string_to_yojson
let dimensions_key_to_yojson = string_to_yojson

let dimensions_to_yojson tree =
  map_to_yojson dimensions_key_to_yojson dimensions_value_to_yojson tree

let metric_value_to_yojson = string_to_yojson
let metric_namespace_to_yojson = string_to_yojson
let metric_name_to_yojson = string_to_yojson

let metric_transformation_to_yojson (x : metric_transformation) =
  assoc_to_yojson
    [
      ("metricName", Some (metric_name_to_yojson x.metric_name));
      ("metricNamespace", Some (metric_namespace_to_yojson x.metric_namespace));
      ("metricValue", Some (metric_value_to_yojson x.metric_value));
      ("defaultValue", option_to_yojson default_value_to_yojson x.default_value);
      ("dimensions", option_to_yojson dimensions_to_yojson x.dimensions);
      ("unit", option_to_yojson standard_unit_to_yojson x.unit_);
    ]

let metric_transformations_to_yojson tree = list_to_yojson metric_transformation_to_yojson tree

let metric_filter_to_yojson (x : metric_filter) =
  assoc_to_yojson
    [
      ("filterName", option_to_yojson filter_name_to_yojson x.filter_name);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ( "metricTransformations",
        option_to_yojson metric_transformations_to_yojson x.metric_transformations );
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ( "applyOnTransformedLogs",
        option_to_yojson apply_on_transformed_logs_to_yojson x.apply_on_transformed_logs );
      ( "fieldSelectionCriteria",
        option_to_yojson field_selection_criteria_to_yojson x.field_selection_criteria );
      ( "emitSystemFieldDimensions",
        option_to_yojson emit_system_fields_to_yojson x.emit_system_field_dimensions );
    ]

let metric_filters_to_yojson tree = list_to_yojson metric_filter_to_yojson tree

let describe_metric_filters_response_to_yojson (x : describe_metric_filters_response) =
  assoc_to_yojson
    [
      ("metricFilters", option_to_yojson metric_filters_to_yojson x.metric_filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_metric_filters_request_to_yojson (x : describe_metric_filters_request) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("filterNamePrefix", option_to_yojson filter_name_to_yojson x.filter_name_prefix);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("metricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("metricNamespace", option_to_yojson metric_namespace_to_yojson x.metric_namespace);
    ]

let user_identity_to_yojson = string_to_yojson
let query_duration_to_yojson = long_to_yojson

let query_status_to_yojson (x : query_status) =
  match x with
  | Scheduled -> `String "Scheduled"
  | Running -> `String "Running"
  | Complete -> `String "Complete"
  | Failed -> `String "Failed"
  | Cancelled -> `String "Cancelled"
  | Timeout -> `String "Timeout"
  | Unknown -> `String "Unknown"

let query_info_to_yojson (x : query_info) =
  assoc_to_yojson
    [
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("queryId", option_to_yojson query_id_to_yojson x.query_id);
      ("queryString", option_to_yojson query_string_to_yojson x.query_string);
      ("status", option_to_yojson query_status_to_yojson x.status);
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("queryDuration", option_to_yojson query_duration_to_yojson x.query_duration);
      ("bytesScanned", option_to_yojson bytes_scanned_value_to_yojson x.bytes_scanned);
      ("userIdentity", option_to_yojson user_identity_to_yojson x.user_identity);
    ]

let query_info_list_to_yojson tree = list_to_yojson query_info_to_yojson tree

let describe_queries_response_to_yojson (x : describe_queries_response) =
  assoc_to_yojson
    [
      ("queries", option_to_yojson query_info_list_to_yojson x.queries);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_queries_max_results_to_yojson = int_to_yojson

let describe_queries_request_to_yojson (x : describe_queries_request) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("status", option_to_yojson query_status_to_yojson x.status);
      ("maxResults", option_to_yojson describe_queries_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
    ]

let query_parameter_description_to_yojson = string_to_yojson
let query_parameter_default_value_to_yojson = string_to_yojson
let query_parameter_name_to_yojson = string_to_yojson

let query_parameter_to_yojson (x : query_parameter) =
  assoc_to_yojson
    [
      ("name", Some (query_parameter_name_to_yojson x.name));
      ("defaultValue", option_to_yojson query_parameter_default_value_to_yojson x.default_value);
      ("description", option_to_yojson query_parameter_description_to_yojson x.description);
    ]

let query_parameter_list_to_yojson tree = list_to_yojson query_parameter_to_yojson tree
let log_group_names_to_yojson tree = list_to_yojson log_group_name_to_yojson tree
let query_definition_string_to_yojson = string_to_yojson
let query_definition_name_to_yojson = string_to_yojson

let query_definition_to_yojson (x : query_definition) =
  assoc_to_yojson
    [
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("queryDefinitionId", option_to_yojson query_id_to_yojson x.query_definition_id);
      ("name", option_to_yojson query_definition_name_to_yojson x.name);
      ("queryString", option_to_yojson query_definition_string_to_yojson x.query_string);
      ("lastModified", option_to_yojson timestamp_to_yojson x.last_modified);
      ("logGroupNames", option_to_yojson log_group_names_to_yojson x.log_group_names);
      ("parameters", option_to_yojson query_parameter_list_to_yojson x.parameters);
    ]

let query_definition_list_to_yojson tree = list_to_yojson query_definition_to_yojson tree

let describe_query_definitions_response_to_yojson (x : describe_query_definitions_response) =
  assoc_to_yojson
    [
      ("queryDefinitions", option_to_yojson query_definition_list_to_yojson x.query_definitions);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let query_list_max_results_to_yojson = int_to_yojson

let describe_query_definitions_request_to_yojson (x : describe_query_definitions_request) =
  assoc_to_yojson
    [
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ( "queryDefinitionNamePrefix",
        option_to_yojson query_definition_name_to_yojson x.query_definition_name_prefix );
      ("maxResults", option_to_yojson query_list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let policy_scope_to_yojson (x : policy_scope) =
  match x with ACCOUNT -> `String "ACCOUNT" | RESOURCE -> `String "RESOURCE"

let resource_policy_to_yojson (x : resource_policy) =
  assoc_to_yojson
    [
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("policyDocument", option_to_yojson policy_document_to_yojson x.policy_document);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("policyScope", option_to_yojson policy_scope_to_yojson x.policy_scope);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("revisionId", option_to_yojson expected_revision_id_to_yojson x.revision_id);
    ]

let resource_policies_to_yojson tree = list_to_yojson resource_policy_to_yojson tree

let describe_resource_policies_response_to_yojson (x : describe_resource_policies_response) =
  assoc_to_yojson
    [
      ("resourcePolicies", option_to_yojson resource_policies_to_yojson x.resource_policies);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_resource_policies_request_to_yojson (x : describe_resource_policies_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("policyScope", option_to_yojson policy_scope_to_yojson x.policy_scope);
    ]

let distribution_to_yojson (x : distribution) =
  match x with Random -> `String "Random" | ByLogStream -> `String "ByLogStream"

let destination_arn_to_yojson = string_to_yojson

let subscription_filter_to_yojson (x : subscription_filter) =
  assoc_to_yojson
    [
      ("filterName", option_to_yojson filter_name_to_yojson x.filter_name);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("destinationArn", option_to_yojson destination_arn_to_yojson x.destination_arn);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("distribution", option_to_yojson distribution_to_yojson x.distribution);
      ( "applyOnTransformedLogs",
        option_to_yojson apply_on_transformed_logs_to_yojson x.apply_on_transformed_logs );
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "fieldSelectionCriteria",
        option_to_yojson field_selection_criteria_to_yojson x.field_selection_criteria );
      ("emitSystemFields", option_to_yojson emit_system_fields_to_yojson x.emit_system_fields);
    ]

let subscription_filters_to_yojson tree = list_to_yojson subscription_filter_to_yojson tree

let describe_subscription_filters_response_to_yojson (x : describe_subscription_filters_response) =
  assoc_to_yojson
    [
      ("subscriptionFilters", option_to_yojson subscription_filters_to_yojson x.subscription_filters);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_subscription_filters_request_to_yojson (x : describe_subscription_filters_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("filterNamePrefix", option_to_yojson filter_name_to_yojson x.filter_name_prefix);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
    ]

let disassociate_kms_key_request_to_yojson (x : disassociate_kms_key_request) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("resourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
    ]

let disassociate_source_from_s3_table_integration_response_to_yojson
    (x : disassociate_source_from_s3_table_integration_response) =
  assoc_to_yojson
    [
      ("identifier", option_to_yojson s3_table_integration_source_identifier_to_yojson x.identifier);
    ]

let disassociate_source_from_s3_table_integration_request_to_yojson
    (x : disassociate_source_from_s3_table_integration_request) =
  assoc_to_yojson
    [ ("identifier", Some (s3_table_integration_source_identifier_to_yojson x.identifier)) ]

let encryption_key_to_yojson = string_to_yojson
let entity_attributes_value_to_yojson = string_to_yojson
let entity_attributes_key_to_yojson = string_to_yojson

let entity_attributes_to_yojson tree =
  map_to_yojson entity_attributes_key_to_yojson entity_attributes_value_to_yojson tree

let entity_key_attributes_value_to_yojson = string_to_yojson
let entity_key_attributes_key_to_yojson = string_to_yojson

let entity_key_attributes_to_yojson tree =
  map_to_yojson entity_key_attributes_key_to_yojson entity_key_attributes_value_to_yojson tree

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("keyAttributes", option_to_yojson entity_key_attributes_to_yojson x.key_attributes);
      ("attributes", option_to_yojson entity_attributes_to_yojson x.attributes);
    ]

let entity_rejection_error_type_to_yojson (x : entity_rejection_error_type) =
  match x with
  | INVALID_ENTITY -> `String "InvalidEntity"
  | INVALID_TYPE_VALUE -> `String "InvalidTypeValue"
  | INVALID_KEY_ATTRIBUTE -> `String "InvalidKeyAttributes"
  | INVALID_ATTRIBUTES -> `String "InvalidAttributes"
  | ENTITY_SIZE_TOO_LARGE -> `String "EntitySizeTooLarge"
  | UNSUPPORTED_LOG_GROUP_TYPE -> `String "UnsupportedLogGroupType"
  | MISSING_REQUIRED_FIELDS -> `String "MissingRequiredFields"

let event_id_to_yojson = string_to_yojson
let event_number_to_yojson = long_to_yojson

let event_source_to_yojson (x : event_source) =
  match x with
  | CLOUD_TRAIL -> `String "CloudTrail"
  | ROUTE53_RESOLVER -> `String "Route53Resolver"
  | VPC_FLOW -> `String "VPCFlow"
  | EKS_AUDIT -> `String "EKSAudit"
  | AWSWAF -> `String "AWSWAF"

let events_limit_to_yojson = int_to_yojson
let events_limit_start_query_to_yojson = int_to_yojson

let execution_status_to_yojson (x : execution_status) =
  match x with
  | Running -> `String "Running"
  | InvalidQuery -> `String "InvalidQuery"
  | Complete -> `String "Complete"
  | Failed -> `String "Failed"
  | Timeout -> `String "Timeout"

let execution_status_list_to_yojson tree = list_to_yojson execution_status_to_yojson tree
let value_to_yojson = string_to_yojson
let token_to_yojson = string_to_yojson
let extracted_values_to_yojson tree = map_to_yojson token_to_yojson value_to_yojson tree
let field_to_yojson = string_to_yojson
let field_index_names_to_yojson tree = list_to_yojson field_index_name_to_yojson tree

let fields_data_to_yojson (x : fields_data) =
  assoc_to_yojson [ ("data", option_to_yojson data_to_yojson x.data) ]

let log_stream_searched_completely_to_yojson = bool_to_yojson

let searched_log_stream_to_yojson (x : searched_log_stream) =
  assoc_to_yojson
    [
      ("logStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
      ( "searchedCompletely",
        option_to_yojson log_stream_searched_completely_to_yojson x.searched_completely );
    ]

let searched_log_streams_to_yojson tree = list_to_yojson searched_log_stream_to_yojson tree

let filtered_log_event_to_yojson (x : filtered_log_event) =
  assoc_to_yojson
    [
      ("logStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("message", option_to_yojson event_message_to_yojson x.message);
      ("ingestionTime", option_to_yojson timestamp_to_yojson x.ingestion_time);
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
    ]

let filtered_log_events_to_yojson tree = list_to_yojson filtered_log_event_to_yojson tree

let filter_log_events_response_to_yojson (x : filter_log_events_response) =
  assoc_to_yojson
    [
      ("events", option_to_yojson filtered_log_events_to_yojson x.events);
      ("searchedLogStreams", option_to_yojson searched_log_streams_to_yojson x.searched_log_streams);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let unmask_to_yojson = bool_to_yojson
let interleaved_to_yojson = bool_to_yojson
let start_from_head_to_yojson = bool_to_yojson
let input_log_stream_names_to_yojson tree = list_to_yojson log_stream_name_to_yojson tree

let filter_log_events_request_to_yojson (x : filter_log_events_request) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("logStreamNames", option_to_yojson input_log_stream_names_to_yojson x.log_stream_names);
      ("logStreamNamePrefix", option_to_yojson log_stream_name_to_yojson x.log_stream_name_prefix);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson events_limit_to_yojson x.limit);
      ("startFromHead", option_to_yojson start_from_head_to_yojson x.start_from_head);
      ("interleaved", option_to_yojson interleaved_to_yojson x.interleaved);
      ("unmask", option_to_yojson unmask_to_yojson x.unmask);
    ]

let flatten_to_yojson = bool_to_yojson

let flattened_element_to_yojson (x : flattened_element) =
  match x with FIRST -> `String "first" | LAST -> `String "last"

let force_update_to_yojson = bool_to_yojson
let from_key_to_yojson = string_to_yojson

let get_data_protection_policy_response_to_yojson (x : get_data_protection_policy_response) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ( "policyDocument",
        option_to_yojson data_protection_policy_document_to_yojson x.policy_document );
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let get_data_protection_policy_request_to_yojson (x : get_data_protection_policy_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let get_delivery_response_to_yojson (x : get_delivery_response) =
  assoc_to_yojson [ ("delivery", option_to_yojson delivery_to_yojson x.delivery) ]

let get_delivery_request_to_yojson (x : get_delivery_request) =
  assoc_to_yojson [ ("id", Some (delivery_id_to_yojson x.id)) ]

let get_delivery_destination_response_to_yojson (x : get_delivery_destination_response) =
  assoc_to_yojson
    [
      ("deliveryDestination", option_to_yojson delivery_destination_to_yojson x.delivery_destination);
    ]

let get_delivery_destination_request_to_yojson (x : get_delivery_destination_request) =
  assoc_to_yojson [ ("name", Some (delivery_destination_name_to_yojson x.name)) ]

let policy_to_yojson (x : policy) =
  assoc_to_yojson
    [
      ( "deliveryDestinationPolicy",
        option_to_yojson delivery_destination_policy_to_yojson x.delivery_destination_policy );
    ]

let get_delivery_destination_policy_response_to_yojson
    (x : get_delivery_destination_policy_response) =
  assoc_to_yojson [ ("policy", option_to_yojson policy_to_yojson x.policy) ]

let get_delivery_destination_policy_request_to_yojson (x : get_delivery_destination_policy_request)
    =
  assoc_to_yojson
    [
      ( "deliveryDestinationName",
        Some (delivery_destination_name_to_yojson x.delivery_destination_name) );
    ]

let get_delivery_source_response_to_yojson (x : get_delivery_source_response) =
  assoc_to_yojson
    [ ("deliverySource", option_to_yojson delivery_source_to_yojson x.delivery_source) ]

let get_delivery_source_request_to_yojson (x : get_delivery_source_request) =
  assoc_to_yojson [ ("name", Some (delivery_source_name_to_yojson x.name)) ]

let integration_status_message_to_yojson = string_to_yojson

let open_search_resource_status_type_to_yojson (x : open_search_resource_status_type) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | NOT_FOUND -> `String "NOT_FOUND"
  | ERROR -> `String "ERROR"

let open_search_resource_status_to_yojson (x : open_search_resource_status) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_type_to_yojson x.status);
      ("statusMessage", option_to_yojson integration_status_message_to_yojson x.status_message);
    ]

let open_search_policy_name_to_yojson = string_to_yojson

let open_search_lifecycle_policy_to_yojson (x : open_search_lifecycle_policy) =
  assoc_to_yojson
    [
      ("policyName", option_to_yojson open_search_policy_name_to_yojson x.policy_name);
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
    ]

let open_search_data_access_policy_to_yojson (x : open_search_data_access_policy) =
  assoc_to_yojson
    [
      ("policyName", option_to_yojson open_search_policy_name_to_yojson x.policy_name);
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
    ]

let open_search_network_policy_to_yojson (x : open_search_network_policy) =
  assoc_to_yojson
    [
      ("policyName", option_to_yojson open_search_policy_name_to_yojson x.policy_name);
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
    ]

let open_search_encryption_policy_to_yojson (x : open_search_encryption_policy) =
  assoc_to_yojson
    [
      ("policyName", option_to_yojson open_search_policy_name_to_yojson x.policy_name);
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
    ]

let open_search_workspace_id_to_yojson = string_to_yojson

let open_search_workspace_to_yojson (x : open_search_workspace) =
  assoc_to_yojson
    [
      ("workspaceId", option_to_yojson open_search_workspace_id_to_yojson x.workspace_id);
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
    ]

let open_search_collection_endpoint_to_yojson = string_to_yojson

let open_search_collection_to_yojson (x : open_search_collection) =
  assoc_to_yojson
    [
      ( "collectionEndpoint",
        option_to_yojson open_search_collection_endpoint_to_yojson x.collection_endpoint );
      ("collectionArn", option_to_yojson arn_to_yojson x.collection_arn);
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
    ]

let open_search_application_id_to_yojson = string_to_yojson
let open_search_application_endpoint_to_yojson = string_to_yojson

let open_search_application_to_yojson (x : open_search_application) =
  assoc_to_yojson
    [
      ( "applicationEndpoint",
        option_to_yojson open_search_application_endpoint_to_yojson x.application_endpoint );
      ("applicationArn", option_to_yojson arn_to_yojson x.application_arn);
      ("applicationId", option_to_yojson open_search_application_id_to_yojson x.application_id);
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
    ]

let open_search_data_source_name_to_yojson = string_to_yojson

let open_search_data_source_to_yojson (x : open_search_data_source) =
  assoc_to_yojson
    [
      ("dataSourceName", option_to_yojson open_search_data_source_name_to_yojson x.data_source_name);
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
    ]

let open_search_integration_details_to_yojson (x : open_search_integration_details) =
  assoc_to_yojson
    [
      ("dataSource", option_to_yojson open_search_data_source_to_yojson x.data_source);
      ("application", option_to_yojson open_search_application_to_yojson x.application);
      ("collection", option_to_yojson open_search_collection_to_yojson x.collection);
      ("workspace", option_to_yojson open_search_workspace_to_yojson x.workspace);
      ( "encryptionPolicy",
        option_to_yojson open_search_encryption_policy_to_yojson x.encryption_policy );
      ("networkPolicy", option_to_yojson open_search_network_policy_to_yojson x.network_policy);
      ("accessPolicy", option_to_yojson open_search_data_access_policy_to_yojson x.access_policy);
      ("lifecyclePolicy", option_to_yojson open_search_lifecycle_policy_to_yojson x.lifecycle_policy);
    ]

let integration_details_to_yojson (x : integration_details) =
  match x with
  | OpenSearchIntegrationDetails arg ->
      assoc_to_yojson
        [ ("openSearchIntegrationDetails", Some (open_search_integration_details_to_yojson arg)) ]

let integration_status_to_yojson (x : integration_status) =
  match x with
  | PROVISIONING -> `String "PROVISIONING"
  | ACTIVE -> `String "ACTIVE"
  | FAILED -> `String "FAILED"

let integration_type_to_yojson (x : integration_type) =
  match x with OPENSEARCH -> `String "OPENSEARCH"

let get_integration_response_to_yojson (x : get_integration_response) =
  assoc_to_yojson
    [
      ("integrationName", option_to_yojson integration_name_to_yojson x.integration_name);
      ("integrationType", option_to_yojson integration_type_to_yojson x.integration_type);
      ("integrationStatus", option_to_yojson integration_status_to_yojson x.integration_status);
      ("integrationDetails", option_to_yojson integration_details_to_yojson x.integration_details);
    ]

let get_integration_request_to_yojson (x : get_integration_request) =
  assoc_to_yojson [ ("integrationName", Some (integration_name_to_yojson x.integration_name)) ]

let get_log_anomaly_detector_response_to_yojson (x : get_log_anomaly_detector_response) =
  assoc_to_yojson
    [
      ("detectorName", option_to_yojson detector_name_to_yojson x.detector_name);
      ("logGroupArnList", option_to_yojson log_group_arn_list_to_yojson x.log_group_arn_list);
      ("evaluationFrequency", option_to_yojson evaluation_frequency_to_yojson x.evaluation_frequency);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ( "anomalyDetectorStatus",
        option_to_yojson anomaly_detector_status_to_yojson x.anomaly_detector_status );
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("creationTimeStamp", option_to_yojson epoch_millis_to_yojson x.creation_time_stamp);
      ("lastModifiedTimeStamp", option_to_yojson epoch_millis_to_yojson x.last_modified_time_stamp);
      ( "anomalyVisibilityTime",
        option_to_yojson anomaly_visibility_time_to_yojson x.anomaly_visibility_time );
    ]

let get_log_anomaly_detector_request_to_yojson (x : get_log_anomaly_detector_request) =
  assoc_to_yojson
    [ ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn)) ]

let output_log_event_to_yojson (x : output_log_event) =
  assoc_to_yojson
    [
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("message", option_to_yojson event_message_to_yojson x.message);
      ("ingestionTime", option_to_yojson timestamp_to_yojson x.ingestion_time);
    ]

let output_log_events_to_yojson tree = list_to_yojson output_log_event_to_yojson tree

let get_log_events_response_to_yojson (x : get_log_events_response) =
  assoc_to_yojson
    [
      ("events", option_to_yojson output_log_events_to_yojson x.events);
      ("nextForwardToken", option_to_yojson next_token_to_yojson x.next_forward_token);
      ("nextBackwardToken", option_to_yojson next_token_to_yojson x.next_backward_token);
    ]

let get_log_events_request_to_yojson (x : get_log_events_request) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("logStreamName", Some (log_stream_name_to_yojson x.log_stream_name));
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson events_limit_to_yojson x.limit);
      ("startFromHead", option_to_yojson start_from_head_to_yojson x.start_from_head);
      ("unmask", option_to_yojson unmask_to_yojson x.unmask);
    ]

let log_field_name_to_yojson = string_to_yojson

let rec log_fields_list_item_to_yojson (x : log_fields_list_item) =
  assoc_to_yojson
    [
      ("logFieldName", option_to_yojson log_field_name_to_yojson x.log_field_name);
      ("logFieldType", option_to_yojson log_field_type_to_yojson x.log_field_type);
    ]

and log_fields_list_to_yojson tree = list_to_yojson log_fields_list_item_to_yojson tree

and log_field_type_to_yojson (x : log_field_type) =
  assoc_to_yojson
    [
      ("type", option_to_yojson data_type_to_yojson x.type_);
      ("element", option_to_yojson log_field_type_to_yojson x.element);
      ("fields", option_to_yojson log_fields_list_to_yojson x.fields);
    ]

let get_log_fields_response_to_yojson (x : get_log_fields_response) =
  assoc_to_yojson [ ("logFields", option_to_yojson log_fields_list_to_yojson x.log_fields) ]

let get_log_fields_request_to_yojson (x : get_log_fields_request) =
  assoc_to_yojson
    [
      ("dataSourceName", Some (data_source_name_to_yojson x.data_source_name));
      ("dataSourceType", Some (data_source_type_to_yojson x.data_source_type));
    ]

let percentage_to_yojson = int_to_yojson

let log_group_field_to_yojson (x : log_group_field) =
  assoc_to_yojson
    [
      ("name", option_to_yojson field_to_yojson x.name);
      ("percent", option_to_yojson percentage_to_yojson x.percent);
    ]

let log_group_field_list_to_yojson tree = list_to_yojson log_group_field_to_yojson tree

let get_log_group_fields_response_to_yojson (x : get_log_group_fields_response) =
  assoc_to_yojson
    [ ("logGroupFields", option_to_yojson log_group_field_list_to_yojson x.log_group_fields) ]

let get_log_group_fields_request_to_yojson (x : get_log_group_fields_request) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("time", option_to_yojson timestamp_to_yojson x.time);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
    ]

let internal_streaming_exception_to_yojson (x : internal_streaming_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_log_object_response_stream_to_yojson (x : get_log_object_response_stream) =
  match x with
  | Fields arg -> assoc_to_yojson [ ("fields", Some (fields_data_to_yojson arg)) ]
  | InternalStreamingException arg ->
      assoc_to_yojson
        [ ("InternalStreamingException", Some (internal_streaming_exception_to_yojson arg)) ]

let get_log_object_response_to_yojson (x : get_log_object_response) =
  assoc_to_yojson
    [ ("fieldStream", option_to_yojson get_log_object_response_stream_to_yojson x.field_stream) ]

let log_object_pointer_to_yojson = string_to_yojson

let get_log_object_request_to_yojson (x : get_log_object_request) =
  assoc_to_yojson
    [
      ("unmask", option_to_yojson unmask_to_yojson x.unmask);
      ("logObjectPointer", Some (log_object_pointer_to_yojson x.log_object_pointer));
    ]

let log_record_to_yojson tree = map_to_yojson field_to_yojson value_to_yojson tree

let get_log_record_response_to_yojson (x : get_log_record_response) =
  assoc_to_yojson [ ("logRecord", option_to_yojson log_record_to_yojson x.log_record) ]

let log_record_pointer_to_yojson = string_to_yojson

let get_log_record_request_to_yojson (x : get_log_record_request) =
  assoc_to_yojson
    [
      ("logRecordPointer", Some (log_record_pointer_to_yojson x.log_record_pointer));
      ("unmask", option_to_yojson unmask_to_yojson x.unmask);
    ]

let get_lookup_table_response_to_yojson (x : get_lookup_table_response) =
  assoc_to_yojson
    [
      ("lookupTableArn", option_to_yojson arn_to_yojson x.lookup_table_arn);
      ("lookupTableName", option_to_yojson lookup_table_name_to_yojson x.lookup_table_name);
      ("description", option_to_yojson lookup_table_description_to_yojson x.description);
      ("tableBody", option_to_yojson table_body_to_yojson x.table_body);
      ("sizeBytes", option_to_yojson stored_bytes_to_yojson x.size_bytes);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let get_lookup_table_request_to_yojson (x : get_lookup_table_request) =
  assoc_to_yojson [ ("lookupTableArn", Some (arn_to_yojson x.lookup_table_arn)) ]

let get_query_results_next_token_to_yojson = string_to_yojson
let stats_value_to_yojson = double_to_yojson

let query_statistics_to_yojson (x : query_statistics) =
  assoc_to_yojson
    [
      ("recordsMatched", option_to_yojson stats_value_to_yojson x.records_matched);
      ("recordsScanned", option_to_yojson stats_value_to_yojson x.records_scanned);
      ("estimatedRecordsSkipped", option_to_yojson stats_value_to_yojson x.estimated_records_skipped);
      ("bytesScanned", option_to_yojson stats_value_to_yojson x.bytes_scanned);
      ("estimatedBytesSkipped", option_to_yojson stats_value_to_yojson x.estimated_bytes_skipped);
      ("logGroupsScanned", option_to_yojson stats_value_to_yojson x.log_groups_scanned);
    ]

let result_field_to_yojson (x : result_field) =
  assoc_to_yojson
    [
      ("field", option_to_yojson field_to_yojson x.field);
      ("value", option_to_yojson value_to_yojson x.value);
    ]

let result_rows_to_yojson tree = list_to_yojson result_field_to_yojson tree
let query_results_to_yojson tree = list_to_yojson result_rows_to_yojson tree

let get_query_results_response_to_yojson (x : get_query_results_response) =
  assoc_to_yojson
    [
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("results", option_to_yojson query_results_to_yojson x.results);
      ("statistics", option_to_yojson query_statistics_to_yojson x.statistics);
      ("status", option_to_yojson query_status_to_yojson x.status);
      ("encryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("nextToken", option_to_yojson get_query_results_next_token_to_yojson x.next_token);
    ]

let get_query_results_max_items_to_yojson = int_to_yojson

let get_query_results_request_to_yojson (x : get_query_results_request) =
  assoc_to_yojson
    [
      ("queryId", Some (query_id_to_yojson x.query_id));
      ("nextToken", option_to_yojson get_query_results_next_token_to_yojson x.next_token);
      ("maxItems", option_to_yojson get_query_results_max_items_to_yojson x.max_items);
    ]

let schedule_type_to_yojson (x : schedule_type) =
  match x with
  | CUSTOMER_MANAGED -> `String "CUSTOMER_MANAGED"
  | AWS_MANAGED -> `String "AWS_MANAGED"

let get_scheduled_query_response_to_yojson (x : get_scheduled_query_response) =
  assoc_to_yojson
    [
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
      ("name", option_to_yojson scheduled_query_name_to_yojson x.name);
      ("description", option_to_yojson scheduled_query_description_to_yojson x.description);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("queryString", option_to_yojson query_string_to_yojson x.query_string);
      ( "logGroupIdentifiers",
        option_to_yojson scheduled_query_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("scheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("startTimeOffset", option_to_yojson start_time_offset_to_yojson x.start_time_offset);
      ("endTimeOffset", option_to_yojson end_time_offset_to_yojson x.end_time_offset);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("scheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ("lastTriggeredTime", option_to_yojson timestamp_to_yojson x.last_triggered_time);
      ("lastExecutionStatus", option_to_yojson execution_status_to_yojson x.last_execution_status);
      ("scheduleStartTime", option_to_yojson timestamp_to_yojson x.schedule_start_time);
      ("scheduleEndTime", option_to_yojson timestamp_to_yojson x.schedule_end_time);
      ("executionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let get_scheduled_query_request_to_yojson (x : get_scheduled_query_request) =
  assoc_to_yojson [ ("identifier", Some (scheduled_query_identifier_to_yojson x.identifier)) ]

let scheduled_query_destination_type_to_yojson (x : scheduled_query_destination_type) =
  match x with S3 -> `String "S3"

let scheduled_query_destination_to_yojson (x : scheduled_query_destination) =
  assoc_to_yojson
    [
      ( "destinationType",
        option_to_yojson scheduled_query_destination_type_to_yojson x.destination_type );
      ("destinationIdentifier", option_to_yojson string__to_yojson x.destination_identifier);
      ("status", option_to_yojson action_status_to_yojson x.status);
      ("processedIdentifier", option_to_yojson string__to_yojson x.processed_identifier);
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let scheduled_query_destination_list_to_yojson tree =
  list_to_yojson scheduled_query_destination_to_yojson tree

let trigger_history_record_to_yojson (x : trigger_history_record) =
  assoc_to_yojson
    [
      ("queryId", option_to_yojson query_id_to_yojson x.query_id);
      ("executionStatus", option_to_yojson execution_status_to_yojson x.execution_status);
      ("triggeredTimestamp", option_to_yojson timestamp_to_yojson x.triggered_timestamp);
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
      ("destinations", option_to_yojson scheduled_query_destination_list_to_yojson x.destinations);
    ]

let trigger_history_record_list_to_yojson tree =
  list_to_yojson trigger_history_record_to_yojson tree

let get_scheduled_query_history_response_to_yojson (x : get_scheduled_query_history_response) =
  assoc_to_yojson
    [
      ("name", option_to_yojson scheduled_query_name_to_yojson x.name);
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
      ("triggerHistory", option_to_yojson trigger_history_record_list_to_yojson x.trigger_history);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_scheduled_query_history_max_results_to_yojson = int_to_yojson

let get_scheduled_query_history_request_to_yojson (x : get_scheduled_query_history_request) =
  assoc_to_yojson
    [
      ("identifier", Some (scheduled_query_identifier_to_yojson x.identifier));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("executionStatuses", option_to_yojson execution_status_list_to_yojson x.execution_statuses);
      ( "maxResults",
        option_to_yojson get_scheduled_query_history_max_results_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let upper_case_string_with_keys_to_yojson tree = list_to_yojson with_key_to_yojson tree

let upper_case_string_to_yojson (x : upper_case_string) =
  assoc_to_yojson [ ("withKeys", Some (upper_case_string_with_keys_to_yojson x.with_keys)) ]

let type__to_yojson (x : type_) =
  match x with
  | BOOLEAN -> `String "boolean"
  | INTEGER -> `String "integer"
  | DOUBLE -> `String "double"
  | STRING -> `String "string"

let type_converter_entry_to_yojson (x : type_converter_entry) =
  assoc_to_yojson [ ("key", Some (key_to_yojson x.key)); ("type", Some (type__to_yojson x.type_)) ]

let type_converter_entries_to_yojson tree = list_to_yojson type_converter_entry_to_yojson tree

let type_converter_to_yojson (x : type_converter) =
  assoc_to_yojson [ ("entries", Some (type_converter_entries_to_yojson x.entries)) ]

let trim_string_with_keys_to_yojson tree = list_to_yojson with_key_to_yojson tree

let trim_string_to_yojson (x : trim_string) =
  assoc_to_yojson [ ("withKeys", Some (trim_string_with_keys_to_yojson x.with_keys)) ]

let to_key_to_yojson = string_to_yojson

let substitute_string_entry_to_yojson (x : substitute_string_entry) =
  assoc_to_yojson
    [
      ("source", Some (source_to_yojson x.source));
      ("from", Some (from_key_to_yojson x.from_));
      ("to", Some (to_key_to_yojson x.to_));
    ]

let substitute_string_entries_to_yojson tree = list_to_yojson substitute_string_entry_to_yojson tree

let substitute_string_to_yojson (x : substitute_string) =
  assoc_to_yojson [ ("entries", Some (substitute_string_entries_to_yojson x.entries)) ]

let split_string_delimiter_to_yojson = string_to_yojson

let split_string_entry_to_yojson (x : split_string_entry) =
  assoc_to_yojson
    [
      ("source", Some (source_to_yojson x.source));
      ("delimiter", Some (split_string_delimiter_to_yojson x.delimiter));
    ]

let split_string_entries_to_yojson tree = list_to_yojson split_string_entry_to_yojson tree

let split_string_to_yojson (x : split_string) =
  assoc_to_yojson [ ("entries", Some (split_string_entries_to_yojson x.entries)) ]

let rename_to_to_yojson = string_to_yojson

let rename_key_entry_to_yojson (x : rename_key_entry) =
  assoc_to_yojson
    [
      ("key", Some (key_to_yojson x.key));
      ("renameTo", Some (rename_to_to_yojson x.rename_to));
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
    ]

let rename_key_entries_to_yojson tree = list_to_yojson rename_key_entry_to_yojson tree

let rename_keys_to_yojson (x : rename_keys) =
  assoc_to_yojson [ ("entries", Some (rename_key_entries_to_yojson x.entries)) ]

let parse_wa_f_to_yojson (x : parse_wa_f) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let parse_vp_c_to_yojson (x : parse_vp_c) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let parse_postgres_to_yojson (x : parse_postgres) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let mapping_version_to_yojson = string_to_yojson

let ocsf_version_to_yojson (x : ocsf_version) =
  match x with V1_1 -> `String "V1.1" | V1_5 -> `String "V1.5"

let parse_to_ocs_f_to_yojson (x : parse_to_ocs_f) =
  assoc_to_yojson
    [
      ("source", option_to_yojson source_to_yojson x.source);
      ("eventSource", Some (event_source_to_yojson x.event_source));
      ("ocsfVersion", Some (ocsf_version_to_yojson x.ocsf_version));
      ("mappingVersion", option_to_yojson mapping_version_to_yojson x.mapping_version);
    ]

let parse_route53_to_yojson (x : parse_route53) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let non_match_value_to_yojson = string_to_yojson
let key_prefix_to_yojson = string_to_yojson
let key_value_delimiter_to_yojson = string_to_yojson
let parser_field_delimiter_to_yojson = string_to_yojson

let parse_key_value_to_yojson (x : parse_key_value) =
  assoc_to_yojson
    [
      ("source", option_to_yojson source_to_yojson x.source);
      ("destination", option_to_yojson destination_field_to_yojson x.destination);
      ("fieldDelimiter", option_to_yojson parser_field_delimiter_to_yojson x.field_delimiter);
      ("keyValueDelimiter", option_to_yojson key_value_delimiter_to_yojson x.key_value_delimiter);
      ("keyPrefix", option_to_yojson key_prefix_to_yojson x.key_prefix);
      ("nonMatchValue", option_to_yojson non_match_value_to_yojson x.non_match_value);
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
    ]

let parse_jso_n_to_yojson (x : parse_jso_n) =
  assoc_to_yojson
    [
      ("source", option_to_yojson source_to_yojson x.source);
      ("destination", option_to_yojson destination_field_to_yojson x.destination);
    ]

let parse_cloudfront_to_yojson (x : parse_cloudfront) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let move_key_entry_to_yojson (x : move_key_entry) =
  assoc_to_yojson
    [
      ("source", Some (source_to_yojson x.source));
      ("target", Some (target_to_yojson x.target));
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
    ]

let move_key_entries_to_yojson tree = list_to_yojson move_key_entry_to_yojson tree

let move_keys_to_yojson (x : move_keys) =
  assoc_to_yojson [ ("entries", Some (move_key_entries_to_yojson x.entries)) ]

let lower_case_string_with_keys_to_yojson tree = list_to_yojson with_key_to_yojson tree

let lower_case_string_to_yojson (x : lower_case_string) =
  assoc_to_yojson [ ("withKeys", Some (lower_case_string_with_keys_to_yojson x.with_keys)) ]

let value_key_to_yojson = string_to_yojson

let list_to_map_to_yojson (x : list_to_map) =
  assoc_to_yojson
    [
      ("source", Some (source_to_yojson x.source));
      ("key", Some (key_to_yojson x.key));
      ("valueKey", option_to_yojson value_key_to_yojson x.value_key);
      ("target", option_to_yojson target_to_yojson x.target);
      ("flatten", option_to_yojson flatten_to_yojson x.flatten);
      ("flattenedElement", option_to_yojson flattened_element_to_yojson x.flattened_element);
    ]

let grok_match_to_yojson = string_to_yojson

let grok_to_yojson (x : grok) =
  assoc_to_yojson
    [
      ("source", option_to_yojson source_to_yojson x.source);
      ("match", Some (grok_match_to_yojson x.match_));
    ]

let processor_to_yojson (x : processor) =
  assoc_to_yojson
    [
      ("addKeys", option_to_yojson add_keys_to_yojson x.add_keys);
      ("copyValue", option_to_yojson copy_value_to_yojson x.copy_value);
      ("csv", option_to_yojson cs_v_to_yojson x.csv);
      ("dateTimeConverter", option_to_yojson date_time_converter_to_yojson x.date_time_converter);
      ("deleteKeys", option_to_yojson delete_keys_to_yojson x.delete_keys);
      ("grok", option_to_yojson grok_to_yojson x.grok);
      ("listToMap", option_to_yojson list_to_map_to_yojson x.list_to_map);
      ("lowerCaseString", option_to_yojson lower_case_string_to_yojson x.lower_case_string);
      ("moveKeys", option_to_yojson move_keys_to_yojson x.move_keys);
      ("parseCloudfront", option_to_yojson parse_cloudfront_to_yojson x.parse_cloudfront);
      ("parseJSON", option_to_yojson parse_jso_n_to_yojson x.parse_jso_n);
      ("parseKeyValue", option_to_yojson parse_key_value_to_yojson x.parse_key_value);
      ("parseRoute53", option_to_yojson parse_route53_to_yojson x.parse_route53);
      ("parseToOCSF", option_to_yojson parse_to_ocs_f_to_yojson x.parse_to_ocs_f);
      ("parsePostgres", option_to_yojson parse_postgres_to_yojson x.parse_postgres);
      ("parseVPC", option_to_yojson parse_vp_c_to_yojson x.parse_vp_c);
      ("parseWAF", option_to_yojson parse_wa_f_to_yojson x.parse_wa_f);
      ("renameKeys", option_to_yojson rename_keys_to_yojson x.rename_keys);
      ("splitString", option_to_yojson split_string_to_yojson x.split_string);
      ("substituteString", option_to_yojson substitute_string_to_yojson x.substitute_string);
      ("trimString", option_to_yojson trim_string_to_yojson x.trim_string);
      ("typeConverter", option_to_yojson type_converter_to_yojson x.type_converter);
      ("upperCaseString", option_to_yojson upper_case_string_to_yojson x.upper_case_string);
    ]

let processors_to_yojson tree = list_to_yojson processor_to_yojson tree

let get_transformer_response_to_yojson (x : get_transformer_response) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("transformerConfig", option_to_yojson processors_to_yojson x.transformer_config);
    ]

let get_transformer_request_to_yojson (x : get_transformer_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let input_log_event_to_yojson (x : input_log_event) =
  assoc_to_yojson
    [
      ("timestamp", Some (timestamp_to_yojson x.timestamp));
      ("message", Some (event_message_to_yojson x.message));
    ]

let input_log_events_to_yojson tree = list_to_yojson input_log_event_to_yojson tree
let integer_to_yojson = int_to_yojson
let integration_name_prefix_to_yojson = string_to_yojson

let integration_summary_to_yojson (x : integration_summary) =
  assoc_to_yojson
    [
      ("integrationName", option_to_yojson integration_name_to_yojson x.integration_name);
      ("integrationType", option_to_yojson integration_type_to_yojson x.integration_type);
      ("integrationStatus", option_to_yojson integration_status_to_yojson x.integration_status);
    ]

let integration_summaries_to_yojson tree = list_to_yojson integration_summary_to_yojson tree

let invalid_sequence_token_exception_to_yojson (x : invalid_sequence_token_exception) =
  assoc_to_yojson
    [
      ("expectedSequenceToken", option_to_yojson sequence_token_to_yojson x.expected_sequence_token);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let is_sampled_to_yojson = bool_to_yojson

let list_aggregate_log_group_summaries_response_to_yojson
    (x : list_aggregate_log_group_summaries_response) =
  assoc_to_yojson
    [
      ( "aggregateLogGroupSummaries",
        option_to_yojson aggregate_log_group_summaries_to_yojson x.aggregate_log_group_summaries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_log_groups_request_limit_to_yojson = int_to_yojson

let list_aggregate_log_group_summaries_group_by_to_yojson
    (x : list_aggregate_log_group_summaries_group_by) =
  match x with
  | DATA_SOURCE_NAME_TYPE_AND_FORMAT -> `String "DATA_SOURCE_NAME_TYPE_AND_FORMAT"
  | DATA_SOURCE_NAME_AND_TYPE -> `String "DATA_SOURCE_NAME_AND_TYPE"

let log_group_name_regex_pattern_to_yojson = string_to_yojson

let list_aggregate_log_group_summaries_request_to_yojson
    (x : list_aggregate_log_group_summaries_request) =
  assoc_to_yojson
    [
      ("accountIdentifiers", option_to_yojson account_ids_to_yojson x.account_identifiers);
      ( "includeLinkedAccounts",
        option_to_yojson include_linked_accounts_to_yojson x.include_linked_accounts );
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ( "logGroupNamePattern",
        option_to_yojson log_group_name_regex_pattern_to_yojson x.log_group_name_pattern );
      ("dataSources", option_to_yojson data_source_filters_to_yojson x.data_sources);
      ("groupBy", Some (list_aggregate_log_group_summaries_group_by_to_yojson x.group_by));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson list_log_groups_request_limit_to_yojson x.limit);
    ]

let list_anomalies_response_to_yojson (x : list_anomalies_response) =
  assoc_to_yojson
    [
      ("anomalies", option_to_yojson anomalies_to_yojson x.anomalies);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_anomalies_limit_to_yojson = int_to_yojson

let suppression_state_to_yojson (x : suppression_state) =
  match x with SUPPRESSED -> `String "SUPPRESSED" | UNSUPPRESSED -> `String "UNSUPPRESSED"

let list_anomalies_request_to_yojson (x : list_anomalies_request) =
  assoc_to_yojson
    [
      ("anomalyDetectorArn", option_to_yojson anomaly_detector_arn_to_yojson x.anomaly_detector_arn);
      ("suppressionState", option_to_yojson suppression_state_to_yojson x.suppression_state);
      ("limit", option_to_yojson list_anomalies_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_integrations_response_to_yojson (x : list_integrations_response) =
  assoc_to_yojson
    [
      ( "integrationSummaries",
        option_to_yojson integration_summaries_to_yojson x.integration_summaries );
    ]

let list_integrations_request_to_yojson (x : list_integrations_request) =
  assoc_to_yojson
    [
      ( "integrationNamePrefix",
        option_to_yojson integration_name_prefix_to_yojson x.integration_name_prefix );
      ("integrationType", option_to_yojson integration_type_to_yojson x.integration_type);
      ("integrationStatus", option_to_yojson integration_status_to_yojson x.integration_status);
    ]

let list_limit_to_yojson = int_to_yojson

let list_log_anomaly_detectors_response_to_yojson (x : list_log_anomaly_detectors_response) =
  assoc_to_yojson
    [
      ("anomalyDetectors", option_to_yojson anomaly_detectors_to_yojson x.anomaly_detectors);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_log_anomaly_detectors_limit_to_yojson = int_to_yojson

let list_log_anomaly_detectors_request_to_yojson (x : list_log_anomaly_detectors_request) =
  assoc_to_yojson
    [
      ("filterLogGroupArn", option_to_yojson log_group_arn_to_yojson x.filter_log_group_arn);
      ("limit", option_to_yojson list_log_anomaly_detectors_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let log_group_summary_to_yojson (x : log_group_summary) =
  assoc_to_yojson
    [
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logGroupArn", option_to_yojson arn_to_yojson x.log_group_arn);
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
    ]

let log_group_summaries_to_yojson tree = list_to_yojson log_group_summary_to_yojson tree

let list_log_groups_response_to_yojson (x : list_log_groups_response) =
  assoc_to_yojson
    [
      ("logGroups", option_to_yojson log_group_summaries_to_yojson x.log_groups);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let tag_filter_value_to_yojson = string_to_yojson
let tag_filter_values_to_yojson tree = list_to_yojson tag_filter_value_to_yojson tree
let tag_filter_key_to_yojson = string_to_yojson

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("key", Some (tag_filter_key_to_yojson x.key));
      ("values", option_to_yojson tag_filter_values_to_yojson x.values);
    ]

let tag_filters_to_yojson tree = list_to_yojson tag_filter_to_yojson tree

let list_log_groups_request_to_yojson (x : list_log_groups_request) =
  assoc_to_yojson
    [
      ( "logGroupNamePattern",
        option_to_yojson log_group_name_regex_pattern_to_yojson x.log_group_name_pattern );
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ( "includeLinkedAccounts",
        option_to_yojson include_linked_accounts_to_yojson x.include_linked_accounts );
      ("accountIdentifiers", option_to_yojson account_ids_to_yojson x.account_identifiers);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson list_limit_to_yojson x.limit);
      ("dataSources", option_to_yojson data_source_filters_to_yojson x.data_sources);
      ("fieldIndexNames", option_to_yojson field_index_names_to_yojson x.field_index_names);
      ("logGroupTags", option_to_yojson tag_filters_to_yojson x.log_group_tags);
    ]

let log_group_identifiers_to_yojson tree = list_to_yojson log_group_identifier_to_yojson tree

let list_log_groups_for_query_response_to_yojson (x : list_log_groups_for_query_response) =
  assoc_to_yojson
    [
      ( "logGroupIdentifiers",
        option_to_yojson log_group_identifiers_to_yojson x.log_group_identifiers );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_log_groups_for_query_max_results_to_yojson = int_to_yojson

let list_log_groups_for_query_request_to_yojson (x : list_log_groups_for_query_request) =
  assoc_to_yojson
    [
      ("queryId", Some (query_id_to_yojson x.query_id));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_log_groups_for_query_max_results_to_yojson x.max_results);
    ]

let scheduled_query_summary_to_yojson (x : scheduled_query_summary) =
  assoc_to_yojson
    [
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
      ("name", option_to_yojson scheduled_query_name_to_yojson x.name);
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("scheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ("lastTriggeredTime", option_to_yojson timestamp_to_yojson x.last_triggered_time);
      ("lastExecutionStatus", option_to_yojson execution_status_to_yojson x.last_execution_status);
      ("scheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let scheduled_query_summary_list_to_yojson tree =
  list_to_yojson scheduled_query_summary_to_yojson tree

let list_scheduled_queries_response_to_yojson (x : list_scheduled_queries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "scheduledQueries",
        option_to_yojson scheduled_query_summary_list_to_yojson x.scheduled_queries );
    ]

let list_scheduled_queries_max_results_to_yojson = int_to_yojson

let list_scheduled_queries_request_to_yojson (x : list_scheduled_queries_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_scheduled_queries_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("scheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
    ]

let s3_table_integration_source_status_reason_to_yojson = string_to_yojson

let s3_table_integration_source_status_to_yojson (x : s3_table_integration_source_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | UNHEALTHY -> `String "UNHEALTHY"
  | FAILED -> `String "FAILED"
  | DATA_SOURCE_DELETE_IN_PROGRESS -> `String "DATA_SOURCE_DELETE_IN_PROGRESS"

let s3_table_integration_source_to_yojson (x : s3_table_integration_source) =
  assoc_to_yojson
    [
      ("identifier", option_to_yojson s3_table_integration_source_identifier_to_yojson x.identifier);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("status", option_to_yojson s3_table_integration_source_status_to_yojson x.status);
      ( "statusReason",
        option_to_yojson s3_table_integration_source_status_reason_to_yojson x.status_reason );
      ("createdTimeStamp", option_to_yojson timestamp_to_yojson x.created_time_stamp);
      ( "parentSourceIdentifier",
        option_to_yojson s3_table_integration_source_identifier_to_yojson x.parent_source_identifier
      );
    ]

let s3_table_integration_sources_to_yojson tree =
  list_to_yojson s3_table_integration_source_to_yojson tree

let list_sources_for_s3_table_integration_response_to_yojson
    (x : list_sources_for_s3_table_integration_response) =
  assoc_to_yojson
    [
      ("sources", option_to_yojson s3_table_integration_sources_to_yojson x.sources);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_sources_for_s3_table_integration_max_results_to_yojson = int_to_yojson

let list_sources_for_s3_table_integration_request_to_yojson
    (x : list_sources_for_s3_table_integration_request) =
  assoc_to_yojson
    [
      ("integrationArn", Some (arn_to_yojson x.integration_arn));
      ( "maxResults",
        option_to_yojson list_sources_for_s3_table_integration_max_results_to_yojson x.max_results
      );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let syslog_source_type_to_yojson (x : syslog_source_type) = match x with VPCE -> `String "VPCE"

let syslog_configuration_to_yojson (x : syslog_configuration) =
  assoc_to_yojson
    [
      ("logGroupArn", option_to_yojson log_group_arn_to_yojson x.log_group_arn);
      ("sourceType", option_to_yojson syslog_source_type_to_yojson x.source_type);
      ("vpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let syslog_configurations_to_yojson tree = list_to_yojson syslog_configuration_to_yojson tree

let list_syslog_configurations_response_to_yojson (x : list_syslog_configurations_response) =
  assoc_to_yojson
    [
      ( "syslogConfigurations",
        option_to_yojson syslog_configurations_to_yojson x.syslog_configurations );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_syslog_configurations_max_results_to_yojson = int_to_yojson

let list_syslog_configurations_request_to_yojson (x : list_syslog_configurations_request) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("vpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_syslog_configurations_max_results_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let list_tags_log_group_response_to_yojson (x : list_tags_log_group_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_log_group_request_to_yojson (x : list_tags_log_group_request) =
  assoc_to_yojson [ ("logGroupName", Some (log_group_name_to_yojson x.log_group_name)) ]

let live_tail_session_log_event_to_yojson (x : live_tail_session_log_event) =
  assoc_to_yojson
    [
      ("logStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("message", option_to_yojson event_message_to_yojson x.message);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("ingestionTime", option_to_yojson timestamp_to_yojson x.ingestion_time);
    ]

let live_tail_session_metadata_to_yojson (x : live_tail_session_metadata) =
  assoc_to_yojson [ ("sampled", option_to_yojson is_sampled_to_yojson x.sampled) ]

let live_tail_session_results_to_yojson tree =
  list_to_yojson live_tail_session_log_event_to_yojson tree

let start_live_tail_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let session_id_to_yojson = string_to_yojson
let request_id_to_yojson = string_to_yojson

let live_tail_session_start_to_yojson (x : live_tail_session_start) =
  assoc_to_yojson
    [
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
      ("sessionId", option_to_yojson session_id_to_yojson x.session_id);
      ( "logGroupIdentifiers",
        option_to_yojson start_live_tail_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("logStreamNames", option_to_yojson input_log_stream_names_to_yojson x.log_stream_names);
      ( "logStreamNamePrefixes",
        option_to_yojson input_log_stream_names_to_yojson x.log_stream_name_prefixes );
      ("logEventFilterPattern", option_to_yojson filter_pattern_to_yojson x.log_event_filter_pattern);
    ]

let live_tail_session_update_to_yojson (x : live_tail_session_update) =
  assoc_to_yojson
    [
      ("sessionMetadata", option_to_yojson live_tail_session_metadata_to_yojson x.session_metadata);
      ("sessionResults", option_to_yojson live_tail_session_results_to_yojson x.session_results);
    ]

let log_event_index_to_yojson = int_to_yojson

let update_scheduled_query_response_to_yojson (x : update_scheduled_query_response) =
  assoc_to_yojson
    [
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
      ("name", option_to_yojson scheduled_query_name_to_yojson x.name);
      ("description", option_to_yojson scheduled_query_description_to_yojson x.description);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("queryString", option_to_yojson query_string_to_yojson x.query_string);
      ( "logGroupIdentifiers",
        option_to_yojson scheduled_query_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("scheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("startTimeOffset", option_to_yojson start_time_offset_to_yojson x.start_time_offset);
      ("endTimeOffset", option_to_yojson end_time_offset_to_yojson x.end_time_offset);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("scheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ("lastTriggeredTime", option_to_yojson timestamp_to_yojson x.last_triggered_time);
      ("lastExecutionStatus", option_to_yojson execution_status_to_yojson x.last_execution_status);
      ("scheduleStartTime", option_to_yojson timestamp_to_yojson x.schedule_start_time);
      ("scheduleEndTime", option_to_yojson timestamp_to_yojson x.schedule_end_time);
      ("executionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let update_scheduled_query_request_to_yojson (x : update_scheduled_query_request) =
  assoc_to_yojson
    [
      ("identifier", Some (scheduled_query_identifier_to_yojson x.identifier));
      ("description", option_to_yojson scheduled_query_description_to_yojson x.description);
      ("queryLanguage", Some (query_language_to_yojson x.query_language));
      ("queryString", Some (query_string_to_yojson x.query_string));
      ( "logGroupIdentifiers",
        option_to_yojson scheduled_query_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("scheduleExpression", Some (schedule_expression_to_yojson x.schedule_expression));
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("startTimeOffset", option_to_yojson start_time_offset_to_yojson x.start_time_offset);
      ("endTimeOffset", option_to_yojson end_time_offset_to_yojson x.end_time_offset);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("scheduleStartTime", option_to_yojson timestamp_to_yojson x.schedule_start_time);
      ("scheduleEndTime", option_to_yojson timestamp_to_yojson x.schedule_end_time);
      ("executionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
    ]

let update_lookup_table_response_to_yojson (x : update_lookup_table_response) =
  assoc_to_yojson
    [
      ("lookupTableArn", option_to_yojson arn_to_yojson x.lookup_table_arn);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let update_lookup_table_request_to_yojson (x : update_lookup_table_request) =
  assoc_to_yojson
    [
      ("lookupTableArn", Some (arn_to_yojson x.lookup_table_arn));
      ("description", option_to_yojson lookup_table_description_to_yojson x.description);
      ("tableBody", Some (table_body_to_yojson x.table_body));
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
    ]

let update_log_anomaly_detector_request_to_yojson (x : update_log_anomaly_detector_request) =
  assoc_to_yojson
    [
      ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn));
      ("evaluationFrequency", option_to_yojson evaluation_frequency_to_yojson x.evaluation_frequency);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ( "anomalyVisibilityTime",
        option_to_yojson anomaly_visibility_time_to_yojson x.anomaly_visibility_time );
      ("enabled", Some (boolean__to_yojson x.enabled));
    ]

let update_delivery_configuration_response_to_yojson = unit_to_yojson

let update_delivery_configuration_request_to_yojson (x : update_delivery_configuration_request) =
  assoc_to_yojson
    [
      ("id", Some (delivery_id_to_yojson x.id));
      ("recordFields", option_to_yojson record_fields_to_yojson x.record_fields);
      ("fieldDelimiter", option_to_yojson field_delimiter_to_yojson x.field_delimiter);
      ( "s3DeliveryConfiguration",
        option_to_yojson s3_delivery_configuration_to_yojson x.s3_delivery_configuration );
    ]

let suppression_unit_to_yojson (x : suppression_unit) =
  match x with
  | SECONDS -> `String "SECONDS"
  | MINUTES -> `String "MINUTES"
  | HOURS -> `String "HOURS"

let suppression_period_to_yojson (x : suppression_period) =
  assoc_to_yojson
    [
      ("value", option_to_yojson integer_to_yojson x.value);
      ("suppressionUnit", option_to_yojson suppression_unit_to_yojson x.suppression_unit);
    ]

let suppression_type_to_yojson (x : suppression_type) =
  match x with LIMITED -> `String "LIMITED" | INFINITE -> `String "INFINITE"

let update_anomaly_request_to_yojson (x : update_anomaly_request) =
  assoc_to_yojson
    [
      ("anomalyId", option_to_yojson anomaly_id_to_yojson x.anomaly_id);
      ("patternId", option_to_yojson pattern_id_to_yojson x.pattern_id);
      ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn));
      ("suppressionType", option_to_yojson suppression_type_to_yojson x.suppression_type);
      ("suppressionPeriod", option_to_yojson suppression_period_to_yojson x.suppression_period);
      ("baseline", option_to_yojson baseline_to_yojson x.baseline);
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_log_group_request_to_yojson (x : untag_log_group_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let transformed_event_message_to_yojson = string_to_yojson

let transformed_log_record_to_yojson (x : transformed_log_record) =
  assoc_to_yojson
    [
      ("eventNumber", option_to_yojson event_number_to_yojson x.event_number);
      ("eventMessage", option_to_yojson event_message_to_yojson x.event_message);
      ( "transformedEventMessage",
        option_to_yojson transformed_event_message_to_yojson x.transformed_event_message );
    ]

let transformed_logs_to_yojson tree = list_to_yojson transformed_log_record_to_yojson tree

let test_transformer_response_to_yojson (x : test_transformer_response) =
  assoc_to_yojson
    [ ("transformedLogs", option_to_yojson transformed_logs_to_yojson x.transformed_logs) ]

let test_event_messages_to_yojson tree = list_to_yojson event_message_to_yojson tree

let test_transformer_request_to_yojson (x : test_transformer_request) =
  assoc_to_yojson
    [
      ("transformerConfig", Some (processors_to_yojson x.transformer_config));
      ("logEventMessages", Some (test_event_messages_to_yojson x.log_event_messages));
    ]

let metric_filter_match_record_to_yojson (x : metric_filter_match_record) =
  assoc_to_yojson
    [
      ("eventNumber", option_to_yojson event_number_to_yojson x.event_number);
      ("eventMessage", option_to_yojson event_message_to_yojson x.event_message);
      ("extractedValues", option_to_yojson extracted_values_to_yojson x.extracted_values);
    ]

let metric_filter_matches_to_yojson tree = list_to_yojson metric_filter_match_record_to_yojson tree

let test_metric_filter_response_to_yojson (x : test_metric_filter_response) =
  assoc_to_yojson [ ("matches", option_to_yojson metric_filter_matches_to_yojson x.matches) ]

let test_metric_filter_request_to_yojson (x : test_metric_filter_request) =
  assoc_to_yojson
    [
      ("filterPattern", Some (filter_pattern_to_yojson x.filter_pattern));
      ("logEventMessages", Some (test_event_messages_to_yojson x.log_event_messages));
    ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
    ]

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
      ("tags", Some (tags_to_yojson x.tags));
    ]

let tag_log_group_request_to_yojson (x : tag_log_group_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("tags", Some (tags_to_yojson x.tags));
    ]

let stop_query_response_to_yojson (x : stop_query_response) =
  assoc_to_yojson [ ("success", option_to_yojson success_to_yojson x.success) ]

let stop_query_request_to_yojson (x : stop_query_request) =
  assoc_to_yojson [ ("queryId", Some (query_id_to_yojson x.query_id)) ]

let query_char_offset_to_yojson = int_to_yojson

let query_compile_error_location_to_yojson (x : query_compile_error_location) =
  assoc_to_yojson
    [
      ("startCharOffset", option_to_yojson query_char_offset_to_yojson x.start_char_offset);
      ("endCharOffset", option_to_yojson query_char_offset_to_yojson x.end_char_offset);
    ]

let query_compile_error_to_yojson (x : query_compile_error) =
  assoc_to_yojson
    [
      ("location", option_to_yojson query_compile_error_location_to_yojson x.location);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let malformed_query_exception_to_yojson (x : malformed_query_exception) =
  assoc_to_yojson
    [
      ("queryCompileError", option_to_yojson query_compile_error_to_yojson x.query_compile_error);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let start_query_response_to_yojson (x : start_query_response) =
  assoc_to_yojson [ ("queryId", option_to_yojson query_id_to_yojson x.query_id) ]

let start_query_request_to_yojson (x : start_query_request) =
  assoc_to_yojson
    [
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("logGroupNames", option_to_yojson log_group_names_to_yojson x.log_group_names);
      ( "logGroupIdentifiers",
        option_to_yojson log_group_identifiers_to_yojson x.log_group_identifiers );
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("queryString", Some (query_string_to_yojson x.query_string));
      ("limit", option_to_yojson events_limit_start_query_to_yojson x.limit);
    ]

let session_streaming_exception_to_yojson (x : session_streaming_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let session_timeout_exception_to_yojson (x : session_timeout_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let start_live_tail_response_stream_to_yojson (x : start_live_tail_response_stream) =
  match x with
  | SessionStart arg ->
      assoc_to_yojson [ ("sessionStart", Some (live_tail_session_start_to_yojson arg)) ]
  | SessionUpdate arg ->
      assoc_to_yojson [ ("sessionUpdate", Some (live_tail_session_update_to_yojson arg)) ]
  | SessionTimeoutException arg ->
      assoc_to_yojson
        [ ("SessionTimeoutException", Some (session_timeout_exception_to_yojson arg)) ]
  | SessionStreamingException arg ->
      assoc_to_yojson
        [ ("SessionStreamingException", Some (session_streaming_exception_to_yojson arg)) ]

let start_live_tail_response_to_yojson (x : start_live_tail_response) =
  assoc_to_yojson
    [
      ( "responseStream",
        option_to_yojson start_live_tail_response_stream_to_yojson x.response_stream );
    ]

let start_live_tail_request_to_yojson (x : start_live_tail_request) =
  assoc_to_yojson
    [
      ( "logGroupIdentifiers",
        Some (start_live_tail_log_group_identifiers_to_yojson x.log_group_identifiers) );
      ("logStreamNames", option_to_yojson input_log_stream_names_to_yojson x.log_stream_names);
      ( "logStreamNamePrefixes",
        option_to_yojson input_log_stream_names_to_yojson x.log_stream_name_prefixes );
      ("logEventFilterPattern", option_to_yojson filter_pattern_to_yojson x.log_event_filter_pattern);
    ]

let put_transformer_request_to_yojson (x : put_transformer_request) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
      ("transformerConfig", Some (processors_to_yojson x.transformer_config));
    ]

let put_syslog_configuration_request_to_yojson (x : put_syslog_configuration_request) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
      ("vpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
    ]

let put_subscription_filter_request_to_yojson (x : put_subscription_filter_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("filterName", Some (filter_name_to_yojson x.filter_name));
      ("filterPattern", Some (filter_pattern_to_yojson x.filter_pattern));
      ("destinationArn", Some (destination_arn_to_yojson x.destination_arn));
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("distribution", option_to_yojson distribution_to_yojson x.distribution);
      ( "applyOnTransformedLogs",
        option_to_yojson apply_on_transformed_logs_to_yojson x.apply_on_transformed_logs );
      ( "fieldSelectionCriteria",
        option_to_yojson field_selection_criteria_to_yojson x.field_selection_criteria );
      ("emitSystemFields", option_to_yojson emit_system_fields_to_yojson x.emit_system_fields);
    ]

let put_retention_policy_request_to_yojson (x : put_retention_policy_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("retentionInDays", Some (days_to_yojson x.retention_in_days));
    ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("resourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy);
      ("revisionId", option_to_yojson expected_revision_id_to_yojson x.revision_id);
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("policyDocument", option_to_yojson policy_document_to_yojson x.policy_document);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("expectedRevisionId", option_to_yojson expected_revision_id_to_yojson x.expected_revision_id);
    ]

let put_query_definition_response_to_yojson (x : put_query_definition_response) =
  assoc_to_yojson
    [ ("queryDefinitionId", option_to_yojson query_id_to_yojson x.query_definition_id) ]

let put_query_definition_request_to_yojson (x : put_query_definition_request) =
  assoc_to_yojson
    [
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("name", Some (query_definition_name_to_yojson x.name));
      ("queryDefinitionId", option_to_yojson query_id_to_yojson x.query_definition_id);
      ("logGroupNames", option_to_yojson log_group_names_to_yojson x.log_group_names);
      ("queryString", Some (query_definition_string_to_yojson x.query_string));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("parameters", option_to_yojson query_parameter_list_to_yojson x.parameters);
    ]

let put_metric_filter_request_to_yojson (x : put_metric_filter_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("filterName", Some (filter_name_to_yojson x.filter_name));
      ("filterPattern", Some (filter_pattern_to_yojson x.filter_pattern));
      ("metricTransformations", Some (metric_transformations_to_yojson x.metric_transformations));
      ( "applyOnTransformedLogs",
        option_to_yojson apply_on_transformed_logs_to_yojson x.apply_on_transformed_logs );
      ( "fieldSelectionCriteria",
        option_to_yojson field_selection_criteria_to_yojson x.field_selection_criteria );
      ( "emitSystemFieldDimensions",
        option_to_yojson emit_system_fields_to_yojson x.emit_system_field_dimensions );
    ]

let put_log_group_deletion_protection_request_to_yojson
    (x : put_log_group_deletion_protection_request) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
      ( "deletionProtectionEnabled",
        Some (deletion_protection_enabled_to_yojson x.deletion_protection_enabled) );
    ]

let unrecognized_client_exception_to_yojson (x : unrecognized_client_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let rejected_entity_info_to_yojson (x : rejected_entity_info) =
  assoc_to_yojson [ ("errorType", Some (entity_rejection_error_type_to_yojson x.error_type)) ]

let rejected_log_events_info_to_yojson (x : rejected_log_events_info) =
  assoc_to_yojson
    [
      ( "tooNewLogEventStartIndex",
        option_to_yojson log_event_index_to_yojson x.too_new_log_event_start_index );
      ( "tooOldLogEventEndIndex",
        option_to_yojson log_event_index_to_yojson x.too_old_log_event_end_index );
      ( "expiredLogEventEndIndex",
        option_to_yojson log_event_index_to_yojson x.expired_log_event_end_index );
    ]

let put_log_events_response_to_yojson (x : put_log_events_response) =
  assoc_to_yojson
    [
      ("nextSequenceToken", option_to_yojson sequence_token_to_yojson x.next_sequence_token);
      ( "rejectedLogEventsInfo",
        option_to_yojson rejected_log_events_info_to_yojson x.rejected_log_events_info );
      ("rejectedEntityInfo", option_to_yojson rejected_entity_info_to_yojson x.rejected_entity_info);
    ]

let put_log_events_request_to_yojson (x : put_log_events_request) =
  assoc_to_yojson
    [
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("logStreamName", Some (log_stream_name_to_yojson x.log_stream_name));
      ("logEvents", Some (input_log_events_to_yojson x.log_events));
      ("sequenceToken", option_to_yojson sequence_token_to_yojson x.sequence_token);
      ("entity", option_to_yojson entity_to_yojson x.entity);
    ]

let put_integration_response_to_yojson (x : put_integration_response) =
  assoc_to_yojson
    [
      ("integrationName", option_to_yojson integration_name_to_yojson x.integration_name);
      ("integrationStatus", option_to_yojson integration_status_to_yojson x.integration_status);
    ]

let open_search_resource_config_to_yojson (x : open_search_resource_config) =
  assoc_to_yojson
    [
      ("kmsKeyArn", option_to_yojson arn_to_yojson x.kms_key_arn);
      ("dataSourceRoleArn", Some (arn_to_yojson x.data_source_role_arn));
      ( "dashboardViewerPrincipals",
        Some (dashboard_viewer_principals_to_yojson x.dashboard_viewer_principals) );
      ("applicationArn", option_to_yojson arn_to_yojson x.application_arn);
      ("retentionDays", Some (collection_retention_days_to_yojson x.retention_days));
    ]

let resource_config_to_yojson (x : resource_config) =
  match x with
  | OpenSearchResourceConfig arg ->
      assoc_to_yojson
        [ ("openSearchResourceConfig", Some (open_search_resource_config_to_yojson arg)) ]

let put_integration_request_to_yojson (x : put_integration_request) =
  assoc_to_yojson
    [
      ("integrationName", Some (integration_name_to_yojson x.integration_name));
      ("resourceConfig", Some (resource_config_to_yojson x.resource_config));
      ("integrationType", Some (integration_type_to_yojson x.integration_type));
    ]

let put_index_policy_response_to_yojson (x : put_index_policy_response) =
  assoc_to_yojson [ ("indexPolicy", option_to_yojson index_policy_to_yojson x.index_policy) ]

let put_index_policy_request_to_yojson (x : put_index_policy_request) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
      ("policyDocument", Some (policy_document_to_yojson x.policy_document));
    ]

let put_destination_policy_request_to_yojson (x : put_destination_policy_request) =
  assoc_to_yojson
    [
      ("destinationName", Some (destination_name_to_yojson x.destination_name));
      ("accessPolicy", Some (access_policy_to_yojson x.access_policy));
      ("forceUpdate", option_to_yojson force_update_to_yojson x.force_update);
    ]

let put_destination_response_to_yojson (x : put_destination_response) =
  assoc_to_yojson [ ("destination", option_to_yojson destination_to_yojson x.destination) ]

let put_destination_request_to_yojson (x : put_destination_request) =
  assoc_to_yojson
    [
      ("destinationName", Some (destination_name_to_yojson x.destination_name));
      ("targetArn", Some (target_arn_to_yojson x.target_arn));
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let put_delivery_source_response_to_yojson (x : put_delivery_source_response) =
  assoc_to_yojson
    [ ("deliverySource", option_to_yojson delivery_source_to_yojson x.delivery_source) ]

let put_delivery_source_request_to_yojson (x : put_delivery_source_request) =
  assoc_to_yojson
    [
      ("name", Some (delivery_source_name_to_yojson x.name));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("logType", Some (log_type_to_yojson x.log_type));
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "deliverySourceConfiguration",
        option_to_yojson delivery_source_configuration_to_yojson x.delivery_source_configuration );
    ]

let put_delivery_destination_policy_response_to_yojson
    (x : put_delivery_destination_policy_response) =
  assoc_to_yojson [ ("policy", option_to_yojson policy_to_yojson x.policy) ]

let put_delivery_destination_policy_request_to_yojson (x : put_delivery_destination_policy_request)
    =
  assoc_to_yojson
    [
      ( "deliveryDestinationName",
        Some (delivery_destination_name_to_yojson x.delivery_destination_name) );
      ( "deliveryDestinationPolicy",
        Some (delivery_destination_policy_to_yojson x.delivery_destination_policy) );
    ]

let put_delivery_destination_response_to_yojson (x : put_delivery_destination_response) =
  assoc_to_yojson
    [
      ("deliveryDestination", option_to_yojson delivery_destination_to_yojson x.delivery_destination);
    ]

let put_delivery_destination_request_to_yojson (x : put_delivery_destination_request) =
  assoc_to_yojson
    [
      ("name", Some (delivery_destination_name_to_yojson x.name));
      ("outputFormat", option_to_yojson output_format_to_yojson x.output_format);
      ( "deliveryDestinationConfiguration",
        option_to_yojson delivery_destination_configuration_to_yojson
          x.delivery_destination_configuration );
      ( "deliveryDestinationType",
        option_to_yojson delivery_destination_type_to_yojson x.delivery_destination_type );
      ("tags", option_to_yojson tags_to_yojson x.tags);
    ]

let put_data_protection_policy_response_to_yojson (x : put_data_protection_policy_response) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ( "policyDocument",
        option_to_yojson data_protection_policy_document_to_yojson x.policy_document );
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
    ]

let put_data_protection_policy_request_to_yojson (x : put_data_protection_policy_request) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
      ("policyDocument", Some (data_protection_policy_document_to_yojson x.policy_document));
    ]

let put_bearer_token_authentication_request_to_yojson (x : put_bearer_token_authentication_request)
    =
  assoc_to_yojson
    [
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
      ( "bearerTokenAuthenticationEnabled",
        Some (bearer_token_authentication_enabled_to_yojson x.bearer_token_authentication_enabled)
      );
    ]

let put_account_policy_response_to_yojson (x : put_account_policy_response) =
  assoc_to_yojson [ ("accountPolicy", option_to_yojson account_policy_to_yojson x.account_policy) ]

let put_account_policy_request_to_yojson (x : put_account_policy_request) =
  assoc_to_yojson
    [
      ("policyName", Some (policy_name_to_yojson x.policy_name));
      ("policyDocument", Some (account_policy_document_to_yojson x.policy_document));
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("selectionCriteria", option_to_yojson selection_criteria_to_yojson x.selection_criteria);
    ]
