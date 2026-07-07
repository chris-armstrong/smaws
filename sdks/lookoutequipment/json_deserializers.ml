open Smaws_Lib.Json.DeserializeHelpers
open Types

let bounded_length_string_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key bounded_length_string_of_yojson "Message" _list path }
    : validation_exception)

let model_name_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let retraining_frequency_of_yojson = string_of_yojson
let lookback_window_of_yojson = string_of_yojson

let model_promote_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "MANUAL" -> MANUAL
    | `String "MANAGED" -> MANAGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelPromoteMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelPromoteMode")
     : model_promote_mode)
    : model_promote_mode)

let update_retraining_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     promote_mode =
       option_of_yojson (value_for_key model_promote_mode_of_yojson "PromoteMode") _list path;
     lookback_window =
       option_of_yojson (value_for_key lookback_window_of_yojson "LookbackWindow") _list path;
     retraining_frequency =
       option_of_yojson
         (value_for_key retraining_frequency_of_yojson "RetrainingFrequency")
         _list path;
     retraining_start_date =
       option_of_yojson (value_for_key timestamp_of_yojson "RetrainingStartDate") _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
   }
    : update_retraining_scheduler_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key bounded_length_string_of_yojson "Message" _list path }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key bounded_length_string_of_yojson "Message" _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key bounded_length_string_of_yojson "Message" _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key bounded_length_string_of_yojson "Message" _list path }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key bounded_length_string_of_yojson "Message" _list path }
    : access_denied_exception)

let s3_bucket_of_yojson = string_of_yojson
let s3_prefix_of_yojson = string_of_yojson

let labels_s3_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "Prefix") _list path;
     bucket = value_for_key s3_bucket_of_yojson "Bucket" _list path;
   }
    : labels_s3_input_configuration)

let label_group_name_of_yojson = string_of_yojson

let labels_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_group_name =
       option_of_yojson (value_for_key label_group_name_of_yojson "LabelGroupName") _list path;
     s3_input_configuration =
       option_of_yojson
         (value_for_key labels_s3_input_configuration_of_yojson "S3InputConfiguration")
         _list path;
   }
    : labels_input_configuration)

let iam_role_arn_of_yojson = string_of_yojson

let model_diagnostics_s3_output_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "Prefix") _list path;
     bucket = value_for_key s3_bucket_of_yojson "Bucket" _list path;
   }
    : model_diagnostics_s3_output_configuration)

let name_or_arn_of_yojson = string_of_yojson

let model_diagnostics_output_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key name_or_arn_of_yojson "KmsKeyId") _list path;
     s3_output_configuration =
       value_for_key model_diagnostics_s3_output_configuration_of_yojson "S3OutputConfiguration"
         _list path;
   }
    : model_diagnostics_output_configuration)

let update_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_diagnostics_output_configuration =
       option_of_yojson
         (value_for_key model_diagnostics_output_configuration_of_yojson
            "ModelDiagnosticsOutputConfiguration")
         _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     labels_input_configuration =
       option_of_yojson
         (value_for_key labels_input_configuration_of_yojson "LabelsInputConfiguration")
         _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
   }
    : update_model_request)

let fault_code_of_yojson = string_of_yojson
let fault_codes_of_yojson tree path = list_of_yojson fault_code_of_yojson tree path

let update_label_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fault_codes = option_of_yojson (value_for_key fault_codes_of_yojson "FaultCodes") _list path;
     label_group_name = value_for_key label_group_name_of_yojson "LabelGroupName" _list path;
   }
    : update_label_group_request)

let inference_scheduler_identifier_of_yojson = string_of_yojson
let data_delay_offset_in_minutes_of_yojson = long_of_yojson

let data_upload_frequency_of_yojson (tree : t) path =
  ((match tree with
    | `String "PT1H" -> PT1H
    | `String "PT30M" -> PT30M
    | `String "PT15M" -> PT15M
    | `String "PT10M" -> PT10M
    | `String "PT5M" -> PT5M
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataUploadFrequency" value)
    | _ -> raise (deserialize_wrong_type_error path "DataUploadFrequency")
     : data_upload_frequency)
    : data_upload_frequency)

let inference_s3_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "Prefix") _list path;
     bucket = value_for_key s3_bucket_of_yojson "Bucket" _list path;
   }
    : inference_s3_input_configuration)

let time_zone_offset_of_yojson = string_of_yojson
let file_name_timestamp_format_of_yojson = string_of_yojson
let component_timestamp_delimiter_of_yojson = string_of_yojson

let inference_input_name_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     component_timestamp_delimiter =
       option_of_yojson
         (value_for_key component_timestamp_delimiter_of_yojson "ComponentTimestampDelimiter")
         _list path;
     timestamp_format =
       option_of_yojson
         (value_for_key file_name_timestamp_format_of_yojson "TimestampFormat")
         _list path;
   }
    : inference_input_name_configuration)

let inference_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_input_name_configuration =
       option_of_yojson
         (value_for_key inference_input_name_configuration_of_yojson
            "InferenceInputNameConfiguration")
         _list path;
     input_time_zone_offset =
       option_of_yojson (value_for_key time_zone_offset_of_yojson "InputTimeZoneOffset") _list path;
     s3_input_configuration =
       option_of_yojson
         (value_for_key inference_s3_input_configuration_of_yojson "S3InputConfiguration")
         _list path;
   }
    : inference_input_configuration)

let inference_s3_output_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "Prefix") _list path;
     bucket = value_for_key s3_bucket_of_yojson "Bucket" _list path;
   }
    : inference_s3_output_configuration)

let inference_output_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key name_or_arn_of_yojson "KmsKeyId") _list path;
     s3_output_configuration =
       value_for_key inference_s3_output_configuration_of_yojson "S3OutputConfiguration" _list path;
   }
    : inference_output_configuration)

let update_inference_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     data_output_configuration =
       option_of_yojson
         (value_for_key inference_output_configuration_of_yojson "DataOutputConfiguration")
         _list path;
     data_input_configuration =
       option_of_yojson
         (value_for_key inference_input_configuration_of_yojson "DataInputConfiguration")
         _list path;
     data_upload_frequency =
       option_of_yojson
         (value_for_key data_upload_frequency_of_yojson "DataUploadFrequency")
         _list path;
     data_delay_offset_in_minutes =
       option_of_yojson
         (value_for_key data_delay_offset_in_minutes_of_yojson "DataDelayOffsetInMinutes")
         _list path;
     inference_scheduler_name =
       value_for_key inference_scheduler_identifier_of_yojson "InferenceSchedulerName" _list path;
   }
    : update_inference_scheduler_request)

let model_arn_of_yojson = string_of_yojson
let model_version_of_yojson = long_of_yojson
let model_version_arn_of_yojson = string_of_yojson

let update_active_model_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     previous_active_version_arn =
       option_of_yojson
         (value_for_key model_version_arn_of_yojson "PreviousActiveVersionArn")
         _list path;
     current_active_version_arn =
       option_of_yojson
         (value_for_key model_version_arn_of_yojson "CurrentActiveVersionArn")
         _list path;
     previous_active_version =
       option_of_yojson (value_for_key model_version_of_yojson "PreviousActiveVersion") _list path;
     current_active_version =
       option_of_yojson (value_for_key model_version_of_yojson "CurrentActiveVersion") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : update_active_model_version_response)

let update_active_model_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_version = value_for_key model_version_of_yojson "ModelVersion" _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
   }
    : update_active_model_version_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_arn = value_for_key amazon_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let integer_of_yojson = int_of_yojson

let unsupported_timestamps_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_number_of_unsupported_timestamps =
       value_for_key integer_of_yojson "TotalNumberOfUnsupportedTimestamps" _list path;
   }
    : unsupported_timestamps)

