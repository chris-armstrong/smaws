open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | API_DOES_NOT_SUPPORT_LABELED_ARNS -> `String "API_DOES_NOT_SUPPORT_LABELED_ARNS"
  | MISSING_REQUIRED_PARAMETER -> `String "MISSING_REQUIRED_PARAMETER"
  | CANNOT_UPDATE_COMPLETED_MAP_RUN -> `String "CANNOT_UPDATE_COMPLETED_MAP_RUN"
  | INVALID_ROUTING_CONFIGURATION -> `String "INVALID_ROUTING_CONFIGURATION"

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
    ]

let validate_state_machine_definition_truncated_to_yojson = bool_to_yojson
let validate_state_machine_definition_location_to_yojson = string_to_yojson
let validate_state_machine_definition_message_to_yojson = string_to_yojson
let validate_state_machine_definition_code_to_yojson = string_to_yojson

let validate_state_machine_definition_severity_to_yojson
    (x : validate_state_machine_definition_severity) =
  match x with ERROR -> `String "ERROR" | WARNING -> `String "WARNING"

let validate_state_machine_definition_diagnostic_to_yojson
    (x : validate_state_machine_definition_diagnostic) =
  assoc_to_yojson
    [
      ("severity", Some (validate_state_machine_definition_severity_to_yojson x.severity));
      ("code", Some (validate_state_machine_definition_code_to_yojson x.code));
      ("message", Some (validate_state_machine_definition_message_to_yojson x.message));
      ("location", option_to_yojson validate_state_machine_definition_location_to_yojson x.location);
    ]

let validate_state_machine_definition_diagnostic_list_to_yojson tree =
  list_to_yojson validate_state_machine_definition_diagnostic_to_yojson tree

let validate_state_machine_definition_result_code_to_yojson
    (x : validate_state_machine_definition_result_code) =
  match x with OK -> `String "OK" | FAIL -> `String "FAIL"

let validate_state_machine_definition_output_to_yojson
    (x : validate_state_machine_definition_output) =
  assoc_to_yojson
    [
      ("result", Some (validate_state_machine_definition_result_code_to_yojson x.result_));
      ( "diagnostics",
        Some (validate_state_machine_definition_diagnostic_list_to_yojson x.diagnostics) );
      ( "truncated",
        option_to_yojson validate_state_machine_definition_truncated_to_yojson x.truncated );
    ]

let validate_state_machine_definition_max_result_to_yojson = int_to_yojson

let state_machine_type_to_yojson (x : state_machine_type) =
  match x with STANDARD -> `String "STANDARD" | EXPRESS -> `String "EXPRESS"

let definition_to_yojson = string_to_yojson

let validate_state_machine_definition_input_to_yojson (x : validate_state_machine_definition_input)
    =
  assoc_to_yojson
    [
      ("definition", Some (definition_to_yojson x.definition));
      ("type", option_to_yojson state_machine_type_to_yojson x.type_);
      ("severity", option_to_yojson validate_state_machine_definition_severity_to_yojson x.severity);
      ( "maxResults",
        option_to_yojson validate_state_machine_definition_max_result_to_yojson x.max_results );
    ]

let state_machine_deleting_to_yojson (x : state_machine_deleting) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let arn_to_yojson = string_to_yojson

let resource_not_found_to_yojson (x : resource_not_found) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("resourceName", option_to_yojson arn_to_yojson x.resource_name);
    ]

let invalid_arn_to_yojson (x : invalid_arn) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let update_state_machine_alias_output_to_yojson (x : update_state_machine_alias_output) =
  assoc_to_yojson [ ("updateDate", Some (timestamp_to_yojson x.update_date)) ]

let version_weight_to_yojson = int_to_yojson

let routing_configuration_list_item_to_yojson (x : routing_configuration_list_item) =
  assoc_to_yojson
    [
      ("stateMachineVersionArn", Some (arn_to_yojson x.state_machine_version_arn));
      ("weight", Some (version_weight_to_yojson x.weight));
    ]

let routing_configuration_list_to_yojson tree =
  list_to_yojson routing_configuration_list_item_to_yojson tree

let alias_description_to_yojson = string_to_yojson

let update_state_machine_alias_input_to_yojson (x : update_state_machine_alias_input) =
  assoc_to_yojson
    [
      ("stateMachineAliasArn", Some (arn_to_yojson x.state_machine_alias_arn));
      ("description", option_to_yojson alias_description_to_yojson x.description);
      ( "routingConfiguration",
        option_to_yojson routing_configuration_list_to_yojson x.routing_configuration );
    ]

let state_machine_does_not_exist_to_yojson (x : state_machine_does_not_exist) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let missing_required_parameter_to_yojson (x : missing_required_parameter) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kms_throttling_exception_to_yojson (x : kms_throttling_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kms_access_denied_exception_to_yojson (x : kms_access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_tracing_configuration_to_yojson (x : invalid_tracing_configuration) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_logging_configuration_to_yojson (x : invalid_logging_configuration) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_encryption_configuration_to_yojson (x : invalid_encryption_configuration) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_definition_to_yojson (x : invalid_definition) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let revision_id_to_yojson = string_to_yojson

let update_state_machine_output_to_yojson (x : update_state_machine_output) =
  assoc_to_yojson
    [
      ("updateDate", Some (timestamp_to_yojson x.update_date));
      ("revisionId", option_to_yojson revision_id_to_yojson x.revision_id);
      ("stateMachineVersionArn", option_to_yojson arn_to_yojson x.state_machine_version_arn);
    ]

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | AWS_OWNED_KEY -> `String "AWS_OWNED_KEY"
  | CUSTOMER_MANAGED_KMS_KEY -> `String "CUSTOMER_MANAGED_KMS_KEY"

let kms_data_key_reuse_period_seconds_to_yojson = int_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("kmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "kmsDataKeyReusePeriodSeconds",
        option_to_yojson kms_data_key_reuse_period_seconds_to_yojson
          x.kms_data_key_reuse_period_seconds );
      ("type", Some (encryption_type_to_yojson x.type_));
    ]

let version_description_to_yojson = string_to_yojson
let publish_to_yojson = bool_to_yojson
let enabled_to_yojson = bool_to_yojson

let tracing_configuration_to_yojson (x : tracing_configuration) =
  assoc_to_yojson [ ("enabled", option_to_yojson enabled_to_yojson x.enabled) ]

let cloud_watch_logs_log_group_to_yojson (x : cloud_watch_logs_log_group) =
  assoc_to_yojson [ ("logGroupArn", option_to_yojson arn_to_yojson x.log_group_arn) ]

let log_destination_to_yojson (x : log_destination) =
  assoc_to_yojson
    [
      ( "cloudWatchLogsLogGroup",
        option_to_yojson cloud_watch_logs_log_group_to_yojson x.cloud_watch_logs_log_group );
    ]

let log_destination_list_to_yojson tree = list_to_yojson log_destination_to_yojson tree
let include_execution_data_to_yojson = bool_to_yojson

let log_level_to_yojson (x : log_level) =
  match x with
  | ALL -> `String "ALL"
  | ERROR -> `String "ERROR"
  | FATAL -> `String "FATAL"
  | OFF -> `String "OFF"

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ("level", option_to_yojson log_level_to_yojson x.level);
      ( "includeExecutionData",
        option_to_yojson include_execution_data_to_yojson x.include_execution_data );
      ("destinations", option_to_yojson log_destination_list_to_yojson x.destinations);
    ]

