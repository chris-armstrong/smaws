open Smaws_Lib.Json.DeserializeHelpers
open Types

let with_key_of_yojson = string_of_yojson
let vpc_endpoint_id_of_yojson = string_of_yojson
let value_key_of_yojson = string_of_yojson
let value_of_yojson = string_of_yojson
let message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : validation_exception)

let user_identity_of_yojson = string_of_yojson
let upper_case_string_with_keys_of_yojson tree path = list_of_yojson with_key_of_yojson tree path

let upper_case_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ with_keys = value_for_key upper_case_string_with_keys_of_yojson "withKeys" _list path }
    : upper_case_string)

let arn_of_yojson = string_of_yojson
let scheduled_query_name_of_yojson = string_of_yojson
let scheduled_query_description_of_yojson = string_of_yojson

let query_language_of_yojson (tree : t) path =
  ((match tree with
    | `String "PPL" -> PPL
    | `String "SQL" -> SQL
    | `String "CWLI" -> CWLI
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueryLanguage" value)
    | _ -> raise (deserialize_wrong_type_error path "QueryLanguage")
     : query_language)
    : query_language)

let query_string_of_yojson = string_of_yojson
let log_group_identifier_of_yojson = string_of_yojson

let scheduled_query_log_group_identifiers_of_yojson tree path =
  list_of_yojson log_group_identifier_of_yojson tree path

let schedule_expression_of_yojson = string_of_yojson
let schedule_timezone_of_yojson = string_of_yojson
let start_time_offset_of_yojson = long_of_yojson
let end_time_offset_of_yojson = long_of_yojson
let s3_uri_of_yojson = string_of_yojson
let role_arn_of_yojson = string_of_yojson
let account_id_of_yojson = string_of_yojson
let kms_key_id_of_yojson = string_of_yojson

let s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     owner_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "ownerAccountId") _list path;
     role_arn = value_for_key role_arn_of_yojson "roleArn" _list path;
     destination_identifier = value_for_key s3_uri_of_yojson "destinationIdentifier" _list path;
   }
    : s3_configuration)

let destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_configuration = value_for_key s3_configuration_of_yojson "s3Configuration" _list path }
    : destination_configuration)

let scheduled_query_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduledQueryState" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduledQueryState")
     : scheduled_query_state)
    : scheduled_query_state)

let schedule_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWS_MANAGED" -> AWS_MANAGED
    | `String "CUSTOMER_MANAGED" -> CUSTOMER_MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleType")
     : schedule_type)
    : schedule_type)

let timestamp_of_yojson = long_of_yojson

let execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Timeout" -> Timeout
    | `String "Failed" -> Failed
    | `String "Complete" -> Complete
    | `String "InvalidQuery" -> InvalidQuery
    | `String "Running" -> Running
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatus")
     : execution_status)
    : execution_status)

let update_scheduled_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "executionRoleArn") _list path;
     schedule_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "scheduleEndTime") _list path;
     schedule_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "scheduleStartTime") _list path;
     last_execution_status =
       option_of_yojson (value_for_key execution_status_of_yojson "lastExecutionStatus") _list path;
     last_triggered_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastTriggeredTime") _list path;
     schedule_type =
       option_of_yojson (value_for_key schedule_type_of_yojson "scheduleType") _list path;
     state = option_of_yojson (value_for_key scheduled_query_state_of_yojson "state") _list path;
     destination_configuration =
       option_of_yojson
         (value_for_key destination_configuration_of_yojson "destinationConfiguration")
         _list path;
     end_time_offset =
       option_of_yojson (value_for_key end_time_offset_of_yojson "endTimeOffset") _list path;
     start_time_offset =
       option_of_yojson (value_for_key start_time_offset_of_yojson "startTimeOffset") _list path;
     timezone = option_of_yojson (value_for_key schedule_timezone_of_yojson "timezone") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "scheduleExpression")
         _list path;
     log_group_identifiers =
       option_of_yojson
         (value_for_key scheduled_query_log_group_identifiers_of_yojson "logGroupIdentifiers")
         _list path;
     query_string = option_of_yojson (value_for_key query_string_of_yojson "queryString") _list path;
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
     description =
       option_of_yojson
         (value_for_key scheduled_query_description_of_yojson "description")
         _list path;
     name = option_of_yojson (value_for_key scheduled_query_name_of_yojson "name") _list path;
     scheduled_query_arn =
       option_of_yojson (value_for_key arn_of_yojson "scheduledQueryArn") _list path;
   }
    : update_scheduled_query_response)

let scheduled_query_identifier_of_yojson = string_of_yojson

let update_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key scheduled_query_state_of_yojson "state") _list path;
     execution_role_arn = value_for_key role_arn_of_yojson "executionRoleArn" _list path;
     schedule_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "scheduleEndTime") _list path;
     schedule_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "scheduleStartTime") _list path;
     destination_configuration =
       option_of_yojson
         (value_for_key destination_configuration_of_yojson "destinationConfiguration")
         _list path;
     end_time_offset =
       option_of_yojson (value_for_key end_time_offset_of_yojson "endTimeOffset") _list path;
     start_time_offset =
       option_of_yojson (value_for_key start_time_offset_of_yojson "startTimeOffset") _list path;
     timezone = option_of_yojson (value_for_key schedule_timezone_of_yojson "timezone") _list path;
     schedule_expression =
       value_for_key schedule_expression_of_yojson "scheduleExpression" _list path;
     log_group_identifiers =
       option_of_yojson
         (value_for_key scheduled_query_log_group_identifiers_of_yojson "logGroupIdentifiers")
         _list path;
     query_string = value_for_key query_string_of_yojson "queryString" _list path;
     query_language = value_for_key query_language_of_yojson "queryLanguage" _list path;
     description =
       option_of_yojson
         (value_for_key scheduled_query_description_of_yojson "description")
         _list path;
     identifier = value_for_key scheduled_query_identifier_of_yojson "identifier" _list path;
   }
    : update_scheduled_query_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : access_denied_exception)

let update_lookup_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     lookup_table_arn = option_of_yojson (value_for_key arn_of_yojson "lookupTableArn") _list path;
   }
    : update_lookup_table_response)

let lookup_table_description_of_yojson = string_of_yojson
let table_body_of_yojson = string_of_yojson

let update_lookup_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     table_body = value_for_key table_body_of_yojson "tableBody" _list path;
     description =
       option_of_yojson (value_for_key lookup_table_description_of_yojson "description") _list path;
     lookup_table_arn = value_for_key arn_of_yojson "lookupTableArn" _list path;
   }
    : update_lookup_table_request)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : service_unavailable_exception)

let invalid_parameter_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_parameter_exception)

let anomaly_detector_arn_of_yojson = string_of_yojson

let evaluation_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONE_HOUR" -> ONE_HOUR
    | `String "THIRTY_MIN" -> THIRTY_MIN
    | `String "FIFTEEN_MIN" -> FIFTEEN_MIN
    | `String "TEN_MIN" -> TEN_MIN
    | `String "FIVE_MIN" -> FIVE_MIN
    | `String "ONE_MIN" -> ONE_MIN
    | `String value -> raise (deserialize_unknown_enum_value_error path "EvaluationFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "EvaluationFrequency")
     : evaluation_frequency)
    : evaluation_frequency)

let filter_pattern_of_yojson = string_of_yojson
let anomaly_visibility_time_of_yojson = long_of_yojson
let boolean__of_yojson = bool_of_yojson

let update_log_anomaly_detector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = value_for_key boolean__of_yojson "enabled" _list path;
     anomaly_visibility_time =
       option_of_yojson
         (value_for_key anomaly_visibility_time_of_yojson "anomalyVisibilityTime")
         _list path;
     filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "filterPattern") _list path;
     evaluation_frequency =
       option_of_yojson
         (value_for_key evaluation_frequency_of_yojson "evaluationFrequency")
         _list path;
     anomaly_detector_arn =
       value_for_key anomaly_detector_arn_of_yojson "anomalyDetectorArn" _list path;
   }
    : update_log_anomaly_detector_request)

let operation_aborted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : operation_aborted_exception)

let update_delivery_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delivery_id_of_yojson = string_of_yojson
let field_header_of_yojson = string_of_yojson
let record_fields_of_yojson tree path = list_of_yojson field_header_of_yojson tree path
let field_delimiter_of_yojson = string_of_yojson
let delivery_suffix_path_of_yojson = string_of_yojson

let s3_delivery_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_hive_compatible_path =
       option_of_yojson (value_for_key boolean__of_yojson "enableHiveCompatiblePath") _list path;
     suffix_path =
       option_of_yojson (value_for_key delivery_suffix_path_of_yojson "suffixPath") _list path;
   }
    : s3_delivery_configuration)

let update_delivery_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_delivery_configuration =
       option_of_yojson
         (value_for_key s3_delivery_configuration_of_yojson "s3DeliveryConfiguration")
         _list path;
     field_delimiter =
       option_of_yojson (value_for_key field_delimiter_of_yojson "fieldDelimiter") _list path;
     record_fields =
       option_of_yojson (value_for_key record_fields_of_yojson "recordFields") _list path;
     id = value_for_key delivery_id_of_yojson "id" _list path;
   }
    : update_delivery_configuration_request)

let anomaly_id_of_yojson = string_of_yojson
let pattern_id_of_yojson = string_of_yojson

let suppression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "INFINITE" -> INFINITE
    | `String "LIMITED" -> LIMITED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SuppressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "SuppressionType")
     : suppression_type)
    : suppression_type)

let integer_of_yojson = int_of_yojson

let suppression_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "HOURS" -> HOURS
    | `String "MINUTES" -> MINUTES
    | `String "SECONDS" -> SECONDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "SuppressionUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "SuppressionUnit")
     : suppression_unit)
    : suppression_unit)

let suppression_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     suppression_unit =
       option_of_yojson (value_for_key suppression_unit_of_yojson "suppressionUnit") _list path;
     value = option_of_yojson (value_for_key integer_of_yojson "value") _list path;
   }
    : suppression_period)

let baseline_of_yojson = bool_of_yojson

let update_anomaly_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baseline = option_of_yojson (value_for_key baseline_of_yojson "baseline") _list path;
     suppression_period =
       option_of_yojson (value_for_key suppression_period_of_yojson "suppressionPeriod") _list path;
     suppression_type =
       option_of_yojson (value_for_key suppression_type_of_yojson "suppressionType") _list path;
     anomaly_detector_arn =
       value_for_key anomaly_detector_arn_of_yojson "anomalyDetectorArn" _list path;
     pattern_id = option_of_yojson (value_for_key pattern_id_of_yojson "patternId") _list path;
     anomaly_id = option_of_yojson (value_for_key anomaly_id_of_yojson "anomalyId") _list path;
   }
    : update_anomaly_request)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let log_group_name_of_yojson = string_of_yojson
let tag_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_log_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : untag_log_group_request)

let unrecognized_client_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : unrecognized_client_exception)

let unmask_of_yojson = bool_of_yojson
let key_of_yojson = string_of_yojson

let type__of_yojson (tree : t) path =
  ((match tree with
    | `String "string" -> STRING
    | `String "double" -> DOUBLE
    | `String "integer" -> INTEGER
    | `String "boolean" -> BOOLEAN
    | `String value -> raise (deserialize_unknown_enum_value_error path "Type" value)
    | _ -> raise (deserialize_wrong_type_error path "Type")
     : type_)
    : type_)

let type_converter_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key type__of_yojson "type" _list path;
     key = value_for_key key_of_yojson "key" _list path;
   }
    : type_converter_entry)

let type_converter_entries_of_yojson tree path =
  list_of_yojson type_converter_entry_of_yojson tree path

let type_converter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key type_converter_entries_of_yojson "entries" _list path }
    : type_converter)

let trim_string_with_keys_of_yojson tree path = list_of_yojson with_key_of_yojson tree path

let trim_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ with_keys = value_for_key trim_string_with_keys_of_yojson "withKeys" _list path }
    : trim_string)

let query_id_of_yojson = string_of_yojson
let string__of_yojson = string_of_yojson

let scheduled_query_destination_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "S3" -> S3
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScheduledQueryDestinationType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduledQueryDestinationType")
     : scheduled_query_destination_type)
    : scheduled_query_destination_type)

let action_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETE" -> COMPLETE
    | `String "FAILED" -> FAILED
    | `String "CLIENT_ERROR" -> CLIENT_ERROR
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionStatus")
     : action_status)
    : action_status)

let scheduled_query_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message = option_of_yojson (value_for_key string__of_yojson "errorMessage") _list path;
     processed_identifier =
       option_of_yojson (value_for_key string__of_yojson "processedIdentifier") _list path;
     status = option_of_yojson (value_for_key action_status_of_yojson "status") _list path;
     destination_identifier =
       option_of_yojson (value_for_key string__of_yojson "destinationIdentifier") _list path;
     destination_type =
       option_of_yojson
         (value_for_key scheduled_query_destination_type_of_yojson "destinationType")
         _list path;
   }
    : scheduled_query_destination)

let scheduled_query_destination_list_of_yojson tree path =
  list_of_yojson scheduled_query_destination_of_yojson tree path

let trigger_history_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destinations =
       option_of_yojson
         (value_for_key scheduled_query_destination_list_of_yojson "destinations")
         _list path;
     error_message = option_of_yojson (value_for_key string__of_yojson "errorMessage") _list path;
     triggered_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "triggeredTimestamp") _list path;
     execution_status =
       option_of_yojson (value_for_key execution_status_of_yojson "executionStatus") _list path;
     query_id = option_of_yojson (value_for_key query_id_of_yojson "queryId") _list path;
   }
    : trigger_history_record)

let trigger_history_record_list_of_yojson tree path =
  list_of_yojson trigger_history_record_of_yojson tree path

let event_number_of_yojson = long_of_yojson
let event_message_of_yojson = string_of_yojson
let transformed_event_message_of_yojson = string_of_yojson

let transformed_log_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformed_event_message =
       option_of_yojson
         (value_for_key transformed_event_message_of_yojson "transformedEventMessage")
         _list path;
     event_message =
       option_of_yojson (value_for_key event_message_of_yojson "eventMessage") _list path;
     event_number = option_of_yojson (value_for_key event_number_of_yojson "eventNumber") _list path;
   }
    : transformed_log_record)

let transformed_logs_of_yojson tree path = list_of_yojson transformed_log_record_of_yojson tree path

let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_name =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "resourceName") _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
   }
    : too_many_tags_exception)

let token_value_of_yojson = long_of_yojson
let token_string_of_yojson = string_of_yojson
let token_of_yojson = string_of_yojson
let to_key_of_yojson = string_of_yojson
let time_of_yojson = string_of_yojson

let test_transformer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformed_logs =
       option_of_yojson (value_for_key transformed_logs_of_yojson "transformedLogs") _list path;
   }
    : test_transformer_response)

let add_key_value_of_yojson = string_of_yojson
let overwrite_if_exists_of_yojson = bool_of_yojson

let add_key_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overwrite_if_exists =
       option_of_yojson (value_for_key overwrite_if_exists_of_yojson "overwriteIfExists") _list path;
     value = value_for_key add_key_value_of_yojson "value" _list path;
     key = value_for_key key_of_yojson "key" _list path;
   }
    : add_key_entry)

let add_key_entries_of_yojson tree path = list_of_yojson add_key_entry_of_yojson tree path

let add_keys_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key add_key_entries_of_yojson "entries" _list path } : add_keys)

let source_of_yojson = string_of_yojson
let target_of_yojson = string_of_yojson

let copy_value_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overwrite_if_exists =
       option_of_yojson (value_for_key overwrite_if_exists_of_yojson "overwriteIfExists") _list path;
     target = value_for_key target_of_yojson "target" _list path;
     source = value_for_key source_of_yojson "source" _list path;
   }
    : copy_value_entry)

let copy_value_entries_of_yojson tree path = list_of_yojson copy_value_entry_of_yojson tree path

let copy_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key copy_value_entries_of_yojson "entries" _list path } : copy_value)

let quote_character_of_yojson = string_of_yojson
let delimiter_of_yojson = string_of_yojson
let column_of_yojson = string_of_yojson
let columns_of_yojson tree path = list_of_yojson column_of_yojson tree path
let destination_field_of_yojson = string_of_yojson

let cs_v_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination =
       option_of_yojson (value_for_key destination_field_of_yojson "destination") _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
     columns = option_of_yojson (value_for_key columns_of_yojson "columns") _list path;
     delimiter = option_of_yojson (value_for_key delimiter_of_yojson "delimiter") _list path;
     quote_character =
       option_of_yojson (value_for_key quote_character_of_yojson "quoteCharacter") _list path;
   }
    : cs_v)

let target_format_of_yojson = string_of_yojson
let match_pattern_of_yojson = string_of_yojson
let match_patterns_of_yojson tree path = list_of_yojson match_pattern_of_yojson tree path
let source_timezone_of_yojson = string_of_yojson
let target_timezone_of_yojson = string_of_yojson
let locale_of_yojson = string_of_yojson

