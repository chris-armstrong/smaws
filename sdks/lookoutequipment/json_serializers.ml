open Smaws_Lib.Json.SerializeHelpers
open Types

let bounded_length_string_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

let model_name_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let retraining_frequency_to_yojson = string_to_yojson
let lookback_window_to_yojson = string_to_yojson

let model_promote_mode_to_yojson (x : model_promote_mode) =
  match x with MANUAL -> `String "MANUAL" | MANAGED -> `String "MANAGED"

let update_retraining_scheduler_request_to_yojson (x : update_retraining_scheduler_request) =
  assoc_to_yojson
    [
      ("PromoteMode", option_to_yojson model_promote_mode_to_yojson x.promote_mode);
      ("LookbackWindow", option_to_yojson lookback_window_to_yojson x.lookback_window);
      ("RetrainingFrequency", option_to_yojson retraining_frequency_to_yojson x.retraining_frequency);
      ("RetrainingStartDate", option_to_yojson timestamp_to_yojson x.retraining_start_date);
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

let s3_bucket_to_yojson = string_to_yojson
let s3_prefix_to_yojson = string_to_yojson

let labels_s3_input_configuration_to_yojson (x : labels_s3_input_configuration) =
  assoc_to_yojson
    [
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
    ]

let label_group_name_to_yojson = string_to_yojson

let labels_input_configuration_to_yojson (x : labels_input_configuration) =
  assoc_to_yojson
    [
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
      ( "S3InputConfiguration",
        option_to_yojson labels_s3_input_configuration_to_yojson x.s3_input_configuration );
    ]

let iam_role_arn_to_yojson = string_to_yojson

let model_diagnostics_s3_output_configuration_to_yojson
    (x : model_diagnostics_s3_output_configuration) =
  assoc_to_yojson
    [
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
    ]

let name_or_arn_to_yojson = string_to_yojson

let model_diagnostics_output_configuration_to_yojson (x : model_diagnostics_output_configuration) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson name_or_arn_to_yojson x.kms_key_id);
      ( "S3OutputConfiguration",
        Some (model_diagnostics_s3_output_configuration_to_yojson x.s3_output_configuration) );
    ]

