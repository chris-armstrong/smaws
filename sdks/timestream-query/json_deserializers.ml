open Smaws_Lib.Json.DeserializeHelpers
open Types

let service_error_message_of_yojson = string_of_yojson

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key service_error_message_of_yojson "Message") _list path;
   }
    : access_denied_exception)

let amazon_resource_name_of_yojson = string_of_yojson

let sns_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ topic_arn = value_for_key amazon_resource_name_of_yojson "TopicArn" _list path }
    : sns_configuration)

let account_settings_notification_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_configuration =
       option_of_yojson (value_for_key sns_configuration_of_yojson "SnsConfiguration") _list path;
     role_arn = value_for_key amazon_resource_name_of_yojson "RoleArn" _list path;
   }
    : account_settings_notification_configuration)

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : throttling_exception)

let invalid_endpoint_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_endpoint_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_exception)

let string__of_yojson = string_of_yojson

let cancel_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cancellation_message =
       option_of_yojson (value_for_key string__of_yojson "CancellationMessage") _list path;
   }
    : cancel_query_response)

let query_id_of_yojson = string_of_yojson

let cancel_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ query_id = value_for_key query_id_of_yojson "QueryId" _list path } : cancel_query_request)

let client_request_token_of_yojson = string_of_yojson
let client_token_of_yojson = string_of_yojson

let scalar_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VARCHAR" -> VARCHAR
    | `String "BOOLEAN" -> BOOLEAN
    | `String "BIGINT" -> BIGINT
    | `String "DOUBLE" -> DOUBLE
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String "DATE" -> DATE
    | `String "TIME" -> TIME
    | `String "INTERVAL_DAY_TO_SECOND" -> INTERVAL_DAY_TO_SECOND
    | `String "INTERVAL_YEAR_TO_MONTH" -> INTERVAL_YEAR_TO_MONTH
    | `String "UNKNOWN" -> UNKNOWN
    | `String "INTEGER" -> INTEGER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScalarType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalarType")
     : scalar_type)
    : scalar_type)

let rec type__of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalar_type = option_of_yojson (value_for_key scalar_type_of_yojson "ScalarType") _list path;
     array_column_info =
       option_of_yojson (value_for_key column_info_of_yojson "ArrayColumnInfo") _list path;
     time_series_measure_value_column_info =
       option_of_yojson
         (value_for_key column_info_of_yojson "TimeSeriesMeasureValueColumnInfo")
         _list path;
     row_column_info =
       option_of_yojson (value_for_key column_info_list_of_yojson "RowColumnInfo") _list path;
   }
    : type_)

and column_info_list_of_yojson tree path = list_of_yojson column_info_of_yojson tree path

and column_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     type_ = value_for_key type__of_yojson "Type" _list path;
   }
    : column_info)

let compute_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ON_DEMAND" -> ON_DEMAND
    | `String "PROVISIONED" -> PROVISIONED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComputeMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ComputeMode")
     : compute_mode)
    : compute_mode)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : conflict_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : service_quota_exceeded_exception)

let create_scheduled_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key amazon_resource_name_of_yojson "Arn" _list path }
    : create_scheduled_query_response)

let s3_encryption_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSE_S3" -> SSE_S3
    | `String "SSE_KMS" -> SSE_KMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3EncryptionOption" value)
    | _ -> raise (deserialize_wrong_type_error path "S3EncryptionOption")
     : s3_encryption_option)
    : s3_encryption_option)

let s3_object_key_prefix_of_yojson = string_of_yojson
let s3_bucket_name_of_yojson = string_of_yojson

let s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = value_for_key s3_bucket_name_of_yojson "BucketName" _list path;
     object_key_prefix =
       option_of_yojson (value_for_key s3_object_key_prefix_of_yojson "ObjectKeyPrefix") _list path;
     encryption_option =
       option_of_yojson (value_for_key s3_encryption_option_of_yojson "EncryptionOption") _list path;
   }
    : s3_configuration)

let error_report_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_configuration = value_for_key s3_configuration_of_yojson "S3Configuration" _list path }
    : error_report_configuration)

let string_value2048_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let schema_name_of_yojson = string_of_yojson