let date_time_converter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
     target_timezone =
       option_of_yojson (value_for_key target_timezone_of_yojson "targetTimezone") _list path;
     source_timezone =
       option_of_yojson (value_for_key source_timezone_of_yojson "sourceTimezone") _list path;
     match_patterns = value_for_key match_patterns_of_yojson "matchPatterns" _list path;
     target_format =
       option_of_yojson (value_for_key target_format_of_yojson "targetFormat") _list path;
     target = value_for_key target_of_yojson "target" _list path;
     source = value_for_key source_of_yojson "source" _list path;
   }
    : date_time_converter)

let delete_with_keys_of_yojson tree path = list_of_yojson with_key_of_yojson tree path

let delete_keys_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ with_keys = value_for_key delete_with_keys_of_yojson "withKeys" _list path } : delete_keys)

let grok_match_of_yojson = string_of_yojson

let grok_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_ = value_for_key grok_match_of_yojson "match" _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
   }
    : grok)

let flatten_of_yojson = bool_of_yojson

let flattened_element_of_yojson (tree : t) path =
  ((match tree with
    | `String "last" -> LAST
    | `String "first" -> FIRST
    | `String value -> raise (deserialize_unknown_enum_value_error path "FlattenedElement" value)
    | _ -> raise (deserialize_wrong_type_error path "FlattenedElement")
     : flattened_element)
    : flattened_element)

let list_to_map_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flattened_element =
       option_of_yojson (value_for_key flattened_element_of_yojson "flattenedElement") _list path;
     flatten = option_of_yojson (value_for_key flatten_of_yojson "flatten") _list path;
     target = option_of_yojson (value_for_key target_of_yojson "target") _list path;
     value_key = option_of_yojson (value_for_key value_key_of_yojson "valueKey") _list path;
     key = value_for_key key_of_yojson "key" _list path;
     source = value_for_key source_of_yojson "source" _list path;
   }
    : list_to_map)

let lower_case_string_with_keys_of_yojson tree path = list_of_yojson with_key_of_yojson tree path

let lower_case_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ with_keys = value_for_key lower_case_string_with_keys_of_yojson "withKeys" _list path }
    : lower_case_string)

let move_key_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overwrite_if_exists =
       option_of_yojson (value_for_key overwrite_if_exists_of_yojson "overwriteIfExists") _list path;
     target = value_for_key target_of_yojson "target" _list path;
     source = value_for_key source_of_yojson "source" _list path;
   }
    : move_key_entry)

let move_key_entries_of_yojson tree path = list_of_yojson move_key_entry_of_yojson tree path

let move_keys_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key move_key_entries_of_yojson "entries" _list path } : move_keys)

let parse_cloudfront_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ source = option_of_yojson (value_for_key source_of_yojson "source") _list path }
    : parse_cloudfront)

let parse_jso_n_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination =
       option_of_yojson (value_for_key destination_field_of_yojson "destination") _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
   }
    : parse_jso_n)

let parser_field_delimiter_of_yojson = string_of_yojson
let key_value_delimiter_of_yojson = string_of_yojson
let key_prefix_of_yojson = string_of_yojson
let non_match_value_of_yojson = string_of_yojson

let parse_key_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overwrite_if_exists =
       option_of_yojson (value_for_key overwrite_if_exists_of_yojson "overwriteIfExists") _list path;
     non_match_value =
       option_of_yojson (value_for_key non_match_value_of_yojson "nonMatchValue") _list path;
     key_prefix = option_of_yojson (value_for_key key_prefix_of_yojson "keyPrefix") _list path;
     key_value_delimiter =
       option_of_yojson (value_for_key key_value_delimiter_of_yojson "keyValueDelimiter") _list path;
     field_delimiter =
       option_of_yojson (value_for_key parser_field_delimiter_of_yojson "fieldDelimiter") _list path;
     destination =
       option_of_yojson (value_for_key destination_field_of_yojson "destination") _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
   }
    : parse_key_value)

let parse_route53_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ source = option_of_yojson (value_for_key source_of_yojson "source") _list path }
    : parse_route53)

let event_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "AWSWAF" -> AWSWAF
    | `String "EKSAudit" -> EKS_AUDIT
    | `String "VPCFlow" -> VPC_FLOW
    | `String "Route53Resolver" -> ROUTE53_RESOLVER
    | `String "CloudTrail" -> CLOUD_TRAIL
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventSource" value)
    | _ -> raise (deserialize_wrong_type_error path "EventSource")
     : event_source)
    : event_source)

let ocsf_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "V1.5" -> V1_5
    | `String "V1.1" -> V1_1
    | `String value -> raise (deserialize_unknown_enum_value_error path "OCSFVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "OCSFVersion")
     : ocsf_version)
    : ocsf_version)

let mapping_version_of_yojson = string_of_yojson

let parse_to_ocs_f_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mapping_version =
       option_of_yojson (value_for_key mapping_version_of_yojson "mappingVersion") _list path;
     ocsf_version = value_for_key ocsf_version_of_yojson "ocsfVersion" _list path;
     event_source = value_for_key event_source_of_yojson "eventSource" _list path;
     source = option_of_yojson (value_for_key source_of_yojson "source") _list path;
   }
    : parse_to_ocs_f)

let parse_postgres_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ source = option_of_yojson (value_for_key source_of_yojson "source") _list path }
    : parse_postgres)

let parse_vp_c_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ source = option_of_yojson (value_for_key source_of_yojson "source") _list path } : parse_vp_c)

let parse_wa_f_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ source = option_of_yojson (value_for_key source_of_yojson "source") _list path } : parse_wa_f)

let rename_to_of_yojson = string_of_yojson

let rename_key_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overwrite_if_exists =
       option_of_yojson (value_for_key overwrite_if_exists_of_yojson "overwriteIfExists") _list path;
     rename_to = value_for_key rename_to_of_yojson "renameTo" _list path;
     key = value_for_key key_of_yojson "key" _list path;
   }
    : rename_key_entry)

let rename_key_entries_of_yojson tree path = list_of_yojson rename_key_entry_of_yojson tree path

let rename_keys_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key rename_key_entries_of_yojson "entries" _list path } : rename_keys)

let split_string_delimiter_of_yojson = string_of_yojson

let split_string_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delimiter = value_for_key split_string_delimiter_of_yojson "delimiter" _list path;
     source = value_for_key source_of_yojson "source" _list path;
   }
    : split_string_entry)

let split_string_entries_of_yojson tree path = list_of_yojson split_string_entry_of_yojson tree path

let split_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key split_string_entries_of_yojson "entries" _list path } : split_string)

let from_key_of_yojson = string_of_yojson

let substitute_string_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     to_ = value_for_key to_key_of_yojson "to" _list path;
     from_ = value_for_key from_key_of_yojson "from" _list path;
     source = value_for_key source_of_yojson "source" _list path;
   }
    : substitute_string_entry)

let substitute_string_entries_of_yojson tree path =
  list_of_yojson substitute_string_entry_of_yojson tree path

let substitute_string_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ entries = value_for_key substitute_string_entries_of_yojson "entries" _list path }
    : substitute_string)

let processor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upper_case_string =
       option_of_yojson (value_for_key upper_case_string_of_yojson "upperCaseString") _list path;
     type_converter =
       option_of_yojson (value_for_key type_converter_of_yojson "typeConverter") _list path;
     trim_string = option_of_yojson (value_for_key trim_string_of_yojson "trimString") _list path;
     substitute_string =
       option_of_yojson (value_for_key substitute_string_of_yojson "substituteString") _list path;
     split_string = option_of_yojson (value_for_key split_string_of_yojson "splitString") _list path;
     rename_keys = option_of_yojson (value_for_key rename_keys_of_yojson "renameKeys") _list path;
     parse_wa_f = option_of_yojson (value_for_key parse_wa_f_of_yojson "parseWAF") _list path;
     parse_vp_c = option_of_yojson (value_for_key parse_vp_c_of_yojson "parseVPC") _list path;
     parse_postgres =
       option_of_yojson (value_for_key parse_postgres_of_yojson "parsePostgres") _list path;
     parse_to_ocs_f =
       option_of_yojson (value_for_key parse_to_ocs_f_of_yojson "parseToOCSF") _list path;
     parse_route53 =
       option_of_yojson (value_for_key parse_route53_of_yojson "parseRoute53") _list path;
     parse_key_value =
       option_of_yojson (value_for_key parse_key_value_of_yojson "parseKeyValue") _list path;
     parse_jso_n = option_of_yojson (value_for_key parse_jso_n_of_yojson "parseJSON") _list path;
     parse_cloudfront =
       option_of_yojson (value_for_key parse_cloudfront_of_yojson "parseCloudfront") _list path;
     move_keys = option_of_yojson (value_for_key move_keys_of_yojson "moveKeys") _list path;
     lower_case_string =
       option_of_yojson (value_for_key lower_case_string_of_yojson "lowerCaseString") _list path;
     list_to_map = option_of_yojson (value_for_key list_to_map_of_yojson "listToMap") _list path;
     grok = option_of_yojson (value_for_key grok_of_yojson "grok") _list path;
     delete_keys = option_of_yojson (value_for_key delete_keys_of_yojson "deleteKeys") _list path;
     date_time_converter =
       option_of_yojson (value_for_key date_time_converter_of_yojson "dateTimeConverter") _list path;
     csv = option_of_yojson (value_for_key cs_v_of_yojson "csv") _list path;
     copy_value = option_of_yojson (value_for_key copy_value_of_yojson "copyValue") _list path;
     add_keys = option_of_yojson (value_for_key add_keys_of_yojson "addKeys") _list path;
   }
    : processor)

let processors_of_yojson tree path = list_of_yojson processor_of_yojson tree path
let test_event_messages_of_yojson tree path = list_of_yojson event_message_of_yojson tree path

let test_transformer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_event_messages = value_for_key test_event_messages_of_yojson "logEventMessages" _list path;
     transformer_config = value_for_key processors_of_yojson "transformerConfig" _list path;
   }
    : test_transformer_request)

let invalid_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : invalid_operation_exception)

let extracted_values_of_yojson tree path = map_of_yojson token_of_yojson value_of_yojson tree path

let metric_filter_match_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     extracted_values =
       option_of_yojson (value_for_key extracted_values_of_yojson "extractedValues") _list path;
     event_message =
       option_of_yojson (value_for_key event_message_of_yojson "eventMessage") _list path;
     event_number = option_of_yojson (value_for_key event_number_of_yojson "eventNumber") _list path;
   }
    : metric_filter_match_record)

let metric_filter_matches_of_yojson tree path =
  list_of_yojson metric_filter_match_record_of_yojson tree path

let test_metric_filter_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     matches = option_of_yojson (value_for_key metric_filter_matches_of_yojson "matches") _list path;
   }
    : test_metric_filter_response)

let test_metric_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_event_messages = value_for_key test_event_messages_of_yojson "logEventMessages" _list path;
     filter_pattern = value_for_key filter_pattern_of_yojson "filterPattern" _list path;
   }
    : test_metric_filter_request)

let target_arn_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tags_of_yojson tree path = map_of_yojson tag_key_of_yojson tag_value_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_of_yojson "tags" _list path;
     resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let tag_log_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_of_yojson "tags" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : tag_log_group_request)

let tag_filter_key_of_yojson = string_of_yojson
let tag_filter_value_of_yojson = string_of_yojson
let tag_filter_values_of_yojson tree path = list_of_yojson tag_filter_value_of_yojson tree path

let tag_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key tag_filter_values_of_yojson "values") _list path;
     key = value_for_key tag_filter_key_of_yojson "key" _list path;
   }
    : tag_filter)

let tag_filters_of_yojson tree path = list_of_yojson tag_filter_of_yojson tree path
let table_fields_of_yojson tree path = list_of_yojson string__of_yojson tree path
let system_field_of_yojson = string_of_yojson

let syslog_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VPCE" -> VPCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SyslogSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "SyslogSourceType")
     : syslog_source_type)
    : syslog_source_type)

let log_group_arn_of_yojson = string_of_yojson

let syslog_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "vpcEndpointId") _list path;
     source_type =
       option_of_yojson (value_for_key syslog_source_type_of_yojson "sourceType") _list path;
     log_group_arn =
       option_of_yojson (value_for_key log_group_arn_of_yojson "logGroupArn") _list path;
   }
    : syslog_configuration)

let syslog_configurations_of_yojson tree path =
  list_of_yojson syslog_configuration_of_yojson tree path

let suppression_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNSUPPRESSED" -> UNSUPPRESSED
    | `String "SUPPRESSED" -> SUPPRESSED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SuppressionState" value)
    | _ -> raise (deserialize_wrong_type_error path "SuppressionState")
     : suppression_state)
    : suppression_state)

let success_of_yojson = bool_of_yojson
let filter_name_of_yojson = string_of_yojson
let destination_arn_of_yojson = string_of_yojson

let distribution_of_yojson (tree : t) path =
  ((match tree with
    | `String "ByLogStream" -> ByLogStream
    | `String "Random" -> Random
    | `String value -> raise (deserialize_unknown_enum_value_error path "Distribution" value)
    | _ -> raise (deserialize_wrong_type_error path "Distribution")
     : distribution)
    : distribution)

let apply_on_transformed_logs_of_yojson = bool_of_yojson
let field_selection_criteria_of_yojson = string_of_yojson
let emit_system_fields_of_yojson tree path = list_of_yojson system_field_of_yojson tree path

let subscription_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     emit_system_fields =
       option_of_yojson (value_for_key emit_system_fields_of_yojson "emitSystemFields") _list path;
     field_selection_criteria =
       option_of_yojson
         (value_for_key field_selection_criteria_of_yojson "fieldSelectionCriteria")
         _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     apply_on_transformed_logs =
       option_of_yojson
         (value_for_key apply_on_transformed_logs_of_yojson "applyOnTransformedLogs")
         _list path;
     distribution =
       option_of_yojson (value_for_key distribution_of_yojson "distribution") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     destination_arn =
       option_of_yojson (value_for_key destination_arn_of_yojson "destinationArn") _list path;
     filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "filterPattern") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     filter_name = option_of_yojson (value_for_key filter_name_of_yojson "filterName") _list path;
   }
    : subscription_filter)

let subscription_filters_of_yojson tree path =
  list_of_yojson subscription_filter_of_yojson tree path

let stored_bytes_of_yojson = long_of_yojson

let stop_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ success = option_of_yojson (value_for_key success_of_yojson "success") _list path }
    : stop_query_response)

let stop_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_id = value_for_key query_id_of_yojson "queryId" _list path } : stop_query_request)

let stats_value_of_yojson = double_of_yojson

let state_of_yojson (tree : t) path =
  ((match tree with
    | `String "Baseline" -> Baseline
    | `String "Suppressed" -> Suppressed
    | `String "Active" -> Active
    | `String value -> raise (deserialize_unknown_enum_value_error path "State" value)
    | _ -> raise (deserialize_wrong_type_error path "State")
     : state)
    : state)

let start_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_id = option_of_yojson (value_for_key query_id_of_yojson "queryId") _list path }
    : start_query_response)

let log_group_names_of_yojson tree path = list_of_yojson log_group_name_of_yojson tree path

let log_group_identifiers_of_yojson tree path =
  list_of_yojson log_group_identifier_of_yojson tree path

let events_limit_start_query_of_yojson = int_of_yojson

let start_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key events_limit_start_query_of_yojson "limit") _list path;
     query_string = value_for_key query_string_of_yojson "queryString" _list path;
     end_time = value_for_key timestamp_of_yojson "endTime" _list path;
     start_time = value_for_key timestamp_of_yojson "startTime" _list path;
     log_group_identifiers =
       option_of_yojson
         (value_for_key log_group_identifiers_of_yojson "logGroupIdentifiers")
         _list path;
     log_group_names =
       option_of_yojson (value_for_key log_group_names_of_yojson "logGroupNames") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
   }
    : start_query_request)

let query_char_offset_of_yojson = int_of_yojson

let query_compile_error_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_char_offset =
       option_of_yojson (value_for_key query_char_offset_of_yojson "endCharOffset") _list path;
     start_char_offset =
       option_of_yojson (value_for_key query_char_offset_of_yojson "startCharOffset") _list path;
   }
    : query_compile_error_location)

let query_compile_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     location =
       option_of_yojson (value_for_key query_compile_error_location_of_yojson "location") _list path;
   }
    : query_compile_error)

let malformed_query_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     query_compile_error =
       option_of_yojson (value_for_key query_compile_error_of_yojson "queryCompileError") _list path;
   }
    : malformed_query_exception)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : limit_exceeded_exception)

let request_id_of_yojson = string_of_yojson
let session_id_of_yojson = string_of_yojson

let start_live_tail_log_group_identifiers_of_yojson tree path =
  list_of_yojson log_group_identifier_of_yojson tree path

let log_stream_name_of_yojson = string_of_yojson
let input_log_stream_names_of_yojson tree path = list_of_yojson log_stream_name_of_yojson tree path

let live_tail_session_start_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_event_filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "logEventFilterPattern") _list path;
     log_stream_name_prefixes =
       option_of_yojson
         (value_for_key input_log_stream_names_of_yojson "logStreamNamePrefixes")
         _list path;
     log_stream_names =
       option_of_yojson (value_for_key input_log_stream_names_of_yojson "logStreamNames") _list path;
     log_group_identifiers =
       option_of_yojson
         (value_for_key start_live_tail_log_group_identifiers_of_yojson "logGroupIdentifiers")
         _list path;
     session_id = option_of_yojson (value_for_key session_id_of_yojson "sessionId") _list path;
     request_id = option_of_yojson (value_for_key request_id_of_yojson "requestId") _list path;
   }
    : live_tail_session_start)

let is_sampled_of_yojson = bool_of_yojson

let live_tail_session_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ sampled = option_of_yojson (value_for_key is_sampled_of_yojson "sampled") _list path }
    : live_tail_session_metadata)

let live_tail_session_log_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingestion_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ingestionTime") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "timestamp") _list path;
     message = option_of_yojson (value_for_key event_message_of_yojson "message") _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
     log_stream_name =
       option_of_yojson (value_for_key log_stream_name_of_yojson "logStreamName") _list path;
   }
    : live_tail_session_log_event)

let live_tail_session_results_of_yojson tree path =
  list_of_yojson live_tail_session_log_event_of_yojson tree path

let live_tail_session_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     session_results =
       option_of_yojson
         (value_for_key live_tail_session_results_of_yojson "sessionResults")
         _list path;
     session_metadata =
       option_of_yojson
         (value_for_key live_tail_session_metadata_of_yojson "sessionMetadata")
         _list path;
   }
    : live_tail_session_update)

let session_timeout_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : session_timeout_exception)

let session_streaming_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : session_streaming_exception)

let start_live_tail_response_stream_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "SessionStreamingException" ->
       SessionStreamingException (session_streaming_exception_of_yojson value_ path)
   | "SessionTimeoutException" ->
       SessionTimeoutException (session_timeout_exception_of_yojson value_ path)
   | "sessionUpdate" -> SessionUpdate (live_tail_session_update_of_yojson value_ path)
   | "sessionStart" -> SessionStart (live_tail_session_start_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "StartLiveTailResponseStream" unknown)
    : start_live_tail_response_stream)

let start_live_tail_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     response_stream =
       option_of_yojson
         (value_for_key start_live_tail_response_stream_of_yojson "responseStream")
         _list path;
   }
    : start_live_tail_response)

let start_live_tail_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_event_filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "logEventFilterPattern") _list path;
     log_stream_name_prefixes =
       option_of_yojson
         (value_for_key input_log_stream_names_of_yojson "logStreamNamePrefixes")
         _list path;
     log_stream_names =
       option_of_yojson (value_for_key input_log_stream_names_of_yojson "logStreamNames") _list path;
     log_group_identifiers =
       value_for_key start_live_tail_log_group_identifiers_of_yojson "logGroupIdentifiers" _list
         path;
   }
    : start_live_tail_request)

let start_from_head_of_yojson = bool_of_yojson

let standard_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "None" -> None_
    | `String "Count/Second" -> CountSecond
    | `String "Terabits/Second" -> TerabitsSecond
    | `String "Gigabits/Second" -> GigabitsSecond
    | `String "Megabits/Second" -> MegabitsSecond
    | `String "Kilobits/Second" -> KilobitsSecond
    | `String "Bits/Second" -> BitsSecond
    | `String "Terabytes/Second" -> TerabytesSecond
    | `String "Gigabytes/Second" -> GigabytesSecond
    | `String "Megabytes/Second" -> MegabytesSecond
    | `String "Kilobytes/Second" -> KilobytesSecond
    | `String "Bytes/Second" -> BytesSecond
    | `String "Count" -> Count
    | `String "Percent" -> Percent
    | `String "Terabits" -> Terabits
    | `String "Gigabits" -> Gigabits
    | `String "Megabits" -> Megabits
    | `String "Kilobits" -> Kilobits
    | `String "Bits" -> Bits
    | `String "Terabytes" -> Terabytes
    | `String "Gigabytes" -> Gigabytes
    | `String "Megabytes" -> Megabytes
    | `String "Kilobytes" -> Kilobytes
    | `String "Bytes" -> Bytes
    | `String "Milliseconds" -> Milliseconds
    | `String "Microseconds" -> Microseconds
    | `String "Seconds" -> Seconds
    | `String value -> raise (deserialize_unknown_enum_value_error path "StandardUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "StandardUnit")
     : standard_unit)
    : standard_unit)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : service_quota_exceeded_exception)

