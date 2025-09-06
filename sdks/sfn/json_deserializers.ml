open Smaws_Lib.Json.DeserializeHelpers
open Types
let truncated_of_yojson = bool_of_yojson
let included_details_of_yojson = bool_of_yojson
let version_weight_of_yojson = int_of_yojson
let version_description_of_yojson = string_of_yojson
let variable_value_of_yojson = string_of_yojson
let variable_name_of_yojson = string_of_yojson
let variable_name_list_of_yojson tree path =
  list_of_yojson variable_name_of_yojson tree path
let state_name_of_yojson = string_of_yojson
let variable_references_of_yojson tree path =
  map_of_yojson state_name_of_yojson variable_name_list_of_yojson tree path
let validation_exception_reason_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "INVALID_ROUTING_CONFIGURATION" ->
        INVALID_ROUTING_CONFIGURATION
    | `String "CANNOT_UPDATE_COMPLETED_MAP_RUN" ->
        CANNOT_UPDATE_COMPLETED_MAP_RUN
    | `String "MISSING_REQUIRED_PARAMETER" -> MISSING_REQUIRED_PARAMETER
    | `String "API_DOES_NOT_SUPPORT_LABELED_ARNS" ->
        API_DOES_NOT_SUPPORT_LABELED_ARNS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "ValidationExceptionReason" value)
    | _ ->
        raise (deserialize_wrong_type_error path "ValidationExceptionReason") : 
     validation_exception_reason) : validation_exception_reason)
let error_message_of_yojson = string_of_yojson
let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason =
       (option_of_yojson
          (value_for_key validation_exception_reason_of_yojson "reason")
          _list path);
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : validation_exception)
let validate_state_machine_definition_truncated_of_yojson = bool_of_yojson
let validate_state_machine_definition_severity_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "WARNING" -> WARNING
    | `String "ERROR" -> ERROR
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "ValidateStateMachineDefinitionSeverity" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path
             "ValidateStateMachineDefinitionSeverity") : validate_state_machine_definition_severity) : 
  validate_state_machine_definition_severity)
let validate_state_machine_definition_result_code_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "FAIL" -> FAIL
    | `String "OK" -> OK
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "ValidateStateMachineDefinitionResultCode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path
             "ValidateStateMachineDefinitionResultCode") : validate_state_machine_definition_result_code) : 
  validate_state_machine_definition_result_code)
let validate_state_machine_definition_code_of_yojson = string_of_yojson
let validate_state_machine_definition_message_of_yojson = string_of_yojson
let validate_state_machine_definition_location_of_yojson = string_of_yojson
let validate_state_machine_definition_diagnostic_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location =
       (option_of_yojson
          (value_for_key validate_state_machine_definition_location_of_yojson
             "location") _list path);
     message =
       (value_for_key validate_state_machine_definition_message_of_yojson
          "message" _list path);
     code =
       (value_for_key validate_state_machine_definition_code_of_yojson "code"
          _list path);
     severity =
       (value_for_key validate_state_machine_definition_severity_of_yojson
          "severity" _list path)
   } : validate_state_machine_definition_diagnostic)
let validate_state_machine_definition_diagnostic_list_of_yojson tree path =
  list_of_yojson validate_state_machine_definition_diagnostic_of_yojson tree
    path
let validate_state_machine_definition_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     truncated =
       (option_of_yojson
          (value_for_key
             validate_state_machine_definition_truncated_of_yojson
             "truncated") _list path);
     diagnostics =
       (value_for_key
          validate_state_machine_definition_diagnostic_list_of_yojson
          "diagnostics" _list path);
     result =
       (value_for_key validate_state_machine_definition_result_code_of_yojson
          "result" _list path)
   } : validate_state_machine_definition_output)
let validate_state_machine_definition_max_result_of_yojson = int_of_yojson
let definition_of_yojson = string_of_yojson
let state_machine_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "EXPRESS" -> EXPRESS
    | `String "STANDARD" -> STANDARD
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "StateMachineType" value)
    | _ -> raise (deserialize_wrong_type_error path "StateMachineType") : 
     state_machine_type) : state_machine_type)
let validate_state_machine_definition_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson
          (value_for_key
             validate_state_machine_definition_max_result_of_yojson
             "maxResults") _list path);
     severity =
       (option_of_yojson
          (value_for_key validate_state_machine_definition_severity_of_yojson
             "severity") _list path);
     type_ =
       (option_of_yojson (value_for_key state_machine_type_of_yojson "type")
          _list path);
     definition =
       (value_for_key definition_of_yojson "definition" _list path)
   } : validate_state_machine_definition_input)
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let revision_id_of_yojson = string_of_yojson
let arn_of_yojson = string_of_yojson
let update_state_machine_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_machine_version_arn =
       (option_of_yojson
          (value_for_key arn_of_yojson "stateMachineVersionArn") _list path);
     revision_id =
       (option_of_yojson (value_for_key revision_id_of_yojson "revisionId")
          _list path);
     update_date =
       (value_for_key timestamp_of_yojson "updateDate" _list path)
   } : update_state_machine_output)
let log_level_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "OFF" -> OFF
    | `String "FATAL" -> FATAL
    | `String "ERROR" -> ERROR
    | `String "ALL" -> ALL
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LogLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "LogLevel") : log_level) : 
  log_level)
let include_execution_data_of_yojson = bool_of_yojson
let cloud_watch_logs_log_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_arn =
       (option_of_yojson (value_for_key arn_of_yojson "logGroupArn") _list
          path)
   } : cloud_watch_logs_log_group)
let log_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_logs_log_group =
       (option_of_yojson
          (value_for_key cloud_watch_logs_log_group_of_yojson
             "cloudWatchLogsLogGroup") _list path)
   } : log_destination)
let log_destination_list_of_yojson tree path =
  list_of_yojson log_destination_of_yojson tree path
let logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destinations =
       (option_of_yojson
          (value_for_key log_destination_list_of_yojson "destinations") _list
          path);
     include_execution_data =
       (option_of_yojson
          (value_for_key include_execution_data_of_yojson
             "includeExecutionData") _list path);
     level =
       (option_of_yojson (value_for_key log_level_of_yojson "level") _list
          path)
   } : logging_configuration)
let enabled_of_yojson = bool_of_yojson
let tracing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled =
       (option_of_yojson (value_for_key enabled_of_yojson "enabled") _list
          path)
   } : tracing_configuration)
let publish_of_yojson = bool_of_yojson
let kms_key_id_of_yojson = string_of_yojson
let kms_data_key_reuse_period_seconds_of_yojson = int_of_yojson
let encryption_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CUSTOMER_MANAGED_KMS_KEY" -> CUSTOMER_MANAGED_KMS_KEY
    | `String "AWS_OWNED_KEY" -> AWS_OWNED_KEY
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType") : 
     encryption_type) : encryption_type)
let encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = (value_for_key encryption_type_of_yojson "type" _list path);
     kms_data_key_reuse_period_seconds =
       (option_of_yojson
          (value_for_key kms_data_key_reuse_period_seconds_of_yojson
             "kmsDataKeyReusePeriodSeconds") _list path);
     kms_key_id =
       (option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId")
          _list path)
   } : encryption_configuration)
