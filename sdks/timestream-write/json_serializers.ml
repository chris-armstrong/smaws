open Smaws_Lib.Json.SerializeHelpers
open Types

let integer_to_yojson = int_to_yojson

let records_ingested_to_yojson (x : records_ingested) =
  assoc_to_yojson
    [
      ("MagneticStore", option_to_yojson integer_to_yojson x.magnetic_store);
      ("MemoryStore", option_to_yojson integer_to_yojson x.memory_store);
      ("Total", option_to_yojson integer_to_yojson x.total);
    ]

let write_records_response_to_yojson (x : write_records_response) =
  assoc_to_yojson
    [ ("RecordsIngested", option_to_yojson records_ingested_to_yojson x.records_ingested) ]

let resource_name_to_yojson = string_to_yojson
let schema_name_to_yojson = string_to_yojson
let schema_value_to_yojson = string_to_yojson

let dimension_value_type_to_yojson (x : dimension_value_type) =
  match x with VARCHAR -> `String "VARCHAR"

let dimension_to_yojson (x : dimension) =
  assoc_to_yojson
    [
      ("DimensionValueType", option_to_yojson dimension_value_type_to_yojson x.dimension_value_type);
      ("Value", Some (schema_value_to_yojson x.value));
      ("Name", Some (schema_name_to_yojson x.name));
    ]

let dimensions_to_yojson tree = list_to_yojson dimension_to_yojson tree
let string_value2048_to_yojson = string_to_yojson

let measure_value_type_to_yojson (x : measure_value_type) =
  match x with
  | MULTI -> `String "MULTI"
  | TIMESTAMP -> `String "TIMESTAMP"
  | BOOLEAN -> `String "BOOLEAN"
  | VARCHAR -> `String "VARCHAR"
  | BIGINT -> `String "BIGINT"
  | DOUBLE -> `String "DOUBLE"

let string_value256_to_yojson = string_to_yojson

let time_unit_to_yojson (x : time_unit) =
  match x with
  | NANOSECONDS -> `String "NANOSECONDS"
  | MICROSECONDS -> `String "MICROSECONDS"
  | SECONDS -> `String "SECONDS"
  | MILLISECONDS -> `String "MILLISECONDS"

let record_version_to_yojson = long_to_yojson

let measure_value_to_yojson (x : measure_value) =
  assoc_to_yojson
    [
      ("Type", Some (measure_value_type_to_yojson x.type_));
      ("Value", Some (string_value2048_to_yojson x.value));
      ("Name", Some (schema_name_to_yojson x.name));
    ]

let measure_values_to_yojson tree = list_to_yojson measure_value_to_yojson tree

let record_to_yojson (x : record) =
  assoc_to_yojson
    [
      ("MeasureValues", option_to_yojson measure_values_to_yojson x.measure_values);
      ("Version", option_to_yojson record_version_to_yojson x.version);
      ("TimeUnit", option_to_yojson time_unit_to_yojson x.time_unit);
      ("Time", option_to_yojson string_value256_to_yojson x.time);
      ("MeasureValueType", option_to_yojson measure_value_type_to_yojson x.measure_value_type);
      ("MeasureValue", option_to_yojson string_value2048_to_yojson x.measure_value);
      ("MeasureName", option_to_yojson schema_name_to_yojson x.measure_name);
      ("Dimensions", option_to_yojson dimensions_to_yojson x.dimensions);
    ]

let records_to_yojson tree = list_to_yojson record_to_yojson tree

let write_records_request_to_yojson (x : write_records_request) =
  assoc_to_yojson
    [
      ("Records", Some (records_to_yojson x.records));
      ("CommonAttributes", option_to_yojson record_to_yojson x.common_attributes);
      ("TableName", Some (resource_name_to_yojson x.table_name));
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
    ]

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let record_index_to_yojson = int_to_yojson

let rejected_record_to_yojson (x : rejected_record) =
  assoc_to_yojson
    [
      ("ExistingVersion", option_to_yojson record_version_to_yojson x.existing_version);
      ("Reason", option_to_yojson error_message_to_yojson x.reason);
      ("RecordIndex", option_to_yojson record_index_to_yojson x.record_index);
    ]

let rejected_records_to_yojson tree = list_to_yojson rejected_record_to_yojson tree

let rejected_records_exception_to_yojson (x : rejected_records_exception) =
  assoc_to_yojson
    [
      ("RejectedRecords", option_to_yojson rejected_records_to_yojson x.rejected_records);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let invalid_endpoint_exception_to_yojson (x : invalid_endpoint_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let string__to_yojson = string_to_yojson

let table_status_to_yojson (x : table_status) =
  match x with
  | RESTORING -> `String "RESTORING"
  | DELETING -> `String "DELETING"
  | ACTIVE -> `String "ACTIVE"

