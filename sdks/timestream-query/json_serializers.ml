open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let amazon_resource_name_to_yojson = string_to_yojson

let scheduled_query_state_to_yojson (x : scheduled_query_state) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let update_scheduled_query_request_to_yojson (x : update_scheduled_query_request) =
  assoc_to_yojson
    [
      ("State", Some (scheduled_query_state_to_yojson x.state));
      ("ScheduledQueryArn", Some (amazon_resource_name_to_yojson x.scheduled_query_arn));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ScheduledQueryArn", option_to_yojson amazon_resource_name_to_yojson x.scheduled_query_arn);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let invalid_endpoint_exception_to_yojson (x : invalid_endpoint_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let service_error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson service_error_message_to_yojson x.message) ]

let max_query_capacity_to_yojson = int_to_yojson

let query_pricing_model_to_yojson (x : query_pricing_model) =
  match x with COMPUTE_UNITS -> `String "COMPUTE_UNITS" | BYTES_SCANNED -> `String "BYTES_SCANNED"

let compute_mode_to_yojson (x : compute_mode) =
  match x with PROVISIONED -> `String "PROVISIONED" | ON_DEMAND -> `String "ON_DEMAND"

let query_tc_u_to_yojson = int_to_yojson

let sns_configuration_to_yojson (x : sns_configuration) =
  assoc_to_yojson [ ("TopicArn", Some (amazon_resource_name_to_yojson x.topic_arn)) ]

let account_settings_notification_configuration_to_yojson
    (x : account_settings_notification_configuration) =
  assoc_to_yojson
    [
      ("RoleArn", Some (amazon_resource_name_to_yojson x.role_arn));
      ("SnsConfiguration", option_to_yojson sns_configuration_to_yojson x.sns_configuration);
    ]

let last_update_status_to_yojson (x : last_update_status) =
  match x with
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | PENDING -> `String "PENDING"

let string__to_yojson = string_to_yojson

let last_update_to_yojson (x : last_update) =
  assoc_to_yojson
    [
      ("StatusMessage", option_to_yojson string__to_yojson x.status_message);
      ("Status", option_to_yojson last_update_status_to_yojson x.status);
      ("TargetQueryTCU", option_to_yojson query_tc_u_to_yojson x.target_query_tc_u);
    ]

let provisioned_capacity_response_to_yojson (x : provisioned_capacity_response) =
  assoc_to_yojson
    [
      ("LastUpdate", option_to_yojson last_update_to_yojson x.last_update);
      ( "NotificationConfiguration",
        option_to_yojson account_settings_notification_configuration_to_yojson
          x.notification_configuration );
      ("ActiveQueryTCU", option_to_yojson query_tc_u_to_yojson x.active_query_tc_u);
    ]

let query_compute_response_to_yojson (x : query_compute_response) =
  assoc_to_yojson
    [
      ( "ProvisionedCapacity",
        option_to_yojson provisioned_capacity_response_to_yojson x.provisioned_capacity );
      ("ComputeMode", option_to_yojson compute_mode_to_yojson x.compute_mode);
    ]

let update_account_settings_response_to_yojson (x : update_account_settings_response) =
  assoc_to_yojson
    [
      ("QueryCompute", option_to_yojson query_compute_response_to_yojson x.query_compute);
      ("QueryPricingModel", option_to_yojson query_pricing_model_to_yojson x.query_pricing_model);
      ("MaxQueryTCU", option_to_yojson max_query_capacity_to_yojson x.max_query_tc_u);
    ]

let provisioned_capacity_request_to_yojson (x : provisioned_capacity_request) =
  assoc_to_yojson
    [
      ( "NotificationConfiguration",
        option_to_yojson account_settings_notification_configuration_to_yojson
          x.notification_configuration );
      ("TargetQueryTCU", Some (query_tc_u_to_yojson x.target_query_tc_u));
    ]

let query_compute_request_to_yojson (x : query_compute_request) =
  assoc_to_yojson
    [
      ( "ProvisionedCapacity",
        option_to_yojson provisioned_capacity_request_to_yojson x.provisioned_capacity );
      ("ComputeMode", option_to_yojson compute_mode_to_yojson x.compute_mode);
    ]

let update_account_settings_request_to_yojson (x : update_account_settings_request) =
  assoc_to_yojson
    [
      ("QueryCompute", option_to_yojson query_compute_request_to_yojson x.query_compute);
      ("QueryPricingModel", option_to_yojson query_pricing_model_to_yojson x.query_pricing_model);
      ("MaxQueryTCU", option_to_yojson max_query_capacity_to_yojson x.max_query_tc_u);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let scalar_type_to_yojson (x : scalar_type) =
  match x with
  | INTEGER -> `String "INTEGER"
  | UNKNOWN -> `String "UNKNOWN"
  | INTERVAL_YEAR_TO_MONTH -> `String "INTERVAL_YEAR_TO_MONTH"
  | INTERVAL_DAY_TO_SECOND -> `String "INTERVAL_DAY_TO_SECOND"
  | TIME -> `String "TIME"
  | DATE -> `String "DATE"
  | TIMESTAMP -> `String "TIMESTAMP"
  | DOUBLE -> `String "DOUBLE"
  | BIGINT -> `String "BIGINT"
  | BOOLEAN -> `String "BOOLEAN"
  | VARCHAR -> `String "VARCHAR"

let rec column_info_to_yojson (x : column_info) =
  assoc_to_yojson
    [
      ("Type", Some (type__to_yojson x.type_)); ("Name", option_to_yojson string__to_yojson x.name);
    ]

and column_info_list_to_yojson tree = list_to_yojson column_info_to_yojson tree

and type__to_yojson (x : type_) =
  assoc_to_yojson
    [
      ("RowColumnInfo", option_to_yojson column_info_list_to_yojson x.row_column_info);
      ( "TimeSeriesMeasureValueColumnInfo",
        option_to_yojson column_info_to_yojson x.time_series_measure_value_column_info );
      ("ArrayColumnInfo", option_to_yojson column_info_to_yojson x.array_column_info);
      ("ScalarType", option_to_yojson scalar_type_to_yojson x.scalar_type);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let query_execution_exception_to_yojson (x : query_execution_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let query_id_to_yojson = string_to_yojson
let pagination_token_to_yojson = string_to_yojson
let scalar_value_to_yojson = string_to_yojson
let timestamp_to_yojson = string_to_yojson
let nullable_boolean_to_yojson = bool_to_yojson

let rec datum_to_yojson (x : datum) =
  assoc_to_yojson
    [
      ("NullValue", option_to_yojson nullable_boolean_to_yojson x.null_value);
      ("RowValue", option_to_yojson row_to_yojson x.row_value);
      ("ArrayValue", option_to_yojson datum_list_to_yojson x.array_value);
      ("TimeSeriesValue", option_to_yojson time_series_data_point_list_to_yojson x.time_series_value);
      ("ScalarValue", option_to_yojson scalar_value_to_yojson x.scalar_value);
    ]

and datum_list_to_yojson tree = list_to_yojson datum_to_yojson tree
and row_to_yojson (x : row) = assoc_to_yojson [ ("Data", Some (datum_list_to_yojson x.data)) ]

and time_series_data_point_to_yojson (x : time_series_data_point) =
  assoc_to_yojson
    [ ("Value", Some (datum_to_yojson x.value)); ("Time", Some (timestamp_to_yojson x.time)) ]

and time_series_data_point_list_to_yojson tree =
  list_to_yojson time_series_data_point_to_yojson tree

let row_list_to_yojson tree = list_to_yojson row_to_yojson tree
let double_to_yojson = double_to_yojson
let long_to_yojson = long_to_yojson

let query_status_to_yojson (x : query_status) =
  assoc_to_yojson
    [
      ("CumulativeBytesMetered", option_to_yojson long_to_yojson x.cumulative_bytes_metered);
      ("CumulativeBytesScanned", option_to_yojson long_to_yojson x.cumulative_bytes_scanned);
      ("ProgressPercentage", option_to_yojson double_to_yojson x.progress_percentage);
    ]

let partition_key_to_yojson = string_to_yojson
let partition_key_list_to_yojson tree = list_to_yojson partition_key_to_yojson tree

let query_spatial_coverage_max_to_yojson (x : query_spatial_coverage_max) =
  assoc_to_yojson
    [
      ("PartitionKey", option_to_yojson partition_key_list_to_yojson x.partition_key);
      ("TableArn", option_to_yojson amazon_resource_name_to_yojson x.table_arn);
      ("Value", option_to_yojson double_to_yojson x.value);
    ]

let query_spatial_coverage_to_yojson (x : query_spatial_coverage) =
  assoc_to_yojson [ ("Max", option_to_yojson query_spatial_coverage_max_to_yojson x.max) ]

let query_temporal_range_max_to_yojson (x : query_temporal_range_max) =
  assoc_to_yojson
    [
      ("TableArn", option_to_yojson amazon_resource_name_to_yojson x.table_arn);
      ("Value", option_to_yojson long_to_yojson x.value);
    ]

let query_temporal_range_to_yojson (x : query_temporal_range) =
  assoc_to_yojson [ ("Max", option_to_yojson query_temporal_range_max_to_yojson x.max) ]

let query_insights_response_to_yojson (x : query_insights_response) =
  assoc_to_yojson
    [
      ("UnloadWrittenBytes", option_to_yojson long_to_yojson x.unload_written_bytes);
      ("UnloadWrittenRows", option_to_yojson long_to_yojson x.unload_written_rows);
      ("UnloadPartitionCount", option_to_yojson long_to_yojson x.unload_partition_count);
      ("OutputBytes", option_to_yojson long_to_yojson x.output_bytes);
      ("OutputRows", option_to_yojson long_to_yojson x.output_rows);
      ("QueryTableCount", option_to_yojson long_to_yojson x.query_table_count);
      ("QueryTemporalRange", option_to_yojson query_temporal_range_to_yojson x.query_temporal_range);
      ( "QuerySpatialCoverage",
        option_to_yojson query_spatial_coverage_to_yojson x.query_spatial_coverage );
    ]

let query_response_to_yojson (x : query_response) =
  assoc_to_yojson
    [
      ( "QueryInsightsResponse",
        option_to_yojson query_insights_response_to_yojson x.query_insights_response );
      ("QueryStatus", option_to_yojson query_status_to_yojson x.query_status);
      ("ColumnInfo", Some (column_info_list_to_yojson x.column_info));
      ("Rows", Some (row_list_to_yojson x.rows));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("QueryId", Some (query_id_to_yojson x.query_id));
    ]

let query_string_to_yojson = string_to_yojson
let client_request_token_to_yojson = string_to_yojson
let max_query_results_to_yojson = int_to_yojson

let query_insights_mode_to_yojson (x : query_insights_mode) =
  match x with
  | DISABLED -> `String "DISABLED"
  | ENABLED_WITH_RATE_CONTROL -> `String "ENABLED_WITH_RATE_CONTROL"

let query_insights_to_yojson (x : query_insights) =
  assoc_to_yojson [ ("Mode", Some (query_insights_mode_to_yojson x.mode)) ]

let query_request_to_yojson (x : query_request) =
  assoc_to_yojson
    [
      ("QueryInsights", option_to_yojson query_insights_to_yojson x.query_insights);
      ("MaxRows", option_to_yojson max_query_results_to_yojson x.max_rows);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ( "ClientToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("QueryString", Some (query_string_to_yojson x.query_string));
    ]

let resource_name_to_yojson = string_to_yojson

let select_column_to_yojson (x : select_column) =
  assoc_to_yojson
    [
      ("Aliased", option_to_yojson nullable_boolean_to_yojson x.aliased);
      ("TableName", option_to_yojson resource_name_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("Type", option_to_yojson type__to_yojson x.type_);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let select_column_list_to_yojson tree = list_to_yojson select_column_to_yojson tree

let parameter_mapping_to_yojson (x : parameter_mapping) =
  assoc_to_yojson
    [ ("Type", Some (type__to_yojson x.type_)); ("Name", Some (string__to_yojson x.name)) ]

let parameter_mapping_list_to_yojson tree = list_to_yojson parameter_mapping_to_yojson tree

let prepare_query_response_to_yojson (x : prepare_query_response) =
  assoc_to_yojson
    [
      ("Parameters", Some (parameter_mapping_list_to_yojson x.parameters));
      ("Columns", Some (select_column_list_to_yojson x.columns));
      ("QueryString", Some (query_string_to_yojson x.query_string));
    ]

let prepare_query_request_to_yojson (x : prepare_query_request) =
  assoc_to_yojson
    [
      ("ValidateOnly", option_to_yojson nullable_boolean_to_yojson x.validate_only);
      ("QueryString", Some (query_string_to_yojson x.query_string));
    ]

let next_tags_for_resource_results_token_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_tags_for_resource_results_token_to_yojson x.next_token);
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let max_tags_for_resource_result_to_yojson = int_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_tags_for_resource_results_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_tags_for_resource_result_to_yojson x.max_results);
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let scheduled_query_name_to_yojson = string_to_yojson
let time_to_yojson = timestamp_epoch_seconds_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson
let s3_object_key_prefix_to_yojson = string_to_yojson

let s3_encryption_option_to_yojson (x : s3_encryption_option) =
  match x with SSE_KMS -> `String "SSE_KMS" | SSE_S3 -> `String "SSE_S3"

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("EncryptionOption", option_to_yojson s3_encryption_option_to_yojson x.encryption_option);
      ("ObjectKeyPrefix", option_to_yojson s3_object_key_prefix_to_yojson x.object_key_prefix);
      ("BucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
    ]

let error_report_configuration_to_yojson (x : error_report_configuration) =
  assoc_to_yojson [ ("S3Configuration", Some (s3_configuration_to_yojson x.s3_configuration)) ]

let timestream_destination_to_yojson (x : timestream_destination) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson resource_name_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
    ]

let target_destination_to_yojson (x : target_destination) =
  assoc_to_yojson
    [
      ( "TimestreamDestination",
        option_to_yojson timestream_destination_to_yojson x.timestream_destination );
    ]

let scheduled_query_run_status_to_yojson (x : scheduled_query_run_status) =
  match x with
  | MANUAL_TRIGGER_FAILURE -> `String "MANUAL_TRIGGER_FAILURE"
  | MANUAL_TRIGGER_SUCCESS -> `String "MANUAL_TRIGGER_SUCCESS"
  | AUTO_TRIGGER_FAILURE -> `String "AUTO_TRIGGER_FAILURE"
  | AUTO_TRIGGER_SUCCESS -> `String "AUTO_TRIGGER_SUCCESS"

let scheduled_query_to_yojson (x : scheduled_query) =
  assoc_to_yojson
    [
      ("LastRunStatus", option_to_yojson scheduled_query_run_status_to_yojson x.last_run_status);
      ("TargetDestination", option_to_yojson target_destination_to_yojson x.target_destination);
      ( "ErrorReportConfiguration",
        option_to_yojson error_report_configuration_to_yojson x.error_report_configuration );
      ("NextInvocationTime", option_to_yojson time_to_yojson x.next_invocation_time);
      ("PreviousInvocationTime", option_to_yojson time_to_yojson x.previous_invocation_time);
      ("State", Some (scheduled_query_state_to_yojson x.state));
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("Name", Some (scheduled_query_name_to_yojson x.name));
      ("Arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let scheduled_query_list_to_yojson tree = list_to_yojson scheduled_query_to_yojson tree
let next_scheduled_queries_results_token_to_yojson = string_to_yojson

let list_scheduled_queries_response_to_yojson (x : list_scheduled_queries_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_scheduled_queries_results_token_to_yojson x.next_token);
      ("ScheduledQueries", Some (scheduled_query_list_to_yojson x.scheduled_queries));
    ]

let max_scheduled_queries_results_to_yojson = int_to_yojson

let list_scheduled_queries_request_to_yojson (x : list_scheduled_queries_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_scheduled_queries_results_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_scheduled_queries_results_to_yojson x.max_results);
    ]

let client_token_to_yojson = string_to_yojson

let scheduled_query_insights_mode_to_yojson (x : scheduled_query_insights_mode) =
  match x with
  | DISABLED -> `String "DISABLED"
  | ENABLED_WITH_RATE_CONTROL -> `String "ENABLED_WITH_RATE_CONTROL"

let scheduled_query_insights_to_yojson (x : scheduled_query_insights) =
  assoc_to_yojson [ ("Mode", Some (scheduled_query_insights_mode_to_yojson x.mode)) ]

let execute_scheduled_query_request_to_yojson (x : execute_scheduled_query_request) =
  assoc_to_yojson
    [
      ("QueryInsights", option_to_yojson scheduled_query_insights_to_yojson x.query_insights);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("InvocationTime", Some (time_to_yojson x.invocation_time));
      ("ScheduledQueryArn", Some (amazon_resource_name_to_yojson x.scheduled_query_arn));
    ]

let schedule_expression_to_yojson = string_to_yojson

let schedule_configuration_to_yojson (x : schedule_configuration) =
  assoc_to_yojson
    [ ("ScheduleExpression", Some (schedule_expression_to_yojson x.schedule_expression)) ]

let notification_configuration_to_yojson (x : notification_configuration) =
  assoc_to_yojson [ ("SnsConfiguration", Some (sns_configuration_to_yojson x.sns_configuration)) ]

let schema_name_to_yojson = string_to_yojson

let dimension_value_type_to_yojson (x : dimension_value_type) =
  match x with VARCHAR -> `String "VARCHAR"

let dimension_mapping_to_yojson (x : dimension_mapping) =
  assoc_to_yojson
    [
      ("DimensionValueType", Some (dimension_value_type_to_yojson x.dimension_value_type));
      ("Name", Some (schema_name_to_yojson x.name));
    ]

let dimension_mapping_list_to_yojson tree = list_to_yojson dimension_mapping_to_yojson tree

let scalar_measure_value_type_to_yojson (x : scalar_measure_value_type) =
  match x with
  | TIMESTAMP -> `String "TIMESTAMP"
  | VARCHAR -> `String "VARCHAR"
  | DOUBLE -> `String "DOUBLE"
  | BOOLEAN -> `String "BOOLEAN"
  | BIGINT -> `String "BIGINT"

let multi_measure_attribute_mapping_to_yojson (x : multi_measure_attribute_mapping) =
  assoc_to_yojson
    [
      ("MeasureValueType", Some (scalar_measure_value_type_to_yojson x.measure_value_type));
      ( "TargetMultiMeasureAttributeName",
        option_to_yojson schema_name_to_yojson x.target_multi_measure_attribute_name );
      ("SourceColumn", Some (schema_name_to_yojson x.source_column));
    ]

let multi_measure_attribute_mapping_list_to_yojson tree =
  list_to_yojson multi_measure_attribute_mapping_to_yojson tree

let multi_measure_mappings_to_yojson (x : multi_measure_mappings) =
  assoc_to_yojson
    [
      ( "MultiMeasureAttributeMappings",
        Some (multi_measure_attribute_mapping_list_to_yojson x.multi_measure_attribute_mappings) );
      ("TargetMultiMeasureName", option_to_yojson schema_name_to_yojson x.target_multi_measure_name);
    ]

let measure_value_type_to_yojson (x : measure_value_type) =
  match x with
  | MULTI -> `String "MULTI"
  | VARCHAR -> `String "VARCHAR"
  | DOUBLE -> `String "DOUBLE"
  | BOOLEAN -> `String "BOOLEAN"
  | BIGINT -> `String "BIGINT"

let mixed_measure_mapping_to_yojson (x : mixed_measure_mapping) =
  assoc_to_yojson
    [
      ( "MultiMeasureAttributeMappings",
        option_to_yojson multi_measure_attribute_mapping_list_to_yojson
          x.multi_measure_attribute_mappings );
      ("MeasureValueType", Some (measure_value_type_to_yojson x.measure_value_type));
      ("TargetMeasureName", option_to_yojson schema_name_to_yojson x.target_measure_name);
      ("SourceColumn", option_to_yojson schema_name_to_yojson x.source_column);
      ("MeasureName", option_to_yojson schema_name_to_yojson x.measure_name);
    ]

let mixed_measure_mapping_list_to_yojson tree = list_to_yojson mixed_measure_mapping_to_yojson tree

let timestream_configuration_to_yojson (x : timestream_configuration) =
  assoc_to_yojson
    [
      ("MeasureNameColumn", option_to_yojson schema_name_to_yojson x.measure_name_column);
      ( "MixedMeasureMappings",
        option_to_yojson mixed_measure_mapping_list_to_yojson x.mixed_measure_mappings );
      ( "MultiMeasureMappings",
        option_to_yojson multi_measure_mappings_to_yojson x.multi_measure_mappings );
      ("DimensionMappings", Some (dimension_mapping_list_to_yojson x.dimension_mappings));
      ("TimeColumn", Some (schema_name_to_yojson x.time_column));
      ("TableName", Some (resource_name_to_yojson x.table_name));
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
    ]

let target_configuration_to_yojson (x : target_configuration) =
  assoc_to_yojson
    [
      ( "TimestreamConfiguration",
        Some (timestream_configuration_to_yojson x.timestream_configuration) );
    ]

let string_value2048_to_yojson = string_to_yojson

let execution_stats_to_yojson (x : execution_stats) =
  assoc_to_yojson
    [
      ("QueryResultRows", option_to_yojson long_to_yojson x.query_result_rows);
      ("RecordsIngested", option_to_yojson long_to_yojson x.records_ingested);
      ("CumulativeBytesScanned", option_to_yojson long_to_yojson x.cumulative_bytes_scanned);
      ("BytesMetered", option_to_yojson long_to_yojson x.bytes_metered);
      ("DataWrites", option_to_yojson long_to_yojson x.data_writes);
      ("ExecutionTimeInMillis", option_to_yojson long_to_yojson x.execution_time_in_millis);
    ]

let scheduled_query_insights_response_to_yojson (x : scheduled_query_insights_response) =
  assoc_to_yojson
    [
      ("OutputBytes", option_to_yojson long_to_yojson x.output_bytes);
      ("OutputRows", option_to_yojson long_to_yojson x.output_rows);
      ("QueryTableCount", option_to_yojson long_to_yojson x.query_table_count);
      ("QueryTemporalRange", option_to_yojson query_temporal_range_to_yojson x.query_temporal_range);
      ( "QuerySpatialCoverage",
        option_to_yojson query_spatial_coverage_to_yojson x.query_spatial_coverage );
    ]

let s3_object_key_to_yojson = string_to_yojson

let s3_report_location_to_yojson (x : s3_report_location) =
  assoc_to_yojson
    [
      ("ObjectKey", option_to_yojson s3_object_key_to_yojson x.object_key);
      ("BucketName", option_to_yojson s3_bucket_name_to_yojson x.bucket_name);
    ]

let error_report_location_to_yojson (x : error_report_location) =
  assoc_to_yojson
    [ ("S3ReportLocation", option_to_yojson s3_report_location_to_yojson x.s3_report_location) ]

let scheduled_query_run_summary_to_yojson (x : scheduled_query_run_summary) =
  assoc_to_yojson
    [
      ("FailureReason", option_to_yojson error_message_to_yojson x.failure_reason);
      ( "ErrorReportLocation",
        option_to_yojson error_report_location_to_yojson x.error_report_location );
      ( "QueryInsightsResponse",
        option_to_yojson scheduled_query_insights_response_to_yojson x.query_insights_response );
      ("ExecutionStats", option_to_yojson execution_stats_to_yojson x.execution_stats);
      ("RunStatus", option_to_yojson scheduled_query_run_status_to_yojson x.run_status);
      ("TriggerTime", option_to_yojson time_to_yojson x.trigger_time);
      ("InvocationTime", option_to_yojson time_to_yojson x.invocation_time);
    ]

let scheduled_query_run_summary_list_to_yojson tree =
  list_to_yojson scheduled_query_run_summary_to_yojson tree

let scheduled_query_description_to_yojson (x : scheduled_query_description) =
  assoc_to_yojson
    [
      ( "RecentlyFailedRuns",
        option_to_yojson scheduled_query_run_summary_list_to_yojson x.recently_failed_runs );
      ("LastRunSummary", option_to_yojson scheduled_query_run_summary_to_yojson x.last_run_summary);
      ( "ErrorReportConfiguration",
        option_to_yojson error_report_configuration_to_yojson x.error_report_configuration );
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ( "ScheduledQueryExecutionRoleArn",
        option_to_yojson amazon_resource_name_to_yojson x.scheduled_query_execution_role_arn );
      ("TargetConfiguration", option_to_yojson target_configuration_to_yojson x.target_configuration);
      ( "NotificationConfiguration",
        Some (notification_configuration_to_yojson x.notification_configuration) );
      ("ScheduleConfiguration", Some (schedule_configuration_to_yojson x.schedule_configuration));
      ("NextInvocationTime", option_to_yojson time_to_yojson x.next_invocation_time);
      ("PreviousInvocationTime", option_to_yojson time_to_yojson x.previous_invocation_time);
      ("State", Some (scheduled_query_state_to_yojson x.state));
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("Name", Some (scheduled_query_name_to_yojson x.name));
      ("Arn", Some (amazon_resource_name_to_yojson x.arn));
    ]

let describe_scheduled_query_response_to_yojson (x : describe_scheduled_query_response) =
  assoc_to_yojson
    [ ("ScheduledQuery", Some (scheduled_query_description_to_yojson x.scheduled_query)) ]

let describe_scheduled_query_request_to_yojson (x : describe_scheduled_query_request) =
  assoc_to_yojson
    [ ("ScheduledQueryArn", Some (amazon_resource_name_to_yojson x.scheduled_query_arn)) ]

let endpoint_to_yojson (x : endpoint) =
  assoc_to_yojson
    [
      ("CachePeriodInMinutes", Some (long_to_yojson x.cache_period_in_minutes));
      ("Address", Some (string__to_yojson x.address));
    ]

let endpoints_to_yojson tree = list_to_yojson endpoint_to_yojson tree

let describe_endpoints_response_to_yojson (x : describe_endpoints_response) =
  assoc_to_yojson [ ("Endpoints", Some (endpoints_to_yojson x.endpoints)) ]

let describe_endpoints_request_to_yojson = unit_to_yojson

let describe_account_settings_response_to_yojson (x : describe_account_settings_response) =
  assoc_to_yojson
    [
      ("QueryCompute", option_to_yojson query_compute_response_to_yojson x.query_compute);
      ("QueryPricingModel", option_to_yojson query_pricing_model_to_yojson x.query_pricing_model);
      ("MaxQueryTCU", option_to_yojson max_query_capacity_to_yojson x.max_query_tc_u);
    ]

let describe_account_settings_request_to_yojson = unit_to_yojson

let delete_scheduled_query_request_to_yojson (x : delete_scheduled_query_request) =
  assoc_to_yojson
    [ ("ScheduledQueryArn", Some (amazon_resource_name_to_yojson x.scheduled_query_arn)) ]

let create_scheduled_query_response_to_yojson (x : create_scheduled_query_response) =
  assoc_to_yojson [ ("Arn", Some (amazon_resource_name_to_yojson x.arn)) ]

let create_scheduled_query_request_to_yojson (x : create_scheduled_query_request) =
  assoc_to_yojson
    [
      ( "ErrorReportConfiguration",
        Some (error_report_configuration_to_yojson x.error_report_configuration) );
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ScheduledQueryExecutionRoleArn",
        Some (amazon_resource_name_to_yojson x.scheduled_query_execution_role_arn) );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("TargetConfiguration", option_to_yojson target_configuration_to_yojson x.target_configuration);
      ( "NotificationConfiguration",
        Some (notification_configuration_to_yojson x.notification_configuration) );
      ("ScheduleConfiguration", Some (schedule_configuration_to_yojson x.schedule_configuration));
      ("QueryString", Some (query_string_to_yojson x.query_string));
      ("Name", Some (scheduled_query_name_to_yojson x.name));
    ]

let cancel_query_response_to_yojson (x : cancel_query_response) =
  assoc_to_yojson
    [ ("CancellationMessage", option_to_yojson string__to_yojson x.cancellation_message) ]

let cancel_query_request_to_yojson (x : cancel_query_request) =
  assoc_to_yojson [ ("QueryId", Some (query_id_to_yojson x.query_id)) ]
