open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let amazon_resource_name_to_yojson = string_to_yojson

let batch_load_data_format_to_yojson (x : batch_load_data_format) =
  match x with CSV -> `String "CSV"

let long_to_yojson = long_to_yojson

let batch_load_progress_report_to_yojson (x : batch_load_progress_report) =
  assoc_to_yojson
    [
      ("RecordsProcessed", option_to_yojson long_to_yojson x.records_processed);
      ("RecordsIngested", option_to_yojson long_to_yojson x.records_ingested);
      ("ParseFailures", option_to_yojson long_to_yojson x.parse_failures);
      ("RecordIngestionFailures", option_to_yojson long_to_yojson x.record_ingestion_failures);
      ("FileFailures", option_to_yojson long_to_yojson x.file_failures);
      ("BytesMetered", option_to_yojson long_to_yojson x.bytes_metered);
    ]

let batch_load_status_to_yojson (x : batch_load_status) =
  match x with
  | CREATED -> `String "CREATED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | PROGRESS_STOPPED -> `String "PROGRESS_STOPPED"
  | PENDING_RESUME -> `String "PENDING_RESUME"

let date_to_yojson = timestamp_epoch_seconds_to_yojson
let resource_name_to_yojson = string_to_yojson
let batch_load_task_id_to_yojson = string_to_yojson

let batch_load_task_to_yojson (x : batch_load_task) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson batch_load_task_id_to_yojson x.task_id);
      ("TaskStatus", option_to_yojson batch_load_status_to_yojson x.task_status);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("TableName", option_to_yojson resource_name_to_yojson x.table_name);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
      ("ResumableUntil", option_to_yojson date_to_yojson x.resumable_until);
    ]

let record_version_to_yojson = long_to_yojson
let s3_object_key_to_yojson = string_to_yojson
let s3_bucket_name_to_yojson = string_to_yojson

let data_model_s3_configuration_to_yojson (x : data_model_s3_configuration) =
  assoc_to_yojson
    [
      ("BucketName", option_to_yojson s3_bucket_name_to_yojson x.bucket_name);
      ("ObjectKey", option_to_yojson s3_object_key_to_yojson x.object_key);
    ]

let string_value256_to_yojson = string_to_yojson

let scalar_measure_value_type_to_yojson (x : scalar_measure_value_type) =
  match x with
  | DOUBLE -> `String "DOUBLE"
  | BIGINT -> `String "BIGINT"
  | BOOLEAN -> `String "BOOLEAN"
  | VARCHAR -> `String "VARCHAR"
  | TIMESTAMP -> `String "TIMESTAMP"

let schema_name_to_yojson = string_to_yojson

let multi_measure_attribute_mapping_to_yojson (x : multi_measure_attribute_mapping) =
  assoc_to_yojson
    [
      ("SourceColumn", Some (schema_name_to_yojson x.source_column));
      ( "TargetMultiMeasureAttributeName",
        option_to_yojson schema_name_to_yojson x.target_multi_measure_attribute_name );
      ("MeasureValueType", option_to_yojson scalar_measure_value_type_to_yojson x.measure_value_type);
    ]

let multi_measure_attribute_mapping_list_to_yojson tree =
  list_to_yojson multi_measure_attribute_mapping_to_yojson tree