let memory_store_retention_period_in_hours_to_yojson = long_to_yojson
let magnetic_store_retention_period_in_days_to_yojson = long_to_yojson

let retention_properties_to_yojson (x : retention_properties) =
  assoc_to_yojson
    [
      ( "MagneticStoreRetentionPeriodInDays",
        Some
          (magnetic_store_retention_period_in_days_to_yojson
             x.magnetic_store_retention_period_in_days) );
      ( "MemoryStoreRetentionPeriodInHours",
        Some
          (memory_store_retention_period_in_hours_to_yojson x.memory_store_retention_period_in_hours)
      );
    ]

let date_to_yojson = timestamp_epoch_seconds_to_yojson
let boolean__to_yojson = bool_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson
let s3_object_key_prefix_to_yojson = string_to_yojson

let s3_encryption_option_to_yojson (x : s3_encryption_option) =
  match x with SSE_KMS -> `String "SSE_KMS" | SSE_S3 -> `String "SSE_S3"

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ("EncryptionOption", option_to_yojson s3_encryption_option_to_yojson x.encryption_option);
      ("ObjectKeyPrefix", option_to_yojson s3_object_key_prefix_to_yojson x.object_key_prefix);
      ("BucketName", option_to_yojson s3_bucket_name_to_yojson x.bucket_name);
    ]

let magnetic_store_rejected_data_location_to_yojson (x : magnetic_store_rejected_data_location) =
  assoc_to_yojson
    [ ("S3Configuration", option_to_yojson s3_configuration_to_yojson x.s3_configuration) ]

let magnetic_store_write_properties_to_yojson (x : magnetic_store_write_properties) =
  assoc_to_yojson
    [
      ( "MagneticStoreRejectedDataLocation",
        option_to_yojson magnetic_store_rejected_data_location_to_yojson
          x.magnetic_store_rejected_data_location );
      ("EnableMagneticStoreWrites", Some (boolean__to_yojson x.enable_magnetic_store_writes));
    ]

let partition_key_type_to_yojson (x : partition_key_type) =
  match x with MEASURE -> `String "MEASURE" | DIMENSION -> `String "DIMENSION"

let partition_key_enforcement_level_to_yojson (x : partition_key_enforcement_level) =
  match x with OPTIONAL -> `String "OPTIONAL" | REQUIRED -> `String "REQUIRED"

let partition_key_to_yojson (x : partition_key) =
  assoc_to_yojson
    [
      ( "EnforcementInRecord",
        option_to_yojson partition_key_enforcement_level_to_yojson x.enforcement_in_record );
      ("Name", option_to_yojson schema_name_to_yojson x.name);
      ("Type", Some (partition_key_type_to_yojson x.type_));
    ]

let partition_key_list_to_yojson tree = list_to_yojson partition_key_to_yojson tree

let schema_to_yojson (x : schema) =
  assoc_to_yojson
    [
      ( "CompositePartitionKey",
        option_to_yojson partition_key_list_to_yojson x.composite_partition_key );
    ]

let table_to_yojson (x : table) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson schema_to_yojson x.schema);
      ( "MagneticStoreWriteProperties",
        option_to_yojson magnetic_store_write_properties_to_yojson x.magnetic_store_write_properties
      );
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("RetentionProperties", option_to_yojson retention_properties_to_yojson x.retention_properties);
      ("TableStatus", option_to_yojson table_status_to_yojson x.table_status);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("TableName", option_to_yojson resource_name_to_yojson x.table_name);
      ("Arn", option_to_yojson string__to_yojson x.arn);
    ]

let update_table_response_to_yojson (x : update_table_response) =
  assoc_to_yojson [ ("Table", option_to_yojson table_to_yojson x.table) ]