let target_sampling_rate_of_yojson (tree : t) path =
  ((match tree with
    | `String "PT1H" -> PT1H
    | `String "PT30M" -> PT30M
    | `String "PT15M" -> PT15M
    | `String "PT10M" -> PT10M
    | `String "PT5M" -> PT5M
    | `String "PT1M" -> PT1M
    | `String "PT30S" -> PT30S
    | `String "PT15S" -> PT15S
    | `String "PT10S" -> PT10S
    | `String "PT5S" -> PT5S
    | `String "PT1S" -> PT1S
    | `String value -> raise (deserialize_unknown_enum_value_error path "TargetSamplingRate" value)
    | _ -> raise (deserialize_wrong_type_error path "TargetSamplingRate")
     : target_sampling_rate)
    : target_sampling_rate)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key amazon_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key bounded_length_string_of_yojson "Message" _list path }
    : service_quota_exceeded_exception)

let synthesized_json_model_metrics_of_yojson = string_of_yojson
let synthesized_json_inline_data_schema_of_yojson = string_of_yojson

let retraining_scheduler_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "RUNNING" -> RUNNING
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RetrainingSchedulerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RetrainingSchedulerStatus")
     : retraining_scheduler_status)
    : retraining_scheduler_status)

let stop_retraining_scheduler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key retraining_scheduler_status_of_yojson "Status") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : stop_retraining_scheduler_response)

let stop_retraining_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ model_name = value_for_key model_name_of_yojson "ModelName" _list path }
    : stop_retraining_scheduler_request)

let inference_scheduler_name_of_yojson = string_of_yojson
let inference_scheduler_arn_of_yojson = string_of_yojson

let inference_scheduler_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOPPED" -> STOPPED
    | `String "STOPPING" -> STOPPING
    | `String "RUNNING" -> RUNNING
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InferenceSchedulerStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InferenceSchedulerStatus")
     : inference_scheduler_status)
    : inference_scheduler_status)

let stop_inference_scheduler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key inference_scheduler_status_of_yojson "Status") _list path;
     inference_scheduler_arn =
       option_of_yojson
         (value_for_key inference_scheduler_arn_of_yojson "InferenceSchedulerArn")
         _list path;
     inference_scheduler_name =
       option_of_yojson
         (value_for_key inference_scheduler_name_of_yojson "InferenceSchedulerName")
         _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
   }
    : stop_inference_scheduler_response)

let stop_inference_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_scheduler_name =
       value_for_key inference_scheduler_identifier_of_yojson "InferenceSchedulerName" _list path;
   }
    : stop_inference_scheduler_request)

let statistical_issue_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_ISSUE_DETECTED" -> NO_ISSUE_DETECTED
    | `String "POTENTIAL_ISSUE_DETECTED" -> POTENTIAL_ISSUE_DETECTED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StatisticalIssueStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StatisticalIssueStatus")
     : statistical_issue_status)
    : statistical_issue_status)

let start_retraining_scheduler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key retraining_scheduler_status_of_yojson "Status") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : start_retraining_scheduler_response)

let start_retraining_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ model_name = value_for_key model_name_of_yojson "ModelName" _list path }
    : start_retraining_scheduler_request)

let start_inference_scheduler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key inference_scheduler_status_of_yojson "Status") _list path;
     inference_scheduler_arn =
       option_of_yojson
         (value_for_key inference_scheduler_arn_of_yojson "InferenceSchedulerArn")
         _list path;
     inference_scheduler_name =
       option_of_yojson
         (value_for_key inference_scheduler_name_of_yojson "InferenceSchedulerName")
         _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
   }
    : start_inference_scheduler_response)

let start_inference_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_scheduler_name =
       value_for_key inference_scheduler_identifier_of_yojson "InferenceSchedulerName" _list path;
   }
    : start_inference_scheduler_request)

let ingestion_job_id_of_yojson = string_of_yojson

let ingestion_job_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "IngestionJobStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "IngestionJobStatus")
     : ingestion_job_status)
    : ingestion_job_status)

let start_data_ingestion_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key ingestion_job_status_of_yojson "Status") _list path;
     job_id = option_of_yojson (value_for_key ingestion_job_id_of_yojson "JobId") _list path;
   }
    : start_data_ingestion_job_response)

let dataset_identifier_of_yojson = string_of_yojson
let key_pattern_of_yojson = string_of_yojson

let ingestion_s3_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key_pattern = option_of_yojson (value_for_key key_pattern_of_yojson "KeyPattern") _list path;
     prefix = option_of_yojson (value_for_key s3_prefix_of_yojson "Prefix") _list path;
     bucket = value_for_key s3_bucket_of_yojson "Bucket" _list path;
   }
    : ingestion_s3_input_configuration)

let ingestion_input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_input_configuration =
       value_for_key ingestion_s3_input_configuration_of_yojson "S3InputConfiguration" _list path;
   }
    : ingestion_input_configuration)

let idempotence_token_of_yojson = string_of_yojson

let start_data_ingestion_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     ingestion_input_configuration =
       value_for_key ingestion_input_configuration_of_yojson "IngestionInputConfiguration" _list
         path;
     dataset_name = value_for_key dataset_identifier_of_yojson "DatasetName" _list path;
   }
    : start_data_ingestion_job_request)

let sensors_with_short_date_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ affected_sensor_count = value_for_key integer_of_yojson "AffectedSensorCount" _list path }
    : sensors_with_short_date_range)

let component_name_of_yojson = string_of_yojson
let sensor_name_of_yojson = string_of_yojson
let boolean__of_yojson = bool_of_yojson
let float__of_yojson = float_of_yojson

let count_percent_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     percentage = value_for_key float__of_yojson "Percentage" _list path;
     count = value_for_key integer_of_yojson "Count" _list path;
   }
    : count_percent)

let categorical_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     number_of_category =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfCategory") _list path;
     status = value_for_key statistical_issue_status_of_yojson "Status" _list path;
   }
    : categorical_values)

let multiple_operating_modes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ status = value_for_key statistical_issue_status_of_yojson "Status" _list path }
    : multiple_operating_modes)

let large_timestamp_gaps_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_timestamp_gap_in_days =
       option_of_yojson (value_for_key integer_of_yojson "MaxTimestampGapInDays") _list path;
     number_of_large_timestamp_gaps =
       option_of_yojson (value_for_key integer_of_yojson "NumberOfLargeTimestampGaps") _list path;
     status = value_for_key statistical_issue_status_of_yojson "Status" _list path;
   }
    : large_timestamp_gaps)

let monotonicity_of_yojson (tree : t) path =
  ((match tree with
    | `String "STATIC" -> STATIC
    | `String "INCREASING" -> INCREASING
    | `String "DECREASING" -> DECREASING
    | `String value -> raise (deserialize_unknown_enum_value_error path "Monotonicity" value)
    | _ -> raise (deserialize_wrong_type_error path "Monotonicity")
     : monotonicity)
    : monotonicity)

let monotonic_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monotonicity =
       option_of_yojson (value_for_key monotonicity_of_yojson "Monotonicity") _list path;
     status = value_for_key statistical_issue_status_of_yojson "Status" _list path;
   }
    : monotonic_values)

let sensor_statistics_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_end_time = option_of_yojson (value_for_key timestamp_of_yojson "DataEndTime") _list path;
     data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "DataStartTime") _list path;
     monotonic_values =
       option_of_yojson (value_for_key monotonic_values_of_yojson "MonotonicValues") _list path;
     large_timestamp_gaps =
       option_of_yojson
         (value_for_key large_timestamp_gaps_of_yojson "LargeTimestampGaps")
         _list path;
     multiple_operating_modes =
       option_of_yojson
         (value_for_key multiple_operating_modes_of_yojson "MultipleOperatingModes")
         _list path;
     categorical_values =
       option_of_yojson (value_for_key categorical_values_of_yojson "CategoricalValues") _list path;
     duplicate_timestamps =
       option_of_yojson (value_for_key count_percent_of_yojson "DuplicateTimestamps") _list path;
     invalid_date_entries =
       option_of_yojson (value_for_key count_percent_of_yojson "InvalidDateEntries") _list path;
     invalid_values =
       option_of_yojson (value_for_key count_percent_of_yojson "InvalidValues") _list path;
     missing_values =
       option_of_yojson (value_for_key count_percent_of_yojson "MissingValues") _list path;
     data_exists = option_of_yojson (value_for_key boolean__of_yojson "DataExists") _list path;
     sensor_name = option_of_yojson (value_for_key sensor_name_of_yojson "SensorName") _list path;
     component_name =
       option_of_yojson (value_for_key component_name_of_yojson "ComponentName") _list path;
   }
    : sensor_statistics_summary)

let sensor_statistics_summaries_of_yojson tree path =
  list_of_yojson sensor_statistics_summary_of_yojson tree path

let s3_key_of_yojson = string_of_yojson

let s3_object_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key s3_key_of_yojson "Key" _list path;
     bucket = value_for_key s3_bucket_of_yojson "Bucket" _list path;
   }
    : s3_object)

let retraining_scheduler_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lookback_window =
       option_of_yojson (value_for_key lookback_window_of_yojson "LookbackWindow") _list path;
     retraining_frequency =
       option_of_yojson
         (value_for_key retraining_frequency_of_yojson "RetrainingFrequency")
         _list path;
     retraining_start_date =
       option_of_yojson (value_for_key timestamp_of_yojson "RetrainingStartDate") _list path;
     status =
       option_of_yojson (value_for_key retraining_scheduler_status_of_yojson "Status") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : retraining_scheduler_summary)

let retraining_scheduler_summaries_of_yojson tree path =
  list_of_yojson retraining_scheduler_summary_of_yojson tree path

let resource_arn_of_yojson = string_of_yojson
let policy_revision_id_of_yojson = string_of_yojson

let put_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "PolicyRevisionId") _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn") _list path;
   }
    : put_resource_policy_response)

let policy_of_yojson = string_of_yojson

let put_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     policy_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "PolicyRevisionId") _list path;
     resource_policy = value_for_key policy_of_yojson "ResourcePolicy" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path;
   }
    : put_resource_policy_request)

let off_condition_of_yojson = string_of_yojson
let next_token_of_yojson = string_of_yojson

let model_version_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "CANCELED" -> CANCELED
    | `String "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelVersionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelVersionStatus")
     : model_version_status)
    : model_version_status)

