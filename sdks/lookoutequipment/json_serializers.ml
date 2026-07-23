open Smaws_Lib.Json.SerializeHelpers
open Types

let bounded_length_string_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

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

let model_promote_mode_to_yojson (x : model_promote_mode) =
  match x with MANAGED -> `String "MANAGED" | MANUAL -> `String "MANUAL"

let lookback_window_to_yojson = string_to_yojson
let retraining_frequency_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let model_name_to_yojson = string_to_yojson

let update_retraining_scheduler_request_to_yojson (x : update_retraining_scheduler_request) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("RetrainingStartDate", option_to_yojson timestamp_to_yojson x.retraining_start_date);
      ("RetrainingFrequency", option_to_yojson retraining_frequency_to_yojson x.retraining_frequency);
      ("LookbackWindow", option_to_yojson lookback_window_to_yojson x.lookback_window);
      ("PromoteMode", option_to_yojson model_promote_mode_to_yojson x.promote_mode);
    ]

let name_or_arn_to_yojson = string_to_yojson
let s3_prefix_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let model_diagnostics_s3_output_configuration_to_yojson
    (x : model_diagnostics_s3_output_configuration) =
  assoc_to_yojson
    [
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
    ]

let model_diagnostics_output_configuration_to_yojson (x : model_diagnostics_output_configuration) =
  assoc_to_yojson
    [
      ( "S3OutputConfiguration",
        Some (model_diagnostics_s3_output_configuration_to_yojson x.s3_output_configuration) );
      ("KmsKeyId", option_to_yojson name_or_arn_to_yojson x.kms_key_id);
    ]

let iam_role_arn_to_yojson = string_to_yojson
let label_group_name_to_yojson = string_to_yojson

let labels_s3_input_configuration_to_yojson (x : labels_s3_input_configuration) =
  assoc_to_yojson
    [
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
    ]

let labels_input_configuration_to_yojson (x : labels_input_configuration) =
  assoc_to_yojson
    [
      ( "S3InputConfiguration",
        option_to_yojson labels_s3_input_configuration_to_yojson x.s3_input_configuration );
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
    ]

let update_model_request_to_yojson (x : update_model_request) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
    ]

let fault_code_to_yojson = string_to_yojson
let fault_codes_to_yojson tree = list_to_yojson fault_code_to_yojson tree

let update_label_group_request_to_yojson (x : update_label_group_request) =
  assoc_to_yojson
    [
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
      ("FaultCodes", option_to_yojson fault_codes_to_yojson x.fault_codes);
    ]

let inference_s3_output_configuration_to_yojson (x : inference_s3_output_configuration) =
  assoc_to_yojson
    [
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
    ]

let inference_output_configuration_to_yojson (x : inference_output_configuration) =
  assoc_to_yojson
    [
      ( "S3OutputConfiguration",
        Some (inference_s3_output_configuration_to_yojson x.s3_output_configuration) );
      ("KmsKeyId", option_to_yojson name_or_arn_to_yojson x.kms_key_id);
    ]

let component_timestamp_delimiter_to_yojson = string_to_yojson
let file_name_timestamp_format_to_yojson = string_to_yojson

let inference_input_name_configuration_to_yojson (x : inference_input_name_configuration) =
  assoc_to_yojson
    [
      ("TimestampFormat", option_to_yojson file_name_timestamp_format_to_yojson x.timestamp_format);
      ( "ComponentTimestampDelimiter",
        option_to_yojson component_timestamp_delimiter_to_yojson x.component_timestamp_delimiter );
    ]

let time_zone_offset_to_yojson = string_to_yojson

let inference_s3_input_configuration_to_yojson (x : inference_s3_input_configuration) =
  assoc_to_yojson
    [
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
    ]

let inference_input_configuration_to_yojson (x : inference_input_configuration) =
  assoc_to_yojson
    [
      ( "S3InputConfiguration",
        option_to_yojson inference_s3_input_configuration_to_yojson x.s3_input_configuration );
      ("InputTimeZoneOffset", option_to_yojson time_zone_offset_to_yojson x.input_time_zone_offset);
      ( "InferenceInputNameConfiguration",
        option_to_yojson inference_input_name_configuration_to_yojson
          x.inference_input_name_configuration );
    ]