let update_state_machine_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       (option_of_yojson
          (value_for_key encryption_configuration_of_yojson
             "encryptionConfiguration") _list path);
     version_description =
       (option_of_yojson
          (value_for_key version_description_of_yojson "versionDescription")
          _list path);
     publish =
       (option_of_yojson (value_for_key publish_of_yojson "publish") _list
          path);
     tracing_configuration =
       (option_of_yojson
          (value_for_key tracing_configuration_of_yojson
             "tracingConfiguration") _list path);
     logging_configuration =
       (option_of_yojson
          (value_for_key logging_configuration_of_yojson
             "loggingConfiguration") _list path);
     role_arn =
       (option_of_yojson (value_for_key arn_of_yojson "roleArn") _list path);
     definition =
       (option_of_yojson (value_for_key definition_of_yojson "definition")
          _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : update_state_machine_input)
let update_state_machine_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_date =
       (value_for_key timestamp_of_yojson "updateDate" _list path)
   } : update_state_machine_alias_output)
let alias_description_of_yojson = string_of_yojson
let routing_configuration_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     weight = (value_for_key version_weight_of_yojson "weight" _list path);
     state_machine_version_arn =
       (value_for_key arn_of_yojson "stateMachineVersionArn" _list path)
   } : routing_configuration_list_item)
let routing_configuration_list_of_yojson tree path =
  list_of_yojson routing_configuration_list_item_of_yojson tree path
let update_state_machine_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing_configuration =
       (option_of_yojson
          (value_for_key routing_configuration_list_of_yojson
             "routingConfiguration") _list path);
     description =
       (option_of_yojson
          (value_for_key alias_description_of_yojson "description") _list
          path);
     state_machine_alias_arn =
       (value_for_key arn_of_yojson "stateMachineAliasArn" _list path)
   } : update_state_machine_alias_input)
let state_machine_deleting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : state_machine_deleting)
let resource_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       (option_of_yojson (value_for_key arn_of_yojson "resourceName") _list
          path);
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : resource_not_found)
let invalid_arn_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_arn)
let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : conflict_exception)
let state_machine_does_not_exist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : state_machine_does_not_exist)
let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : service_quota_exceeded_exception)
let missing_required_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : missing_required_parameter)
let kms_throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : kms_throttling_exception)
let kms_access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : kms_access_denied_exception)
let invalid_tracing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_tracing_configuration)
let invalid_logging_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_logging_configuration)
let invalid_encryption_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_encryption_configuration)
let invalid_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_definition)
let update_map_run_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let long_arn_of_yojson = string_of_yojson
let max_concurrency_of_yojson = int_of_yojson
let tolerated_failure_percentage_of_yojson = float_of_yojson
let tolerated_failure_count_of_yojson = long_of_yojson
let update_map_run_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tolerated_failure_count =
       (option_of_yojson
          (value_for_key tolerated_failure_count_of_yojson
             "toleratedFailureCount") _list path);
     tolerated_failure_percentage =
       (option_of_yojson
          (value_for_key tolerated_failure_percentage_of_yojson
             "toleratedFailurePercentage") _list path);
     max_concurrency =
       (option_of_yojson
          (value_for_key max_concurrency_of_yojson "maxConcurrency") _list
          path);
     map_run_arn = (value_for_key long_arn_of_yojson "mapRunArn" _list path)
   } : update_map_run_input)
let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path =
  list_of_yojson tag_key_of_yojson tree path
let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_key_list_of_yojson "tagKeys" _list path);
     resource_arn = (value_for_key arn_of_yojson "resourceArn" _list path)
   } : untag_resource_input)
let unsigned_long_of_yojson = long_of_yojson
let unsigned_integer_of_yojson = int_of_yojson
let ur_l_of_yojson = string_of_yojson
let trace_header_of_yojson = string_of_yojson
let too_many_tags_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       (option_of_yojson (value_for_key arn_of_yojson "resourceName") _list
          path);
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : too_many_tags)
let timeout_in_seconds_of_yojson = long_of_yojson
let sensitive_data_of_yojson = string_of_yojson
let sensitive_error_of_yojson = string_of_yojson
let sensitive_cause_of_yojson = string_of_yojson
let http_protocol_of_yojson = string_of_yojson
let http_method_of_yojson = string_of_yojson
let http_headers_of_yojson = string_of_yojson
let http_body_of_yojson = string_of_yojson
let inspection_data_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     body =
       (option_of_yojson (value_for_key http_body_of_yojson "body") _list
          path);
     headers =
       (option_of_yojson (value_for_key http_headers_of_yojson "headers")
          _list path);
     url = (option_of_yojson (value_for_key ur_l_of_yojson "url") _list path);
     method_ =
       (option_of_yojson (value_for_key http_method_of_yojson "method") _list
          path);
     protocol =
       (option_of_yojson (value_for_key http_protocol_of_yojson "protocol")
          _list path)
   } : inspection_data_request)
let http_status_code_of_yojson = string_of_yojson
let http_status_message_of_yojson = string_of_yojson
let inspection_data_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     body =
       (option_of_yojson (value_for_key http_body_of_yojson "body") _list
          path);
     headers =
       (option_of_yojson (value_for_key http_headers_of_yojson "headers")
          _list path);
     status_message =
       (option_of_yojson
          (value_for_key http_status_message_of_yojson "statusMessage") _list
          path);
     status_code =
       (option_of_yojson
          (value_for_key http_status_code_of_yojson "statusCode") _list path);
     protocol =
       (option_of_yojson (value_for_key http_protocol_of_yojson "protocol")
          _list path)
   } : inspection_data_response)
let inspection_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variables =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "variables")
          _list path);
     response =
       (option_of_yojson
          (value_for_key inspection_data_response_of_yojson "response") _list
          path);
     request =
       (option_of_yojson
          (value_for_key inspection_data_request_of_yojson "request") _list
          path);
     after_result_path =
       (option_of_yojson
          (value_for_key sensitive_data_of_yojson "afterResultPath") _list
          path);
     after_result_selector =
       (option_of_yojson
          (value_for_key sensitive_data_of_yojson "afterResultSelector")
          _list path);
     result =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "result")
          _list path);
     after_parameters =
       (option_of_yojson
          (value_for_key sensitive_data_of_yojson "afterParameters") _list
          path);
     after_input_path =
       (option_of_yojson
          (value_for_key sensitive_data_of_yojson "afterInputPath") _list
          path);
     after_arguments =
       (option_of_yojson
          (value_for_key sensitive_data_of_yojson "afterArguments") _list
          path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path)
   } : inspection_data)