let model_version_source_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT" -> IMPORT
    | `String "RETRAINING" -> RETRAINING
    | `String "TRAINING" -> TRAINING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ModelVersionSourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelVersionSourceType")
     : model_version_source_type)
    : model_version_source_type)

let model_quality_of_yojson (tree : t) path =
  ((match tree with
    | `String "POOR_QUALITY_DETECTED" -> POOR_QUALITY_DETECTED
    | `String "CANNOT_DETERMINE_QUALITY" -> CANNOT_DETERMINE_QUALITY
    | `String "QUALITY_THRESHOLD_MET" -> QUALITY_THRESHOLD_MET
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelQuality" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelQuality")
     : model_quality)
    : model_quality)

let model_version_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_quality =
       option_of_yojson (value_for_key model_quality_of_yojson "ModelQuality") _list path;
     source_type =
       option_of_yojson (value_for_key model_version_source_type_of_yojson "SourceType") _list path;
     status = option_of_yojson (value_for_key model_version_status_of_yojson "Status") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     model_version_arn =
       option_of_yojson (value_for_key model_version_arn_of_yojson "ModelVersionArn") _list path;
     model_version =
       option_of_yojson (value_for_key model_version_of_yojson "ModelVersion") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : model_version_summary)

let model_version_summaries_of_yojson tree path =
  list_of_yojson model_version_summary_of_yojson tree path

let dataset_name_of_yojson = string_of_yojson
let dataset_arn_of_yojson = string_of_yojson

let model_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ModelStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ModelStatus")
     : model_status)
    : model_status)

let model_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_quality =
       option_of_yojson (value_for_key model_quality_of_yojson "ModelQuality") _list path;
     model_diagnostics_output_configuration =
       option_of_yojson
         (value_for_key model_diagnostics_output_configuration_of_yojson
            "ModelDiagnosticsOutputConfiguration")
         _list path;
     retraining_scheduler_status =
       option_of_yojson
         (value_for_key retraining_scheduler_status_of_yojson "RetrainingSchedulerStatus")
         _list path;
     next_scheduled_retraining_start_date =
       option_of_yojson
         (value_for_key timestamp_of_yojson "NextScheduledRetrainingStartDate")
         _list path;
     latest_scheduled_retraining_start_time =
       option_of_yojson
         (value_for_key timestamp_of_yojson "LatestScheduledRetrainingStartTime")
         _list path;
     latest_scheduled_retraining_model_version =
       option_of_yojson
         (value_for_key model_version_of_yojson "LatestScheduledRetrainingModelVersion")
         _list path;
     latest_scheduled_retraining_status =
       option_of_yojson
         (value_for_key model_version_status_of_yojson "LatestScheduledRetrainingStatus")
         _list path;
     active_model_version_arn =
       option_of_yojson
         (value_for_key model_version_arn_of_yojson "ActiveModelVersionArn")
         _list path;
     active_model_version =
       option_of_yojson (value_for_key model_version_of_yojson "ActiveModelVersion") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     status = option_of_yojson (value_for_key model_status_of_yojson "Status") _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : model_summary)

let model_summaries_of_yojson tree path = list_of_yojson model_summary_of_yojson tree path
let model_metrics_of_yojson = string_of_yojson

let missing_sensor_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_number_of_missing_values =
       value_for_key integer_of_yojson "TotalNumberOfMissingValues" _list path;
     affected_sensor_count = value_for_key integer_of_yojson "AffectedSensorCount" _list path;
   }
    : missing_sensor_data)

let missing_complete_sensor_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ affected_sensor_count = value_for_key integer_of_yojson "AffectedSensorCount" _list path }
    : missing_complete_sensor_data)

let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key amazon_resource_arn_of_yojson "ResourceArn" _list path }
    : list_tags_for_resource_request)

let list_sensor_statistics_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     sensor_statistics_summaries =
       option_of_yojson
         (value_for_key sensor_statistics_summaries_of_yojson "SensorStatisticsSummaries")
         _list path;
   }
    : list_sensor_statistics_response)

let list_sensor_statistics_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     ingestion_job_id =
       option_of_yojson (value_for_key ingestion_job_id_of_yojson "IngestionJobId") _list path;
     dataset_name = value_for_key dataset_name_of_yojson "DatasetName" _list path;
   }
    : list_sensor_statistics_request)

let list_retraining_schedulers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     retraining_scheduler_summaries =
       option_of_yojson
         (value_for_key retraining_scheduler_summaries_of_yojson "RetrainingSchedulerSummaries")
         _list path;
   }
    : list_retraining_schedulers_response)

let list_retraining_schedulers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     status =
       option_of_yojson (value_for_key retraining_scheduler_status_of_yojson "Status") _list path;
     model_name_begins_with =
       option_of_yojson (value_for_key model_name_of_yojson "ModelNameBeginsWith") _list path;
   }
    : list_retraining_schedulers_request)

let list_of_discarded_files_of_yojson tree path = list_of_yojson s3_object_of_yojson tree path

let list_models_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_summaries =
       option_of_yojson (value_for_key model_summaries_of_yojson "ModelSummaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_models_response)

let list_models_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_name_begins_with =
       option_of_yojson (value_for_key dataset_name_of_yojson "DatasetNameBeginsWith") _list path;
     model_name_begins_with =
       option_of_yojson (value_for_key model_name_of_yojson "ModelNameBeginsWith") _list path;
     status = option_of_yojson (value_for_key model_status_of_yojson "Status") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_models_request)

let list_model_versions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_version_summaries =
       option_of_yojson
         (value_for_key model_version_summaries_of_yojson "ModelVersionSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_model_versions_response)

let list_model_versions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     min_model_version =
       option_of_yojson (value_for_key model_version_of_yojson "MinModelVersion") _list path;
     max_model_version =
       option_of_yojson (value_for_key model_version_of_yojson "MaxModelVersion") _list path;
     created_at_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "CreatedAtStartTime") _list path;
     created_at_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "CreatedAtEndTime") _list path;
     source_type =
       option_of_yojson (value_for_key model_version_source_type_of_yojson "SourceType") _list path;
     status = option_of_yojson (value_for_key model_version_status_of_yojson "Status") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
   }
    : list_model_versions_request)

let label_id_of_yojson = string_of_yojson
let label_group_arn_of_yojson = string_of_yojson

let label_rating_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEUTRAL" -> NEUTRAL
    | `String "NO_ANOMALY" -> NO_ANOMALY
    | `String "ANOMALY" -> ANOMALY
    | `String value -> raise (deserialize_unknown_enum_value_error path "LabelRating" value)
    | _ -> raise (deserialize_wrong_type_error path "LabelRating")
     : label_rating)
    : label_rating)