let service_of_yojson = string_of_yojson
let sequence_token_of_yojson = string_of_yojson
let selection_criteria_of_yojson = string_of_yojson
let log_stream_searched_completely_of_yojson = bool_of_yojson

let searched_log_stream_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     searched_completely =
       option_of_yojson
         (value_for_key log_stream_searched_completely_of_yojson "searchedCompletely")
         _list path;
     log_stream_name =
       option_of_yojson (value_for_key log_stream_name_of_yojson "logStreamName") _list path;
   }
    : searched_log_stream)

let searched_log_streams_of_yojson tree path =
  list_of_yojson searched_log_stream_of_yojson tree path

let scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Scope" value)
    | _ -> raise (deserialize_wrong_type_error path "Scope")
     : scope)
    : scope)

let scheduled_query_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     destination_configuration =
       option_of_yojson
         (value_for_key destination_configuration_of_yojson "destinationConfiguration")
         _list path;
     timezone = option_of_yojson (value_for_key schedule_timezone_of_yojson "timezone") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "scheduleExpression")
         _list path;
     last_execution_status =
       option_of_yojson (value_for_key execution_status_of_yojson "lastExecutionStatus") _list path;
     last_triggered_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastTriggeredTime") _list path;
     schedule_type =
       option_of_yojson (value_for_key schedule_type_of_yojson "scheduleType") _list path;
     state = option_of_yojson (value_for_key scheduled_query_state_of_yojson "state") _list path;
     name = option_of_yojson (value_for_key scheduled_query_name_of_yojson "name") _list path;
     scheduled_query_arn =
       option_of_yojson (value_for_key arn_of_yojson "scheduledQueryArn") _list path;
   }
    : scheduled_query_summary)

let scheduled_query_summary_list_of_yojson tree path =
  list_of_yojson scheduled_query_summary_of_yojson tree path

let s3_tables_datasource_name_of_yojson = string_of_yojson
let s3_tables_datasource_type_of_yojson = string_of_yojson

let s3_tables_integration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datasource_type =
       option_of_yojson
         (value_for_key s3_tables_datasource_type_of_yojson "datasourceType")
         _list path;
     datasource_name =
       option_of_yojson
         (value_for_key s3_tables_datasource_name_of_yojson "datasourceName")
         _list path;
   }
    : s3_tables_integration)

let s3_table_integration_source_identifier_of_yojson = string_of_yojson
let data_source_name_of_yojson = string_of_yojson
let data_source_type_of_yojson = string_of_yojson

let data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key data_source_type_of_yojson "type") _list path;
     name = value_for_key data_source_name_of_yojson "name" _list path;
   }
    : data_source)

let s3_table_integration_source_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATA_SOURCE_DELETE_IN_PROGRESS" -> DATA_SOURCE_DELETE_IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "S3TableIntegrationSourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "S3TableIntegrationSourceStatus")
     : s3_table_integration_source_status)
    : s3_table_integration_source_status)

let s3_table_integration_source_status_reason_of_yojson = string_of_yojson

let s3_table_integration_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parent_source_identifier =
       option_of_yojson
         (value_for_key s3_table_integration_source_identifier_of_yojson "parentSourceIdentifier")
         _list path;
     created_time_stamp =
       option_of_yojson (value_for_key timestamp_of_yojson "createdTimeStamp") _list path;
     status_reason =
       option_of_yojson
         (value_for_key s3_table_integration_source_status_reason_of_yojson "statusReason")
         _list path;
     status =
       option_of_yojson
         (value_for_key s3_table_integration_source_status_of_yojson "status")
         _list path;
     data_source = option_of_yojson (value_for_key data_source_of_yojson "dataSource") _list path;
     identifier =
       option_of_yojson
         (value_for_key s3_table_integration_source_identifier_of_yojson "identifier")
         _list path;
   }
    : s3_table_integration_source)

let s3_table_integration_sources_of_yojson tree path =
  list_of_yojson s3_table_integration_source_of_yojson tree path

let field_of_yojson = string_of_yojson

let result_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key value_of_yojson "value") _list path;
     field = option_of_yojson (value_for_key field_of_yojson "field") _list path;
   }
    : result_field)

let result_rows_of_yojson tree path = list_of_yojson result_field_of_yojson tree path
let resource_type_of_yojson = string_of_yojson
let resource_types_of_yojson tree path = list_of_yojson resource_type_of_yojson tree path
let policy_name_of_yojson = string_of_yojson
let policy_document_of_yojson = string_of_yojson

let policy_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESOURCE" -> RESOURCE
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyScope" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyScope")
     : policy_scope)
    : policy_scope)

let expected_revision_id_of_yojson = string_of_yojson

let resource_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id =
       option_of_yojson (value_for_key expected_revision_id_of_yojson "revisionId") _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "resourceArn") _list path;
     policy_scope = option_of_yojson (value_for_key policy_scope_of_yojson "policyScope") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "policyDocument") _list path;
     policy_name = option_of_yojson (value_for_key policy_name_of_yojson "policyName") _list path;
   }
    : resource_policy)

let resource_policies_of_yojson tree path = list_of_yojson resource_policy_of_yojson tree path
let resource_identifier_of_yojson = string_of_yojson
let dashboard_viewer_principals_of_yojson tree path = list_of_yojson arn_of_yojson tree path
let collection_retention_days_of_yojson = int_of_yojson

let open_search_resource_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_days = value_for_key collection_retention_days_of_yojson "retentionDays" _list path;
     application_arn = option_of_yojson (value_for_key arn_of_yojson "applicationArn") _list path;
     dashboard_viewer_principals =
       value_for_key dashboard_viewer_principals_of_yojson "dashboardViewerPrincipals" _list path;
     data_source_role_arn = value_for_key arn_of_yojson "dataSourceRoleArn" _list path;
     kms_key_arn = option_of_yojson (value_for_key arn_of_yojson "kmsKeyArn") _list path;
   }
    : open_search_resource_config)

let resource_config_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "openSearchResourceConfig" ->
       OpenSearchResourceConfig (open_search_resource_config_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ResourceConfig" unknown)
    : resource_config)

let resource_arns_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let resource_already_exists_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : resource_already_exists_exception)

let log_event_index_of_yojson = int_of_yojson

let rejected_log_events_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expired_log_event_end_index =
       option_of_yojson
         (value_for_key log_event_index_of_yojson "expiredLogEventEndIndex")
         _list path;
     too_old_log_event_end_index =
       option_of_yojson
         (value_for_key log_event_index_of_yojson "tooOldLogEventEndIndex")
         _list path;
     too_new_log_event_start_index =
       option_of_yojson
         (value_for_key log_event_index_of_yojson "tooNewLogEventStartIndex")
         _list path;
   }
    : rejected_log_events_info)

let entity_rejection_error_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MissingRequiredFields" -> MISSING_REQUIRED_FIELDS
    | `String "UnsupportedLogGroupType" -> UNSUPPORTED_LOG_GROUP_TYPE
    | `String "EntitySizeTooLarge" -> ENTITY_SIZE_TOO_LARGE
    | `String "InvalidAttributes" -> INVALID_ATTRIBUTES
    | `String "InvalidKeyAttributes" -> INVALID_KEY_ATTRIBUTE
    | `String "InvalidTypeValue" -> INVALID_TYPE_VALUE
    | `String "InvalidEntity" -> INVALID_ENTITY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EntityRejectionErrorType" value)
    | _ -> raise (deserialize_wrong_type_error path "EntityRejectionErrorType")
     : entity_rejection_error_type)
    : entity_rejection_error_type)

let rejected_entity_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ error_type = value_for_key entity_rejection_error_type_of_yojson "errorType" _list path }
    : rejected_entity_info)

let records_count_of_yojson = long_of_yojson

let record_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mandatory = option_of_yojson (value_for_key boolean__of_yojson "mandatory") _list path;
     name = option_of_yojson (value_for_key field_header_of_yojson "name") _list path;
   }
    : record_field)

let query_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Unknown" -> Unknown
    | `String "Timeout" -> Timeout
    | `String "Cancelled" -> Cancelled
    | `String "Failed" -> Failed
    | `String "Complete" -> Complete
    | `String "Running" -> Running
    | `String "Scheduled" -> Scheduled
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "QueryStatus")
     : query_status)
    : query_status)

let query_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_groups_scanned =
       option_of_yojson (value_for_key stats_value_of_yojson "logGroupsScanned") _list path;
     estimated_bytes_skipped =
       option_of_yojson (value_for_key stats_value_of_yojson "estimatedBytesSkipped") _list path;
     bytes_scanned =
       option_of_yojson (value_for_key stats_value_of_yojson "bytesScanned") _list path;
     estimated_records_skipped =
       option_of_yojson (value_for_key stats_value_of_yojson "estimatedRecordsSkipped") _list path;
     records_scanned =
       option_of_yojson (value_for_key stats_value_of_yojson "recordsScanned") _list path;
     records_matched =
       option_of_yojson (value_for_key stats_value_of_yojson "recordsMatched") _list path;
   }
    : query_statistics)

let query_results_of_yojson tree path = list_of_yojson result_rows_of_yojson tree path
let query_parameter_name_of_yojson = string_of_yojson
let query_parameter_default_value_of_yojson = string_of_yojson
let query_parameter_description_of_yojson = string_of_yojson

let query_parameter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description =
       option_of_yojson
         (value_for_key query_parameter_description_of_yojson "description")
         _list path;
     default_value =
       option_of_yojson
         (value_for_key query_parameter_default_value_of_yojson "defaultValue")
         _list path;
     name = value_for_key query_parameter_name_of_yojson "name" _list path;
   }
    : query_parameter)

let query_parameter_list_of_yojson tree path = list_of_yojson query_parameter_of_yojson tree path
let query_list_max_results_of_yojson = int_of_yojson
let query_duration_of_yojson = long_of_yojson
let bytes_scanned_value_of_yojson = double_of_yojson

let query_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_identity =
       option_of_yojson (value_for_key user_identity_of_yojson "userIdentity") _list path;
     bytes_scanned =
       option_of_yojson (value_for_key bytes_scanned_value_of_yojson "bytesScanned") _list path;
     query_duration =
       option_of_yojson (value_for_key query_duration_of_yojson "queryDuration") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     create_time = option_of_yojson (value_for_key timestamp_of_yojson "createTime") _list path;
     status = option_of_yojson (value_for_key query_status_of_yojson "status") _list path;
     query_string = option_of_yojson (value_for_key query_string_of_yojson "queryString") _list path;
     query_id = option_of_yojson (value_for_key query_id_of_yojson "queryId") _list path;
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
   }
    : query_info)

let query_info_list_of_yojson tree path = list_of_yojson query_info_of_yojson tree path
let query_definition_string_of_yojson = string_of_yojson
let query_definition_name_of_yojson = string_of_yojson

let query_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson (value_for_key query_parameter_list_of_yojson "parameters") _list path;
     log_group_names =
       option_of_yojson (value_for_key log_group_names_of_yojson "logGroupNames") _list path;
     last_modified = option_of_yojson (value_for_key timestamp_of_yojson "lastModified") _list path;
     query_string =
       option_of_yojson (value_for_key query_definition_string_of_yojson "queryString") _list path;
     name = option_of_yojson (value_for_key query_definition_name_of_yojson "name") _list path;
     query_definition_id =
       option_of_yojson (value_for_key query_id_of_yojson "queryDefinitionId") _list path;
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
   }
    : query_definition)

let query_definition_list_of_yojson tree path = list_of_yojson query_definition_of_yojson tree path

let put_transformer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformer_config = value_for_key processors_of_yojson "transformerConfig" _list path;
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : put_transformer_request)

let put_syslog_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "vpcEndpointId") _list path;
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : put_syslog_configuration_request)

let put_subscription_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     emit_system_fields =
       option_of_yojson (value_for_key emit_system_fields_of_yojson "emitSystemFields") _list path;
     field_selection_criteria =
       option_of_yojson
         (value_for_key field_selection_criteria_of_yojson "fieldSelectionCriteria")
         _list path;
     apply_on_transformed_logs =
       option_of_yojson
         (value_for_key apply_on_transformed_logs_of_yojson "applyOnTransformedLogs")
         _list path;
     distribution =
       option_of_yojson (value_for_key distribution_of_yojson "distribution") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     destination_arn = value_for_key destination_arn_of_yojson "destinationArn" _list path;
     filter_pattern = value_for_key filter_pattern_of_yojson "filterPattern" _list path;
     filter_name = value_for_key filter_name_of_yojson "filterName" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : put_subscription_filter_request)

let days_of_yojson = int_of_yojson