let update_state_machine_input_to_yojson (x : update_state_machine_input) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("definition", option_to_yojson definition_to_yojson x.definition);
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ( "loggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ( "tracingConfiguration",
        option_to_yojson tracing_configuration_to_yojson x.tracing_configuration );
      ("publish", option_to_yojson publish_to_yojson x.publish);
      ("versionDescription", option_to_yojson version_description_to_yojson x.version_description);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let update_map_run_output_to_yojson = unit_to_yojson
let tolerated_failure_count_to_yojson = long_to_yojson
let tolerated_failure_percentage_to_yojson = float_to_yojson
let max_concurrency_to_yojson = int_to_yojson
let long_arn_to_yojson = string_to_yojson

let update_map_run_input_to_yojson (x : update_map_run_input) =
  assoc_to_yojson
    [
      ("mapRunArn", Some (long_arn_to_yojson x.map_run_arn));
      ("maxConcurrency", option_to_yojson max_concurrency_to_yojson x.max_concurrency);
      ( "toleratedFailurePercentage",
        option_to_yojson tolerated_failure_percentage_to_yojson x.tolerated_failure_percentage );
      ( "toleratedFailureCount",
        option_to_yojson tolerated_failure_count_to_yojson x.tolerated_failure_count );
    ]

let untag_resource_output_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let invalid_execution_input_to_yojson (x : invalid_execution_input) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let test_execution_status_to_yojson (x : test_execution_status) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | RETRIABLE -> `String "RETRIABLE"
  | CAUGHT_ERROR -> `String "CAUGHT_ERROR"

let state_name_to_yojson = string_to_yojson
let inspection_max_concurrency_to_yojson = int_to_yojson
let inspection_tolerated_failure_percentage_to_yojson = float_to_yojson
let inspection_tolerated_failure_count_to_yojson = int_to_yojson
let sensitive_data_to_yojson = string_to_yojson
let retry_backoff_interval_seconds_to_yojson = int_to_yojson
let exception_handler_index_to_yojson = int_to_yojson

let inspection_error_details_to_yojson (x : inspection_error_details) =
  assoc_to_yojson
    [
      ("catchIndex", option_to_yojson exception_handler_index_to_yojson x.catch_index);
      ("retryIndex", option_to_yojson exception_handler_index_to_yojson x.retry_index);
      ( "retryBackoffIntervalSeconds",
        option_to_yojson retry_backoff_interval_seconds_to_yojson x.retry_backoff_interval_seconds
      );
    ]

let http_body_to_yojson = string_to_yojson
let http_headers_to_yojson = string_to_yojson
let http_status_message_to_yojson = string_to_yojson
let http_status_code_to_yojson = string_to_yojson
let http_protocol_to_yojson = string_to_yojson

let inspection_data_response_to_yojson (x : inspection_data_response) =
  assoc_to_yojson
    [
      ("protocol", option_to_yojson http_protocol_to_yojson x.protocol);
      ("statusCode", option_to_yojson http_status_code_to_yojson x.status_code);
      ("statusMessage", option_to_yojson http_status_message_to_yojson x.status_message);
      ("headers", option_to_yojson http_headers_to_yojson x.headers);
      ("body", option_to_yojson http_body_to_yojson x.body);
    ]

let ur_l_to_yojson = string_to_yojson
let http_method_to_yojson = string_to_yojson

let inspection_data_request_to_yojson (x : inspection_data_request) =
  assoc_to_yojson
    [
      ("protocol", option_to_yojson http_protocol_to_yojson x.protocol);
      ("method", option_to_yojson http_method_to_yojson x.method_);
      ("url", option_to_yojson ur_l_to_yojson x.url);
      ("headers", option_to_yojson http_headers_to_yojson x.headers);
      ("body", option_to_yojson http_body_to_yojson x.body);
    ]

let inspection_data_to_yojson (x : inspection_data) =
  assoc_to_yojson
    [
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ("afterArguments", option_to_yojson sensitive_data_to_yojson x.after_arguments);
      ("afterInputPath", option_to_yojson sensitive_data_to_yojson x.after_input_path);
      ("afterParameters", option_to_yojson sensitive_data_to_yojson x.after_parameters);
      ("result", option_to_yojson sensitive_data_to_yojson x.result_);
      ("afterResultSelector", option_to_yojson sensitive_data_to_yojson x.after_result_selector);
      ("afterResultPath", option_to_yojson sensitive_data_to_yojson x.after_result_path);
      ("request", option_to_yojson inspection_data_request_to_yojson x.request);
      ("response", option_to_yojson inspection_data_response_to_yojson x.response);
      ("variables", option_to_yojson sensitive_data_to_yojson x.variables);
      ("errorDetails", option_to_yojson inspection_error_details_to_yojson x.error_details);
      ("afterItemsPath", option_to_yojson sensitive_data_to_yojson x.after_items_path);
      ("afterItemSelector", option_to_yojson sensitive_data_to_yojson x.after_item_selector);
      ("afterItemBatcher", option_to_yojson sensitive_data_to_yojson x.after_item_batcher);
      ("afterItemsPointer", option_to_yojson sensitive_data_to_yojson x.after_items_pointer);
      ( "toleratedFailureCount",
        option_to_yojson inspection_tolerated_failure_count_to_yojson x.tolerated_failure_count );
      ( "toleratedFailurePercentage",
        option_to_yojson inspection_tolerated_failure_percentage_to_yojson
          x.tolerated_failure_percentage );
      ("maxConcurrency", option_to_yojson inspection_max_concurrency_to_yojson x.max_concurrency);
    ]

let sensitive_cause_to_yojson = string_to_yojson
let sensitive_error_to_yojson = string_to_yojson

let test_state_output_to_yojson (x : test_state_output) =
  assoc_to_yojson
    [
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
      ("inspectionData", option_to_yojson inspection_data_to_yojson x.inspection_data);
      ("nextState", option_to_yojson state_name_to_yojson x.next_state);
      ("status", option_to_yojson test_execution_status_to_yojson x.status);
    ]

let map_iteration_failure_count_to_yojson = int_to_yojson
let test_state_state_name_to_yojson = string_to_yojson
let retrier_retry_count_to_yojson = int_to_yojson

let test_state_configuration_to_yojson (x : test_state_configuration) =
  assoc_to_yojson
    [
      ("retrierRetryCount", option_to_yojson retrier_retry_count_to_yojson x.retrier_retry_count);
      ( "errorCausedByState",
        option_to_yojson test_state_state_name_to_yojson x.error_caused_by_state );
      ( "mapIterationFailureCount",
        option_to_yojson map_iteration_failure_count_to_yojson x.map_iteration_failure_count );
      ("mapItemReaderData", option_to_yojson sensitive_data_to_yojson x.map_item_reader_data);
    ]

let mock_response_validation_mode_to_yojson (x : mock_response_validation_mode) =
  match x with STRICT -> `String "STRICT" | PRESENT -> `String "PRESENT" | NONE -> `String "NONE"

let mock_error_output_to_yojson (x : mock_error_output) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let mock_input_to_yojson (x : mock_input) =
  assoc_to_yojson
    [
      ("result", option_to_yojson sensitive_data_to_yojson x.result_);
      ("errorOutput", option_to_yojson mock_error_output_to_yojson x.error_output);
      ( "fieldValidationMode",
        option_to_yojson mock_response_validation_mode_to_yojson x.field_validation_mode );
    ]

let reveal_secrets_to_yojson = bool_to_yojson

let inspection_level_to_yojson (x : inspection_level) =
  match x with INFO -> `String "INFO" | DEBUG -> `String "DEBUG" | TRACE -> `String "TRACE"