let test_execution_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CAUGHT_ERROR" -> CAUGHT_ERROR
    | `String "RETRIABLE" -> RETRIABLE
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "TestExecutionStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "TestExecutionStatus") : 
     test_execution_status) : test_execution_status)
let test_state_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (option_of_yojson
          (value_for_key test_execution_status_of_yojson "status") _list path);
     next_state =
       (option_of_yojson (value_for_key state_name_of_yojson "nextState")
          _list path);
     inspection_data =
       (option_of_yojson
          (value_for_key inspection_data_of_yojson "inspectionData") _list
          path);
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path)
   } : test_state_output)
let inspection_level_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TRACE" -> TRACE
    | `String "DEBUG" -> DEBUG
    | `String "INFO" -> INFO
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "InspectionLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "InspectionLevel") : 
     inspection_level) : inspection_level)
let reveal_secrets_of_yojson = bool_of_yojson
let test_state_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variables =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "variables")
          _list path);
     reveal_secrets =
       (option_of_yojson
          (value_for_key reveal_secrets_of_yojson "revealSecrets") _list path);
     inspection_level =
       (option_of_yojson
          (value_for_key inspection_level_of_yojson "inspectionLevel") _list
          path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path);
     role_arn =
       (option_of_yojson (value_for_key arn_of_yojson "roleArn") _list path);
     definition =
       (value_for_key definition_of_yojson "definition" _list path)
   } : test_state_input)
let invalid_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_execution_input)
let task_token_of_yojson = string_of_yojson
let name_of_yojson = string_of_yojson
let task_timed_out_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     resource = (value_for_key name_of_yojson "resource" _list path);
     resource_type = (value_for_key name_of_yojson "resourceType" _list path)
   } : task_timed_out_event_details)
let task_timed_out_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : task_timed_out)
let history_event_execution_data_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     truncated =
       (option_of_yojson (value_for_key truncated_of_yojson "truncated")
          _list path)
   } : history_event_execution_data_details)
let task_succeeded_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "outputDetails") _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path);
     resource = (value_for_key name_of_yojson "resource" _list path);
     resource_type = (value_for_key name_of_yojson "resourceType" _list path)
   } : task_succeeded_event_details)
let task_submitted_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "outputDetails") _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path);
     resource = (value_for_key name_of_yojson "resource" _list path);
     resource_type = (value_for_key name_of_yojson "resourceType" _list path)
   } : task_submitted_event_details)
let task_submit_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     resource = (value_for_key name_of_yojson "resource" _list path);
     resource_type = (value_for_key name_of_yojson "resourceType" _list path)
   } : task_submit_failed_event_details)
let task_started_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource = (value_for_key name_of_yojson "resource" _list path);
     resource_type = (value_for_key name_of_yojson "resourceType" _list path)
   } : task_started_event_details)
let task_start_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     resource = (value_for_key name_of_yojson "resource" _list path);
     resource_type = (value_for_key name_of_yojson "resourceType" _list path)
   } : task_start_failed_event_details)
let connector_parameters_of_yojson = string_of_yojson
let task_credentials_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn =
       (option_of_yojson (value_for_key long_arn_of_yojson "roleArn") _list
          path)
   } : task_credentials)
let task_scheduled_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_credentials =
       (option_of_yojson
          (value_for_key task_credentials_of_yojson "taskCredentials") _list
          path);
     heartbeat_in_seconds =
       (option_of_yojson
          (value_for_key timeout_in_seconds_of_yojson "heartbeatInSeconds")
          _list path);
     timeout_in_seconds =
       (option_of_yojson
          (value_for_key timeout_in_seconds_of_yojson "timeoutInSeconds")
          _list path);
     parameters =
       (value_for_key connector_parameters_of_yojson "parameters" _list path);
     region = (value_for_key name_of_yojson "region" _list path);
     resource = (value_for_key name_of_yojson "resource" _list path);
     resource_type = (value_for_key name_of_yojson "resourceType" _list path)
   } : task_scheduled_event_details)
let task_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     resource = (value_for_key name_of_yojson "resource" _list path);
     resource_type = (value_for_key name_of_yojson "resourceType" _list path)
   } : task_failed_event_details)
let task_does_not_exist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : task_does_not_exist)
let tag_value_of_yojson = string_of_yojson
let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (option_of_yojson (value_for_key tag_value_of_yojson "value") _list
          path);
     key =
       (option_of_yojson (value_for_key tag_key_of_yojson "key") _list path)
   } : tag)
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tag_list_of_yojson "tags" _list path);
     resource_arn = (value_for_key arn_of_yojson "resourceArn" _list path)
   } : tag_resource_input)
let sync_execution_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "SyncExecutionStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "SyncExecutionStatus") : 
     sync_execution_status) : sync_execution_status)
let stop_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ stop_date = (value_for_key timestamp_of_yojson "stopDate" _list path) } : 
    stop_execution_output)
let stop_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : stop_execution_input)
let kms_key_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CREATING" -> CREATING
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String "PENDING_IMPORT" -> PENDING_IMPORT
    | `String "PENDING_DELETION" -> PENDING_DELETION
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "KmsKeyState" value)
    | _ -> raise (deserialize_wrong_type_error path "KmsKeyState") : 
     kms_key_state) : kms_key_state)
let kms_invalid_state_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path);
     kms_key_state =
       (option_of_yojson
          (value_for_key kms_key_state_of_yojson "kmsKeyState") _list path)
   } : kms_invalid_state_exception)
let execution_does_not_exist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : execution_does_not_exist)
let state_machine_version_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     state_machine_version_arn =
       (value_for_key long_arn_of_yojson "stateMachineVersionArn" _list path)
   } : state_machine_version_list_item)
let state_machine_version_list_of_yojson tree path =
  list_of_yojson state_machine_version_list_item_of_yojson tree path
let state_machine_type_not_supported_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : state_machine_type_not_supported)
let state_machine_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "StateMachineStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "StateMachineStatus") : 
     state_machine_status) : state_machine_status)
let state_machine_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     type_ = (value_for_key state_machine_type_of_yojson "type" _list path);
     name = (value_for_key name_of_yojson "name" _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : state_machine_list_item)
let state_machine_list_of_yojson tree path =
  list_of_yojson state_machine_list_item_of_yojson tree path
let state_machine_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : state_machine_limit_exceeded)
let state_machine_already_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : state_machine_already_exists)
let state_machine_alias_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     state_machine_alias_arn =
       (value_for_key long_arn_of_yojson "stateMachineAliasArn" _list path)
   } : state_machine_alias_list_item)
let state_machine_alias_list_of_yojson tree path =
  list_of_yojson state_machine_alias_list_item_of_yojson tree path
let assigned_variables_of_yojson tree path =
  map_of_yojson variable_name_of_yojson variable_value_of_yojson tree path
let assigned_variables_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     truncated =
       (option_of_yojson (value_for_key truncated_of_yojson "truncated")
          _list path)
   } : assigned_variables_details)
let state_exited_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assigned_variables_details =
       (option_of_yojson
          (value_for_key assigned_variables_details_of_yojson
             "assignedVariablesDetails") _list path);
     assigned_variables =
       (option_of_yojson
          (value_for_key assigned_variables_of_yojson "assignedVariables")
          _list path);
     output_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "outputDetails") _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path);
     name = (value_for_key name_of_yojson "name" _list path)
   } : state_exited_event_details)
let state_entered_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "inputDetails") _list path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path);
     name = (value_for_key name_of_yojson "name" _list path)
   } : state_entered_event_details)
let cloud_watch_events_execution_data_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     included =
       (option_of_yojson
          (value_for_key included_details_of_yojson "included") _list path)
   } : cloud_watch_events_execution_data_details)
let billed_memory_used_of_yojson = long_of_yojson
let billed_duration_of_yojson = long_of_yojson
let billing_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billed_duration_in_milliseconds =
       (option_of_yojson
          (value_for_key billed_duration_of_yojson
             "billedDurationInMilliseconds") _list path);
     billed_memory_used_in_m_b =
       (option_of_yojson
          (value_for_key billed_memory_used_of_yojson "billedMemoryUsedInMB")
          _list path)
   } : billing_details)
