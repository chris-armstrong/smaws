open Smaws_Lib.Json.SerializeHelpers
open Types

let with_key_to_yojson = string_to_yojson
let vpc_endpoint_id_to_yojson = string_to_yojson
let value_key_to_yojson = string_to_yojson
let value_to_yojson = string_to_yojson
let message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let user_identity_to_yojson = string_to_yojson
let upper_case_string_with_keys_to_yojson tree = list_to_yojson with_key_to_yojson tree

let upper_case_string_to_yojson (x : upper_case_string) =
  assoc_to_yojson [ ("withKeys", Some (upper_case_string_with_keys_to_yojson x.with_keys)) ]

let arn_to_yojson = string_to_yojson
let scheduled_query_name_to_yojson = string_to_yojson
let scheduled_query_description_to_yojson = string_to_yojson

let query_language_to_yojson (x : query_language) =
  match x with PPL -> `String "PPL" | SQL -> `String "SQL" | CWLI -> `String "CWLI"

let query_string_to_yojson = string_to_yojson
let log_group_identifier_to_yojson = string_to_yojson

let scheduled_query_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let schedule_expression_to_yojson = string_to_yojson
let schedule_timezone_to_yojson = string_to_yojson
let start_time_offset_to_yojson = long_to_yojson
let end_time_offset_to_yojson = long_to_yojson
let s3_uri_to_yojson = string_to_yojson
let role_arn_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("destinationIdentifier", Some (s3_uri_to_yojson x.destination_identifier));
    ]

let destination_configuration_to_yojson (x : destination_configuration) =
  assoc_to_yojson [ ("s3Configuration", Some (s3_configuration_to_yojson x.s3_configuration)) ]

let scheduled_query_state_to_yojson (x : scheduled_query_state) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let schedule_type_to_yojson (x : schedule_type) =
  match x with
  | AWS_MANAGED -> `String "AWS_MANAGED"
  | CUSTOMER_MANAGED -> `String "CUSTOMER_MANAGED"

let timestamp_to_yojson = long_to_yojson

let execution_status_to_yojson (x : execution_status) =
  match x with
  | Timeout -> `String "Timeout"
  | Failed -> `String "Failed"
  | Complete -> `String "Complete"
  | InvalidQuery -> `String "InvalidQuery"
  | Running -> `String "Running"

let update_scheduled_query_response_to_yojson (x : update_scheduled_query_response) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("executionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("scheduleEndTime", option_to_yojson timestamp_to_yojson x.schedule_end_time);
      ("scheduleStartTime", option_to_yojson timestamp_to_yojson x.schedule_start_time);
      ("lastExecutionStatus", option_to_yojson execution_status_to_yojson x.last_execution_status);
      ("lastTriggeredTime", option_to_yojson timestamp_to_yojson x.last_triggered_time);
      ("scheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("endTimeOffset", option_to_yojson end_time_offset_to_yojson x.end_time_offset);
      ("startTimeOffset", option_to_yojson start_time_offset_to_yojson x.start_time_offset);
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("scheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ( "logGroupIdentifiers",
        option_to_yojson scheduled_query_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("queryString", option_to_yojson query_string_to_yojson x.query_string);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("description", option_to_yojson scheduled_query_description_to_yojson x.description);
      ("name", option_to_yojson scheduled_query_name_to_yojson x.name);
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
    ]

let scheduled_query_identifier_to_yojson = string_to_yojson

let update_scheduled_query_request_to_yojson (x : update_scheduled_query_request) =
  assoc_to_yojson
    [
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("executionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("scheduleEndTime", option_to_yojson timestamp_to_yojson x.schedule_end_time);
      ("scheduleStartTime", option_to_yojson timestamp_to_yojson x.schedule_start_time);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("endTimeOffset", option_to_yojson end_time_offset_to_yojson x.end_time_offset);
      ("startTimeOffset", option_to_yojson start_time_offset_to_yojson x.start_time_offset);
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("scheduleExpression", Some (schedule_expression_to_yojson x.schedule_expression));
      ( "logGroupIdentifiers",
        option_to_yojson scheduled_query_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("queryString", Some (query_string_to_yojson x.query_string));
      ("queryLanguage", Some (query_language_to_yojson x.query_language));
      ("description", option_to_yojson scheduled_query_description_to_yojson x.description);
      ("identifier", Some (scheduled_query_identifier_to_yojson x.identifier));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_lookup_table_response_to_yojson (x : update_lookup_table_response) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("lookupTableArn", option_to_yojson arn_to_yojson x.lookup_table_arn);
    ]

let lookup_table_description_to_yojson = string_to_yojson
let table_body_to_yojson = string_to_yojson

let update_lookup_table_request_to_yojson (x : update_lookup_table_request) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("tableBody", Some (table_body_to_yojson x.table_body));
      ("description", option_to_yojson lookup_table_description_to_yojson x.description);
      ("lookupTableArn", Some (arn_to_yojson x.lookup_table_arn));
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let anomaly_detector_arn_to_yojson = string_to_yojson

let evaluation_frequency_to_yojson (x : evaluation_frequency) =
  match x with
  | ONE_HOUR -> `String "ONE_HOUR"
  | THIRTY_MIN -> `String "THIRTY_MIN"
  | FIFTEEN_MIN -> `String "FIFTEEN_MIN"
  | TEN_MIN -> `String "TEN_MIN"
  | FIVE_MIN -> `String "FIVE_MIN"
  | ONE_MIN -> `String "ONE_MIN"

let filter_pattern_to_yojson = string_to_yojson
let anomaly_visibility_time_to_yojson = long_to_yojson
let boolean__to_yojson = bool_to_yojson

let update_log_anomaly_detector_request_to_yojson (x : update_log_anomaly_detector_request) =
  assoc_to_yojson
    [
      ("enabled", Some (boolean__to_yojson x.enabled));
      ( "anomalyVisibilityTime",
        option_to_yojson anomaly_visibility_time_to_yojson x.anomaly_visibility_time );
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("evaluationFrequency", option_to_yojson evaluation_frequency_to_yojson x.evaluation_frequency);
      ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn));
    ]

let operation_aborted_exception_to_yojson (x : operation_aborted_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let update_delivery_configuration_response_to_yojson = unit_to_yojson
let delivery_id_to_yojson = string_to_yojson
let field_header_to_yojson = string_to_yojson
let record_fields_to_yojson tree = list_to_yojson field_header_to_yojson tree
let field_delimiter_to_yojson = string_to_yojson
let delivery_suffix_path_to_yojson = string_to_yojson

let s3_delivery_configuration_to_yojson (x : s3_delivery_configuration) =
  assoc_to_yojson
    [
      ("enableHiveCompatiblePath", option_to_yojson boolean__to_yojson x.enable_hive_compatible_path);
      ("suffixPath", option_to_yojson delivery_suffix_path_to_yojson x.suffix_path);
    ]

let update_delivery_configuration_request_to_yojson (x : update_delivery_configuration_request) =
  assoc_to_yojson
    [
      ( "s3DeliveryConfiguration",
        option_to_yojson s3_delivery_configuration_to_yojson x.s3_delivery_configuration );
      ("fieldDelimiter", option_to_yojson field_delimiter_to_yojson x.field_delimiter);
      ("recordFields", option_to_yojson record_fields_to_yojson x.record_fields);
      ("id", Some (delivery_id_to_yojson x.id));
    ]

let anomaly_id_to_yojson = string_to_yojson
let pattern_id_to_yojson = string_to_yojson

let suppression_type_to_yojson (x : suppression_type) =
  match x with INFINITE -> `String "INFINITE" | LIMITED -> `String "LIMITED"

let integer_to_yojson = int_to_yojson

let suppression_unit_to_yojson (x : suppression_unit) =
  match x with
  | HOURS -> `String "HOURS"
  | MINUTES -> `String "MINUTES"
  | SECONDS -> `String "SECONDS"

let suppression_period_to_yojson (x : suppression_period) =
  assoc_to_yojson
    [
      ("suppressionUnit", option_to_yojson suppression_unit_to_yojson x.suppression_unit);
      ("value", option_to_yojson integer_to_yojson x.value);
    ]

let baseline_to_yojson = bool_to_yojson

let update_anomaly_request_to_yojson (x : update_anomaly_request) =
  assoc_to_yojson
    [
      ("baseline", option_to_yojson baseline_to_yojson x.baseline);
      ("suppressionPeriod", option_to_yojson suppression_period_to_yojson x.suppression_period);
      ("suppressionType", option_to_yojson suppression_type_to_yojson x.suppression_type);
      ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn));
      ("patternId", option_to_yojson pattern_id_to_yojson x.pattern_id);
      ("anomalyId", option_to_yojson anomaly_id_to_yojson x.anomaly_id);
    ]

let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let log_group_name_to_yojson = string_to_yojson
let tag_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_log_group_request_to_yojson (x : untag_log_group_request) =
  assoc_to_yojson
    [
      ("tags", Some (tag_list_to_yojson x.tags));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let unrecognized_client_exception_to_yojson (x : unrecognized_client_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let unmask_to_yojson = bool_to_yojson
let key_to_yojson = string_to_yojson

let type__to_yojson (x : type_) =
  match x with
  | STRING -> `String "string"
  | DOUBLE -> `String "double"
  | INTEGER -> `String "integer"
  | BOOLEAN -> `String "boolean"

let type_converter_entry_to_yojson (x : type_converter_entry) =
  assoc_to_yojson [ ("type", Some (type__to_yojson x.type_)); ("key", Some (key_to_yojson x.key)) ]

let type_converter_entries_to_yojson tree = list_to_yojson type_converter_entry_to_yojson tree

let type_converter_to_yojson (x : type_converter) =
  assoc_to_yojson [ ("entries", Some (type_converter_entries_to_yojson x.entries)) ]

let trim_string_with_keys_to_yojson tree = list_to_yojson with_key_to_yojson tree

let trim_string_to_yojson (x : trim_string) =
  assoc_to_yojson [ ("withKeys", Some (trim_string_with_keys_to_yojson x.with_keys)) ]

let query_id_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson

let scheduled_query_destination_type_to_yojson (x : scheduled_query_destination_type) =
  match x with S3 -> `String "S3"

let action_status_to_yojson (x : action_status) =
  match x with
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"
  | CLIENT_ERROR -> `String "CLIENT_ERROR"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let scheduled_query_destination_to_yojson (x : scheduled_query_destination) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
      ("processedIdentifier", option_to_yojson string__to_yojson x.processed_identifier);
      ("status", option_to_yojson action_status_to_yojson x.status);
      ("destinationIdentifier", option_to_yojson string__to_yojson x.destination_identifier);
      ( "destinationType",
        option_to_yojson scheduled_query_destination_type_to_yojson x.destination_type );
    ]

let scheduled_query_destination_list_to_yojson tree =
  list_to_yojson scheduled_query_destination_to_yojson tree

let trigger_history_record_to_yojson (x : trigger_history_record) =
  assoc_to_yojson
    [
      ("destinations", option_to_yojson scheduled_query_destination_list_to_yojson x.destinations);
      ("errorMessage", option_to_yojson string__to_yojson x.error_message);
      ("triggeredTimestamp", option_to_yojson timestamp_to_yojson x.triggered_timestamp);
      ("executionStatus", option_to_yojson execution_status_to_yojson x.execution_status);
      ("queryId", option_to_yojson query_id_to_yojson x.query_id);
    ]

let trigger_history_record_list_to_yojson tree =
  list_to_yojson trigger_history_record_to_yojson tree

let event_number_to_yojson = long_to_yojson
let event_message_to_yojson = string_to_yojson
let transformed_event_message_to_yojson = string_to_yojson

let transformed_log_record_to_yojson (x : transformed_log_record) =
  assoc_to_yojson
    [
      ( "transformedEventMessage",
        option_to_yojson transformed_event_message_to_yojson x.transformed_event_message );
      ("eventMessage", option_to_yojson event_message_to_yojson x.event_message);
      ("eventNumber", option_to_yojson event_number_to_yojson x.event_number);
    ]

let transformed_logs_to_yojson tree = list_to_yojson transformed_log_record_to_yojson tree

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson
    [
      ("resourceName", option_to_yojson amazon_resource_name_to_yojson x.resource_name);
      ("message", option_to_yojson message_to_yojson x.message);
    ]

let token_value_to_yojson = long_to_yojson
let token_string_to_yojson = string_to_yojson
let token_to_yojson = string_to_yojson
let to_key_to_yojson = string_to_yojson
let time_to_yojson = string_to_yojson

let test_transformer_response_to_yojson (x : test_transformer_response) =
  assoc_to_yojson
    [ ("transformedLogs", option_to_yojson transformed_logs_to_yojson x.transformed_logs) ]

let add_key_value_to_yojson = string_to_yojson
let overwrite_if_exists_to_yojson = bool_to_yojson

let add_key_entry_to_yojson (x : add_key_entry) =
  assoc_to_yojson
    [
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
      ("value", Some (add_key_value_to_yojson x.value));
      ("key", Some (key_to_yojson x.key));
    ]

let add_key_entries_to_yojson tree = list_to_yojson add_key_entry_to_yojson tree

let add_keys_to_yojson (x : add_keys) =
  assoc_to_yojson [ ("entries", Some (add_key_entries_to_yojson x.entries)) ]

let source_to_yojson = string_to_yojson
let target_to_yojson = string_to_yojson

let copy_value_entry_to_yojson (x : copy_value_entry) =
  assoc_to_yojson
    [
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
      ("target", Some (target_to_yojson x.target));
      ("source", Some (source_to_yojson x.source));
    ]

let copy_value_entries_to_yojson tree = list_to_yojson copy_value_entry_to_yojson tree

let copy_value_to_yojson (x : copy_value) =
  assoc_to_yojson [ ("entries", Some (copy_value_entries_to_yojson x.entries)) ]

let quote_character_to_yojson = string_to_yojson
let delimiter_to_yojson = string_to_yojson
let column_to_yojson = string_to_yojson
let columns_to_yojson tree = list_to_yojson column_to_yojson tree
let destination_field_to_yojson = string_to_yojson

let cs_v_to_yojson (x : cs_v) =
  assoc_to_yojson
    [
      ("destination", option_to_yojson destination_field_to_yojson x.destination);
      ("source", option_to_yojson source_to_yojson x.source);
      ("columns", option_to_yojson columns_to_yojson x.columns);
      ("delimiter", option_to_yojson delimiter_to_yojson x.delimiter);
      ("quoteCharacter", option_to_yojson quote_character_to_yojson x.quote_character);
    ]

let target_format_to_yojson = string_to_yojson
let match_pattern_to_yojson = string_to_yojson
let match_patterns_to_yojson tree = list_to_yojson match_pattern_to_yojson tree
let source_timezone_to_yojson = string_to_yojson
let target_timezone_to_yojson = string_to_yojson
let locale_to_yojson = string_to_yojson

let date_time_converter_to_yojson (x : date_time_converter) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("targetTimezone", option_to_yojson target_timezone_to_yojson x.target_timezone);
      ("sourceTimezone", option_to_yojson source_timezone_to_yojson x.source_timezone);
      ("matchPatterns", Some (match_patterns_to_yojson x.match_patterns));
      ("targetFormat", option_to_yojson target_format_to_yojson x.target_format);
      ("target", Some (target_to_yojson x.target));
      ("source", Some (source_to_yojson x.source));
    ]

let delete_with_keys_to_yojson tree = list_to_yojson with_key_to_yojson tree

let delete_keys_to_yojson (x : delete_keys) =
  assoc_to_yojson [ ("withKeys", Some (delete_with_keys_to_yojson x.with_keys)) ]

let grok_match_to_yojson = string_to_yojson

let grok_to_yojson (x : grok) =
  assoc_to_yojson
    [
      ("match", Some (grok_match_to_yojson x.match_));
      ("source", option_to_yojson source_to_yojson x.source);
    ]

let flatten_to_yojson = bool_to_yojson

let flattened_element_to_yojson (x : flattened_element) =
  match x with LAST -> `String "last" | FIRST -> `String "first"

let list_to_map_to_yojson (x : list_to_map) =
  assoc_to_yojson
    [
      ("flattenedElement", option_to_yojson flattened_element_to_yojson x.flattened_element);
      ("flatten", option_to_yojson flatten_to_yojson x.flatten);
      ("target", option_to_yojson target_to_yojson x.target);
      ("valueKey", option_to_yojson value_key_to_yojson x.value_key);
      ("key", Some (key_to_yojson x.key));
      ("source", Some (source_to_yojson x.source));
    ]

let lower_case_string_with_keys_to_yojson tree = list_to_yojson with_key_to_yojson tree

let lower_case_string_to_yojson (x : lower_case_string) =
  assoc_to_yojson [ ("withKeys", Some (lower_case_string_with_keys_to_yojson x.with_keys)) ]

let move_key_entry_to_yojson (x : move_key_entry) =
  assoc_to_yojson
    [
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
      ("target", Some (target_to_yojson x.target));
      ("source", Some (source_to_yojson x.source));
    ]

let move_key_entries_to_yojson tree = list_to_yojson move_key_entry_to_yojson tree

let move_keys_to_yojson (x : move_keys) =
  assoc_to_yojson [ ("entries", Some (move_key_entries_to_yojson x.entries)) ]

let parse_cloudfront_to_yojson (x : parse_cloudfront) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let parse_jso_n_to_yojson (x : parse_jso_n) =
  assoc_to_yojson
    [
      ("destination", option_to_yojson destination_field_to_yojson x.destination);
      ("source", option_to_yojson source_to_yojson x.source);
    ]

let parser_field_delimiter_to_yojson = string_to_yojson
let key_value_delimiter_to_yojson = string_to_yojson
let key_prefix_to_yojson = string_to_yojson
let non_match_value_to_yojson = string_to_yojson

let parse_key_value_to_yojson (x : parse_key_value) =
  assoc_to_yojson
    [
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
      ("nonMatchValue", option_to_yojson non_match_value_to_yojson x.non_match_value);
      ("keyPrefix", option_to_yojson key_prefix_to_yojson x.key_prefix);
      ("keyValueDelimiter", option_to_yojson key_value_delimiter_to_yojson x.key_value_delimiter);
      ("fieldDelimiter", option_to_yojson parser_field_delimiter_to_yojson x.field_delimiter);
      ("destination", option_to_yojson destination_field_to_yojson x.destination);
      ("source", option_to_yojson source_to_yojson x.source);
    ]

let parse_route53_to_yojson (x : parse_route53) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let event_source_to_yojson (x : event_source) =
  match x with
  | AWSWAF -> `String "AWSWAF"
  | EKS_AUDIT -> `String "EKSAudit"
  | VPC_FLOW -> `String "VPCFlow"
  | ROUTE53_RESOLVER -> `String "Route53Resolver"
  | CLOUD_TRAIL -> `String "CloudTrail"

let ocsf_version_to_yojson (x : ocsf_version) =
  match x with V1_5 -> `String "V1.5" | V1_1 -> `String "V1.1"

let mapping_version_to_yojson = string_to_yojson

let parse_to_ocs_f_to_yojson (x : parse_to_ocs_f) =
  assoc_to_yojson
    [
      ("mappingVersion", option_to_yojson mapping_version_to_yojson x.mapping_version);
      ("ocsfVersion", Some (ocsf_version_to_yojson x.ocsf_version));
      ("eventSource", Some (event_source_to_yojson x.event_source));
      ("source", option_to_yojson source_to_yojson x.source);
    ]

let parse_postgres_to_yojson (x : parse_postgres) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let parse_vp_c_to_yojson (x : parse_vp_c) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let parse_wa_f_to_yojson (x : parse_wa_f) =
  assoc_to_yojson [ ("source", option_to_yojson source_to_yojson x.source) ]

let rename_to_to_yojson = string_to_yojson

let rename_key_entry_to_yojson (x : rename_key_entry) =
  assoc_to_yojson
    [
      ("overwriteIfExists", option_to_yojson overwrite_if_exists_to_yojson x.overwrite_if_exists);
      ("renameTo", Some (rename_to_to_yojson x.rename_to));
      ("key", Some (key_to_yojson x.key));
    ]

let rename_key_entries_to_yojson tree = list_to_yojson rename_key_entry_to_yojson tree

let rename_keys_to_yojson (x : rename_keys) =
  assoc_to_yojson [ ("entries", Some (rename_key_entries_to_yojson x.entries)) ]

let split_string_delimiter_to_yojson = string_to_yojson

let split_string_entry_to_yojson (x : split_string_entry) =
  assoc_to_yojson
    [
      ("delimiter", Some (split_string_delimiter_to_yojson x.delimiter));
      ("source", Some (source_to_yojson x.source));
    ]

let split_string_entries_to_yojson tree = list_to_yojson split_string_entry_to_yojson tree

let split_string_to_yojson (x : split_string) =
  assoc_to_yojson [ ("entries", Some (split_string_entries_to_yojson x.entries)) ]

let from_key_to_yojson = string_to_yojson

let substitute_string_entry_to_yojson (x : substitute_string_entry) =
  assoc_to_yojson
    [
      ("to", Some (to_key_to_yojson x.to_));
      ("from", Some (from_key_to_yojson x.from_));
      ("source", Some (source_to_yojson x.source));
    ]

let substitute_string_entries_to_yojson tree = list_to_yojson substitute_string_entry_to_yojson tree

let substitute_string_to_yojson (x : substitute_string) =
  assoc_to_yojson [ ("entries", Some (substitute_string_entries_to_yojson x.entries)) ]

let processor_to_yojson (x : processor) =
  assoc_to_yojson
    [
      ("upperCaseString", option_to_yojson upper_case_string_to_yojson x.upper_case_string);
      ("typeConverter", option_to_yojson type_converter_to_yojson x.type_converter);
      ("trimString", option_to_yojson trim_string_to_yojson x.trim_string);
      ("substituteString", option_to_yojson substitute_string_to_yojson x.substitute_string);
      ("splitString", option_to_yojson split_string_to_yojson x.split_string);
      ("renameKeys", option_to_yojson rename_keys_to_yojson x.rename_keys);
      ("parseWAF", option_to_yojson parse_wa_f_to_yojson x.parse_wa_f);
      ("parseVPC", option_to_yojson parse_vp_c_to_yojson x.parse_vp_c);
      ("parsePostgres", option_to_yojson parse_postgres_to_yojson x.parse_postgres);
      ("parseToOCSF", option_to_yojson parse_to_ocs_f_to_yojson x.parse_to_ocs_f);
      ("parseRoute53", option_to_yojson parse_route53_to_yojson x.parse_route53);
      ("parseKeyValue", option_to_yojson parse_key_value_to_yojson x.parse_key_value);
      ("parseJSON", option_to_yojson parse_jso_n_to_yojson x.parse_jso_n);
      ("parseCloudfront", option_to_yojson parse_cloudfront_to_yojson x.parse_cloudfront);
      ("moveKeys", option_to_yojson move_keys_to_yojson x.move_keys);
      ("lowerCaseString", option_to_yojson lower_case_string_to_yojson x.lower_case_string);
      ("listToMap", option_to_yojson list_to_map_to_yojson x.list_to_map);
      ("grok", option_to_yojson grok_to_yojson x.grok);
      ("deleteKeys", option_to_yojson delete_keys_to_yojson x.delete_keys);
      ("dateTimeConverter", option_to_yojson date_time_converter_to_yojson x.date_time_converter);
      ("csv", option_to_yojson cs_v_to_yojson x.csv);
      ("copyValue", option_to_yojson copy_value_to_yojson x.copy_value);
      ("addKeys", option_to_yojson add_keys_to_yojson x.add_keys);
    ]

let processors_to_yojson tree = list_to_yojson processor_to_yojson tree
let test_event_messages_to_yojson tree = list_to_yojson event_message_to_yojson tree

let test_transformer_request_to_yojson (x : test_transformer_request) =
  assoc_to_yojson
    [
      ("logEventMessages", Some (test_event_messages_to_yojson x.log_event_messages));
      ("transformerConfig", Some (processors_to_yojson x.transformer_config));
    ]

let invalid_operation_exception_to_yojson (x : invalid_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let extracted_values_to_yojson tree = map_to_yojson token_to_yojson value_to_yojson tree

let metric_filter_match_record_to_yojson (x : metric_filter_match_record) =
  assoc_to_yojson
    [
      ("extractedValues", option_to_yojson extracted_values_to_yojson x.extracted_values);
      ("eventMessage", option_to_yojson event_message_to_yojson x.event_message);
      ("eventNumber", option_to_yojson event_number_to_yojson x.event_number);
    ]

let metric_filter_matches_to_yojson tree = list_to_yojson metric_filter_match_record_to_yojson tree

let test_metric_filter_response_to_yojson (x : test_metric_filter_response) =
  assoc_to_yojson [ ("matches", option_to_yojson metric_filter_matches_to_yojson x.matches) ]

let test_metric_filter_request_to_yojson (x : test_metric_filter_request) =
  assoc_to_yojson
    [
      ("logEventMessages", Some (test_event_messages_to_yojson x.log_event_messages));
      ("filterPattern", Some (filter_pattern_to_yojson x.filter_pattern));
    ]

let target_arn_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("tags", Some (tags_to_yojson x.tags));
      ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn));
    ]

let tag_log_group_request_to_yojson (x : tag_log_group_request) =
  assoc_to_yojson
    [
      ("tags", Some (tags_to_yojson x.tags));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let tag_filter_key_to_yojson = string_to_yojson
let tag_filter_value_to_yojson = string_to_yojson
let tag_filter_values_to_yojson tree = list_to_yojson tag_filter_value_to_yojson tree

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson tag_filter_values_to_yojson x.values);
      ("key", Some (tag_filter_key_to_yojson x.key));
    ]