let measure_value_type_to_yojson (x : measure_value_type) =
  match x with
  | DOUBLE -> `String "DOUBLE"
  | BIGINT -> `String "BIGINT"
  | VARCHAR -> `String "VARCHAR"
  | BOOLEAN -> `String "BOOLEAN"
  | TIMESTAMP -> `String "TIMESTAMP"
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

let dimension_mapping_to_yojson (x : dimension_mapping) =
  assoc_to_yojson
    [
      ("SourceColumn", option_to_yojson schema_name_to_yojson x.source_column);
      ("DestinationColumn", option_to_yojson schema_name_to_yojson x.destination_column);
    ]

let dimension_mappings_to_yojson tree = list_to_yojson dimension_mapping_to_yojson tree

let time_unit_to_yojson (x : time_unit) =
  match x with
  | MILLISECONDS -> `String "MILLISECONDS"
  | SECONDS -> `String "SECONDS"
  | MICROSECONDS -> `String "MICROSECONDS"
  | NANOSECONDS -> `String "NANOSECONDS"

let data_model_to_yojson (x : data_model) =
  assoc_to_yojson
    [
      ("TimeColumn", option_to_yojson string_value256_to_yojson x.time_column);
      ("TimeUnit", option_to_yojson time_unit_to_yojson x.time_unit);
      ("DimensionMappings", Some (dimension_mappings_to_yojson x.dimension_mappings));
      ( "MultiMeasureMappings",
        option_to_yojson multi_measure_mappings_to_yojson x.multi_measure_mappings );
      ( "MixedMeasureMappings",
        option_to_yojson mixed_measure_mapping_list_to_yojson x.mixed_measure_mappings );
      ("MeasureNameColumn", option_to_yojson string_value256_to_yojson x.measure_name_column);
    ]

let data_model_configuration_to_yojson (x : data_model_configuration) =
  assoc_to_yojson
    [
      ("DataModel", option_to_yojson data_model_to_yojson x.data_model);
      ( "DataModelS3Configuration",
        option_to_yojson data_model_s3_configuration_to_yojson x.data_model_s3_configuration );
    ]

let string_value2048_to_yojson = string_to_yojson

let s3_encryption_option_to_yojson (x : s3_encryption_option) =
  match x with SSE_S3 -> `String "SSE_S3" | SSE_KMS -> `String "SSE_KMS"

let s3_object_key_prefix_to_yojson = string_to_yojson

let report_s3_configuration_to_yojson (x : report_s3_configuration) =
  assoc_to_yojson
    [
      ("BucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
      ("ObjectKeyPrefix", option_to_yojson s3_object_key_prefix_to_yojson x.object_key_prefix);
      ("EncryptionOption", option_to_yojson s3_encryption_option_to_yojson x.encryption_option);
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
    ]

let report_configuration_to_yojson (x : report_configuration) =
  assoc_to_yojson
    [
      ( "ReportS3Configuration",
        option_to_yojson report_s3_configuration_to_yojson x.report_s3_configuration );
    ]

let boolean__to_yojson = bool_to_yojson
let string_value1_to_yojson = string_to_yojson

let csv_configuration_to_yojson (x : csv_configuration) =
  assoc_to_yojson
    [
      ("ColumnSeparator", option_to_yojson string_value1_to_yojson x.column_separator);
      ("EscapeChar", option_to_yojson string_value1_to_yojson x.escape_char);
      ("QuoteChar", option_to_yojson string_value1_to_yojson x.quote_char);
      ("NullValue", option_to_yojson string_value256_to_yojson x.null_value);
      ("TrimWhiteSpace", option_to_yojson boolean__to_yojson x.trim_white_space);
    ]

let data_source_s3_configuration_to_yojson (x : data_source_s3_configuration) =
  assoc_to_yojson
    [
      ("BucketName", Some (s3_bucket_name_to_yojson x.bucket_name));
      ("ObjectKeyPrefix", option_to_yojson s3_object_key_to_yojson x.object_key_prefix);
    ]

let data_source_configuration_to_yojson (x : data_source_configuration) =
  assoc_to_yojson
    [
      ( "DataSourceS3Configuration",
        Some (data_source_s3_configuration_to_yojson x.data_source_s3_configuration) );
      ("CsvConfiguration", option_to_yojson csv_configuration_to_yojson x.csv_configuration);
      ("DataFormat", Some (batch_load_data_format_to_yojson x.data_format));
    ]

let batch_load_task_description_to_yojson (x : batch_load_task_description) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson batch_load_task_id_to_yojson x.task_id);
      ("ErrorMessage", option_to_yojson string_value2048_to_yojson x.error_message);
      ( "DataSourceConfiguration",
        option_to_yojson data_source_configuration_to_yojson x.data_source_configuration );
      ("ProgressReport", option_to_yojson batch_load_progress_report_to_yojson x.progress_report);
      ("ReportConfiguration", option_to_yojson report_configuration_to_yojson x.report_configuration);
      ( "DataModelConfiguration",
        option_to_yojson data_model_configuration_to_yojson x.data_model_configuration );
      ("TargetDatabaseName", option_to_yojson resource_name_to_yojson x.target_database_name);
      ("TargetTableName", option_to_yojson resource_name_to_yojson x.target_table_name);
      ("TaskStatus", option_to_yojson batch_load_status_to_yojson x.task_status);
      ("RecordVersion", option_to_yojson record_version_to_yojson x.record_version);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
      ("ResumableUntil", option_to_yojson date_to_yojson x.resumable_until);
    ]

let batch_load_task_list_to_yojson tree = list_to_yojson batch_load_task_to_yojson tree
let client_request_token_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_endpoint_exception_to_yojson (x : invalid_endpoint_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", Some (error_message_to_yojson x.message)) ]

let create_batch_load_task_response_to_yojson (x : create_batch_load_task_response) =
  assoc_to_yojson [ ("TaskId", Some (batch_load_task_id_to_yojson x.task_id)) ]

let resource_create_api_name_to_yojson = string_to_yojson

let create_batch_load_task_request_to_yojson (x : create_batch_load_task_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "DataModelConfiguration",
        option_to_yojson data_model_configuration_to_yojson x.data_model_configuration );
      ( "DataSourceConfiguration",
        Some (data_source_configuration_to_yojson x.data_source_configuration) );
      ("ReportConfiguration", Some (report_configuration_to_yojson x.report_configuration));
      ("TargetDatabaseName", Some (resource_create_api_name_to_yojson x.target_database_name));
      ("TargetTableName", Some (resource_create_api_name_to_yojson x.target_table_name));
      ("RecordVersion", option_to_yojson record_version_to_yojson x.record_version);
    ]

let string__to_yojson = string_to_yojson

let database_to_yojson (x : database) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("TableCount", option_to_yojson long_to_yojson x.table_count);
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
    ]

let create_database_response_to_yojson (x : create_database_response) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_database_request_to_yojson (x : create_database_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (resource_create_api_name_to_yojson x.database_name));
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let partition_key_enforcement_level_to_yojson (x : partition_key_enforcement_level) =
  match x with REQUIRED -> `String "REQUIRED" | OPTIONAL -> `String "OPTIONAL"

let partition_key_type_to_yojson (x : partition_key_type) =
  match x with DIMENSION -> `String "DIMENSION" | MEASURE -> `String "MEASURE"

let partition_key_to_yojson (x : partition_key) =
  assoc_to_yojson
    [
      ("Type", Some (partition_key_type_to_yojson x.type_));
      ("Name", option_to_yojson schema_name_to_yojson x.name);
      ( "EnforcementInRecord",
        option_to_yojson partition_key_enforcement_level_to_yojson x.enforcement_in_record );
    ]

let partition_key_list_to_yojson tree = list_to_yojson partition_key_to_yojson tree

let schema_to_yojson (x : schema) =
  assoc_to_yojson
    [
      ( "CompositePartitionKey",
        option_to_yojson partition_key_list_to_yojson x.composite_partition_key );
    ]

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("BucketName", option_to_yojson s3_bucket_name_to_yojson x.bucket_name);
      ("ObjectKeyPrefix", option_to_yojson s3_object_key_prefix_to_yojson x.object_key_prefix);
      ("EncryptionOption", option_to_yojson s3_encryption_option_to_yojson x.encryption_option);
      ("KmsKeyId", option_to_yojson string_value2048_to_yojson x.kms_key_id);
    ]

let magnetic_store_rejected_data_location_to_yojson (x : magnetic_store_rejected_data_location) =
  assoc_to_yojson
    [ ("S3Configuration", option_to_yojson s3_configuration_to_yojson x.s3_configuration) ]

let magnetic_store_write_properties_to_yojson (x : magnetic_store_write_properties) =
  assoc_to_yojson
    [
      ("EnableMagneticStoreWrites", Some (boolean__to_yojson x.enable_magnetic_store_writes));
      ( "MagneticStoreRejectedDataLocation",
        option_to_yojson magnetic_store_rejected_data_location_to_yojson
          x.magnetic_store_rejected_data_location );
    ]

let magnetic_store_retention_period_in_days_to_yojson = long_to_yojson
let memory_store_retention_period_in_hours_to_yojson = long_to_yojson

let retention_properties_to_yojson (x : retention_properties) =
  assoc_to_yojson
    [
      ( "MemoryStoreRetentionPeriodInHours",
        Some
          (memory_store_retention_period_in_hours_to_yojson x.memory_store_retention_period_in_hours)
      );
      ( "MagneticStoreRetentionPeriodInDays",
        Some
          (magnetic_store_retention_period_in_days_to_yojson
             x.magnetic_store_retention_period_in_days) );
    ]

let table_status_to_yojson (x : table_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DELETING -> `String "DELETING"
  | RESTORING -> `String "RESTORING"

let table_to_yojson (x : table) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson string__to_yojson x.arn);
      ("TableName", option_to_yojson resource_name_to_yojson x.table_name);
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("TableStatus", option_to_yojson table_status_to_yojson x.table_status);
      ("RetentionProperties", option_to_yojson retention_properties_to_yojson x.retention_properties);
      ("CreationTime", option_to_yojson date_to_yojson x.creation_time);
      ("LastUpdatedTime", option_to_yojson date_to_yojson x.last_updated_time);
      ( "MagneticStoreWriteProperties",
        option_to_yojson magnetic_store_write_properties_to_yojson x.magnetic_store_write_properties
      );
      ("Schema", option_to_yojson schema_to_yojson x.schema);
    ]

let create_table_response_to_yojson (x : create_table_response) =
  assoc_to_yojson [ ("Table", option_to_yojson table_to_yojson x.table) ]

let create_table_request_to_yojson (x : create_table_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (resource_create_api_name_to_yojson x.database_name));
      ("TableName", Some (resource_create_api_name_to_yojson x.table_name));
      ("RetentionProperties", option_to_yojson retention_properties_to_yojson x.retention_properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "MagneticStoreWriteProperties",
        option_to_yojson magnetic_store_write_properties_to_yojson x.magnetic_store_write_properties
      );
      ("Schema", option_to_yojson schema_to_yojson x.schema);
    ]

let database_list_to_yojson tree = list_to_yojson database_to_yojson tree

let delete_database_request_to_yojson (x : delete_database_request) =
  assoc_to_yojson [ ("DatabaseName", Some (resource_name_to_yojson x.database_name)) ]

let delete_table_request_to_yojson (x : delete_table_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
      ("TableName", Some (resource_name_to_yojson x.table_name));
    ]

let describe_batch_load_task_response_to_yojson (x : describe_batch_load_task_response) =
  assoc_to_yojson
    [
      ( "BatchLoadTaskDescription",
        Some (batch_load_task_description_to_yojson x.batch_load_task_description) );
    ]

let describe_batch_load_task_request_to_yojson (x : describe_batch_load_task_request) =
  assoc_to_yojson [ ("TaskId", Some (batch_load_task_id_to_yojson x.task_id)) ]

let describe_database_response_to_yojson (x : describe_database_response) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let describe_database_request_to_yojson (x : describe_database_request) =
  assoc_to_yojson [ ("DatabaseName", Some (resource_name_to_yojson x.database_name)) ]

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

let describe_table_response_to_yojson (x : describe_table_response) =
  assoc_to_yojson [ ("Table", option_to_yojson table_to_yojson x.table) ]

let describe_table_request_to_yojson (x : describe_table_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
      ("TableName", Some (resource_name_to_yojson x.table_name));
    ]

let dimension_value_type_to_yojson (x : dimension_value_type) =
  match x with VARCHAR -> `String "VARCHAR"