let data_upload_frequency_to_yojson (x : data_upload_frequency) =
  match x with
  | PT5M -> `String "PT5M"
  | PT10M -> `String "PT10M"
  | PT15M -> `String "PT15M"
  | PT30M -> `String "PT30M"
  | PT1H -> `String "PT1H"

let data_delay_offset_in_minutes_to_yojson = long_to_yojson
let inference_scheduler_identifier_to_yojson = string_to_yojson

let update_inference_scheduler_request_to_yojson (x : update_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
      ( "DataDelayOffsetInMinutes",
        option_to_yojson data_delay_offset_in_minutes_to_yojson x.data_delay_offset_in_minutes );
      ( "DataUploadFrequency",
        option_to_yojson data_upload_frequency_to_yojson x.data_upload_frequency );
      ( "DataInputConfiguration",
        option_to_yojson inference_input_configuration_to_yojson x.data_input_configuration );
      ( "DataOutputConfiguration",
        option_to_yojson inference_output_configuration_to_yojson x.data_output_configuration );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
    ]

let model_version_arn_to_yojson = string_to_yojson
let model_version_to_yojson = long_to_yojson
let model_arn_to_yojson = string_to_yojson

let update_active_model_version_response_to_yojson (x : update_active_model_version_response) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("CurrentActiveVersion", option_to_yojson model_version_to_yojson x.current_active_version);
      ("PreviousActiveVersion", option_to_yojson model_version_to_yojson x.previous_active_version);
      ( "CurrentActiveVersionArn",
        option_to_yojson model_version_arn_to_yojson x.current_active_version_arn );
      ( "PreviousActiveVersionArn",
        option_to_yojson model_version_arn_to_yojson x.previous_active_version_arn );
    ]

let update_active_model_version_request_to_yojson (x : update_active_model_version_request) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("ModelVersion", Some (model_version_to_yojson x.model_version));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let amazon_resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", Some (bounded_length_string_to_yojson x.message)) ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (amazon_resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let retraining_scheduler_status_to_yojson (x : retraining_scheduler_status) =
  match x with
  | PENDING -> `String "PENDING"
  | RUNNING -> `String "RUNNING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let stop_retraining_scheduler_response_to_yojson (x : stop_retraining_scheduler_response) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
    ]

let stop_retraining_scheduler_request_to_yojson (x : stop_retraining_scheduler_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let inference_scheduler_status_to_yojson (x : inference_scheduler_status) =
  match x with
  | PENDING -> `String "PENDING"
  | RUNNING -> `String "RUNNING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let inference_scheduler_arn_to_yojson = string_to_yojson
let inference_scheduler_name_to_yojson = string_to_yojson

let stop_inference_scheduler_response_to_yojson (x : stop_inference_scheduler_response) =
  assoc_to_yojson
    [
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
    ]

let stop_inference_scheduler_request_to_yojson (x : stop_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let start_retraining_scheduler_response_to_yojson (x : start_retraining_scheduler_response) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
    ]

let start_retraining_scheduler_request_to_yojson (x : start_retraining_scheduler_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let start_inference_scheduler_response_to_yojson (x : start_inference_scheduler_response) =
  assoc_to_yojson
    [
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
    ]

let start_inference_scheduler_request_to_yojson (x : start_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let ingestion_job_status_to_yojson (x : ingestion_job_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"

let ingestion_job_id_to_yojson = string_to_yojson

let start_data_ingestion_job_response_to_yojson (x : start_data_ingestion_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson ingestion_job_id_to_yojson x.job_id);
      ("Status", option_to_yojson ingestion_job_status_to_yojson x.status);
    ]

let idempotence_token_to_yojson = string_to_yojson
let key_pattern_to_yojson = string_to_yojson

let ingestion_s3_input_configuration_to_yojson (x : ingestion_s3_input_configuration) =
  assoc_to_yojson
    [
      ("Bucket", Some (s3_bucket_to_yojson x.bucket));
      ("Prefix", option_to_yojson s3_prefix_to_yojson x.prefix);
      ("KeyPattern", option_to_yojson key_pattern_to_yojson x.key_pattern);
    ]

let ingestion_input_configuration_to_yojson (x : ingestion_input_configuration) =
  assoc_to_yojson
    [
      ( "S3InputConfiguration",
        Some (ingestion_s3_input_configuration_to_yojson x.s3_input_configuration) );
    ]

let dataset_identifier_to_yojson = string_to_yojson

let start_data_ingestion_job_request_to_yojson (x : start_data_ingestion_job_request) =
  assoc_to_yojson
    [
      ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name));
      ( "IngestionInputConfiguration",
        Some (ingestion_input_configuration_to_yojson x.ingestion_input_configuration) );
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
    ]

let policy_revision_id_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson

let put_resource_policy_response_to_yojson (x : put_resource_policy_response) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
    ]

let policy_to_yojson = string_to_yojson

let put_resource_policy_request_to_yojson (x : put_resource_policy_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("ResourcePolicy", Some (policy_to_yojson x.resource_policy));
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (amazon_resource_arn_to_yojson x.resource_arn)) ]

let next_token_to_yojson = string_to_yojson

let monotonicity_to_yojson (x : monotonicity) =
  match x with
  | DECREASING -> `String "DECREASING"
  | INCREASING -> `String "INCREASING"
  | STATIC -> `String "STATIC"

let statistical_issue_status_to_yojson (x : statistical_issue_status) =
  match x with
  | POTENTIAL_ISSUE_DETECTED -> `String "POTENTIAL_ISSUE_DETECTED"
  | NO_ISSUE_DETECTED -> `String "NO_ISSUE_DETECTED"

let monotonic_values_to_yojson (x : monotonic_values) =
  assoc_to_yojson
    [
      ("Status", Some (statistical_issue_status_to_yojson x.status));
      ("Monotonicity", option_to_yojson monotonicity_to_yojson x.monotonicity);
    ]

let integer_to_yojson = int_to_yojson

let large_timestamp_gaps_to_yojson (x : large_timestamp_gaps) =
  assoc_to_yojson
    [
      ("Status", Some (statistical_issue_status_to_yojson x.status));
      ( "NumberOfLargeTimestampGaps",
        option_to_yojson integer_to_yojson x.number_of_large_timestamp_gaps );
      ("MaxTimestampGapInDays", option_to_yojson integer_to_yojson x.max_timestamp_gap_in_days);
    ]

let multiple_operating_modes_to_yojson (x : multiple_operating_modes) =
  assoc_to_yojson [ ("Status", Some (statistical_issue_status_to_yojson x.status)) ]

let categorical_values_to_yojson (x : categorical_values) =
  assoc_to_yojson
    [
      ("Status", Some (statistical_issue_status_to_yojson x.status));
      ("NumberOfCategory", option_to_yojson integer_to_yojson x.number_of_category);
    ]

let float__to_yojson = float_to_yojson

let count_percent_to_yojson (x : count_percent) =
  assoc_to_yojson
    [
      ("Count", Some (integer_to_yojson x.count));
      ("Percentage", Some (float__to_yojson x.percentage));
    ]

let boolean__to_yojson = bool_to_yojson
let sensor_name_to_yojson = string_to_yojson
let component_name_to_yojson = string_to_yojson

let sensor_statistics_summary_to_yojson (x : sensor_statistics_summary) =
  assoc_to_yojson
    [
      ("ComponentName", option_to_yojson component_name_to_yojson x.component_name);
      ("SensorName", option_to_yojson sensor_name_to_yojson x.sensor_name);
      ("DataExists", option_to_yojson boolean__to_yojson x.data_exists);
      ("MissingValues", option_to_yojson count_percent_to_yojson x.missing_values);
      ("InvalidValues", option_to_yojson count_percent_to_yojson x.invalid_values);
      ("InvalidDateEntries", option_to_yojson count_percent_to_yojson x.invalid_date_entries);
      ("DuplicateTimestamps", option_to_yojson count_percent_to_yojson x.duplicate_timestamps);
      ("CategoricalValues", option_to_yojson categorical_values_to_yojson x.categorical_values);
      ( "MultipleOperatingModes",
        option_to_yojson multiple_operating_modes_to_yojson x.multiple_operating_modes );
      ("LargeTimestampGaps", option_to_yojson large_timestamp_gaps_to_yojson x.large_timestamp_gaps);
      ("MonotonicValues", option_to_yojson monotonic_values_to_yojson x.monotonic_values);
      ("DataStartTime", option_to_yojson timestamp_to_yojson x.data_start_time);
      ("DataEndTime", option_to_yojson timestamp_to_yojson x.data_end_time);
    ]

let sensor_statistics_summaries_to_yojson tree =
  list_to_yojson sensor_statistics_summary_to_yojson tree