let put_retention_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retention_in_days = value_for_key days_of_yojson "retentionInDays" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : put_retention_policy_request)

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     revision_id =
       option_of_yojson (value_for_key expected_revision_id_of_yojson "revisionId") _list path;
     resource_policy =
       option_of_yojson (value_for_key resource_policy_of_yojson "resourcePolicy") _list path;
   }
    : put_resource_policy_response)

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_revision_id =
       option_of_yojson
         (value_for_key expected_revision_id_of_yojson "expectedRevisionId")
         _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "resourceArn") _list path;
     policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "policyDocument") _list path;
     policy_name = option_of_yojson (value_for_key policy_name_of_yojson "policyName") _list path;
   }
    : put_resource_policy_request)

let put_query_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_definition_id =
       option_of_yojson (value_for_key query_id_of_yojson "queryDefinitionId") _list path;
   }
    : put_query_definition_response)

let client_token_of_yojson = string_of_yojson

let put_query_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameters =
       option_of_yojson (value_for_key query_parameter_list_of_yojson "parameters") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     query_string = value_for_key query_definition_string_of_yojson "queryString" _list path;
     log_group_names =
       option_of_yojson (value_for_key log_group_names_of_yojson "logGroupNames") _list path;
     query_definition_id =
       option_of_yojson (value_for_key query_id_of_yojson "queryDefinitionId") _list path;
     name = value_for_key query_definition_name_of_yojson "name" _list path;
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
   }
    : put_query_definition_request)

let metric_name_of_yojson = string_of_yojson
let metric_namespace_of_yojson = string_of_yojson
let metric_value_of_yojson = string_of_yojson
let default_value_of_yojson = double_of_yojson
let dimensions_value_of_yojson = string_of_yojson
let dimensions_key_of_yojson = string_of_yojson

let dimensions_of_yojson tree path =
  map_of_yojson dimensions_key_of_yojson dimensions_value_of_yojson tree path

let metric_transformation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ = option_of_yojson (value_for_key standard_unit_of_yojson "unit") _list path;
     dimensions = option_of_yojson (value_for_key dimensions_of_yojson "dimensions") _list path;
     default_value =
       option_of_yojson (value_for_key default_value_of_yojson "defaultValue") _list path;
     metric_value = value_for_key metric_value_of_yojson "metricValue" _list path;
     metric_namespace = value_for_key metric_namespace_of_yojson "metricNamespace" _list path;
     metric_name = value_for_key metric_name_of_yojson "metricName" _list path;
   }
    : metric_transformation)

let metric_transformations_of_yojson tree path =
  list_of_yojson metric_transformation_of_yojson tree path

let put_metric_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     emit_system_field_dimensions =
       option_of_yojson
         (value_for_key emit_system_fields_of_yojson "emitSystemFieldDimensions")
         _list path;
     field_selection_criteria =
       option_of_yojson
         (value_for_key field_selection_criteria_of_yojson "fieldSelectionCriteria")
         _list path;
     apply_on_transformed_logs =
       option_of_yojson
         (value_for_key apply_on_transformed_logs_of_yojson "applyOnTransformedLogs")
         _list path;
     metric_transformations =
       value_for_key metric_transformations_of_yojson "metricTransformations" _list path;
     filter_pattern = value_for_key filter_pattern_of_yojson "filterPattern" _list path;
     filter_name = value_for_key filter_name_of_yojson "filterName" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : put_metric_filter_request)

let deletion_protection_enabled_of_yojson = bool_of_yojson

let put_log_group_deletion_protection_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_protection_enabled =
       value_for_key deletion_protection_enabled_of_yojson "deletionProtectionEnabled" _list path;
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : put_log_group_deletion_protection_request)

let put_log_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rejected_entity_info =
       option_of_yojson
         (value_for_key rejected_entity_info_of_yojson "rejectedEntityInfo")
         _list path;
     rejected_log_events_info =
       option_of_yojson
         (value_for_key rejected_log_events_info_of_yojson "rejectedLogEventsInfo")
         _list path;
     next_sequence_token =
       option_of_yojson (value_for_key sequence_token_of_yojson "nextSequenceToken") _list path;
   }
    : put_log_events_response)

let input_log_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key event_message_of_yojson "message" _list path;
     timestamp = value_for_key timestamp_of_yojson "timestamp" _list path;
   }
    : input_log_event)

let input_log_events_of_yojson tree path = list_of_yojson input_log_event_of_yojson tree path
let entity_key_attributes_value_of_yojson = string_of_yojson
let entity_key_attributes_key_of_yojson = string_of_yojson

let entity_key_attributes_of_yojson tree path =
  map_of_yojson entity_key_attributes_key_of_yojson entity_key_attributes_value_of_yojson tree path

let entity_attributes_value_of_yojson = string_of_yojson
let entity_attributes_key_of_yojson = string_of_yojson

let entity_attributes_of_yojson tree path =
  map_of_yojson entity_attributes_key_of_yojson entity_attributes_value_of_yojson tree path

let entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes =
       option_of_yojson (value_for_key entity_attributes_of_yojson "attributes") _list path;
     key_attributes =
       option_of_yojson (value_for_key entity_key_attributes_of_yojson "keyAttributes") _list path;
   }
    : entity)

let put_log_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     entity = option_of_yojson (value_for_key entity_of_yojson "entity") _list path;
     sequence_token =
       option_of_yojson (value_for_key sequence_token_of_yojson "sequenceToken") _list path;
     log_events = value_for_key input_log_events_of_yojson "logEvents" _list path;
     log_stream_name = value_for_key log_stream_name_of_yojson "logStreamName" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : put_log_events_request)

let invalid_sequence_token_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     expected_sequence_token =
       option_of_yojson (value_for_key sequence_token_of_yojson "expectedSequenceToken") _list path;
   }
    : invalid_sequence_token_exception)

let data_already_accepted_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     expected_sequence_token =
       option_of_yojson (value_for_key sequence_token_of_yojson "expectedSequenceToken") _list path;
   }
    : data_already_accepted_exception)

let integration_name_of_yojson = string_of_yojson

let integration_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "ACTIVE" -> ACTIVE
    | `String "PROVISIONING" -> PROVISIONING
    | `String value -> raise (deserialize_unknown_enum_value_error path "IntegrationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "IntegrationStatus")
     : integration_status)
    : integration_status)

let put_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_status =
       option_of_yojson (value_for_key integration_status_of_yojson "integrationStatus") _list path;
     integration_name =
       option_of_yojson (value_for_key integration_name_of_yojson "integrationName") _list path;
   }
    : put_integration_response)

let integration_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPENSEARCH" -> OPENSEARCH
    | `String value -> raise (deserialize_unknown_enum_value_error path "IntegrationType" value)
    | _ -> raise (deserialize_wrong_type_error path "IntegrationType")
     : integration_type)
    : integration_type)

let put_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_type = value_for_key integration_type_of_yojson "integrationType" _list path;
     resource_config = value_for_key resource_config_of_yojson "resourceConfig" _list path;
     integration_name = value_for_key integration_name_of_yojson "integrationName" _list path;
   }
    : put_integration_request)

let index_source_of_yojson (tree : t) path =
  ((match tree with
    | `String "LOG_GROUP" -> LOG_GROUP
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "IndexSource" value)
    | _ -> raise (deserialize_wrong_type_error path "IndexSource")
     : index_source)
    : index_source)

let index_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key index_source_of_yojson "source") _list path;
     policy_name = option_of_yojson (value_for_key policy_name_of_yojson "policyName") _list path;
     policy_document =
       option_of_yojson (value_for_key policy_document_of_yojson "policyDocument") _list path;
     last_update_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdateTime") _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
   }
    : index_policy)

let put_index_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     index_policy = option_of_yojson (value_for_key index_policy_of_yojson "indexPolicy") _list path;
   }
    : put_index_policy_response)

let put_index_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_document = value_for_key policy_document_of_yojson "policyDocument" _list path;
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : put_index_policy_request)

let destination_name_of_yojson = string_of_yojson
let access_policy_of_yojson = string_of_yojson

let destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     access_policy =
       option_of_yojson (value_for_key access_policy_of_yojson "accessPolicy") _list path;
     role_arn = option_of_yojson (value_for_key role_arn_of_yojson "roleArn") _list path;
     target_arn = option_of_yojson (value_for_key target_arn_of_yojson "targetArn") _list path;
     destination_name =
       option_of_yojson (value_for_key destination_name_of_yojson "destinationName") _list path;
   }
    : destination)

let put_destination_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ destination = option_of_yojson (value_for_key destination_of_yojson "destination") _list path }
    : put_destination_response)

let put_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     role_arn = value_for_key role_arn_of_yojson "roleArn" _list path;
     target_arn = value_for_key target_arn_of_yojson "targetArn" _list path;
     destination_name = value_for_key destination_name_of_yojson "destinationName" _list path;
   }
    : put_destination_request)

let force_update_of_yojson = bool_of_yojson

let put_destination_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force_update = option_of_yojson (value_for_key force_update_of_yojson "forceUpdate") _list path;
     access_policy = value_for_key access_policy_of_yojson "accessPolicy" _list path;
     destination_name = value_for_key destination_name_of_yojson "destinationName" _list path;
   }
    : put_destination_policy_request)

let delivery_source_name_of_yojson = string_of_yojson
let log_type_of_yojson = string_of_yojson
let delivery_source_configuration_value_of_yojson = string_of_yojson
let delivery_source_configuration_key_of_yojson = string_of_yojson

let delivery_source_configuration_of_yojson tree path =
  map_of_yojson delivery_source_configuration_key_of_yojson
    delivery_source_configuration_value_of_yojson tree path

let delivery_source_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INACTIVE" -> INACTIVE
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeliverySourceStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliverySourceStatus")
     : delivery_source_status)
    : delivery_source_status)

let delivery_source_status_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESOURCE_DELETED" -> RESOURCE_DELETED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeliverySourceStatusReason" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliverySourceStatusReason")
     : delivery_source_status_reason)
    : delivery_source_status_reason)

let delivery_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reason =
       option_of_yojson
         (value_for_key delivery_source_status_reason_of_yojson "statusReason")
         _list path;
     status = option_of_yojson (value_for_key delivery_source_status_of_yojson "status") _list path;
     delivery_source_configuration =
       option_of_yojson
         (value_for_key delivery_source_configuration_of_yojson "deliverySourceConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     log_type = option_of_yojson (value_for_key log_type_of_yojson "logType") _list path;
     service = option_of_yojson (value_for_key service_of_yojson "service") _list path;
     resource_arns =
       option_of_yojson (value_for_key resource_arns_of_yojson "resourceArns") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key delivery_source_name_of_yojson "name") _list path;
   }
    : delivery_source)

let put_delivery_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_source =
       option_of_yojson (value_for_key delivery_source_of_yojson "deliverySource") _list path;
   }
    : put_delivery_source_response)

let put_delivery_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_source_configuration =
       option_of_yojson
         (value_for_key delivery_source_configuration_of_yojson "deliverySourceConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     log_type = value_for_key log_type_of_yojson "logType" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
     name = value_for_key delivery_source_name_of_yojson "name" _list path;
   }
    : put_delivery_source_request)

let delivery_destination_name_of_yojson = string_of_yojson

let delivery_destination_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "XRAY" -> XRAY
    | `String "FH" -> FH
    | `String "CWL" -> CWL
    | `String "S3" -> S3
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeliveryDestinationType" value)
    | _ -> raise (deserialize_wrong_type_error path "DeliveryDestinationType")
     : delivery_destination_type)
    : delivery_destination_type)

let output_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "parquet" -> PARQUET
    | `String "raw" -> RAW
    | `String "w3c" -> W3C
    | `String "plain" -> PLAIN
    | `String "json" -> JSON
    | `String value -> raise (deserialize_unknown_enum_value_error path "OutputFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "OutputFormat")
     : output_format)
    : output_format)

let delivery_destination_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ destination_resource_arn = value_for_key arn_of_yojson "destinationResourceArn" _list path }
    : delivery_destination_configuration)

let delivery_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     delivery_destination_configuration =
       option_of_yojson
         (value_for_key delivery_destination_configuration_of_yojson
            "deliveryDestinationConfiguration")
         _list path;
     output_format =
       option_of_yojson (value_for_key output_format_of_yojson "outputFormat") _list path;
     delivery_destination_type =
       option_of_yojson
         (value_for_key delivery_destination_type_of_yojson "deliveryDestinationType")
         _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     name = option_of_yojson (value_for_key delivery_destination_name_of_yojson "name") _list path;
   }
    : delivery_destination)

let put_delivery_destination_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_destination =
       option_of_yojson
         (value_for_key delivery_destination_of_yojson "deliveryDestination")
         _list path;
   }
    : put_delivery_destination_response)

let put_delivery_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     delivery_destination_type =
       option_of_yojson
         (value_for_key delivery_destination_type_of_yojson "deliveryDestinationType")
         _list path;
     delivery_destination_configuration =
       option_of_yojson
         (value_for_key delivery_destination_configuration_of_yojson
            "deliveryDestinationConfiguration")
         _list path;
     output_format =
       option_of_yojson (value_for_key output_format_of_yojson "outputFormat") _list path;
     name = value_for_key delivery_destination_name_of_yojson "name" _list path;
   }
    : put_delivery_destination_request)

let delivery_destination_policy_of_yojson = string_of_yojson

let policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_destination_policy =
       option_of_yojson
         (value_for_key delivery_destination_policy_of_yojson "deliveryDestinationPolicy")
         _list path;
   }
    : policy)

let put_delivery_destination_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key policy_of_yojson "policy") _list path }
    : put_delivery_destination_policy_response)

let put_delivery_destination_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_destination_policy =
       value_for_key delivery_destination_policy_of_yojson "deliveryDestinationPolicy" _list path;
     delivery_destination_name =
       value_for_key delivery_destination_name_of_yojson "deliveryDestinationName" _list path;
   }
    : put_delivery_destination_policy_request)

let data_protection_policy_document_of_yojson = string_of_yojson

let put_data_protection_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     policy_document =
       option_of_yojson
         (value_for_key data_protection_policy_document_of_yojson "policyDocument")
         _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
   }
    : put_data_protection_policy_response)

let put_data_protection_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_document =
       value_for_key data_protection_policy_document_of_yojson "policyDocument" _list path;
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : put_data_protection_policy_request)

let bearer_token_authentication_enabled_of_yojson = bool_of_yojson

let put_bearer_token_authentication_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bearer_token_authentication_enabled =
       value_for_key bearer_token_authentication_enabled_of_yojson
         "bearerTokenAuthenticationEnabled" _list path;
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : put_bearer_token_authentication_request)

let account_policy_document_of_yojson = string_of_yojson

let policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "METRIC_EXTRACTION_POLICY" -> METRIC_EXTRACTION_POLICY
    | `String "TRANSFORMER_POLICY" -> TRANSFORMER_POLICY
    | `String "FIELD_INDEX_POLICY" -> FIELD_INDEX_POLICY
    | `String "SUBSCRIPTION_FILTER_POLICY" -> SUBSCRIPTION_FILTER_POLICY
    | `String "DATA_PROTECTION_POLICY" -> DATA_PROTECTION_POLICY
    | `String value -> raise (deserialize_unknown_enum_value_error path "PolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PolicyType")
     : policy_type)
    : policy_type)

let account_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     selection_criteria =
       option_of_yojson (value_for_key selection_criteria_of_yojson "selectionCriteria") _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "scope") _list path;
     policy_type = option_of_yojson (value_for_key policy_type_of_yojson "policyType") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     policy_document =
       option_of_yojson
         (value_for_key account_policy_document_of_yojson "policyDocument")
         _list path;
     policy_name = option_of_yojson (value_for_key policy_name_of_yojson "policyName") _list path;
   }
    : account_policy)

let put_account_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_policy =
       option_of_yojson (value_for_key account_policy_of_yojson "accountPolicy") _list path;
   }
    : put_account_policy_response)

let put_account_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     selection_criteria =
       option_of_yojson (value_for_key selection_criteria_of_yojson "selectionCriteria") _list path;
     scope = option_of_yojson (value_for_key scope_of_yojson "scope") _list path;
     policy_type = value_for_key policy_type_of_yojson "policyType" _list path;
     policy_document = value_for_key account_policy_document_of_yojson "policyDocument" _list path;
     policy_name = value_for_key policy_name_of_yojson "policyName" _list path;
   }
    : put_account_policy_request)

let priority_of_yojson = string_of_yojson
let percentage_of_yojson = int_of_yojson
let dynamic_token_position_of_yojson = int_of_yojson

let enumerations_of_yojson tree path =
  map_of_yojson token_string_of_yojson token_value_of_yojson tree path

let inferred_token_name_of_yojson = string_of_yojson

let pattern_token_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inferred_token_name =
       option_of_yojson (value_for_key inferred_token_name_of_yojson "inferredTokenName") _list path;
     enumerations =
       option_of_yojson (value_for_key enumerations_of_yojson "enumerations") _list path;
     token_string = option_of_yojson (value_for_key token_string_of_yojson "tokenString") _list path;
     is_dynamic = option_of_yojson (value_for_key boolean__of_yojson "isDynamic") _list path;
     dynamic_token_position =
       option_of_yojson
         (value_for_key dynamic_token_position_of_yojson "dynamicTokenPosition")
         _list path;
   }
    : pattern_token)

let pattern_tokens_of_yojson tree path = list_of_yojson pattern_token_of_yojson tree path
let pattern_string_of_yojson = string_of_yojson
let pattern_regex_of_yojson = string_of_yojson

let output_log_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ingestion_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ingestionTime") _list path;
     message = option_of_yojson (value_for_key event_message_of_yojson "message") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "timestamp") _list path;
   }
    : output_log_event)

let output_log_events_of_yojson tree path = list_of_yojson output_log_event_of_yojson tree path
let output_formats_of_yojson tree path = list_of_yojson output_format_of_yojson tree path

let order_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "LastEventTime" -> LastEventTime
    | `String "LogStreamName" -> LogStreamName
    | `String value -> raise (deserialize_unknown_enum_value_error path "OrderBy" value)
    | _ -> raise (deserialize_wrong_type_error path "OrderBy")
     : order_by)
    : order_by)

let open_search_workspace_id_of_yojson = string_of_yojson

let open_search_resource_status_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "ACTIVE" -> ACTIVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpenSearchResourceStatusType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenSearchResourceStatusType")
     : open_search_resource_status_type)
    : open_search_resource_status_type)

let integration_status_message_of_yojson = string_of_yojson

let open_search_resource_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_message =
       option_of_yojson
         (value_for_key integration_status_message_of_yojson "statusMessage")
         _list path;
     status =
       option_of_yojson
         (value_for_key open_search_resource_status_type_of_yojson "status")
         _list path;
   }
    : open_search_resource_status)

let open_search_workspace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key open_search_resource_status_of_yojson "status") _list path;
     workspace_id =
       option_of_yojson (value_for_key open_search_workspace_id_of_yojson "workspaceId") _list path;
   }
    : open_search_workspace)

let open_search_policy_name_of_yojson = string_of_yojson

let open_search_network_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key open_search_resource_status_of_yojson "status") _list path;
     policy_name =
       option_of_yojson (value_for_key open_search_policy_name_of_yojson "policyName") _list path;
   }
    : open_search_network_policy)

let open_search_lifecycle_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key open_search_resource_status_of_yojson "status") _list path;
     policy_name =
       option_of_yojson (value_for_key open_search_policy_name_of_yojson "policyName") _list path;
   }
    : open_search_lifecycle_policy)

let open_search_data_source_name_of_yojson = string_of_yojson

let open_search_data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key open_search_resource_status_of_yojson "status") _list path;
     data_source_name =
       option_of_yojson
         (value_for_key open_search_data_source_name_of_yojson "dataSourceName")
         _list path;
   }
    : open_search_data_source)

let open_search_application_endpoint_of_yojson = string_of_yojson
let open_search_application_id_of_yojson = string_of_yojson

let open_search_application_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key open_search_resource_status_of_yojson "status") _list path;
     application_id =
       option_of_yojson
         (value_for_key open_search_application_id_of_yojson "applicationId")
         _list path;
     application_arn = option_of_yojson (value_for_key arn_of_yojson "applicationArn") _list path;
     application_endpoint =
       option_of_yojson
         (value_for_key open_search_application_endpoint_of_yojson "applicationEndpoint")
         _list path;
   }
    : open_search_application)

let open_search_collection_endpoint_of_yojson = string_of_yojson

let open_search_collection_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key open_search_resource_status_of_yojson "status") _list path;
     collection_arn = option_of_yojson (value_for_key arn_of_yojson "collectionArn") _list path;
     collection_endpoint =
       option_of_yojson
         (value_for_key open_search_collection_endpoint_of_yojson "collectionEndpoint")
         _list path;
   }
    : open_search_collection)

let open_search_encryption_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key open_search_resource_status_of_yojson "status") _list path;
     policy_name =
       option_of_yojson (value_for_key open_search_policy_name_of_yojson "policyName") _list path;
   }
    : open_search_encryption_policy)

let open_search_data_access_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key open_search_resource_status_of_yojson "status") _list path;
     policy_name =
       option_of_yojson (value_for_key open_search_policy_name_of_yojson "policyName") _list path;
   }
    : open_search_data_access_policy)

let open_search_integration_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle_policy =
       option_of_yojson
         (value_for_key open_search_lifecycle_policy_of_yojson "lifecyclePolicy")
         _list path;
     access_policy =
       option_of_yojson
         (value_for_key open_search_data_access_policy_of_yojson "accessPolicy")
         _list path;
     network_policy =
       option_of_yojson
         (value_for_key open_search_network_policy_of_yojson "networkPolicy")
         _list path;
     encryption_policy =
       option_of_yojson
         (value_for_key open_search_encryption_policy_of_yojson "encryptionPolicy")
         _list path;
     workspace =
       option_of_yojson (value_for_key open_search_workspace_of_yojson "workspace") _list path;
     collection =
       option_of_yojson (value_for_key open_search_collection_of_yojson "collection") _list path;
     application =
       option_of_yojson (value_for_key open_search_application_of_yojson "application") _list path;
     data_source =
       option_of_yojson (value_for_key open_search_data_source_of_yojson "dataSource") _list path;
   }
    : open_search_integration_details)

let next_token_of_yojson = string_of_yojson

let metric_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     emit_system_field_dimensions =
       option_of_yojson
         (value_for_key emit_system_fields_of_yojson "emitSystemFieldDimensions")
         _list path;
     field_selection_criteria =
       option_of_yojson
         (value_for_key field_selection_criteria_of_yojson "fieldSelectionCriteria")
         _list path;
     apply_on_transformed_logs =
       option_of_yojson
         (value_for_key apply_on_transformed_logs_of_yojson "applyOnTransformedLogs")
         _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     metric_transformations =
       option_of_yojson
         (value_for_key metric_transformations_of_yojson "metricTransformations")
         _list path;
     filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "filterPattern") _list path;
     filter_name = option_of_yojson (value_for_key filter_name_of_yojson "filterName") _list path;
   }
    : metric_filter)

let metric_filters_of_yojson tree path = list_of_yojson metric_filter_of_yojson tree path
let lookup_table_name_of_yojson = string_of_yojson

let lookup_table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     size_bytes = option_of_yojson (value_for_key stored_bytes_of_yojson "sizeBytes") _list path;
     records_count =
       option_of_yojson (value_for_key records_count_of_yojson "recordsCount") _list path;
     table_fields = option_of_yojson (value_for_key table_fields_of_yojson "tableFields") _list path;
     description =
       option_of_yojson (value_for_key lookup_table_description_of_yojson "description") _list path;
     lookup_table_name =
       option_of_yojson (value_for_key lookup_table_name_of_yojson "lookupTableName") _list path;
     lookup_table_arn = option_of_yojson (value_for_key arn_of_yojson "lookupTableArn") _list path;
   }
    : lookup_table)

let lookup_tables_of_yojson tree path = list_of_yojson lookup_table_of_yojson tree path

let list_tags_log_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path }
    : list_tags_log_group_response)

let list_tags_log_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path }
    : list_tags_log_group_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_name_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let list_syslog_configurations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     syslog_configurations =
       option_of_yojson
         (value_for_key syslog_configurations_of_yojson "syslogConfigurations")
         _list path;
   }
    : list_syslog_configurations_response)

let list_syslog_configurations_max_results_of_yojson = int_of_yojson

let list_syslog_configurations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_syslog_configurations_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "vpcEndpointId") _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
   }
    : list_syslog_configurations_request)

let list_sources_for_s3_table_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     sources =
       option_of_yojson (value_for_key s3_table_integration_sources_of_yojson "sources") _list path;
   }
    : list_sources_for_s3_table_integration_response)

let list_sources_for_s3_table_integration_max_results_of_yojson = int_of_yojson

let list_sources_for_s3_table_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_sources_for_s3_table_integration_max_results_of_yojson "maxResults")
         _list path;
     integration_arn = value_for_key arn_of_yojson "integrationArn" _list path;
   }
    : list_sources_for_s3_table_integration_request)

let list_scheduled_queries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_queries =
       option_of_yojson
         (value_for_key scheduled_query_summary_list_of_yojson "scheduledQueries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_scheduled_queries_response)

let list_scheduled_queries_max_results_of_yojson = int_of_yojson

let list_scheduled_queries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schedule_type =
       option_of_yojson (value_for_key schedule_type_of_yojson "scheduleType") _list path;
     state = option_of_yojson (value_for_key scheduled_query_state_of_yojson "state") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_scheduled_queries_max_results_of_yojson "maxResults")
         _list path;
   }
    : list_scheduled_queries_request)

let list_log_groups_for_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     log_group_identifiers =
       option_of_yojson
         (value_for_key log_group_identifiers_of_yojson "logGroupIdentifiers")
         _list path;
   }
    : list_log_groups_for_query_response)

let list_log_groups_for_query_max_results_of_yojson = int_of_yojson

let list_log_groups_for_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_log_groups_for_query_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     query_id = value_for_key query_id_of_yojson "queryId" _list path;
   }
    : list_log_groups_for_query_request)

let log_group_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELIVERY" -> DELIVERY
    | `String "INFREQUENT_ACCESS" -> INFREQUENT_ACCESS
    | `String "STANDARD" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogGroupClass" value)
    | _ -> raise (deserialize_wrong_type_error path "LogGroupClass")
     : log_group_class)
    : log_group_class)

let log_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_class =
       option_of_yojson (value_for_key log_group_class_of_yojson "logGroupClass") _list path;
     log_group_arn = option_of_yojson (value_for_key arn_of_yojson "logGroupArn") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : log_group_summary)

let log_group_summaries_of_yojson tree path = list_of_yojson log_group_summary_of_yojson tree path

let list_log_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     log_groups =
       option_of_yojson (value_for_key log_group_summaries_of_yojson "logGroups") _list path;
   }
    : list_log_groups_response)

let log_group_name_regex_pattern_of_yojson = string_of_yojson
let include_linked_accounts_of_yojson = bool_of_yojson
let account_ids_of_yojson tree path = list_of_yojson account_id_of_yojson tree path
let list_limit_of_yojson = int_of_yojson

let data_source_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key data_source_type_of_yojson "type") _list path;
     name = value_for_key data_source_name_of_yojson "name" _list path;
   }
    : data_source_filter)

let data_source_filters_of_yojson tree path = list_of_yojson data_source_filter_of_yojson tree path
let field_index_name_of_yojson = string_of_yojson
let field_index_names_of_yojson tree path = list_of_yojson field_index_name_of_yojson tree path

let list_log_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_tags =
       option_of_yojson (value_for_key tag_filters_of_yojson "logGroupTags") _list path;
     field_index_names =
       option_of_yojson (value_for_key field_index_names_of_yojson "fieldIndexNames") _list path;
     data_sources =
       option_of_yojson (value_for_key data_source_filters_of_yojson "dataSources") _list path;
     limit = option_of_yojson (value_for_key list_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     account_identifiers =
       option_of_yojson (value_for_key account_ids_of_yojson "accountIdentifiers") _list path;
     include_linked_accounts =
       option_of_yojson
         (value_for_key include_linked_accounts_of_yojson "includeLinkedAccounts")
         _list path;
     log_group_class =
       option_of_yojson (value_for_key log_group_class_of_yojson "logGroupClass") _list path;
     log_group_name_pattern =
       option_of_yojson
         (value_for_key log_group_name_regex_pattern_of_yojson "logGroupNamePattern")
         _list path;
   }
    : list_log_groups_request)

let detector_name_of_yojson = string_of_yojson
let log_group_arn_list_of_yojson tree path = list_of_yojson log_group_arn_of_yojson tree path

let anomaly_detector_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PAUSED" -> PAUSED
    | `String "DELETED" -> DELETED
    | `String "FAILED" -> FAILED
    | `String "ANALYZING" -> ANALYZING
    | `String "TRAINING" -> TRAINING
    | `String "INITIALIZING" -> INITIALIZING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AnomalyDetectorStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AnomalyDetectorStatus")
     : anomaly_detector_status)
    : anomaly_detector_status)

let epoch_millis_of_yojson = long_of_yojson

let anomaly_detector_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_visibility_time =
       option_of_yojson
         (value_for_key anomaly_visibility_time_of_yojson "anomalyVisibilityTime")
         _list path;
     last_modified_time_stamp =
       option_of_yojson (value_for_key epoch_millis_of_yojson "lastModifiedTimeStamp") _list path;
     creation_time_stamp =
       option_of_yojson (value_for_key epoch_millis_of_yojson "creationTimeStamp") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     anomaly_detector_status =
       option_of_yojson
         (value_for_key anomaly_detector_status_of_yojson "anomalyDetectorStatus")
         _list path;
     filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "filterPattern") _list path;
     evaluation_frequency =
       option_of_yojson
         (value_for_key evaluation_frequency_of_yojson "evaluationFrequency")
         _list path;
     log_group_arn_list =
       option_of_yojson (value_for_key log_group_arn_list_of_yojson "logGroupArnList") _list path;
     detector_name =
       option_of_yojson (value_for_key detector_name_of_yojson "detectorName") _list path;
     anomaly_detector_arn =
       option_of_yojson
         (value_for_key anomaly_detector_arn_of_yojson "anomalyDetectorArn")
         _list path;
   }
    : anomaly_detector)

let anomaly_detectors_of_yojson tree path = list_of_yojson anomaly_detector_of_yojson tree path

let list_log_anomaly_detectors_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     anomaly_detectors =
       option_of_yojson (value_for_key anomaly_detectors_of_yojson "anomalyDetectors") _list path;
   }
    : list_log_anomaly_detectors_response)

let list_log_anomaly_detectors_limit_of_yojson = int_of_yojson

let list_log_anomaly_detectors_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     limit =
       option_of_yojson
         (value_for_key list_log_anomaly_detectors_limit_of_yojson "limit")
         _list path;
     filter_log_group_arn =
       option_of_yojson (value_for_key log_group_arn_of_yojson "filterLogGroupArn") _list path;
   }
    : list_log_anomaly_detectors_request)

let integration_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_status =
       option_of_yojson (value_for_key integration_status_of_yojson "integrationStatus") _list path;
     integration_type =
       option_of_yojson (value_for_key integration_type_of_yojson "integrationType") _list path;
     integration_name =
       option_of_yojson (value_for_key integration_name_of_yojson "integrationName") _list path;
   }
    : integration_summary)

let integration_summaries_of_yojson tree path =
  list_of_yojson integration_summary_of_yojson tree path

let list_integrations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_summaries =
       option_of_yojson
         (value_for_key integration_summaries_of_yojson "integrationSummaries")
         _list path;
   }
    : list_integrations_response)

let integration_name_prefix_of_yojson = string_of_yojson

let list_integrations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_status =
       option_of_yojson (value_for_key integration_status_of_yojson "integrationStatus") _list path;
     integration_type =
       option_of_yojson (value_for_key integration_type_of_yojson "integrationType") _list path;
     integration_name_prefix =
       option_of_yojson
         (value_for_key integration_name_prefix_of_yojson "integrationNamePrefix")
         _list path;
   }
    : list_integrations_request)

let description_of_yojson = string_of_yojson
let count_of_yojson = long_of_yojson
let histogram_of_yojson tree path = map_of_yojson time_of_yojson count_of_yojson tree path

let log_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key event_message_of_yojson "message") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "timestamp") _list path;
   }
    : log_event)

let log_samples_of_yojson tree path = list_of_yojson log_event_of_yojson tree path

let anomaly_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_pattern_level_suppression =
       option_of_yojson (value_for_key boolean__of_yojson "isPatternLevelSuppression") _list path;
     suppressed_until =
       option_of_yojson (value_for_key epoch_millis_of_yojson "suppressedUntil") _list path;
     suppressed_date =
       option_of_yojson (value_for_key epoch_millis_of_yojson "suppressedDate") _list path;
     suppressed = option_of_yojson (value_for_key boolean__of_yojson "suppressed") _list path;
     log_group_arn_list = value_for_key log_group_arn_list_of_yojson "logGroupArnList" _list path;
     pattern_tokens = value_for_key pattern_tokens_of_yojson "patternTokens" _list path;
     log_samples = value_for_key log_samples_of_yojson "logSamples" _list path;
     histogram = value_for_key histogram_of_yojson "histogram" _list path;
     state = value_for_key state_of_yojson "state" _list path;
     active = value_for_key boolean__of_yojson "active" _list path;
     description = value_for_key description_of_yojson "description" _list path;
     last_seen = value_for_key epoch_millis_of_yojson "lastSeen" _list path;
     first_seen = value_for_key epoch_millis_of_yojson "firstSeen" _list path;
     priority = option_of_yojson (value_for_key priority_of_yojson "priority") _list path;
     pattern_regex =
       option_of_yojson (value_for_key pattern_regex_of_yojson "patternRegex") _list path;
     pattern_string = value_for_key pattern_string_of_yojson "patternString" _list path;
     anomaly_detector_arn =
       value_for_key anomaly_detector_arn_of_yojson "anomalyDetectorArn" _list path;
     pattern_id = value_for_key pattern_id_of_yojson "patternId" _list path;
     anomaly_id = value_for_key anomaly_id_of_yojson "anomalyId" _list path;
   }
    : anomaly)

