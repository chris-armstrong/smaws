open Smaws_Lib.Json.SerializeHelpers
open Types

let service_error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson service_error_message_to_yojson x.message) ]

let amazon_resource_name_to_yojson = string_to_yojson

let sns_configuration_to_yojson (x : sns_configuration) =
  assoc_to_yojson [ ("TopicArn", Some (amazon_resource_name_to_yojson x.topic_arn)) ]

let account_settings_notification_configuration_to_yojson
    (x : account_settings_notification_configuration) =
  assoc_to_yojson
    [
      ("SnsConfiguration", option_to_yojson sns_configuration_to_yojson x.sns_configuration);
      ("RoleArn", Some (amazon_resource_name_to_yojson x.role_arn));
    ]

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_endpoint_exception_to_yojson (x : invalid_endpoint_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let string__to_yojson = string_to_yojson

let cancel_query_response_to_yojson (x : cancel_query_response) =
  assoc_to_yojson
    [ ("CancellationMessage", option_to_yojson string__to_yojson x.cancellation_message) ]

let query_id_to_yojson = string_to_yojson

let cancel_query_request_to_yojson (x : cancel_query_request) =
  assoc_to_yojson [ ("QueryId", Some (query_id_to_yojson x.query_id)) ]

let client_request_token_to_yojson = string_to_yojson
let client_token_to_yojson = string_to_yojson

let scalar_type_to_yojson (x : scalar_type) =
  match x with
  | VARCHAR -> `String "VARCHAR"
  | BOOLEAN -> `String "BOOLEAN"
  | BIGINT -> `String "BIGINT"
  | DOUBLE -> `String "DOUBLE"
  | TIMESTAMP -> `String "TIMESTAMP"
  | DATE -> `String "DATE"
  | TIME -> `String "TIME"
  | INTERVAL_DAY_TO_SECOND -> `String "INTERVAL_DAY_TO_SECOND"
  | INTERVAL_YEAR_TO_MONTH -> `String "INTERVAL_YEAR_TO_MONTH"
  | UNKNOWN -> `String "UNKNOWN"
  | INTEGER -> `String "INTEGER"

let rec type__to_yojson (x : type_) =
  assoc_to_yojson
    [
      ("ScalarType", option_to_yojson scalar_type_to_yojson x.scalar_type);
      ("ArrayColumnInfo", option_to_yojson column_info_to_yojson x.array_column_info);
      ( "TimeSeriesMeasureValueColumnInfo",
        option_to_yojson column_info_to_yojson x.time_series_measure_value_column_info );
      ("RowColumnInfo", option_to_yojson column_info_list_to_yojson x.row_column_info);
    ]

and column_info_list_to_yojson tree = list_to_yojson column_info_to_yojson tree

and column_info_to_yojson (x : column_info) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name); ("Type", Some (type__to_yojson x.type_));
    ]

let compute_mode_to_yojson (x : compute_mode) =
  match x with ON_DEMAND -> `String "ON_DEMAND" | PROVISIONED -> `String "PROVISIONED"

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_scheduled_query_response_to_yojson (x : create_scheduled_query_response) =
  assoc_to_yojson [ ("Arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let s3_encryption_option_to_yojson (x : s3_encryption_option) =
  match x with SSE_S3 -> `String "SSE_S3" | SSE_KMS -> `String "SSE_KMS"

let s3_object_key_prefix_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("BucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
      ("ObjectKeyPrefix", option_to_yojson s3_object_key_prefix_to_yojson x.object_key_prefix);
      ("EncryptionOption", option_to_yojson s3_encryption_option_to_yojson x.encryption_option);
    ]

let error_report_configuration_to_yojson (x : error_report_configuration) =
  assoc_to_yojson [ ("S3Configuration", Some (s3_configuration_to_yojson x.s3_configuration)) ]

let string_value2048_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let schema_name_to_yojson = string_to_yojson

let scalar_measure_value_type_to_yojson (x : scalar_measure_value_type) =
  match x with
  | BIGINT -> `String "BIGINT"
  | BOOLEAN -> `String "BOOLEAN"
  | DOUBLE -> `String "DOUBLE"
  | VARCHAR -> `String "VARCHAR"
  | TIMESTAMP -> `String "TIMESTAMP"

let multi_measure_attribute_mapping_to_yojson (x : multi_measure_attribute_mapping) =
  assoc_to_yojson
    [
      ("SourceColumn", Some (schema_name_to_yojson x.source_column));
      ( "TargetMultiMeasureAttributeName",
        option_to_yojson schema_name_to_yojson x.target_multi_measure_attribute_name );
      ("MeasureValueType", Some (scalar_measure_value_type_to_yojson x.measure_value_type));
    ]

let multi_measure_attribute_mapping_list_to_yojson tree =
  list_to_yojson multi_measure_attribute_mapping_to_yojson tree

let measure_value_type_to_yojson (x : measure_value_type) =
  match x with
  | BIGINT -> `String "BIGINT"
  | BOOLEAN -> `String "BOOLEAN"
  | DOUBLE -> `String "DOUBLE"
  | VARCHAR -> `String "VARCHAR"
  | MULTI -> `String "MULTI"

let mixed_measure_mapping_to_yojson (x : mixed_measure_mapping) =
  assoc_to_yojson
    [
      ("MeasureName", option_to_yojson schema_name_to_yojson x.measure_name);
      ("SourceColumn", option_to_yojson schema_name_to_yojson x.source_column);
      ("TargetMeasureName", option_to_yojson schema_name_to_yojson x.target_measure_name);
      ("MeasureValueType", Some (measure_value_type_to_yojson x.measure_value_type));
      ( "MultiMeasureAttributeMappings",
        option_to_yojson multi_measure_attribute_mapping_list_to_yojson
          x.multi_measure_attribute_mappings );
    ]

let mixed_measure_mapping_list_to_yojson tree = list_to_yojson mixed_measure_mapping_to_yojson tree

let multi_measure_mappings_to_yojson (x : multi_measure_mappings) =
  assoc_to_yojson
    [
      ("TargetMultiMeasureName", option_to_yojson schema_name_to_yojson x.target_multi_measure_name);
      ( "MultiMeasureAttributeMappings",
        Some (multi_measure_attribute_mapping_list_to_yojson x.multi_measure_attribute_mappings) );
    ]

let dimension_value_type_to_yojson (x : dimension_value_type) =
  match x with VARCHAR -> `String "VARCHAR"

let dimension_mapping_to_yojson (x : dimension_mapping) =
  assoc_to_yojson
    [
      ("Name", Some (schema_name_to_yojson x.name));
      ("DimensionValueType", Some (dimension_value_type_to_yojson x.dimension_value_type));
    ]

let dimension_mapping_list_to_yojson tree = list_to_yojson dimension_mapping_to_yojson tree
let resource_name_to_yojson = string_to_yojson

let timestream_configuration_to_yojson (x : timestream_configuration) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
      ("TableName", Some (resource_name_to_yojson x.table_name));
      ("TimeColumn", Some (schema_name_to_yojson x.time_column));
      ("DimensionMappings", Some (dimension_mapping_list_to_yojson x.dimension_mappings));
      ( "MultiMeasureMappings",
        option_to_yojson multi_measure_mappings_to_yojson x.multi_measure_mappings );
      ( "MixedMeasureMappings",
        option_to_yojson mixed_measure_mapping_list_to_yojson x.mixed_measure_mappings );
      ("MeasureNameColumn", option_to_yojson schema_name_to_yojson x.measure_name_column);
    ]