let tag_filters_to_yojson tree = list_to_yojson tag_filter_to_yojson tree
let table_fields_to_yojson tree = list_to_yojson string__to_yojson tree
let system_field_to_yojson = string_to_yojson
let syslog_source_type_to_yojson (x : syslog_source_type) = match x with VPCE -> `String "VPCE"
let log_group_arn_to_yojson = string_to_yojson

let syslog_configuration_to_yojson (x : syslog_configuration) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("vpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("sourceType", option_to_yojson syslog_source_type_to_yojson x.source_type);
      ("logGroupArn", option_to_yojson log_group_arn_to_yojson x.log_group_arn);
    ]

let syslog_configurations_to_yojson tree = list_to_yojson syslog_configuration_to_yojson tree

let suppression_state_to_yojson (x : suppression_state) =
  match x with UNSUPPRESSED -> `String "UNSUPPRESSED" | SUPPRESSED -> `String "SUPPRESSED"

let success_to_yojson = bool_to_yojson
let filter_name_to_yojson = string_to_yojson
let destination_arn_to_yojson = string_to_yojson

let distribution_to_yojson (x : distribution) =
  match x with ByLogStream -> `String "ByLogStream" | Random -> `String "Random"

let apply_on_transformed_logs_to_yojson = bool_to_yojson
let field_selection_criteria_to_yojson = string_to_yojson
let emit_system_fields_to_yojson tree = list_to_yojson system_field_to_yojson tree

let subscription_filter_to_yojson (x : subscription_filter) =
  assoc_to_yojson
    [
      ("emitSystemFields", option_to_yojson emit_system_fields_to_yojson x.emit_system_fields);
      ( "fieldSelectionCriteria",
        option_to_yojson field_selection_criteria_to_yojson x.field_selection_criteria );
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "applyOnTransformedLogs",
        option_to_yojson apply_on_transformed_logs_to_yojson x.apply_on_transformed_logs );
      ("distribution", option_to_yojson distribution_to_yojson x.distribution);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("destinationArn", option_to_yojson destination_arn_to_yojson x.destination_arn);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("filterName", option_to_yojson filter_name_to_yojson x.filter_name);
    ]

let subscription_filters_to_yojson tree = list_to_yojson subscription_filter_to_yojson tree
let stored_bytes_to_yojson = long_to_yojson

let stop_query_response_to_yojson (x : stop_query_response) =
  assoc_to_yojson [ ("success", option_to_yojson success_to_yojson x.success) ]

let stop_query_request_to_yojson (x : stop_query_request) =
  assoc_to_yojson [ ("queryId", Some (query_id_to_yojson x.query_id)) ]

let stats_value_to_yojson = double_to_yojson

let state_to_yojson (x : state) =
  match x with
  | Baseline -> `String "Baseline"
  | Suppressed -> `String "Suppressed"
  | Active -> `String "Active"

let start_query_response_to_yojson (x : start_query_response) =
  assoc_to_yojson [ ("queryId", option_to_yojson query_id_to_yojson x.query_id) ]

let log_group_names_to_yojson tree = list_to_yojson log_group_name_to_yojson tree
let log_group_identifiers_to_yojson tree = list_to_yojson log_group_identifier_to_yojson tree
let events_limit_start_query_to_yojson = int_to_yojson

let start_query_request_to_yojson (x : start_query_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson events_limit_start_query_to_yojson x.limit);
      ("queryString", Some (query_string_to_yojson x.query_string));
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ( "logGroupIdentifiers",
        option_to_yojson log_group_identifiers_to_yojson x.log_group_identifiers );
      ("logGroupNames", option_to_yojson log_group_names_to_yojson x.log_group_names);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
    ]

let query_char_offset_to_yojson = int_to_yojson

let query_compile_error_location_to_yojson (x : query_compile_error_location) =
  assoc_to_yojson
    [
      ("endCharOffset", option_to_yojson query_char_offset_to_yojson x.end_char_offset);
      ("startCharOffset", option_to_yojson query_char_offset_to_yojson x.start_char_offset);
    ]

let query_compile_error_to_yojson (x : query_compile_error) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("location", option_to_yojson query_compile_error_location_to_yojson x.location);
    ]

