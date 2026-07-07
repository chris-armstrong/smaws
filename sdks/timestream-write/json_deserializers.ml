open Smaws_Lib.Json.DeserializeHelpers
open Types

let integer_of_yojson = int_of_yojson

let records_ingested_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     magnetic_store = option_of_yojson (value_for_key integer_of_yojson "MagneticStore") _list path;
     memory_store = option_of_yojson (value_for_key integer_of_yojson "MemoryStore") _list path;
     total = option_of_yojson (value_for_key integer_of_yojson "Total") _list path;
   }
    : records_ingested)

let write_records_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     records_ingested =
       option_of_yojson (value_for_key records_ingested_of_yojson "RecordsIngested") _list path;
   }
    : write_records_response)

let resource_name_of_yojson = string_of_yojson
let schema_name_of_yojson = string_of_yojson
let schema_value_of_yojson = string_of_yojson

let dimension_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VARCHAR" -> VARCHAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "DimensionValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "DimensionValueType")
     : dimension_value_type)
    : dimension_value_type)

let dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dimension_value_type =
       option_of_yojson
         (value_for_key dimension_value_type_of_yojson "DimensionValueType")
         _list path;
     value = value_for_key schema_value_of_yojson "Value" _list path;
     name = value_for_key schema_name_of_yojson "Name" _list path;
   }
    : dimension)

let dimensions_of_yojson tree path = list_of_yojson dimension_of_yojson tree path
let string_value2048_of_yojson = string_of_yojson

let measure_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MULTI" -> MULTI
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String "BOOLEAN" -> BOOLEAN
    | `String "VARCHAR" -> VARCHAR
    | `String "BIGINT" -> BIGINT
    | `String "DOUBLE" -> DOUBLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "MeasureValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "MeasureValueType")
     : measure_value_type)
    : measure_value_type)

let string_value256_of_yojson = string_of_yojson

let time_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "NANOSECONDS" -> NANOSECONDS
    | `String "MICROSECONDS" -> MICROSECONDS
    | `String "SECONDS" -> SECONDS
    | `String "MILLISECONDS" -> MILLISECONDS
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeUnit")
     : time_unit)
    : time_unit)

let record_version_of_yojson = long_of_yojson

let measure_value_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key measure_value_type_of_yojson "Type" _list path;
     value = value_for_key string_value2048_of_yojson "Value" _list path;
     name = value_for_key schema_name_of_yojson "Name" _list path;
   }
    : measure_value)

let measure_values_of_yojson tree path = list_of_yojson measure_value_of_yojson tree path

let record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     measure_values =
       option_of_yojson (value_for_key measure_values_of_yojson "MeasureValues") _list path;
     version = option_of_yojson (value_for_key record_version_of_yojson "Version") _list path;
     time_unit = option_of_yojson (value_for_key time_unit_of_yojson "TimeUnit") _list path;
     time = option_of_yojson (value_for_key string_value256_of_yojson "Time") _list path;
     measure_value_type =
       option_of_yojson (value_for_key measure_value_type_of_yojson "MeasureValueType") _list path;
     measure_value =
       option_of_yojson (value_for_key string_value2048_of_yojson "MeasureValue") _list path;
     measure_name = option_of_yojson (value_for_key schema_name_of_yojson "MeasureName") _list path;
     dimensions = option_of_yojson (value_for_key dimensions_of_yojson "Dimensions") _list path;
   }
    : record)

let records_of_yojson tree path = list_of_yojson record_of_yojson tree path

let write_records_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     records = value_for_key records_of_yojson "Records" _list path;
     common_attributes =
       option_of_yojson (value_for_key record_of_yojson "CommonAttributes") _list path;
     table_name = value_for_key resource_name_of_yojson "TableName" _list path;
     database_name = value_for_key resource_name_of_yojson "DatabaseName" _list path;
   }
    : write_records_request)

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "Message" _list path } : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "Message" _list path } : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let record_index_of_yojson = int_of_yojson

let rejected_record_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     existing_version =
       option_of_yojson (value_for_key record_version_of_yojson "ExistingVersion") _list path;
     reason = option_of_yojson (value_for_key error_message_of_yojson "Reason") _list path;
     record_index = option_of_yojson (value_for_key record_index_of_yojson "RecordIndex") _list path;
   }
    : rejected_record)