let list_sensor_statistics_response_to_yojson (x : list_sensor_statistics_response) =
  assoc_to_yojson
    [
      ( "SensorStatisticsSummaries",
        option_to_yojson sensor_statistics_summaries_to_yojson x.sensor_statistics_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let dataset_name_to_yojson = string_to_yojson

let list_sensor_statistics_request_to_yojson (x : list_sensor_statistics_request) =
  assoc_to_yojson
    [
      ("DatasetName", Some (dataset_name_to_yojson x.dataset_name));
      ("IngestionJobId", option_to_yojson ingestion_job_id_to_yojson x.ingestion_job_id);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let retraining_scheduler_summary_to_yojson (x : retraining_scheduler_summary) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("RetrainingStartDate", option_to_yojson timestamp_to_yojson x.retraining_start_date);
      ("RetrainingFrequency", option_to_yojson retraining_frequency_to_yojson x.retraining_frequency);
      ("LookbackWindow", option_to_yojson lookback_window_to_yojson x.lookback_window);
    ]

let retraining_scheduler_summaries_to_yojson tree =
  list_to_yojson retraining_scheduler_summary_to_yojson tree

let list_retraining_schedulers_response_to_yojson (x : list_retraining_schedulers_response) =
  assoc_to_yojson
    [
      ( "RetrainingSchedulerSummaries",
        option_to_yojson retraining_scheduler_summaries_to_yojson x.retraining_scheduler_summaries
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_retraining_schedulers_request_to_yojson (x : list_retraining_schedulers_request) =
  assoc_to_yojson
    [
      ("ModelNameBeginsWith", option_to_yojson model_name_to_yojson x.model_name_begins_with);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let model_quality_to_yojson (x : model_quality) =
  match x with
  | QUALITY_THRESHOLD_MET -> `String "QUALITY_THRESHOLD_MET"
  | CANNOT_DETERMINE_QUALITY -> `String "CANNOT_DETERMINE_QUALITY"
  | POOR_QUALITY_DETECTED -> `String "POOR_QUALITY_DETECTED"

let model_version_source_type_to_yojson (x : model_version_source_type) =
  match x with
  | TRAINING -> `String "TRAINING"
  | RETRAINING -> `String "RETRAINING"
  | IMPORT -> `String "IMPORT"

let model_version_status_to_yojson (x : model_version_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"
  | CANCELED -> `String "CANCELED"

let model_version_summary_to_yojson (x : model_version_summary) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("ModelVersionArn", option_to_yojson model_version_arn_to_yojson x.model_version_arn);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Status", option_to_yojson model_version_status_to_yojson x.status);
      ("SourceType", option_to_yojson model_version_source_type_to_yojson x.source_type);
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
    ]

let model_version_summaries_to_yojson tree = list_to_yojson model_version_summary_to_yojson tree

let list_model_versions_response_to_yojson (x : list_model_versions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "ModelVersionSummaries",
        option_to_yojson model_version_summaries_to_yojson x.model_version_summaries );
    ]

let list_model_versions_request_to_yojson (x : list_model_versions_request) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Status", option_to_yojson model_version_status_to_yojson x.status);
      ("SourceType", option_to_yojson model_version_source_type_to_yojson x.source_type);
      ("CreatedAtEndTime", option_to_yojson timestamp_to_yojson x.created_at_end_time);
      ("CreatedAtStartTime", option_to_yojson timestamp_to_yojson x.created_at_start_time);
      ("MaxModelVersion", option_to_yojson model_version_to_yojson x.max_model_version);
      ("MinModelVersion", option_to_yojson model_version_to_yojson x.min_model_version);
    ]

let model_status_to_yojson (x : model_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"

let dataset_arn_to_yojson = string_to_yojson

let model_summary_to_yojson (x : model_summary) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("ActiveModelVersion", option_to_yojson model_version_to_yojson x.active_model_version);
      ( "ActiveModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.active_model_version_arn );
      ( "LatestScheduledRetrainingStatus",
        option_to_yojson model_version_status_to_yojson x.latest_scheduled_retraining_status );
      ( "LatestScheduledRetrainingModelVersion",
        option_to_yojson model_version_to_yojson x.latest_scheduled_retraining_model_version );
      ( "LatestScheduledRetrainingStartTime",
        option_to_yojson timestamp_to_yojson x.latest_scheduled_retraining_start_time );
      ( "NextScheduledRetrainingStartDate",
        option_to_yojson timestamp_to_yojson x.next_scheduled_retraining_start_date );
      ( "RetrainingSchedulerStatus",
        option_to_yojson retraining_scheduler_status_to_yojson x.retraining_scheduler_status );
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
    ]

let model_summaries_to_yojson tree = list_to_yojson model_summary_to_yojson tree

let list_models_response_to_yojson (x : list_models_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ModelSummaries", option_to_yojson model_summaries_to_yojson x.model_summaries);
    ]

let list_models_request_to_yojson (x : list_models_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ("ModelNameBeginsWith", option_to_yojson model_name_to_yojson x.model_name_begins_with);
      ("DatasetNameBeginsWith", option_to_yojson dataset_name_to_yojson x.dataset_name_begins_with);
    ]

let equipment_to_yojson = string_to_yojson

let label_rating_to_yojson (x : label_rating) =
  match x with
  | ANOMALY -> `String "ANOMALY"
  | NO_ANOMALY -> `String "NO_ANOMALY"
  | NEUTRAL -> `String "NEUTRAL"

let label_group_arn_to_yojson = string_to_yojson
let label_id_to_yojson = string_to_yojson

let label_summary_to_yojson (x : label_summary) =
  assoc_to_yojson
    [
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
      ("LabelId", option_to_yojson label_id_to_yojson x.label_id);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Rating", option_to_yojson label_rating_to_yojson x.rating);
      ("FaultCode", option_to_yojson fault_code_to_yojson x.fault_code);
      ("Equipment", option_to_yojson equipment_to_yojson x.equipment);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let label_summaries_to_yojson tree = list_to_yojson label_summary_to_yojson tree

let list_labels_response_to_yojson (x : list_labels_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("LabelSummaries", option_to_yojson label_summaries_to_yojson x.label_summaries);
    ]

let list_labels_request_to_yojson (x : list_labels_request) =
  assoc_to_yojson
    [
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
      ("IntervalStartTime", option_to_yojson timestamp_to_yojson x.interval_start_time);
      ("IntervalEndTime", option_to_yojson timestamp_to_yojson x.interval_end_time);
      ("FaultCode", option_to_yojson fault_code_to_yojson x.fault_code);
      ("Equipment", option_to_yojson equipment_to_yojson x.equipment);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let label_group_summary_to_yojson (x : label_group_summary) =
  assoc_to_yojson
    [
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let label_group_summaries_to_yojson tree = list_to_yojson label_group_summary_to_yojson tree

let list_label_groups_response_to_yojson (x : list_label_groups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "LabelGroupSummaries",
        option_to_yojson label_group_summaries_to_yojson x.label_group_summaries );
    ]

let list_label_groups_request_to_yojson (x : list_label_groups_request) =
  assoc_to_yojson
    [
      ( "LabelGroupNameBeginsWith",
        option_to_yojson label_group_name_to_yojson x.label_group_name_begins_with );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let latest_inference_result_to_yojson (x : latest_inference_result) =
  match x with ANOMALOUS -> `String "ANOMALOUS" | NORMAL -> `String "NORMAL"

let inference_scheduler_summary_to_yojson (x : inference_scheduler_summary) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ( "DataDelayOffsetInMinutes",
        option_to_yojson data_delay_offset_in_minutes_to_yojson x.data_delay_offset_in_minutes );
      ( "DataUploadFrequency",
        option_to_yojson data_upload_frequency_to_yojson x.data_upload_frequency );
      ( "LatestInferenceResult",
        option_to_yojson latest_inference_result_to_yojson x.latest_inference_result );
    ]

let inference_scheduler_summaries_to_yojson tree =
  list_to_yojson inference_scheduler_summary_to_yojson tree

let list_inference_schedulers_response_to_yojson (x : list_inference_schedulers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "InferenceSchedulerSummaries",
        option_to_yojson inference_scheduler_summaries_to_yojson x.inference_scheduler_summaries );
    ]

let list_inference_schedulers_request_to_yojson (x : list_inference_schedulers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "InferenceSchedulerNameBeginsWith",
        option_to_yojson inference_scheduler_identifier_to_yojson
          x.inference_scheduler_name_begins_with );
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
    ]

let inference_execution_status_to_yojson (x : inference_execution_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | SUCCESS -> `String "SUCCESS"
  | FAILED -> `String "FAILED"

let s3_key_to_yojson = string_to_yojson

let s3_object_to_yojson (x : s3_object) =
  assoc_to_yojson
    [ ("Bucket", Some (s3_bucket_to_yojson x.bucket)); ("Key", Some (s3_key_to_yojson x.key)) ]

let inference_execution_summary_to_yojson (x : inference_execution_summary) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ("ScheduledStartTime", option_to_yojson timestamp_to_yojson x.scheduled_start_time);
      ("DataStartTime", option_to_yojson timestamp_to_yojson x.data_start_time);
      ("DataEndTime", option_to_yojson timestamp_to_yojson x.data_end_time);
      ( "DataInputConfiguration",
        option_to_yojson inference_input_configuration_to_yojson x.data_input_configuration );
      ( "DataOutputConfiguration",
        option_to_yojson inference_output_configuration_to_yojson x.data_output_configuration );
      ("CustomerResultObject", option_to_yojson s3_object_to_yojson x.customer_result_object);
      ("Status", option_to_yojson inference_execution_status_to_yojson x.status);
      ("FailedReason", option_to_yojson bounded_length_string_to_yojson x.failed_reason);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("ModelVersionArn", option_to_yojson model_version_arn_to_yojson x.model_version_arn);
    ]

let inference_execution_summaries_to_yojson tree =
  list_to_yojson inference_execution_summary_to_yojson tree

let list_inference_executions_response_to_yojson (x : list_inference_executions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "InferenceExecutionSummaries",
        option_to_yojson inference_execution_summaries_to_yojson x.inference_execution_summaries );
    ]

let list_inference_executions_request_to_yojson (x : list_inference_executions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
      ("DataStartTimeAfter", option_to_yojson timestamp_to_yojson x.data_start_time_after);
      ("DataEndTimeBefore", option_to_yojson timestamp_to_yojson x.data_end_time_before);
      ("Status", option_to_yojson inference_execution_status_to_yojson x.status);
    ]

let event_duration_in_seconds_to_yojson = long_to_yojson
let model_metrics_to_yojson = string_to_yojson

let inference_event_summary_to_yojson (x : inference_event_summary) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ("EventStartTime", option_to_yojson timestamp_to_yojson x.event_start_time);
      ("EventEndTime", option_to_yojson timestamp_to_yojson x.event_end_time);
      ("Diagnostics", option_to_yojson model_metrics_to_yojson x.diagnostics);
      ( "EventDurationInSeconds",
        option_to_yojson event_duration_in_seconds_to_yojson x.event_duration_in_seconds );
    ]

let inference_event_summaries_to_yojson tree = list_to_yojson inference_event_summary_to_yojson tree

let list_inference_events_response_to_yojson (x : list_inference_events_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "InferenceEventSummaries",
        option_to_yojson inference_event_summaries_to_yojson x.inference_event_summaries );
    ]

let list_inference_events_request_to_yojson (x : list_inference_events_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
      ("IntervalStartTime", Some (timestamp_to_yojson x.interval_start_time));
      ("IntervalEndTime", Some (timestamp_to_yojson x.interval_end_time));
    ]

let dataset_status_to_yojson (x : dataset_status) =
  match x with
  | CREATED -> `String "CREATED"
  | INGESTION_IN_PROGRESS -> `String "INGESTION_IN_PROGRESS"
  | ACTIVE -> `String "ACTIVE"
  | IMPORT_IN_PROGRESS -> `String "IMPORT_IN_PROGRESS"

let dataset_summary_to_yojson (x : dataset_summary) =
  assoc_to_yojson
    [
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let dataset_summaries_to_yojson tree = list_to_yojson dataset_summary_to_yojson tree

let list_datasets_response_to_yojson (x : list_datasets_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("DatasetSummaries", option_to_yojson dataset_summaries_to_yojson x.dataset_summaries);
    ]

let list_datasets_request_to_yojson (x : list_datasets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("DatasetNameBeginsWith", option_to_yojson dataset_name_to_yojson x.dataset_name_begins_with);
    ]

let data_ingestion_job_summary_to_yojson (x : data_ingestion_job_summary) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson ingestion_job_id_to_yojson x.job_id);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ( "IngestionInputConfiguration",
        option_to_yojson ingestion_input_configuration_to_yojson x.ingestion_input_configuration );
      ("Status", option_to_yojson ingestion_job_status_to_yojson x.status);
    ]

let data_ingestion_job_summaries_to_yojson tree =
  list_to_yojson data_ingestion_job_summary_to_yojson tree

let list_data_ingestion_jobs_response_to_yojson (x : list_data_ingestion_jobs_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "DataIngestionJobSummaries",
        option_to_yojson data_ingestion_job_summaries_to_yojson x.data_ingestion_job_summaries );
    ]

let list_data_ingestion_jobs_request_to_yojson (x : list_data_ingestion_jobs_request) =
  assoc_to_yojson
    [
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Status", option_to_yojson ingestion_job_status_to_yojson x.status);
    ]

let import_model_version_response_to_yojson (x : import_model_version_response) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelVersionArn", option_to_yojson model_version_arn_to_yojson x.model_version_arn);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("Status", option_to_yojson model_version_status_to_yojson x.status);
    ]