let malformed_query_exception_to_yojson (x : malformed_query_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("queryCompileError", option_to_yojson query_compile_error_to_yojson x.query_compile_error);
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let request_id_to_yojson = string_to_yojson
let session_id_to_yojson = string_to_yojson

let start_live_tail_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let log_stream_name_to_yojson = string_to_yojson
let input_log_stream_names_to_yojson tree = list_to_yojson log_stream_name_to_yojson tree

let live_tail_session_start_to_yojson (x : live_tail_session_start) =
  assoc_to_yojson
    [
      ("logEventFilterPattern", option_to_yojson filter_pattern_to_yojson x.log_event_filter_pattern);
      ( "logStreamNamePrefixes",
        option_to_yojson input_log_stream_names_to_yojson x.log_stream_name_prefixes );
      ("logStreamNames", option_to_yojson input_log_stream_names_to_yojson x.log_stream_names);
      ( "logGroupIdentifiers",
        option_to_yojson start_live_tail_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("sessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("requestId", option_to_yojson request_id_to_yojson x.request_id);
    ]

let is_sampled_to_yojson = bool_to_yojson

let live_tail_session_metadata_to_yojson (x : live_tail_session_metadata) =
  assoc_to_yojson [ ("sampled", option_to_yojson is_sampled_to_yojson x.sampled) ]

let live_tail_session_log_event_to_yojson (x : live_tail_session_log_event) =
  assoc_to_yojson
    [
      ("ingestionTime", option_to_yojson timestamp_to_yojson x.ingestion_time);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("message", option_to_yojson event_message_to_yojson x.message);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("logStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
    ]

let live_tail_session_results_to_yojson tree =
  list_to_yojson live_tail_session_log_event_to_yojson tree

let live_tail_session_update_to_yojson (x : live_tail_session_update) =
  assoc_to_yojson
    [
      ("sessionResults", option_to_yojson live_tail_session_results_to_yojson x.session_results);
      ("sessionMetadata", option_to_yojson live_tail_session_metadata_to_yojson x.session_metadata);
    ]

let session_timeout_exception_to_yojson (x : session_timeout_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let session_streaming_exception_to_yojson (x : session_streaming_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let start_live_tail_response_stream_to_yojson (x : start_live_tail_response_stream) =
  match x with
  | SessionStreamingException arg ->
      assoc_to_yojson
        [ ("SessionStreamingException", Some (session_streaming_exception_to_yojson arg)) ]
  | SessionTimeoutException arg ->
      assoc_to_yojson
        [ ("SessionTimeoutException", Some (session_timeout_exception_to_yojson arg)) ]
  | SessionUpdate arg ->
      assoc_to_yojson [ ("sessionUpdate", Some (live_tail_session_update_to_yojson arg)) ]
  | SessionStart arg ->
      assoc_to_yojson [ ("sessionStart", Some (live_tail_session_start_to_yojson arg)) ]

let start_live_tail_response_to_yojson (x : start_live_tail_response) =
  assoc_to_yojson
    [
      ( "responseStream",
        option_to_yojson start_live_tail_response_stream_to_yojson x.response_stream );
    ]

let start_live_tail_request_to_yojson (x : start_live_tail_request) =
  assoc_to_yojson
    [
      ("logEventFilterPattern", option_to_yojson filter_pattern_to_yojson x.log_event_filter_pattern);
      ( "logStreamNamePrefixes",
        option_to_yojson input_log_stream_names_to_yojson x.log_stream_name_prefixes );
      ("logStreamNames", option_to_yojson input_log_stream_names_to_yojson x.log_stream_names);
      ( "logGroupIdentifiers",
        Some (start_live_tail_log_group_identifiers_to_yojson x.log_group_identifiers) );
    ]

let start_from_head_to_yojson = bool_to_yojson

let standard_unit_to_yojson (x : standard_unit) =
  match x with
  | None_ -> `String "None"
  | CountSecond -> `String "Count/Second"
  | TerabitsSecond -> `String "Terabits/Second"
  | GigabitsSecond -> `String "Gigabits/Second"
  | MegabitsSecond -> `String "Megabits/Second"
  | KilobitsSecond -> `String "Kilobits/Second"
  | BitsSecond -> `String "Bits/Second"
  | TerabytesSecond -> `String "Terabytes/Second"
  | GigabytesSecond -> `String "Gigabytes/Second"
  | MegabytesSecond -> `String "Megabytes/Second"
  | KilobytesSecond -> `String "Kilobytes/Second"
  | BytesSecond -> `String "Bytes/Second"
  | Count -> `String "Count"
  | Percent -> `String "Percent"
  | Terabits -> `String "Terabits"
  | Gigabits -> `String "Gigabits"
  | Megabits -> `String "Megabits"
  | Kilobits -> `String "Kilobits"
  | Bits -> `String "Bits"
  | Terabytes -> `String "Terabytes"
  | Gigabytes -> `String "Gigabytes"
  | Megabytes -> `String "Megabytes"
  | Kilobytes -> `String "Kilobytes"
  | Bytes -> `String "Bytes"
  | Milliseconds -> `String "Milliseconds"
  | Microseconds -> `String "Microseconds"
  | Seconds -> `String "Seconds"

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let service_to_yojson = string_to_yojson
let sequence_token_to_yojson = string_to_yojson
let selection_criteria_to_yojson = string_to_yojson
let log_stream_searched_completely_to_yojson = bool_to_yojson

let searched_log_stream_to_yojson (x : searched_log_stream) =
  assoc_to_yojson
    [
      ( "searchedCompletely",
        option_to_yojson log_stream_searched_completely_to_yojson x.searched_completely );
      ("logStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
    ]

let searched_log_streams_to_yojson tree = list_to_yojson searched_log_stream_to_yojson tree
let scope_to_yojson (x : scope) = match x with ALL -> `String "ALL"

let scheduled_query_summary_to_yojson (x : scheduled_query_summary) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("scheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ("lastExecutionStatus", option_to_yojson execution_status_to_yojson x.last_execution_status);
      ("lastTriggeredTime", option_to_yojson timestamp_to_yojson x.last_triggered_time);
      ("scheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("name", option_to_yojson scheduled_query_name_to_yojson x.name);
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
    ]

let scheduled_query_summary_list_to_yojson tree =
  list_to_yojson scheduled_query_summary_to_yojson tree

let s3_tables_datasource_name_to_yojson = string_to_yojson
let s3_tables_datasource_type_to_yojson = string_to_yojson

let s3_tables_integration_to_yojson (x : s3_tables_integration) =
  assoc_to_yojson
    [
      ("datasourceType", option_to_yojson s3_tables_datasource_type_to_yojson x.datasource_type);
      ("datasourceName", option_to_yojson s3_tables_datasource_name_to_yojson x.datasource_name);
    ]

let s3_table_integration_source_identifier_to_yojson = string_to_yojson
let data_source_name_to_yojson = string_to_yojson
let data_source_type_to_yojson = string_to_yojson

let data_source_to_yojson (x : data_source) =
  assoc_to_yojson
    [
      ("type", option_to_yojson data_source_type_to_yojson x.type_);
      ("name", Some (data_source_name_to_yojson x.name));
    ]

let s3_table_integration_source_status_to_yojson (x : s3_table_integration_source_status) =
  match x with
  | DATA_SOURCE_DELETE_IN_PROGRESS -> `String "DATA_SOURCE_DELETE_IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | UNHEALTHY -> `String "UNHEALTHY"
  | ACTIVE -> `String "ACTIVE"

let s3_table_integration_source_status_reason_to_yojson = string_to_yojson

let s3_table_integration_source_to_yojson (x : s3_table_integration_source) =
  assoc_to_yojson
    [
      ( "parentSourceIdentifier",
        option_to_yojson s3_table_integration_source_identifier_to_yojson x.parent_source_identifier
      );
      ("createdTimeStamp", option_to_yojson timestamp_to_yojson x.created_time_stamp);
      ( "statusReason",
        option_to_yojson s3_table_integration_source_status_reason_to_yojson x.status_reason );
      ("status", option_to_yojson s3_table_integration_source_status_to_yojson x.status);
      ("dataSource", option_to_yojson data_source_to_yojson x.data_source);
      ("identifier", option_to_yojson s3_table_integration_source_identifier_to_yojson x.identifier);
    ]

let s3_table_integration_sources_to_yojson tree =
  list_to_yojson s3_table_integration_source_to_yojson tree

let field_to_yojson = string_to_yojson

let result_field_to_yojson (x : result_field) =
  assoc_to_yojson
    [
      ("value", option_to_yojson value_to_yojson x.value);
      ("field", option_to_yojson field_to_yojson x.field);
    ]

let result_rows_to_yojson tree = list_to_yojson result_field_to_yojson tree
let resource_type_to_yojson = string_to_yojson
let resource_types_to_yojson tree = list_to_yojson resource_type_to_yojson tree
let policy_name_to_yojson = string_to_yojson
let policy_document_to_yojson = string_to_yojson

let policy_scope_to_yojson (x : policy_scope) =
  match x with RESOURCE -> `String "RESOURCE" | ACCOUNT -> `String "ACCOUNT"

let expected_revision_id_to_yojson = string_to_yojson

let resource_policy_to_yojson (x : resource_policy) =
  assoc_to_yojson
    [
      ("revisionId", option_to_yojson expected_revision_id_to_yojson x.revision_id);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("policyScope", option_to_yojson policy_scope_to_yojson x.policy_scope);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("policyDocument", option_to_yojson policy_document_to_yojson x.policy_document);
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
    ]

let resource_policies_to_yojson tree = list_to_yojson resource_policy_to_yojson tree
let resource_identifier_to_yojson = string_to_yojson
let dashboard_viewer_principals_to_yojson tree = list_to_yojson arn_to_yojson tree
let collection_retention_days_to_yojson = int_to_yojson

let open_search_resource_config_to_yojson (x : open_search_resource_config) =
  assoc_to_yojson
    [
      ("retentionDays", Some (collection_retention_days_to_yojson x.retention_days));
      ("applicationArn", option_to_yojson arn_to_yojson x.application_arn);
      ( "dashboardViewerPrincipals",
        Some (dashboard_viewer_principals_to_yojson x.dashboard_viewer_principals) );
      ("dataSourceRoleArn", Some (arn_to_yojson x.data_source_role_arn));
      ("kmsKeyArn", option_to_yojson arn_to_yojson x.kms_key_arn);
    ]

let resource_config_to_yojson (x : resource_config) =
  match x with
  | OpenSearchResourceConfig arg ->
      assoc_to_yojson
        [ ("openSearchResourceConfig", Some (open_search_resource_config_to_yojson arg)) ]

let resource_arns_to_yojson tree = list_to_yojson arn_to_yojson tree

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let log_event_index_to_yojson = int_to_yojson

let rejected_log_events_info_to_yojson (x : rejected_log_events_info) =
  assoc_to_yojson
    [
      ( "expiredLogEventEndIndex",
        option_to_yojson log_event_index_to_yojson x.expired_log_event_end_index );
      ( "tooOldLogEventEndIndex",
        option_to_yojson log_event_index_to_yojson x.too_old_log_event_end_index );
      ( "tooNewLogEventStartIndex",
        option_to_yojson log_event_index_to_yojson x.too_new_log_event_start_index );
    ]

let entity_rejection_error_type_to_yojson (x : entity_rejection_error_type) =
  match x with
  | MISSING_REQUIRED_FIELDS -> `String "MissingRequiredFields"
  | UNSUPPORTED_LOG_GROUP_TYPE -> `String "UnsupportedLogGroupType"
  | ENTITY_SIZE_TOO_LARGE -> `String "EntitySizeTooLarge"
  | INVALID_ATTRIBUTES -> `String "InvalidAttributes"
  | INVALID_KEY_ATTRIBUTE -> `String "InvalidKeyAttributes"
  | INVALID_TYPE_VALUE -> `String "InvalidTypeValue"
  | INVALID_ENTITY -> `String "InvalidEntity"

let rejected_entity_info_to_yojson (x : rejected_entity_info) =
  assoc_to_yojson [ ("errorType", Some (entity_rejection_error_type_to_yojson x.error_type)) ]

let records_count_to_yojson = long_to_yojson

let record_field_to_yojson (x : record_field) =
  assoc_to_yojson
    [
      ("mandatory", option_to_yojson boolean__to_yojson x.mandatory);
      ("name", option_to_yojson field_header_to_yojson x.name);
    ]

let query_status_to_yojson (x : query_status) =
  match x with
  | Unknown -> `String "Unknown"
  | Timeout -> `String "Timeout"
  | Cancelled -> `String "Cancelled"
  | Failed -> `String "Failed"
  | Complete -> `String "Complete"
  | Running -> `String "Running"
  | Scheduled -> `String "Scheduled"

let query_statistics_to_yojson (x : query_statistics) =
  assoc_to_yojson
    [
      ("logGroupsScanned", option_to_yojson stats_value_to_yojson x.log_groups_scanned);
      ("estimatedBytesSkipped", option_to_yojson stats_value_to_yojson x.estimated_bytes_skipped);
      ("bytesScanned", option_to_yojson stats_value_to_yojson x.bytes_scanned);
      ("estimatedRecordsSkipped", option_to_yojson stats_value_to_yojson x.estimated_records_skipped);
      ("recordsScanned", option_to_yojson stats_value_to_yojson x.records_scanned);
      ("recordsMatched", option_to_yojson stats_value_to_yojson x.records_matched);
    ]

let query_results_to_yojson tree = list_to_yojson result_rows_to_yojson tree
let query_parameter_name_to_yojson = string_to_yojson
let query_parameter_default_value_to_yojson = string_to_yojson
let query_parameter_description_to_yojson = string_to_yojson

let query_parameter_to_yojson (x : query_parameter) =
  assoc_to_yojson
    [
      ("description", option_to_yojson query_parameter_description_to_yojson x.description);
      ("defaultValue", option_to_yojson query_parameter_default_value_to_yojson x.default_value);
      ("name", Some (query_parameter_name_to_yojson x.name));
    ]

let query_parameter_list_to_yojson tree = list_to_yojson query_parameter_to_yojson tree
let query_list_max_results_to_yojson = int_to_yojson
let query_duration_to_yojson = long_to_yojson
let bytes_scanned_value_to_yojson = double_to_yojson

let query_info_to_yojson (x : query_info) =
  assoc_to_yojson
    [
      ("userIdentity", option_to_yojson user_identity_to_yojson x.user_identity);
      ("bytesScanned", option_to_yojson bytes_scanned_value_to_yojson x.bytes_scanned);
      ("queryDuration", option_to_yojson query_duration_to_yojson x.query_duration);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("createTime", option_to_yojson timestamp_to_yojson x.create_time);
      ("status", option_to_yojson query_status_to_yojson x.status);
      ("queryString", option_to_yojson query_string_to_yojson x.query_string);
      ("queryId", option_to_yojson query_id_to_yojson x.query_id);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
    ]

let query_info_list_to_yojson tree = list_to_yojson query_info_to_yojson tree
let query_definition_string_to_yojson = string_to_yojson
let query_definition_name_to_yojson = string_to_yojson

let query_definition_to_yojson (x : query_definition) =
  assoc_to_yojson
    [
      ("parameters", option_to_yojson query_parameter_list_to_yojson x.parameters);
      ("logGroupNames", option_to_yojson log_group_names_to_yojson x.log_group_names);
      ("lastModified", option_to_yojson timestamp_to_yojson x.last_modified);
      ("queryString", option_to_yojson query_definition_string_to_yojson x.query_string);
      ("name", option_to_yojson query_definition_name_to_yojson x.name);
      ("queryDefinitionId", option_to_yojson query_id_to_yojson x.query_definition_id);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
    ]

let query_definition_list_to_yojson tree = list_to_yojson query_definition_to_yojson tree

let put_transformer_request_to_yojson (x : put_transformer_request) =
  assoc_to_yojson
    [
      ("transformerConfig", Some (processors_to_yojson x.transformer_config));
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
    ]

let put_syslog_configuration_request_to_yojson (x : put_syslog_configuration_request) =
  assoc_to_yojson
    [
      ("vpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
    ]

let put_subscription_filter_request_to_yojson (x : put_subscription_filter_request) =
  assoc_to_yojson
    [
      ("emitSystemFields", option_to_yojson emit_system_fields_to_yojson x.emit_system_fields);
      ( "fieldSelectionCriteria",
        option_to_yojson field_selection_criteria_to_yojson x.field_selection_criteria );
      ( "applyOnTransformedLogs",
        option_to_yojson apply_on_transformed_logs_to_yojson x.apply_on_transformed_logs );
      ("distribution", option_to_yojson distribution_to_yojson x.distribution);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("destinationArn", Some (destination_arn_to_yojson x.destination_arn));
      ("filterPattern", Some (filter_pattern_to_yojson x.filter_pattern));
      ("filterName", Some (filter_name_to_yojson x.filter_name));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let days_to_yojson = int_to_yojson

let put_retention_policy_request_to_yojson (x : put_retention_policy_request) =
  assoc_to_yojson
    [
      ("retentionInDays", Some (days_to_yojson x.retention_in_days));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("revisionId", option_to_yojson expected_revision_id_to_yojson x.revision_id);
      ("resourcePolicy", option_to_yojson resource_policy_to_yojson x.resource_policy);
    ]

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("expectedRevisionId", option_to_yojson expected_revision_id_to_yojson x.expected_revision_id);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("policyDocument", option_to_yojson policy_document_to_yojson x.policy_document);
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
    ]

let put_query_definition_response_to_yojson (x : put_query_definition_response) =
  assoc_to_yojson
    [ ("queryDefinitionId", option_to_yojson query_id_to_yojson x.query_definition_id) ]

let client_token_to_yojson = string_to_yojson

let put_query_definition_request_to_yojson (x : put_query_definition_request) =
  assoc_to_yojson
    [
      ("parameters", option_to_yojson query_parameter_list_to_yojson x.parameters);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("queryString", Some (query_definition_string_to_yojson x.query_string));
      ("logGroupNames", option_to_yojson log_group_names_to_yojson x.log_group_names);
      ("queryDefinitionId", option_to_yojson query_id_to_yojson x.query_definition_id);
      ("name", Some (query_definition_name_to_yojson x.name));
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
    ]

let metric_name_to_yojson = string_to_yojson
let metric_namespace_to_yojson = string_to_yojson
let metric_value_to_yojson = string_to_yojson
let default_value_to_yojson = double_to_yojson
let dimensions_value_to_yojson = string_to_yojson
let dimensions_key_to_yojson = string_to_yojson

let dimensions_to_yojson tree =
  map_to_yojson dimensions_key_to_yojson dimensions_value_to_yojson tree

let metric_transformation_to_yojson (x : metric_transformation) =
  assoc_to_yojson
    [
      ("unit", option_to_yojson standard_unit_to_yojson x.unit_);
      ("dimensions", option_to_yojson dimensions_to_yojson x.dimensions);
      ("defaultValue", option_to_yojson default_value_to_yojson x.default_value);
      ("metricValue", Some (metric_value_to_yojson x.metric_value));
      ("metricNamespace", Some (metric_namespace_to_yojson x.metric_namespace));
      ("metricName", Some (metric_name_to_yojson x.metric_name));
    ]

let metric_transformations_to_yojson tree = list_to_yojson metric_transformation_to_yojson tree

let put_metric_filter_request_to_yojson (x : put_metric_filter_request) =
  assoc_to_yojson
    [
      ( "emitSystemFieldDimensions",
        option_to_yojson emit_system_fields_to_yojson x.emit_system_field_dimensions );
      ( "fieldSelectionCriteria",
        option_to_yojson field_selection_criteria_to_yojson x.field_selection_criteria );
      ( "applyOnTransformedLogs",
        option_to_yojson apply_on_transformed_logs_to_yojson x.apply_on_transformed_logs );
      ("metricTransformations", Some (metric_transformations_to_yojson x.metric_transformations));
      ("filterPattern", Some (filter_pattern_to_yojson x.filter_pattern));
      ("filterName", Some (filter_name_to_yojson x.filter_name));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let deletion_protection_enabled_to_yojson = bool_to_yojson

let put_log_group_deletion_protection_request_to_yojson
    (x : put_log_group_deletion_protection_request) =
  assoc_to_yojson
    [
      ( "deletionProtectionEnabled",
        Some (deletion_protection_enabled_to_yojson x.deletion_protection_enabled) );
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
    ]

let put_log_events_response_to_yojson (x : put_log_events_response) =
  assoc_to_yojson
    [
      ("rejectedEntityInfo", option_to_yojson rejected_entity_info_to_yojson x.rejected_entity_info);
      ( "rejectedLogEventsInfo",
        option_to_yojson rejected_log_events_info_to_yojson x.rejected_log_events_info );
      ("nextSequenceToken", option_to_yojson sequence_token_to_yojson x.next_sequence_token);
    ]

let input_log_event_to_yojson (x : input_log_event) =
  assoc_to_yojson
    [
      ("message", Some (event_message_to_yojson x.message));
      ("timestamp", Some (timestamp_to_yojson x.timestamp));
    ]

let input_log_events_to_yojson tree = list_to_yojson input_log_event_to_yojson tree
let entity_key_attributes_value_to_yojson = string_to_yojson
let entity_key_attributes_key_to_yojson = string_to_yojson

let entity_key_attributes_to_yojson tree =
  map_to_yojson entity_key_attributes_key_to_yojson entity_key_attributes_value_to_yojson tree

let entity_attributes_value_to_yojson = string_to_yojson
let entity_attributes_key_to_yojson = string_to_yojson

let entity_attributes_to_yojson tree =
  map_to_yojson entity_attributes_key_to_yojson entity_attributes_value_to_yojson tree

let entity_to_yojson (x : entity) =
  assoc_to_yojson
    [
      ("attributes", option_to_yojson entity_attributes_to_yojson x.attributes);
      ("keyAttributes", option_to_yojson entity_key_attributes_to_yojson x.key_attributes);
    ]

let put_log_events_request_to_yojson (x : put_log_events_request) =
  assoc_to_yojson
    [
      ("entity", option_to_yojson entity_to_yojson x.entity);
      ("sequenceToken", option_to_yojson sequence_token_to_yojson x.sequence_token);
      ("logEvents", Some (input_log_events_to_yojson x.log_events));
      ("logStreamName", Some (log_stream_name_to_yojson x.log_stream_name));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let invalid_sequence_token_exception_to_yojson (x : invalid_sequence_token_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("expectedSequenceToken", option_to_yojson sequence_token_to_yojson x.expected_sequence_token);
    ]

let data_already_accepted_exception_to_yojson (x : data_already_accepted_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson message_to_yojson x.message);
      ("expectedSequenceToken", option_to_yojson sequence_token_to_yojson x.expected_sequence_token);
    ]

let integration_name_to_yojson = string_to_yojson

let integration_status_to_yojson (x : integration_status) =
  match x with
  | FAILED -> `String "FAILED"
  | ACTIVE -> `String "ACTIVE"
  | PROVISIONING -> `String "PROVISIONING"

let put_integration_response_to_yojson (x : put_integration_response) =
  assoc_to_yojson
    [
      ("integrationStatus", option_to_yojson integration_status_to_yojson x.integration_status);
      ("integrationName", option_to_yojson integration_name_to_yojson x.integration_name);
    ]

let integration_type_to_yojson (x : integration_type) =
  match x with OPENSEARCH -> `String "OPENSEARCH"

let put_integration_request_to_yojson (x : put_integration_request) =
  assoc_to_yojson
    [
      ("integrationType", Some (integration_type_to_yojson x.integration_type));
      ("resourceConfig", Some (resource_config_to_yojson x.resource_config));
      ("integrationName", Some (integration_name_to_yojson x.integration_name));
    ]

let index_source_to_yojson (x : index_source) =
  match x with LOG_GROUP -> `String "LOG_GROUP" | ACCOUNT -> `String "ACCOUNT"

let index_policy_to_yojson (x : index_policy) =
  assoc_to_yojson
    [
      ("source", option_to_yojson index_source_to_yojson x.source);
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("policyDocument", option_to_yojson policy_document_to_yojson x.policy_document);
      ("lastUpdateTime", option_to_yojson timestamp_to_yojson x.last_update_time);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
    ]

let put_index_policy_response_to_yojson (x : put_index_policy_response) =
  assoc_to_yojson [ ("indexPolicy", option_to_yojson index_policy_to_yojson x.index_policy) ]

let put_index_policy_request_to_yojson (x : put_index_policy_request) =
  assoc_to_yojson
    [
      ("policyDocument", Some (policy_document_to_yojson x.policy_document));
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
    ]

let destination_name_to_yojson = string_to_yojson
let access_policy_to_yojson = string_to_yojson

let destination_to_yojson (x : destination) =
  assoc_to_yojson
    [
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("accessPolicy", option_to_yojson access_policy_to_yojson x.access_policy);
      ("roleArn", option_to_yojson role_arn_to_yojson x.role_arn);
      ("targetArn", option_to_yojson target_arn_to_yojson x.target_arn);
      ("destinationName", option_to_yojson destination_name_to_yojson x.destination_name);
    ]

let put_destination_response_to_yojson (x : put_destination_response) =
  assoc_to_yojson [ ("destination", option_to_yojson destination_to_yojson x.destination) ]

let put_destination_request_to_yojson (x : put_destination_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("roleArn", Some (role_arn_to_yojson x.role_arn));
      ("targetArn", Some (target_arn_to_yojson x.target_arn));
      ("destinationName", Some (destination_name_to_yojson x.destination_name));
    ]

let force_update_to_yojson = bool_to_yojson

let put_destination_policy_request_to_yojson (x : put_destination_policy_request) =
  assoc_to_yojson
    [
      ("forceUpdate", option_to_yojson force_update_to_yojson x.force_update);
      ("accessPolicy", Some (access_policy_to_yojson x.access_policy));
      ("destinationName", Some (destination_name_to_yojson x.destination_name));
    ]

let delivery_source_name_to_yojson = string_to_yojson
let log_type_to_yojson = string_to_yojson
let delivery_source_configuration_value_to_yojson = string_to_yojson
let delivery_source_configuration_key_to_yojson = string_to_yojson

let delivery_source_configuration_to_yojson tree =
  map_to_yojson delivery_source_configuration_key_to_yojson
    delivery_source_configuration_value_to_yojson tree

let delivery_source_status_to_yojson (x : delivery_source_status) =
  match x with INACTIVE -> `String "INACTIVE" | ACTIVE -> `String "ACTIVE"

let delivery_source_status_reason_to_yojson (x : delivery_source_status_reason) =
  match x with RESOURCE_DELETED -> `String "RESOURCE_DELETED"

let delivery_source_to_yojson (x : delivery_source) =
  assoc_to_yojson
    [
      ("statusReason", option_to_yojson delivery_source_status_reason_to_yojson x.status_reason);
      ("status", option_to_yojson delivery_source_status_to_yojson x.status);
      ( "deliverySourceConfiguration",
        option_to_yojson delivery_source_configuration_to_yojson x.delivery_source_configuration );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("logType", option_to_yojson log_type_to_yojson x.log_type);
      ("service", option_to_yojson service_to_yojson x.service);
      ("resourceArns", option_to_yojson resource_arns_to_yojson x.resource_arns);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson delivery_source_name_to_yojson x.name);
    ]

let put_delivery_source_response_to_yojson (x : put_delivery_source_response) =
  assoc_to_yojson
    [ ("deliverySource", option_to_yojson delivery_source_to_yojson x.delivery_source) ]

let put_delivery_source_request_to_yojson (x : put_delivery_source_request) =
  assoc_to_yojson
    [
      ( "deliverySourceConfiguration",
        option_to_yojson delivery_source_configuration_to_yojson x.delivery_source_configuration );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("logType", Some (log_type_to_yojson x.log_type));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("name", Some (delivery_source_name_to_yojson x.name));
    ]

let delivery_destination_name_to_yojson = string_to_yojson

let delivery_destination_type_to_yojson (x : delivery_destination_type) =
  match x with
  | XRAY -> `String "XRAY"
  | FH -> `String "FH"
  | CWL -> `String "CWL"
  | S3 -> `String "S3"

let output_format_to_yojson (x : output_format) =
  match x with
  | PARQUET -> `String "parquet"
  | RAW -> `String "raw"
  | W3C -> `String "w3c"
  | PLAIN -> `String "plain"
  | JSON -> `String "json"

let delivery_destination_configuration_to_yojson (x : delivery_destination_configuration) =
  assoc_to_yojson [ ("destinationResourceArn", Some (arn_to_yojson x.destination_resource_arn)) ]

let delivery_destination_to_yojson (x : delivery_destination) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "deliveryDestinationConfiguration",
        option_to_yojson delivery_destination_configuration_to_yojson
          x.delivery_destination_configuration );
      ("outputFormat", option_to_yojson output_format_to_yojson x.output_format);
      ( "deliveryDestinationType",
        option_to_yojson delivery_destination_type_to_yojson x.delivery_destination_type );
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("name", option_to_yojson delivery_destination_name_to_yojson x.name);
    ]

let put_delivery_destination_response_to_yojson (x : put_delivery_destination_response) =
  assoc_to_yojson
    [
      ("deliveryDestination", option_to_yojson delivery_destination_to_yojson x.delivery_destination);
    ]

let put_delivery_destination_request_to_yojson (x : put_delivery_destination_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "deliveryDestinationType",
        option_to_yojson delivery_destination_type_to_yojson x.delivery_destination_type );
      ( "deliveryDestinationConfiguration",
        option_to_yojson delivery_destination_configuration_to_yojson
          x.delivery_destination_configuration );
      ("outputFormat", option_to_yojson output_format_to_yojson x.output_format);
      ("name", Some (delivery_destination_name_to_yojson x.name));
    ]

let delivery_destination_policy_to_yojson = string_to_yojson

let policy_to_yojson (x : policy) =
  assoc_to_yojson
    [
      ( "deliveryDestinationPolicy",
        option_to_yojson delivery_destination_policy_to_yojson x.delivery_destination_policy );
    ]

let put_delivery_destination_policy_response_to_yojson
    (x : put_delivery_destination_policy_response) =
  assoc_to_yojson [ ("policy", option_to_yojson policy_to_yojson x.policy) ]

let put_delivery_destination_policy_request_to_yojson (x : put_delivery_destination_policy_request)
    =
  assoc_to_yojson
    [
      ( "deliveryDestinationPolicy",
        Some (delivery_destination_policy_to_yojson x.delivery_destination_policy) );
      ( "deliveryDestinationName",
        Some (delivery_destination_name_to_yojson x.delivery_destination_name) );
    ]

let data_protection_policy_document_to_yojson = string_to_yojson

let put_data_protection_policy_response_to_yojson (x : put_data_protection_policy_response) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ( "policyDocument",
        option_to_yojson data_protection_policy_document_to_yojson x.policy_document );
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
    ]

let put_data_protection_policy_request_to_yojson (x : put_data_protection_policy_request) =
  assoc_to_yojson
    [
      ("policyDocument", Some (data_protection_policy_document_to_yojson x.policy_document));
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
    ]

let bearer_token_authentication_enabled_to_yojson = bool_to_yojson

let put_bearer_token_authentication_request_to_yojson (x : put_bearer_token_authentication_request)
    =
  assoc_to_yojson
    [
      ( "bearerTokenAuthenticationEnabled",
        Some (bearer_token_authentication_enabled_to_yojson x.bearer_token_authentication_enabled)
      );
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
    ]

let account_policy_document_to_yojson = string_to_yojson

let policy_type_to_yojson (x : policy_type) =
  match x with
  | METRIC_EXTRACTION_POLICY -> `String "METRIC_EXTRACTION_POLICY"
  | TRANSFORMER_POLICY -> `String "TRANSFORMER_POLICY"
  | FIELD_INDEX_POLICY -> `String "FIELD_INDEX_POLICY"
  | SUBSCRIPTION_FILTER_POLICY -> `String "SUBSCRIPTION_FILTER_POLICY"
  | DATA_PROTECTION_POLICY -> `String "DATA_PROTECTION_POLICY"

let account_policy_to_yojson (x : account_policy) =
  assoc_to_yojson
    [
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("selectionCriteria", option_to_yojson selection_criteria_to_yojson x.selection_criteria);
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("policyType", option_to_yojson policy_type_to_yojson x.policy_type);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("policyDocument", option_to_yojson account_policy_document_to_yojson x.policy_document);
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
    ]

let put_account_policy_response_to_yojson (x : put_account_policy_response) =
  assoc_to_yojson [ ("accountPolicy", option_to_yojson account_policy_to_yojson x.account_policy) ]

let put_account_policy_request_to_yojson (x : put_account_policy_request) =
  assoc_to_yojson
    [
      ("selectionCriteria", option_to_yojson selection_criteria_to_yojson x.selection_criteria);
      ("scope", option_to_yojson scope_to_yojson x.scope);
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("policyDocument", Some (account_policy_document_to_yojson x.policy_document));
      ("policyName", Some (policy_name_to_yojson x.policy_name));
    ]

let priority_to_yojson = string_to_yojson
let percentage_to_yojson = int_to_yojson
let dynamic_token_position_to_yojson = int_to_yojson
let enumerations_to_yojson tree = map_to_yojson token_string_to_yojson token_value_to_yojson tree
let inferred_token_name_to_yojson = string_to_yojson

let pattern_token_to_yojson (x : pattern_token) =
  assoc_to_yojson
    [
      ("inferredTokenName", option_to_yojson inferred_token_name_to_yojson x.inferred_token_name);
      ("enumerations", option_to_yojson enumerations_to_yojson x.enumerations);
      ("tokenString", option_to_yojson token_string_to_yojson x.token_string);
      ("isDynamic", option_to_yojson boolean__to_yojson x.is_dynamic);
      ( "dynamicTokenPosition",
        option_to_yojson dynamic_token_position_to_yojson x.dynamic_token_position );
    ]

let pattern_tokens_to_yojson tree = list_to_yojson pattern_token_to_yojson tree
let pattern_string_to_yojson = string_to_yojson
let pattern_regex_to_yojson = string_to_yojson

let output_log_event_to_yojson (x : output_log_event) =
  assoc_to_yojson
    [
      ("ingestionTime", option_to_yojson timestamp_to_yojson x.ingestion_time);
      ("message", option_to_yojson event_message_to_yojson x.message);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let output_log_events_to_yojson tree = list_to_yojson output_log_event_to_yojson tree
let output_formats_to_yojson tree = list_to_yojson output_format_to_yojson tree

let order_by_to_yojson (x : order_by) =
  match x with LastEventTime -> `String "LastEventTime" | LogStreamName -> `String "LogStreamName"

let open_search_workspace_id_to_yojson = string_to_yojson

let open_search_resource_status_type_to_yojson (x : open_search_resource_status_type) =
  match x with
  | ERROR -> `String "ERROR"
  | NOT_FOUND -> `String "NOT_FOUND"
  | ACTIVE -> `String "ACTIVE"

let integration_status_message_to_yojson = string_to_yojson

let open_search_resource_status_to_yojson (x : open_search_resource_status) =
  assoc_to_yojson
    [
      ("statusMessage", option_to_yojson integration_status_message_to_yojson x.status_message);
      ("status", option_to_yojson open_search_resource_status_type_to_yojson x.status);
    ]

let open_search_workspace_to_yojson (x : open_search_workspace) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
      ("workspaceId", option_to_yojson open_search_workspace_id_to_yojson x.workspace_id);
    ]

let open_search_policy_name_to_yojson = string_to_yojson

let open_search_network_policy_to_yojson (x : open_search_network_policy) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
      ("policyName", option_to_yojson open_search_policy_name_to_yojson x.policy_name);
    ]

let open_search_lifecycle_policy_to_yojson (x : open_search_lifecycle_policy) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
      ("policyName", option_to_yojson open_search_policy_name_to_yojson x.policy_name);
    ]

let open_search_data_source_name_to_yojson = string_to_yojson

let open_search_data_source_to_yojson (x : open_search_data_source) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
      ("dataSourceName", option_to_yojson open_search_data_source_name_to_yojson x.data_source_name);
    ]

let open_search_application_endpoint_to_yojson = string_to_yojson
let open_search_application_id_to_yojson = string_to_yojson

let open_search_application_to_yojson (x : open_search_application) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
      ("applicationId", option_to_yojson open_search_application_id_to_yojson x.application_id);
      ("applicationArn", option_to_yojson arn_to_yojson x.application_arn);
      ( "applicationEndpoint",
        option_to_yojson open_search_application_endpoint_to_yojson x.application_endpoint );
    ]

let open_search_collection_endpoint_to_yojson = string_to_yojson

let open_search_collection_to_yojson (x : open_search_collection) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
      ("collectionArn", option_to_yojson arn_to_yojson x.collection_arn);
      ( "collectionEndpoint",
        option_to_yojson open_search_collection_endpoint_to_yojson x.collection_endpoint );
    ]

let open_search_encryption_policy_to_yojson (x : open_search_encryption_policy) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
      ("policyName", option_to_yojson open_search_policy_name_to_yojson x.policy_name);
    ]

let open_search_data_access_policy_to_yojson (x : open_search_data_access_policy) =
  assoc_to_yojson
    [
      ("status", option_to_yojson open_search_resource_status_to_yojson x.status);
      ("policyName", option_to_yojson open_search_policy_name_to_yojson x.policy_name);
    ]

let open_search_integration_details_to_yojson (x : open_search_integration_details) =
  assoc_to_yojson
    [
      ("lifecyclePolicy", option_to_yojson open_search_lifecycle_policy_to_yojson x.lifecycle_policy);
      ("accessPolicy", option_to_yojson open_search_data_access_policy_to_yojson x.access_policy);
      ("networkPolicy", option_to_yojson open_search_network_policy_to_yojson x.network_policy);
      ( "encryptionPolicy",
        option_to_yojson open_search_encryption_policy_to_yojson x.encryption_policy );
      ("workspace", option_to_yojson open_search_workspace_to_yojson x.workspace);
      ("collection", option_to_yojson open_search_collection_to_yojson x.collection);
      ("application", option_to_yojson open_search_application_to_yojson x.application);
      ("dataSource", option_to_yojson open_search_data_source_to_yojson x.data_source);
    ]

let next_token_to_yojson = string_to_yojson

let metric_filter_to_yojson (x : metric_filter) =
  assoc_to_yojson
    [
      ( "emitSystemFieldDimensions",
        option_to_yojson emit_system_fields_to_yojson x.emit_system_field_dimensions );
      ( "fieldSelectionCriteria",
        option_to_yojson field_selection_criteria_to_yojson x.field_selection_criteria );
      ( "applyOnTransformedLogs",
        option_to_yojson apply_on_transformed_logs_to_yojson x.apply_on_transformed_logs );
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ( "metricTransformations",
        option_to_yojson metric_transformations_to_yojson x.metric_transformations );
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("filterName", option_to_yojson filter_name_to_yojson x.filter_name);
    ]

let metric_filters_to_yojson tree = list_to_yojson metric_filter_to_yojson tree
let lookup_table_name_to_yojson = string_to_yojson

let lookup_table_to_yojson (x : lookup_table) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("sizeBytes", option_to_yojson stored_bytes_to_yojson x.size_bytes);
      ("recordsCount", option_to_yojson records_count_to_yojson x.records_count);
      ("tableFields", option_to_yojson table_fields_to_yojson x.table_fields);
      ("description", option_to_yojson lookup_table_description_to_yojson x.description);
      ("lookupTableName", option_to_yojson lookup_table_name_to_yojson x.lookup_table_name);
      ("lookupTableArn", option_to_yojson arn_to_yojson x.lookup_table_arn);
    ]

let lookup_tables_to_yojson tree = list_to_yojson lookup_table_to_yojson tree

let list_tags_log_group_response_to_yojson (x : list_tags_log_group_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_log_group_request_to_yojson (x : list_tags_log_group_request) =
  assoc_to_yojson [ ("logGroupName", Some (log_group_name_to_yojson x.log_group_name)) ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (amazon_resource_name_to_yojson x.resource_arn)) ]

let list_syslog_configurations_response_to_yojson (x : list_syslog_configurations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "syslogConfigurations",
        option_to_yojson syslog_configurations_to_yojson x.syslog_configurations );
    ]

let list_syslog_configurations_max_results_to_yojson = int_to_yojson

let list_syslog_configurations_request_to_yojson (x : list_syslog_configurations_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_syslog_configurations_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("vpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
    ]

let list_sources_for_s3_table_integration_response_to_yojson
    (x : list_sources_for_s3_table_integration_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("sources", option_to_yojson s3_table_integration_sources_to_yojson x.sources);
    ]

let list_sources_for_s3_table_integration_max_results_to_yojson = int_to_yojson

let list_sources_for_s3_table_integration_request_to_yojson
    (x : list_sources_for_s3_table_integration_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson list_sources_for_s3_table_integration_max_results_to_yojson x.max_results
      );
      ("integrationArn", Some (arn_to_yojson x.integration_arn));
    ]

let list_scheduled_queries_response_to_yojson (x : list_scheduled_queries_response) =
  assoc_to_yojson
    [
      ( "scheduledQueries",
        option_to_yojson scheduled_query_summary_list_to_yojson x.scheduled_queries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_scheduled_queries_max_results_to_yojson = int_to_yojson

let list_scheduled_queries_request_to_yojson (x : list_scheduled_queries_request) =
  assoc_to_yojson
    [
      ("scheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_scheduled_queries_max_results_to_yojson x.max_results);
    ]

let list_log_groups_for_query_response_to_yojson (x : list_log_groups_for_query_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "logGroupIdentifiers",
        option_to_yojson log_group_identifiers_to_yojson x.log_group_identifiers );
    ]

let list_log_groups_for_query_max_results_to_yojson = int_to_yojson

let list_log_groups_for_query_request_to_yojson (x : list_log_groups_for_query_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_log_groups_for_query_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("queryId", Some (query_id_to_yojson x.query_id));
    ]

let log_group_class_to_yojson (x : log_group_class) =
  match x with
  | DELIVERY -> `String "DELIVERY"
  | INFREQUENT_ACCESS -> `String "INFREQUENT_ACCESS"
  | STANDARD -> `String "STANDARD"

let log_group_summary_to_yojson (x : log_group_summary) =
  assoc_to_yojson
    [
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ("logGroupArn", option_to_yojson arn_to_yojson x.log_group_arn);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let log_group_summaries_to_yojson tree = list_to_yojson log_group_summary_to_yojson tree

let list_log_groups_response_to_yojson (x : list_log_groups_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("logGroups", option_to_yojson log_group_summaries_to_yojson x.log_groups);
    ]

let log_group_name_regex_pattern_to_yojson = string_to_yojson
let include_linked_accounts_to_yojson = bool_to_yojson
let account_ids_to_yojson tree = list_to_yojson account_id_to_yojson tree
let list_limit_to_yojson = int_to_yojson

let data_source_filter_to_yojson (x : data_source_filter) =
  assoc_to_yojson
    [
      ("type", option_to_yojson data_source_type_to_yojson x.type_);
      ("name", Some (data_source_name_to_yojson x.name));
    ]

let data_source_filters_to_yojson tree = list_to_yojson data_source_filter_to_yojson tree
let field_index_name_to_yojson = string_to_yojson
let field_index_names_to_yojson tree = list_to_yojson field_index_name_to_yojson tree

let list_log_groups_request_to_yojson (x : list_log_groups_request) =
  assoc_to_yojson
    [
      ("logGroupTags", option_to_yojson tag_filters_to_yojson x.log_group_tags);
      ("fieldIndexNames", option_to_yojson field_index_names_to_yojson x.field_index_names);
      ("dataSources", option_to_yojson data_source_filters_to_yojson x.data_sources);
      ("limit", option_to_yojson list_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("accountIdentifiers", option_to_yojson account_ids_to_yojson x.account_identifiers);
      ( "includeLinkedAccounts",
        option_to_yojson include_linked_accounts_to_yojson x.include_linked_accounts );
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ( "logGroupNamePattern",
        option_to_yojson log_group_name_regex_pattern_to_yojson x.log_group_name_pattern );
    ]

let detector_name_to_yojson = string_to_yojson
let log_group_arn_list_to_yojson tree = list_to_yojson log_group_arn_to_yojson tree

let anomaly_detector_status_to_yojson (x : anomaly_detector_status) =
  match x with
  | PAUSED -> `String "PAUSED"
  | DELETED -> `String "DELETED"
  | FAILED -> `String "FAILED"
  | ANALYZING -> `String "ANALYZING"
  | TRAINING -> `String "TRAINING"
  | INITIALIZING -> `String "INITIALIZING"

let epoch_millis_to_yojson = long_to_yojson

let anomaly_detector_to_yojson (x : anomaly_detector) =
  assoc_to_yojson
    [
      ( "anomalyVisibilityTime",
        option_to_yojson anomaly_visibility_time_to_yojson x.anomaly_visibility_time );
      ("lastModifiedTimeStamp", option_to_yojson epoch_millis_to_yojson x.last_modified_time_stamp);
      ("creationTimeStamp", option_to_yojson epoch_millis_to_yojson x.creation_time_stamp);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "anomalyDetectorStatus",
        option_to_yojson anomaly_detector_status_to_yojson x.anomaly_detector_status );
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("evaluationFrequency", option_to_yojson evaluation_frequency_to_yojson x.evaluation_frequency);
      ("logGroupArnList", option_to_yojson log_group_arn_list_to_yojson x.log_group_arn_list);
      ("detectorName", option_to_yojson detector_name_to_yojson x.detector_name);
      ("anomalyDetectorArn", option_to_yojson anomaly_detector_arn_to_yojson x.anomaly_detector_arn);
    ]

let anomaly_detectors_to_yojson tree = list_to_yojson anomaly_detector_to_yojson tree

let list_log_anomaly_detectors_response_to_yojson (x : list_log_anomaly_detectors_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("anomalyDetectors", option_to_yojson anomaly_detectors_to_yojson x.anomaly_detectors);
    ]

let list_log_anomaly_detectors_limit_to_yojson = int_to_yojson

let list_log_anomaly_detectors_request_to_yojson (x : list_log_anomaly_detectors_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson list_log_anomaly_detectors_limit_to_yojson x.limit);
      ("filterLogGroupArn", option_to_yojson log_group_arn_to_yojson x.filter_log_group_arn);
    ]

let integration_summary_to_yojson (x : integration_summary) =
  assoc_to_yojson
    [
      ("integrationStatus", option_to_yojson integration_status_to_yojson x.integration_status);
      ("integrationType", option_to_yojson integration_type_to_yojson x.integration_type);
      ("integrationName", option_to_yojson integration_name_to_yojson x.integration_name);
    ]

let integration_summaries_to_yojson tree = list_to_yojson integration_summary_to_yojson tree

let list_integrations_response_to_yojson (x : list_integrations_response) =
  assoc_to_yojson
    [
      ( "integrationSummaries",
        option_to_yojson integration_summaries_to_yojson x.integration_summaries );
    ]

let integration_name_prefix_to_yojson = string_to_yojson

let list_integrations_request_to_yojson (x : list_integrations_request) =
  assoc_to_yojson
    [
      ("integrationStatus", option_to_yojson integration_status_to_yojson x.integration_status);
      ("integrationType", option_to_yojson integration_type_to_yojson x.integration_type);
      ( "integrationNamePrefix",
        option_to_yojson integration_name_prefix_to_yojson x.integration_name_prefix );
    ]

let description_to_yojson = string_to_yojson
let count_to_yojson = long_to_yojson
let histogram_to_yojson tree = map_to_yojson time_to_yojson count_to_yojson tree

let log_event_to_yojson (x : log_event) =
  assoc_to_yojson
    [
      ("message", option_to_yojson event_message_to_yojson x.message);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
    ]

let log_samples_to_yojson tree = list_to_yojson log_event_to_yojson tree

let anomaly_to_yojson (x : anomaly) =
  assoc_to_yojson
    [
      ( "isPatternLevelSuppression",
        option_to_yojson boolean__to_yojson x.is_pattern_level_suppression );
      ("suppressedUntil", option_to_yojson epoch_millis_to_yojson x.suppressed_until);
      ("suppressedDate", option_to_yojson epoch_millis_to_yojson x.suppressed_date);
      ("suppressed", option_to_yojson boolean__to_yojson x.suppressed);
      ("logGroupArnList", Some (log_group_arn_list_to_yojson x.log_group_arn_list));
      ("patternTokens", Some (pattern_tokens_to_yojson x.pattern_tokens));
      ("logSamples", Some (log_samples_to_yojson x.log_samples));
      ("histogram", Some (histogram_to_yojson x.histogram));
      ("state", Some (state_to_yojson x.state));
      ("active", Some (boolean__to_yojson x.active));
      ("description", Some (description_to_yojson x.description));
      ("lastSeen", Some (epoch_millis_to_yojson x.last_seen));
      ("firstSeen", Some (epoch_millis_to_yojson x.first_seen));
      ("priority", option_to_yojson priority_to_yojson x.priority);
      ("patternRegex", option_to_yojson pattern_regex_to_yojson x.pattern_regex);
      ("patternString", Some (pattern_string_to_yojson x.pattern_string));
      ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn));
      ("patternId", Some (pattern_id_to_yojson x.pattern_id));
      ("anomalyId", Some (anomaly_id_to_yojson x.anomaly_id));
    ]

let anomalies_to_yojson tree = list_to_yojson anomaly_to_yojson tree

let list_anomalies_response_to_yojson (x : list_anomalies_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("anomalies", option_to_yojson anomalies_to_yojson x.anomalies);
    ]

let list_anomalies_limit_to_yojson = int_to_yojson

let list_anomalies_request_to_yojson (x : list_anomalies_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson list_anomalies_limit_to_yojson x.limit);
      ("suppressionState", option_to_yojson suppression_state_to_yojson x.suppression_state);
      ("anomalyDetectorArn", option_to_yojson anomaly_detector_arn_to_yojson x.anomaly_detector_arn);
    ]

let log_group_count_to_yojson = int_to_yojson
let grouping_identifier_key_to_yojson = string_to_yojson
let grouping_identifier_value_to_yojson = string_to_yojson

let grouping_identifier_to_yojson (x : grouping_identifier) =
  assoc_to_yojson
    [
      ("value", option_to_yojson grouping_identifier_value_to_yojson x.value);
      ("key", option_to_yojson grouping_identifier_key_to_yojson x.key);
    ]

let grouping_identifiers_to_yojson tree = list_to_yojson grouping_identifier_to_yojson tree

let aggregate_log_group_summary_to_yojson (x : aggregate_log_group_summary) =
  assoc_to_yojson
    [
      ("groupingIdentifiers", option_to_yojson grouping_identifiers_to_yojson x.grouping_identifiers);
      ("logGroupCount", option_to_yojson log_group_count_to_yojson x.log_group_count);
    ]

let aggregate_log_group_summaries_to_yojson tree =
  list_to_yojson aggregate_log_group_summary_to_yojson tree

let list_aggregate_log_group_summaries_response_to_yojson
    (x : list_aggregate_log_group_summaries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "aggregateLogGroupSummaries",
        option_to_yojson aggregate_log_group_summaries_to_yojson x.aggregate_log_group_summaries );
    ]

let list_aggregate_log_group_summaries_group_by_to_yojson
    (x : list_aggregate_log_group_summaries_group_by) =
  match x with
  | DATA_SOURCE_NAME_AND_TYPE -> `String "DATA_SOURCE_NAME_AND_TYPE"
  | DATA_SOURCE_NAME_TYPE_AND_FORMAT -> `String "DATA_SOURCE_NAME_TYPE_AND_FORMAT"

let list_log_groups_request_limit_to_yojson = int_to_yojson

let list_aggregate_log_group_summaries_request_to_yojson
    (x : list_aggregate_log_group_summaries_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson list_log_groups_request_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("groupBy", Some (list_aggregate_log_group_summaries_group_by_to_yojson x.group_by));
      ("dataSources", option_to_yojson data_source_filters_to_yojson x.data_sources);
      ( "logGroupNamePattern",
        option_to_yojson log_group_name_regex_pattern_to_yojson x.log_group_name_pattern );
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ( "includeLinkedAccounts",
        option_to_yojson include_linked_accounts_to_yojson x.include_linked_accounts );
      ("accountIdentifiers", option_to_yojson account_ids_to_yojson x.account_identifiers);
    ]

let get_transformer_response_to_yojson (x : get_transformer_response) =
  assoc_to_yojson
    [
      ("transformerConfig", option_to_yojson processors_to_yojson x.transformer_config);
      ("lastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
    ]

let get_transformer_request_to_yojson (x : get_transformer_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let get_scheduled_query_history_response_to_yojson (x : get_scheduled_query_history_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("triggerHistory", option_to_yojson trigger_history_record_list_to_yojson x.trigger_history);
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
      ("name", option_to_yojson scheduled_query_name_to_yojson x.name);
    ]

let execution_status_list_to_yojson tree = list_to_yojson execution_status_to_yojson tree
let get_scheduled_query_history_max_results_to_yojson = int_to_yojson

let get_scheduled_query_history_request_to_yojson (x : get_scheduled_query_history_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson get_scheduled_query_history_max_results_to_yojson x.max_results );
      ("executionStatuses", option_to_yojson execution_status_list_to_yojson x.execution_statuses);
      ("endTime", Some (timestamp_to_yojson x.end_time));
      ("startTime", Some (timestamp_to_yojson x.start_time));
      ("identifier", Some (scheduled_query_identifier_to_yojson x.identifier));
    ]

let get_scheduled_query_response_to_yojson (x : get_scheduled_query_response) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("executionRoleArn", option_to_yojson role_arn_to_yojson x.execution_role_arn);
      ("scheduleEndTime", option_to_yojson timestamp_to_yojson x.schedule_end_time);
      ("scheduleStartTime", option_to_yojson timestamp_to_yojson x.schedule_start_time);
      ("lastExecutionStatus", option_to_yojson execution_status_to_yojson x.last_execution_status);
      ("lastTriggeredTime", option_to_yojson timestamp_to_yojson x.last_triggered_time);
      ("scheduleType", option_to_yojson schedule_type_to_yojson x.schedule_type);
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("endTimeOffset", option_to_yojson end_time_offset_to_yojson x.end_time_offset);
      ("startTimeOffset", option_to_yojson start_time_offset_to_yojson x.start_time_offset);
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("scheduleExpression", option_to_yojson schedule_expression_to_yojson x.schedule_expression);
      ( "logGroupIdentifiers",
        option_to_yojson scheduled_query_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("queryString", option_to_yojson query_string_to_yojson x.query_string);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("description", option_to_yojson scheduled_query_description_to_yojson x.description);
      ("name", option_to_yojson scheduled_query_name_to_yojson x.name);
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
    ]

let get_scheduled_query_request_to_yojson (x : get_scheduled_query_request) =
  assoc_to_yojson [ ("identifier", Some (scheduled_query_identifier_to_yojson x.identifier)) ]

let encryption_key_to_yojson = string_to_yojson
let get_query_results_next_token_to_yojson = string_to_yojson

let get_query_results_response_to_yojson (x : get_query_results_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson get_query_results_next_token_to_yojson x.next_token);
      ("encryptionKey", option_to_yojson encryption_key_to_yojson x.encryption_key);
      ("status", option_to_yojson query_status_to_yojson x.status);
      ("statistics", option_to_yojson query_statistics_to_yojson x.statistics);
      ("results", option_to_yojson query_results_to_yojson x.results);
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
    ]

let get_query_results_max_items_to_yojson = int_to_yojson

let get_query_results_request_to_yojson (x : get_query_results_request) =
  assoc_to_yojson
    [
      ("maxItems", option_to_yojson get_query_results_max_items_to_yojson x.max_items);
      ("nextToken", option_to_yojson get_query_results_next_token_to_yojson x.next_token);
      ("queryId", Some (query_id_to_yojson x.query_id));
    ]

let get_lookup_table_response_to_yojson (x : get_lookup_table_response) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("sizeBytes", option_to_yojson stored_bytes_to_yojson x.size_bytes);
      ("tableBody", option_to_yojson table_body_to_yojson x.table_body);
      ("description", option_to_yojson lookup_table_description_to_yojson x.description);
      ("lookupTableName", option_to_yojson lookup_table_name_to_yojson x.lookup_table_name);
      ("lookupTableArn", option_to_yojson arn_to_yojson x.lookup_table_arn);
    ]

let get_lookup_table_request_to_yojson (x : get_lookup_table_request) =
  assoc_to_yojson [ ("lookupTableArn", Some (arn_to_yojson x.lookup_table_arn)) ]

let log_record_to_yojson tree = map_to_yojson field_to_yojson value_to_yojson tree

let get_log_record_response_to_yojson (x : get_log_record_response) =
  assoc_to_yojson [ ("logRecord", option_to_yojson log_record_to_yojson x.log_record) ]

let log_record_pointer_to_yojson = string_to_yojson

let get_log_record_request_to_yojson (x : get_log_record_request) =
  assoc_to_yojson
    [
      ("unmask", option_to_yojson unmask_to_yojson x.unmask);
      ("logRecordPointer", Some (log_record_pointer_to_yojson x.log_record_pointer));
    ]

let data_to_yojson = blob_to_yojson

let fields_data_to_yojson (x : fields_data) =
  assoc_to_yojson [ ("data", option_to_yojson data_to_yojson x.data) ]

let internal_streaming_exception_to_yojson (x : internal_streaming_exception) =
  assoc_to_yojson [ ("message", option_to_yojson message_to_yojson x.message) ]

let get_log_object_response_stream_to_yojson (x : get_log_object_response_stream) =
  match x with
  | InternalStreamingException arg ->
      assoc_to_yojson
        [ ("InternalStreamingException", Some (internal_streaming_exception_to_yojson arg)) ]
  | Fields arg -> assoc_to_yojson [ ("fields", Some (fields_data_to_yojson arg)) ]

let get_log_object_response_to_yojson (x : get_log_object_response) =
  assoc_to_yojson
    [ ("fieldStream", option_to_yojson get_log_object_response_stream_to_yojson x.field_stream) ]

let log_object_pointer_to_yojson = string_to_yojson

let get_log_object_request_to_yojson (x : get_log_object_request) =
  assoc_to_yojson
    [
      ("logObjectPointer", Some (log_object_pointer_to_yojson x.log_object_pointer));
      ("unmask", option_to_yojson unmask_to_yojson x.unmask);
    ]

let log_group_field_to_yojson (x : log_group_field) =
  assoc_to_yojson
    [
      ("percent", option_to_yojson percentage_to_yojson x.percent);
      ("name", option_to_yojson field_to_yojson x.name);
    ]

let log_group_field_list_to_yojson tree = list_to_yojson log_group_field_to_yojson tree

let get_log_group_fields_response_to_yojson (x : get_log_group_fields_response) =
  assoc_to_yojson
    [ ("logGroupFields", option_to_yojson log_group_field_list_to_yojson x.log_group_fields) ]

let get_log_group_fields_request_to_yojson (x : get_log_group_fields_request) =
  assoc_to_yojson
    [
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("time", option_to_yojson timestamp_to_yojson x.time);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let log_field_name_to_yojson = string_to_yojson
let data_type_to_yojson = string_to_yojson

let rec log_field_type_to_yojson (x : log_field_type) =
  assoc_to_yojson
    [
      ("fields", option_to_yojson log_fields_list_to_yojson x.fields);
      ("element", option_to_yojson log_field_type_to_yojson x.element);
      ("type", option_to_yojson data_type_to_yojson x.type_);
    ]

and log_fields_list_to_yojson tree = list_to_yojson log_fields_list_item_to_yojson tree

and log_fields_list_item_to_yojson (x : log_fields_list_item) =
  assoc_to_yojson
    [
      ("logFieldType", option_to_yojson log_field_type_to_yojson x.log_field_type);
      ("logFieldName", option_to_yojson log_field_name_to_yojson x.log_field_name);
    ]

let get_log_fields_response_to_yojson (x : get_log_fields_response) =
  assoc_to_yojson [ ("logFields", option_to_yojson log_fields_list_to_yojson x.log_fields) ]

let get_log_fields_request_to_yojson (x : get_log_fields_request) =
  assoc_to_yojson
    [
      ("dataSourceType", Some (data_source_type_to_yojson x.data_source_type));
      ("dataSourceName", Some (data_source_name_to_yojson x.data_source_name));
    ]

let get_log_events_response_to_yojson (x : get_log_events_response) =
  assoc_to_yojson
    [
      ("nextBackwardToken", option_to_yojson next_token_to_yojson x.next_backward_token);
      ("nextForwardToken", option_to_yojson next_token_to_yojson x.next_forward_token);
      ("events", option_to_yojson output_log_events_to_yojson x.events);
    ]

let events_limit_to_yojson = int_to_yojson

let get_log_events_request_to_yojson (x : get_log_events_request) =
  assoc_to_yojson
    [
      ("unmask", option_to_yojson unmask_to_yojson x.unmask);
      ("startFromHead", option_to_yojson start_from_head_to_yojson x.start_from_head);
      ("limit", option_to_yojson events_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("logStreamName", Some (log_stream_name_to_yojson x.log_stream_name));
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let get_log_anomaly_detector_response_to_yojson (x : get_log_anomaly_detector_response) =
  assoc_to_yojson
    [
      ( "anomalyVisibilityTime",
        option_to_yojson anomaly_visibility_time_to_yojson x.anomaly_visibility_time );
      ("lastModifiedTimeStamp", option_to_yojson epoch_millis_to_yojson x.last_modified_time_stamp);
      ("creationTimeStamp", option_to_yojson epoch_millis_to_yojson x.creation_time_stamp);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "anomalyDetectorStatus",
        option_to_yojson anomaly_detector_status_to_yojson x.anomaly_detector_status );
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("evaluationFrequency", option_to_yojson evaluation_frequency_to_yojson x.evaluation_frequency);
      ("logGroupArnList", option_to_yojson log_group_arn_list_to_yojson x.log_group_arn_list);
      ("detectorName", option_to_yojson detector_name_to_yojson x.detector_name);
    ]

let get_log_anomaly_detector_request_to_yojson (x : get_log_anomaly_detector_request) =
  assoc_to_yojson
    [ ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn)) ]

let integration_details_to_yojson (x : integration_details) =
  match x with
  | OpenSearchIntegrationDetails arg ->
      assoc_to_yojson
        [ ("openSearchIntegrationDetails", Some (open_search_integration_details_to_yojson arg)) ]

let get_integration_response_to_yojson (x : get_integration_response) =
  assoc_to_yojson
    [
      ("integrationDetails", option_to_yojson integration_details_to_yojson x.integration_details);
      ("integrationStatus", option_to_yojson integration_status_to_yojson x.integration_status);
      ("integrationType", option_to_yojson integration_type_to_yojson x.integration_type);
      ("integrationName", option_to_yojson integration_name_to_yojson x.integration_name);
    ]

let get_integration_request_to_yojson (x : get_integration_request) =
  assoc_to_yojson [ ("integrationName", Some (integration_name_to_yojson x.integration_name)) ]

let get_delivery_source_response_to_yojson (x : get_delivery_source_response) =
  assoc_to_yojson
    [ ("deliverySource", option_to_yojson delivery_source_to_yojson x.delivery_source) ]

let get_delivery_source_request_to_yojson (x : get_delivery_source_request) =
  assoc_to_yojson [ ("name", Some (delivery_source_name_to_yojson x.name)) ]

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

let get_delivery_destination_response_to_yojson (x : get_delivery_destination_response) =
  assoc_to_yojson
    [
      ("deliveryDestination", option_to_yojson delivery_destination_to_yojson x.delivery_destination);
    ]

let get_delivery_destination_request_to_yojson (x : get_delivery_destination_request) =
  assoc_to_yojson [ ("name", Some (delivery_destination_name_to_yojson x.name)) ]

let delivery_to_yojson (x : delivery) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "s3DeliveryConfiguration",
        option_to_yojson s3_delivery_configuration_to_yojson x.s3_delivery_configuration );
      ("fieldDelimiter", option_to_yojson field_delimiter_to_yojson x.field_delimiter);
      ("recordFields", option_to_yojson record_fields_to_yojson x.record_fields);
      ( "deliveryDestinationType",
        option_to_yojson delivery_destination_type_to_yojson x.delivery_destination_type );
      ("deliveryDestinationArn", option_to_yojson arn_to_yojson x.delivery_destination_arn);
      ("deliverySourceName", option_to_yojson delivery_source_name_to_yojson x.delivery_source_name);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("id", option_to_yojson delivery_id_to_yojson x.id);
    ]