let rejected_records_of_yojson tree path = list_of_yojson rejected_record_of_yojson tree path

let rejected_records_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rejected_records =
       option_of_yojson (value_for_key rejected_records_of_yojson "RejectedRecords") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : rejected_records_exception)

let invalid_endpoint_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_endpoint_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "Message" _list path }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "Message" _list path }
    : access_denied_exception)

let string__of_yojson = string_of_yojson

let table_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESTORING" -> RESTORING
    | `String "DELETING" -> DELETING
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TableStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TableStatus")
     : table_status)
    : table_status)

let memory_store_retention_period_in_hours_of_yojson = long_of_yojson
let magnetic_store_retention_period_in_days_of_yojson = long_of_yojson

let retention_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     magnetic_store_retention_period_in_days =
       value_for_key magnetic_store_retention_period_in_days_of_yojson
         "MagneticStoreRetentionPeriodInDays" _list path;
     memory_store_retention_period_in_hours =
       value_for_key memory_store_retention_period_in_hours_of_yojson
         "MemoryStoreRetentionPeriodInHours" _list path;
   }
    : retention_properties)

let date_of_yojson = timestamp_epoch_seconds_of_yojson
let boolean__of_yojson = bool_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson
let s3_object_key_prefix_of_yojson = string_of_yojson

let s3_encryption_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSE_KMS" -> SSE_KMS
    | `String "SSE_S3" -> SSE_S3
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3EncryptionOption" value)
    | _ -> raise (deserialize_wrong_type_error path "S3EncryptionOption")
     : s3_encryption_option)
    : s3_encryption_option)

let s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key string_value2048_of_yojson "KmsKeyId") _list path;
     encryption_option =
       option_of_yojson (value_for_key s3_encryption_option_of_yojson "EncryptionOption") _list path;
     object_key_prefix =
       option_of_yojson (value_for_key s3_object_key_prefix_of_yojson "ObjectKeyPrefix") _list path;
     bucket_name = option_of_yojson (value_for_key s3_bucket_name_of_yojson "BucketName") _list path;
   }
    : s3_configuration)

let magnetic_store_rejected_data_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_configuration =
       option_of_yojson (value_for_key s3_configuration_of_yojson "S3Configuration") _list path;
   }
    : magnetic_store_rejected_data_location)

let magnetic_store_write_properties_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     magnetic_store_rejected_data_location =
       option_of_yojson
         (value_for_key magnetic_store_rejected_data_location_of_yojson
            "MagneticStoreRejectedDataLocation")
         _list path;
     enable_magnetic_store_writes =
       value_for_key boolean__of_yojson "EnableMagneticStoreWrites" _list path;
   }
    : magnetic_store_write_properties)

let partition_key_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MEASURE" -> MEASURE
    | `String "DIMENSION" -> DIMENSION
    | `String value -> raise (deserialize_unknown_enum_value_error path "PartitionKeyType" value)
    | _ -> raise (deserialize_wrong_type_error path "PartitionKeyType")
     : partition_key_type)
    : partition_key_type)