let scalar_measure_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BIGINT" -> BIGINT
    | `String "BOOLEAN" -> BOOLEAN
    | `String "DOUBLE" -> DOUBLE
    | `String "VARCHAR" -> VARCHAR
    | `String "TIMESTAMP" -> TIMESTAMP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScalarMeasureValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScalarMeasureValueType")
     : scalar_measure_value_type)
    : scalar_measure_value_type)

let multi_measure_attribute_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_column = value_for_key schema_name_of_yojson "SourceColumn" _list path;
     target_multi_measure_attribute_name =
       option_of_yojson
         (value_for_key schema_name_of_yojson "TargetMultiMeasureAttributeName")
         _list path;
     measure_value_type =
       value_for_key scalar_measure_value_type_of_yojson "MeasureValueType" _list path;
   }
    : multi_measure_attribute_mapping)

let multi_measure_attribute_mapping_list_of_yojson tree path =
  list_of_yojson multi_measure_attribute_mapping_of_yojson tree path

let measure_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BIGINT" -> BIGINT
    | `String "BOOLEAN" -> BOOLEAN
    | `String "DOUBLE" -> DOUBLE
    | `String "VARCHAR" -> VARCHAR
    | `String "MULTI" -> MULTI
    | `String value -> raise (deserialize_unknown_enum_value_error path "MeasureValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "MeasureValueType")
     : measure_value_type)
    : measure_value_type)

let mixed_measure_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     measure_name = option_of_yojson (value_for_key schema_name_of_yojson "MeasureName") _list path;
     source_column =
       option_of_yojson (value_for_key schema_name_of_yojson "SourceColumn") _list path;
     target_measure_name =
       option_of_yojson (value_for_key schema_name_of_yojson "TargetMeasureName") _list path;
     measure_value_type = value_for_key measure_value_type_of_yojson "MeasureValueType" _list path;
     multi_measure_attribute_mappings =
       option_of_yojson
         (value_for_key multi_measure_attribute_mapping_list_of_yojson
            "MultiMeasureAttributeMappings")
         _list path;
   }
    : mixed_measure_mapping)

let mixed_measure_mapping_list_of_yojson tree path =
  list_of_yojson mixed_measure_mapping_of_yojson tree path

let multi_measure_mappings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_multi_measure_name =
       option_of_yojson (value_for_key schema_name_of_yojson "TargetMultiMeasureName") _list path;
     multi_measure_attribute_mappings =
       value_for_key multi_measure_attribute_mapping_list_of_yojson "MultiMeasureAttributeMappings"
         _list path;
   }
    : multi_measure_mappings)

let dimension_value_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "VARCHAR" -> VARCHAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "DimensionValueType" value)
    | _ -> raise (deserialize_wrong_type_error path "DimensionValueType")
     : dimension_value_type)
    : dimension_value_type)

let dimension_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key schema_name_of_yojson "Name" _list path;
     dimension_value_type =
       value_for_key dimension_value_type_of_yojson "DimensionValueType" _list path;
   }
    : dimension_mapping)

let dimension_mapping_list_of_yojson tree path =
  list_of_yojson dimension_mapping_of_yojson tree path

let resource_name_of_yojson = string_of_yojson

let timestream_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_name = value_for_key resource_name_of_yojson "DatabaseName" _list path;
     table_name = value_for_key resource_name_of_yojson "TableName" _list path;
     time_column = value_for_key schema_name_of_yojson "TimeColumn" _list path;
     dimension_mappings =
       value_for_key dimension_mapping_list_of_yojson "DimensionMappings" _list path;
     multi_measure_mappings =
       option_of_yojson
         (value_for_key multi_measure_mappings_of_yojson "MultiMeasureMappings")
         _list path;
     mixed_measure_mappings =
       option_of_yojson
         (value_for_key mixed_measure_mapping_list_of_yojson "MixedMeasureMappings")
         _list path;
     measure_name_column =
       option_of_yojson (value_for_key schema_name_of_yojson "MeasureNameColumn") _list path;
   }
    : timestream_configuration)

let target_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestream_configuration =
       value_for_key timestream_configuration_of_yojson "TimestreamConfiguration" _list path;
   }
    : target_configuration)

let notification_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ sns_configuration = value_for_key sns_configuration_of_yojson "SnsConfiguration" _list path }
    : notification_configuration)

let schedule_expression_of_yojson = string_of_yojson

let schedule_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schedule_expression =
       value_for_key schedule_expression_of_yojson "ScheduleExpression" _list path;
   }
    : schedule_configuration)

let query_string_of_yojson = string_of_yojson
let scheduled_query_name_of_yojson = string_of_yojson

let create_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key scheduled_query_name_of_yojson "Name" _list path;
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
     schedule_configuration =
       value_for_key schedule_configuration_of_yojson "ScheduleConfiguration" _list path;
     notification_configuration =
       value_for_key notification_configuration_of_yojson "NotificationConfiguration" _list path;
     target_configuration =
       option_of_yojson
         (value_for_key target_configuration_of_yojson "TargetConfiguration")
         _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     scheduled_query_execution_role_arn =
       value_for_key amazon_resource_name_of_yojson "ScheduledQueryExecutionRoleArn" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key string_value2048_of_yojson "KmsKeyId") _list path;
     error_report_configuration =
       value_for_key error_report_configuration_of_yojson "ErrorReportConfiguration" _list path;
   }
    : create_scheduled_query_request)

let nullable_boolean_of_yojson = bool_of_yojson
let timestamp_of_yojson = string_of_yojson
let scalar_value_of_yojson = string_of_yojson

let rec time_series_data_point_list_of_yojson tree path =
  list_of_yojson time_series_data_point_of_yojson tree path

and time_series_data_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time = value_for_key timestamp_of_yojson "Time" _list path;
     value = value_for_key datum_of_yojson "Value" _list path;
   }
    : time_series_data_point)

and row_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ data = value_for_key datum_list_of_yojson "Data" _list path } : row)

and datum_list_of_yojson tree path = list_of_yojson datum_of_yojson tree path

and datum_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scalar_value = option_of_yojson (value_for_key scalar_value_of_yojson "ScalarValue") _list path;
     time_series_value =
       option_of_yojson
         (value_for_key time_series_data_point_list_of_yojson "TimeSeriesValue")
         _list path;
     array_value = option_of_yojson (value_for_key datum_list_of_yojson "ArrayValue") _list path;
     row_value = option_of_yojson (value_for_key row_of_yojson "RowValue") _list path;
     null_value = option_of_yojson (value_for_key nullable_boolean_of_yojson "NullValue") _list path;
   }
    : datum)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     scheduled_query_arn =
       option_of_yojson
         (value_for_key amazon_resource_name_of_yojson "ScheduledQueryArn")
         _list path;
   }
    : resource_not_found_exception)

let delete_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_query_arn =
       value_for_key amazon_resource_name_of_yojson "ScheduledQueryArn" _list path;
   }
    : delete_scheduled_query_request)

let last_update_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value -> raise (deserialize_unknown_enum_value_error path "LastUpdateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LastUpdateStatus")
     : last_update_status)
    : last_update_status)

let query_tc_u_of_yojson = int_of_yojson

let last_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_query_tc_u =
       option_of_yojson (value_for_key query_tc_u_of_yojson "TargetQueryTCU") _list path;
     status = option_of_yojson (value_for_key last_update_status_of_yojson "Status") _list path;
     status_message = option_of_yojson (value_for_key string__of_yojson "StatusMessage") _list path;
   }
    : last_update)

let provisioned_capacity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_query_tc_u =
       option_of_yojson (value_for_key query_tc_u_of_yojson "ActiveQueryTCU") _list path;
     notification_configuration =
       option_of_yojson
         (value_for_key account_settings_notification_configuration_of_yojson
            "NotificationConfiguration")
         _list path;
     last_update = option_of_yojson (value_for_key last_update_of_yojson "LastUpdate") _list path;
   }
    : provisioned_capacity_response)

let query_compute_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_mode = option_of_yojson (value_for_key compute_mode_of_yojson "ComputeMode") _list path;
     provisioned_capacity =
       option_of_yojson
         (value_for_key provisioned_capacity_response_of_yojson "ProvisionedCapacity")
         _list path;
   }
    : query_compute_response)

let query_pricing_model_of_yojson (tree : t) path =
  ((match tree with
    | `String "BYTES_SCANNED" -> BYTES_SCANNED
    | `String "COMPUTE_UNITS" -> COMPUTE_UNITS
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueryPricingModel" value)
    | _ -> raise (deserialize_wrong_type_error path "QueryPricingModel")
     : query_pricing_model)
    : query_pricing_model)

let max_query_capacity_of_yojson = int_of_yojson

let describe_account_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_query_tc_u =
       option_of_yojson (value_for_key max_query_capacity_of_yojson "MaxQueryTCU") _list path;
     query_pricing_model =
       option_of_yojson (value_for_key query_pricing_model_of_yojson "QueryPricingModel") _list path;
     query_compute =
       option_of_yojson (value_for_key query_compute_response_of_yojson "QueryCompute") _list path;
   }
    : describe_account_settings_response)

let describe_account_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let long_of_yojson = long_of_yojson

let endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     address = value_for_key string__of_yojson "Address" _list path;
     cache_period_in_minutes = value_for_key long_of_yojson "CachePeriodInMinutes" _list path;
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

let s3_object_key_of_yojson = string_of_yojson

let s3_report_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_name = option_of_yojson (value_for_key s3_bucket_name_of_yojson "BucketName") _list path;
     object_key = option_of_yojson (value_for_key s3_object_key_of_yojson "ObjectKey") _list path;
   }
    : s3_report_location)

let error_report_location_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_report_location =
       option_of_yojson (value_for_key s3_report_location_of_yojson "S3ReportLocation") _list path;
   }
    : error_report_location)

let query_temporal_range_max_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key long_of_yojson "Value") _list path;
     table_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "TableArn") _list path;
   }
    : query_temporal_range_max)

let query_temporal_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ max = option_of_yojson (value_for_key query_temporal_range_max_of_yojson "Max") _list path }
    : query_temporal_range)

let partition_key_of_yojson = string_of_yojson
let partition_key_list_of_yojson tree path = list_of_yojson partition_key_of_yojson tree path
let double_of_yojson = double_of_yojson

let query_spatial_coverage_max_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key double_of_yojson "Value") _list path;
     table_arn =
       option_of_yojson (value_for_key amazon_resource_name_of_yojson "TableArn") _list path;
     partition_key =
       option_of_yojson (value_for_key partition_key_list_of_yojson "PartitionKey") _list path;
   }
    : query_spatial_coverage_max)

let query_spatial_coverage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ max = option_of_yojson (value_for_key query_spatial_coverage_max_of_yojson "Max") _list path }
    : query_spatial_coverage)

let scheduled_query_insights_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_spatial_coverage =
       option_of_yojson
         (value_for_key query_spatial_coverage_of_yojson "QuerySpatialCoverage")
         _list path;
     query_temporal_range =
       option_of_yojson
         (value_for_key query_temporal_range_of_yojson "QueryTemporalRange")
         _list path;
     query_table_count =
       option_of_yojson (value_for_key long_of_yojson "QueryTableCount") _list path;
     output_rows = option_of_yojson (value_for_key long_of_yojson "OutputRows") _list path;
     output_bytes = option_of_yojson (value_for_key long_of_yojson "OutputBytes") _list path;
   }
    : scheduled_query_insights_response)

let execution_stats_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_time_in_millis =
       option_of_yojson (value_for_key long_of_yojson "ExecutionTimeInMillis") _list path;
     data_writes = option_of_yojson (value_for_key long_of_yojson "DataWrites") _list path;
     bytes_metered = option_of_yojson (value_for_key long_of_yojson "BytesMetered") _list path;
     cumulative_bytes_scanned =
       option_of_yojson (value_for_key long_of_yojson "CumulativeBytesScanned") _list path;
     records_ingested = option_of_yojson (value_for_key long_of_yojson "RecordsIngested") _list path;
     query_result_rows =
       option_of_yojson (value_for_key long_of_yojson "QueryResultRows") _list path;
   }
    : execution_stats)

let scheduled_query_run_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTO_TRIGGER_SUCCESS" -> AUTO_TRIGGER_SUCCESS
    | `String "AUTO_TRIGGER_FAILURE" -> AUTO_TRIGGER_FAILURE
    | `String "MANUAL_TRIGGER_SUCCESS" -> MANUAL_TRIGGER_SUCCESS
    | `String "MANUAL_TRIGGER_FAILURE" -> MANUAL_TRIGGER_FAILURE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScheduledQueryRunStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduledQueryRunStatus")
     : scheduled_query_run_status)
    : scheduled_query_run_status)