let update_model_request_to_yojson (x : update_model_request) =
  assoc_to_yojson
    [
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let fault_code_to_yojson = string_to_yojson
let fault_codes_to_yojson tree = list_to_yojson fault_code_to_yojson tree

let update_label_group_request_to_yojson (x : update_label_group_request) =
  assoc_to_yojson
    [
      ("FaultCodes", option_to_yojson fault_codes_to_yojson x.fault_codes);
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
    ]

let inference_scheduler_identifier_to_yojson = string_to_yojson
let data_delay_offset_in_minutes_to_yojson = long_to_yojson

let data_upload_frequency_to_yojson (x : data_upload_frequency) =
  match x with
  | PT1H -> `String "PT1H"
  | PT30M -> `String "PT30M"
  | PT15M -> `String "PT15M"
  | PT10M -> `String "PT10M"
  | PT5M -> `String "PT5M"

let inference_s3_input_configuration_to_yojson (x : inference_s3_input_configuration) =
  assoc_to_yojson
    [
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
    ]

let time_zone_offset_to_yojson = string_to_yojson
let file_name_timestamp_format_to_yojson = string_to_yojson
let component_timestamp_delimiter_to_yojson = string_to_yojson

let inference_input_name_configuration_to_yojson (x : inference_input_name_configuration) =
  assoc_to_yojson
    [
      ( "ComponentTimestampDelimiter",
        option_to_yojson component_timestamp_delimiter_to_yojson x.component_timestamp_delimiter );
      ("TimestampFormat", option_to_yojson file_name_timestamp_format_to_yojson x.timestamp_format);
    ]

let inference_input_configuration_to_yojson (x : inference_input_configuration) =
  assoc_to_yojson
    [
      ( "InferenceInputNameConfiguration",
        option_to_yojson inference_input_name_configuration_to_yojson
          x.inference_input_name_configuration );
      ("InputTimeZoneOffset", option_to_yojson time_zone_offset_to_yojson x.input_time_zone_offset);
      ( "S3InputConfiguration",
        option_to_yojson inference_s3_input_configuration_to_yojson x.s3_input_configuration );
    ]

let inference_s3_output_configuration_to_yojson (x : inference_s3_output_configuration) =
  assoc_to_yojson
    [
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
    ]

let inference_output_configuration_to_yojson (x : inference_output_configuration) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson name_or_arn_to_yojson x.kms_key_id);
      ( "S3OutputConfiguration",
        Some (inference_s3_output_configuration_to_yojson x.s3_output_configuration) );
    ]

let update_inference_scheduler_request_to_yojson (x : update_inference_scheduler_request) =
  assoc_to_yojson
    [
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "DataOutputConfiguration",
        option_to_yojson inference_output_configuration_to_yojson x.data_output_configuration );
      ( "DataInputConfiguration",
        option_to_yojson inference_input_configuration_to_yojson x.data_input_configuration );
      ( "DataUploadFrequency",
        option_to_yojson data_upload_frequency_to_yojson x.data_upload_frequency );
      ( "DataDelayOffsetInMinutes",
        option_to_yojson data_delay_offset_in_minutes_to_yojson x.data_delay_offset_in_minutes );
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let model_arn_to_yojson = string_to_yojson
let model_version_to_yojson = long_to_yojson
let model_version_arn_to_yojson = string_to_yojson

let update_active_model_version_response_to_yojson (x : update_active_model_version_response) =
  assoc_to_yojson
    [
      ( "PreviousActiveVersionArn",
        option_to_yojson model_version_arn_to_yojson x.previous_active_version_arn );
      ( "CurrentActiveVersionArn",
        option_to_yojson model_version_arn_to_yojson x.current_active_version_arn );
      ("PreviousActiveVersion", option_to_yojson model_version_to_yojson x.previous_active_version);
      ("CurrentActiveVersion", option_to_yojson model_version_to_yojson x.current_active_version);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let update_active_model_version_request_to_yojson (x : update_active_model_version_request) =
  assoc_to_yojson
    [
      ("ModelVersion", Some (model_version_to_yojson x.model_version));
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (amazon_resource_arn_to_yojson x.resource_arn));
    ]

let integer_to_yojson = int_to_yojson

let unsupported_timestamps_to_yojson (x : unsupported_timestamps) =
  assoc_to_yojson
    [
      ( "TotalNumberOfUnsupportedTimestamps",
        Some (integer_to_yojson x.total_number_of_unsupported_timestamps) );
    ]

let target_sampling_rate_to_yojson (x : target_sampling_rate) =
  match x with
  | PT1H -> `String "PT1H"
  | PT30M -> `String "PT30M"
  | PT15M -> `String "PT15M"
  | PT10M -> `String "PT10M"
  | PT5M -> `String "PT5M"
  | PT1M -> `String "PT1M"
  | PT30S -> `String "PT30S"
  | PT15S -> `String "PT15S"
  | PT10S -> `String "PT10S"
  | PT5S -> `String "PT5S"
  | PT1S -> `String "PT1S"

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceArn", Some (amazon_resource_arn_to_yojson x.resource_arn));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

let synthesized_json_model_metrics_to_yojson = string_to_yojson
let synthesized_json_inline_data_schema_to_yojson = string_to_yojson

let retraining_scheduler_status_to_yojson (x : retraining_scheduler_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | RUNNING -> `String "RUNNING"
  | PENDING -> `String "PENDING"

let stop_retraining_scheduler_response_to_yojson (x : stop_retraining_scheduler_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let stop_retraining_scheduler_request_to_yojson (x : stop_retraining_scheduler_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let inference_scheduler_name_to_yojson = string_to_yojson
let inference_scheduler_arn_to_yojson = string_to_yojson

let inference_scheduler_status_to_yojson (x : inference_scheduler_status) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | RUNNING -> `String "RUNNING"
  | PENDING -> `String "PENDING"

let stop_inference_scheduler_response_to_yojson (x : stop_inference_scheduler_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
    ]

let stop_inference_scheduler_request_to_yojson (x : stop_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let statistical_issue_status_to_yojson (x : statistical_issue_status) =
  match x with
  | NO_ISSUE_DETECTED -> `String "NO_ISSUE_DETECTED"
  | POTENTIAL_ISSUE_DETECTED -> `String "POTENTIAL_ISSUE_DETECTED"

let start_retraining_scheduler_response_to_yojson (x : start_retraining_scheduler_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let start_retraining_scheduler_request_to_yojson (x : start_retraining_scheduler_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let start_inference_scheduler_response_to_yojson (x : start_inference_scheduler_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
    ]

let start_inference_scheduler_request_to_yojson (x : start_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let ingestion_job_id_to_yojson = string_to_yojson

let ingestion_job_status_to_yojson (x : ingestion_job_status) =
  match x with
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let start_data_ingestion_job_response_to_yojson (x : start_data_ingestion_job_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson ingestion_job_status_to_yojson x.status);
      ("JobId", option_to_yojson ingestion_job_id_to_yojson x.job_id);
    ]

let dataset_identifier_to_yojson = string_to_yojson
let key_pattern_to_yojson = string_to_yojson

let ingestion_s3_input_configuration_to_yojson (x : ingestion_s3_input_configuration) =
  assoc_to_yojson
    [
      ("KeyPattern", option_to_yojson key_pattern_to_yojson x.key_pattern);
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
    ]

let ingestion_input_configuration_to_yojson (x : ingestion_input_configuration) =
  assoc_to_yojson
    [
      ( "S3InputConfiguration",
        Some (ingestion_s3_input_configuration_to_yojson x.s3_input_configuration) );
    ]

let idempotence_token_to_yojson = string_to_yojson

let start_data_ingestion_job_request_to_yojson (x : start_data_ingestion_job_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ( "IngestionInputConfiguration",
        Some (ingestion_input_configuration_to_yojson x.ingestion_input_configuration) );
      ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name));
    ]

let sensors_with_short_date_range_to_yojson (x : sensors_with_short_date_range) =
  assoc_to_yojson [ ("AffectedSensorCount", Some (integer_to_yojson x.affected_sensor_count)) ]

let component_name_to_yojson = string_to_yojson
let sensor_name_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson
let float__to_yojson = float_to_yojson

let count_percent_to_yojson (x : count_percent) =
  assoc_to_yojson
    [
      ("Percentage", Some (float__to_yojson x.percentage));
      ("Count", Some (integer_to_yojson x.count));
    ]

let categorical_values_to_yojson (x : categorical_values) =
  assoc_to_yojson
    [
      ("NumberOfCategory", option_to_yojson integer_to_yojson x.number_of_category);
      ("Status", Some (statistical_issue_status_to_yojson x.status));
    ]

let multiple_operating_modes_to_yojson (x : multiple_operating_modes) =
  assoc_to_yojson [ ("Status", Some (statistical_issue_status_to_yojson x.status)) ]

let large_timestamp_gaps_to_yojson (x : large_timestamp_gaps) =
  assoc_to_yojson
    [
      ("MaxTimestampGapInDays", option_to_yojson integer_to_yojson x.max_timestamp_gap_in_days);
      ( "NumberOfLargeTimestampGaps",
        option_to_yojson integer_to_yojson x.number_of_large_timestamp_gaps );
      ("Status", Some (statistical_issue_status_to_yojson x.status));
    ]

let monotonicity_to_yojson (x : monotonicity) =
  match x with
  | STATIC -> `String "STATIC"
  | INCREASING -> `String "INCREASING"
  | DECREASING -> `String "DECREASING"

let monotonic_values_to_yojson (x : monotonic_values) =
  assoc_to_yojson
    [
      ("Monotonicity", option_to_yojson monotonicity_to_yojson x.monotonicity);
      ("Status", Some (statistical_issue_status_to_yojson x.status));
    ]

let sensor_statistics_summary_to_yojson (x : sensor_statistics_summary) =
  assoc_to_yojson
    [
      ("DataEndTime", option_to_yojson timestamp_to_yojson x.data_end_time);
      ("DataStartTime", option_to_yojson timestamp_to_yojson x.data_start_time);
      ("MonotonicValues", option_to_yojson monotonic_values_to_yojson x.monotonic_values);
      ("LargeTimestampGaps", option_to_yojson large_timestamp_gaps_to_yojson x.large_timestamp_gaps);
      ( "MultipleOperatingModes",
        option_to_yojson multiple_operating_modes_to_yojson x.multiple_operating_modes );
      ("CategoricalValues", option_to_yojson categorical_values_to_yojson x.categorical_values);
      ("DuplicateTimestamps", option_to_yojson count_percent_to_yojson x.duplicate_timestamps);
      ("InvalidDateEntries", option_to_yojson count_percent_to_yojson x.invalid_date_entries);
      ("InvalidValues", option_to_yojson count_percent_to_yojson x.invalid_values);
      ("MissingValues", option_to_yojson count_percent_to_yojson x.missing_values);
      ("DataExists", option_to_yojson boolean__to_yojson x.data_exists);
      ("SensorName", option_to_yojson sensor_name_to_yojson x.sensor_name);
      ("ComponentName", option_to_yojson component_name_to_yojson x.component_name);
    ]

let sensor_statistics_summaries_to_yojson tree =
  list_to_yojson sensor_statistics_summary_to_yojson tree

let s3_key_to_yojson = string_to_yojson

let s3_object_to_yojson (x : s3_object) =
  assoc_to_yojson
    [ ("Key", Some (s3_key_to_yojson x.key)); ("Bucket", Some (s3_bucket_to_yojson x.bucket)) ]

let retraining_scheduler_summary_to_yojson (x : retraining_scheduler_summary) =
  assoc_to_yojson
    [
      ("LookbackWindow", option_to_yojson lookback_window_to_yojson x.lookback_window);
      ("RetrainingFrequency", option_to_yojson retraining_frequency_to_yojson x.retraining_frequency);
      ("RetrainingStartDate", option_to_yojson timestamp_to_yojson x.retraining_start_date);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let retraining_scheduler_summaries_to_yojson tree =
  list_to_yojson retraining_scheduler_summary_to_yojson tree

let resource_arn_to_yojson = string_to_yojson
let policy_revision_id_to_yojson = string_to_yojson

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
    ]

let policy_to_yojson = string_to_yojson

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
      ("ResourcePolicy", Some (policy_to_yojson x.resource_policy));
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let off_condition_to_yojson = string_to_yojson
let next_token_to_yojson = string_to_yojson

let model_version_status_to_yojson (x : model_version_status) =
  match x with
  | CANCELED -> `String "CANCELED"
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let model_version_source_type_to_yojson (x : model_version_source_type) =
  match x with
  | IMPORT -> `String "IMPORT"
  | RETRAINING -> `String "RETRAINING"
  | TRAINING -> `String "TRAINING"

let model_quality_to_yojson (x : model_quality) =
  match x with
  | POOR_QUALITY_DETECTED -> `String "POOR_QUALITY_DETECTED"
  | CANNOT_DETERMINE_QUALITY -> `String "CANNOT_DETERMINE_QUALITY"
  | QUALITY_THRESHOLD_MET -> `String "QUALITY_THRESHOLD_MET"

let model_version_summary_to_yojson (x : model_version_summary) =
  assoc_to_yojson
    [
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
      ("SourceType", option_to_yojson model_version_source_type_to_yojson x.source_type);
      ("Status", option_to_yojson model_version_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("ModelVersionArn", option_to_yojson model_version_arn_to_yojson x.model_version_arn);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let model_version_summaries_to_yojson tree = list_to_yojson model_version_summary_to_yojson tree
let dataset_name_to_yojson = string_to_yojson
let dataset_arn_to_yojson = string_to_yojson

let model_status_to_yojson (x : model_status) =
  match x with
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let model_summary_to_yojson (x : model_summary) =
  assoc_to_yojson
    [
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
      ( "RetrainingSchedulerStatus",
        option_to_yojson retraining_scheduler_status_to_yojson x.retraining_scheduler_status );
      ( "NextScheduledRetrainingStartDate",
        option_to_yojson timestamp_to_yojson x.next_scheduled_retraining_start_date );
      ( "LatestScheduledRetrainingStartTime",
        option_to_yojson timestamp_to_yojson x.latest_scheduled_retraining_start_time );
      ( "LatestScheduledRetrainingModelVersion",
        option_to_yojson model_version_to_yojson x.latest_scheduled_retraining_model_version );
      ( "LatestScheduledRetrainingStatus",
        option_to_yojson model_version_status_to_yojson x.latest_scheduled_retraining_status );
      ( "ActiveModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.active_model_version_arn );
      ("ActiveModelVersion", option_to_yojson model_version_to_yojson x.active_model_version);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let model_summaries_to_yojson tree = list_to_yojson model_summary_to_yojson tree
let model_metrics_to_yojson = string_to_yojson

let missing_sensor_data_to_yojson (x : missing_sensor_data) =
  assoc_to_yojson
    [
      ("TotalNumberOfMissingValues", Some (integer_to_yojson x.total_number_of_missing_values));
      ("AffectedSensorCount", Some (integer_to_yojson x.affected_sensor_count));
    ]

let missing_complete_sensor_data_to_yojson (x : missing_complete_sensor_data) =
  assoc_to_yojson [ ("AffectedSensorCount", Some (integer_to_yojson x.affected_sensor_count)) ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_arn_to_yojson x.resource_arn)) ]

let list_sensor_statistics_response_to_yojson (x : list_sensor_statistics_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "SensorStatisticsSummaries",
        option_to_yojson sensor_statistics_summaries_to_yojson x.sensor_statistics_summaries );
    ]

let list_sensor_statistics_request_to_yojson (x : list_sensor_statistics_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("IngestionJobId", option_to_yojson ingestion_job_id_to_yojson x.ingestion_job_id);
      ("DatasetName", Some (dataset_name_to_yojson x.dataset_name));
    ]

let list_retraining_schedulers_response_to_yojson (x : list_retraining_schedulers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "RetrainingSchedulerSummaries",
        option_to_yojson retraining_scheduler_summaries_to_yojson x.retraining_scheduler_summaries
      );
    ]

let list_retraining_schedulers_request_to_yojson (x : list_retraining_schedulers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("ModelNameBeginsWith", option_to_yojson model_name_to_yojson x.model_name_begins_with);
    ]

let list_of_discarded_files_to_yojson tree = list_to_yojson s3_object_to_yojson tree

let list_models_response_to_yojson (x : list_models_response) =
  assoc_to_yojson
    [
      ("ModelSummaries", option_to_yojson model_summaries_to_yojson x.model_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_models_request_to_yojson (x : list_models_request) =
  assoc_to_yojson
    [
      ("DatasetNameBeginsWith", option_to_yojson dataset_name_to_yojson x.dataset_name_begins_with);
      ("ModelNameBeginsWith", option_to_yojson model_name_to_yojson x.model_name_begins_with);
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_model_versions_response_to_yojson (x : list_model_versions_response) =
  assoc_to_yojson
    [
      ( "ModelVersionSummaries",
        option_to_yojson model_version_summaries_to_yojson x.model_version_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_model_versions_request_to_yojson (x : list_model_versions_request) =
  assoc_to_yojson
    [
      ("MinModelVersion", option_to_yojson model_version_to_yojson x.min_model_version);
      ("MaxModelVersion", option_to_yojson model_version_to_yojson x.max_model_version);
      ("CreatedAtStartTime", option_to_yojson timestamp_to_yojson x.created_at_start_time);
      ("CreatedAtEndTime", option_to_yojson timestamp_to_yojson x.created_at_end_time);
      ("SourceType", option_to_yojson model_version_source_type_to_yojson x.source_type);
      ("Status", option_to_yojson model_version_status_to_yojson x.status);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let label_id_to_yojson = string_to_yojson
let label_group_arn_to_yojson = string_to_yojson

let label_rating_to_yojson (x : label_rating) =
  match x with
  | NEUTRAL -> `String "NEUTRAL"
  | NO_ANOMALY -> `String "NO_ANOMALY"
  | ANOMALY -> `String "ANOMALY"

let equipment_to_yojson = string_to_yojson

let label_summary_to_yojson (x : label_summary) =
  assoc_to_yojson
    [
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Equipment", option_to_yojson equipment_to_yojson x.equipment);
      ("FaultCode", option_to_yojson fault_code_to_yojson x.fault_code);
      ("Rating", option_to_yojson label_rating_to_yojson x.rating);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("LabelId", option_to_yojson label_id_to_yojson x.label_id);
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
    ]

let label_summaries_to_yojson tree = list_to_yojson label_summary_to_yojson tree

let list_labels_response_to_yojson (x : list_labels_response) =
  assoc_to_yojson
    [
      ("LabelSummaries", option_to_yojson label_summaries_to_yojson x.label_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_labels_request_to_yojson (x : list_labels_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Equipment", option_to_yojson equipment_to_yojson x.equipment);
      ("FaultCode", option_to_yojson fault_code_to_yojson x.fault_code);
      ("IntervalEndTime", option_to_yojson timestamp_to_yojson x.interval_end_time);
      ("IntervalStartTime", option_to_yojson timestamp_to_yojson x.interval_start_time);
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
    ]

let label_group_summary_to_yojson (x : label_group_summary) =
  assoc_to_yojson
    [
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
    ]

let label_group_summaries_to_yojson tree = list_to_yojson label_group_summary_to_yojson tree

let list_label_groups_response_to_yojson (x : list_label_groups_response) =
  assoc_to_yojson
    [
      ( "LabelGroupSummaries",
        option_to_yojson label_group_summaries_to_yojson x.label_group_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_label_groups_request_to_yojson (x : list_label_groups_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "LabelGroupNameBeginsWith",
        option_to_yojson label_group_name_to_yojson x.label_group_name_begins_with );
    ]

let latest_inference_result_to_yojson (x : latest_inference_result) =
  match x with NORMAL -> `String "NORMAL" | ANOMALOUS -> `String "ANOMALOUS"

let inference_scheduler_summary_to_yojson (x : inference_scheduler_summary) =
  assoc_to_yojson
    [
      ( "LatestInferenceResult",
        option_to_yojson latest_inference_result_to_yojson x.latest_inference_result );
      ( "DataUploadFrequency",
        option_to_yojson data_upload_frequency_to_yojson x.data_upload_frequency );
      ( "DataDelayOffsetInMinutes",
        option_to_yojson data_delay_offset_in_minutes_to_yojson x.data_delay_offset_in_minutes );
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let inference_scheduler_summaries_to_yojson tree =
  list_to_yojson inference_scheduler_summary_to_yojson tree

let list_inference_schedulers_response_to_yojson (x : list_inference_schedulers_response) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerSummaries",
        option_to_yojson inference_scheduler_summaries_to_yojson x.inference_scheduler_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_inference_schedulers_request_to_yojson (x : list_inference_schedulers_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "InferenceSchedulerNameBeginsWith",
        option_to_yojson inference_scheduler_identifier_to_yojson
          x.inference_scheduler_name_begins_with );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let inference_execution_status_to_yojson (x : inference_execution_status) =
  match x with
  | FAILED -> `String "FAILED"
  | SUCCESS -> `String "SUCCESS"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let inference_execution_summary_to_yojson (x : inference_execution_summary) =
  assoc_to_yojson
    [
      ("ModelVersionArn", option_to_yojson model_version_arn_to_yojson x.model_version_arn);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("FailedReason", option_to_yojson bounded_length_string_to_yojson x.failed_reason);
      ("Status", option_to_yojson inference_execution_status_to_yojson x.status);
      ("CustomerResultObject", option_to_yojson s3_object_to_yojson x.customer_result_object);
      ( "DataOutputConfiguration",
        option_to_yojson inference_output_configuration_to_yojson x.data_output_configuration );
      ( "DataInputConfiguration",
        option_to_yojson inference_input_configuration_to_yojson x.data_input_configuration );
      ("DataEndTime", option_to_yojson timestamp_to_yojson x.data_end_time);
      ("DataStartTime", option_to_yojson timestamp_to_yojson x.data_start_time);
      ("ScheduledStartTime", option_to_yojson timestamp_to_yojson x.scheduled_start_time);
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let inference_execution_summaries_to_yojson tree =
  list_to_yojson inference_execution_summary_to_yojson tree

let list_inference_executions_response_to_yojson (x : list_inference_executions_response) =
  assoc_to_yojson
    [
      ( "InferenceExecutionSummaries",
        option_to_yojson inference_execution_summaries_to_yojson x.inference_execution_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_inference_executions_request_to_yojson (x : list_inference_executions_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson inference_execution_status_to_yojson x.status);
      ("DataEndTimeBefore", option_to_yojson timestamp_to_yojson x.data_end_time_before);
      ("DataStartTimeAfter", option_to_yojson timestamp_to_yojson x.data_start_time_after);
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let event_duration_in_seconds_to_yojson = long_to_yojson

let inference_event_summary_to_yojson (x : inference_event_summary) =
  assoc_to_yojson
    [
      ( "EventDurationInSeconds",
        option_to_yojson event_duration_in_seconds_to_yojson x.event_duration_in_seconds );
      ("Diagnostics", option_to_yojson model_metrics_to_yojson x.diagnostics);
      ("EventEndTime", option_to_yojson timestamp_to_yojson x.event_end_time);
      ("EventStartTime", option_to_yojson timestamp_to_yojson x.event_start_time);
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
    ]

let inference_event_summaries_to_yojson tree = list_to_yojson inference_event_summary_to_yojson tree

let list_inference_events_response_to_yojson (x : list_inference_events_response) =
  assoc_to_yojson
    [
      ( "InferenceEventSummaries",
        option_to_yojson inference_event_summaries_to_yojson x.inference_event_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_inference_events_request_to_yojson (x : list_inference_events_request) =
  assoc_to_yojson
    [
      ("IntervalEndTime", Some (timestamp_to_yojson x.interval_end_time));
      ("IntervalStartTime", Some (timestamp_to_yojson x.interval_start_time));
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let dataset_status_to_yojson (x : dataset_status) =
  match x with
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"
  | ACTIVE -> `String "ACTIVE"
  | INGESTION_IN_PROGRESS -> `String "INGESTION_IN_PROGRESS"
  | CREATED -> `String "CREATED"

let dataset_summary_to_yojson (x : dataset_summary) =
  assoc_to_yojson
    [
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
    ]

let dataset_summaries_to_yojson tree = list_to_yojson dataset_summary_to_yojson tree

let list_datasets_response_to_yojson (x : list_datasets_response) =
  assoc_to_yojson
    [
      ("DatasetSummaries", option_to_yojson dataset_summaries_to_yojson x.dataset_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_datasets_request_to_yojson (x : list_datasets_request) =
  assoc_to_yojson
    [
      ("DatasetNameBeginsWith", option_to_yojson dataset_name_to_yojson x.dataset_name_begins_with);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let data_ingestion_job_summary_to_yojson (x : data_ingestion_job_summary) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson ingestion_job_status_to_yojson x.status);
      ( "IngestionInputConfiguration",
        option_to_yojson ingestion_input_configuration_to_yojson x.ingestion_input_configuration );
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("JobId", option_to_yojson ingestion_job_id_to_yojson x.job_id);
    ]

let data_ingestion_job_summaries_to_yojson tree =
  list_to_yojson data_ingestion_job_summary_to_yojson tree

let list_data_ingestion_jobs_response_to_yojson (x : list_data_ingestion_jobs_response) =
  assoc_to_yojson
    [
      ( "DataIngestionJobSummaries",
        option_to_yojson data_ingestion_job_summaries_to_yojson x.data_ingestion_job_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_data_ingestion_jobs_request_to_yojson (x : list_data_ingestion_jobs_request) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson ingestion_job_status_to_yojson x.status);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
    ]

let kms_key_arn_to_yojson = string_to_yojson

let invalid_sensor_data_to_yojson (x : invalid_sensor_data) =
  assoc_to_yojson
    [
      ("TotalNumberOfInvalidValues", Some (integer_to_yojson x.total_number_of_invalid_values));
      ("AffectedSensorCount", Some (integer_to_yojson x.affected_sensor_count));
    ]

let insufficient_sensor_data_to_yojson (x : insufficient_sensor_data) =
  assoc_to_yojson
    [
      ( "SensorsWithShortDateRange",
        Some (sensors_with_short_date_range_to_yojson x.sensors_with_short_date_range) );
      ( "MissingCompleteSensorData",
        Some (missing_complete_sensor_data_to_yojson x.missing_complete_sensor_data) );
    ]

let inline_data_schema_to_yojson = string_to_yojson

let ingested_files_summary_to_yojson (x : ingested_files_summary) =
  assoc_to_yojson
    [
      ("DiscardedFiles", option_to_yojson list_of_discarded_files_to_yojson x.discarded_files);
      ("IngestedNumberOfFiles", Some (integer_to_yojson x.ingested_number_of_files));
      ("TotalNumberOfFiles", Some (integer_to_yojson x.total_number_of_files));
    ]

let inference_data_import_strategy_to_yojson (x : inference_data_import_strategy) =
  match x with
  | OVERWRITE -> `String "OVERWRITE"
  | ADD_WHEN_EMPTY -> `String "ADD_WHEN_EMPTY"
  | NO_IMPORT -> `String "NO_IMPORT"

let import_model_version_response_to_yojson (x : import_model_version_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson model_version_status_to_yojson x.status);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("ModelVersionArn", option_to_yojson model_version_arn_to_yojson x.model_version_arn);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let import_model_version_request_to_yojson (x : import_model_version_request) =
  assoc_to_yojson
    [
      ( "InferenceDataImportStrategy",
        option_to_yojson inference_data_import_strategy_to_yojson x.inference_data_import_strategy
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name));
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("SourceModelVersionArn", Some (model_version_arn_to_yojson x.source_model_version_arn));
    ]

let import_dataset_response_to_yojson (x : import_dataset_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson ingestion_job_id_to_yojson x.job_id);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
    ]

let import_dataset_request_to_yojson (x : import_dataset_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("SourceDatasetArn", Some (dataset_arn_to_yojson x.source_dataset_arn));
    ]

let duplicate_timestamps_to_yojson (x : duplicate_timestamps) =
  assoc_to_yojson
    [
      ( "TotalNumberOfDuplicateTimestamps",
        Some (integer_to_yojson x.total_number_of_duplicate_timestamps) );
    ]

let describe_retraining_scheduler_response_to_yojson (x : describe_retraining_scheduler_response) =
  assoc_to_yojson
    [
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("PromoteMode", option_to_yojson model_promote_mode_to_yojson x.promote_mode);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("LookbackWindow", option_to_yojson lookback_window_to_yojson x.lookback_window);
      ("RetrainingFrequency", option_to_yojson retraining_frequency_to_yojson x.retraining_frequency);
      ("RetrainingStartDate", option_to_yojson timestamp_to_yojson x.retraining_start_date);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let describe_retraining_scheduler_request_to_yojson (x : describe_retraining_scheduler_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let describe_resource_policy_response_to_yojson (x : describe_resource_policy_response) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("ResourcePolicy", option_to_yojson policy_to_yojson x.resource_policy);
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
    ]

let describe_resource_policy_request_to_yojson (x : describe_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let data_pre_processing_configuration_to_yojson (x : data_pre_processing_configuration) =
  assoc_to_yojson
    [
      ("TargetSamplingRate", option_to_yojson target_sampling_rate_to_yojson x.target_sampling_rate);
    ]

let data_size_in_bytes_to_yojson = long_to_yojson

let auto_promotion_result_to_yojson (x : auto_promotion_result) =
  match x with
  | RETRAINING_CANCELLED -> `String "RETRAINING_CANCELLED"
  | RETRAINING_CUSTOMER_ERROR -> `String "RETRAINING_CUSTOMER_ERROR"
  | RETRAINING_INTERNAL_ERROR -> `String "RETRAINING_INTERNAL_ERROR"
  | MODEL_NOT_PROMOTED -> `String "MODEL_NOT_PROMOTED"
  | MODEL_PROMOTED -> `String "MODEL_PROMOTED"

let auto_promotion_result_reason_to_yojson = string_to_yojson

let describe_model_version_response_to_yojson (x : describe_model_version_response) =
  assoc_to_yojson
    [
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
      ( "ModelDiagnosticsResultsObject",
        option_to_yojson s3_object_to_yojson x.model_diagnostics_results_object );
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
      ( "AutoPromotionResultReason",
        option_to_yojson auto_promotion_result_reason_to_yojson x.auto_promotion_result_reason );
      ( "AutoPromotionResult",
        option_to_yojson auto_promotion_result_to_yojson x.auto_promotion_result );
      ( "RetrainingAvailableDataInDays",
        option_to_yojson integer_to_yojson x.retraining_available_data_in_days );
      ("PriorModelMetrics", option_to_yojson model_metrics_to_yojson x.prior_model_metrics);
      ( "ImportedDataSizeInBytes",
        option_to_yojson data_size_in_bytes_to_yojson x.imported_data_size_in_bytes );
      ("ImportJobEndTime", option_to_yojson timestamp_to_yojson x.import_job_end_time);
      ("ImportJobStartTime", option_to_yojson timestamp_to_yojson x.import_job_start_time);
      ( "SourceModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.source_model_version_arn );
      ("OffCondition", option_to_yojson off_condition_to_yojson x.off_condition);
      ("ServerSideKmsKeyId", option_to_yojson kms_key_arn_to_yojson x.server_side_kms_key_id);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("ModelMetrics", option_to_yojson model_metrics_to_yojson x.model_metrics);
      ("FailedReason", option_to_yojson bounded_length_string_to_yojson x.failed_reason);
      ( "TrainingExecutionEndTime",
        option_to_yojson timestamp_to_yojson x.training_execution_end_time );
      ( "TrainingExecutionStartTime",
        option_to_yojson timestamp_to_yojson x.training_execution_start_time );
      ( "DataPreProcessingConfiguration",
        option_to_yojson data_pre_processing_configuration_to_yojson
          x.data_pre_processing_configuration );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("EvaluationDataEndTime", option_to_yojson timestamp_to_yojson x.evaluation_data_end_time);
      ("EvaluationDataStartTime", option_to_yojson timestamp_to_yojson x.evaluation_data_start_time);
      ("TrainingDataEndTime", option_to_yojson timestamp_to_yojson x.training_data_end_time);
      ("TrainingDataStartTime", option_to_yojson timestamp_to_yojson x.training_data_start_time);
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("Schema", option_to_yojson inline_data_schema_to_yojson x.schema);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("SourceType", option_to_yojson model_version_source_type_to_yojson x.source_type);
      ("Status", option_to_yojson model_version_status_to_yojson x.status);
      ("ModelVersionArn", option_to_yojson model_version_arn_to_yojson x.model_version_arn);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let describe_model_version_request_to_yojson (x : describe_model_version_request) =
  assoc_to_yojson
    [
      ("ModelVersion", Some (model_version_to_yojson x.model_version));
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let describe_model_response_to_yojson (x : describe_model_response) =
  assoc_to_yojson
    [
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
      ( "RetrainingSchedulerStatus",
        option_to_yojson retraining_scheduler_status_to_yojson x.retraining_scheduler_status );
      ( "AccumulatedInferenceDataEndTime",
        option_to_yojson timestamp_to_yojson x.accumulated_inference_data_end_time );
      ( "AccumulatedInferenceDataStartTime",
        option_to_yojson timestamp_to_yojson x.accumulated_inference_data_start_time );
      ( "NextScheduledRetrainingStartDate",
        option_to_yojson timestamp_to_yojson x.next_scheduled_retraining_start_date );
      ( "LatestScheduledRetrainingAvailableDataInDays",
        option_to_yojson integer_to_yojson x.latest_scheduled_retraining_available_data_in_days );
      ( "LatestScheduledRetrainingStartTime",
        option_to_yojson timestamp_to_yojson x.latest_scheduled_retraining_start_time );
      ( "LatestScheduledRetrainingModelVersion",
        option_to_yojson model_version_to_yojson x.latest_scheduled_retraining_model_version );
      ( "LatestScheduledRetrainingStatus",
        option_to_yojson model_version_status_to_yojson x.latest_scheduled_retraining_status );
      ( "LatestScheduledRetrainingFailedReason",
        option_to_yojson bounded_length_string_to_yojson x.latest_scheduled_retraining_failed_reason
      );
      ( "PriorModelMetrics",
        option_to_yojson synthesized_json_model_metrics_to_yojson x.prior_model_metrics );
      ( "PreviousModelVersionActivatedAt",
        option_to_yojson timestamp_to_yojson x.previous_model_version_activated_at );
      ( "PreviousActiveModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.previous_active_model_version_arn );
      ( "PreviousActiveModelVersion",
        option_to_yojson model_version_to_yojson x.previous_active_model_version );
      ("ModelVersionActivatedAt", option_to_yojson timestamp_to_yojson x.model_version_activated_at);
      ( "ActiveModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.active_model_version_arn );
      ("ActiveModelVersion", option_to_yojson model_version_to_yojson x.active_model_version);
      ("ImportJobEndTime", option_to_yojson timestamp_to_yojson x.import_job_end_time);
      ("ImportJobStartTime", option_to_yojson timestamp_to_yojson x.import_job_start_time);
      ( "SourceModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.source_model_version_arn );
      ("OffCondition", option_to_yojson off_condition_to_yojson x.off_condition);
      ("ServerSideKmsKeyId", option_to_yojson kms_key_arn_to_yojson x.server_side_kms_key_id);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("ModelMetrics", option_to_yojson synthesized_json_model_metrics_to_yojson x.model_metrics);
      ("FailedReason", option_to_yojson bounded_length_string_to_yojson x.failed_reason);
      ( "TrainingExecutionEndTime",
        option_to_yojson timestamp_to_yojson x.training_execution_end_time );
      ( "TrainingExecutionStartTime",
        option_to_yojson timestamp_to_yojson x.training_execution_start_time );
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ( "DataPreProcessingConfiguration",
        option_to_yojson data_pre_processing_configuration_to_yojson
          x.data_pre_processing_configuration );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("EvaluationDataEndTime", option_to_yojson timestamp_to_yojson x.evaluation_data_end_time);
      ("EvaluationDataStartTime", option_to_yojson timestamp_to_yojson x.evaluation_data_start_time);
      ("TrainingDataEndTime", option_to_yojson timestamp_to_yojson x.training_data_end_time);
      ("TrainingDataStartTime", option_to_yojson timestamp_to_yojson x.training_data_start_time);
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("Schema", option_to_yojson synthesized_json_inline_data_schema_to_yojson x.schema);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let describe_model_request_to_yojson (x : describe_model_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let comments_to_yojson = string_to_yojson

let describe_label_response_to_yojson (x : describe_label_response) =
  assoc_to_yojson
    [
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Equipment", option_to_yojson equipment_to_yojson x.equipment);
      ("Notes", option_to_yojson comments_to_yojson x.notes);
      ("FaultCode", option_to_yojson fault_code_to_yojson x.fault_code);
      ("Rating", option_to_yojson label_rating_to_yojson x.rating);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("LabelId", option_to_yojson label_id_to_yojson x.label_id);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
    ]

let describe_label_request_to_yojson (x : describe_label_request) =
  assoc_to_yojson
    [
      ("LabelId", Some (label_id_to_yojson x.label_id));
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
    ]

let describe_label_group_response_to_yojson (x : describe_label_group_response) =
  assoc_to_yojson
    [
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("FaultCodes", option_to_yojson fault_codes_to_yojson x.fault_codes);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
    ]

let describe_label_group_request_to_yojson (x : describe_label_group_request) =
  assoc_to_yojson [ ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name)) ]

let describe_inference_scheduler_response_to_yojson (x : describe_inference_scheduler_response) =
  assoc_to_yojson
    [
      ( "LatestInferenceResult",
        option_to_yojson latest_inference_result_to_yojson x.latest_inference_result );
      ("ServerSideKmsKeyId", option_to_yojson kms_key_arn_to_yojson x.server_side_kms_key_id);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "DataOutputConfiguration",
        option_to_yojson inference_output_configuration_to_yojson x.data_output_configuration );
      ( "DataInputConfiguration",
        option_to_yojson inference_input_configuration_to_yojson x.data_input_configuration );
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ( "DataUploadFrequency",
        option_to_yojson data_upload_frequency_to_yojson x.data_upload_frequency );
      ( "DataDelayOffsetInMinutes",
        option_to_yojson data_delay_offset_in_minutes_to_yojson x.data_delay_offset_in_minutes );
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
    ]

let describe_inference_scheduler_request_to_yojson (x : describe_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let data_quality_summary_to_yojson (x : data_quality_summary) =
  assoc_to_yojson
    [
      ("DuplicateTimestamps", Some (duplicate_timestamps_to_yojson x.duplicate_timestamps));
      ("UnsupportedTimestamps", Some (unsupported_timestamps_to_yojson x.unsupported_timestamps));
      ("InvalidSensorData", Some (invalid_sensor_data_to_yojson x.invalid_sensor_data));
      ("MissingSensorData", Some (missing_sensor_data_to_yojson x.missing_sensor_data));
      ( "InsufficientSensorData",
        Some (insufficient_sensor_data_to_yojson x.insufficient_sensor_data) );
    ]

let describe_dataset_response_to_yojson (x : describe_dataset_response) =
  assoc_to_yojson
    [
      ("SourceDatasetArn", option_to_yojson dataset_arn_to_yojson x.source_dataset_arn);
      ("DataEndTime", option_to_yojson timestamp_to_yojson x.data_end_time);
      ("DataStartTime", option_to_yojson timestamp_to_yojson x.data_start_time);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "IngestedFilesSummary",
        option_to_yojson ingested_files_summary_to_yojson x.ingested_files_summary );
      ("DataQualitySummary", option_to_yojson data_quality_summary_to_yojson x.data_quality_summary);
      ( "IngestionInputConfiguration",
        option_to_yojson ingestion_input_configuration_to_yojson x.ingestion_input_configuration );
      ("ServerSideKmsKeyId", option_to_yojson kms_key_arn_to_yojson x.server_side_kms_key_id);
      ("Schema", option_to_yojson synthesized_json_inline_data_schema_to_yojson x.schema);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("LastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
    ]

let describe_dataset_request_to_yojson (x : describe_dataset_request) =
  assoc_to_yojson [ ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name)) ]

let describe_data_ingestion_job_response_to_yojson (x : describe_data_ingestion_job_response) =
  assoc_to_yojson
    [
      ("SourceDatasetArn", option_to_yojson dataset_arn_to_yojson x.source_dataset_arn);
      ("DataEndTime", option_to_yojson timestamp_to_yojson x.data_end_time);
      ("DataStartTime", option_to_yojson timestamp_to_yojson x.data_start_time);
      ("IngestedDataSize", option_to_yojson data_size_in_bytes_to_yojson x.ingested_data_size);
      ("StatusDetail", option_to_yojson bounded_length_string_to_yojson x.status_detail);
      ( "IngestedFilesSummary",
        option_to_yojson ingested_files_summary_to_yojson x.ingested_files_summary );
      ("DataQualitySummary", option_to_yojson data_quality_summary_to_yojson x.data_quality_summary);
      ("FailedReason", option_to_yojson bounded_length_string_to_yojson x.failed_reason);
      ("Status", option_to_yojson ingestion_job_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "IngestionInputConfiguration",
        option_to_yojson ingestion_input_configuration_to_yojson x.ingestion_input_configuration );
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("JobId", option_to_yojson ingestion_job_id_to_yojson x.job_id);
    ]

let describe_data_ingestion_job_request_to_yojson (x : describe_data_ingestion_job_request) =
  assoc_to_yojson [ ("JobId", Some (ingestion_job_id_to_yojson x.job_id)) ]

let delete_retraining_scheduler_request_to_yojson (x : delete_retraining_scheduler_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let delete_model_request_to_yojson (x : delete_model_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let delete_label_request_to_yojson (x : delete_label_request) =
  assoc_to_yojson
    [
      ("LabelId", Some (label_id_to_yojson x.label_id));
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
    ]

let delete_label_group_request_to_yojson (x : delete_label_group_request) =
  assoc_to_yojson [ ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name)) ]

let delete_inference_scheduler_request_to_yojson (x : delete_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let delete_dataset_request_to_yojson (x : delete_dataset_request) =
  assoc_to_yojson [ ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name)) ]

let dataset_schema_to_yojson (x : dataset_schema) =
  assoc_to_yojson
    [
      ( "InlineDataSchema",
        option_to_yojson synthesized_json_inline_data_schema_to_yojson x.inline_data_schema );
    ]

let create_retraining_scheduler_response_to_yojson (x : create_retraining_scheduler_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
    ]

let create_retraining_scheduler_request_to_yojson (x : create_retraining_scheduler_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("PromoteMode", option_to_yojson model_promote_mode_to_yojson x.promote_mode);
      ("LookbackWindow", Some (lookback_window_to_yojson x.lookback_window));
      ("RetrainingFrequency", Some (retraining_frequency_to_yojson x.retraining_frequency));
      ("RetrainingStartDate", option_to_yojson timestamp_to_yojson x.retraining_start_date);
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let create_model_response_to_yojson (x : create_model_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
    ]

let create_model_request_to_yojson (x : create_model_request) =
  assoc_to_yojson
    [
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
      ("OffCondition", option_to_yojson off_condition_to_yojson x.off_condition);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ( "DataPreProcessingConfiguration",
        option_to_yojson data_pre_processing_configuration_to_yojson
          x.data_pre_processing_configuration );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("EvaluationDataEndTime", option_to_yojson timestamp_to_yojson x.evaluation_data_end_time);
      ("EvaluationDataStartTime", option_to_yojson timestamp_to_yojson x.evaluation_data_start_time);
      ("TrainingDataEndTime", option_to_yojson timestamp_to_yojson x.training_data_end_time);
      ("TrainingDataStartTime", option_to_yojson timestamp_to_yojson x.training_data_start_time);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("DatasetSchema", option_to_yojson dataset_schema_to_yojson x.dataset_schema);
      ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name));
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let create_label_response_to_yojson (x : create_label_response) =
  assoc_to_yojson [ ("LabelId", option_to_yojson label_id_to_yojson x.label_id) ]

let create_label_request_to_yojson (x : create_label_request) =
  assoc_to_yojson
    [
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("Equipment", option_to_yojson equipment_to_yojson x.equipment);
      ("Notes", option_to_yojson comments_to_yojson x.notes);
      ("FaultCode", option_to_yojson fault_code_to_yojson x.fault_code);
      ("Rating", Some (label_rating_to_yojson x.rating));
      ("EndTime", Some (timestamp_to_yojson x.end_time));
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
    ]

let create_label_group_response_to_yojson (x : create_label_group_response) =
  assoc_to_yojson
    [
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
    ]

let create_label_group_request_to_yojson (x : create_label_group_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("FaultCodes", option_to_yojson fault_codes_to_yojson x.fault_codes);
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
    ]

let create_inference_scheduler_response_to_yojson (x : create_inference_scheduler_response) =
  assoc_to_yojson
    [
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
    ]

let create_inference_scheduler_request_to_yojson (x : create_inference_scheduler_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ( "DataOutputConfiguration",
        Some (inference_output_configuration_to_yojson x.data_output_configuration) );
      ( "DataInputConfiguration",
        Some (inference_input_configuration_to_yojson x.data_input_configuration) );
      ("DataUploadFrequency", Some (data_upload_frequency_to_yojson x.data_upload_frequency));
      ( "DataDelayOffsetInMinutes",
        option_to_yojson data_delay_offset_in_minutes_to_yojson x.data_delay_offset_in_minutes );
      ( "InferenceSchedulerName",
        Some (inference_scheduler_name_to_yojson x.inference_scheduler_name) );
      ("ModelName", Some (model_name_to_yojson x.model_name));
    ]

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
    ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("DatasetSchema", option_to_yojson dataset_schema_to_yojson x.dataset_schema);
      ("DatasetName", Some (dataset_name_to_yojson x.dataset_name));
    ]