let partition_key_enforcement_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPTIONAL" -> OPTIONAL
    | `String "REQUIRED" -> REQUIRED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PartitionKeyEnforcementLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "PartitionKeyEnforcementLevel")
     : partition_key_enforcement_level)
    : partition_key_enforcement_level)

let partition_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enforcement_in_record =
       option_of_yojson
         (value_for_key partition_key_enforcement_level_of_yojson "EnforcementInRecord")
         _list path;
     name = option_of_yojson (value_for_key schema_name_of_yojson "Name") _list path;
     type_ = value_for_key partition_key_type_of_yojson "Type" _list path;
   }
    : partition_key)

let partition_key_list_of_yojson tree path = list_of_yojson partition_key_of_yojson tree path

let schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     composite_partition_key =
       option_of_yojson
         (value_for_key partition_key_list_of_yojson "CompositePartitionKey")
         _list path;
   }
    : schema)

let table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key schema_of_yojson "Schema") _list path;
     magnetic_store_write_properties =
       option_of_yojson
         (value_for_key magnetic_store_write_properties_of_yojson "MagneticStoreWriteProperties")
         _list path;
     last_updated_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     retention_properties =
       option_of_yojson
         (value_for_key retention_properties_of_yojson "RetentionProperties")
         _list path;
     table_status = option_of_yojson (value_for_key table_status_of_yojson "TableStatus") _list path;
     database_name =
       option_of_yojson (value_for_key resource_name_of_yojson "DatabaseName") _list path;
     table_name = option_of_yojson (value_for_key resource_name_of_yojson "TableName") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
   }
    : table)

let update_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table = option_of_yojson (value_for_key table_of_yojson "Table") _list path }
    : update_table_response)

let update_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key schema_of_yojson "Schema") _list path;
     magnetic_store_write_properties =
       option_of_yojson
         (value_for_key magnetic_store_write_properties_of_yojson "MagneticStoreWriteProperties")
         _list path;
     retention_properties =
       option_of_yojson
         (value_for_key retention_properties_of_yojson "RetentionProperties")
         _list path;
     table_name = value_for_key resource_name_of_yojson "TableName" _list path;
     database_name = value_for_key resource_name_of_yojson "DatabaseName" _list path;
   }
    : update_table_request)

let long_of_yojson = long_of_yojson

let database_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     kms_key_id = option_of_yojson (value_for_key string_value2048_of_yojson "KmsKeyId") _list path;
     table_count = option_of_yojson (value_for_key long_of_yojson "TableCount") _list path;
     database_name =
       option_of_yojson (value_for_key resource_name_of_yojson "DatabaseName") _list path;
     arn = option_of_yojson (value_for_key string__of_yojson "Arn") _list path;
   }
    : database)

let update_database_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ database = option_of_yojson (value_for_key database_of_yojson "Database") _list path }
    : update_database_response)

let update_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = value_for_key string_value2048_of_yojson "KmsKeyId" _list path;
     database_name = value_for_key resource_name_of_yojson "DatabaseName" _list path;
   }
    : update_database_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson

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
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let resume_batch_load_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let batch_load_task_id_of_yojson = string_of_yojson

let resume_batch_load_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = value_for_key batch_load_task_id_of_yojson "TaskId" _list path }
    : resume_batch_load_task_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let table_list_of_yojson tree path = list_of_yojson table_of_yojson tree path

let list_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     tables = option_of_yojson (value_for_key table_list_of_yojson "Tables") _list path;
   }
    : list_tables_response)

let pagination_limit_of_yojson = int_of_yojson

let list_tables_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     database_name =
       option_of_yojson (value_for_key resource_name_of_yojson "DatabaseName") _list path;
   }
    : list_tables_request)

let database_list_of_yojson tree path = list_of_yojson database_of_yojson tree path

let list_databases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
     databases = option_of_yojson (value_for_key database_list_of_yojson "Databases") _list path;
   }
    : list_databases_response)

let list_databases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key pagination_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_databases_request)

let batch_load_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING_RESUME" -> PENDING_RESUME
    | `String "PROGRESS_STOPPED" -> PROGRESS_STOPPED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "CREATED" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "BatchLoadStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchLoadStatus")
     : batch_load_status)
    : batch_load_status)

let batch_load_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resumable_until = option_of_yojson (value_for_key date_of_yojson "ResumableUntil") _list path;
     last_updated_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     table_name = option_of_yojson (value_for_key resource_name_of_yojson "TableName") _list path;
     database_name =
       option_of_yojson (value_for_key resource_name_of_yojson "DatabaseName") _list path;
     task_status =
       option_of_yojson (value_for_key batch_load_status_of_yojson "TaskStatus") _list path;
     task_id = option_of_yojson (value_for_key batch_load_task_id_of_yojson "TaskId") _list path;
   }
    : batch_load_task)

let batch_load_task_list_of_yojson tree path = list_of_yojson batch_load_task_of_yojson tree path

let list_batch_load_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_load_tasks =
       option_of_yojson (value_for_key batch_load_task_list_of_yojson "BatchLoadTasks") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_batch_load_tasks_response)

let page_limit_of_yojson = int_of_yojson