let time_of_yojson = timestamp_epoch_seconds_of_yojson

let scheduled_query_run_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     invocation_time = option_of_yojson (value_for_key time_of_yojson "InvocationTime") _list path;
     trigger_time = option_of_yojson (value_for_key time_of_yojson "TriggerTime") _list path;
     run_status =
       option_of_yojson (value_for_key scheduled_query_run_status_of_yojson "RunStatus") _list path;
     execution_stats =
       option_of_yojson (value_for_key execution_stats_of_yojson "ExecutionStats") _list path;
     query_insights_response =
       option_of_yojson
         (value_for_key scheduled_query_insights_response_of_yojson "QueryInsightsResponse")
         _list path;
     error_report_location =
       option_of_yojson
         (value_for_key error_report_location_of_yojson "ErrorReportLocation")
         _list path;
     failure_reason =
       option_of_yojson (value_for_key error_message_of_yojson "FailureReason") _list path;
   }
    : scheduled_query_run_summary)

let scheduled_query_run_summary_list_of_yojson tree path =
  list_of_yojson scheduled_query_run_summary_of_yojson tree path

let scheduled_query_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED" -> ENABLED
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduledQueryState" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduledQueryState")
     : scheduled_query_state)
    : scheduled_query_state)

let scheduled_query_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "Arn" _list path;
     name = value_for_key scheduled_query_name_of_yojson "Name" _list path;
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     state = value_for_key scheduled_query_state_of_yojson "State" _list path;
     previous_invocation_time =
       option_of_yojson (value_for_key time_of_yojson "PreviousInvocationTime") _list path;
     next_invocation_time =
       option_of_yojson (value_for_key time_of_yojson "NextInvocationTime") _list path;
     schedule_configuration =
       value_for_key schedule_configuration_of_yojson "ScheduleConfiguration" _list path;
     notification_configuration =
       value_for_key notification_configuration_of_yojson "NotificationConfiguration" _list path;
     target_configuration =
       option_of_yojson
         (value_for_key target_configuration_of_yojson "TargetConfiguration")
         _list path;
     scheduled_query_execution_role_arn =
       option_of_yojson
         (value_for_key amazon_resource_name_of_yojson "ScheduledQueryExecutionRoleArn")
         _list path;
     kms_key_id = option_of_yojson (value_for_key string_value2048_of_yojson "KmsKeyId") _list path;
     error_report_configuration =
       option_of_yojson
         (value_for_key error_report_configuration_of_yojson "ErrorReportConfiguration")
         _list path;
     last_run_summary =
       option_of_yojson
         (value_for_key scheduled_query_run_summary_of_yojson "LastRunSummary")
         _list path;
     recently_failed_runs =
       option_of_yojson
         (value_for_key scheduled_query_run_summary_list_of_yojson "RecentlyFailedRuns")
         _list path;
   }
    : scheduled_query_description)