let target_configuration_to_yojson (x : target_configuration) =
  assoc_to_yojson
    [
      ( "TimestreamConfiguration",
        Some (timestream_configuration_to_yojson x.timestream_configuration) );
    ]

let notification_configuration_to_yojson (x : notification_configuration) =
  assoc_to_yojson [ ("SnsConfiguration", Some (sns_configuration_to_yojson x.sns_configuration)) ]

let schedule_expression_to_yojson = string_to_yojson

let schedule_configuration_to_yojson (x : schedule_configuration) =
  assoc_to_yojson
    [ ("ScheduleExpression", Some (schedule_expression_to_yojson x.schedule_expression)) ]

let query_string_to_yojson = string_to_yojson
let scheduled_query_name_to_yojson = string_to_yojson

let create_scheduled_query_request_to_yojson (x : create_scheduled_query_request) =
  assoc_to_yojson
    [
      ("Name", Some (scheduled_query_name_to_yojson x.name));
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("ScheduleConfiguration", Some (schedule_configuration_to_yojson x.schedule_configuration));
      ( "NotificationConfiguration",
        Some (notification_configuration_to_yojson x.notification_configuration) );
      ("TargetConfiguration", option_to_yojson target_configuration_to_yojson x.target_configuration);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "ScheduledQueryExecutionRoleArn",
        Some (amazon_resource_name_to_yojson x.scheduled_query_execution_role_arn) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ( "ErrorReportConfiguration",
        Some (error_report_configuration_to_yojson x.error_report_configuration) );
    ]