let equipment_of_yojson = string_of_yojson

let label_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     equipment = option_of_yojson (value_for_key equipment_of_yojson "Equipment") _list path;
     fault_code = option_of_yojson (value_for_key fault_code_of_yojson "FaultCode") _list path;
     rating = option_of_yojson (value_for_key label_rating_of_yojson "Rating") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     label_group_arn =
       option_of_yojson (value_for_key label_group_arn_of_yojson "LabelGroupArn") _list path;
     label_id = option_of_yojson (value_for_key label_id_of_yojson "LabelId") _list path;
     label_group_name =
       option_of_yojson (value_for_key label_group_name_of_yojson "LabelGroupName") _list path;
   }
    : label_summary)

let label_summaries_of_yojson tree path = list_of_yojson label_summary_of_yojson tree path

let list_labels_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_summaries =
       option_of_yojson (value_for_key label_summaries_of_yojson "LabelSummaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_labels_response)

let list_labels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     equipment = option_of_yojson (value_for_key equipment_of_yojson "Equipment") _list path;
     fault_code = option_of_yojson (value_for_key fault_code_of_yojson "FaultCode") _list path;
     interval_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "IntervalEndTime") _list path;
     interval_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "IntervalStartTime") _list path;
     label_group_name = value_for_key label_group_name_of_yojson "LabelGroupName" _list path;
   }
    : list_labels_request)

let label_group_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     label_group_arn =
       option_of_yojson (value_for_key label_group_arn_of_yojson "LabelGroupArn") _list path;
     label_group_name =
       option_of_yojson (value_for_key label_group_name_of_yojson "LabelGroupName") _list path;
   }
    : label_group_summary)

let label_group_summaries_of_yojson tree path =
  list_of_yojson label_group_summary_of_yojson tree path

let list_label_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_group_summaries =
       option_of_yojson
         (value_for_key label_group_summaries_of_yojson "LabelGroupSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_label_groups_response)

let list_label_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     label_group_name_begins_with =
       option_of_yojson
         (value_for_key label_group_name_of_yojson "LabelGroupNameBeginsWith")
         _list path;
   }
    : list_label_groups_request)

let latest_inference_result_of_yojson (tree : t) path =
  ((match tree with
    | `String "NORMAL" -> NORMAL
    | `String "ANOMALOUS" -> ANOMALOUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LatestInferenceResult" value)
    | _ -> raise (deserialize_wrong_type_error path "LatestInferenceResult")
     : latest_inference_result)
    : latest_inference_result)

let inference_scheduler_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_inference_result =
       option_of_yojson
         (value_for_key latest_inference_result_of_yojson "LatestInferenceResult")
         _list path;
     data_upload_frequency =
       option_of_yojson
         (value_for_key data_upload_frequency_of_yojson "DataUploadFrequency")
         _list path;
     data_delay_offset_in_minutes =
       option_of_yojson
         (value_for_key data_delay_offset_in_minutes_of_yojson "DataDelayOffsetInMinutes")
         _list path;
     status =
       option_of_yojson (value_for_key inference_scheduler_status_of_yojson "Status") _list path;
     inference_scheduler_arn =
       option_of_yojson
         (value_for_key inference_scheduler_arn_of_yojson "InferenceSchedulerArn")
         _list path;
     inference_scheduler_name =
       option_of_yojson
         (value_for_key inference_scheduler_name_of_yojson "InferenceSchedulerName")
         _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : inference_scheduler_summary)

let inference_scheduler_summaries_of_yojson tree path =
  list_of_yojson inference_scheduler_summary_of_yojson tree path

let list_inference_schedulers_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_scheduler_summaries =
       option_of_yojson
         (value_for_key inference_scheduler_summaries_of_yojson "InferenceSchedulerSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_inference_schedulers_response)

let list_inference_schedulers_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key inference_scheduler_status_of_yojson "Status") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
     inference_scheduler_name_begins_with =
       option_of_yojson
         (value_for_key inference_scheduler_identifier_of_yojson "InferenceSchedulerNameBeginsWith")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_inference_schedulers_request)

let inference_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "SUCCESS" -> SUCCESS
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InferenceExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "InferenceExecutionStatus")
     : inference_execution_status)
    : inference_execution_status)

let inference_execution_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_version_arn =
       option_of_yojson (value_for_key model_version_arn_of_yojson "ModelVersionArn") _list path;
     model_version =
       option_of_yojson (value_for_key model_version_of_yojson "ModelVersion") _list path;
     failed_reason =
       option_of_yojson (value_for_key bounded_length_string_of_yojson "FailedReason") _list path;
     status =
       option_of_yojson (value_for_key inference_execution_status_of_yojson "Status") _list path;
     customer_result_object =
       option_of_yojson (value_for_key s3_object_of_yojson "CustomerResultObject") _list path;
     data_output_configuration =
       option_of_yojson
         (value_for_key inference_output_configuration_of_yojson "DataOutputConfiguration")
         _list path;
     data_input_configuration =
       option_of_yojson
         (value_for_key inference_input_configuration_of_yojson "DataInputConfiguration")
         _list path;
     data_end_time = option_of_yojson (value_for_key timestamp_of_yojson "DataEndTime") _list path;
     data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "DataStartTime") _list path;
     scheduled_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ScheduledStartTime") _list path;
     inference_scheduler_arn =
       option_of_yojson
         (value_for_key inference_scheduler_arn_of_yojson "InferenceSchedulerArn")
         _list path;
     inference_scheduler_name =
       option_of_yojson
         (value_for_key inference_scheduler_name_of_yojson "InferenceSchedulerName")
         _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : inference_execution_summary)

let inference_execution_summaries_of_yojson tree path =
  list_of_yojson inference_execution_summary_of_yojson tree path

let list_inference_executions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_execution_summaries =
       option_of_yojson
         (value_for_key inference_execution_summaries_of_yojson "InferenceExecutionSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_inference_executions_response)

let list_inference_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key inference_execution_status_of_yojson "Status") _list path;
     data_end_time_before =
       option_of_yojson (value_for_key timestamp_of_yojson "DataEndTimeBefore") _list path;
     data_start_time_after =
       option_of_yojson (value_for_key timestamp_of_yojson "DataStartTimeAfter") _list path;
     inference_scheduler_name =
       value_for_key inference_scheduler_identifier_of_yojson "InferenceSchedulerName" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_inference_executions_request)