let describe_scheduled_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_query =
       value_for_key scheduled_query_description_of_yojson "ScheduledQuery" _list path;
   }
    : describe_scheduled_query_response)

let describe_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_query_arn =
       value_for_key amazon_resource_name_of_yojson "ScheduledQueryArn" _list path;
   }
    : describe_scheduled_query_request)

let scheduled_query_insights_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED_WITH_RATE_CONTROL" -> ENABLED_WITH_RATE_CONTROL
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ScheduledQueryInsightsMode" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduledQueryInsightsMode")
     : scheduled_query_insights_mode)
    : scheduled_query_insights_mode)

let scheduled_query_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ mode = value_for_key scheduled_query_insights_mode_of_yojson "Mode" _list path }
    : scheduled_query_insights)

let execute_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_query_arn =
       value_for_key amazon_resource_name_of_yojson "ScheduledQueryArn" _list path;
     invocation_time = value_for_key time_of_yojson "InvocationTime" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     query_insights =
       option_of_yojson
         (value_for_key scheduled_query_insights_of_yojson "QueryInsights")
         _list path;
   }
    : execute_scheduled_query_request)

let next_scheduled_queries_results_token_of_yojson = string_of_yojson

let timestream_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     database_name =
       option_of_yojson (value_for_key resource_name_of_yojson "DatabaseName") _list path;
     table_name = option_of_yojson (value_for_key resource_name_of_yojson "TableName") _list path;
   }
    : timestream_destination)