let get_delivery_response_to_yojson (x : get_delivery_response) =
  assoc_to_yojson [ ("delivery", option_to_yojson delivery_to_yojson x.delivery) ]

let get_delivery_request_to_yojson (x : get_delivery_request) =
  assoc_to_yojson [ ("id", Some (delivery_id_to_yojson x.id)) ]

let get_data_protection_policy_response_to_yojson (x : get_data_protection_policy_response) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ( "policyDocument",
        option_to_yojson data_protection_policy_document_to_yojson x.policy_document );
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
    ]

let get_data_protection_policy_request_to_yojson (x : get_data_protection_policy_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let event_id_to_yojson = string_to_yojson

let filtered_log_event_to_yojson (x : filtered_log_event) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
      ("ingestionTime", option_to_yojson timestamp_to_yojson x.ingestion_time);
      ("message", option_to_yojson event_message_to_yojson x.message);
      ("timestamp", option_to_yojson timestamp_to_yojson x.timestamp);
      ("logStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
    ]

let filtered_log_events_to_yojson tree = list_to_yojson filtered_log_event_to_yojson tree

let filter_log_events_response_to_yojson (x : filter_log_events_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("searchedLogStreams", option_to_yojson searched_log_streams_to_yojson x.searched_log_streams);
      ("events", option_to_yojson filtered_log_events_to_yojson x.events);
    ]

let interleaved_to_yojson = bool_to_yojson

let filter_log_events_request_to_yojson (x : filter_log_events_request) =
  assoc_to_yojson
    [
      ("unmask", option_to_yojson unmask_to_yojson x.unmask);
      ("interleaved", option_to_yojson interleaved_to_yojson x.interleaved);
      ("startFromHead", option_to_yojson start_from_head_to_yojson x.start_from_head);
      ("limit", option_to_yojson events_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("endTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("startTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("logStreamNamePrefix", option_to_yojson log_stream_name_to_yojson x.log_stream_name_prefix);
      ("logStreamNames", option_to_yojson input_log_stream_names_to_yojson x.log_stream_names);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
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

let disassociate_kms_key_request_to_yojson (x : disassociate_kms_key_request) =
  assoc_to_yojson
    [
      ("resourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let describe_subscription_filters_response_to_yojson (x : describe_subscription_filters_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("subscriptionFilters", option_to_yojson subscription_filters_to_yojson x.subscription_filters);
    ]

let describe_limit_to_yojson = int_to_yojson

let describe_subscription_filters_request_to_yojson (x : describe_subscription_filters_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filterNamePrefix", option_to_yojson filter_name_to_yojson x.filter_name_prefix);
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let describe_resource_policies_response_to_yojson (x : describe_resource_policies_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("resourcePolicies", option_to_yojson resource_policies_to_yojson x.resource_policies);
    ]

let describe_resource_policies_request_to_yojson (x : describe_resource_policies_request) =
  assoc_to_yojson
    [
      ("policyScope", option_to_yojson policy_scope_to_yojson x.policy_scope);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let describe_query_definitions_response_to_yojson (x : describe_query_definitions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("queryDefinitions", option_to_yojson query_definition_list_to_yojson x.query_definitions);
    ]

let describe_query_definitions_request_to_yojson (x : describe_query_definitions_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson query_list_max_results_to_yojson x.max_results);
      ( "queryDefinitionNamePrefix",
        option_to_yojson query_definition_name_to_yojson x.query_definition_name_prefix );
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
    ]

let describe_queries_response_to_yojson (x : describe_queries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("queries", option_to_yojson query_info_list_to_yojson x.queries);
    ]

let describe_queries_max_results_to_yojson = int_to_yojson

let describe_queries_request_to_yojson (x : describe_queries_request) =
  assoc_to_yojson
    [
      ("queryLanguage", option_to_yojson query_language_to_yojson x.query_language);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson describe_queries_max_results_to_yojson x.max_results);
      ("status", option_to_yojson query_status_to_yojson x.status);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let describe_metric_filters_response_to_yojson (x : describe_metric_filters_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("metricFilters", option_to_yojson metric_filters_to_yojson x.metric_filters);
    ]

let describe_metric_filters_request_to_yojson (x : describe_metric_filters_request) =
  assoc_to_yojson
    [
      ("metricNamespace", option_to_yojson metric_namespace_to_yojson x.metric_namespace);
      ("metricName", option_to_yojson metric_name_to_yojson x.metric_name);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("filterNamePrefix", option_to_yojson filter_name_to_yojson x.filter_name_prefix);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let describe_lookup_tables_response_to_yojson (x : describe_lookup_tables_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("lookupTables", option_to_yojson lookup_tables_to_yojson x.lookup_tables);
    ]

let describe_lookup_tables_max_results_to_yojson = int_to_yojson

let describe_lookup_tables_request_to_yojson (x : describe_lookup_tables_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson describe_lookup_tables_max_results_to_yojson x.max_results);
      ( "lookupTableNamePrefix",
        option_to_yojson lookup_table_name_to_yojson x.lookup_table_name_prefix );
    ]

let log_stream_to_yojson (x : log_stream) =
  assoc_to_yojson
    [
      ("storedBytes", option_to_yojson stored_bytes_to_yojson x.stored_bytes);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("uploadSequenceToken", option_to_yojson sequence_token_to_yojson x.upload_sequence_token);
      ("lastIngestionTime", option_to_yojson timestamp_to_yojson x.last_ingestion_time);
      ("lastEventTimestamp", option_to_yojson timestamp_to_yojson x.last_event_timestamp);
      ("firstEventTimestamp", option_to_yojson timestamp_to_yojson x.first_event_timestamp);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("logStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
    ]

let log_streams_to_yojson tree = list_to_yojson log_stream_to_yojson tree

let describe_log_streams_response_to_yojson (x : describe_log_streams_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("logStreams", option_to_yojson log_streams_to_yojson x.log_streams);
    ]

let descending_to_yojson = bool_to_yojson

let describe_log_streams_request_to_yojson (x : describe_log_streams_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("descending", option_to_yojson descending_to_yojson x.descending);
      ("orderBy", option_to_yojson order_by_to_yojson x.order_by);
      ("logStreamNamePrefix", option_to_yojson log_stream_name_to_yojson x.log_stream_name_prefix);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let filter_count_to_yojson = int_to_yojson

let data_protection_status_to_yojson (x : data_protection_status) =
  match x with
  | DISABLED -> `String "DISABLED"
  | ARCHIVED -> `String "ARCHIVED"
  | DELETED -> `String "DELETED"
  | ACTIVATED -> `String "ACTIVATED"

let inherited_property_to_yojson (x : inherited_property) =
  match x with ACCOUNT_DATA_PROTECTION -> `String "ACCOUNT_DATA_PROTECTION"

let inherited_properties_to_yojson tree = list_to_yojson inherited_property_to_yojson tree

let log_group_to_yojson (x : log_group) =
  assoc_to_yojson
    [
      ( "bearerTokenAuthenticationEnabled",
        option_to_yojson bearer_token_authentication_enabled_to_yojson
          x.bearer_token_authentication_enabled );
      ( "deletionProtectionEnabled",
        option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled );
      ("logGroupArn", option_to_yojson arn_to_yojson x.log_group_arn);
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ("inheritedProperties", option_to_yojson inherited_properties_to_yojson x.inherited_properties);
      ( "dataProtectionStatus",
        option_to_yojson data_protection_status_to_yojson x.data_protection_status );
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("storedBytes", option_to_yojson stored_bytes_to_yojson x.stored_bytes);
      ("arn", option_to_yojson arn_to_yojson x.arn);
      ("metricFilterCount", option_to_yojson filter_count_to_yojson x.metric_filter_count);
      ("retentionInDays", option_to_yojson days_to_yojson x.retention_in_days);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let log_groups_to_yojson tree = list_to_yojson log_group_to_yojson tree

let describe_log_groups_response_to_yojson (x : describe_log_groups_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("logGroups", option_to_yojson log_groups_to_yojson x.log_groups);
    ]

let log_group_name_pattern_to_yojson = string_to_yojson

let describe_log_groups_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let describe_log_groups_request_to_yojson (x : describe_log_groups_request) =
  assoc_to_yojson
    [
      ( "logGroupIdentifiers",
        option_to_yojson describe_log_groups_log_group_identifiers_to_yojson x.log_group_identifiers
      );
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ( "includeLinkedAccounts",
        option_to_yojson include_linked_accounts_to_yojson x.include_linked_accounts );
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "logGroupNamePattern",
        option_to_yojson log_group_name_pattern_to_yojson x.log_group_name_pattern );
      ("logGroupNamePrefix", option_to_yojson log_group_name_to_yojson x.log_group_name_prefix);
      ("accountIdentifiers", option_to_yojson account_ids_to_yojson x.account_identifiers);
    ]

let index_policies_to_yojson tree = list_to_yojson index_policy_to_yojson tree

let describe_index_policies_response_to_yojson (x : describe_index_policies_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("indexPolicies", option_to_yojson index_policies_to_yojson x.index_policies);
    ]

let describe_index_policies_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let describe_index_policies_request_to_yojson (x : describe_index_policies_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "logGroupIdentifiers",
        Some (describe_index_policies_log_group_identifiers_to_yojson x.log_group_identifiers) );
    ]

let import_id_to_yojson = string_to_yojson

let import_status_to_yojson (x : import_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | CANCELLED -> `String "CANCELLED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let import_statistics_to_yojson (x : import_statistics) =
  assoc_to_yojson [ ("bytesImported", option_to_yojson stored_bytes_to_yojson x.bytes_imported) ]

let import_filter_to_yojson (x : import_filter) =
  assoc_to_yojson
    [
      ("endEventTime", option_to_yojson timestamp_to_yojson x.end_event_time);
      ("startEventTime", option_to_yojson timestamp_to_yojson x.start_event_time);
    ]

let error_message_to_yojson = string_to_yojson

let import_to_yojson (x : import) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("importFilter", option_to_yojson import_filter_to_yojson x.import_filter);
      ("importStatistics", option_to_yojson import_statistics_to_yojson x.import_statistics);
      ("importDestinationArn", option_to_yojson arn_to_yojson x.import_destination_arn);
      ("importStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("importSourceArn", option_to_yojson arn_to_yojson x.import_source_arn);
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
    ]

let import_list_to_yojson tree = list_to_yojson import_to_yojson tree

let describe_import_tasks_response_to_yojson (x : describe_import_tasks_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("imports", option_to_yojson import_list_to_yojson x.imports);
    ]

let describe_import_tasks_request_to_yojson (x : describe_import_tasks_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("importSourceArn", option_to_yojson arn_to_yojson x.import_source_arn);
      ("importStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
    ]

let batch_id_to_yojson = string_to_yojson

let import_batch_to_yojson (x : import_batch) =
  assoc_to_yojson
    [
      ("errorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("status", Some (import_status_to_yojson x.status));
      ("batchId", Some (batch_id_to_yojson x.batch_id));
    ]

let import_batch_list_to_yojson tree = list_to_yojson import_batch_to_yojson tree

let describe_import_task_batches_response_to_yojson (x : describe_import_task_batches_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("importBatches", option_to_yojson import_batch_list_to_yojson x.import_batches);
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
      ("importSourceArn", option_to_yojson arn_to_yojson x.import_source_arn);
    ]

let import_status_list_to_yojson tree = list_to_yojson import_status_to_yojson tree

let describe_import_task_batches_request_to_yojson (x : describe_import_task_batches_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("batchImportStatus", option_to_yojson import_status_list_to_yojson x.batch_import_status);
      ("importId", Some (import_id_to_yojson x.import_id));
    ]

let index_type_to_yojson (x : index_type) =
  match x with FIELD_INDEX -> `String "FIELD_INDEX" | FACET -> `String "FACET"

let field_index_to_yojson (x : field_index) =
  assoc_to_yojson
    [
      ("type", option_to_yojson index_type_to_yojson x.type_);
      ("lastEventTime", option_to_yojson timestamp_to_yojson x.last_event_time);
      ("firstEventTime", option_to_yojson timestamp_to_yojson x.first_event_time);
      ("lastScanTime", option_to_yojson timestamp_to_yojson x.last_scan_time);
      ("fieldIndexName", option_to_yojson field_index_name_to_yojson x.field_index_name);
      ("logGroupIdentifier", option_to_yojson log_group_identifier_to_yojson x.log_group_identifier);
    ]

let field_indexes_to_yojson tree = list_to_yojson field_index_to_yojson tree

let describe_field_indexes_response_to_yojson (x : describe_field_indexes_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("fieldIndexes", option_to_yojson field_indexes_to_yojson x.field_indexes);
    ]

let describe_field_indexes_log_group_identifiers_to_yojson tree =
  list_to_yojson log_group_identifier_to_yojson tree

let describe_field_indexes_request_to_yojson (x : describe_field_indexes_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "logGroupIdentifiers",
        Some (describe_field_indexes_log_group_identifiers_to_yojson x.log_group_identifiers) );
    ]

let export_task_id_to_yojson = string_to_yojson
let export_task_name_to_yojson = string_to_yojson
let export_destination_bucket_to_yojson = string_to_yojson
let export_destination_prefix_to_yojson = string_to_yojson

let export_task_status_code_to_yojson (x : export_task_status_code) =
  match x with
  | RUNNING -> `String "RUNNING"
  | PENDING_CANCEL -> `String "PENDING_CANCEL"
  | PENDING -> `String "PENDING"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | CANCELLED -> `String "CANCELLED"

let export_task_status_message_to_yojson = string_to_yojson

let export_task_status_to_yojson (x : export_task_status) =
  assoc_to_yojson
    [
      ("message", option_to_yojson export_task_status_message_to_yojson x.message);
      ("code", option_to_yojson export_task_status_code_to_yojson x.code);
    ]

let export_task_execution_info_to_yojson (x : export_task_execution_info) =
  assoc_to_yojson
    [
      ("completionTime", option_to_yojson timestamp_to_yojson x.completion_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
    ]

let export_task_to_yojson (x : export_task) =
  assoc_to_yojson
    [
      ("executionInfo", option_to_yojson export_task_execution_info_to_yojson x.execution_info);
      ("status", option_to_yojson export_task_status_to_yojson x.status);
      ( "destinationPrefix",
        option_to_yojson export_destination_prefix_to_yojson x.destination_prefix );
      ("destination", option_to_yojson export_destination_bucket_to_yojson x.destination);
      ("to", option_to_yojson timestamp_to_yojson x.to_);
      ("from", option_to_yojson timestamp_to_yojson x.from_);
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("taskName", option_to_yojson export_task_name_to_yojson x.task_name);
      ("taskId", option_to_yojson export_task_id_to_yojson x.task_id);
    ]

let export_tasks_to_yojson tree = list_to_yojson export_task_to_yojson tree

let describe_export_tasks_response_to_yojson (x : describe_export_tasks_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("exportTasks", option_to_yojson export_tasks_to_yojson x.export_tasks);
    ]

let describe_export_tasks_request_to_yojson (x : describe_export_tasks_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("statusCode", option_to_yojson export_task_status_code_to_yojson x.status_code);
      ("taskId", option_to_yojson export_task_id_to_yojson x.task_id);
    ]

let destinations_to_yojson tree = list_to_yojson destination_to_yojson tree

let describe_destinations_response_to_yojson (x : describe_destinations_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("destinations", option_to_yojson destinations_to_yojson x.destinations);
    ]

let describe_destinations_request_to_yojson (x : describe_destinations_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "DestinationNamePrefix",
        option_to_yojson destination_name_to_yojson x.destination_name_prefix );
    ]

let delivery_sources_to_yojson tree = list_to_yojson delivery_source_to_yojson tree

let describe_delivery_sources_response_to_yojson (x : describe_delivery_sources_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("deliverySources", option_to_yojson delivery_sources_to_yojson x.delivery_sources);
    ]

let describe_delivery_sources_request_to_yojson (x : describe_delivery_sources_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let delivery_destinations_to_yojson tree = list_to_yojson delivery_destination_to_yojson tree

let describe_delivery_destinations_response_to_yojson (x : describe_delivery_destinations_response)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "deliveryDestinations",
        option_to_yojson delivery_destinations_to_yojson x.delivery_destinations );
    ]

let describe_delivery_destinations_request_to_yojson (x : describe_delivery_destinations_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let deliveries_to_yojson tree = list_to_yojson delivery_to_yojson tree

let describe_deliveries_response_to_yojson (x : describe_deliveries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("deliveries", option_to_yojson deliveries_to_yojson x.deliveries);
    ]

let describe_deliveries_request_to_yojson (x : describe_deliveries_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let configuration_template_delivery_config_values_to_yojson
    (x : configuration_template_delivery_config_values) =
  assoc_to_yojson
    [
      ( "s3DeliveryConfiguration",
        option_to_yojson s3_delivery_configuration_to_yojson x.s3_delivery_configuration );
      ("fieldDelimiter", option_to_yojson field_delimiter_to_yojson x.field_delimiter);
      ("recordFields", option_to_yojson record_fields_to_yojson x.record_fields);
    ]

let allowed_fields_to_yojson tree = list_to_yojson record_field_to_yojson tree
let allowed_action_for_allow_vended_logs_delivery_for_resource_to_yojson = string_to_yojson
let allowed_field_delimiters_to_yojson tree = list_to_yojson field_delimiter_to_yojson tree
let delivery_source_configuration_schema_field_to_yojson = string_to_yojson

let delivery_source_configuration_schema_value_type_to_yojson
    (x : delivery_source_configuration_schema_value_type) =
  match x with
  | LONG -> `String "long"
  | DOUBLE -> `String "double"
  | INT -> `String "int"
  | BOOLEAN -> `String "boolean"
  | STRING -> `String "string"

let delivery_source_configuration_supported_values_to_yojson tree =
  list_to_yojson delivery_source_configuration_schema_field_to_yojson tree

let delivery_source_configuration_numeric_value_to_yojson = double_to_yojson

let delivery_source_configuration_schema_to_yojson (x : delivery_source_configuration_schema) =
  assoc_to_yojson
    [
      ( "maxValue",
        option_to_yojson delivery_source_configuration_numeric_value_to_yojson x.max_value );
      ( "minValue",
        option_to_yojson delivery_source_configuration_numeric_value_to_yojson x.min_value );
      ( "supportedValues",
        option_to_yojson delivery_source_configuration_supported_values_to_yojson x.supported_values
      );
      ("defaultValue", Some (delivery_source_configuration_schema_field_to_yojson x.default_value));
      ("valueType", Some (delivery_source_configuration_schema_value_type_to_yojson x.value_type));
      ("keyName", Some (delivery_source_configuration_schema_field_to_yojson x.key_name));
    ]

let delivery_source_configuration_schemas_to_yojson tree =
  list_to_yojson delivery_source_configuration_schema_to_yojson tree

let configuration_template_to_yojson (x : configuration_template) =
  assoc_to_yojson
    [
      ( "s3TablesIntegration",
        option_to_yojson s3_tables_integration_to_yojson x.s3_tables_integration );
      ( "deliverySourceConfiguration",
        option_to_yojson delivery_source_configuration_schemas_to_yojson
          x.delivery_source_configuration );
      ( "allowedSuffixPathFields",
        option_to_yojson record_fields_to_yojson x.allowed_suffix_path_fields );
      ( "allowedFieldDelimiters",
        option_to_yojson allowed_field_delimiters_to_yojson x.allowed_field_delimiters );
      ( "allowedActionForAllowVendedLogsDeliveryForResource",
        option_to_yojson allowed_action_for_allow_vended_logs_delivery_for_resource_to_yojson
          x.allowed_action_for_allow_vended_logs_delivery_for_resource );
      ("allowedOutputFormats", option_to_yojson output_formats_to_yojson x.allowed_output_formats);
      ("allowedFields", option_to_yojson allowed_fields_to_yojson x.allowed_fields);
      ( "defaultDeliveryConfigValues",
        option_to_yojson configuration_template_delivery_config_values_to_yojson
          x.default_delivery_config_values );
      ( "deliveryDestinationType",
        option_to_yojson delivery_destination_type_to_yojson x.delivery_destination_type );
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("logType", option_to_yojson log_type_to_yojson x.log_type);
      ("service", option_to_yojson service_to_yojson x.service);
    ]

let configuration_templates_to_yojson tree = list_to_yojson configuration_template_to_yojson tree

let describe_configuration_templates_response_to_yojson
    (x : describe_configuration_templates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "configurationTemplates",
        option_to_yojson configuration_templates_to_yojson x.configuration_templates );
    ]

let log_types_to_yojson tree = list_to_yojson log_type_to_yojson tree

let delivery_destination_types_to_yojson tree =
  list_to_yojson delivery_destination_type_to_yojson tree

let describe_configuration_templates_request_to_yojson
    (x : describe_configuration_templates_request) =
  assoc_to_yojson
    [
      ("limit", option_to_yojson describe_limit_to_yojson x.limit);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "deliveryDestinationTypes",
        option_to_yojson delivery_destination_types_to_yojson x.delivery_destination_types );
      ("resourceTypes", option_to_yojson resource_types_to_yojson x.resource_types);
      ("logTypes", option_to_yojson log_types_to_yojson x.log_types);
      ("service", option_to_yojson service_to_yojson x.service);
    ]

let account_policies_to_yojson tree = list_to_yojson account_policy_to_yojson tree

let describe_account_policies_response_to_yojson (x : describe_account_policies_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("accountPolicies", option_to_yojson account_policies_to_yojson x.account_policies);
    ]

let describe_account_policies_request_to_yojson (x : describe_account_policies_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("accountIdentifiers", option_to_yojson account_ids_to_yojson x.account_identifiers);
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
      ("policyType", Some (policy_type_to_yojson x.policy_type));
    ]

let delete_transformer_request_to_yojson (x : delete_transformer_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let delete_syslog_configuration_request_to_yojson (x : delete_syslog_configuration_request) =
  assoc_to_yojson
    [
      ("vpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier));
    ]

let delete_subscription_filter_request_to_yojson (x : delete_subscription_filter_request) =
  assoc_to_yojson
    [
      ("filterName", Some (filter_name_to_yojson x.filter_name));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let delete_scheduled_query_response_to_yojson = unit_to_yojson

let delete_scheduled_query_request_to_yojson (x : delete_scheduled_query_request) =
  assoc_to_yojson [ ("identifier", Some (scheduled_query_identifier_to_yojson x.identifier)) ]

let delete_retention_policy_request_to_yojson (x : delete_retention_policy_request) =
  assoc_to_yojson [ ("logGroupName", Some (log_group_name_to_yojson x.log_group_name)) ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson
    [
      ("expectedRevisionId", option_to_yojson expected_revision_id_to_yojson x.expected_revision_id);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("policyName", option_to_yojson policy_name_to_yojson x.policy_name);
    ]

let delete_query_definition_response_to_yojson (x : delete_query_definition_response) =
  assoc_to_yojson [ ("success", option_to_yojson success_to_yojson x.success) ]

let delete_query_definition_request_to_yojson (x : delete_query_definition_request) =
  assoc_to_yojson [ ("queryDefinitionId", Some (query_id_to_yojson x.query_definition_id)) ]

let delete_metric_filter_request_to_yojson (x : delete_metric_filter_request) =
  assoc_to_yojson
    [
      ("filterName", Some (filter_name_to_yojson x.filter_name));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let delete_lookup_table_request_to_yojson (x : delete_lookup_table_request) =
  assoc_to_yojson [ ("lookupTableArn", Some (arn_to_yojson x.lookup_table_arn)) ]

let delete_log_stream_request_to_yojson (x : delete_log_stream_request) =
  assoc_to_yojson
    [
      ("logStreamName", Some (log_stream_name_to_yojson x.log_stream_name));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let delete_log_group_request_to_yojson (x : delete_log_group_request) =
  assoc_to_yojson [ ("logGroupName", Some (log_group_name_to_yojson x.log_group_name)) ]

let delete_log_anomaly_detector_request_to_yojson (x : delete_log_anomaly_detector_request) =
  assoc_to_yojson
    [ ("anomalyDetectorArn", Some (anomaly_detector_arn_to_yojson x.anomaly_detector_arn)) ]

let delete_integration_response_to_yojson = unit_to_yojson
let force_to_yojson = bool_to_yojson

let delete_integration_request_to_yojson (x : delete_integration_request) =
  assoc_to_yojson
    [
      ("force", option_to_yojson force_to_yojson x.force);
      ("integrationName", Some (integration_name_to_yojson x.integration_name));
    ]

let delete_index_policy_response_to_yojson = unit_to_yojson

let delete_index_policy_request_to_yojson (x : delete_index_policy_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let delete_destination_request_to_yojson (x : delete_destination_request) =
  assoc_to_yojson [ ("destinationName", Some (destination_name_to_yojson x.destination_name)) ]

let delete_delivery_source_request_to_yojson (x : delete_delivery_source_request) =
  assoc_to_yojson [ ("name", Some (delivery_source_name_to_yojson x.name)) ]

let delete_delivery_destination_policy_request_to_yojson
    (x : delete_delivery_destination_policy_request) =
  assoc_to_yojson
    [
      ( "deliveryDestinationName",
        Some (delivery_destination_name_to_yojson x.delivery_destination_name) );
    ]

let delete_delivery_destination_request_to_yojson (x : delete_delivery_destination_request) =
  assoc_to_yojson [ ("name", Some (delivery_destination_name_to_yojson x.name)) ]

let delete_delivery_request_to_yojson (x : delete_delivery_request) =
  assoc_to_yojson [ ("id", Some (delivery_id_to_yojson x.id)) ]

let delete_data_protection_policy_request_to_yojson (x : delete_data_protection_policy_request) =
  assoc_to_yojson
    [ ("logGroupIdentifier", Some (log_group_identifier_to_yojson x.log_group_identifier)) ]

let delete_account_policy_request_to_yojson (x : delete_account_policy_request) =
  assoc_to_yojson
    [
      ("policyType", Some (policy_type_to_yojson x.policy_type));
      ("policyName", Some (policy_name_to_yojson x.policy_name));
    ]

let create_scheduled_query_response_to_yojson (x : create_scheduled_query_response) =
  assoc_to_yojson
    [
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("scheduledQueryArn", option_to_yojson arn_to_yojson x.scheduled_query_arn);
    ]

let create_scheduled_query_request_to_yojson (x : create_scheduled_query_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("state", option_to_yojson scheduled_query_state_to_yojson x.state);
      ("executionRoleArn", Some (role_arn_to_yojson x.execution_role_arn));
      ("scheduleEndTime", option_to_yojson timestamp_to_yojson x.schedule_end_time);
      ("scheduleStartTime", option_to_yojson timestamp_to_yojson x.schedule_start_time);
      ( "destinationConfiguration",
        option_to_yojson destination_configuration_to_yojson x.destination_configuration );
      ("endTimeOffset", option_to_yojson end_time_offset_to_yojson x.end_time_offset);
      ("startTimeOffset", option_to_yojson start_time_offset_to_yojson x.start_time_offset);
      ("timezone", option_to_yojson schedule_timezone_to_yojson x.timezone);
      ("scheduleExpression", Some (schedule_expression_to_yojson x.schedule_expression));
      ( "logGroupIdentifiers",
        option_to_yojson scheduled_query_log_group_identifiers_to_yojson x.log_group_identifiers );
      ("queryString", Some (query_string_to_yojson x.query_string));
      ("queryLanguage", Some (query_language_to_yojson x.query_language));
      ("description", option_to_yojson scheduled_query_description_to_yojson x.description);
      ("name", Some (scheduled_query_name_to_yojson x.name));
    ]

let create_lookup_table_response_to_yojson (x : create_lookup_table_response) =
  assoc_to_yojson
    [
      ("createdAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("lookupTableArn", option_to_yojson arn_to_yojson x.lookup_table_arn);
    ]

let create_lookup_table_request_to_yojson (x : create_lookup_table_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("tableBody", Some (table_body_to_yojson x.table_body));
      ("description", option_to_yojson lookup_table_description_to_yojson x.description);
      ("lookupTableName", Some (lookup_table_name_to_yojson x.lookup_table_name));
    ]

let create_log_stream_request_to_yojson (x : create_log_stream_request) =
  assoc_to_yojson
    [
      ("logStreamName", Some (log_stream_name_to_yojson x.log_stream_name));
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
    ]

let create_log_group_request_to_yojson (x : create_log_group_request) =
  assoc_to_yojson
    [
      ( "deletionProtectionEnabled",
        option_to_yojson deletion_protection_enabled_to_yojson x.deletion_protection_enabled );
      ("logGroupClass", option_to_yojson log_group_class_to_yojson x.log_group_class);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
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
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "anomalyVisibilityTime",
        option_to_yojson anomaly_visibility_time_to_yojson x.anomaly_visibility_time );
      ("kmsKeyId", option_to_yojson detector_kms_key_arn_to_yojson x.kms_key_id);
      ("filterPattern", option_to_yojson filter_pattern_to_yojson x.filter_pattern);
      ("evaluationFrequency", option_to_yojson evaluation_frequency_to_yojson x.evaluation_frequency);
      ("detectorName", option_to_yojson detector_name_to_yojson x.detector_name);
      ("logGroupArnList", Some (log_group_arn_list_to_yojson x.log_group_arn_list));
    ]

let create_import_task_response_to_yojson (x : create_import_task_response) =
  assoc_to_yojson
    [
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("importDestinationArn", option_to_yojson arn_to_yojson x.import_destination_arn);
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
    ]

let create_import_task_request_to_yojson (x : create_import_task_request) =
  assoc_to_yojson
    [
      ("importFilter", option_to_yojson import_filter_to_yojson x.import_filter);
      ("importRoleArn", Some (role_arn_to_yojson x.import_role_arn));
      ("importSourceArn", Some (arn_to_yojson x.import_source_arn));
    ]

let create_export_task_response_to_yojson (x : create_export_task_response) =
  assoc_to_yojson [ ("taskId", option_to_yojson export_task_id_to_yojson x.task_id) ]

let create_export_task_request_to_yojson (x : create_export_task_request) =
  assoc_to_yojson
    [
      ( "destinationPrefix",
        option_to_yojson export_destination_prefix_to_yojson x.destination_prefix );
      ("destination", Some (export_destination_bucket_to_yojson x.destination));
      ("to", Some (timestamp_to_yojson x.to_));
      ("from", Some (timestamp_to_yojson x.from_));
      ("logStreamNamePrefix", option_to_yojson log_stream_name_to_yojson x.log_stream_name_prefix);
      ("logGroupName", Some (log_group_name_to_yojson x.log_group_name));
      ("taskName", option_to_yojson export_task_name_to_yojson x.task_name);
    ]

let create_delivery_response_to_yojson (x : create_delivery_response) =
  assoc_to_yojson [ ("delivery", option_to_yojson delivery_to_yojson x.delivery) ]

let create_delivery_request_to_yojson (x : create_delivery_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "s3DeliveryConfiguration",
        option_to_yojson s3_delivery_configuration_to_yojson x.s3_delivery_configuration );
      ("fieldDelimiter", option_to_yojson field_delimiter_to_yojson x.field_delimiter);
      ("recordFields", option_to_yojson record_fields_to_yojson x.record_fields);
      ("deliveryDestinationArn", Some (arn_to_yojson x.delivery_destination_arn));
      ("deliverySourceName", Some (delivery_source_name_to_yojson x.delivery_source_name));
    ]

let cancel_import_task_response_to_yojson (x : cancel_import_task_response) =
  assoc_to_yojson
    [
      ("lastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("creationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("importStatus", option_to_yojson import_status_to_yojson x.import_status);
      ("importStatistics", option_to_yojson import_statistics_to_yojson x.import_statistics);
      ("importId", option_to_yojson import_id_to_yojson x.import_id);
    ]

let cancel_import_task_request_to_yojson (x : cancel_import_task_request) =
  assoc_to_yojson [ ("importId", Some (import_id_to_yojson x.import_id)) ]

let cancel_export_task_request_to_yojson (x : cancel_export_task_request) =
  assoc_to_yojson [ ("taskId", Some (export_task_id_to_yojson x.task_id)) ]

let associate_source_to_s3_table_integration_response_to_yojson
    (x : associate_source_to_s3_table_integration_response) =
  assoc_to_yojson
    [
      ("identifier", option_to_yojson s3_table_integration_source_identifier_to_yojson x.identifier);
    ]

let associate_source_to_s3_table_integration_request_to_yojson
    (x : associate_source_to_s3_table_integration_request) =
  assoc_to_yojson
    [
      ("dataSource", Some (data_source_to_yojson x.data_source));
      ("integrationArn", Some (arn_to_yojson x.integration_arn));
    ]

let associate_kms_key_request_to_yojson (x : associate_kms_key_request) =
  assoc_to_yojson
    [
      ("resourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
      ("kmsKeyId", Some (kms_key_id_to_yojson x.kms_key_id));
      ("logGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]