let start_sync_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_details =
       (option_of_yojson
          (value_for_key billing_details_of_yojson "billingDetails") _list
          path);
     trace_header =
       (option_of_yojson (value_for_key trace_header_of_yojson "traceHeader")
          _list path);
     output_details =
       (option_of_yojson
          (value_for_key cloud_watch_events_execution_data_details_of_yojson
             "outputDetails") _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path);
     input_details =
       (option_of_yojson
          (value_for_key cloud_watch_events_execution_data_details_of_yojson
             "inputDetails") _list path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path);
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     status =
       (value_for_key sync_execution_status_of_yojson "status" _list path);
     stop_date = (value_for_key timestamp_of_yojson "stopDate" _list path);
     start_date = (value_for_key timestamp_of_yojson "startDate" _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "name") _list path);
     state_machine_arn =
       (option_of_yojson (value_for_key arn_of_yojson "stateMachineArn")
          _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : start_sync_execution_output)
let included_data_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "METADATA_ONLY" -> METADATA_ONLY
    | `String "ALL_DATA" -> ALL_DATA
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "IncludedData" value)
    | _ -> raise (deserialize_wrong_type_error path "IncludedData") : 
     included_data) : included_data)
let start_sync_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     included_data =
       (option_of_yojson
          (value_for_key included_data_of_yojson "includedData") _list path);
     trace_header =
       (option_of_yojson (value_for_key trace_header_of_yojson "traceHeader")
          _list path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "name") _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : start_sync_execution_input)
let invalid_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_name)
let start_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_date = (value_for_key timestamp_of_yojson "startDate" _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : start_execution_output)
let start_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trace_header =
       (option_of_yojson (value_for_key trace_header_of_yojson "traceHeader")
          _list path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "name") _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : start_execution_input)
let execution_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : execution_limit_exceeded)
let execution_already_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : execution_already_exists)
let sensitive_data_job_input_of_yojson = string_of_yojson
let send_task_success_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let send_task_success_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output = (value_for_key sensitive_data_of_yojson "output" _list path);
     task_token = (value_for_key task_token_of_yojson "taskToken" _list path)
   } : send_task_success_input)
let invalid_token_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_token)
let invalid_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_output)
let send_task_heartbeat_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let send_task_heartbeat_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_token = (value_for_key task_token_of_yojson "taskToken" _list path)
   } : send_task_heartbeat_input)
let send_task_failure_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let send_task_failure_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     task_token = (value_for_key task_token_of_yojson "taskToken" _list path)
   } : send_task_failure_input)
let reverse_order_of_yojson = bool_of_yojson
let redrive_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redrive_date =
       (value_for_key timestamp_of_yojson "redriveDate" _list path)
   } : redrive_execution_output)
let client_token_of_yojson = string_of_yojson
let redrive_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token =
       (option_of_yojson (value_for_key client_token_of_yojson "clientToken")
          _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : redrive_execution_input)
let execution_not_redrivable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : execution_not_redrivable)
let redrive_count_of_yojson = int_of_yojson
let publish_state_machine_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_machine_version_arn =
       (value_for_key arn_of_yojson "stateMachineVersionArn" _list path);
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path)
   } : publish_state_machine_version_output)
let publish_state_machine_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       (option_of_yojson
          (value_for_key version_description_of_yojson "description") _list
          path);
     revision_id =
       (option_of_yojson (value_for_key revision_id_of_yojson "revisionId")
          _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : publish_state_machine_version_input)
let page_token_of_yojson = string_of_yojson
let page_size_of_yojson = int_of_yojson
let map_state_started_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     length =
       (option_of_yojson (value_for_key unsigned_integer_of_yojson "length")
          _list path)
   } : map_state_started_event_details)
let map_run_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "ABORTED" -> ABORTED
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "MapRunStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "MapRunStatus") : 
     map_run_status) : map_run_status)
let map_run_started_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     map_run_arn =
       (option_of_yojson (value_for_key long_arn_of_yojson "mapRunArn") _list
          path)
   } : map_run_started_event_details)
let map_run_redriven_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redrive_count =
       (option_of_yojson
          (value_for_key redrive_count_of_yojson "redriveCount") _list path);
     map_run_arn =
       (option_of_yojson (value_for_key long_arn_of_yojson "mapRunArn") _list
          path)
   } : map_run_redriven_event_details)
let map_run_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "stopDate") _list
          path);
     start_date = (value_for_key timestamp_of_yojson "startDate" _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path);
     map_run_arn = (value_for_key long_arn_of_yojson "mapRunArn" _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : map_run_list_item)
let map_run_list_of_yojson tree path =
  list_of_yojson map_run_list_item_of_yojson tree path
let map_run_label_of_yojson = string_of_yojson
let long_object_of_yojson = long_of_yojson
let map_run_item_counts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pending_redrive =
       (option_of_yojson
          (value_for_key long_object_of_yojson "pendingRedrive") _list path);
     failures_not_redrivable =
       (option_of_yojson
          (value_for_key long_object_of_yojson "failuresNotRedrivable") _list
          path);
     results_written =
       (value_for_key unsigned_long_of_yojson "resultsWritten" _list path);
     total = (value_for_key unsigned_long_of_yojson "total" _list path);
     aborted = (value_for_key unsigned_long_of_yojson "aborted" _list path);
     timed_out =
       (value_for_key unsigned_long_of_yojson "timedOut" _list path);
     failed = (value_for_key unsigned_long_of_yojson "failed" _list path);
     succeeded =
       (value_for_key unsigned_long_of_yojson "succeeded" _list path);
     running = (value_for_key unsigned_long_of_yojson "running" _list path);
     pending = (value_for_key unsigned_long_of_yojson "pending" _list path)
   } : map_run_item_counts)
let map_run_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : map_run_failed_event_details)
let map_run_execution_counts_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pending_redrive =
       (option_of_yojson
          (value_for_key long_object_of_yojson "pendingRedrive") _list path);
     failures_not_redrivable =
       (option_of_yojson
          (value_for_key long_object_of_yojson "failuresNotRedrivable") _list
          path);
     results_written =
       (value_for_key unsigned_long_of_yojson "resultsWritten" _list path);
     total = (value_for_key unsigned_long_of_yojson "total" _list path);
     aborted = (value_for_key unsigned_long_of_yojson "aborted" _list path);
     timed_out =
       (value_for_key unsigned_long_of_yojson "timedOut" _list path);
     failed = (value_for_key unsigned_long_of_yojson "failed" _list path);
     succeeded =
       (value_for_key unsigned_long_of_yojson "succeeded" _list path);
     running = (value_for_key unsigned_long_of_yojson "running" _list path);
     pending = (value_for_key unsigned_long_of_yojson "pending" _list path)
   } : map_run_execution_counts)
let map_iteration_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index =
       (option_of_yojson (value_for_key unsigned_integer_of_yojson "index")
          _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "name") _list path)
   } : map_iteration_event_details)
let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path)
   } : list_tags_for_resource_output)
let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = (value_for_key arn_of_yojson "resourceArn" _list path) } : 
    list_tags_for_resource_input)
let list_state_machines_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     state_machines =
       (value_for_key state_machine_list_of_yojson "stateMachines" _list path)
   } : list_state_machines_output)
let list_state_machines_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key page_size_of_yojson "maxResults")
          _list path)
   } : list_state_machines_input)
let list_state_machine_versions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     state_machine_versions =
       (value_for_key state_machine_version_list_of_yojson
          "stateMachineVersions" _list path)
   } : list_state_machine_versions_output)
let list_state_machine_versions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key page_size_of_yojson "maxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : list_state_machine_versions_input)
let list_state_machine_aliases_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     state_machine_aliases =
       (value_for_key state_machine_alias_list_of_yojson
          "stateMachineAliases" _list path)
   } : list_state_machine_aliases_output)
let list_state_machine_aliases_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       (option_of_yojson (value_for_key page_size_of_yojson "maxResults")
          _list path);
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : list_state_machine_aliases_input)
let list_map_runs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     map_runs = (value_for_key map_run_list_of_yojson "mapRuns" _list path)
   } : list_map_runs_output)
let list_map_runs_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key page_size_of_yojson "maxResults")
          _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : list_map_runs_input)
let list_executions_page_token_of_yojson = string_of_yojson
let execution_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "PENDING_REDRIVE" -> PENDING_REDRIVE
    | `String "ABORTED" -> ABORTED
    | `String "TIMED_OUT" -> TIMED_OUT
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "RUNNING" -> RUNNING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatus") : 
     execution_status) : execution_status)
let execution_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redrive_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "redriveDate")
          _list path);
     redrive_count =
       (option_of_yojson
          (value_for_key redrive_count_of_yojson "redriveCount") _list path);
     state_machine_alias_arn =
       (option_of_yojson (value_for_key arn_of_yojson "stateMachineAliasArn")
          _list path);
     state_machine_version_arn =
       (option_of_yojson
          (value_for_key arn_of_yojson "stateMachineVersionArn") _list path);
     item_count =
       (option_of_yojson
          (value_for_key unsigned_integer_of_yojson "itemCount") _list path);
     map_run_arn =
       (option_of_yojson (value_for_key long_arn_of_yojson "mapRunArn") _list
          path);
     stop_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "stopDate") _list
          path);
     start_date = (value_for_key timestamp_of_yojson "startDate" _list path);
     status = (value_for_key execution_status_of_yojson "status" _list path);
     name = (value_for_key name_of_yojson "name" _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : execution_list_item)
let execution_list_of_yojson tree path =
  list_of_yojson execution_list_item_of_yojson tree path
let list_executions_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson
          (value_for_key list_executions_page_token_of_yojson "nextToken")
          _list path);
     executions =
       (value_for_key execution_list_of_yojson "executions" _list path)
   } : list_executions_output)
let execution_redrive_filter_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "NOT_REDRIVEN" -> NOT_REDRIVEN
    | `String "REDRIVEN" -> REDRIVEN
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ExecutionRedriveFilter"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionRedriveFilter") : 
     execution_redrive_filter) : execution_redrive_filter)