let inference_data_import_strategy_to_yojson (x : inference_data_import_strategy) =
  match x with
  | NO_IMPORT -> `String "NO_IMPORT"
  | ADD_WHEN_EMPTY -> `String "ADD_WHEN_EMPTY"
  | OVERWRITE -> `String "OVERWRITE"

let import_model_version_request_to_yojson (x : import_model_version_request) =
  assoc_to_yojson
    [
      ("SourceModelVersionArn", Some (model_version_arn_to_yojson x.source_model_version_arn));
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name));
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "InferenceDataImportStrategy",
        option_to_yojson inference_data_import_strategy_to_yojson x.inference_data_import_strategy
      );
    ]

let import_dataset_response_to_yojson (x : import_dataset_response) =
  assoc_to_yojson
    [
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("JobId", option_to_yojson ingestion_job_id_to_yojson x.job_id);
    ]

let import_dataset_request_to_yojson (x : import_dataset_request) =
  assoc_to_yojson
    [
      ("SourceDatasetArn", Some (dataset_arn_to_yojson x.source_dataset_arn));
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let describe_retraining_scheduler_response_to_yojson (x : describe_retraining_scheduler_response) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("RetrainingStartDate", option_to_yojson timestamp_to_yojson x.retraining_start_date);
      ("RetrainingFrequency", option_to_yojson retraining_frequency_to_yojson x.retraining_frequency);
      ("LookbackWindow", option_to_yojson lookback_window_to_yojson x.lookback_window);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
      ("PromoteMode", option_to_yojson model_promote_mode_to_yojson x.promote_mode);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let describe_retraining_scheduler_request_to_yojson (x : describe_retraining_scheduler_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let describe_resource_policy_response_to_yojson (x : describe_resource_policy_response) =
  assoc_to_yojson
    [
      ("PolicyRevisionId", option_to_yojson policy_revision_id_to_yojson x.policy_revision_id);
      ("ResourcePolicy", option_to_yojson policy_to_yojson x.resource_policy);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let describe_resource_policy_request_to_yojson (x : describe_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let auto_promotion_result_reason_to_yojson = string_to_yojson

let auto_promotion_result_to_yojson (x : auto_promotion_result) =
  match x with
  | MODEL_PROMOTED -> `String "MODEL_PROMOTED"
  | MODEL_NOT_PROMOTED -> `String "MODEL_NOT_PROMOTED"
  | RETRAINING_INTERNAL_ERROR -> `String "RETRAINING_INTERNAL_ERROR"
  | RETRAINING_CUSTOMER_ERROR -> `String "RETRAINING_CUSTOMER_ERROR"
  | RETRAINING_CANCELLED -> `String "RETRAINING_CANCELLED"