let target_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestream_destination =
       option_of_yojson
         (value_for_key timestream_destination_of_yojson "TimestreamDestination")
         _list path;
   }
    : target_destination)

let scheduled_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     arn = value_for_key amazon_resource_name_of_yojson "Arn" _list path;
     name = value_for_key scheduled_query_name_of_yojson "Name" _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     state = value_for_key scheduled_query_state_of_yojson "State" _list path;
     previous_invocation_time =
       option_of_yojson (value_for_key time_of_yojson "PreviousInvocationTime") _list path;
     next_invocation_time =
       option_of_yojson (value_for_key time_of_yojson "NextInvocationTime") _list path;
     error_report_configuration =
       option_of_yojson
         (value_for_key error_report_configuration_of_yojson "ErrorReportConfiguration")
         _list path;
     target_destination =
       option_of_yojson (value_for_key target_destination_of_yojson "TargetDestination") _list path;
     last_run_status =
       option_of_yojson
         (value_for_key scheduled_query_run_status_of_yojson "LastRunStatus")
         _list path;
   }
    : scheduled_query)

let scheduled_query_list_of_yojson tree path = list_of_yojson scheduled_query_of_yojson tree path

let list_scheduled_queries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_queries = value_for_key scheduled_query_list_of_yojson "ScheduledQueries" _list path;
     next_token =
       option_of_yojson
         (value_for_key next_scheduled_queries_results_token_of_yojson "NextToken")
         _list path;
   }
    : list_scheduled_queries_response)