let list_executions_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redrive_filter =
       (option_of_yojson
          (value_for_key execution_redrive_filter_of_yojson "redriveFilter")
          _list path);
     map_run_arn =
       (option_of_yojson (value_for_key long_arn_of_yojson "mapRunArn") _list
          path);
     next_token =
       (option_of_yojson
          (value_for_key list_executions_page_token_of_yojson "nextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key page_size_of_yojson "maxResults")
          _list path);
     status_filter =
       (option_of_yojson
          (value_for_key execution_status_of_yojson "statusFilter") _list
          path);
     state_machine_arn =
       (option_of_yojson (value_for_key arn_of_yojson "stateMachineArn")
          _list path)
   } : list_executions_input)
let activity_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     name = (value_for_key name_of_yojson "name" _list path);
     activity_arn = (value_for_key arn_of_yojson "activityArn" _list path)
   } : activity_list_item)
let activity_list_of_yojson tree path =
  list_of_yojson activity_list_item_of_yojson tree path
let list_activities_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     activities =
       (value_for_key activity_list_of_yojson "activities" _list path)
   } : list_activities_output)
let list_activities_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key page_size_of_yojson "maxResults")
          _list path)
   } : list_activities_input)
let lambda_function_timed_out_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : lambda_function_timed_out_event_details)
let lambda_function_succeeded_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "outputDetails") _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path)
   } : lambda_function_succeeded_event_details)
let lambda_function_start_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : lambda_function_start_failed_event_details)
let lambda_function_scheduled_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_credentials =
       (option_of_yojson
          (value_for_key task_credentials_of_yojson "taskCredentials") _list
          path);
     timeout_in_seconds =
       (option_of_yojson
          (value_for_key timeout_in_seconds_of_yojson "timeoutInSeconds")
          _list path);
     input_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "inputDetails") _list path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path);
     resource = (value_for_key arn_of_yojson "resource" _list path)
   } : lambda_function_scheduled_event_details)