let event_duration_in_seconds_of_yojson = long_of_yojson

let inference_event_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_duration_in_seconds =
       option_of_yojson
         (value_for_key event_duration_in_seconds_of_yojson "EventDurationInSeconds")
         _list path;
     diagnostics = option_of_yojson (value_for_key model_metrics_of_yojson "Diagnostics") _list path;
     event_end_time = option_of_yojson (value_for_key timestamp_of_yojson "EventEndTime") _list path;
     event_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EventStartTime") _list path;
     inference_scheduler_name =
       option_of_yojson
         (value_for_key inference_scheduler_name_of_yojson "InferenceSchedulerName")
         _list path;
     inference_scheduler_arn =
       option_of_yojson
         (value_for_key inference_scheduler_arn_of_yojson "InferenceSchedulerArn")
         _list path;
   }
    : inference_event_summary)

let inference_event_summaries_of_yojson tree path =
  list_of_yojson inference_event_summary_of_yojson tree path

let list_inference_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_event_summaries =
       option_of_yojson
         (value_for_key inference_event_summaries_of_yojson "InferenceEventSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_inference_events_response)

let list_inference_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     interval_end_time = value_for_key timestamp_of_yojson "IntervalEndTime" _list path;
     interval_start_time = value_for_key timestamp_of_yojson "IntervalStartTime" _list path;
     inference_scheduler_name =
       value_for_key inference_scheduler_identifier_of_yojson "InferenceSchedulerName" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_inference_events_request)

let dataset_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "IMPORT_IN_PROGRESS" -> IMPORT_IN_PROGRESS
    | `String "ACTIVE" -> ACTIVE
    | `String "INGESTION_IN_PROGRESS" -> INGESTION_IN_PROGRESS
    | `String "CREATED" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "DatasetStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "DatasetStatus")
     : dataset_status)
    : dataset_status)

let dataset_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     status = option_of_yojson (value_for_key dataset_status_of_yojson "Status") _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
   }
    : dataset_summary)

let dataset_summaries_of_yojson tree path = list_of_yojson dataset_summary_of_yojson tree path

let list_datasets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_summaries =
       option_of_yojson (value_for_key dataset_summaries_of_yojson "DatasetSummaries") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_datasets_response)

let list_datasets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dataset_name_begins_with =
       option_of_yojson (value_for_key dataset_name_of_yojson "DatasetNameBeginsWith") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_datasets_request)

let data_ingestion_job_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key ingestion_job_status_of_yojson "Status") _list path;
     ingestion_input_configuration =
       option_of_yojson
         (value_for_key ingestion_input_configuration_of_yojson "IngestionInputConfiguration")
         _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
     job_id = option_of_yojson (value_for_key ingestion_job_id_of_yojson "JobId") _list path;
   }
    : data_ingestion_job_summary)

let data_ingestion_job_summaries_of_yojson tree path =
  list_of_yojson data_ingestion_job_summary_of_yojson tree path

let list_data_ingestion_jobs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_ingestion_job_summaries =
       option_of_yojson
         (value_for_key data_ingestion_job_summaries_of_yojson "DataIngestionJobSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_data_ingestion_jobs_response)

let list_data_ingestion_jobs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key ingestion_job_status_of_yojson "Status") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
   }
    : list_data_ingestion_jobs_request)

let kms_key_arn_of_yojson = string_of_yojson

let invalid_sensor_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_number_of_invalid_values =
       value_for_key integer_of_yojson "TotalNumberOfInvalidValues" _list path;
     affected_sensor_count = value_for_key integer_of_yojson "AffectedSensorCount" _list path;
   }
    : invalid_sensor_data)

let insufficient_sensor_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sensors_with_short_date_range =
       value_for_key sensors_with_short_date_range_of_yojson "SensorsWithShortDateRange" _list path;
     missing_complete_sensor_data =
       value_for_key missing_complete_sensor_data_of_yojson "MissingCompleteSensorData" _list path;
   }
    : insufficient_sensor_data)

let inline_data_schema_of_yojson = string_of_yojson

let ingested_files_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     discarded_files =
       option_of_yojson
         (value_for_key list_of_discarded_files_of_yojson "DiscardedFiles")
         _list path;
     ingested_number_of_files = value_for_key integer_of_yojson "IngestedNumberOfFiles" _list path;
     total_number_of_files = value_for_key integer_of_yojson "TotalNumberOfFiles" _list path;
   }
    : ingested_files_summary)

let inference_data_import_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "OVERWRITE" -> OVERWRITE
    | `String "ADD_WHEN_EMPTY" -> ADD_WHEN_EMPTY
    | `String "NO_IMPORT" -> NO_IMPORT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InferenceDataImportStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "InferenceDataImportStrategy")
     : inference_data_import_strategy)
    : inference_data_import_strategy)

let import_model_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key model_version_status_of_yojson "Status") _list path;
     model_version =
       option_of_yojson (value_for_key model_version_of_yojson "ModelVersion") _list path;
     model_version_arn =
       option_of_yojson (value_for_key model_version_arn_of_yojson "ModelVersionArn") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : import_model_version_response)

let import_model_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_data_import_strategy =
       option_of_yojson
         (value_for_key inference_data_import_strategy_of_yojson "InferenceDataImportStrategy")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key name_or_arn_of_yojson "ServerSideKmsKeyId") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     labels_input_configuration =
       option_of_yojson
         (value_for_key labels_input_configuration_of_yojson "LabelsInputConfiguration")
         _list path;
     dataset_name = value_for_key dataset_identifier_of_yojson "DatasetName" _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
     source_model_version_arn =
       value_for_key model_version_arn_of_yojson "SourceModelVersionArn" _list path;
   }
    : import_model_version_request)

let import_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     job_id = option_of_yojson (value_for_key ingestion_job_id_of_yojson "JobId") _list path;
     status = option_of_yojson (value_for_key dataset_status_of_yojson "Status") _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
   }
    : import_dataset_response)

let import_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key name_or_arn_of_yojson "ServerSideKmsKeyId") _list path;
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
     source_dataset_arn = value_for_key dataset_arn_of_yojson "SourceDatasetArn" _list path;
   }
    : import_dataset_request)

let duplicate_timestamps_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_number_of_duplicate_timestamps =
       value_for_key integer_of_yojson "TotalNumberOfDuplicateTimestamps" _list path;
   }
    : duplicate_timestamps)

let describe_retraining_scheduler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     promote_mode =
       option_of_yojson (value_for_key model_promote_mode_of_yojson "PromoteMode") _list path;
     status =
       option_of_yojson (value_for_key retraining_scheduler_status_of_yojson "Status") _list path;
     lookback_window =
       option_of_yojson (value_for_key lookback_window_of_yojson "LookbackWindow") _list path;
     retraining_frequency =
       option_of_yojson
         (value_for_key retraining_frequency_of_yojson "RetrainingFrequency")
         _list path;
     retraining_start_date =
       option_of_yojson (value_for_key timestamp_of_yojson "RetrainingStartDate") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : describe_retraining_scheduler_response)

let describe_retraining_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ model_name = value_for_key model_name_of_yojson "ModelName" _list path }
    : describe_retraining_scheduler_request)

let describe_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_modified_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastModifiedTime") _list path;
     creation_time = option_of_yojson (value_for_key timestamp_of_yojson "CreationTime") _list path;
     resource_policy = option_of_yojson (value_for_key policy_of_yojson "ResourcePolicy") _list path;
     policy_revision_id =
       option_of_yojson (value_for_key policy_revision_id_of_yojson "PolicyRevisionId") _list path;
   }
    : describe_resource_policy_response)

let describe_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : describe_resource_policy_request)

let data_pre_processing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_sampling_rate =
       option_of_yojson
         (value_for_key target_sampling_rate_of_yojson "TargetSamplingRate")
         _list path;
   }
    : data_pre_processing_configuration)

let data_size_in_bytes_of_yojson = long_of_yojson

let auto_promotion_result_of_yojson (tree : t) path =
  ((match tree with
    | `String "RETRAINING_CANCELLED" -> RETRAINING_CANCELLED
    | `String "RETRAINING_CUSTOMER_ERROR" -> RETRAINING_CUSTOMER_ERROR
    | `String "RETRAINING_INTERNAL_ERROR" -> RETRAINING_INTERNAL_ERROR
    | `String "MODEL_NOT_PROMOTED" -> MODEL_NOT_PROMOTED
    | `String "MODEL_PROMOTED" -> MODEL_PROMOTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoPromotionResult" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoPromotionResult")
     : auto_promotion_result)
    : auto_promotion_result)