let anomalies_of_yojson tree path = list_of_yojson anomaly_of_yojson tree path

let list_anomalies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     anomalies = option_of_yojson (value_for_key anomalies_of_yojson "anomalies") _list path;
   }
    : list_anomalies_response)

let list_anomalies_limit_of_yojson = int_of_yojson

let list_anomalies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     limit = option_of_yojson (value_for_key list_anomalies_limit_of_yojson "limit") _list path;
     suppression_state =
       option_of_yojson (value_for_key suppression_state_of_yojson "suppressionState") _list path;
     anomaly_detector_arn =
       option_of_yojson
         (value_for_key anomaly_detector_arn_of_yojson "anomalyDetectorArn")
         _list path;
   }
    : list_anomalies_request)

let log_group_count_of_yojson = int_of_yojson
let grouping_identifier_key_of_yojson = string_of_yojson
let grouping_identifier_value_of_yojson = string_of_yojson

let grouping_identifier_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key grouping_identifier_value_of_yojson "value") _list path;
     key = option_of_yojson (value_for_key grouping_identifier_key_of_yojson "key") _list path;
   }
    : grouping_identifier)

let grouping_identifiers_of_yojson tree path =
  list_of_yojson grouping_identifier_of_yojson tree path

let aggregate_log_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     grouping_identifiers =
       option_of_yojson
         (value_for_key grouping_identifiers_of_yojson "groupingIdentifiers")
         _list path;
     log_group_count =
       option_of_yojson (value_for_key log_group_count_of_yojson "logGroupCount") _list path;
   }
    : aggregate_log_group_summary)

let aggregate_log_group_summaries_of_yojson tree path =
  list_of_yojson aggregate_log_group_summary_of_yojson tree path

let list_aggregate_log_group_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     aggregate_log_group_summaries =
       option_of_yojson
         (value_for_key aggregate_log_group_summaries_of_yojson "aggregateLogGroupSummaries")
         _list path;
   }
    : list_aggregate_log_group_summaries_response)

let list_aggregate_log_group_summaries_group_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "DATA_SOURCE_NAME_AND_TYPE" -> DATA_SOURCE_NAME_AND_TYPE
    | `String "DATA_SOURCE_NAME_TYPE_AND_FORMAT" -> DATA_SOURCE_NAME_TYPE_AND_FORMAT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ListAggregateLogGroupSummariesGroupBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ListAggregateLogGroupSummariesGroupBy")
     : list_aggregate_log_group_summaries_group_by)
    : list_aggregate_log_group_summaries_group_by)

let list_log_groups_request_limit_of_yojson = int_of_yojson

let list_aggregate_log_group_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit =
       option_of_yojson (value_for_key list_log_groups_request_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     group_by =
       value_for_key list_aggregate_log_group_summaries_group_by_of_yojson "groupBy" _list path;
     data_sources =
       option_of_yojson (value_for_key data_source_filters_of_yojson "dataSources") _list path;
     log_group_name_pattern =
       option_of_yojson
         (value_for_key log_group_name_regex_pattern_of_yojson "logGroupNamePattern")
         _list path;
     log_group_class =
       option_of_yojson (value_for_key log_group_class_of_yojson "logGroupClass") _list path;
     include_linked_accounts =
       option_of_yojson
         (value_for_key include_linked_accounts_of_yojson "includeLinkedAccounts")
         _list path;
     account_identifiers =
       option_of_yojson (value_for_key account_ids_of_yojson "accountIdentifiers") _list path;
   }
    : list_aggregate_log_group_summaries_request)

let get_transformer_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     transformer_config =
       option_of_yojson (value_for_key processors_of_yojson "transformerConfig") _list path;
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
   }
    : get_transformer_response)

let get_transformer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : get_transformer_request)

let get_scheduled_query_history_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     trigger_history =
       option_of_yojson
         (value_for_key trigger_history_record_list_of_yojson "triggerHistory")
         _list path;
     scheduled_query_arn =
       option_of_yojson (value_for_key arn_of_yojson "scheduledQueryArn") _list path;
     name = option_of_yojson (value_for_key scheduled_query_name_of_yojson "name") _list path;
   }
    : get_scheduled_query_history_response)

let execution_status_list_of_yojson tree path = list_of_yojson execution_status_of_yojson tree path
let get_scheduled_query_history_max_results_of_yojson = int_of_yojson

let get_scheduled_query_history_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key get_scheduled_query_history_max_results_of_yojson "maxResults")
         _list path;
     execution_statuses =
       option_of_yojson
         (value_for_key execution_status_list_of_yojson "executionStatuses")
         _list path;
     end_time = value_for_key timestamp_of_yojson "endTime" _list path;
     start_time = value_for_key timestamp_of_yojson "startTime" _list path;
     identifier = value_for_key scheduled_query_identifier_of_yojson "identifier" _list path;
   }
    : get_scheduled_query_history_request)

let get_scheduled_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     execution_role_arn =
       option_of_yojson (value_for_key role_arn_of_yojson "executionRoleArn") _list path;
     schedule_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "scheduleEndTime") _list path;
     schedule_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "scheduleStartTime") _list path;
     last_execution_status =
       option_of_yojson (value_for_key execution_status_of_yojson "lastExecutionStatus") _list path;
     last_triggered_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastTriggeredTime") _list path;
     schedule_type =
       option_of_yojson (value_for_key schedule_type_of_yojson "scheduleType") _list path;
     state = option_of_yojson (value_for_key scheduled_query_state_of_yojson "state") _list path;
     destination_configuration =
       option_of_yojson
         (value_for_key destination_configuration_of_yojson "destinationConfiguration")
         _list path;
     end_time_offset =
       option_of_yojson (value_for_key end_time_offset_of_yojson "endTimeOffset") _list path;
     start_time_offset =
       option_of_yojson (value_for_key start_time_offset_of_yojson "startTimeOffset") _list path;
     timezone = option_of_yojson (value_for_key schedule_timezone_of_yojson "timezone") _list path;
     schedule_expression =
       option_of_yojson
         (value_for_key schedule_expression_of_yojson "scheduleExpression")
         _list path;
     log_group_identifiers =
       option_of_yojson
         (value_for_key scheduled_query_log_group_identifiers_of_yojson "logGroupIdentifiers")
         _list path;
     query_string = option_of_yojson (value_for_key query_string_of_yojson "queryString") _list path;
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
     description =
       option_of_yojson
         (value_for_key scheduled_query_description_of_yojson "description")
         _list path;
     name = option_of_yojson (value_for_key scheduled_query_name_of_yojson "name") _list path;
     scheduled_query_arn =
       option_of_yojson (value_for_key arn_of_yojson "scheduledQueryArn") _list path;
   }
    : get_scheduled_query_response)

let get_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key scheduled_query_identifier_of_yojson "identifier" _list path }
    : get_scheduled_query_request)

let encryption_key_of_yojson = string_of_yojson
let get_query_results_next_token_of_yojson = string_of_yojson

let get_query_results_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       option_of_yojson
         (value_for_key get_query_results_next_token_of_yojson "nextToken")
         _list path;
     encryption_key =
       option_of_yojson (value_for_key encryption_key_of_yojson "encryptionKey") _list path;
     status = option_of_yojson (value_for_key query_status_of_yojson "status") _list path;
     statistics =
       option_of_yojson (value_for_key query_statistics_of_yojson "statistics") _list path;
     results = option_of_yojson (value_for_key query_results_of_yojson "results") _list path;
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
   }
    : get_query_results_response)

let get_query_results_max_items_of_yojson = int_of_yojson

let get_query_results_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_items =
       option_of_yojson (value_for_key get_query_results_max_items_of_yojson "maxItems") _list path;
     next_token =
       option_of_yojson
         (value_for_key get_query_results_next_token_of_yojson "nextToken")
         _list path;
     query_id = value_for_key query_id_of_yojson "queryId" _list path;
   }
    : get_query_results_request)

let get_lookup_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     size_bytes = option_of_yojson (value_for_key stored_bytes_of_yojson "sizeBytes") _list path;
     table_body = option_of_yojson (value_for_key table_body_of_yojson "tableBody") _list path;
     description =
       option_of_yojson (value_for_key lookup_table_description_of_yojson "description") _list path;
     lookup_table_name =
       option_of_yojson (value_for_key lookup_table_name_of_yojson "lookupTableName") _list path;
     lookup_table_arn = option_of_yojson (value_for_key arn_of_yojson "lookupTableArn") _list path;
   }
    : get_lookup_table_response)

let get_lookup_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ lookup_table_arn = value_for_key arn_of_yojson "lookupTableArn" _list path }
    : get_lookup_table_request)

let log_record_of_yojson tree path = map_of_yojson field_of_yojson value_of_yojson tree path

let get_log_record_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ log_record = option_of_yojson (value_for_key log_record_of_yojson "logRecord") _list path }
    : get_log_record_response)

let log_record_pointer_of_yojson = string_of_yojson

let get_log_record_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unmask = option_of_yojson (value_for_key unmask_of_yojson "unmask") _list path;
     log_record_pointer = value_for_key log_record_pointer_of_yojson "logRecordPointer" _list path;
   }
    : get_log_record_request)

let data_of_yojson = blob_of_yojson

let fields_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ data = option_of_yojson (value_for_key data_of_yojson "data") _list path } : fields_data)

let internal_streaming_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key message_of_yojson "message") _list path }
    : internal_streaming_exception)

let get_log_object_response_stream_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "InternalStreamingException" ->
       InternalStreamingException (internal_streaming_exception_of_yojson value_ path)
   | "fields" -> Fields (fields_data_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "GetLogObjectResponseStream" unknown)
    : get_log_object_response_stream)

let get_log_object_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_stream =
       option_of_yojson
         (value_for_key get_log_object_response_stream_of_yojson "fieldStream")
         _list path;
   }
    : get_log_object_response)

let log_object_pointer_of_yojson = string_of_yojson

let get_log_object_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_object_pointer = value_for_key log_object_pointer_of_yojson "logObjectPointer" _list path;
     unmask = option_of_yojson (value_for_key unmask_of_yojson "unmask") _list path;
   }
    : get_log_object_request)

let log_group_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     percent = option_of_yojson (value_for_key percentage_of_yojson "percent") _list path;
     name = option_of_yojson (value_for_key field_of_yojson "name") _list path;
   }
    : log_group_field)

let log_group_field_list_of_yojson tree path = list_of_yojson log_group_field_of_yojson tree path

let get_log_group_fields_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_fields =
       option_of_yojson (value_for_key log_group_field_list_of_yojson "logGroupFields") _list path;
   }
    : get_log_group_fields_response)

let get_log_group_fields_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
     time = option_of_yojson (value_for_key timestamp_of_yojson "time") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : get_log_group_fields_request)

let log_field_name_of_yojson = string_of_yojson
let data_type_of_yojson = string_of_yojson

let rec log_field_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields = option_of_yojson (value_for_key log_fields_list_of_yojson "fields") _list path;
     element = option_of_yojson (value_for_key log_field_type_of_yojson "element") _list path;
     type_ = option_of_yojson (value_for_key data_type_of_yojson "type") _list path;
   }
    : log_field_type)

and log_fields_list_of_yojson tree path = list_of_yojson log_fields_list_item_of_yojson tree path

and log_fields_list_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_field_type =
       option_of_yojson (value_for_key log_field_type_of_yojson "logFieldType") _list path;
     log_field_name =
       option_of_yojson (value_for_key log_field_name_of_yojson "logFieldName") _list path;
   }
    : log_fields_list_item)

let get_log_fields_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_fields = option_of_yojson (value_for_key log_fields_list_of_yojson "logFields") _list path;
   }
    : get_log_fields_response)

let get_log_fields_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source_type = value_for_key data_source_type_of_yojson "dataSourceType" _list path;
     data_source_name = value_for_key data_source_name_of_yojson "dataSourceName" _list path;
   }
    : get_log_fields_request)

let get_log_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_backward_token =
       option_of_yojson (value_for_key next_token_of_yojson "nextBackwardToken") _list path;
     next_forward_token =
       option_of_yojson (value_for_key next_token_of_yojson "nextForwardToken") _list path;
     events = option_of_yojson (value_for_key output_log_events_of_yojson "events") _list path;
   }
    : get_log_events_response)

let events_limit_of_yojson = int_of_yojson

let get_log_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unmask = option_of_yojson (value_for_key unmask_of_yojson "unmask") _list path;
     start_from_head =
       option_of_yojson (value_for_key start_from_head_of_yojson "startFromHead") _list path;
     limit = option_of_yojson (value_for_key events_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     log_stream_name = value_for_key log_stream_name_of_yojson "logStreamName" _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : get_log_events_request)

let get_log_anomaly_detector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_visibility_time =
       option_of_yojson
         (value_for_key anomaly_visibility_time_of_yojson "anomalyVisibilityTime")
         _list path;
     last_modified_time_stamp =
       option_of_yojson (value_for_key epoch_millis_of_yojson "lastModifiedTimeStamp") _list path;
     creation_time_stamp =
       option_of_yojson (value_for_key epoch_millis_of_yojson "creationTimeStamp") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     anomaly_detector_status =
       option_of_yojson
         (value_for_key anomaly_detector_status_of_yojson "anomalyDetectorStatus")
         _list path;
     filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "filterPattern") _list path;
     evaluation_frequency =
       option_of_yojson
         (value_for_key evaluation_frequency_of_yojson "evaluationFrequency")
         _list path;
     log_group_arn_list =
       option_of_yojson (value_for_key log_group_arn_list_of_yojson "logGroupArnList") _list path;
     detector_name =
       option_of_yojson (value_for_key detector_name_of_yojson "detectorName") _list path;
   }
    : get_log_anomaly_detector_response)

let get_log_anomaly_detector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_detector_arn =
       value_for_key anomaly_detector_arn_of_yojson "anomalyDetectorArn" _list path;
   }
    : get_log_anomaly_detector_request)

let integration_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "openSearchIntegrationDetails" ->
       OpenSearchIntegrationDetails (open_search_integration_details_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "IntegrationDetails" unknown)
    : integration_details)

let get_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integration_details =
       option_of_yojson
         (value_for_key integration_details_of_yojson "integrationDetails")
         _list path;
     integration_status =
       option_of_yojson (value_for_key integration_status_of_yojson "integrationStatus") _list path;
     integration_type =
       option_of_yojson (value_for_key integration_type_of_yojson "integrationType") _list path;
     integration_name =
       option_of_yojson (value_for_key integration_name_of_yojson "integrationName") _list path;
   }
    : get_integration_response)

let get_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ integration_name = value_for_key integration_name_of_yojson "integrationName" _list path }
    : get_integration_request)

let get_delivery_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_source =
       option_of_yojson (value_for_key delivery_source_of_yojson "deliverySource") _list path;
   }
    : get_delivery_source_response)

let get_delivery_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key delivery_source_name_of_yojson "name" _list path }
    : get_delivery_source_request)

let get_delivery_destination_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ policy = option_of_yojson (value_for_key policy_of_yojson "policy") _list path }
    : get_delivery_destination_policy_response)

let get_delivery_destination_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_destination_name =
       value_for_key delivery_destination_name_of_yojson "deliveryDestinationName" _list path;
   }
    : get_delivery_destination_policy_request)

let get_delivery_destination_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_destination =
       option_of_yojson
         (value_for_key delivery_destination_of_yojson "deliveryDestination")
         _list path;
   }
    : get_delivery_destination_response)

let get_delivery_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key delivery_destination_name_of_yojson "name" _list path }
    : get_delivery_destination_request)

let delivery_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     s3_delivery_configuration =
       option_of_yojson
         (value_for_key s3_delivery_configuration_of_yojson "s3DeliveryConfiguration")
         _list path;
     field_delimiter =
       option_of_yojson (value_for_key field_delimiter_of_yojson "fieldDelimiter") _list path;
     record_fields =
       option_of_yojson (value_for_key record_fields_of_yojson "recordFields") _list path;
     delivery_destination_type =
       option_of_yojson
         (value_for_key delivery_destination_type_of_yojson "deliveryDestinationType")
         _list path;
     delivery_destination_arn =
       option_of_yojson (value_for_key arn_of_yojson "deliveryDestinationArn") _list path;
     delivery_source_name =
       option_of_yojson
         (value_for_key delivery_source_name_of_yojson "deliverySourceName")
         _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     id = option_of_yojson (value_for_key delivery_id_of_yojson "id") _list path;
   }
    : delivery)

let get_delivery_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ delivery = option_of_yojson (value_for_key delivery_of_yojson "delivery") _list path }
    : get_delivery_response)

let get_delivery_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key delivery_id_of_yojson "id" _list path } : get_delivery_request)

let get_data_protection_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     policy_document =
       option_of_yojson
         (value_for_key data_protection_policy_document_of_yojson "policyDocument")
         _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
   }
    : get_data_protection_policy_response)

let get_data_protection_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : get_data_protection_policy_request)

let event_id_of_yojson = string_of_yojson

let filtered_log_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_id = option_of_yojson (value_for_key event_id_of_yojson "eventId") _list path;
     ingestion_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ingestionTime") _list path;
     message = option_of_yojson (value_for_key event_message_of_yojson "message") _list path;
     timestamp = option_of_yojson (value_for_key timestamp_of_yojson "timestamp") _list path;
     log_stream_name =
       option_of_yojson (value_for_key log_stream_name_of_yojson "logStreamName") _list path;
   }
    : filtered_log_event)

let filtered_log_events_of_yojson tree path = list_of_yojson filtered_log_event_of_yojson tree path

let filter_log_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     searched_log_streams =
       option_of_yojson
         (value_for_key searched_log_streams_of_yojson "searchedLogStreams")
         _list path;
     events = option_of_yojson (value_for_key filtered_log_events_of_yojson "events") _list path;
   }
    : filter_log_events_response)

let interleaved_of_yojson = bool_of_yojson

let filter_log_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unmask = option_of_yojson (value_for_key unmask_of_yojson "unmask") _list path;
     interleaved = option_of_yojson (value_for_key interleaved_of_yojson "interleaved") _list path;
     start_from_head =
       option_of_yojson (value_for_key start_from_head_of_yojson "startFromHead") _list path;
     limit = option_of_yojson (value_for_key events_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "filterPattern") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "endTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "startTime") _list path;
     log_stream_name_prefix =
       option_of_yojson (value_for_key log_stream_name_of_yojson "logStreamNamePrefix") _list path;
     log_stream_names =
       option_of_yojson (value_for_key input_log_stream_names_of_yojson "logStreamNames") _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : filter_log_events_request)

let disassociate_source_from_s3_table_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier =
       option_of_yojson
         (value_for_key s3_table_integration_source_identifier_of_yojson "identifier")
         _list path;
   }
    : disassociate_source_from_s3_table_integration_response)

let disassociate_source_from_s3_table_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier =
       value_for_key s3_table_integration_source_identifier_of_yojson "identifier" _list path;
   }
    : disassociate_source_from_s3_table_integration_request)

let disassociate_kms_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_identifier =
       option_of_yojson
         (value_for_key resource_identifier_of_yojson "resourceIdentifier")
         _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : disassociate_kms_key_request)

let describe_subscription_filters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     subscription_filters =
       option_of_yojson
         (value_for_key subscription_filters_of_yojson "subscriptionFilters")
         _list path;
   }
    : describe_subscription_filters_response)

let describe_limit_of_yojson = int_of_yojson

let describe_subscription_filters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     filter_name_prefix =
       option_of_yojson (value_for_key filter_name_of_yojson "filterNamePrefix") _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : describe_subscription_filters_request)

let describe_resource_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     resource_policies =
       option_of_yojson (value_for_key resource_policies_of_yojson "resourcePolicies") _list path;
   }
    : describe_resource_policies_response)

let describe_resource_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_scope = option_of_yojson (value_for_key policy_scope_of_yojson "policyScope") _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "resourceArn") _list path;
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_resource_policies_request)

let describe_query_definitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     query_definitions =
       option_of_yojson
         (value_for_key query_definition_list_of_yojson "queryDefinitions")
         _list path;
   }
    : describe_query_definitions_response)

let describe_query_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key query_list_max_results_of_yojson "maxResults") _list path;
     query_definition_name_prefix =
       option_of_yojson
         (value_for_key query_definition_name_of_yojson "queryDefinitionNamePrefix")
         _list path;
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
   }
    : describe_query_definitions_request)

let describe_queries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     queries = option_of_yojson (value_for_key query_info_list_of_yojson "queries") _list path;
   }
    : describe_queries_response)

let describe_queries_max_results_of_yojson = int_of_yojson

let describe_queries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_language =
       option_of_yojson (value_for_key query_language_of_yojson "queryLanguage") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key describe_queries_max_results_of_yojson "maxResults")
         _list path;
     status = option_of_yojson (value_for_key query_status_of_yojson "status") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : describe_queries_request)

let describe_metric_filters_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     metric_filters =
       option_of_yojson (value_for_key metric_filters_of_yojson "metricFilters") _list path;
   }
    : describe_metric_filters_response)

let describe_metric_filters_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     metric_namespace =
       option_of_yojson (value_for_key metric_namespace_of_yojson "metricNamespace") _list path;
     metric_name = option_of_yojson (value_for_key metric_name_of_yojson "metricName") _list path;
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     filter_name_prefix =
       option_of_yojson (value_for_key filter_name_of_yojson "filterNamePrefix") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : describe_metric_filters_request)

let describe_lookup_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     lookup_tables =
       option_of_yojson (value_for_key lookup_tables_of_yojson "lookupTables") _list path;
   }
    : describe_lookup_tables_response)

let describe_lookup_tables_max_results_of_yojson = int_of_yojson

let describe_lookup_tables_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key describe_lookup_tables_max_results_of_yojson "maxResults")
         _list path;
     lookup_table_name_prefix =
       option_of_yojson
         (value_for_key lookup_table_name_of_yojson "lookupTableNamePrefix")
         _list path;
   }
    : describe_lookup_tables_request)

let log_stream_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stored_bytes = option_of_yojson (value_for_key stored_bytes_of_yojson "storedBytes") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     upload_sequence_token =
       option_of_yojson (value_for_key sequence_token_of_yojson "uploadSequenceToken") _list path;
     last_ingestion_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastIngestionTime") _list path;
     last_event_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "lastEventTimestamp") _list path;
     first_event_timestamp =
       option_of_yojson (value_for_key timestamp_of_yojson "firstEventTimestamp") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     log_stream_name =
       option_of_yojson (value_for_key log_stream_name_of_yojson "logStreamName") _list path;
   }
    : log_stream)

let log_streams_of_yojson tree path = list_of_yojson log_stream_of_yojson tree path

let describe_log_streams_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     log_streams = option_of_yojson (value_for_key log_streams_of_yojson "logStreams") _list path;
   }
    : describe_log_streams_response)

let descending_of_yojson = bool_of_yojson

let describe_log_streams_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     descending = option_of_yojson (value_for_key descending_of_yojson "descending") _list path;
     order_by = option_of_yojson (value_for_key order_by_of_yojson "orderBy") _list path;
     log_stream_name_prefix =
       option_of_yojson (value_for_key log_stream_name_of_yojson "logStreamNamePrefix") _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : describe_log_streams_request)

let filter_count_of_yojson = int_of_yojson

let data_protection_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ARCHIVED" -> ARCHIVED
    | `String "DELETED" -> DELETED
    | `String "ACTIVATED" -> ACTIVATED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataProtectionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DataProtectionStatus")
     : data_protection_status)
    : data_protection_status)

let inherited_property_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT_DATA_PROTECTION" -> ACCOUNT_DATA_PROTECTION
    | `String value -> raise (deserialize_unknown_enum_value_error path "InheritedProperty" value)
    | _ -> raise (deserialize_wrong_type_error path "InheritedProperty")
     : inherited_property)
    : inherited_property)