let schema_value_to_yojson = string_to_yojson

let dimension_to_yojson (x : dimension) =
  assoc_to_yojson
    [
      ("Name", Some (schema_name_to_yojson x.name));
      ("Value", Some (schema_value_to_yojson x.value));
      ("DimensionValueType", option_to_yojson dimension_value_type_to_yojson x.dimension_value_type);
    ]

let dimensions_to_yojson tree = list_to_yojson dimension_to_yojson tree
let integer_to_yojson = int_to_yojson

let list_batch_load_tasks_response_to_yojson (x : list_batch_load_tasks_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("BatchLoadTasks", option_to_yojson batch_load_task_list_to_yojson x.batch_load_tasks);
    ]

let page_limit_to_yojson = int_to_yojson

let list_batch_load_tasks_request_to_yojson (x : list_batch_load_tasks_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson page_limit_to_yojson x.max_results);
      ("TaskStatus", option_to_yojson batch_load_status_to_yojson x.task_status);
    ]

let list_databases_response_to_yojson (x : list_databases_response) =
  assoc_to_yojson
    [
      ("Databases", option_to_yojson database_list_to_yojson x.databases);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let pagination_limit_to_yojson = int_to_yojson

let list_databases_request_to_yojson (x : list_databases_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_limit_to_yojson x.max_results);
    ]