let auto_promotion_result_reason_of_yojson = string_of_yojson

let describe_model_version_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_quality =
       option_of_yojson (value_for_key model_quality_of_yojson "ModelQuality") _list path;
     model_diagnostics_results_object =
       option_of_yojson
         (value_for_key s3_object_of_yojson "ModelDiagnosticsResultsObject")
         _list path;
     model_diagnostics_output_configuration =
       option_of_yojson
         (value_for_key model_diagnostics_output_configuration_of_yojson
            "ModelDiagnosticsOutputConfiguration")
         _list path;
     auto_promotion_result_reason =
       option_of_yojson
         (value_for_key auto_promotion_result_reason_of_yojson "AutoPromotionResultReason")
         _list path;
     auto_promotion_result =
       option_of_yojson
         (value_for_key auto_promotion_result_of_yojson "AutoPromotionResult")
         _list path;
     retraining_available_data_in_days =
       option_of_yojson (value_for_key integer_of_yojson "RetrainingAvailableDataInDays") _list path;
     prior_model_metrics =
       option_of_yojson (value_for_key model_metrics_of_yojson "PriorModelMetrics") _list path;
     imported_data_size_in_bytes =
       option_of_yojson
         (value_for_key data_size_in_bytes_of_yojson "ImportedDataSizeInBytes")
         _list path;
     import_job_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ImportJobEndTime") _list path;
     import_job_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ImportJobStartTime") _list path;
     source_model_version_arn =
       option_of_yojson
         (value_for_key model_version_arn_of_yojson "SourceModelVersionArn")
         _list path;
     off_condition =
       option_of_yojson (value_for_key off_condition_of_yojson "OffCondition") _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key kms_key_arn_of_yojson "ServerSideKmsKeyId") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     model_metrics =
       option_of_yojson (value_for_key model_metrics_of_yojson "ModelMetrics") _list path;
     failed_reason =
       option_of_yojson (value_for_key bounded_length_string_of_yojson "FailedReason") _list path;
     training_execution_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingExecutionEndTime") _list path;
     training_execution_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingExecutionStartTime") _list path;
     data_pre_processing_configuration =
       option_of_yojson
         (value_for_key data_pre_processing_configuration_of_yojson "DataPreProcessingConfiguration")
         _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     evaluation_data_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EvaluationDataEndTime") _list path;
     evaluation_data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EvaluationDataStartTime") _list path;
     training_data_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingDataEndTime") _list path;
     training_data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingDataStartTime") _list path;
     labels_input_configuration =
       option_of_yojson
         (value_for_key labels_input_configuration_of_yojson "LabelsInputConfiguration")
         _list path;
     schema = option_of_yojson (value_for_key inline_data_schema_of_yojson "Schema") _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
     source_type =
       option_of_yojson (value_for_key model_version_source_type_of_yojson "SourceType") _list path;
     status = option_of_yojson (value_for_key model_version_status_of_yojson "Status") _list path;
     model_version_arn =
       option_of_yojson (value_for_key model_version_arn_of_yojson "ModelVersionArn") _list path;
     model_version =
       option_of_yojson (value_for_key model_version_of_yojson "ModelVersion") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : describe_model_version_response)

let describe_model_version_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_version = value_for_key model_version_of_yojson "ModelVersion" _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
   }
    : describe_model_version_request)

let describe_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_quality =
       option_of_yojson (value_for_key model_quality_of_yojson "ModelQuality") _list path;
     model_diagnostics_output_configuration =
       option_of_yojson
         (value_for_key model_diagnostics_output_configuration_of_yojson
            "ModelDiagnosticsOutputConfiguration")
         _list path;
     retraining_scheduler_status =
       option_of_yojson
         (value_for_key retraining_scheduler_status_of_yojson "RetrainingSchedulerStatus")
         _list path;
     accumulated_inference_data_end_time =
       option_of_yojson
         (value_for_key timestamp_of_yojson "AccumulatedInferenceDataEndTime")
         _list path;
     accumulated_inference_data_start_time =
       option_of_yojson
         (value_for_key timestamp_of_yojson "AccumulatedInferenceDataStartTime")
         _list path;
     next_scheduled_retraining_start_date =
       option_of_yojson
         (value_for_key timestamp_of_yojson "NextScheduledRetrainingStartDate")
         _list path;
     latest_scheduled_retraining_available_data_in_days =
       option_of_yojson
         (value_for_key integer_of_yojson "LatestScheduledRetrainingAvailableDataInDays")
         _list path;
     latest_scheduled_retraining_start_time =
       option_of_yojson
         (value_for_key timestamp_of_yojson "LatestScheduledRetrainingStartTime")
         _list path;
     latest_scheduled_retraining_model_version =
       option_of_yojson
         (value_for_key model_version_of_yojson "LatestScheduledRetrainingModelVersion")
         _list path;
     latest_scheduled_retraining_status =
       option_of_yojson
         (value_for_key model_version_status_of_yojson "LatestScheduledRetrainingStatus")
         _list path;
     latest_scheduled_retraining_failed_reason =
       option_of_yojson
         (value_for_key bounded_length_string_of_yojson "LatestScheduledRetrainingFailedReason")
         _list path;
     prior_model_metrics =
       option_of_yojson
         (value_for_key synthesized_json_model_metrics_of_yojson "PriorModelMetrics")
         _list path;
     previous_model_version_activated_at =
       option_of_yojson
         (value_for_key timestamp_of_yojson "PreviousModelVersionActivatedAt")
         _list path;
     previous_active_model_version_arn =
       option_of_yojson
         (value_for_key model_version_arn_of_yojson "PreviousActiveModelVersionArn")
         _list path;
     previous_active_model_version =
       option_of_yojson
         (value_for_key model_version_of_yojson "PreviousActiveModelVersion")
         _list path;
     model_version_activated_at =
       option_of_yojson (value_for_key timestamp_of_yojson "ModelVersionActivatedAt") _list path;
     active_model_version_arn =
       option_of_yojson
         (value_for_key model_version_arn_of_yojson "ActiveModelVersionArn")
         _list path;
     active_model_version =
       option_of_yojson (value_for_key model_version_of_yojson "ActiveModelVersion") _list path;
     import_job_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ImportJobEndTime") _list path;
     import_job_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "ImportJobStartTime") _list path;
     source_model_version_arn =
       option_of_yojson
         (value_for_key model_version_arn_of_yojson "SourceModelVersionArn")
         _list path;
     off_condition =
       option_of_yojson (value_for_key off_condition_of_yojson "OffCondition") _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key kms_key_arn_of_yojson "ServerSideKmsKeyId") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     last_updated_time =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedTime") _list path;
     model_metrics =
       option_of_yojson
         (value_for_key synthesized_json_model_metrics_of_yojson "ModelMetrics")
         _list path;
     failed_reason =
       option_of_yojson (value_for_key bounded_length_string_of_yojson "FailedReason") _list path;
     training_execution_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingExecutionEndTime") _list path;
     training_execution_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingExecutionStartTime") _list path;
     status = option_of_yojson (value_for_key model_status_of_yojson "Status") _list path;
     data_pre_processing_configuration =
       option_of_yojson
         (value_for_key data_pre_processing_configuration_of_yojson "DataPreProcessingConfiguration")
         _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     evaluation_data_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EvaluationDataEndTime") _list path;
     evaluation_data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EvaluationDataStartTime") _list path;
     training_data_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingDataEndTime") _list path;
     training_data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingDataStartTime") _list path;
     labels_input_configuration =
       option_of_yojson
         (value_for_key labels_input_configuration_of_yojson "LabelsInputConfiguration")
         _list path;
     schema =
       option_of_yojson
         (value_for_key synthesized_json_inline_data_schema_of_yojson "Schema")
         _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : describe_model_response)