let inherited_properties_of_yojson tree path = list_of_yojson inherited_property_of_yojson tree path

let log_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bearer_token_authentication_enabled =
       option_of_yojson
         (value_for_key bearer_token_authentication_enabled_of_yojson
            "bearerTokenAuthenticationEnabled")
         _list path;
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key deletion_protection_enabled_of_yojson "deletionProtectionEnabled")
         _list path;
     log_group_arn = option_of_yojson (value_for_key arn_of_yojson "logGroupArn") _list path;
     log_group_class =
       option_of_yojson (value_for_key log_group_class_of_yojson "logGroupClass") _list path;
     inherited_properties =
       option_of_yojson
         (value_for_key inherited_properties_of_yojson "inheritedProperties")
         _list path;
     data_protection_status =
       option_of_yojson
         (value_for_key data_protection_status_of_yojson "dataProtectionStatus")
         _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     stored_bytes = option_of_yojson (value_for_key stored_bytes_of_yojson "storedBytes") _list path;
     arn = option_of_yojson (value_for_key arn_of_yojson "arn") _list path;
     metric_filter_count =
       option_of_yojson (value_for_key filter_count_of_yojson "metricFilterCount") _list path;
     retention_in_days =
       option_of_yojson (value_for_key days_of_yojson "retentionInDays") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : log_group)

let log_groups_of_yojson tree path = list_of_yojson log_group_of_yojson tree path

let describe_log_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     log_groups = option_of_yojson (value_for_key log_groups_of_yojson "logGroups") _list path;
   }
    : describe_log_groups_response)

let log_group_name_pattern_of_yojson = string_of_yojson

let describe_log_groups_log_group_identifiers_of_yojson tree path =
  list_of_yojson log_group_identifier_of_yojson tree path

let describe_log_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_identifiers =
       option_of_yojson
         (value_for_key describe_log_groups_log_group_identifiers_of_yojson "logGroupIdentifiers")
         _list path;
     log_group_class =
       option_of_yojson (value_for_key log_group_class_of_yojson "logGroupClass") _list path;
     include_linked_accounts =
       option_of_yojson
         (value_for_key include_linked_accounts_of_yojson "includeLinkedAccounts")
         _list path;
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     log_group_name_pattern =
       option_of_yojson
         (value_for_key log_group_name_pattern_of_yojson "logGroupNamePattern")
         _list path;
     log_group_name_prefix =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupNamePrefix") _list path;
     account_identifiers =
       option_of_yojson (value_for_key account_ids_of_yojson "accountIdentifiers") _list path;
   }
    : describe_log_groups_request)

let index_policies_of_yojson tree path = list_of_yojson index_policy_of_yojson tree path

let describe_index_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     index_policies =
       option_of_yojson (value_for_key index_policies_of_yojson "indexPolicies") _list path;
   }
    : describe_index_policies_response)

let describe_index_policies_log_group_identifiers_of_yojson tree path =
  list_of_yojson log_group_identifier_of_yojson tree path

let describe_index_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     log_group_identifiers =
       value_for_key describe_index_policies_log_group_identifiers_of_yojson "logGroupIdentifiers"
         _list path;
   }
    : describe_index_policies_request)

let import_id_of_yojson = string_of_yojson

let import_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "CANCELLED" -> CANCELLED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ImportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ImportStatus")
     : import_status)
    : import_status)

let import_statistics_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bytes_imported =
       option_of_yojson (value_for_key stored_bytes_of_yojson "bytesImported") _list path;
   }
    : import_statistics)

let import_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_event_time = option_of_yojson (value_for_key timestamp_of_yojson "endEventTime") _list path;
     start_event_time =
       option_of_yojson (value_for_key timestamp_of_yojson "startEventTime") _list path;
   }
    : import_filter)

let error_message_of_yojson = string_of_yojson

let import_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     import_filter =
       option_of_yojson (value_for_key import_filter_of_yojson "importFilter") _list path;
     import_statistics =
       option_of_yojson (value_for_key import_statistics_of_yojson "importStatistics") _list path;
     import_destination_arn =
       option_of_yojson (value_for_key arn_of_yojson "importDestinationArn") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "importStatus") _list path;
     import_source_arn = option_of_yojson (value_for_key arn_of_yojson "importSourceArn") _list path;
     import_id = option_of_yojson (value_for_key import_id_of_yojson "importId") _list path;
   }
    : import)

let import_list_of_yojson tree path = list_of_yojson import_of_yojson tree path

let describe_import_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     imports = option_of_yojson (value_for_key import_list_of_yojson "imports") _list path;
   }
    : describe_import_tasks_response)

let describe_import_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     import_source_arn = option_of_yojson (value_for_key arn_of_yojson "importSourceArn") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "importStatus") _list path;
     import_id = option_of_yojson (value_for_key import_id_of_yojson "importId") _list path;
   }
    : describe_import_tasks_request)

let batch_id_of_yojson = string_of_yojson

let import_batch_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson (value_for_key error_message_of_yojson "errorMessage") _list path;
     status = value_for_key import_status_of_yojson "status" _list path;
     batch_id = value_for_key batch_id_of_yojson "batchId" _list path;
   }
    : import_batch)

let import_batch_list_of_yojson tree path = list_of_yojson import_batch_of_yojson tree path

let describe_import_task_batches_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     import_batches =
       option_of_yojson (value_for_key import_batch_list_of_yojson "importBatches") _list path;
     import_id = option_of_yojson (value_for_key import_id_of_yojson "importId") _list path;
     import_source_arn = option_of_yojson (value_for_key arn_of_yojson "importSourceArn") _list path;
   }
    : describe_import_task_batches_response)

let import_status_list_of_yojson tree path = list_of_yojson import_status_of_yojson tree path

let describe_import_task_batches_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     batch_import_status =
       option_of_yojson (value_for_key import_status_list_of_yojson "batchImportStatus") _list path;
     import_id = value_for_key import_id_of_yojson "importId" _list path;
   }
    : describe_import_task_batches_request)

let index_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIELD_INDEX" -> FIELD_INDEX
    | `String "FACET" -> FACET
    | `String value -> raise (deserialize_unknown_enum_value_error path "IndexType" value)
    | _ -> raise (deserialize_wrong_type_error path "IndexType")
     : index_type)
    : index_type)

let field_index_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key index_type_of_yojson "type") _list path;
     last_event_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastEventTime") _list path;
     first_event_time =
       option_of_yojson (value_for_key timestamp_of_yojson "firstEventTime") _list path;
     last_scan_time = option_of_yojson (value_for_key timestamp_of_yojson "lastScanTime") _list path;
     field_index_name =
       option_of_yojson (value_for_key field_index_name_of_yojson "fieldIndexName") _list path;
     log_group_identifier =
       option_of_yojson
         (value_for_key log_group_identifier_of_yojson "logGroupIdentifier")
         _list path;
   }
    : field_index)

let field_indexes_of_yojson tree path = list_of_yojson field_index_of_yojson tree path

let describe_field_indexes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     field_indexes =
       option_of_yojson (value_for_key field_indexes_of_yojson "fieldIndexes") _list path;
   }
    : describe_field_indexes_response)

let describe_field_indexes_log_group_identifiers_of_yojson tree path =
  list_of_yojson log_group_identifier_of_yojson tree path

let describe_field_indexes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     log_group_identifiers =
       value_for_key describe_field_indexes_log_group_identifiers_of_yojson "logGroupIdentifiers"
         _list path;
   }
    : describe_field_indexes_request)

let export_task_id_of_yojson = string_of_yojson
let export_task_name_of_yojson = string_of_yojson
let export_destination_bucket_of_yojson = string_of_yojson
let export_destination_prefix_of_yojson = string_of_yojson