let nullable_boolean_to_yojson = bool_to_yojson
let timestamp_to_yojson = string_to_yojson
let scalar_value_to_yojson = string_to_yojson

let rec time_series_data_point_list_to_yojson tree =
  list_to_yojson time_series_data_point_to_yojson tree

and time_series_data_point_to_yojson (x : time_series_data_point) =
  assoc_to_yojson
    [ ("Time", Some (timestamp_to_yojson x.time)); ("Value", Some (datum_to_yojson x.value)) ]

and row_to_yojson (x : row) = assoc_to_yojson [ ("Data", Some (datum_list_to_yojson x.data)) ]
and datum_list_to_yojson tree = list_to_yojson datum_to_yojson tree

and datum_to_yojson (x : datum) =
  assoc_to_yojson
    [
      ("ScalarValue", option_to_yojson scalar_value_to_yojson x.scalar_value);
      ("TimeSeriesValue", option_to_yojson time_series_data_point_list_to_yojson x.time_series_value);
      ("ArrayValue", option_to_yojson datum_list_to_yojson x.array_value);
      ("RowValue", option_to_yojson row_to_yojson x.row_value);
      ("NullValue", option_to_yojson nullable_boolean_to_yojson x.null_value);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ScheduledQueryArn", option_to_yojson amazon_resource_name_to_yojson x.scheduled_query_arn);
    ]

let delete_scheduled_query_request_to_yojson (x : delete_scheduled_query_request) =
  assoc_to_yojson
    [ ("ScheduledQueryArn", Some (amazon_resource_name_to_yojson x.scheduled_query_arn)) ]