let describe_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ model_name = value_for_key model_name_of_yojson "ModelName" _list path }
    : describe_model_request)

let comments_of_yojson = string_of_yojson

let describe_label_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     equipment = option_of_yojson (value_for_key equipment_of_yojson "Equipment") _list path;
     notes = option_of_yojson (value_for_key comments_of_yojson "Notes") _list path;
     fault_code = option_of_yojson (value_for_key fault_code_of_yojson "FaultCode") _list path;
     rating = option_of_yojson (value_for_key label_rating_of_yojson "Rating") _list path;
     end_time = option_of_yojson (value_for_key timestamp_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key timestamp_of_yojson "StartTime") _list path;
     label_id = option_of_yojson (value_for_key label_id_of_yojson "LabelId") _list path;
     label_group_arn =
       option_of_yojson (value_for_key label_group_arn_of_yojson "LabelGroupArn") _list path;
     label_group_name =
       option_of_yojson (value_for_key label_group_name_of_yojson "LabelGroupName") _list path;
   }
    : describe_label_response)

let describe_label_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_id = value_for_key label_id_of_yojson "LabelId" _list path;
     label_group_name = value_for_key label_group_name_of_yojson "LabelGroupName" _list path;
   }
    : describe_label_request)

let describe_label_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     fault_codes = option_of_yojson (value_for_key fault_codes_of_yojson "FaultCodes") _list path;
     label_group_arn =
       option_of_yojson (value_for_key label_group_arn_of_yojson "LabelGroupArn") _list path;
     label_group_name =
       option_of_yojson (value_for_key label_group_name_of_yojson "LabelGroupName") _list path;
   }
    : describe_label_group_response)

let describe_label_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ label_group_name = value_for_key label_group_name_of_yojson "LabelGroupName" _list path }
    : describe_label_group_request)

let describe_inference_scheduler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_inference_result =
       option_of_yojson
         (value_for_key latest_inference_result_of_yojson "LatestInferenceResult")
         _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key kms_key_arn_of_yojson "ServerSideKmsKeyId") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     data_output_configuration =
       option_of_yojson
         (value_for_key inference_output_configuration_of_yojson "DataOutputConfiguration")
         _list path;
     data_input_configuration =
       option_of_yojson
         (value_for_key inference_input_configuration_of_yojson "DataInputConfiguration")
         _list path;
     updated_at = option_of_yojson (value_for_key timestamp_of_yojson "UpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     data_upload_frequency =
       option_of_yojson
         (value_for_key data_upload_frequency_of_yojson "DataUploadFrequency")
         _list path;
     data_delay_offset_in_minutes =
       option_of_yojson
         (value_for_key data_delay_offset_in_minutes_of_yojson "DataDelayOffsetInMinutes")
         _list path;
     status =
       option_of_yojson (value_for_key inference_scheduler_status_of_yojson "Status") _list path;
     inference_scheduler_arn =
       option_of_yojson
         (value_for_key inference_scheduler_arn_of_yojson "InferenceSchedulerArn")
         _list path;
     inference_scheduler_name =
       option_of_yojson
         (value_for_key inference_scheduler_name_of_yojson "InferenceSchedulerName")
         _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
   }
    : describe_inference_scheduler_response)

let describe_inference_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_scheduler_name =
       value_for_key inference_scheduler_identifier_of_yojson "InferenceSchedulerName" _list path;
   }
    : describe_inference_scheduler_request)

let data_quality_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duplicate_timestamps =
       value_for_key duplicate_timestamps_of_yojson "DuplicateTimestamps" _list path;
     unsupported_timestamps =
       value_for_key unsupported_timestamps_of_yojson "UnsupportedTimestamps" _list path;
     invalid_sensor_data =
       value_for_key invalid_sensor_data_of_yojson "InvalidSensorData" _list path;
     missing_sensor_data =
       value_for_key missing_sensor_data_of_yojson "MissingSensorData" _list path;
     insufficient_sensor_data =
       value_for_key insufficient_sensor_data_of_yojson "InsufficientSensorData" _list path;
   }
    : data_quality_summary)

let describe_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_dataset_arn =
       option_of_yojson (value_for_key dataset_arn_of_yojson "SourceDatasetArn") _list path;
     data_end_time = option_of_yojson (value_for_key timestamp_of_yojson "DataEndTime") _list path;
     data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "DataStartTime") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     ingested_files_summary =
       option_of_yojson
         (value_for_key ingested_files_summary_of_yojson "IngestedFilesSummary")
         _list path;
     data_quality_summary =
       option_of_yojson
         (value_for_key data_quality_summary_of_yojson "DataQualitySummary")
         _list path;
     ingestion_input_configuration =
       option_of_yojson
         (value_for_key ingestion_input_configuration_of_yojson "IngestionInputConfiguration")
         _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key kms_key_arn_of_yojson "ServerSideKmsKeyId") _list path;
     schema =
       option_of_yojson
         (value_for_key synthesized_json_inline_data_schema_of_yojson "Schema")
         _list path;
     status = option_of_yojson (value_for_key dataset_status_of_yojson "Status") _list path;
     last_updated_at =
       option_of_yojson (value_for_key timestamp_of_yojson "LastUpdatedAt") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
   }
    : describe_dataset_response)

let describe_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_name = value_for_key dataset_identifier_of_yojson "DatasetName" _list path }
    : describe_dataset_request)

let describe_data_ingestion_job_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_dataset_arn =
       option_of_yojson (value_for_key dataset_arn_of_yojson "SourceDatasetArn") _list path;
     data_end_time = option_of_yojson (value_for_key timestamp_of_yojson "DataEndTime") _list path;
     data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "DataStartTime") _list path;
     ingested_data_size =
       option_of_yojson (value_for_key data_size_in_bytes_of_yojson "IngestedDataSize") _list path;
     status_detail =
       option_of_yojson (value_for_key bounded_length_string_of_yojson "StatusDetail") _list path;
     ingested_files_summary =
       option_of_yojson
         (value_for_key ingested_files_summary_of_yojson "IngestedFilesSummary")
         _list path;
     data_quality_summary =
       option_of_yojson
         (value_for_key data_quality_summary_of_yojson "DataQualitySummary")
         _list path;
     failed_reason =
       option_of_yojson (value_for_key bounded_length_string_of_yojson "FailedReason") _list path;
     status = option_of_yojson (value_for_key ingestion_job_status_of_yojson "Status") _list path;
     created_at = option_of_yojson (value_for_key timestamp_of_yojson "CreatedAt") _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     ingestion_input_configuration =
       option_of_yojson
         (value_for_key ingestion_input_configuration_of_yojson "IngestionInputConfiguration")
         _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     job_id = option_of_yojson (value_for_key ingestion_job_id_of_yojson "JobId") _list path;
   }
    : describe_data_ingestion_job_response)