let table_list_to_yojson tree = list_to_yojson table_to_yojson tree

let list_tables_response_to_yojson (x : list_tables_response) =
  assoc_to_yojson
    [
      ("Tables", option_to_yojson table_list_to_yojson x.tables);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_tables_request_to_yojson (x : list_tables_request) =
  assoc_to_yojson
    [
      ("DatabaseName", option_to_yojson resource_name_to_yojson x.database_name);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson pagination_limit_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let measure_value_to_yojson (x : measure_value) =
  assoc_to_yojson
    [
      ("Name", Some (schema_name_to_yojson x.name));
      ("Value", Some (string_value2048_to_yojson x.value));
      ("Type", Some (measure_value_type_to_yojson x.type_));
    ]

let measure_values_to_yojson tree = list_to_yojson measure_value_to_yojson tree

let record_to_yojson (x : record) =
  assoc_to_yojson
    [
      ("Dimensions", option_to_yojson dimensions_to_yojson x.dimensions);
      ("MeasureName", option_to_yojson schema_name_to_yojson x.measure_name);
      ("MeasureValue", option_to_yojson string_value2048_to_yojson x.measure_value);
      ("MeasureValueType", option_to_yojson measure_value_type_to_yojson x.measure_value_type);
      ("Time", option_to_yojson string_value256_to_yojson x.time);
      ("TimeUnit", option_to_yojson time_unit_to_yojson x.time_unit);
      ("Version", option_to_yojson record_version_to_yojson x.version);
      ("MeasureValues", option_to_yojson measure_values_to_yojson x.measure_values);
    ]

let record_index_to_yojson = int_to_yojson
let records_to_yojson tree = list_to_yojson record_to_yojson tree

let records_ingested_to_yojson (x : records_ingested) =
  assoc_to_yojson
    [
      ("Total", option_to_yojson integer_to_yojson x.total);
      ("MemoryStore", option_to_yojson integer_to_yojson x.memory_store);
      ("MagneticStore", option_to_yojson integer_to_yojson x.magnetic_store);
    ]

let rejected_record_to_yojson (x : rejected_record) =
  assoc_to_yojson
    [
      ("RecordIndex", option_to_yojson record_index_to_yojson x.record_index);
      ("Reason", option_to_yojson error_message_to_yojson x.reason);
      ("ExistingVersion", option_to_yojson record_version_to_yojson x.existing_version);
    ]

let rejected_records_to_yojson tree = list_to_yojson rejected_record_to_yojson tree

let rejected_records_exception_to_yojson (x : rejected_records_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("RejectedRecords", option_to_yojson rejected_records_to_yojson x.rejected_records);
    ]

let resume_batch_load_task_response_to_yojson = unit_to_yojson

let resume_batch_load_task_request_to_yojson (x : resume_batch_load_task_request) =
  assoc_to_yojson [ ("TaskId", Some (batch_load_task_id_to_yojson x.task_id)) ]

let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let write_records_response_to_yojson (x : write_records_response) =
  assoc_to_yojson
    [ ("RecordsIngested", option_to_yojson records_ingested_to_yojson x.records_ingested) ]

let write_records_request_to_yojson (x : write_records_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
      ("TableName", Some (resource_name_to_yojson x.table_name));
      ("CommonAttributes", option_to_yojson record_to_yojson x.common_attributes);
      ("Records", Some (records_to_yojson x.records));
    ]

let update_table_response_to_yojson (x : update_table_response) =
  assoc_to_yojson [ ("Table", option_to_yojson table_to_yojson x.table) ]

let update_table_request_to_yojson (x : update_table_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
      ("TableName", Some (resource_name_to_yojson x.table_name));
      ("RetentionProperties", option_to_yojson retention_properties_to_yojson x.retention_properties);
      ( "MagneticStoreWriteProperties",
        option_to_yojson magnetic_store_write_properties_to_yojson x.magnetic_store_write_properties
      );
      ("Schema", option_to_yojson schema_to_yojson x.schema);
    ]

let update_database_response_to_yojson (x : update_database_response) =
  assoc_to_yojson [ ("Database", option_to_yojson database_to_yojson x.database) ]

let update_database_request_to_yojson (x : update_database_request) =
  assoc_to_yojson
    [
      ("DatabaseName", Some (resource_name_to_yojson x.database_name));
      ("KmsKeyId", Some (string_value2048_to_yojson x.kms_key_id));
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]