let test_state_input_to_yojson (x : test_state_input) =
  assoc_to_yojson
    [
      ("definition", Some (definition_to_yojson x.definition));
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ("inspectionLevel", option_to_yojson inspection_level_to_yojson x.inspection_level);
      ("revealSecrets", option_to_yojson reveal_secrets_to_yojson x.reveal_secrets);
      ("variables", option_to_yojson sensitive_data_to_yojson x.variables);
      ("stateName", option_to_yojson test_state_state_name_to_yojson x.state_name);
      ("mock", option_to_yojson mock_input_to_yojson x.mock);
      ("context", option_to_yojson sensitive_data_to_yojson x.context);
      ( "stateConfiguration",
        option_to_yojson test_state_configuration_to_yojson x.state_configuration );
    ]

let too_many_tags_to_yojson (x : too_many_tags) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("resourceName", option_to_yojson arn_to_yojson x.resource_name);
    ]

let tag_resource_output_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", option_to_yojson tag_key_to_yojson x.key);
      ("value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tags", Some (tag_list_to_yojson x.tags));
    ]

let kms_key_state_to_yojson (x : kms_key_state) =
  match x with
  | DISABLED -> `String "DISABLED"
  | PENDING_DELETION -> `String "PENDING_DELETION"
  | PENDING_IMPORT -> `String "PENDING_IMPORT"
  | UNAVAILABLE -> `String "UNAVAILABLE"
  | CREATING -> `String "CREATING"

let kms_invalid_state_exception_to_yojson (x : kms_invalid_state_exception) =
  assoc_to_yojson
    [
      ("kmsKeyState", option_to_yojson kms_key_state_to_yojson x.kms_key_state);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let execution_does_not_exist_to_yojson (x : execution_does_not_exist) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let stop_execution_output_to_yojson (x : stop_execution_output) =
  assoc_to_yojson [ ("stopDate", Some (timestamp_to_yojson x.stop_date)) ]

let stop_execution_input_to_yojson (x : stop_execution_input) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let state_machine_type_not_supported_to_yojson (x : state_machine_type_not_supported) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_name_to_yojson (x : invalid_name) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let billed_duration_to_yojson = long_to_yojson
let billed_memory_used_to_yojson = long_to_yojson

let billing_details_to_yojson (x : billing_details) =
  assoc_to_yojson
    [
      ( "billedMemoryUsedInMB",
        option_to_yojson billed_memory_used_to_yojson x.billed_memory_used_in_m_b );
      ( "billedDurationInMilliseconds",
        option_to_yojson billed_duration_to_yojson x.billed_duration_in_milliseconds );
    ]

let trace_header_to_yojson = string_to_yojson
let included_details_to_yojson = bool_to_yojson

let cloud_watch_events_execution_data_details_to_yojson
    (x : cloud_watch_events_execution_data_details) =
  assoc_to_yojson [ ("included", option_to_yojson included_details_to_yojson x.included) ]

let sync_execution_status_to_yojson (x : sync_execution_status) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | TIMED_OUT -> `String "TIMED_OUT"

let name_to_yojson = string_to_yojson

let start_sync_execution_output_to_yojson (x : start_sync_execution_output) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("stateMachineArn", option_to_yojson arn_to_yojson x.state_machine_arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("startDate", Some (timestamp_to_yojson x.start_date));
      ("stopDate", Some (timestamp_to_yojson x.stop_date));
      ("status", Some (sync_execution_status_to_yojson x.status));
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ( "inputDetails",
        option_to_yojson cloud_watch_events_execution_data_details_to_yojson x.input_details );
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ( "outputDetails",
        option_to_yojson cloud_watch_events_execution_data_details_to_yojson x.output_details );
      ("traceHeader", option_to_yojson trace_header_to_yojson x.trace_header);
      ("billingDetails", option_to_yojson billing_details_to_yojson x.billing_details);
    ]

let included_data_to_yojson (x : included_data) =
  match x with ALL_DATA -> `String "ALL_DATA" | METADATA_ONLY -> `String "METADATA_ONLY"

let start_sync_execution_input_to_yojson (x : start_sync_execution_input) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("name", option_to_yojson name_to_yojson x.name);
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ("traceHeader", option_to_yojson trace_header_to_yojson x.trace_header);
      ("includedData", option_to_yojson included_data_to_yojson x.included_data);
    ]

let execution_limit_exceeded_to_yojson (x : execution_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let execution_already_exists_to_yojson (x : execution_already_exists) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let start_execution_output_to_yojson (x : start_execution_output) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("startDate", Some (timestamp_to_yojson x.start_date));
    ]

let start_execution_input_to_yojson (x : start_execution_input) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("name", option_to_yojson name_to_yojson x.name);
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ("traceHeader", option_to_yojson trace_header_to_yojson x.trace_header);
    ]

let task_timed_out_to_yojson (x : task_timed_out) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let task_does_not_exist_to_yojson (x : task_does_not_exist) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_token_to_yojson (x : invalid_token) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_output_to_yojson (x : invalid_output) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let send_task_success_output_to_yojson = unit_to_yojson
let task_token_to_yojson = string_to_yojson

let send_task_success_input_to_yojson (x : send_task_success_input) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("output", Some (sensitive_data_to_yojson x.output));
    ]

let send_task_heartbeat_output_to_yojson = unit_to_yojson

let send_task_heartbeat_input_to_yojson (x : send_task_heartbeat_input) =
  assoc_to_yojson [ ("taskToken", Some (task_token_to_yojson x.task_token)) ]

let send_task_failure_output_to_yojson = unit_to_yojson