let describe_data_ingestion_job_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ job_id = value_for_key ingestion_job_id_of_yojson "JobId" _list path }
    : describe_data_ingestion_job_request)

let delete_retraining_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ model_name = value_for_key model_name_of_yojson "ModelName" _list path }
    : delete_retraining_scheduler_request)

let delete_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "ResourceArn" _list path }
    : delete_resource_policy_request)

let delete_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ model_name = value_for_key model_name_of_yojson "ModelName" _list path }
    : delete_model_request)

let delete_label_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_id = value_for_key label_id_of_yojson "LabelId" _list path;
     label_group_name = value_for_key label_group_name_of_yojson "LabelGroupName" _list path;
   }
    : delete_label_request)

let delete_label_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ label_group_name = value_for_key label_group_name_of_yojson "LabelGroupName" _list path }
    : delete_label_group_request)

let delete_inference_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inference_scheduler_name =
       value_for_key inference_scheduler_identifier_of_yojson "InferenceSchedulerName" _list path;
   }
    : delete_inference_scheduler_request)

let delete_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ dataset_name = value_for_key dataset_identifier_of_yojson "DatasetName" _list path }
    : delete_dataset_request)

let dataset_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inline_data_schema =
       option_of_yojson
         (value_for_key synthesized_json_inline_data_schema_of_yojson "InlineDataSchema")
         _list path;
   }
    : dataset_schema)

let create_retraining_scheduler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       option_of_yojson (value_for_key retraining_scheduler_status_of_yojson "Status") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
     model_name = option_of_yojson (value_for_key model_name_of_yojson "ModelName") _list path;
   }
    : create_retraining_scheduler_response)

let create_retraining_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     promote_mode =
       option_of_yojson (value_for_key model_promote_mode_of_yojson "PromoteMode") _list path;
     lookback_window = value_for_key lookback_window_of_yojson "LookbackWindow" _list path;
     retraining_frequency =
       value_for_key retraining_frequency_of_yojson "RetrainingFrequency" _list path;
     retraining_start_date =
       option_of_yojson (value_for_key timestamp_of_yojson "RetrainingStartDate") _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
   }
    : create_retraining_scheduler_request)

let create_model_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key model_status_of_yojson "Status") _list path;
     model_arn = option_of_yojson (value_for_key model_arn_of_yojson "ModelArn") _list path;
   }
    : create_model_response)

let create_model_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_diagnostics_output_configuration =
       option_of_yojson
         (value_for_key model_diagnostics_output_configuration_of_yojson
            "ModelDiagnosticsOutputConfiguration")
         _list path;
     off_condition =
       option_of_yojson (value_for_key off_condition_of_yojson "OffCondition") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key name_or_arn_of_yojson "ServerSideKmsKeyId") _list path;
     data_pre_processing_configuration =
       option_of_yojson
         (value_for_key data_pre_processing_configuration_of_yojson "DataPreProcessingConfiguration")
         _list path;
     role_arn = option_of_yojson (value_for_key iam_role_arn_of_yojson "RoleArn") _list path;
     evaluation_data_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EvaluationDataEndTime") _list path;
     evaluation_data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "EvaluationDataStartTime") _list path;
     training_data_end_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingDataEndTime") _list path;
     training_data_start_time =
       option_of_yojson (value_for_key timestamp_of_yojson "TrainingDataStartTime") _list path;
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     labels_input_configuration =
       option_of_yojson
         (value_for_key labels_input_configuration_of_yojson "LabelsInputConfiguration")
         _list path;
     dataset_schema =
       option_of_yojson (value_for_key dataset_schema_of_yojson "DatasetSchema") _list path;
     dataset_name = value_for_key dataset_identifier_of_yojson "DatasetName" _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
   }
    : create_model_request)

let create_label_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ label_id = option_of_yojson (value_for_key label_id_of_yojson "LabelId") _list path }
    : create_label_response)

let create_label_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     equipment = option_of_yojson (value_for_key equipment_of_yojson "Equipment") _list path;
     notes = option_of_yojson (value_for_key comments_of_yojson "Notes") _list path;
     fault_code = option_of_yojson (value_for_key fault_code_of_yojson "FaultCode") _list path;
     rating = value_for_key label_rating_of_yojson "Rating" _list path;
     end_time = value_for_key timestamp_of_yojson "EndTime" _list path;
     start_time = value_for_key timestamp_of_yojson "StartTime" _list path;
     label_group_name = value_for_key label_group_name_of_yojson "LabelGroupName" _list path;
   }
    : create_label_request)

let create_label_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label_group_arn =
       option_of_yojson (value_for_key label_group_arn_of_yojson "LabelGroupArn") _list path;
     label_group_name =
       option_of_yojson (value_for_key label_group_name_of_yojson "LabelGroupName") _list path;
   }
    : create_label_group_response)

let create_label_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     fault_codes = option_of_yojson (value_for_key fault_codes_of_yojson "FaultCodes") _list path;
     label_group_name = value_for_key label_group_name_of_yojson "LabelGroupName" _list path;
   }
    : create_label_group_request)

let create_inference_scheduler_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     model_quality =
       option_of_yojson (value_for_key model_quality_of_yojson "ModelQuality") _list path;
     status =
       option_of_yojson (value_for_key inference_scheduler_status_of_yojson "Status") _list path;
     inference_scheduler_name =
       option_of_yojson
         (value_for_key inference_scheduler_name_of_yojson "InferenceSchedulerName")
         _list path;
     inference_scheduler_arn =
       option_of_yojson
         (value_for_key inference_scheduler_arn_of_yojson "InferenceSchedulerArn")
         _list path;
   }
    : create_inference_scheduler_response)

let create_inference_scheduler_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key name_or_arn_of_yojson "ServerSideKmsKeyId") _list path;
     role_arn = value_for_key iam_role_arn_of_yojson "RoleArn" _list path;
     data_output_configuration =
       value_for_key inference_output_configuration_of_yojson "DataOutputConfiguration" _list path;
     data_input_configuration =
       value_for_key inference_input_configuration_of_yojson "DataInputConfiguration" _list path;
     data_upload_frequency =
       value_for_key data_upload_frequency_of_yojson "DataUploadFrequency" _list path;
     data_delay_offset_in_minutes =
       option_of_yojson
         (value_for_key data_delay_offset_in_minutes_of_yojson "DataDelayOffsetInMinutes")
         _list path;
     inference_scheduler_name =
       value_for_key inference_scheduler_name_of_yojson "InferenceSchedulerName" _list path;
     model_name = value_for_key model_name_of_yojson "ModelName" _list path;
   }
    : create_inference_scheduler_request)

let create_dataset_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key dataset_status_of_yojson "Status") _list path;
     dataset_arn = option_of_yojson (value_for_key dataset_arn_of_yojson "DatasetArn") _list path;
     dataset_name = option_of_yojson (value_for_key dataset_name_of_yojson "DatasetName") _list path;
   }
    : create_dataset_response)

let create_dataset_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = value_for_key idempotence_token_of_yojson "ClientToken" _list path;
     server_side_kms_key_id =
       option_of_yojson (value_for_key name_or_arn_of_yojson "ServerSideKmsKeyId") _list path;
     dataset_schema =
       option_of_yojson (value_for_key dataset_schema_of_yojson "DatasetSchema") _list path;
     dataset_name = value_for_key dataset_name_of_yojson "DatasetName" _list path;
   }
    : create_dataset_request)