let update_table_request_to_yojson (x : update_table_request) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson schema_to_yojson x.schema);
      ( "MagneticStoreWriteProperties",
        option_to_yojson magnetic_store_write_properties_to_yojson x.magnetic_store_write_properties
      );
      ("RetentionProperties", option_to_yojson retention_properties_to_yojson x.retention_properties);
      ("TableName", Some (resource_name_to_yojson x.table_name));
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
    ]

let long_to_yojson = long_to_yojson

let database_to_yojson (x : database) =
  assoc_to_yojson
    [
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ("TableCount", option_to_yojson long_to_yojson x.table_count);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("Arn", option_to_yojson string__to_yojson x.arn);
    ]

let update_database_response_to_yojson (x : update_database_response) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let update_database_request_to_yojson (x : update_database_request) =
  assoc_to_yojson
    [
      ("KmsKeyId", Some (string_value2048_to_yojson x.kms_key_id));
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

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

let resume_batch_load_task_response_to_yojson = unit_to_yojson
let batch_load_task_id_to_yojson = string_to_yojson

let resume_batch_load_task_request_to_yojson (x : resume_batch_load_task_request) =
  assoc_to_yojson [ ("TaskId", Some (batch_load_task_id_to_yojson x.task_id)) ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let table_list_to_yojson tree = list_to_yojson table_to_yojson tree

let list_tables_response_to_yojson (x : list_tables_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Tables", option_to_yojson table_list_to_yojson x.tables);
    ]

let pagination_limit_to_yojson = int_to_yojson

let list_tables_request_to_yojson (x : list_tables_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
    ]

let database_list_to_yojson tree = list_to_yojson database_to_yojson tree

let list_databases_response_to_yojson (x : list_databases_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Databases", option_to_yojson database_list_to_yojson x.databases);
    ]

let list_databases_request_to_yojson (x : list_databases_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson pagination_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let batch_load_status_to_yojson (x : batch_load_status) =
  match x with
  | PENDING_RESUME -> `String "PENDING_RESUME"
  | PROGRESS_STOPPED -> `String "PROGRESS_STOPPED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | CREATED -> `String "CREATED"

let batch_load_task_to_yojson (x : batch_load_task) =
  assoc_to_yojson
    [
      ("ResumableUntil", option_to_yojson date_to_yojson x.resumable_until);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("TableName", option_to_yojson resource_name_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("TaskStatus", option_to_yojson batch_load_status_to_yojson x.task_status);
      ("TaskId", option_to_yojson batch_load_task_id_to_yojson x.task_id);
    ]

let batch_load_task_list_to_yojson tree = list_to_yojson batch_load_task_to_yojson tree

let list_batch_load_tasks_response_to_yojson (x : list_batch_load_tasks_response) =
  assoc_to_yojson
    [
      ("BatchLoadTasks", option_to_yojson batch_load_task_list_to_yojson x.batch_load_tasks);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let page_limit_to_yojson = int_to_yojson

let list_batch_load_tasks_request_to_yojson (x : list_batch_load_tasks_request) =
  assoc_to_yojson
    [
      ("TaskStatus", option_to_yojson batch_load_status_to_yojson x.task_status);
      ("MaxResults", option_to_yojson page_limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_table_response_to_yojson (x : describe_table_response) =
  assoc_to_yojson [ ("Table", option_to_yojson table_to_yojson x.table) ]

let describe_table_request_to_yojson (x : describe_table_request) =
  assoc_to_yojson
    [
      ("TableName", Some (resource_name_to_yojson x.table_name));
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
    ]

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

let describe_database_response_to_yojson (x : describe_database_response) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let describe_database_request_to_yojson (x : describe_database_request) =
  assoc_to_yojson [ ("DatabaseName", Some (resource_name_to_yojson x.database_name)) ]

let s3_object_key_to_yojson = string_to_yojson

let data_source_s3_configuration_to_yojson (x : data_source_s3_configuration) =
  assoc_to_yojson
    [
      ("ObjectKeyPrefix", option_to_yojson s3_object_key_to_yojson x.object_key_prefix);
      ("BucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
    ]

let string_value1_to_yojson = string_to_yojson

let csv_configuration_to_yojson (x : csv_configuration) =
  assoc_to_yojson
    [
      ("TrimWhiteSpace", option_to_yojson boolean__to_yojson x.trim_white_space);
      ("NullValue", option_to_yojson string_value256_to_yojson x.null_value);
      ("QuoteChar", option_to_yojson string_value1_to_yojson x.quote_char);
      ("EscapeChar", option_to_yojson string_value1_to_yojson x.escape_char);
      ("ColumnSeparator", option_to_yojson string_value1_to_yojson x.column_separator);
    ]

let batch_load_data_format_to_yojson (x : batch_load_data_format) =
  match x with CSV -> `String "CSV"

let data_source_configuration_to_yojson (x : data_source_configuration) =
  assoc_to_yojson
    [
      ("DataFormat", Some (batch_load_data_format_to_yojson x.data_format));
      ("CsvConfiguration", option_to_yojson csv_configuration_to_yojson x.csv_configuration);
      ( "DataSourceS3Configuration",
        Some (data_source_s3_configuration_to_yojson x.data_source_s3_configuration) );
    ]

let batch_load_progress_report_to_yojson (x : batch_load_progress_report) =
  assoc_to_yojson
    [
      ("BytesMetered", option_to_yojson long_to_yojson x.bytes_metered);
      ("FileFailures", option_to_yojson long_to_yojson x.file_failures);
      ("RecordIngestionFailures", option_to_yojson long_to_yojson x.record_ingestion_failures);
      ("ParseFailures", option_to_yojson long_to_yojson x.parse_failures);
      ("RecordsIngested", option_to_yojson long_to_yojson x.records_ingested);
      ("RecordsProcessed", option_to_yojson long_to_yojson x.records_processed);
    ]

let report_s3_configuration_to_yojson (x : report_s3_configuration) =
  assoc_to_yojson
    [
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ("EncryptionOption", option_to_yojson s3_encryption_option_to_yojson x.encryption_option);
      ("ObjectKeyPrefix", option_to_yojson s3_object_key_prefix_to_yojson x.object_key_prefix);
      ("BucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
    ]

let report_configuration_to_yojson (x : report_configuration) =
  assoc_to_yojson
    [
      ( "ReportS3Configuration",
        option_to_yojson report_s3_configuration_to_yojson x.report_s3_configuration );
    ]

let dimension_mapping_to_yojson (x : dimension_mapping) =
  assoc_to_yojson
    [
      ("DestinationColumn", option_to_yojson schema_name_to_yojson x.destination_column);
      ("SourceColumn", option_to_yojson schema_name_to_yojson x.source_column);
    ]

let dimension_mappings_to_yojson tree = list_to_yojson dimension_mapping_to_yojson tree

let scalar_measure_value_type_to_yojson (x : scalar_measure_value_type) =
  match x with
  | TIMESTAMP -> `String "TIMESTAMP"
  | VARCHAR -> `String "VARCHAR"
  | BOOLEAN -> `String "BOOLEAN"
  | BIGINT -> `String "BIGINT"
  | DOUBLE -> `String "DOUBLE"

let multi_measure_attribute_mapping_to_yojson (x : multi_measure_attribute_mapping) =
  assoc_to_yojson
    [
      ("MeasureValueType", option_to_yojson scalar_measure_value_type_to_yojson x.measure_value_type);
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

let data_model_to_yojson (x : data_model) =
  assoc_to_yojson
    [
      ("MeasureNameColumn", option_to_yojson string_value256_to_yojson x.measure_name_column);
      ( "MixedMeasureMappings",
        option_to_yojson mixed_measure_mapping_list_to_yojson x.mixed_measure_mappings );
      ( "MultiMeasureMappings",
        option_to_yojson multi_measure_mappings_to_yojson x.multi_measure_mappings );
      ("DimensionMappings", Some (dimension_mappings_to_yojson x.dimension_mappings));
      ("TimeUnit", option_to_yojson time_unit_to_yojson x.time_unit);
      ("TimeColumn", option_to_yojson string_value256_to_yojson x.time_column);
    ]

let data_model_s3_configuration_to_yojson (x : data_model_s3_configuration) =
  assoc_to_yojson
    [
      ("ObjectKey", option_to_yojson s3_object_key_to_yojson x.object_key);
      ("BucketName", option_to_yojson s3_bucket_name_to_yojson x.bucket_name);
    ]

let data_model_configuration_to_yojson (x : data_model_configuration) =
  assoc_to_yojson
    [
      ( "DataModelS3Configuration",
        option_to_yojson data_model_s3_configuration_to_yojson x.data_model_s3_configuration );
      ("DataModel", option_to_yojson data_model_to_yojson x.data_model);
    ]

let batch_load_task_description_to_yojson (x : batch_load_task_description) =
  assoc_to_yojson
    [
      ("ResumableUntil", option_to_yojson date_to_yojson x.resumable_until);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("RecordVersion", option_to_yojson record_version_to_yojson x.record_version);
      ("TaskStatus", option_to_yojson batch_load_status_to_yojson x.task_status);
      ("TargetTableName", option_to_yojson resource_name_to_yojson x.target_table_name);
      ("TargetDatabaseName", option_to_yojson resource_name_to_yojson x.target_database_name);
      ( "DataModelConfiguration",
        option_to_yojson data_model_configuration_to_yojson x.data_model_configuration );
      ("ReportConfiguration", option_to_yojson report_configuration_to_yojson x.report_configuration);
      ("ProgressReport", option_to_yojson batch_load_progress_report_to_yojson x.progress_report);
      ( "DataSourceConfiguration",
        option_to_yojson data_source_configuration_to_yojson x.data_source_configuration );
      ("ErrorMessage", option_to_yojson string_value2048_to_yojson x.error_message);
      ("TaskId", option_to_yojson batch_load_task_id_to_yojson x.task_id);
    ]

let describe_batch_load_task_response_to_yojson (x : describe_batch_load_task_response) =
  assoc_to_yojson
    [
      ( "BatchLoadTaskDescription",
        Some (batch_load_task_description_to_yojson x.batch_load_task_description) );
    ]

let describe_batch_load_task_request_to_yojson (x : describe_batch_load_task_request) =
  assoc_to_yojson [ ("TaskId", Some (batch_load_task_id_to_yojson x.task_id)) ]

let delete_table_request_to_yojson (x : delete_table_request) =
  assoc_to_yojson
    [
      ("TableName", Some (resource_name_to_yojson x.table_name));
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
    ]

let delete_database_request_to_yojson (x : delete_database_request) =
  assoc_to_yojson [ ("DatabaseName", Some (resource_name_to_yojson x.database_name)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let create_table_response_to_yojson (x : create_table_response) =
  assoc_to_yojson [ ("Table", option_to_yojson table_to_yojson x.table) ]

let resource_create_api_name_to_yojson = string_to_yojson

let create_table_request_to_yojson (x : create_table_request) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson schema_to_yojson x.schema);
      ( "MagneticStoreWriteProperties",
        option_to_yojson magnetic_store_write_properties_to_yojson x.magnetic_store_write_properties
      );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("RetentionProperties", option_to_yojson retention_properties_to_yojson x.retention_properties);
      ("TableName", Some (resource_create_api_name_to_yojson x.table_name));
      ("DatabaseName", Some (resource_create_api_name_to_yojson x.database_name));
    ]

let create_database_response_to_yojson (x : create_database_response) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let create_database_request_to_yojson (x : create_database_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ("DatabaseName", Some (resource_create_api_name_to_yojson x.database_name));
    ]

let create_batch_load_task_response_to_yojson (x : create_batch_load_task_response) =
  assoc_to_yojson [ ("TaskId", Some (batch_load_task_id_to_yojson x.task_id)) ]

let client_request_token_to_yojson = string_to_yojson

let create_batch_load_task_request_to_yojson (x : create_batch_load_task_request) =
  assoc_to_yojson
    [
      ("RecordVersion", option_to_yojson record_version_to_yojson x.record_version);
      ("TargetTableName", Some (resource_create_api_name_to_yojson x.target_table_name));
      ("TargetDatabaseName", Some (resource_create_api_name_to_yojson x.target_database_name));
      ("ReportConfiguration", Some (report_configuration_to_yojson x.report_configuration));
      ( "DataSourceConfiguration",
        Some (data_source_configuration_to_yojson x.data_source_configuration) );
      ( "DataModelConfiguration",
        option_to_yojson data_model_configuration_to_yojson x.data_model_configuration );
      ( "ClientToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