let export_task_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "RUNNING" -> RUNNING
    | `String "PENDING_CANCEL" -> PENDING_CANCEL
    | `String "PENDING" -> PENDING
    | `String "FAILED" -> FAILED
    | `String "COMPLETED" -> COMPLETED
    | `String "CANCELLED" -> CANCELLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExportTaskStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportTaskStatusCode")
     : export_task_status_code)
    : export_task_status_code)

let export_task_status_message_of_yojson = string_of_yojson

let export_task_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson (value_for_key export_task_status_message_of_yojson "message") _list path;
     code = option_of_yojson (value_for_key export_task_status_code_of_yojson "code") _list path;
   }
    : export_task_status)

let export_task_execution_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     completion_time =
       option_of_yojson (value_for_key timestamp_of_yojson "completionTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
   }
    : export_task_execution_info)

let export_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_info =
       option_of_yojson
         (value_for_key export_task_execution_info_of_yojson "executionInfo")
         _list path;
     status = option_of_yojson (value_for_key export_task_status_of_yojson "status") _list path;
     destination_prefix =
       option_of_yojson
         (value_for_key export_destination_prefix_of_yojson "destinationPrefix")
         _list path;
     destination =
       option_of_yojson (value_for_key export_destination_bucket_of_yojson "destination") _list path;
     to_ = option_of_yojson (value_for_key timestamp_of_yojson "to") _list path;
     from_ = option_of_yojson (value_for_key timestamp_of_yojson "from") _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
     task_name = option_of_yojson (value_for_key export_task_name_of_yojson "taskName") _list path;
     task_id = option_of_yojson (value_for_key export_task_id_of_yojson "taskId") _list path;
   }
    : export_task)

let export_tasks_of_yojson tree path = list_of_yojson export_task_of_yojson tree path

let describe_export_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     export_tasks = option_of_yojson (value_for_key export_tasks_of_yojson "exportTasks") _list path;
   }
    : describe_export_tasks_response)

let describe_export_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     status_code =
       option_of_yojson (value_for_key export_task_status_code_of_yojson "statusCode") _list path;
     task_id = option_of_yojson (value_for_key export_task_id_of_yojson "taskId") _list path;
   }
    : describe_export_tasks_request)

let destinations_of_yojson tree path = list_of_yojson destination_of_yojson tree path

let describe_destinations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     destinations =
       option_of_yojson (value_for_key destinations_of_yojson "destinations") _list path;
   }
    : describe_destinations_response)

let describe_destinations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     destination_name_prefix =
       option_of_yojson
         (value_for_key destination_name_of_yojson "DestinationNamePrefix")
         _list path;
   }
    : describe_destinations_request)

let delivery_sources_of_yojson tree path = list_of_yojson delivery_source_of_yojson tree path

let describe_delivery_sources_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     delivery_sources =
       option_of_yojson (value_for_key delivery_sources_of_yojson "deliverySources") _list path;
   }
    : describe_delivery_sources_response)

let describe_delivery_sources_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_delivery_sources_request)

let delivery_destinations_of_yojson tree path =
  list_of_yojson delivery_destination_of_yojson tree path

let describe_delivery_destinations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     delivery_destinations =
       option_of_yojson
         (value_for_key delivery_destinations_of_yojson "deliveryDestinations")
         _list path;
   }
    : describe_delivery_destinations_response)

let describe_delivery_destinations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_delivery_destinations_request)

let deliveries_of_yojson tree path = list_of_yojson delivery_of_yojson tree path

let describe_deliveries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     deliveries = option_of_yojson (value_for_key deliveries_of_yojson "deliveries") _list path;
   }
    : describe_deliveries_response)

let describe_deliveries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : describe_deliveries_request)

let configuration_template_delivery_config_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_delivery_configuration =
       option_of_yojson
         (value_for_key s3_delivery_configuration_of_yojson "s3DeliveryConfiguration")
         _list path;
     field_delimiter =
       option_of_yojson (value_for_key field_delimiter_of_yojson "fieldDelimiter") _list path;
     record_fields =
       option_of_yojson (value_for_key record_fields_of_yojson "recordFields") _list path;
   }
    : configuration_template_delivery_config_values)

let allowed_fields_of_yojson tree path = list_of_yojson record_field_of_yojson tree path
let allowed_action_for_allow_vended_logs_delivery_for_resource_of_yojson = string_of_yojson

let allowed_field_delimiters_of_yojson tree path =
  list_of_yojson field_delimiter_of_yojson tree path

let delivery_source_configuration_schema_field_of_yojson = string_of_yojson

let delivery_source_configuration_schema_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "long" -> LONG
    | `String "double" -> DOUBLE
    | `String "int" -> INT
    | `String "boolean" -> BOOLEAN
    | `String "string" -> STRING
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "DeliverySourceConfigurationSchemaValueType"
             value)
    | _ -> raise (deserialize_wrong_type_error path "DeliverySourceConfigurationSchemaValueType")
     : delivery_source_configuration_schema_value_type)
    : delivery_source_configuration_schema_value_type)

let delivery_source_configuration_supported_values_of_yojson tree path =
  list_of_yojson delivery_source_configuration_schema_field_of_yojson tree path

let delivery_source_configuration_numeric_value_of_yojson = double_of_yojson

let delivery_source_configuration_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_value =
       option_of_yojson
         (value_for_key delivery_source_configuration_numeric_value_of_yojson "maxValue")
         _list path;
     min_value =
       option_of_yojson
         (value_for_key delivery_source_configuration_numeric_value_of_yojson "minValue")
         _list path;
     supported_values =
       option_of_yojson
         (value_for_key delivery_source_configuration_supported_values_of_yojson "supportedValues")
         _list path;
     default_value =
       value_for_key delivery_source_configuration_schema_field_of_yojson "defaultValue" _list path;
     value_type =
       value_for_key delivery_source_configuration_schema_value_type_of_yojson "valueType" _list
         path;
     key_name =
       value_for_key delivery_source_configuration_schema_field_of_yojson "keyName" _list path;
   }
    : delivery_source_configuration_schema)

let delivery_source_configuration_schemas_of_yojson tree path =
  list_of_yojson delivery_source_configuration_schema_of_yojson tree path

let configuration_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_tables_integration =
       option_of_yojson
         (value_for_key s3_tables_integration_of_yojson "s3TablesIntegration")
         _list path;
     delivery_source_configuration =
       option_of_yojson
         (value_for_key delivery_source_configuration_schemas_of_yojson
            "deliverySourceConfiguration")
         _list path;
     allowed_suffix_path_fields =
       option_of_yojson (value_for_key record_fields_of_yojson "allowedSuffixPathFields") _list path;
     allowed_field_delimiters =
       option_of_yojson
         (value_for_key allowed_field_delimiters_of_yojson "allowedFieldDelimiters")
         _list path;
     allowed_action_for_allow_vended_logs_delivery_for_resource =
       option_of_yojson
         (value_for_key allowed_action_for_allow_vended_logs_delivery_for_resource_of_yojson
            "allowedActionForAllowVendedLogsDeliveryForResource")
         _list path;
     allowed_output_formats =
       option_of_yojson (value_for_key output_formats_of_yojson "allowedOutputFormats") _list path;
     allowed_fields =
       option_of_yojson (value_for_key allowed_fields_of_yojson "allowedFields") _list path;
     default_delivery_config_values =
       option_of_yojson
         (value_for_key configuration_template_delivery_config_values_of_yojson
            "defaultDeliveryConfigValues")
         _list path;
     delivery_destination_type =
       option_of_yojson
         (value_for_key delivery_destination_type_of_yojson "deliveryDestinationType")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     log_type = option_of_yojson (value_for_key log_type_of_yojson "logType") _list path;
     service = option_of_yojson (value_for_key service_of_yojson "service") _list path;
   }
    : configuration_template)

let configuration_templates_of_yojson tree path =
  list_of_yojson configuration_template_of_yojson tree path

let describe_configuration_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     configuration_templates =
       option_of_yojson
         (value_for_key configuration_templates_of_yojson "configurationTemplates")
         _list path;
   }
    : describe_configuration_templates_response)

let log_types_of_yojson tree path = list_of_yojson log_type_of_yojson tree path

let delivery_destination_types_of_yojson tree path =
  list_of_yojson delivery_destination_type_of_yojson tree path

let describe_configuration_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key describe_limit_of_yojson "limit") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     delivery_destination_types =
       option_of_yojson
         (value_for_key delivery_destination_types_of_yojson "deliveryDestinationTypes")
         _list path;
     resource_types =
       option_of_yojson (value_for_key resource_types_of_yojson "resourceTypes") _list path;
     log_types = option_of_yojson (value_for_key log_types_of_yojson "logTypes") _list path;
     service = option_of_yojson (value_for_key service_of_yojson "service") _list path;
   }
    : describe_configuration_templates_request)

let account_policies_of_yojson tree path = list_of_yojson account_policy_of_yojson tree path

let describe_account_policies_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     account_policies =
       option_of_yojson (value_for_key account_policies_of_yojson "accountPolicies") _list path;
   }
    : describe_account_policies_response)

let describe_account_policies_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     account_identifiers =
       option_of_yojson (value_for_key account_ids_of_yojson "accountIdentifiers") _list path;
     policy_name = option_of_yojson (value_for_key policy_name_of_yojson "policyName") _list path;
     policy_type = value_for_key policy_type_of_yojson "policyType" _list path;
   }
    : describe_account_policies_request)

let delete_transformer_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : delete_transformer_request)

let delete_syslog_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "vpcEndpointId") _list path;
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : delete_syslog_configuration_request)

let delete_subscription_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_name = value_for_key filter_name_of_yojson "filterName" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : delete_subscription_filter_request)

let delete_scheduled_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key scheduled_query_identifier_of_yojson "identifier" _list path }
    : delete_scheduled_query_request)

let delete_retention_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path }
    : delete_retention_policy_request)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expected_revision_id =
       option_of_yojson
         (value_for_key expected_revision_id_of_yojson "expectedRevisionId")
         _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "resourceArn") _list path;
     policy_name = option_of_yojson (value_for_key policy_name_of_yojson "policyName") _list path;
   }
    : delete_resource_policy_request)

let delete_query_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ success = option_of_yojson (value_for_key success_of_yojson "success") _list path }
    : delete_query_definition_response)

let delete_query_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_definition_id = value_for_key query_id_of_yojson "queryDefinitionId" _list path }
    : delete_query_definition_request)

let delete_metric_filter_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_name = value_for_key filter_name_of_yojson "filterName" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : delete_metric_filter_request)

let delete_lookup_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ lookup_table_arn = value_for_key arn_of_yojson "lookupTableArn" _list path }
    : delete_lookup_table_request)

let delete_log_stream_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_stream_name = value_for_key log_stream_name_of_yojson "logStreamName" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : delete_log_stream_request)

let delete_log_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path }
    : delete_log_group_request)

let delete_log_anomaly_detector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_detector_arn =
       value_for_key anomaly_detector_arn_of_yojson "anomalyDetectorArn" _list path;
   }
    : delete_log_anomaly_detector_request)

let delete_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let force_of_yojson = bool_of_yojson

let delete_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force = option_of_yojson (value_for_key force_of_yojson "force") _list path;
     integration_name = value_for_key integration_name_of_yojson "integrationName" _list path;
   }
    : delete_integration_request)

let delete_index_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_index_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : delete_index_policy_request)

let delete_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ destination_name = value_for_key destination_name_of_yojson "destinationName" _list path }
    : delete_destination_request)

let delete_delivery_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key delivery_source_name_of_yojson "name" _list path }
    : delete_delivery_source_request)

let delete_delivery_destination_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_destination_name =
       value_for_key delivery_destination_name_of_yojson "deliveryDestinationName" _list path;
   }
    : delete_delivery_destination_policy_request)

let delete_delivery_destination_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key delivery_destination_name_of_yojson "name" _list path }
    : delete_delivery_destination_request)

let delete_delivery_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ id = value_for_key delivery_id_of_yojson "id" _list path } : delete_delivery_request)

let delete_data_protection_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_identifier =
       value_for_key log_group_identifier_of_yojson "logGroupIdentifier" _list path;
   }
    : delete_data_protection_policy_request)

let delete_account_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_type = value_for_key policy_type_of_yojson "policyType" _list path;
     policy_name = value_for_key policy_name_of_yojson "policyName" _list path;
   }
    : delete_account_policy_request)

let create_scheduled_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = option_of_yojson (value_for_key scheduled_query_state_of_yojson "state") _list path;
     scheduled_query_arn =
       option_of_yojson (value_for_key arn_of_yojson "scheduledQueryArn") _list path;
   }
    : create_scheduled_query_response)

let create_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     state = option_of_yojson (value_for_key scheduled_query_state_of_yojson "state") _list path;
     execution_role_arn = value_for_key role_arn_of_yojson "executionRoleArn" _list path;
     schedule_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "scheduleEndTime") _list path;
     schedule_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "scheduleStartTime") _list path;
     destination_configuration =
       option_of_yojson
         (value_for_key destination_configuration_of_yojson "destinationConfiguration")
         _list path;
     end_time_offset =
       option_of_yojson (value_for_key end_time_offset_of_yojson "endTimeOffset") _list path;
     start_time_offset =
       option_of_yojson (value_for_key start_time_offset_of_yojson "startTimeOffset") _list path;
     timezone = option_of_yojson (value_for_key schedule_timezone_of_yojson "timezone") _list path;
     schedule_expression =
       value_for_key schedule_expression_of_yojson "scheduleExpression" _list path;
     log_group_identifiers =
       option_of_yojson
         (value_for_key scheduled_query_log_group_identifiers_of_yojson "logGroupIdentifiers")
         _list path;
     query_string = value_for_key query_string_of_yojson "queryString" _list path;
     query_language = value_for_key query_language_of_yojson "queryLanguage" _list path;
     description =
       option_of_yojson
         (value_for_key scheduled_query_description_of_yojson "description")
         _list path;
     name = value_for_key scheduled_query_name_of_yojson "name" _list path;
   }
    : create_scheduled_query_request)

let create_lookup_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "createdAt") _list path;
     lookup_table_arn = option_of_yojson (value_for_key arn_of_yojson "lookupTableArn") _list path;
   }
    : create_lookup_table_response)

let create_lookup_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     table_body = value_for_key table_body_of_yojson "tableBody" _list path;
     description =
       option_of_yojson (value_for_key lookup_table_description_of_yojson "description") _list path;
     lookup_table_name = value_for_key lookup_table_name_of_yojson "lookupTableName" _list path;
   }
    : create_lookup_table_request)

let create_log_stream_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_stream_name = value_for_key log_stream_name_of_yojson "logStreamName" _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : create_log_stream_request)

let create_log_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     deletion_protection_enabled =
       option_of_yojson
         (value_for_key deletion_protection_enabled_of_yojson "deletionProtectionEnabled")
         _list path;
     log_group_class =
       option_of_yojson (value_for_key log_group_class_of_yojson "logGroupClass") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "kmsKeyId") _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
   }
    : create_log_group_request)

let create_log_anomaly_detector_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     anomaly_detector_arn =
       option_of_yojson
         (value_for_key anomaly_detector_arn_of_yojson "anomalyDetectorArn")
         _list path;
   }
    : create_log_anomaly_detector_response)

let detector_kms_key_arn_of_yojson = string_of_yojson

let create_log_anomaly_detector_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     anomaly_visibility_time =
       option_of_yojson
         (value_for_key anomaly_visibility_time_of_yojson "anomalyVisibilityTime")
         _list path;
     kms_key_id =
       option_of_yojson (value_for_key detector_kms_key_arn_of_yojson "kmsKeyId") _list path;
     filter_pattern =
       option_of_yojson (value_for_key filter_pattern_of_yojson "filterPattern") _list path;
     evaluation_frequency =
       option_of_yojson
         (value_for_key evaluation_frequency_of_yojson "evaluationFrequency")
         _list path;
     detector_name =
       option_of_yojson (value_for_key detector_name_of_yojson "detectorName") _list path;
     log_group_arn_list = value_for_key log_group_arn_list_of_yojson "logGroupArnList" _list path;
   }
    : create_log_anomaly_detector_request)

let create_import_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     import_destination_arn =
       option_of_yojson (value_for_key arn_of_yojson "importDestinationArn") _list path;
     import_id = option_of_yojson (value_for_key import_id_of_yojson "importId") _list path;
   }
    : create_import_task_response)

let create_import_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     import_filter =
       option_of_yojson (value_for_key import_filter_of_yojson "importFilter") _list path;
     import_role_arn = value_for_key role_arn_of_yojson "importRoleArn" _list path;
     import_source_arn = value_for_key arn_of_yojson "importSourceArn" _list path;
   }
    : create_import_task_request)

let create_export_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = option_of_yojson (value_for_key export_task_id_of_yojson "taskId") _list path }
    : create_export_task_response)

let create_export_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_prefix =
       option_of_yojson
         (value_for_key export_destination_prefix_of_yojson "destinationPrefix")
         _list path;
     destination = value_for_key export_destination_bucket_of_yojson "destination" _list path;
     to_ = value_for_key timestamp_of_yojson "to" _list path;
     from_ = value_for_key timestamp_of_yojson "from" _list path;
     log_stream_name_prefix =
       option_of_yojson (value_for_key log_stream_name_of_yojson "logStreamNamePrefix") _list path;
     log_group_name = value_for_key log_group_name_of_yojson "logGroupName" _list path;
     task_name = option_of_yojson (value_for_key export_task_name_of_yojson "taskName") _list path;
   }
    : create_export_task_request)

let create_delivery_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ delivery = option_of_yojson (value_for_key delivery_of_yojson "delivery") _list path }
    : create_delivery_response)

let create_delivery_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     s3_delivery_configuration =
       option_of_yojson
         (value_for_key s3_delivery_configuration_of_yojson "s3DeliveryConfiguration")
         _list path;
     field_delimiter =
       option_of_yojson (value_for_key field_delimiter_of_yojson "fieldDelimiter") _list path;
     record_fields =
       option_of_yojson (value_for_key record_fields_of_yojson "recordFields") _list path;
     delivery_destination_arn = value_for_key arn_of_yojson "deliveryDestinationArn" _list path;
     delivery_source_name =
       value_for_key delivery_source_name_of_yojson "deliverySourceName" _list path;
   }
    : create_delivery_request)

let cancel_import_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "lastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "creationTime") _list path;
     import_status =
       option_of_yojson (value_for_key import_status_of_yojson "importStatus") _list path;
     import_statistics =
       option_of_yojson (value_for_key import_statistics_of_yojson "importStatistics") _list path;
     import_id = option_of_yojson (value_for_key import_id_of_yojson "importId") _list path;
   }
    : cancel_import_task_response)

let cancel_import_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ import_id = value_for_key import_id_of_yojson "importId" _list path }
    : cancel_import_task_request)

let cancel_export_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = value_for_key export_task_id_of_yojson "taskId" _list path }
    : cancel_export_task_request)

let associate_source_to_s3_table_integration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     identifier =
       option_of_yojson
         (value_for_key s3_table_integration_source_identifier_of_yojson "identifier")
         _list path;
   }
    : associate_source_to_s3_table_integration_response)

let associate_source_to_s3_table_integration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_source = value_for_key data_source_of_yojson "dataSource" _list path;
     integration_arn = value_for_key arn_of_yojson "integrationArn" _list path;
   }
    : associate_source_to_s3_table_integration_request)

let associate_kms_key_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_identifier =
       option_of_yojson
         (value_for_key resource_identifier_of_yojson "resourceIdentifier")
         _list path;
     kms_key_id = value_for_key kms_key_id_of_yojson "kmsKeyId" _list path;
     log_group_name =
       option_of_yojson (value_for_key log_group_name_of_yojson "logGroupName") _list path;
   }
    : associate_kms_key_request)