let data_size_in_bytes_to_yojson = long_to_yojson
let off_condition_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson

let target_sampling_rate_to_yojson (x : target_sampling_rate) =
  match x with
  | PT1S -> `String "PT1S"
  | PT5S -> `String "PT5S"
  | PT10S -> `String "PT10S"
  | PT15S -> `String "PT15S"
  | PT30S -> `String "PT30S"
  | PT1M -> `String "PT1M"
  | PT5M -> `String "PT5M"
  | PT10M -> `String "PT10M"
  | PT15M -> `String "PT15M"
  | PT30M -> `String "PT30M"
  | PT1H -> `String "PT1H"

let data_pre_processing_configuration_to_yojson (x : data_pre_processing_configuration) =
  assoc_to_yojson
    [
      ("TargetSamplingRate", option_to_yojson target_sampling_rate_to_yojson x.target_sampling_rate);
    ]

let inline_data_schema_to_yojson = string_to_yojson

let describe_model_version_response_to_yojson (x : describe_model_version_response) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelVersion", option_to_yojson model_version_to_yojson x.model_version);
      ("ModelVersionArn", option_to_yojson model_version_arn_to_yojson x.model_version_arn);
      ("Status", option_to_yojson model_version_status_to_yojson x.status);
      ("SourceType", option_to_yojson model_version_source_type_to_yojson x.source_type);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("Schema", option_to_yojson inline_data_schema_to_yojson x.schema);
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("TrainingDataStartTime", option_to_yojson timestamp_to_yojson x.training_data_start_time);
      ("TrainingDataEndTime", option_to_yojson timestamp_to_yojson x.training_data_end_time);
      ("EvaluationDataStartTime", option_to_yojson timestamp_to_yojson x.evaluation_data_start_time);
      ("EvaluationDataEndTime", option_to_yojson timestamp_to_yojson x.evaluation_data_end_time);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "DataPreProcessingConfiguration",
        option_to_yojson data_pre_processing_configuration_to_yojson
          x.data_pre_processing_configuration );
      ( "TrainingExecutionStartTime",
        option_to_yojson timestamp_to_yojson x.training_execution_start_time );
      ( "TrainingExecutionEndTime",
        option_to_yojson timestamp_to_yojson x.training_execution_end_time );
      ("FailedReason", option_to_yojson bounded_length_string_to_yojson x.failed_reason);
      ("ModelMetrics", option_to_yojson model_metrics_to_yojson x.model_metrics);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("ServerSideKmsKeyId", option_to_yojson kms_key_arn_to_yojson x.server_side_kms_key_id);
      ("OffCondition", option_to_yojson off_condition_to_yojson x.off_condition);
      ( "SourceModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.source_model_version_arn );
      ("ImportJobStartTime", option_to_yojson timestamp_to_yojson x.import_job_start_time);
      ("ImportJobEndTime", option_to_yojson timestamp_to_yojson x.import_job_end_time);
      ( "ImportedDataSizeInBytes",
        option_to_yojson data_size_in_bytes_to_yojson x.imported_data_size_in_bytes );
      ("PriorModelMetrics", option_to_yojson model_metrics_to_yojson x.prior_model_metrics);
      ( "RetrainingAvailableDataInDays",
        option_to_yojson integer_to_yojson x.retraining_available_data_in_days );
      ( "AutoPromotionResult",
        option_to_yojson auto_promotion_result_to_yojson x.auto_promotion_result );
      ( "AutoPromotionResultReason",
        option_to_yojson auto_promotion_result_reason_to_yojson x.auto_promotion_result_reason );
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
      ( "ModelDiagnosticsResultsObject",
        option_to_yojson s3_object_to_yojson x.model_diagnostics_results_object );
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
    ]

let describe_model_version_request_to_yojson (x : describe_model_version_request) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("ModelVersion", Some (model_version_to_yojson x.model_version));
    ]

let synthesized_json_model_metrics_to_yojson = string_to_yojson
let synthesized_json_inline_data_schema_to_yojson = string_to_yojson

let describe_model_response_to_yojson (x : describe_model_response) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("Schema", option_to_yojson synthesized_json_inline_data_schema_to_yojson x.schema);
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("TrainingDataStartTime", option_to_yojson timestamp_to_yojson x.training_data_start_time);
      ("TrainingDataEndTime", option_to_yojson timestamp_to_yojson x.training_data_end_time);
      ("EvaluationDataStartTime", option_to_yojson timestamp_to_yojson x.evaluation_data_start_time);
      ("EvaluationDataEndTime", option_to_yojson timestamp_to_yojson x.evaluation_data_end_time);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "DataPreProcessingConfiguration",
        option_to_yojson data_pre_processing_configuration_to_yojson
          x.data_pre_processing_configuration );
      ("Status", option_to_yojson model_status_to_yojson x.status);
      ( "TrainingExecutionStartTime",
        option_to_yojson timestamp_to_yojson x.training_execution_start_time );
      ( "TrainingExecutionEndTime",
        option_to_yojson timestamp_to_yojson x.training_execution_end_time );
      ("FailedReason", option_to_yojson bounded_length_string_to_yojson x.failed_reason);
      ("ModelMetrics", option_to_yojson synthesized_json_model_metrics_to_yojson x.model_metrics);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("ServerSideKmsKeyId", option_to_yojson kms_key_arn_to_yojson x.server_side_kms_key_id);
      ("OffCondition", option_to_yojson off_condition_to_yojson x.off_condition);
      ( "SourceModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.source_model_version_arn );
      ("ImportJobStartTime", option_to_yojson timestamp_to_yojson x.import_job_start_time);
      ("ImportJobEndTime", option_to_yojson timestamp_to_yojson x.import_job_end_time);
      ("ActiveModelVersion", option_to_yojson model_version_to_yojson x.active_model_version);
      ( "ActiveModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.active_model_version_arn );
      ("ModelVersionActivatedAt", option_to_yojson timestamp_to_yojson x.model_version_activated_at);
      ( "PreviousActiveModelVersion",
        option_to_yojson model_version_to_yojson x.previous_active_model_version );
      ( "PreviousActiveModelVersionArn",
        option_to_yojson model_version_arn_to_yojson x.previous_active_model_version_arn );
      ( "PreviousModelVersionActivatedAt",
        option_to_yojson timestamp_to_yojson x.previous_model_version_activated_at );
      ( "PriorModelMetrics",
        option_to_yojson synthesized_json_model_metrics_to_yojson x.prior_model_metrics );
      ( "LatestScheduledRetrainingFailedReason",
        option_to_yojson bounded_length_string_to_yojson x.latest_scheduled_retraining_failed_reason
      );
      ( "LatestScheduledRetrainingStatus",
        option_to_yojson model_version_status_to_yojson x.latest_scheduled_retraining_status );
      ( "LatestScheduledRetrainingModelVersion",
        option_to_yojson model_version_to_yojson x.latest_scheduled_retraining_model_version );
      ( "LatestScheduledRetrainingStartTime",
        option_to_yojson timestamp_to_yojson x.latest_scheduled_retraining_start_time );
      ( "LatestScheduledRetrainingAvailableDataInDays",
        option_to_yojson integer_to_yojson x.latest_scheduled_retraining_available_data_in_days );
      ( "NextScheduledRetrainingStartDate",
        option_to_yojson timestamp_to_yojson x.next_scheduled_retraining_start_date );
      ( "AccumulatedInferenceDataStartTime",
        option_to_yojson timestamp_to_yojson x.accumulated_inference_data_start_time );
      ( "AccumulatedInferenceDataEndTime",
        option_to_yojson timestamp_to_yojson x.accumulated_inference_data_end_time );
      ( "RetrainingSchedulerStatus",
        option_to_yojson retraining_scheduler_status_to_yojson x.retraining_scheduler_status );
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
    ]

let describe_model_request_to_yojson (x : describe_model_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let describe_label_group_response_to_yojson (x : describe_label_group_response) =
  assoc_to_yojson
    [
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("FaultCodes", option_to_yojson fault_codes_to_yojson x.fault_codes);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
    ]

let describe_label_group_request_to_yojson (x : describe_label_group_request) =
  assoc_to_yojson [ ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name)) ]

let comments_to_yojson = string_to_yojson

let describe_label_response_to_yojson (x : describe_label_response) =
  assoc_to_yojson
    [
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
      ("LabelId", option_to_yojson label_id_to_yojson x.label_id);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("Rating", option_to_yojson label_rating_to_yojson x.rating);
      ("FaultCode", option_to_yojson fault_code_to_yojson x.fault_code);
      ("Notes", option_to_yojson comments_to_yojson x.notes);
      ("Equipment", option_to_yojson equipment_to_yojson x.equipment);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
    ]

let describe_label_request_to_yojson (x : describe_label_request) =
  assoc_to_yojson
    [
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
      ("LabelId", Some (label_id_to_yojson x.label_id));
    ]

let describe_inference_scheduler_response_to_yojson (x : describe_inference_scheduler_response) =
  assoc_to_yojson
    [
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ( "DataDelayOffsetInMinutes",
        option_to_yojson data_delay_offset_in_minutes_to_yojson x.data_delay_offset_in_minutes );
      ( "DataUploadFrequency",
        option_to_yojson data_upload_frequency_to_yojson x.data_upload_frequency );
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("UpdatedAt", option_to_yojson timestamp_to_yojson x.updated_at);
      ( "DataInputConfiguration",
        option_to_yojson inference_input_configuration_to_yojson x.data_input_configuration );
      ( "DataOutputConfiguration",
        option_to_yojson inference_output_configuration_to_yojson x.data_output_configuration );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("ServerSideKmsKeyId", option_to_yojson kms_key_arn_to_yojson x.server_side_kms_key_id);
      ( "LatestInferenceResult",
        option_to_yojson latest_inference_result_to_yojson x.latest_inference_result );
    ]

let describe_inference_scheduler_request_to_yojson (x : describe_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let list_of_discarded_files_to_yojson tree = list_to_yojson s3_object_to_yojson tree

let ingested_files_summary_to_yojson (x : ingested_files_summary) =
  assoc_to_yojson
    [
      ("TotalNumberOfFiles", Some (integer_to_yojson x.total_number_of_files));
      ("IngestedNumberOfFiles", Some (integer_to_yojson x.ingested_number_of_files));
      ("DiscardedFiles", option_to_yojson list_of_discarded_files_to_yojson x.discarded_files);
    ]

let duplicate_timestamps_to_yojson (x : duplicate_timestamps) =
  assoc_to_yojson
    [
      ( "TotalNumberOfDuplicateTimestamps",
        Some (integer_to_yojson x.total_number_of_duplicate_timestamps) );
    ]

let unsupported_timestamps_to_yojson (x : unsupported_timestamps) =
  assoc_to_yojson
    [
      ( "TotalNumberOfUnsupportedTimestamps",
        Some (integer_to_yojson x.total_number_of_unsupported_timestamps) );
    ]

let invalid_sensor_data_to_yojson (x : invalid_sensor_data) =
  assoc_to_yojson
    [
      ("AffectedSensorCount", Some (integer_to_yojson x.affected_sensor_count));
      ("TotalNumberOfInvalidValues", Some (integer_to_yojson x.total_number_of_invalid_values));
    ]

let missing_sensor_data_to_yojson (x : missing_sensor_data) =
  assoc_to_yojson
    [
      ("AffectedSensorCount", Some (integer_to_yojson x.affected_sensor_count));
      ("TotalNumberOfMissingValues", Some (integer_to_yojson x.total_number_of_missing_values));
    ]

let sensors_with_short_date_range_to_yojson (x : sensors_with_short_date_range) =
  assoc_to_yojson [ ("AffectedSensorCount", Some (integer_to_yojson x.affected_sensor_count)) ]

let missing_complete_sensor_data_to_yojson (x : missing_complete_sensor_data) =
  assoc_to_yojson [ ("AffectedSensorCount", Some (integer_to_yojson x.affected_sensor_count)) ]

let insufficient_sensor_data_to_yojson (x : insufficient_sensor_data) =
  assoc_to_yojson
    [
      ( "MissingCompleteSensorData",
        Some (missing_complete_sensor_data_to_yojson x.missing_complete_sensor_data) );
      ( "SensorsWithShortDateRange",
        Some (sensors_with_short_date_range_to_yojson x.sensors_with_short_date_range) );
    ]

let data_quality_summary_to_yojson (x : data_quality_summary) =
  assoc_to_yojson
    [
      ( "InsufficientSensorData",
        Some (insufficient_sensor_data_to_yojson x.insufficient_sensor_data) );
      ("MissingSensorData", Some (missing_sensor_data_to_yojson x.missing_sensor_data));
      ("InvalidSensorData", Some (invalid_sensor_data_to_yojson x.invalid_sensor_data));
      ("UnsupportedTimestamps", Some (unsupported_timestamps_to_yojson x.unsupported_timestamps));
      ("DuplicateTimestamps", Some (duplicate_timestamps_to_yojson x.duplicate_timestamps));
    ]

let describe_dataset_response_to_yojson (x : describe_dataset_response) =
  assoc_to_yojson
    [
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("LastUpdatedAt", option_to_yojson timestamp_to_yojson x.last_updated_at);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
      ("Schema", option_to_yojson synthesized_json_inline_data_schema_to_yojson x.schema);
      ("ServerSideKmsKeyId", option_to_yojson kms_key_arn_to_yojson x.server_side_kms_key_id);
      ( "IngestionInputConfiguration",
        option_to_yojson ingestion_input_configuration_to_yojson x.ingestion_input_configuration );
      ("DataQualitySummary", option_to_yojson data_quality_summary_to_yojson x.data_quality_summary);
      ( "IngestedFilesSummary",
        option_to_yojson ingested_files_summary_to_yojson x.ingested_files_summary );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("DataStartTime", option_to_yojson timestamp_to_yojson x.data_start_time);
      ("DataEndTime", option_to_yojson timestamp_to_yojson x.data_end_time);
      ("SourceDatasetArn", option_to_yojson dataset_arn_to_yojson x.source_dataset_arn);
    ]

let describe_dataset_request_to_yojson (x : describe_dataset_request) =
  assoc_to_yojson [ ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name)) ]

let describe_data_ingestion_job_response_to_yojson (x : describe_data_ingestion_job_response) =
  assoc_to_yojson
    [
      ("JobId", option_to_yojson ingestion_job_id_to_yojson x.job_id);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ( "IngestionInputConfiguration",
        option_to_yojson ingestion_input_configuration_to_yojson x.ingestion_input_configuration );
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ("CreatedAt", option_to_yojson timestamp_to_yojson x.created_at);
      ("Status", option_to_yojson ingestion_job_status_to_yojson x.status);
      ("FailedReason", option_to_yojson bounded_length_string_to_yojson x.failed_reason);
      ("DataQualitySummary", option_to_yojson data_quality_summary_to_yojson x.data_quality_summary);
      ( "IngestedFilesSummary",
        option_to_yojson ingested_files_summary_to_yojson x.ingested_files_summary );
      ("StatusDetail", option_to_yojson bounded_length_string_to_yojson x.status_detail);
      ("IngestedDataSize", option_to_yojson data_size_in_bytes_to_yojson x.ingested_data_size);
      ("DataStartTime", option_to_yojson timestamp_to_yojson x.data_start_time);
      ("DataEndTime", option_to_yojson timestamp_to_yojson x.data_end_time);
      ("SourceDatasetArn", option_to_yojson dataset_arn_to_yojson x.source_dataset_arn);
    ]

let describe_data_ingestion_job_request_to_yojson (x : describe_data_ingestion_job_request) =
  assoc_to_yojson [ ("JobId", Some (ingestion_job_id_to_yojson x.job_id)) ]

let delete_retraining_scheduler_request_to_yojson (x : delete_retraining_scheduler_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let delete_resource_policy_request_to_yojson (x : delete_resource_policy_request) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let delete_model_request_to_yojson (x : delete_model_request) =
  assoc_to_yojson [ ("ModelName", Some (model_name_to_yojson x.model_name)) ]

let delete_label_group_request_to_yojson (x : delete_label_group_request) =
  assoc_to_yojson [ ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name)) ]

let delete_label_request_to_yojson (x : delete_label_request) =
  assoc_to_yojson
    [
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
      ("LabelId", Some (label_id_to_yojson x.label_id));
    ]

let delete_inference_scheduler_request_to_yojson (x : delete_inference_scheduler_request) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerName",
        Some (inference_scheduler_identifier_to_yojson x.inference_scheduler_name) );
    ]

let delete_dataset_request_to_yojson (x : delete_dataset_request) =
  assoc_to_yojson [ ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name)) ]

let create_retraining_scheduler_response_to_yojson (x : create_retraining_scheduler_response) =
  assoc_to_yojson
    [
      ("ModelName", option_to_yojson model_name_to_yojson x.model_name);
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("Status", option_to_yojson retraining_scheduler_status_to_yojson x.status);
    ]

let create_retraining_scheduler_request_to_yojson (x : create_retraining_scheduler_request) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("RetrainingStartDate", option_to_yojson timestamp_to_yojson x.retraining_start_date);
      ("RetrainingFrequency", Some (retraining_frequency_to_yojson x.retraining_frequency));
      ("LookbackWindow", Some (lookback_window_to_yojson x.lookback_window));
      ("PromoteMode", option_to_yojson model_promote_mode_to_yojson x.promote_mode);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
    ]

let create_model_response_to_yojson (x : create_model_response) =
  assoc_to_yojson
    [
      ("ModelArn", option_to_yojson model_arn_to_yojson x.model_arn);
      ("Status", option_to_yojson model_status_to_yojson x.status);
    ]

let dataset_schema_to_yojson (x : dataset_schema) =
  assoc_to_yojson
    [
      ( "InlineDataSchema",
        option_to_yojson synthesized_json_inline_data_schema_to_yojson x.inline_data_schema );
    ]

let create_model_request_to_yojson (x : create_model_request) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ("DatasetName", Some (dataset_identifier_to_yojson x.dataset_name));
      ("DatasetSchema", option_to_yojson dataset_schema_to_yojson x.dataset_schema);
      ( "LabelsInputConfiguration",
        option_to_yojson labels_input_configuration_to_yojson x.labels_input_configuration );
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("TrainingDataStartTime", option_to_yojson timestamp_to_yojson x.training_data_start_time);
      ("TrainingDataEndTime", option_to_yojson timestamp_to_yojson x.training_data_end_time);
      ("EvaluationDataStartTime", option_to_yojson timestamp_to_yojson x.evaluation_data_start_time);
      ("EvaluationDataEndTime", option_to_yojson timestamp_to_yojson x.evaluation_data_end_time);
      ("RoleArn", option_to_yojson iam_role_arn_to_yojson x.role_arn);
      ( "DataPreProcessingConfiguration",
        option_to_yojson data_pre_processing_configuration_to_yojson
          x.data_pre_processing_configuration );
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("OffCondition", option_to_yojson off_condition_to_yojson x.off_condition);
      ( "ModelDiagnosticsOutputConfiguration",
        option_to_yojson model_diagnostics_output_configuration_to_yojson
          x.model_diagnostics_output_configuration );
    ]

let create_label_group_response_to_yojson (x : create_label_group_response) =
  assoc_to_yojson
    [
      ("LabelGroupName", option_to_yojson label_group_name_to_yojson x.label_group_name);
      ("LabelGroupArn", option_to_yojson label_group_arn_to_yojson x.label_group_arn);
    ]

let create_label_group_request_to_yojson (x : create_label_group_request) =
  assoc_to_yojson
    [
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
      ("FaultCodes", option_to_yojson fault_codes_to_yojson x.fault_codes);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_label_response_to_yojson (x : create_label_response) =
  assoc_to_yojson [ ("LabelId", option_to_yojson label_id_to_yojson x.label_id) ]

let create_label_request_to_yojson (x : create_label_request) =
  assoc_to_yojson
    [
      ("LabelGroupName", Some (label_group_name_to_yojson x.label_group_name));
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("EndTime", Some (timestamp_to_yojson x.end_time));
      ("Rating", Some (label_rating_to_yojson x.rating));
      ("FaultCode", option_to_yojson fault_code_to_yojson x.fault_code);
      ("Notes", option_to_yojson comments_to_yojson x.notes);
      ("Equipment", option_to_yojson equipment_to_yojson x.equipment);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
    ]

let create_inference_scheduler_response_to_yojson (x : create_inference_scheduler_response) =
  assoc_to_yojson
    [
      ( "InferenceSchedulerArn",
        option_to_yojson inference_scheduler_arn_to_yojson x.inference_scheduler_arn );
      ( "InferenceSchedulerName",
        option_to_yojson inference_scheduler_name_to_yojson x.inference_scheduler_name );
      ("Status", option_to_yojson inference_scheduler_status_to_yojson x.status);
      ("ModelQuality", option_to_yojson model_quality_to_yojson x.model_quality);
    ]

let create_inference_scheduler_request_to_yojson (x : create_inference_scheduler_request) =
  assoc_to_yojson
    [
      ("ModelName", Some (model_name_to_yojson x.model_name));
      ( "InferenceSchedulerName",
        Some (inference_scheduler_name_to_yojson x.inference_scheduler_name) );
      ( "DataDelayOffsetInMinutes",
        option_to_yojson data_delay_offset_in_minutes_to_yojson x.data_delay_offset_in_minutes );
      ("DataUploadFrequency", Some (data_upload_frequency_to_yojson x.data_upload_frequency));
      ( "DataInputConfiguration",
        Some (inference_input_configuration_to_yojson x.data_input_configuration) );
      ( "DataOutputConfiguration",
        Some (inference_output_configuration_to_yojson x.data_output_configuration) );
      ("RoleArn", Some (iam_role_arn_to_yojson x.role_arn));
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_dataset_response_to_yojson (x : create_dataset_response) =
  assoc_to_yojson
    [
      ("DatasetName", option_to_yojson dataset_name_to_yojson x.dataset_name);
      ("DatasetArn", option_to_yojson dataset_arn_to_yojson x.dataset_arn);
      ("Status", option_to_yojson dataset_status_to_yojson x.status);
    ]

let create_dataset_request_to_yojson (x : create_dataset_request) =
  assoc_to_yojson
    [
      ("DatasetName", Some (dataset_name_to_yojson x.dataset_name));
      ("DatasetSchema", option_to_yojson dataset_schema_to_yojson x.dataset_schema);
      ("ServerSideKmsKeyId", option_to_yojson name_or_arn_to_yojson x.server_side_kms_key_id);
      ("ClientToken", Some (idempotence_token_to_yojson x.client_token));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]