let max_scheduled_queries_results_of_yojson = int_of_yojson

let list_scheduled_queries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key max_scheduled_queries_results_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key next_scheduled_queries_results_token_of_yojson "NextToken")
         _list path;
   }
    : list_scheduled_queries_request)

let next_tags_for_resource_results_token_of_yojson = string_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     next_token =
       option_of_yojson
         (value_for_key next_tags_for_resource_results_token_of_yojson "NextToken")
         _list path;
   }
    : list_tags_for_resource_response)

let max_tags_for_resource_result_of_yojson = int_of_yojson

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     max_results =
       option_of_yojson
         (value_for_key max_tags_for_resource_result_of_yojson "MaxResults")
         _list path;
     next_token =
       option_of_yojson
         (value_for_key next_tags_for_resource_results_token_of_yojson "NextToken")
         _list path;
   }
    : list_tags_for_resource_request)

let max_query_results_of_yojson = int_of_yojson
let pagination_token_of_yojson = string_of_yojson

let parameter_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key string__of_yojson "Name" _list path;
     type_ = value_for_key type__of_yojson "Type" _list path;
   }
    : parameter_mapping)

let parameter_mapping_list_of_yojson tree path =
  list_of_yojson parameter_mapping_of_yojson tree path

let select_column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string__of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key type__of_yojson "Type") _list path;
     database_name =
       option_of_yojson (value_for_key resource_name_of_yojson "DatabaseName") _list path;
     table_name = option_of_yojson (value_for_key resource_name_of_yojson "TableName") _list path;
     aliased = option_of_yojson (value_for_key nullable_boolean_of_yojson "Aliased") _list path;
   }
    : select_column)

let select_column_list_of_yojson tree path = list_of_yojson select_column_of_yojson tree path

let prepare_query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
     columns = value_for_key select_column_list_of_yojson "Columns" _list path;
     parameters = value_for_key parameter_mapping_list_of_yojson "Parameters" _list path;
   }
    : prepare_query_response)

let prepare_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
     validate_only =
       option_of_yojson (value_for_key nullable_boolean_of_yojson "ValidateOnly") _list path;
   }
    : prepare_query_request)

let provisioned_capacity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_query_tc_u = value_for_key query_tc_u_of_yojson "TargetQueryTCU" _list path;
     notification_configuration =
       option_of_yojson
         (value_for_key account_settings_notification_configuration_of_yojson
            "NotificationConfiguration")
         _list path;
   }
    : provisioned_capacity_request)

let query_execution_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : query_execution_exception)