let list_batch_load_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_status =
       option_of_yojson (value_for_key batch_load_status_of_yojson "TaskStatus") _list path;
     max_results = option_of_yojson (value_for_key page_limit_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key string__of_yojson "NextToken") _list path;
   }
    : list_batch_load_tasks_request)

let describe_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table = option_of_yojson (value_for_key table_of_yojson "Table") _list path }
    : describe_table_response)

let describe_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key resource_name_of_yojson "TableName" _list path;
     database_name = value_for_key resource_name_of_yojson "DatabaseName" _list path;
   }
    : describe_table_request)

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_period_in_minutes = value_for_key long_of_yojson "CachePeriodInMinutes" _list path;
     address = value_for_key string__of_yojson "Address" _list path;
   }
    : endpoint)

let endpoints_of_yojson tree path = list_of_yojson endpoint_of_yojson tree path

let describe_endpoints_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ endpoints = value_for_key endpoints_of_yojson "Endpoints" _list path }
    : describe_endpoints_response)

let describe_endpoints_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let describe_database_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ database = option_of_yojson (value_for_key database_of_yojson "Database") _list path }
    : describe_database_response)

let describe_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ database_name = value_for_key resource_name_of_yojson "DatabaseName" _list path }
    : describe_database_request)

let s3_object_key_of_yojson = string_of_yojson

let data_source_s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     object_key_prefix =
       option_of_yojson (value_for_key s3_object_key_of_yojson "ObjectKeyPrefix") _list path;
     bucket_name = value_for_key s3_bucket_name_of_yojson "BucketName" _list path;
   }
    : data_source_s3_configuration)

let string_value1_of_yojson = string_of_yojson

let csv_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     trim_white_space =
       option_of_yojson (value_for_key boolean__of_yojson "TrimWhiteSpace") _list path;
     null_value = option_of_yojson (value_for_key string_value256_of_yojson "NullValue") _list path;
     quote_char = option_of_yojson (value_for_key string_value1_of_yojson "QuoteChar") _list path;
     escape_char = option_of_yojson (value_for_key string_value1_of_yojson "EscapeChar") _list path;
     column_separator =
       option_of_yojson (value_for_key string_value1_of_yojson "ColumnSeparator") _list path;
   }
    : csv_configuration)

let batch_load_data_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSV" -> CSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "BatchLoadDataFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchLoadDataFormat")
     : batch_load_data_format)
    : batch_load_data_format)

let data_source_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_format = value_for_key batch_load_data_format_of_yojson "DataFormat" _list path;
     csv_configuration =
       option_of_yojson (value_for_key csv_configuration_of_yojson "CsvConfiguration") _list path;
     data_source_s3_configuration =
       value_for_key data_source_s3_configuration_of_yojson "DataSourceS3Configuration" _list path;
   }
    : data_source_configuration)

let batch_load_progress_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bytes_metered = option_of_yojson (value_for_key long_of_yojson "BytesMetered") _list path;
     file_failures = option_of_yojson (value_for_key long_of_yojson "FileFailures") _list path;
     record_ingestion_failures =
       option_of_yojson (value_for_key long_of_yojson "RecordIngestionFailures") _list path;
     parse_failures = option_of_yojson (value_for_key long_of_yojson "ParseFailures") _list path;
     records_ingested = option_of_yojson (value_for_key long_of_yojson "RecordsIngested") _list path;
     records_processed =
       option_of_yojson (value_for_key long_of_yojson "RecordsProcessed") _list path;
   }
    : batch_load_progress_report)

let report_s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_id = option_of_yojson (value_for_key string_value2048_of_yojson "KmsKeyId") _list path;
     encryption_option =
       option_of_yojson (value_for_key s3_encryption_option_of_yojson "EncryptionOption") _list path;
     object_key_prefix =
       option_of_yojson (value_for_key s3_object_key_prefix_of_yojson "ObjectKeyPrefix") _list path;
     bucket_name = value_for_key s3_bucket_name_of_yojson "BucketName" _list path;
   }
    : report_s3_configuration)

let report_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_s3_configuration =
       option_of_yojson
         (value_for_key report_s3_configuration_of_yojson "ReportS3Configuration")
         _list path;
   }
    : report_configuration)