let send_task_failure_input_to_yojson (x : send_task_failure_input) =
  assoc_to_yojson
    [
      ("taskToken", Some (task_token_to_yojson x.task_token));
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let execution_not_redrivable_to_yojson (x : execution_not_redrivable) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let redrive_execution_output_to_yojson (x : redrive_execution_output) =
  assoc_to_yojson [ ("redriveDate", Some (timestamp_to_yojson x.redrive_date)) ]

let client_token_to_yojson = string_to_yojson

let redrive_execution_input_to_yojson (x : redrive_execution_input) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let publish_state_machine_version_output_to_yojson (x : publish_state_machine_version_output) =
  assoc_to_yojson
    [
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
      ("stateMachineVersionArn", Some (arn_to_yojson x.state_machine_version_arn));
    ]

let publish_state_machine_version_input_to_yojson (x : publish_state_machine_version_input) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("revisionId", option_to_yojson revision_id_to_yojson x.revision_id);
      ("description", option_to_yojson version_description_to_yojson x.description);
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let page_token_to_yojson = string_to_yojson

let state_machine_version_list_item_to_yojson (x : state_machine_version_list_item) =
  assoc_to_yojson
    [
      ("stateMachineVersionArn", Some (long_arn_to_yojson x.state_machine_version_arn));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
    ]

let state_machine_version_list_to_yojson tree =
  list_to_yojson state_machine_version_list_item_to_yojson tree

let list_state_machine_versions_output_to_yojson (x : list_state_machine_versions_output) =
  assoc_to_yojson
    [
      ("stateMachineVersions", Some (state_machine_version_list_to_yojson x.state_machine_versions));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let page_size_to_yojson = int_to_yojson

let list_state_machine_versions_input_to_yojson (x : list_state_machine_versions_input) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let state_machine_list_item_to_yojson (x : state_machine_list_item) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("name", Some (name_to_yojson x.name));
      ("type", Some (state_machine_type_to_yojson x.type_));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
    ]

let state_machine_list_to_yojson tree = list_to_yojson state_machine_list_item_to_yojson tree

let list_state_machines_output_to_yojson (x : list_state_machines_output) =
  assoc_to_yojson
    [
      ("stateMachines", Some (state_machine_list_to_yojson x.state_machines));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let list_state_machines_input_to_yojson (x : list_state_machines_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let state_machine_alias_list_item_to_yojson (x : state_machine_alias_list_item) =
  assoc_to_yojson
    [
      ("stateMachineAliasArn", Some (long_arn_to_yojson x.state_machine_alias_arn));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
    ]

let state_machine_alias_list_to_yojson tree =
  list_to_yojson state_machine_alias_list_item_to_yojson tree

let list_state_machine_aliases_output_to_yojson (x : list_state_machine_aliases_output) =
  assoc_to_yojson
    [
      ("stateMachineAliases", Some (state_machine_alias_list_to_yojson x.state_machine_aliases));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let list_state_machine_aliases_input_to_yojson (x : list_state_machine_aliases_input) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
    ]

let map_run_list_item_to_yojson (x : map_run_list_item) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("mapRunArn", Some (long_arn_to_yojson x.map_run_arn));
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("startDate", Some (timestamp_to_yojson x.start_date));
      ("stopDate", option_to_yojson timestamp_to_yojson x.stop_date);
    ]

let map_run_list_to_yojson tree = list_to_yojson map_run_list_item_to_yojson tree

let list_map_runs_output_to_yojson (x : list_map_runs_output) =
  assoc_to_yojson
    [
      ("mapRuns", Some (map_run_list_to_yojson x.map_runs));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let list_map_runs_input_to_yojson (x : list_map_runs_input) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let list_executions_page_token_to_yojson = string_to_yojson
let redrive_count_to_yojson = int_to_yojson
let unsigned_integer_to_yojson = int_to_yojson

let execution_status_to_yojson (x : execution_status) =
  match x with
  | RUNNING -> `String "RUNNING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | TIMED_OUT -> `String "TIMED_OUT"
  | ABORTED -> `String "ABORTED"
  | PENDING_REDRIVE -> `String "PENDING_REDRIVE"

let execution_list_item_to_yojson (x : execution_list_item) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("name", Some (name_to_yojson x.name));
      ("status", Some (execution_status_to_yojson x.status));
      ("startDate", Some (timestamp_to_yojson x.start_date));
      ("stopDate", option_to_yojson timestamp_to_yojson x.stop_date);
      ("mapRunArn", option_to_yojson long_arn_to_yojson x.map_run_arn);
      ("itemCount", option_to_yojson unsigned_integer_to_yojson x.item_count);
      ("stateMachineVersionArn", option_to_yojson arn_to_yojson x.state_machine_version_arn);
      ("stateMachineAliasArn", option_to_yojson arn_to_yojson x.state_machine_alias_arn);
      ("redriveCount", option_to_yojson redrive_count_to_yojson x.redrive_count);
      ("redriveDate", option_to_yojson timestamp_to_yojson x.redrive_date);
    ]

let execution_list_to_yojson tree = list_to_yojson execution_list_item_to_yojson tree

let list_executions_output_to_yojson (x : list_executions_output) =
  assoc_to_yojson
    [
      ("executions", Some (execution_list_to_yojson x.executions));
      ("nextToken", option_to_yojson list_executions_page_token_to_yojson x.next_token);
    ]

let execution_redrive_filter_to_yojson (x : execution_redrive_filter) =
  match x with REDRIVEN -> `String "REDRIVEN" | NOT_REDRIVEN -> `String "NOT_REDRIVEN"

let list_executions_input_to_yojson (x : list_executions_input) =
  assoc_to_yojson
    [
      ("stateMachineArn", option_to_yojson arn_to_yojson x.state_machine_arn);
      ("statusFilter", option_to_yojson execution_status_to_yojson x.status_filter);
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson list_executions_page_token_to_yojson x.next_token);
      ("mapRunArn", option_to_yojson long_arn_to_yojson x.map_run_arn);
      ("redriveFilter", option_to_yojson execution_redrive_filter_to_yojson x.redrive_filter);
    ]

let activity_list_item_to_yojson (x : activity_list_item) =
  assoc_to_yojson
    [
      ("activityArn", Some (arn_to_yojson x.activity_arn));
      ("name", Some (name_to_yojson x.name));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
    ]

let activity_list_to_yojson tree = list_to_yojson activity_list_item_to_yojson tree

let list_activities_output_to_yojson (x : list_activities_output) =
  assoc_to_yojson
    [
      ("activities", Some (activity_list_to_yojson x.activities));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let list_activities_input_to_yojson (x : list_activities_input) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let evaluation_failure_location_to_yojson = string_to_yojson

let evaluation_failed_event_details_to_yojson (x : evaluation_failed_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
      ("location", option_to_yojson evaluation_failure_location_to_yojson x.location);
      ("state", Some (state_name_to_yojson x.state));
    ]

let map_run_redriven_event_details_to_yojson (x : map_run_redriven_event_details) =
  assoc_to_yojson
    [
      ("mapRunArn", option_to_yojson long_arn_to_yojson x.map_run_arn);
      ("redriveCount", option_to_yojson redrive_count_to_yojson x.redrive_count);
    ]

let map_run_failed_event_details_to_yojson (x : map_run_failed_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let map_run_started_event_details_to_yojson (x : map_run_started_event_details) =
  assoc_to_yojson [ ("mapRunArn", option_to_yojson long_arn_to_yojson x.map_run_arn) ]

let truncated_to_yojson = bool_to_yojson

let assigned_variables_details_to_yojson (x : assigned_variables_details) =
  assoc_to_yojson [ ("truncated", option_to_yojson truncated_to_yojson x.truncated) ]

let variable_value_to_yojson = string_to_yojson
let variable_name_to_yojson = string_to_yojson

let assigned_variables_to_yojson tree =
  map_to_yojson variable_name_to_yojson variable_value_to_yojson tree

let history_event_execution_data_details_to_yojson (x : history_event_execution_data_details) =
  assoc_to_yojson [ ("truncated", option_to_yojson truncated_to_yojson x.truncated) ]

let state_exited_event_details_to_yojson (x : state_exited_event_details) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ( "outputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.output_details );
      ("assignedVariables", option_to_yojson assigned_variables_to_yojson x.assigned_variables);
      ( "assignedVariablesDetails",
        option_to_yojson assigned_variables_details_to_yojson x.assigned_variables_details );
    ]

let state_entered_event_details_to_yojson (x : state_entered_event_details) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ( "inputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.input_details );
    ]

let lambda_function_timed_out_event_details_to_yojson (x : lambda_function_timed_out_event_details)
    =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let lambda_function_succeeded_event_details_to_yojson (x : lambda_function_succeeded_event_details)
    =
  assoc_to_yojson
    [
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ( "outputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.output_details );
    ]

let lambda_function_start_failed_event_details_to_yojson
    (x : lambda_function_start_failed_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let task_credentials_to_yojson (x : task_credentials) =
  assoc_to_yojson [ ("roleArn", option_to_yojson long_arn_to_yojson x.role_arn) ]

let timeout_in_seconds_to_yojson = long_to_yojson

let lambda_function_scheduled_event_details_to_yojson (x : lambda_function_scheduled_event_details)
    =
  assoc_to_yojson
    [
      ("resource", Some (arn_to_yojson x.resource));
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ( "inputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.input_details );
      ("timeoutInSeconds", option_to_yojson timeout_in_seconds_to_yojson x.timeout_in_seconds);
      ("taskCredentials", option_to_yojson task_credentials_to_yojson x.task_credentials);
    ]

let lambda_function_schedule_failed_event_details_to_yojson
    (x : lambda_function_schedule_failed_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let lambda_function_failed_event_details_to_yojson (x : lambda_function_failed_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let map_iteration_event_details_to_yojson (x : map_iteration_event_details) =
  assoc_to_yojson
    [
      ("name", option_to_yojson name_to_yojson x.name);
      ("index", option_to_yojson unsigned_integer_to_yojson x.index);
    ]

let map_state_started_event_details_to_yojson (x : map_state_started_event_details) =
  assoc_to_yojson [ ("length", option_to_yojson unsigned_integer_to_yojson x.length) ]

let execution_redriven_event_details_to_yojson (x : execution_redriven_event_details) =
  assoc_to_yojson [ ("redriveCount", option_to_yojson redrive_count_to_yojson x.redrive_count) ]

let execution_timed_out_event_details_to_yojson (x : execution_timed_out_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let execution_aborted_event_details_to_yojson (x : execution_aborted_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let execution_succeeded_event_details_to_yojson (x : execution_succeeded_event_details) =
  assoc_to_yojson
    [
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ( "outputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.output_details );
    ]

let execution_started_event_details_to_yojson (x : execution_started_event_details) =
  assoc_to_yojson
    [
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ( "inputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.input_details );
      ("roleArn", option_to_yojson arn_to_yojson x.role_arn);
      ("stateMachineAliasArn", option_to_yojson arn_to_yojson x.state_machine_alias_arn);
      ("stateMachineVersionArn", option_to_yojson arn_to_yojson x.state_machine_version_arn);
    ]

let execution_failed_event_details_to_yojson (x : execution_failed_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let task_timed_out_event_details_to_yojson (x : task_timed_out_event_details) =
  assoc_to_yojson
    [
      ("resourceType", Some (name_to_yojson x.resource_type));
      ("resource", Some (name_to_yojson x.resource));
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let task_succeeded_event_details_to_yojson (x : task_succeeded_event_details) =
  assoc_to_yojson
    [
      ("resourceType", Some (name_to_yojson x.resource_type));
      ("resource", Some (name_to_yojson x.resource));
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ( "outputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.output_details );
    ]

let task_submitted_event_details_to_yojson (x : task_submitted_event_details) =
  assoc_to_yojson
    [
      ("resourceType", Some (name_to_yojson x.resource_type));
      ("resource", Some (name_to_yojson x.resource));
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ( "outputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.output_details );
    ]

let task_submit_failed_event_details_to_yojson (x : task_submit_failed_event_details) =
  assoc_to_yojson
    [
      ("resourceType", Some (name_to_yojson x.resource_type));
      ("resource", Some (name_to_yojson x.resource));
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let task_started_event_details_to_yojson (x : task_started_event_details) =
  assoc_to_yojson
    [
      ("resourceType", Some (name_to_yojson x.resource_type));
      ("resource", Some (name_to_yojson x.resource));
    ]

let task_start_failed_event_details_to_yojson (x : task_start_failed_event_details) =
  assoc_to_yojson
    [
      ("resourceType", Some (name_to_yojson x.resource_type));
      ("resource", Some (name_to_yojson x.resource));
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let connector_parameters_to_yojson = string_to_yojson

let task_scheduled_event_details_to_yojson (x : task_scheduled_event_details) =
  assoc_to_yojson
    [
      ("resourceType", Some (name_to_yojson x.resource_type));
      ("resource", Some (name_to_yojson x.resource));
      ("region", Some (name_to_yojson x.region));
      ("parameters", Some (connector_parameters_to_yojson x.parameters));
      ("timeoutInSeconds", option_to_yojson timeout_in_seconds_to_yojson x.timeout_in_seconds);
      ("heartbeatInSeconds", option_to_yojson timeout_in_seconds_to_yojson x.heartbeat_in_seconds);
      ("taskCredentials", option_to_yojson task_credentials_to_yojson x.task_credentials);
    ]

let task_failed_event_details_to_yojson (x : task_failed_event_details) =
  assoc_to_yojson
    [
      ("resourceType", Some (name_to_yojson x.resource_type));
      ("resource", Some (name_to_yojson x.resource));
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let activity_timed_out_event_details_to_yojson (x : activity_timed_out_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let activity_succeeded_event_details_to_yojson (x : activity_succeeded_event_details) =
  assoc_to_yojson
    [
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ( "outputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.output_details );
    ]

let identity_to_yojson = string_to_yojson

let activity_started_event_details_to_yojson (x : activity_started_event_details) =
  assoc_to_yojson [ ("workerName", option_to_yojson identity_to_yojson x.worker_name) ]

let activity_scheduled_event_details_to_yojson (x : activity_scheduled_event_details) =
  assoc_to_yojson
    [
      ("resource", Some (arn_to_yojson x.resource));
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ( "inputDetails",
        option_to_yojson history_event_execution_data_details_to_yojson x.input_details );
      ("timeoutInSeconds", option_to_yojson timeout_in_seconds_to_yojson x.timeout_in_seconds);
      ("heartbeatInSeconds", option_to_yojson timeout_in_seconds_to_yojson x.heartbeat_in_seconds);
    ]

let activity_schedule_failed_event_details_to_yojson (x : activity_schedule_failed_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let activity_failed_event_details_to_yojson (x : activity_failed_event_details) =
  assoc_to_yojson
    [
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
    ]

let event_id_to_yojson = long_to_yojson

let history_event_type_to_yojson (x : history_event_type) =
  match x with
  | ActivityFailed -> `String "ActivityFailed"
  | ActivityScheduled -> `String "ActivityScheduled"
  | ActivityScheduleFailed -> `String "ActivityScheduleFailed"
  | ActivityStarted -> `String "ActivityStarted"
  | ActivitySucceeded -> `String "ActivitySucceeded"
  | ActivityTimedOut -> `String "ActivityTimedOut"
  | ChoiceStateEntered -> `String "ChoiceStateEntered"
  | ChoiceStateExited -> `String "ChoiceStateExited"
  | ExecutionAborted -> `String "ExecutionAborted"
  | ExecutionFailed -> `String "ExecutionFailed"
  | ExecutionStarted -> `String "ExecutionStarted"
  | ExecutionSucceeded -> `String "ExecutionSucceeded"
  | ExecutionTimedOut -> `String "ExecutionTimedOut"
  | FailStateEntered -> `String "FailStateEntered"
  | LambdaFunctionFailed -> `String "LambdaFunctionFailed"
  | LambdaFunctionScheduled -> `String "LambdaFunctionScheduled"
  | LambdaFunctionScheduleFailed -> `String "LambdaFunctionScheduleFailed"
  | LambdaFunctionStarted -> `String "LambdaFunctionStarted"
  | LambdaFunctionStartFailed -> `String "LambdaFunctionStartFailed"
  | LambdaFunctionSucceeded -> `String "LambdaFunctionSucceeded"
  | LambdaFunctionTimedOut -> `String "LambdaFunctionTimedOut"
  | MapIterationAborted -> `String "MapIterationAborted"
  | MapIterationFailed -> `String "MapIterationFailed"
  | MapIterationStarted -> `String "MapIterationStarted"
  | MapIterationSucceeded -> `String "MapIterationSucceeded"
  | MapStateAborted -> `String "MapStateAborted"
  | MapStateEntered -> `String "MapStateEntered"
  | MapStateExited -> `String "MapStateExited"
  | MapStateFailed -> `String "MapStateFailed"
  | MapStateStarted -> `String "MapStateStarted"
  | MapStateSucceeded -> `String "MapStateSucceeded"
  | ParallelStateAborted -> `String "ParallelStateAborted"
  | ParallelStateEntered -> `String "ParallelStateEntered"
  | ParallelStateExited -> `String "ParallelStateExited"
  | ParallelStateFailed -> `String "ParallelStateFailed"
  | ParallelStateStarted -> `String "ParallelStateStarted"
  | ParallelStateSucceeded -> `String "ParallelStateSucceeded"
  | PassStateEntered -> `String "PassStateEntered"
  | PassStateExited -> `String "PassStateExited"
  | SucceedStateEntered -> `String "SucceedStateEntered"
  | SucceedStateExited -> `String "SucceedStateExited"
  | TaskFailed -> `String "TaskFailed"
  | TaskScheduled -> `String "TaskScheduled"
  | TaskStarted -> `String "TaskStarted"
  | TaskStartFailed -> `String "TaskStartFailed"
  | TaskStateAborted -> `String "TaskStateAborted"
  | TaskStateEntered -> `String "TaskStateEntered"
  | TaskStateExited -> `String "TaskStateExited"
  | TaskSubmitFailed -> `String "TaskSubmitFailed"
  | TaskSubmitted -> `String "TaskSubmitted"
  | TaskSucceeded -> `String "TaskSucceeded"
  | TaskTimedOut -> `String "TaskTimedOut"
  | WaitStateAborted -> `String "WaitStateAborted"
  | WaitStateEntered -> `String "WaitStateEntered"
  | WaitStateExited -> `String "WaitStateExited"
  | MapRunAborted -> `String "MapRunAborted"
  | MapRunFailed -> `String "MapRunFailed"
  | MapRunStarted -> `String "MapRunStarted"
  | MapRunSucceeded -> `String "MapRunSucceeded"
  | ExecutionRedriven -> `String "ExecutionRedriven"
  | MapRunRedriven -> `String "MapRunRedriven"
  | EvaluationFailed -> `String "EvaluationFailed"

let history_event_to_yojson (x : history_event) =
  assoc_to_yojson
    [
      ("timestamp", Some (timestamp_to_yojson x.timestamp));
      ("type", Some (history_event_type_to_yojson x.type_));
      ("id", Some (event_id_to_yojson x.id));
      ("previousEventId", option_to_yojson event_id_to_yojson x.previous_event_id);
      ( "activityFailedEventDetails",
        option_to_yojson activity_failed_event_details_to_yojson x.activity_failed_event_details );
      ( "activityScheduleFailedEventDetails",
        option_to_yojson activity_schedule_failed_event_details_to_yojson
          x.activity_schedule_failed_event_details );
      ( "activityScheduledEventDetails",
        option_to_yojson activity_scheduled_event_details_to_yojson
          x.activity_scheduled_event_details );
      ( "activityStartedEventDetails",
        option_to_yojson activity_started_event_details_to_yojson x.activity_started_event_details
      );
      ( "activitySucceededEventDetails",
        option_to_yojson activity_succeeded_event_details_to_yojson
          x.activity_succeeded_event_details );
      ( "activityTimedOutEventDetails",
        option_to_yojson activity_timed_out_event_details_to_yojson
          x.activity_timed_out_event_details );
      ( "taskFailedEventDetails",
        option_to_yojson task_failed_event_details_to_yojson x.task_failed_event_details );
      ( "taskScheduledEventDetails",
        option_to_yojson task_scheduled_event_details_to_yojson x.task_scheduled_event_details );
      ( "taskStartFailedEventDetails",
        option_to_yojson task_start_failed_event_details_to_yojson x.task_start_failed_event_details
      );
      ( "taskStartedEventDetails",
        option_to_yojson task_started_event_details_to_yojson x.task_started_event_details );
      ( "taskSubmitFailedEventDetails",
        option_to_yojson task_submit_failed_event_details_to_yojson
          x.task_submit_failed_event_details );
      ( "taskSubmittedEventDetails",
        option_to_yojson task_submitted_event_details_to_yojson x.task_submitted_event_details );
      ( "taskSucceededEventDetails",
        option_to_yojson task_succeeded_event_details_to_yojson x.task_succeeded_event_details );
      ( "taskTimedOutEventDetails",
        option_to_yojson task_timed_out_event_details_to_yojson x.task_timed_out_event_details );
      ( "executionFailedEventDetails",
        option_to_yojson execution_failed_event_details_to_yojson x.execution_failed_event_details
      );
      ( "executionStartedEventDetails",
        option_to_yojson execution_started_event_details_to_yojson x.execution_started_event_details
      );
      ( "executionSucceededEventDetails",
        option_to_yojson execution_succeeded_event_details_to_yojson
          x.execution_succeeded_event_details );
      ( "executionAbortedEventDetails",
        option_to_yojson execution_aborted_event_details_to_yojson x.execution_aborted_event_details
      );
      ( "executionTimedOutEventDetails",
        option_to_yojson execution_timed_out_event_details_to_yojson
          x.execution_timed_out_event_details );
      ( "executionRedrivenEventDetails",
        option_to_yojson execution_redriven_event_details_to_yojson
          x.execution_redriven_event_details );
      ( "mapStateStartedEventDetails",
        option_to_yojson map_state_started_event_details_to_yojson x.map_state_started_event_details
      );
      ( "mapIterationStartedEventDetails",
        option_to_yojson map_iteration_event_details_to_yojson x.map_iteration_started_event_details
      );
      ( "mapIterationSucceededEventDetails",
        option_to_yojson map_iteration_event_details_to_yojson
          x.map_iteration_succeeded_event_details );
      ( "mapIterationFailedEventDetails",
        option_to_yojson map_iteration_event_details_to_yojson x.map_iteration_failed_event_details
      );
      ( "mapIterationAbortedEventDetails",
        option_to_yojson map_iteration_event_details_to_yojson x.map_iteration_aborted_event_details
      );
      ( "lambdaFunctionFailedEventDetails",
        option_to_yojson lambda_function_failed_event_details_to_yojson
          x.lambda_function_failed_event_details );
      ( "lambdaFunctionScheduleFailedEventDetails",
        option_to_yojson lambda_function_schedule_failed_event_details_to_yojson
          x.lambda_function_schedule_failed_event_details );
      ( "lambdaFunctionScheduledEventDetails",
        option_to_yojson lambda_function_scheduled_event_details_to_yojson
          x.lambda_function_scheduled_event_details );
      ( "lambdaFunctionStartFailedEventDetails",
        option_to_yojson lambda_function_start_failed_event_details_to_yojson
          x.lambda_function_start_failed_event_details );
      ( "lambdaFunctionSucceededEventDetails",
        option_to_yojson lambda_function_succeeded_event_details_to_yojson
          x.lambda_function_succeeded_event_details );
      ( "lambdaFunctionTimedOutEventDetails",
        option_to_yojson lambda_function_timed_out_event_details_to_yojson
          x.lambda_function_timed_out_event_details );
      ( "stateEnteredEventDetails",
        option_to_yojson state_entered_event_details_to_yojson x.state_entered_event_details );
      ( "stateExitedEventDetails",
        option_to_yojson state_exited_event_details_to_yojson x.state_exited_event_details );
      ( "mapRunStartedEventDetails",
        option_to_yojson map_run_started_event_details_to_yojson x.map_run_started_event_details );
      ( "mapRunFailedEventDetails",
        option_to_yojson map_run_failed_event_details_to_yojson x.map_run_failed_event_details );
      ( "mapRunRedrivenEventDetails",
        option_to_yojson map_run_redriven_event_details_to_yojson x.map_run_redriven_event_details
      );
      ( "evaluationFailedEventDetails",
        option_to_yojson evaluation_failed_event_details_to_yojson x.evaluation_failed_event_details
      );
    ]

let history_event_list_to_yojson tree = list_to_yojson history_event_to_yojson tree

let get_execution_history_output_to_yojson (x : get_execution_history_output) =
  assoc_to_yojson
    [
      ("events", Some (history_event_list_to_yojson x.events));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let include_execution_data_get_execution_history_to_yojson = bool_to_yojson
let reverse_order_to_yojson = bool_to_yojson

let get_execution_history_input_to_yojson (x : get_execution_history_input) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("maxResults", option_to_yojson page_size_to_yojson x.max_results);
      ("reverseOrder", option_to_yojson reverse_order_to_yojson x.reverse_order);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ( "includeExecutionData",
        option_to_yojson include_execution_data_get_execution_history_to_yojson
          x.include_execution_data );
    ]

let activity_worker_limit_exceeded_to_yojson (x : activity_worker_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let activity_does_not_exist_to_yojson (x : activity_does_not_exist) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let sensitive_data_job_input_to_yojson = string_to_yojson

let get_activity_task_output_to_yojson (x : get_activity_task_output) =
  assoc_to_yojson
    [
      ("taskToken", option_to_yojson task_token_to_yojson x.task_token);
      ("input", option_to_yojson sensitive_data_job_input_to_yojson x.input);
    ]

let get_activity_task_input_to_yojson (x : get_activity_task_input) =
  assoc_to_yojson
    [
      ("activityArn", Some (arn_to_yojson x.activity_arn));
      ("workerName", option_to_yojson name_to_yojson x.worker_name);
    ]

let variable_name_list_to_yojson tree = list_to_yojson variable_name_to_yojson tree

let variable_references_to_yojson tree =
  map_to_yojson state_name_to_yojson variable_name_list_to_yojson tree

let map_run_label_to_yojson = string_to_yojson

let describe_state_machine_for_execution_output_to_yojson
    (x : describe_state_machine_for_execution_output) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("name", Some (name_to_yojson x.name));
      ("definition", Some (definition_to_yojson x.definition));
      ("roleArn", Some (arn_to_yojson x.role_arn));
      ("updateDate", Some (timestamp_to_yojson x.update_date));
      ( "loggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ( "tracingConfiguration",
        option_to_yojson tracing_configuration_to_yojson x.tracing_configuration );
      ("mapRunArn", option_to_yojson long_arn_to_yojson x.map_run_arn);
      ("label", option_to_yojson map_run_label_to_yojson x.label);
      ("revisionId", option_to_yojson revision_id_to_yojson x.revision_id);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("variableReferences", option_to_yojson variable_references_to_yojson x.variable_references);
    ]

let describe_state_machine_for_execution_input_to_yojson
    (x : describe_state_machine_for_execution_input) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("includedData", option_to_yojson included_data_to_yojson x.included_data);
    ]

let describe_state_machine_alias_output_to_yojson (x : describe_state_machine_alias_output) =
  assoc_to_yojson
    [
      ("stateMachineAliasArn", option_to_yojson arn_to_yojson x.state_machine_alias_arn);
      ("name", option_to_yojson name_to_yojson x.name);
      ("description", option_to_yojson alias_description_to_yojson x.description);
      ( "routingConfiguration",
        option_to_yojson routing_configuration_list_to_yojson x.routing_configuration );
      ("creationDate", option_to_yojson timestamp_to_yojson x.creation_date);
      ("updateDate", option_to_yojson timestamp_to_yojson x.update_date);
    ]

let describe_state_machine_alias_input_to_yojson (x : describe_state_machine_alias_input) =
  assoc_to_yojson [ ("stateMachineAliasArn", Some (arn_to_yojson x.state_machine_alias_arn)) ]

let state_machine_status_to_yojson (x : state_machine_status) =
  match x with ACTIVE -> `String "ACTIVE" | DELETING -> `String "DELETING"

let describe_state_machine_output_to_yojson (x : describe_state_machine_output) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("name", Some (name_to_yojson x.name));
      ("status", option_to_yojson state_machine_status_to_yojson x.status);
      ("definition", Some (definition_to_yojson x.definition));
      ("roleArn", Some (arn_to_yojson x.role_arn));
      ("type", Some (state_machine_type_to_yojson x.type_));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
      ( "loggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ( "tracingConfiguration",
        option_to_yojson tracing_configuration_to_yojson x.tracing_configuration );
      ("label", option_to_yojson map_run_label_to_yojson x.label);
      ("revisionId", option_to_yojson revision_id_to_yojson x.revision_id);
      ("description", option_to_yojson version_description_to_yojson x.description);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("variableReferences", option_to_yojson variable_references_to_yojson x.variable_references);
    ]

let describe_state_machine_input_to_yojson (x : describe_state_machine_input) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("includedData", option_to_yojson included_data_to_yojson x.included_data);
    ]

let long_object_to_yojson = long_to_yojson
let unsigned_long_to_yojson = long_to_yojson

let map_run_execution_counts_to_yojson (x : map_run_execution_counts) =
  assoc_to_yojson
    [
      ("pending", Some (unsigned_long_to_yojson x.pending));
      ("running", Some (unsigned_long_to_yojson x.running));
      ("succeeded", Some (unsigned_long_to_yojson x.succeeded));
      ("failed", Some (unsigned_long_to_yojson x.failed));
      ("timedOut", Some (unsigned_long_to_yojson x.timed_out));
      ("aborted", Some (unsigned_long_to_yojson x.aborted));
      ("total", Some (unsigned_long_to_yojson x.total));
      ("resultsWritten", Some (unsigned_long_to_yojson x.results_written));
      ("failuresNotRedrivable", option_to_yojson long_object_to_yojson x.failures_not_redrivable);
      ("pendingRedrive", option_to_yojson long_object_to_yojson x.pending_redrive);
    ]

let map_run_item_counts_to_yojson (x : map_run_item_counts) =
  assoc_to_yojson
    [
      ("pending", Some (unsigned_long_to_yojson x.pending));
      ("running", Some (unsigned_long_to_yojson x.running));
      ("succeeded", Some (unsigned_long_to_yojson x.succeeded));
      ("failed", Some (unsigned_long_to_yojson x.failed));
      ("timedOut", Some (unsigned_long_to_yojson x.timed_out));
      ("aborted", Some (unsigned_long_to_yojson x.aborted));
      ("total", Some (unsigned_long_to_yojson x.total));
      ("resultsWritten", Some (unsigned_long_to_yojson x.results_written));
      ("failuresNotRedrivable", option_to_yojson long_object_to_yojson x.failures_not_redrivable);
      ("pendingRedrive", option_to_yojson long_object_to_yojson x.pending_redrive);
    ]

let map_run_status_to_yojson (x : map_run_status) =
  match x with
  | RUNNING -> `String "RUNNING"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | ABORTED -> `String "ABORTED"

let describe_map_run_output_to_yojson (x : describe_map_run_output) =
  assoc_to_yojson
    [
      ("mapRunArn", Some (long_arn_to_yojson x.map_run_arn));
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("status", Some (map_run_status_to_yojson x.status));
      ("startDate", Some (timestamp_to_yojson x.start_date));
      ("stopDate", option_to_yojson timestamp_to_yojson x.stop_date);
      ("maxConcurrency", Some (max_concurrency_to_yojson x.max_concurrency));
      ( "toleratedFailurePercentage",
        Some (tolerated_failure_percentage_to_yojson x.tolerated_failure_percentage) );
      ("toleratedFailureCount", Some (tolerated_failure_count_to_yojson x.tolerated_failure_count));
      ("itemCounts", Some (map_run_item_counts_to_yojson x.item_counts));
      ("executionCounts", Some (map_run_execution_counts_to_yojson x.execution_counts));
      ("redriveCount", option_to_yojson redrive_count_to_yojson x.redrive_count);
      ("redriveDate", option_to_yojson timestamp_to_yojson x.redrive_date);
    ]

let describe_map_run_input_to_yojson (x : describe_map_run_input) =
  assoc_to_yojson [ ("mapRunArn", Some (long_arn_to_yojson x.map_run_arn)) ]

let execution_redrive_status_to_yojson (x : execution_redrive_status) =
  match x with
  | REDRIVABLE -> `String "REDRIVABLE"
  | NOT_REDRIVABLE -> `String "NOT_REDRIVABLE"
  | REDRIVABLE_BY_MAP_RUN -> `String "REDRIVABLE_BY_MAP_RUN"

let describe_execution_output_to_yojson (x : describe_execution_output) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("name", option_to_yojson name_to_yojson x.name);
      ("status", Some (execution_status_to_yojson x.status));
      ("startDate", Some (timestamp_to_yojson x.start_date));
      ("stopDate", option_to_yojson timestamp_to_yojson x.stop_date);
      ("input", option_to_yojson sensitive_data_to_yojson x.input);
      ( "inputDetails",
        option_to_yojson cloud_watch_events_execution_data_details_to_yojson x.input_details );
      ("output", option_to_yojson sensitive_data_to_yojson x.output);
      ( "outputDetails",
        option_to_yojson cloud_watch_events_execution_data_details_to_yojson x.output_details );
      ("traceHeader", option_to_yojson trace_header_to_yojson x.trace_header);
      ("mapRunArn", option_to_yojson long_arn_to_yojson x.map_run_arn);
      ("error", option_to_yojson sensitive_error_to_yojson x.error);
      ("cause", option_to_yojson sensitive_cause_to_yojson x.cause);
      ("stateMachineVersionArn", option_to_yojson arn_to_yojson x.state_machine_version_arn);
      ("stateMachineAliasArn", option_to_yojson arn_to_yojson x.state_machine_alias_arn);
      ("redriveCount", option_to_yojson redrive_count_to_yojson x.redrive_count);
      ("redriveDate", option_to_yojson timestamp_to_yojson x.redrive_date);
      ("redriveStatus", option_to_yojson execution_redrive_status_to_yojson x.redrive_status);
      ("redriveStatusReason", option_to_yojson sensitive_data_to_yojson x.redrive_status_reason);
    ]

let describe_execution_input_to_yojson (x : describe_execution_input) =
  assoc_to_yojson
    [
      ("executionArn", Some (arn_to_yojson x.execution_arn));
      ("includedData", option_to_yojson included_data_to_yojson x.included_data);
    ]

let describe_activity_output_to_yojson (x : describe_activity_output) =
  assoc_to_yojson
    [
      ("activityArn", Some (arn_to_yojson x.activity_arn));
      ("name", Some (name_to_yojson x.name));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let describe_activity_input_to_yojson (x : describe_activity_input) =
  assoc_to_yojson [ ("activityArn", Some (arn_to_yojson x.activity_arn)) ]

let delete_state_machine_version_output_to_yojson = unit_to_yojson

let delete_state_machine_version_input_to_yojson (x : delete_state_machine_version_input) =
  assoc_to_yojson
    [ ("stateMachineVersionArn", Some (long_arn_to_yojson x.state_machine_version_arn)) ]

let delete_state_machine_alias_output_to_yojson = unit_to_yojson

let delete_state_machine_alias_input_to_yojson (x : delete_state_machine_alias_input) =
  assoc_to_yojson [ ("stateMachineAliasArn", Some (arn_to_yojson x.state_machine_alias_arn)) ]

let delete_state_machine_output_to_yojson = unit_to_yojson

let delete_state_machine_input_to_yojson (x : delete_state_machine_input) =
  assoc_to_yojson [ ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn)) ]

let delete_activity_output_to_yojson = unit_to_yojson

let delete_activity_input_to_yojson (x : delete_activity_input) =
  assoc_to_yojson [ ("activityArn", Some (arn_to_yojson x.activity_arn)) ]

let create_state_machine_alias_output_to_yojson (x : create_state_machine_alias_output) =
  assoc_to_yojson
    [
      ("stateMachineAliasArn", Some (arn_to_yojson x.state_machine_alias_arn));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
    ]

let character_restricted_name_to_yojson = string_to_yojson

let create_state_machine_alias_input_to_yojson (x : create_state_machine_alias_input) =
  assoc_to_yojson
    [
      ("description", option_to_yojson alias_description_to_yojson x.description);
      ("name", Some (character_restricted_name_to_yojson x.name));
      ("routingConfiguration", Some (routing_configuration_list_to_yojson x.routing_configuration));
    ]

let state_machine_limit_exceeded_to_yojson (x : state_machine_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let state_machine_already_exists_to_yojson (x : state_machine_already_exists) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let create_state_machine_output_to_yojson (x : create_state_machine_output) =
  assoc_to_yojson
    [
      ("stateMachineArn", Some (arn_to_yojson x.state_machine_arn));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
      ("stateMachineVersionArn", option_to_yojson arn_to_yojson x.state_machine_version_arn);
    ]

let create_state_machine_input_to_yojson (x : create_state_machine_input) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("definition", Some (definition_to_yojson x.definition));
      ("roleArn", Some (arn_to_yojson x.role_arn));
      ("type", option_to_yojson state_machine_type_to_yojson x.type_);
      ( "loggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "tracingConfiguration",
        option_to_yojson tracing_configuration_to_yojson x.tracing_configuration );
      ("publish", option_to_yojson publish_to_yojson x.publish);
      ("versionDescription", option_to_yojson version_description_to_yojson x.version_description);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]

let activity_limit_exceeded_to_yojson (x : activity_limit_exceeded) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let activity_already_exists_to_yojson (x : activity_already_exists) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let create_activity_output_to_yojson (x : create_activity_output) =
  assoc_to_yojson
    [
      ("activityArn", Some (arn_to_yojson x.activity_arn));
      ("creationDate", Some (timestamp_to_yojson x.creation_date));
    ]

let create_activity_input_to_yojson (x : create_activity_input) =
  assoc_to_yojson
    [
      ("name", Some (name_to_yojson x.name));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "encryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
    ]