let last_update_status_to_yojson (x : last_update_status) =
  match x with
  | PENDING -> `String "PENDING"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"

let query_tc_u_to_yojson = int_to_yojson

let last_update_to_yojson (x : last_update) =
  assoc_to_yojson
    [
      ("TargetQueryTCU", option_to_yojson query_tc_u_to_yojson x.target_query_tc_u);
      ("Status", option_to_yojson last_update_status_to_yojson x.status);
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
    ]

let provisioned_capacity_response_to_yojson (x : provisioned_capacity_response) =
  assoc_to_yojson
    [
      ("ActiveQueryTCU", option_to_yojson query_tc_u_to_yojson x.active_query_tc_u);
      ( "NotificationConfiguration",
        option_to_yojson account_settings_notification_configuration_to_yojson
          x.notification_configuration );
      ("LastUpdate", option_to_yojson last_update_to_yojson x.last_update);
    ]

let query_compute_response_to_yojson (x : query_compute_response) =
  assoc_to_yojson
    [
      ("ComputeMode", option_to_yojson compute_mode_to_yojson x.compute_mode);
      ( "ProvisionedCapacity",
        option_to_yojson provisioned_capacity_response_to_yojson x.provisioned_capacity );
    ]

let query_pricing_model_to_yojson (x : query_pricing_model) =
  match x with BYTES_SCANNED -> `String "BYTES_SCANNED" | COMPUTE_UNITS -> `String "COMPUTE_UNITS"

let max_query_capacity_to_yojson = int_to_yojson

let describe_account_settings_response_to_yojson (x : describe_account_settings_response) =
  assoc_to_yojson
    [
      ("MaxQueryTCU", option_to_yojson max_query_capacity_to_yojson x.max_query_tc_u);
      ("QueryPricingModel", option_to_yojson query_pricing_model_to_yojson x.query_pricing_model);
      ("QueryCompute", option_to_yojson query_compute_response_to_yojson x.query_compute);
    ]

let describe_account_settings_request_to_yojson = unit_to_yojson
let long_to_yojson = long_to_yojson

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("Address", Some (string__to_yojson x.address));
      ("CachePeriodInMinutes", Some (long_to_yojson x.cache_period_in_minutes));
    ]

let endpoints_to_yojson tree = list_to_yojson endpoint_to_yojson tree

let describe_endpoints_response_to_yojson (x : describe_endpoints_response) =
  assoc_to_yojson [ ("Endpoints", Some (endpoints_to_yojson x.endpoints)) ]

let describe_endpoints_request_to_yojson = unit_to_yojson
let s3_object_key_to_yojson = string_to_yojson

let s3_report_location_to_yojson (x : s3_report_location) =
  assoc_to_yojson
    [
      ("BucketName", option_to_yojson s3_bucket_name_to_yojson x.bucket_name);
      ("ObjectKey", option_to_yojson s3_object_key_to_yojson x.object_key);
    ]

let error_report_location_to_yojson (x : error_report_location) =
  assoc_to_yojson
    [ ("S3ReportLocation", option_to_yojson s3_report_location_to_yojson x.s3_report_location) ]

let query_temporal_range_max_to_yojson (x : query_temporal_range_max) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson long_to_yojson x.value);
      ("TableArn", option_to_yojson amazon_resource_name_to_yojson x.table_arn);
    ]

let query_temporal_range_to_yojson (x : query_temporal_range) =
  assoc_to_yojson [ ("Max", option_to_yojson query_temporal_range_max_to_yojson x.max) ]

let partition_key_to_yojson = string_to_yojson
let partition_key_list_to_yojson tree = list_to_yojson partition_key_to_yojson tree
let double_to_yojson = double_to_yojson

let query_spatial_coverage_max_to_yojson (x : query_spatial_coverage_max) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson double_to_yojson x.value);
      ("TableArn", option_to_yojson amazon_resource_name_to_yojson x.table_arn);
      ("PartitionKey", option_to_yojson partition_key_list_to_yojson x.partition_key);
    ]

let query_spatial_coverage_to_yojson (x : query_spatial_coverage) =
  assoc_to_yojson [ ("Max", option_to_yojson query_spatial_coverage_max_to_yojson x.max) ]

let scheduled_query_insights_response_to_yojson (x : scheduled_query_insights_response) =
  assoc_to_yojson
    [
      ( "QuerySpatialCoverage",
        option_to_yojson query_spatial_coverage_to_yojson x.query_spatial_coverage );
      ("QueryTemporalRange", option_to_yojson query_temporal_range_to_yojson x.query_temporal_range);
      ("QueryTableCount", option_to_yojson long_to_yojson x.query_table_count);
      ("OutputRows", option_to_yojson long_to_yojson x.output_rows);
      ("OutputBytes", option_to_yojson long_to_yojson x.output_bytes);
    ]

let execution_stats_to_yojson (x : execution_stats) =
  assoc_to_yojson
    [
      ("ExecutionTimeInMillis", option_to_yojson long_to_yojson x.execution_time_in_millis);
      ("DataWrites", option_to_yojson long_to_yojson x.data_writes);
      ("BytesMetered", option_to_yojson long_to_yojson x.bytes_metered);
      ("CumulativeBytesScanned", option_to_yojson long_to_yojson x.cumulative_bytes_scanned);
      ("RecordsIngested", option_to_yojson long_to_yojson x.records_ingested);
      ("QueryResultRows", option_to_yojson long_to_yojson x.query_result_rows);
    ]

let scheduled_query_run_status_to_yojson (x : scheduled_query_run_status) =
  match x with
  | AUTO_TRIGGER_SUCCESS -> `String "AUTO_TRIGGER_SUCCESS"
  | AUTO_TRIGGER_FAILURE -> `String "AUTO_TRIGGER_FAILURE"
  | MANUAL_TRIGGER_SUCCESS -> `String "MANUAL_TRIGGER_SUCCESS"
  | MANUAL_TRIGGER_FAILURE -> `String "MANUAL_TRIGGER_FAILURE"

let time_to_yojson = timestamp_epoch_seconds_to_yojson

let scheduled_query_run_summary_to_yojson (x : scheduled_query_run_summary) =
  assoc_to_yojson
    [
      ("InvocationTime", option_to_yojson time_to_yojson x.invocation_time);
      ("TriggerTime", option_to_yojson time_to_yojson x.trigger_time);
      ("RunStatus", option_to_yojson scheduled_query_run_status_to_yojson x.run_status);
      ("ExecutionStats", option_to_yojson execution_stats_to_yojson x.execution_stats);
      ( "QueryInsightsResponse",
        option_to_yojson scheduled_query_insights_response_to_yojson x.query_insights_response );
      ( "ErrorReportLocation",
        option_to_yojson error_report_location_to_yojson x.error_report_location );
      ("FailureReason", option_to_yojson error_message_to_yojson x.failure_reason);
    ]

let scheduled_query_run_summary_list_to_yojson tree =
  list_to_yojson scheduled_query_run_summary_to_yojson tree

let scheduled_query_state_to_yojson (x : scheduled_query_state) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let scheduled_query_description_to_yojson (x : scheduled_query_description) =
  assoc_to_yojson
    [
      ("Arn", Some (amazon_resource_name_to_yojson x.arn));
      ("Name", Some (scheduled_query_name_to_yojson x.name));
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("State", Some (scheduled_query_state_to_yojson x.state));
      ("PreviousInvocationTime", option_to_yojson time_to_yojson x.previous_invocation_time);
      ("NextInvocationTime", option_to_yojson time_to_yojson x.next_invocation_time);
      ("ScheduleConfiguration", Some (schedule_configuration_to_yojson x.schedule_configuration));
      ( "NotificationConfiguration",
        Some (notification_configuration_to_yojson x.notification_configuration) );
      ("TargetConfiguration", option_to_yojson target_configuration_to_yojson x.target_configuration);
      ( "ScheduledQueryExecutionRoleArn",
        option_to_yojson amazon_resource_name_to_yojson x.scheduled_query_execution_role_arn );
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ( "ErrorReportConfiguration",
        option_to_yojson error_report_configuration_to_yojson x.error_report_configuration );
      ("LastRunSummary", option_to_yojson scheduled_query_run_summary_to_yojson x.last_run_summary);
      ( "RecentlyFailedRuns",
        option_to_yojson scheduled_query_run_summary_list_to_yojson x.recently_failed_runs );
    ]

let describe_scheduled_query_response_to_yojson (x : describe_scheduled_query_response) =
  assoc_to_yojson
    [ ("ScheduledQuery", Some (scheduled_query_description_to_yojson x.scheduled_query)) ]

let describe_scheduled_query_request_to_yojson (x : describe_scheduled_query_request) =
  assoc_to_yojson
    [ ("ScheduledQueryArn", Some (amazon_resource_name_to_yojson x.scheduled_query_arn)) ]

let scheduled_query_insights_mode_to_yojson (x : scheduled_query_insights_mode) =
  match x with
  | ENABLED_WITH_RATE_CONTROL -> `String "ENABLED_WITH_RATE_CONTROL"
  | DISABLED -> `String "DISABLED"

let scheduled_query_insights_to_yojson (x : scheduled_query_insights) =
  assoc_to_yojson [ ("Mode", Some (scheduled_query_insights_mode_to_yojson x.mode)) ]

let execute_scheduled_query_request_to_yojson (x : execute_scheduled_query_request) =
  assoc_to_yojson
    [
      ("ScheduledQueryArn", Some (amazon_resource_name_to_yojson x.scheduled_query_arn));
      ("InvocationTime", Some (time_to_yojson x.invocation_time));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("QueryInsights", option_to_yojson scheduled_query_insights_to_yojson x.query_insights);
    ]

let next_scheduled_queries_results_token_to_yojson = string_to_yojson

let timestream_destination_to_yojson (x : timestream_destination) =
  assoc_to_yojson
    [
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("TableName", option_to_yojson resource_name_to_yojson x.table_name);
    ]

let target_destination_to_yojson (x : target_destination) =
  assoc_to_yojson
    [
      ( "TimestreamDestination",
        option_to_yojson timestream_destination_to_yojson x.timestream_destination );
    ]

let scheduled_query_to_yojson (x : scheduled_query) =
  assoc_to_yojson
    [
      ("Arn", Some (amazon_resource_name_to_yojson x.arn));
      ("Name", Some (scheduled_query_name_to_yojson x.name));
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("State", Some (scheduled_query_state_to_yojson x.state));
      ("PreviousInvocationTime", option_to_yojson time_to_yojson x.previous_invocation_time);
      ("NextInvocationTime", option_to_yojson time_to_yojson x.next_invocation_time);
      ( "ErrorReportConfiguration",
        option_to_yojson error_report_configuration_to_yojson x.error_report_configuration );
      ("TargetDestination", option_to_yojson target_destination_to_yojson x.target_destination);
      ("LastRunStatus", option_to_yojson scheduled_query_run_status_to_yojson x.last_run_status);
    ]

let scheduled_query_list_to_yojson tree = list_to_yojson scheduled_query_to_yojson tree

let list_scheduled_queries_response_to_yojson (x : list_scheduled_queries_response) =
  assoc_to_yojson
    [
      ("ScheduledQueries", Some (scheduled_query_list_to_yojson x.scheduled_queries));
      ("NextToken", option_to_yojson next_scheduled_queries_results_token_to_yojson x.next_token);
    ]

let max_scheduled_queries_results_to_yojson = int_to_yojson

let list_scheduled_queries_request_to_yojson (x : list_scheduled_queries_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_scheduled_queries_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_scheduled_queries_results_token_to_yojson x.next_token);
    ]

let next_tags_for_resource_results_token_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("NextToken", option_to_yojson next_tags_for_resource_results_token_to_yojson x.next_token);
    ]

let max_tags_for_resource_result_to_yojson = int_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("MaxResults", option_to_yojson max_tags_for_resource_result_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_tags_for_resource_results_token_to_yojson x.next_token);
    ]

let max_query_results_to_yojson = int_to_yojson
let pagination_token_to_yojson = string_to_yojson

let parameter_mapping_to_yojson (x : parameter_mapping) =
  assoc_to_yojson
    [ ("Name", Some (string__to_yojson x.name)); ("Type", Some (type__to_yojson x.type_)) ]

let parameter_mapping_list_to_yojson tree = list_to_yojson parameter_mapping_to_yojson tree

let select_column_to_yojson (x : select_column) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("Type", option_to_yojson type__to_yojson x.type_);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("TableName", option_to_yojson resource_name_to_yojson x.table_name);
      ("Aliased", option_to_yojson nullable_boolean_to_yojson x.aliased);
    ]

let select_column_list_to_yojson tree = list_to_yojson select_column_to_yojson tree

let prepare_query_response_to_yojson (x : prepare_query_response) =
  assoc_to_yojson
    [
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("Columns", Some (select_column_list_to_yojson x.columns));
      ("Parameters", Some (parameter_mapping_list_to_yojson x.parameters));
    ]

let prepare_query_request_to_yojson (x : prepare_query_request) =
  assoc_to_yojson
    [
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("ValidateOnly", option_to_yojson nullable_boolean_to_yojson x.validate_only);
    ]

let provisioned_capacity_request_to_yojson (x : provisioned_capacity_request) =
  assoc_to_yojson
    [
      ("TargetQueryTCU", Some (query_tc_u_to_yojson x.target_query_tc_u));
      ( "NotificationConfiguration",
        option_to_yojson account_settings_notification_configuration_to_yojson
          x.notification_configuration );
    ]

let query_execution_exception_to_yojson (x : query_execution_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let query_insights_response_to_yojson (x : query_insights_response) =
  assoc_to_yojson
    [
      ( "QuerySpatialCoverage",
        option_to_yojson query_spatial_coverage_to_yojson x.query_spatial_coverage );
      ("QueryTemporalRange", option_to_yojson query_temporal_range_to_yojson x.query_temporal_range);
      ("QueryTableCount", option_to_yojson long_to_yojson x.query_table_count);
      ("OutputRows", option_to_yojson long_to_yojson x.output_rows);
      ("OutputBytes", option_to_yojson long_to_yojson x.output_bytes);
      ("UnloadPartitionCount", option_to_yojson long_to_yojson x.unload_partition_count);
      ("UnloadWrittenRows", option_to_yojson long_to_yojson x.unload_written_rows);
      ("UnloadWrittenBytes", option_to_yojson long_to_yojson x.unload_written_bytes);
    ]

let query_status_to_yojson (x : query_status) =
  assoc_to_yojson
    [
      ("ProgressPercentage", option_to_yojson double_to_yojson x.progress_percentage);
      ("CumulativeBytesScanned", option_to_yojson long_to_yojson x.cumulative_bytes_scanned);
      ("CumulativeBytesMetered", option_to_yojson long_to_yojson x.cumulative_bytes_metered);
    ]

let row_list_to_yojson tree = list_to_yojson row_to_yojson tree

let query_response_to_yojson (x : query_response) =
  assoc_to_yojson
    [
      ("QueryId", Some (query_id_to_yojson x.query_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Rows", Some (row_list_to_yojson x.rows));
      ("ColumnInfo", Some (column_info_list_to_yojson x.column_info));
      ("QueryStatus", option_to_yojson query_status_to_yojson x.query_status);
      ( "QueryInsightsResponse",
        option_to_yojson query_insights_response_to_yojson x.query_insights_response );
    ]

let query_insights_mode_to_yojson (x : query_insights_mode) =
  match x with
  | ENABLED_WITH_RATE_CONTROL -> `String "ENABLED_WITH_RATE_CONTROL"
  | DISABLED -> `String "DISABLED"

let query_insights_to_yojson (x : query_insights) =
  assoc_to_yojson [ ("Mode", Some (query_insights_mode_to_yojson x.mode)) ]

let query_request_to_yojson (x : query_request) =
  assoc_to_yojson
    [
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ( "ClientToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxRows", option_to_yojson max_query_results_to_yojson x.max_rows);
      ("QueryInsights", option_to_yojson query_insights_to_yojson x.query_insights);
    ]

let query_compute_request_to_yojson (x : query_compute_request) =
  assoc_to_yojson
    [
      ("ComputeMode", option_to_yojson compute_mode_to_yojson x.compute_mode);
      ( "ProvisionedCapacity",
        option_to_yojson provisioned_capacity_request_to_yojson x.provisioned_capacity );
    ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let update_scheduled_query_request_to_yojson (x : update_scheduled_query_request) =
  assoc_to_yojson
    [
      ("ScheduledQueryArn", Some (amazon_resource_name_to_yojson x.scheduled_query_arn));
      ("State", Some (scheduled_query_state_to_yojson x.state));
    ]

let update_account_settings_response_to_yojson (x : update_account_settings_response) =
  assoc_to_yojson
    [
      ("MaxQueryTCU", option_to_yojson max_query_capacity_to_yojson x.max_query_tc_u);
      ("QueryPricingModel", option_to_yojson query_pricing_model_to_yojson x.query_pricing_model);
      ("QueryCompute", option_to_yojson query_compute_response_to_yojson x.query_compute);
    ]

let update_account_settings_request_to_yojson (x : update_account_settings_request) =
  assoc_to_yojson
    [
      ("MaxQueryTCU", option_to_yojson max_query_capacity_to_yojson x.max_query_tc_u);
      ("QueryPricingModel", option_to_yojson query_pricing_model_to_yojson x.query_pricing_model);
      ("QueryCompute", option_to_yojson query_compute_request_to_yojson x.query_compute);
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]