let dimension_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_column =
       option_of_yojson (value_for_key schema_name_of_yojson "DestinationColumn") _list path;
     source_column =
       option_of_yojson (value_for_key schema_name_of_yojson "SourceColumn") _list path;
   }
    : dimension_mapping)

let dimension_mappings_of_yojson tree path = list_of_yojson dimension_mapping_of_yojson tree path

let scalar_measure_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String "VARCHAR" -> VARCHAR
    | `String "BOOLEAN" -> BOOLEAN
    | `String "BIGINT" -> BIGINT
    | `String "DOUBLE" -> DOUBLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScalarMeasureValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalarMeasureValueType")
     : scalar_measure_value_type)
    : scalar_measure_value_type)

let multi_measure_attribute_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     measure_value_type =
       option_of_yojson
         (value_for_key scalar_measure_value_type_of_yojson "MeasureValueType")
         _list path;
     target_multi_measure_attribute_name =
       option_of_yojson
         (value_for_key schema_name_of_yojson "TargetMultiMeasureAttributeName")
         _list path;
     source_column = value_for_key schema_name_of_yojson "SourceColumn" _list path;
   }
    : multi_measure_attribute_mapping)

let multi_measure_attribute_mapping_list_of_yojson tree path =
  list_of_yojson multi_measure_attribute_mapping_of_yojson tree path

let multi_measure_mappings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_measure_attribute_mappings =
       value_for_key multi_measure_attribute_mapping_list_of_yojson "MultiMeasureAttributeMappings"
         _list path;
     target_multi_measure_name =
       option_of_yojson (value_for_key schema_name_of_yojson "TargetMultiMeasureName") _list path;
   }
    : multi_measure_mappings)

let mixed_measure_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     multi_measure_attribute_mappings =
       option_of_yojson
         (value_for_key multi_measure_attribute_mapping_list_of_yojson
            "MultiMeasureAttributeMappings")
         _list path;
     measure_value_type = value_for_key measure_value_type_of_yojson "MeasureValueType" _list path;
     target_measure_name =
       option_of_yojson (value_for_key schema_name_of_yojson "TargetMeasureName") _list path;
     source_column =
       option_of_yojson (value_for_key schema_name_of_yojson "SourceColumn") _list path;
     measure_name = option_of_yojson (value_for_key schema_name_of_yojson "MeasureName") _list path;
   }
    : mixed_measure_mapping)

let mixed_measure_mapping_list_of_yojson tree path =
  list_of_yojson mixed_measure_mapping_of_yojson tree path

let data_model_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     measure_name_column =
       option_of_yojson (value_for_key string_value256_of_yojson "MeasureNameColumn") _list path;
     mixed_measure_mappings =
       option_of_yojson
         (value_for_key mixed_measure_mapping_list_of_yojson "MixedMeasureMappings")
         _list path;
     multi_measure_mappings =
       option_of_yojson
         (value_for_key multi_measure_mappings_of_yojson "MultiMeasureMappings")
         _list path;
     dimension_mappings = value_for_key dimension_mappings_of_yojson "DimensionMappings" _list path;
     time_unit = option_of_yojson (value_for_key time_unit_of_yojson "TimeUnit") _list path;
     time_column =
       option_of_yojson (value_for_key string_value256_of_yojson "TimeColumn") _list path;
   }
    : data_model)

let data_model_s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     object_key = option_of_yojson (value_for_key s3_object_key_of_yojson "ObjectKey") _list path;
     bucket_name = option_of_yojson (value_for_key s3_bucket_name_of_yojson "BucketName") _list path;
   }
    : data_model_s3_configuration)

let data_model_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_model_s3_configuration =
       option_of_yojson
         (value_for_key data_model_s3_configuration_of_yojson "DataModelS3Configuration")
         _list path;
     data_model = option_of_yojson (value_for_key data_model_of_yojson "DataModel") _list path;
   }
    : data_model_configuration)

let batch_load_task_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resumable_until = option_of_yojson (value_for_key date_of_yojson "ResumableUntil") _list path;
     last_updated_time =
       option_of_yojson (value_for_key date_of_yojson "LastUpdatedTime") _list path;
     creation_time = option_of_yojson (value_for_key date_of_yojson "CreationTime") _list path;
     record_version =
       option_of_yojson (value_for_key record_version_of_yojson "RecordVersion") _list path;
     task_status =
       option_of_yojson (value_for_key batch_load_status_of_yojson "TaskStatus") _list path;
     target_table_name =
       option_of_yojson (value_for_key resource_name_of_yojson "TargetTableName") _list path;
     target_database_name =
       option_of_yojson (value_for_key resource_name_of_yojson "TargetDatabaseName") _list path;
     data_model_configuration =
       option_of_yojson
         (value_for_key data_model_configuration_of_yojson "DataModelConfiguration")
         _list path;
     report_configuration =
       option_of_yojson
         (value_for_key report_configuration_of_yojson "ReportConfiguration")
         _list path;
     progress_report =
       option_of_yojson
         (value_for_key batch_load_progress_report_of_yojson "ProgressReport")
         _list path;
     data_source_configuration =
       option_of_yojson
         (value_for_key data_source_configuration_of_yojson "DataSourceConfiguration")
         _list path;
     error_message =
       option_of_yojson (value_for_key string_value2048_of_yojson "ErrorMessage") _list path;
     task_id = option_of_yojson (value_for_key batch_load_task_id_of_yojson "TaskId") _list path;
   }
    : batch_load_task_description)

let describe_batch_load_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     batch_load_task_description =
       value_for_key batch_load_task_description_of_yojson "BatchLoadTaskDescription" _list path;
   }
    : describe_batch_load_task_response)

let describe_batch_load_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = value_for_key batch_load_task_id_of_yojson "TaskId" _list path }
    : describe_batch_load_task_request)

let delete_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key resource_name_of_yojson "TableName" _list path;
     database_name = value_for_key resource_name_of_yojson "DatabaseName" _list path;
   }
    : delete_table_request)

let delete_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ database_name = value_for_key resource_name_of_yojson "DatabaseName" _list path }
    : delete_database_request)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "Message" _list path } : conflict_exception)

let create_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ table = option_of_yojson (value_for_key table_of_yojson "Table") _list path }
    : create_table_response)

let resource_create_api_name_of_yojson = string_of_yojson

let create_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schema = option_of_yojson (value_for_key schema_of_yojson "Schema") _list path;
     magnetic_store_write_properties =
       option_of_yojson
         (value_for_key magnetic_store_write_properties_of_yojson "MagneticStoreWriteProperties")
         _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     retention_properties =
       option_of_yojson
         (value_for_key retention_properties_of_yojson "RetentionProperties")
         _list path;
     table_name = value_for_key resource_create_api_name_of_yojson "TableName" _list path;
     database_name = value_for_key resource_create_api_name_of_yojson "DatabaseName" _list path;
   }
    : create_table_request)

let create_database_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ database = option_of_yojson (value_for_key database_of_yojson "Database") _list path }
    : create_database_response)

let create_database_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key string_value2048_of_yojson "KmsKeyId") _list path;
     database_name = value_for_key resource_create_api_name_of_yojson "DatabaseName" _list path;
   }
    : create_database_request)

let create_batch_load_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = value_for_key batch_load_task_id_of_yojson "TaskId" _list path }
    : create_batch_load_task_response)

let client_request_token_of_yojson = string_of_yojson

let create_batch_load_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_version =
       option_of_yojson (value_for_key record_version_of_yojson "RecordVersion") _list path;
     target_table_name =
       value_for_key resource_create_api_name_of_yojson "TargetTableName" _list path;
     target_database_name =
       value_for_key resource_create_api_name_of_yojson "TargetDatabaseName" _list path;
     report_configuration =
       value_for_key report_configuration_of_yojson "ReportConfiguration" _list path;
     data_source_configuration =
       value_for_key data_source_configuration_of_yojson "DataSourceConfiguration" _list path;
     data_model_configuration =
       option_of_yojson
         (value_for_key data_model_configuration_of_yojson "DataModelConfiguration")
         _list path;
     client_token =
       option_of_yojson (value_for_key client_request_token_of_yojson "ClientToken") _list path;
   }
    : create_batch_load_task_request)