let lambda_function_schedule_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : lambda_function_schedule_failed_event_details)
let lambda_function_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : lambda_function_failed_event_details)
let include_execution_data_get_execution_history_of_yojson = bool_of_yojson
let identity_of_yojson = string_of_yojson
let history_event_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "EvaluationFailed" -> EvaluationFailed
    | `String "MapRunRedriven" -> MapRunRedriven
    | `String "ExecutionRedriven" -> ExecutionRedriven
    | `String "MapRunSucceeded" -> MapRunSucceeded
    | `String "MapRunStarted" -> MapRunStarted
    | `String "MapRunFailed" -> MapRunFailed
    | `String "MapRunAborted" -> MapRunAborted
    | `String "WaitStateExited" -> WaitStateExited
    | `String "WaitStateEntered" -> WaitStateEntered
    | `String "WaitStateAborted" -> WaitStateAborted
    | `String "TaskTimedOut" -> TaskTimedOut
    | `String "TaskSucceeded" -> TaskSucceeded
    | `String "TaskSubmitted" -> TaskSubmitted
    | `String "TaskSubmitFailed" -> TaskSubmitFailed
    | `String "TaskStateExited" -> TaskStateExited
    | `String "TaskStateEntered" -> TaskStateEntered
    | `String "TaskStateAborted" -> TaskStateAborted
    | `String "TaskStartFailed" -> TaskStartFailed
    | `String "TaskStarted" -> TaskStarted
    | `String "TaskScheduled" -> TaskScheduled
    | `String "TaskFailed" -> TaskFailed
    | `String "SucceedStateExited" -> SucceedStateExited
    | `String "SucceedStateEntered" -> SucceedStateEntered
    | `String "PassStateExited" -> PassStateExited
    | `String "PassStateEntered" -> PassStateEntered
    | `String "ParallelStateSucceeded" -> ParallelStateSucceeded
    | `String "ParallelStateStarted" -> ParallelStateStarted
    | `String "ParallelStateFailed" -> ParallelStateFailed
    | `String "ParallelStateExited" -> ParallelStateExited
    | `String "ParallelStateEntered" -> ParallelStateEntered
    | `String "ParallelStateAborted" -> ParallelStateAborted
    | `String "MapStateSucceeded" -> MapStateSucceeded
    | `String "MapStateStarted" -> MapStateStarted
    | `String "MapStateFailed" -> MapStateFailed
    | `String "MapStateExited" -> MapStateExited
    | `String "MapStateEntered" -> MapStateEntered
    | `String "MapStateAborted" -> MapStateAborted
    | `String "MapIterationSucceeded" -> MapIterationSucceeded
    | `String "MapIterationStarted" -> MapIterationStarted
    | `String "MapIterationFailed" -> MapIterationFailed
    | `String "MapIterationAborted" -> MapIterationAborted
    | `String "LambdaFunctionTimedOut" -> LambdaFunctionTimedOut
    | `String "LambdaFunctionSucceeded" -> LambdaFunctionSucceeded
    | `String "LambdaFunctionStartFailed" -> LambdaFunctionStartFailed
    | `String "LambdaFunctionStarted" -> LambdaFunctionStarted
    | `String "LambdaFunctionScheduleFailed" -> LambdaFunctionScheduleFailed
    | `String "LambdaFunctionScheduled" -> LambdaFunctionScheduled
    | `String "LambdaFunctionFailed" -> LambdaFunctionFailed
    | `String "FailStateEntered" -> FailStateEntered
    | `String "ExecutionTimedOut" -> ExecutionTimedOut
    | `String "ExecutionSucceeded" -> ExecutionSucceeded
    | `String "ExecutionStarted" -> ExecutionStarted
    | `String "ExecutionFailed" -> ExecutionFailed
    | `String "ExecutionAborted" -> ExecutionAborted
    | `String "ChoiceStateExited" -> ChoiceStateExited
    | `String "ChoiceStateEntered" -> ChoiceStateEntered
    | `String "ActivityTimedOut" -> ActivityTimedOut
    | `String "ActivitySucceeded" -> ActivitySucceeded
    | `String "ActivityStarted" -> ActivityStarted
    | `String "ActivityScheduleFailed" -> ActivityScheduleFailed
    | `String "ActivityScheduled" -> ActivityScheduled
    | `String "ActivityFailed" -> ActivityFailed
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "HistoryEventType" value)
    | _ -> raise (deserialize_wrong_type_error path "HistoryEventType") : 
     history_event_type) : history_event_type)
let event_id_of_yojson = long_of_yojson
let activity_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : activity_failed_event_details)
let activity_schedule_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : activity_schedule_failed_event_details)
let activity_scheduled_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     heartbeat_in_seconds =
       (option_of_yojson
          (value_for_key timeout_in_seconds_of_yojson "heartbeatInSeconds")
          _list path);
     timeout_in_seconds =
       (option_of_yojson
          (value_for_key timeout_in_seconds_of_yojson "timeoutInSeconds")
          _list path);
     input_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "inputDetails") _list path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path);
     resource = (value_for_key arn_of_yojson "resource" _list path)
   } : activity_scheduled_event_details)
let activity_started_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_name =
       (option_of_yojson (value_for_key identity_of_yojson "workerName")
          _list path)
   } : activity_started_event_details)
let activity_succeeded_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "outputDetails") _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path)
   } : activity_succeeded_event_details)
let activity_timed_out_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : activity_timed_out_event_details)
let execution_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : execution_failed_event_details)
let execution_started_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_machine_version_arn =
       (option_of_yojson
          (value_for_key arn_of_yojson "stateMachineVersionArn") _list path);
     state_machine_alias_arn =
       (option_of_yojson (value_for_key arn_of_yojson "stateMachineAliasArn")
          _list path);
     role_arn =
       (option_of_yojson (value_for_key arn_of_yojson "roleArn") _list path);
     input_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "inputDetails") _list path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path)
   } : execution_started_event_details)
let execution_succeeded_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_details =
       (option_of_yojson
          (value_for_key history_event_execution_data_details_of_yojson
             "outputDetails") _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path)
   } : execution_succeeded_event_details)
let execution_aborted_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : execution_aborted_event_details)
let execution_timed_out_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : execution_timed_out_event_details)
let execution_redriven_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redrive_count =
       (option_of_yojson
          (value_for_key redrive_count_of_yojson "redriveCount") _list path)
   } : execution_redriven_event_details)
let evaluation_failure_location_of_yojson = string_of_yojson
let evaluation_failed_event_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = (value_for_key state_name_of_yojson "state" _list path);
     location =
       (option_of_yojson
          (value_for_key evaluation_failure_location_of_yojson "location")
          _list path);
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path)
   } : evaluation_failed_event_details)
let history_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     evaluation_failed_event_details =
       (option_of_yojson
          (value_for_key evaluation_failed_event_details_of_yojson
             "evaluationFailedEventDetails") _list path);
     map_run_redriven_event_details =
       (option_of_yojson
          (value_for_key map_run_redriven_event_details_of_yojson
             "mapRunRedrivenEventDetails") _list path);
     map_run_failed_event_details =
       (option_of_yojson
          (value_for_key map_run_failed_event_details_of_yojson
             "mapRunFailedEventDetails") _list path);
     map_run_started_event_details =
       (option_of_yojson
          (value_for_key map_run_started_event_details_of_yojson
             "mapRunStartedEventDetails") _list path);
     state_exited_event_details =
       (option_of_yojson
          (value_for_key state_exited_event_details_of_yojson
             "stateExitedEventDetails") _list path);
     state_entered_event_details =
       (option_of_yojson
          (value_for_key state_entered_event_details_of_yojson
             "stateEnteredEventDetails") _list path);
     lambda_function_timed_out_event_details =
       (option_of_yojson
          (value_for_key lambda_function_timed_out_event_details_of_yojson
             "lambdaFunctionTimedOutEventDetails") _list path);
     lambda_function_succeeded_event_details =
       (option_of_yojson
          (value_for_key lambda_function_succeeded_event_details_of_yojson
             "lambdaFunctionSucceededEventDetails") _list path);
     lambda_function_start_failed_event_details =
       (option_of_yojson
          (value_for_key lambda_function_start_failed_event_details_of_yojson
             "lambdaFunctionStartFailedEventDetails") _list path);
     lambda_function_scheduled_event_details =
       (option_of_yojson
          (value_for_key lambda_function_scheduled_event_details_of_yojson
             "lambdaFunctionScheduledEventDetails") _list path);
     lambda_function_schedule_failed_event_details =
       (option_of_yojson
          (value_for_key
             lambda_function_schedule_failed_event_details_of_yojson
             "lambdaFunctionScheduleFailedEventDetails") _list path);
     lambda_function_failed_event_details =
       (option_of_yojson
          (value_for_key lambda_function_failed_event_details_of_yojson
             "lambdaFunctionFailedEventDetails") _list path);
     map_iteration_aborted_event_details =
       (option_of_yojson
          (value_for_key map_iteration_event_details_of_yojson
             "mapIterationAbortedEventDetails") _list path);
     map_iteration_failed_event_details =
       (option_of_yojson
          (value_for_key map_iteration_event_details_of_yojson
             "mapIterationFailedEventDetails") _list path);
     map_iteration_succeeded_event_details =
       (option_of_yojson
          (value_for_key map_iteration_event_details_of_yojson
             "mapIterationSucceededEventDetails") _list path);
     map_iteration_started_event_details =
       (option_of_yojson
          (value_for_key map_iteration_event_details_of_yojson
             "mapIterationStartedEventDetails") _list path);
     map_state_started_event_details =
       (option_of_yojson
          (value_for_key map_state_started_event_details_of_yojson
             "mapStateStartedEventDetails") _list path);
     execution_redriven_event_details =
       (option_of_yojson
          (value_for_key execution_redriven_event_details_of_yojson
             "executionRedrivenEventDetails") _list path);
     execution_timed_out_event_details =
       (option_of_yojson
          (value_for_key execution_timed_out_event_details_of_yojson
             "executionTimedOutEventDetails") _list path);
     execution_aborted_event_details =
       (option_of_yojson
          (value_for_key execution_aborted_event_details_of_yojson
             "executionAbortedEventDetails") _list path);
     execution_succeeded_event_details =
       (option_of_yojson
          (value_for_key execution_succeeded_event_details_of_yojson
             "executionSucceededEventDetails") _list path);
     execution_started_event_details =
       (option_of_yojson
          (value_for_key execution_started_event_details_of_yojson
             "executionStartedEventDetails") _list path);
     execution_failed_event_details =
       (option_of_yojson
          (value_for_key execution_failed_event_details_of_yojson
             "executionFailedEventDetails") _list path);
     task_timed_out_event_details =
       (option_of_yojson
          (value_for_key task_timed_out_event_details_of_yojson
             "taskTimedOutEventDetails") _list path);
     task_succeeded_event_details =
       (option_of_yojson
          (value_for_key task_succeeded_event_details_of_yojson
             "taskSucceededEventDetails") _list path);
     task_submitted_event_details =
       (option_of_yojson
          (value_for_key task_submitted_event_details_of_yojson
             "taskSubmittedEventDetails") _list path);
     task_submit_failed_event_details =
       (option_of_yojson
          (value_for_key task_submit_failed_event_details_of_yojson
             "taskSubmitFailedEventDetails") _list path);
     task_started_event_details =
       (option_of_yojson
          (value_for_key task_started_event_details_of_yojson
             "taskStartedEventDetails") _list path);
     task_start_failed_event_details =
       (option_of_yojson
          (value_for_key task_start_failed_event_details_of_yojson
             "taskStartFailedEventDetails") _list path);
     task_scheduled_event_details =
       (option_of_yojson
          (value_for_key task_scheduled_event_details_of_yojson
             "taskScheduledEventDetails") _list path);
     task_failed_event_details =
       (option_of_yojson
          (value_for_key task_failed_event_details_of_yojson
             "taskFailedEventDetails") _list path);
     activity_timed_out_event_details =
       (option_of_yojson
          (value_for_key activity_timed_out_event_details_of_yojson
             "activityTimedOutEventDetails") _list path);
     activity_succeeded_event_details =
       (option_of_yojson
          (value_for_key activity_succeeded_event_details_of_yojson
             "activitySucceededEventDetails") _list path);
     activity_started_event_details =
       (option_of_yojson
          (value_for_key activity_started_event_details_of_yojson
             "activityStartedEventDetails") _list path);
     activity_scheduled_event_details =
       (option_of_yojson
          (value_for_key activity_scheduled_event_details_of_yojson
             "activityScheduledEventDetails") _list path);
     activity_schedule_failed_event_details =
       (option_of_yojson
          (value_for_key activity_schedule_failed_event_details_of_yojson
             "activityScheduleFailedEventDetails") _list path);
     activity_failed_event_details =
       (option_of_yojson
          (value_for_key activity_failed_event_details_of_yojson
             "activityFailedEventDetails") _list path);
     previous_event_id =
       (option_of_yojson (value_for_key event_id_of_yojson "previousEventId")
          _list path);
     id = (value_for_key event_id_of_yojson "id" _list path);
     type_ = (value_for_key history_event_type_of_yojson "type" _list path);
     timestamp = (value_for_key timestamp_of_yojson "timestamp" _list path)
   } : history_event)
let history_event_list_of_yojson tree path =
  list_of_yojson history_event_of_yojson tree path
let get_execution_history_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     events =
       (value_for_key history_event_list_of_yojson "events" _list path)
   } : get_execution_history_output)
let get_execution_history_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     include_execution_data =
       (option_of_yojson
          (value_for_key
             include_execution_data_get_execution_history_of_yojson
             "includeExecutionData") _list path);
     next_token =
       (option_of_yojson (value_for_key page_token_of_yojson "nextToken")
          _list path);
     reverse_order =
       (option_of_yojson
          (value_for_key reverse_order_of_yojson "reverseOrder") _list path);
     max_results =
       (option_of_yojson (value_for_key page_size_of_yojson "maxResults")
          _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : get_execution_history_input)
let get_activity_task_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input =
       (option_of_yojson
          (value_for_key sensitive_data_job_input_of_yojson "input") _list
          path);
     task_token =
       (option_of_yojson (value_for_key task_token_of_yojson "taskToken")
          _list path)
   } : get_activity_task_output)
let get_activity_task_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worker_name =
       (option_of_yojson (value_for_key name_of_yojson "workerName") _list
          path);
     activity_arn = (value_for_key arn_of_yojson "activityArn" _list path)
   } : get_activity_task_input)
let activity_worker_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : activity_worker_limit_exceeded)
let activity_does_not_exist_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : activity_does_not_exist)
let execution_redrive_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "REDRIVABLE_BY_MAP_RUN" -> REDRIVABLE_BY_MAP_RUN
    | `String "NOT_REDRIVABLE" -> NOT_REDRIVABLE
    | `String "REDRIVABLE" -> REDRIVABLE
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ExecutionRedriveStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionRedriveStatus") : 
     execution_redrive_status) : execution_redrive_status)
let describe_state_machine_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variable_references =
       (option_of_yojson
          (value_for_key variable_references_of_yojson "variableReferences")
          _list path);
     encryption_configuration =
       (option_of_yojson
          (value_for_key encryption_configuration_of_yojson
             "encryptionConfiguration") _list path);
     description =
       (option_of_yojson
          (value_for_key version_description_of_yojson "description") _list
          path);
     revision_id =
       (option_of_yojson (value_for_key revision_id_of_yojson "revisionId")
          _list path);
     label =
       (option_of_yojson (value_for_key map_run_label_of_yojson "label")
          _list path);
     tracing_configuration =
       (option_of_yojson
          (value_for_key tracing_configuration_of_yojson
             "tracingConfiguration") _list path);
     logging_configuration =
       (option_of_yojson
          (value_for_key logging_configuration_of_yojson
             "loggingConfiguration") _list path);
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     type_ = (value_for_key state_machine_type_of_yojson "type" _list path);
     role_arn = (value_for_key arn_of_yojson "roleArn" _list path);
     definition =
       (value_for_key definition_of_yojson "definition" _list path);
     status =
       (option_of_yojson
          (value_for_key state_machine_status_of_yojson "status") _list path);
     name = (value_for_key name_of_yojson "name" _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : describe_state_machine_output)
let describe_state_machine_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     included_data =
       (option_of_yojson
          (value_for_key included_data_of_yojson "includedData") _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : describe_state_machine_input)
let describe_state_machine_for_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     variable_references =
       (option_of_yojson
          (value_for_key variable_references_of_yojson "variableReferences")
          _list path);
     encryption_configuration =
       (option_of_yojson
          (value_for_key encryption_configuration_of_yojson
             "encryptionConfiguration") _list path);
     revision_id =
       (option_of_yojson (value_for_key revision_id_of_yojson "revisionId")
          _list path);
     label =
       (option_of_yojson (value_for_key map_run_label_of_yojson "label")
          _list path);
     map_run_arn =
       (option_of_yojson (value_for_key long_arn_of_yojson "mapRunArn") _list
          path);
     tracing_configuration =
       (option_of_yojson
          (value_for_key tracing_configuration_of_yojson
             "tracingConfiguration") _list path);
     logging_configuration =
       (option_of_yojson
          (value_for_key logging_configuration_of_yojson
             "loggingConfiguration") _list path);
     update_date =
       (value_for_key timestamp_of_yojson "updateDate" _list path);
     role_arn = (value_for_key arn_of_yojson "roleArn" _list path);
     definition =
       (value_for_key definition_of_yojson "definition" _list path);
     name = (value_for_key name_of_yojson "name" _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : describe_state_machine_for_execution_output)
let describe_state_machine_for_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     included_data =
       (option_of_yojson
          (value_for_key included_data_of_yojson "includedData") _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : describe_state_machine_for_execution_input)
let describe_state_machine_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     update_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "updateDate")
          _list path);
     creation_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "creationDate")
          _list path);
     routing_configuration =
       (option_of_yojson
          (value_for_key routing_configuration_list_of_yojson
             "routingConfiguration") _list path);
     description =
       (option_of_yojson
          (value_for_key alias_description_of_yojson "description") _list
          path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "name") _list path);
     state_machine_alias_arn =
       (option_of_yojson (value_for_key arn_of_yojson "stateMachineAliasArn")
          _list path)
   } : describe_state_machine_alias_output)
let describe_state_machine_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_machine_alias_arn =
       (value_for_key arn_of_yojson "stateMachineAliasArn" _list path)
   } : describe_state_machine_alias_input)
let describe_map_run_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redrive_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "redriveDate")
          _list path);
     redrive_count =
       (option_of_yojson
          (value_for_key redrive_count_of_yojson "redriveCount") _list path);
     execution_counts =
       (value_for_key map_run_execution_counts_of_yojson "executionCounts"
          _list path);
     item_counts =
       (value_for_key map_run_item_counts_of_yojson "itemCounts" _list path);
     tolerated_failure_count =
       (value_for_key tolerated_failure_count_of_yojson
          "toleratedFailureCount" _list path);
     tolerated_failure_percentage =
       (value_for_key tolerated_failure_percentage_of_yojson
          "toleratedFailurePercentage" _list path);
     max_concurrency =
       (value_for_key max_concurrency_of_yojson "maxConcurrency" _list path);
     stop_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "stopDate") _list
          path);
     start_date = (value_for_key timestamp_of_yojson "startDate" _list path);
     status = (value_for_key map_run_status_of_yojson "status" _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path);
     map_run_arn = (value_for_key long_arn_of_yojson "mapRunArn" _list path)
   } : describe_map_run_output)
let describe_map_run_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ map_run_arn = (value_for_key long_arn_of_yojson "mapRunArn" _list path)
   } : describe_map_run_input)
let describe_execution_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     redrive_status_reason =
       (option_of_yojson
          (value_for_key sensitive_data_of_yojson "redriveStatusReason")
          _list path);
     redrive_status =
       (option_of_yojson
          (value_for_key execution_redrive_status_of_yojson "redriveStatus")
          _list path);
     redrive_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "redriveDate")
          _list path);
     redrive_count =
       (option_of_yojson
          (value_for_key redrive_count_of_yojson "redriveCount") _list path);
     state_machine_alias_arn =
       (option_of_yojson (value_for_key arn_of_yojson "stateMachineAliasArn")
          _list path);
     state_machine_version_arn =
       (option_of_yojson
          (value_for_key arn_of_yojson "stateMachineVersionArn") _list path);
     cause =
       (option_of_yojson (value_for_key sensitive_cause_of_yojson "cause")
          _list path);
     error =
       (option_of_yojson (value_for_key sensitive_error_of_yojson "error")
          _list path);
     map_run_arn =
       (option_of_yojson (value_for_key long_arn_of_yojson "mapRunArn") _list
          path);
     trace_header =
       (option_of_yojson (value_for_key trace_header_of_yojson "traceHeader")
          _list path);
     output_details =
       (option_of_yojson
          (value_for_key cloud_watch_events_execution_data_details_of_yojson
             "outputDetails") _list path);
     output =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "output")
          _list path);
     input_details =
       (option_of_yojson
          (value_for_key cloud_watch_events_execution_data_details_of_yojson
             "inputDetails") _list path);
     input =
       (option_of_yojson (value_for_key sensitive_data_of_yojson "input")
          _list path);
     stop_date =
       (option_of_yojson (value_for_key timestamp_of_yojson "stopDate") _list
          path);
     start_date = (value_for_key timestamp_of_yojson "startDate" _list path);
     status = (value_for_key execution_status_of_yojson "status" _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "name") _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : describe_execution_output)
let describe_execution_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     included_data =
       (option_of_yojson
          (value_for_key included_data_of_yojson "includedData") _list path);
     execution_arn = (value_for_key arn_of_yojson "executionArn" _list path)
   } : describe_execution_input)
let describe_activity_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       (option_of_yojson
          (value_for_key encryption_configuration_of_yojson
             "encryptionConfiguration") _list path);
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     name = (value_for_key name_of_yojson "name" _list path);
     activity_arn = (value_for_key arn_of_yojson "activityArn" _list path)
   } : describe_activity_output)
let describe_activity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ activity_arn = (value_for_key arn_of_yojson "activityArn" _list path) } : 
    describe_activity_input)
let delete_state_machine_version_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_state_machine_version_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_machine_version_arn =
       (value_for_key long_arn_of_yojson "stateMachineVersionArn" _list path)
   } : delete_state_machine_version_input)
let delete_state_machine_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_state_machine_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : delete_state_machine_input)
let delete_state_machine_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_state_machine_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_machine_alias_arn =
       (value_for_key arn_of_yojson "stateMachineAliasArn" _list path)
   } : delete_state_machine_alias_input)
let delete_activity_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_activity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ activity_arn = (value_for_key arn_of_yojson "activityArn" _list path) } : 
    delete_activity_input)
let create_state_machine_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_machine_version_arn =
       (option_of_yojson
          (value_for_key arn_of_yojson "stateMachineVersionArn") _list path);
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     state_machine_arn =
       (value_for_key arn_of_yojson "stateMachineArn" _list path)
   } : create_state_machine_output)
let create_state_machine_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       (option_of_yojson
          (value_for_key encryption_configuration_of_yojson
             "encryptionConfiguration") _list path);
     version_description =
       (option_of_yojson
          (value_for_key version_description_of_yojson "versionDescription")
          _list path);
     publish =
       (option_of_yojson (value_for_key publish_of_yojson "publish") _list
          path);
     tracing_configuration =
       (option_of_yojson
          (value_for_key tracing_configuration_of_yojson
             "tracingConfiguration") _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path);
     logging_configuration =
       (option_of_yojson
          (value_for_key logging_configuration_of_yojson
             "loggingConfiguration") _list path);
     type_ =
       (option_of_yojson (value_for_key state_machine_type_of_yojson "type")
          _list path);
     role_arn = (value_for_key arn_of_yojson "roleArn" _list path);
     definition =
       (value_for_key definition_of_yojson "definition" _list path);
     name = (value_for_key name_of_yojson "name" _list path)
   } : create_state_machine_input)
let create_state_machine_alias_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     state_machine_alias_arn =
       (value_for_key arn_of_yojson "stateMachineAliasArn" _list path)
   } : create_state_machine_alias_output)
let character_restricted_name_of_yojson = string_of_yojson
let create_state_machine_alias_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     routing_configuration =
       (value_for_key routing_configuration_list_of_yojson
          "routingConfiguration" _list path);
     name =
       (value_for_key character_restricted_name_of_yojson "name" _list path);
     description =
       (option_of_yojson
          (value_for_key alias_description_of_yojson "description") _list
          path)
   } : create_state_machine_alias_input)
let create_activity_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_date =
       (value_for_key timestamp_of_yojson "creationDate" _list path);
     activity_arn = (value_for_key arn_of_yojson "activityArn" _list path)
   } : create_activity_output)
let create_activity_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     encryption_configuration =
       (option_of_yojson
          (value_for_key encryption_configuration_of_yojson
             "encryptionConfiguration") _list path);
     tags =
       (option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path);
     name = (value_for_key name_of_yojson "name" _list path)
   } : create_activity_input)
let activity_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : activity_limit_exceeded)
let activity_already_exists_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : activity_already_exists)