let query_insights_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_spatial_coverage =
       option_of_yojson
         (value_for_key query_spatial_coverage_of_yojson "QuerySpatialCoverage")
         _list path;
     query_temporal_range =
       option_of_yojson
         (value_for_key query_temporal_range_of_yojson "QueryTemporalRange")
         _list path;
     query_table_count =
       option_of_yojson (value_for_key long_of_yojson "QueryTableCount") _list path;
     output_rows = option_of_yojson (value_for_key long_of_yojson "OutputRows") _list path;
     output_bytes = option_of_yojson (value_for_key long_of_yojson "OutputBytes") _list path;
     unload_partition_count =
       option_of_yojson (value_for_key long_of_yojson "UnloadPartitionCount") _list path;
     unload_written_rows =
       option_of_yojson (value_for_key long_of_yojson "UnloadWrittenRows") _list path;
     unload_written_bytes =
       option_of_yojson (value_for_key long_of_yojson "UnloadWrittenBytes") _list path;
   }
    : query_insights_response)

let query_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     progress_percentage =
       option_of_yojson (value_for_key double_of_yojson "ProgressPercentage") _list path;
     cumulative_bytes_scanned =
       option_of_yojson (value_for_key long_of_yojson "CumulativeBytesScanned") _list path;
     cumulative_bytes_metered =
       option_of_yojson (value_for_key long_of_yojson "CumulativeBytesMetered") _list path;
   }
    : query_status)

let row_list_of_yojson tree path = list_of_yojson row_of_yojson tree path

let query_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_id = value_for_key query_id_of_yojson "QueryId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     rows = value_for_key row_list_of_yojson "Rows" _list path;
     column_info = value_for_key column_info_list_of_yojson "ColumnInfo" _list path;
     query_status = option_of_yojson (value_for_key query_status_of_yojson "QueryStatus") _list path;
     query_insights_response =
       option_of_yojson
         (value_for_key query_insights_response_of_yojson "QueryInsightsResponse")
         _list path;
   }
    : query_response)

let query_insights_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENABLED_WITH_RATE_CONTROL" -> ENABLED_WITH_RATE_CONTROL
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "QueryInsightsMode" value)
    | _ -> raise (deserialize_wrong_type_error path "QueryInsightsMode")
     : query_insights_mode)
    : query_insights_mode)

let query_insights_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ mode = value_for_key query_insights_mode_of_yojson "Mode" _list path } : query_insights)

let query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_string = value_for_key query_string_of_yojson "QueryString" _list path;
     client_token =
       option_of_yojson (value_for_key client_request_token_of_yojson "ClientToken") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     max_rows = option_of_yojson (value_for_key max_query_results_of_yojson "MaxRows") _list path;
     query_insights =
       option_of_yojson (value_for_key query_insights_of_yojson "QueryInsights") _list path;
   }
    : query_request)

let query_compute_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     compute_mode = option_of_yojson (value_for_key compute_mode_of_yojson "ComputeMode") _list path;
     provisioned_capacity =
       option_of_yojson
         (value_for_key provisioned_capacity_request_of_yojson "ProvisionedCapacity")
         _list path;
   }
    : query_compute_request)

let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let update_scheduled_query_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     scheduled_query_arn =
       value_for_key amazon_resource_name_of_yojson "ScheduledQueryArn" _list path;
     state = value_for_key scheduled_query_state_of_yojson "State" _list path;
   }
    : update_scheduled_query_request)

let update_account_settings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_query_tc_u =
       option_of_yojson (value_for_key max_query_capacity_of_yojson "MaxQueryTCU") _list path;
     query_pricing_model =
       option_of_yojson (value_for_key query_pricing_model_of_yojson "QueryPricingModel") _list path;
     query_compute =
       option_of_yojson (value_for_key query_compute_response_of_yojson "QueryCompute") _list path;
   }
    : update_account_settings_response)

let update_account_settings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_query_tc_u =
       option_of_yojson (value_for_key max_query_capacity_of_yojson "MaxQueryTCU") _list path;
     query_pricing_model =
       option_of_yojson (value_for_key query_pricing_model_of_yojson "QueryPricingModel") _list path;
     query_compute =
       option_of_yojson (value_for_key query_compute_request_of_yojson "QueryCompute") _list path;
   }
    : update_account_settings_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)
