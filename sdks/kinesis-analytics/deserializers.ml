open Smaws_Lib.Json.DeserializeHelpers
open Types
let update_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let application_name_of_yojson = string_of_yojson
let application_version_id_of_yojson = long_of_yojson
let id_of_yojson = string_of_yojson
let in_app_stream_name_of_yojson = string_of_yojson
let resource_ar_n_of_yojson = string_of_yojson
let role_ar_n_of_yojson = string_of_yojson
let input_lambda_processor_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn_update =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARNUpdate")
          _list path);
     resource_arn_update =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARNUpdate") _list
          path)
   } : input_lambda_processor_update)
let input_processing_configuration_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_lambda_processor_update =
       (value_for_key input_lambda_processor_update_of_yojson
          "InputLambdaProcessorUpdate" _list path)
   } : input_processing_configuration_update)
let kinesis_streams_input_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn_update =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARNUpdate")
          _list path);
     resource_arn_update =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARNUpdate") _list
          path)
   } : kinesis_streams_input_update)
let kinesis_firehose_input_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn_update =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARNUpdate")
          _list path);
     resource_arn_update =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARNUpdate") _list
          path)
   } : kinesis_firehose_input_update)
let base_unit_of_yojson = unit_of_yojson
let record_format_type_of_yojson (tree : t) path =
  (match tree with
   | `String "CSV" -> CSV
   | `String "JSON" -> JSON
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "RecordFormatType" value)
   | _ -> raise (deserialize_wrong_type_error path "RecordFormatType") : 
  record_format_type)
let record_row_path_of_yojson = string_of_yojson
let json_mapping_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_row_path =
       (value_for_key record_row_path_of_yojson "RecordRowPath" _list path)
   } : json_mapping_parameters)
let record_row_delimiter_of_yojson = string_of_yojson
let record_column_delimiter_of_yojson = string_of_yojson
let csv_mapping_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_column_delimiter =
       (value_for_key record_column_delimiter_of_yojson
          "RecordColumnDelimiter" _list path);
     record_row_delimiter =
       (value_for_key record_row_delimiter_of_yojson "RecordRowDelimiter"
          _list path)
   } : csv_mapping_parameters)
let mapping_parameters_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     csv_mapping_parameters =
       (option_of_yojson
          (value_for_key csv_mapping_parameters_of_yojson
             "CSVMappingParameters") _list path);
     json_mapping_parameters =
       (option_of_yojson
          (value_for_key json_mapping_parameters_of_yojson
             "JSONMappingParameters") _list path)
   } : mapping_parameters)
let record_format_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mapping_parameters =
       (option_of_yojson
          (value_for_key mapping_parameters_of_yojson "MappingParameters")
          _list path);
     record_format_type =
       (value_for_key record_format_type_of_yojson "RecordFormatType" _list
          path)
   } : record_format)
let record_encoding_of_yojson = string_of_yojson
let record_column_name_of_yojson = string_of_yojson
let record_column_mapping_of_yojson = string_of_yojson
let record_column_sql_type_of_yojson = string_of_yojson
let record_column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sql_type =
       (value_for_key record_column_sql_type_of_yojson "SqlType" _list path);
     mapping =
       (option_of_yojson
          (value_for_key record_column_mapping_of_yojson "Mapping") _list
          path);
     name = (value_for_key record_column_name_of_yojson "Name" _list path)
   } : record_column)
let record_columns_of_yojson tree path =
  list_of_yojson record_column_of_yojson tree path
let input_schema_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_column_updates =
       (option_of_yojson
          (value_for_key record_columns_of_yojson "RecordColumnUpdates")
          _list path);
     record_encoding_update =
       (option_of_yojson
          (value_for_key record_encoding_of_yojson "RecordEncodingUpdate")
          _list path);
     record_format_update =
       (option_of_yojson
          (value_for_key record_format_of_yojson "RecordFormatUpdate") _list
          path)
   } : input_schema_update)
let input_parallelism_count_of_yojson = int_of_yojson
let input_parallelism_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     count_update =
       (option_of_yojson
          (value_for_key input_parallelism_count_of_yojson "CountUpdate")
          _list path)
   } : input_parallelism_update)
let input_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_parallelism_update =
       (option_of_yojson
          (value_for_key input_parallelism_update_of_yojson
             "InputParallelismUpdate") _list path);
     input_schema_update =
       (option_of_yojson
          (value_for_key input_schema_update_of_yojson "InputSchemaUpdate")
          _list path);
     kinesis_firehose_input_update =
       (option_of_yojson
          (value_for_key kinesis_firehose_input_update_of_yojson
             "KinesisFirehoseInputUpdate") _list path);
     kinesis_streams_input_update =
       (option_of_yojson
          (value_for_key kinesis_streams_input_update_of_yojson
             "KinesisStreamsInputUpdate") _list path);
     input_processing_configuration_update =
       (option_of_yojson
          (value_for_key input_processing_configuration_update_of_yojson
             "InputProcessingConfigurationUpdate") _list path);
     name_prefix_update =
       (option_of_yojson
          (value_for_key in_app_stream_name_of_yojson "NamePrefixUpdate")
          _list path);
     input_id = (value_for_key id_of_yojson "InputId" _list path)
   } : input_update)
let input_updates_of_yojson tree path =
  list_of_yojson input_update_of_yojson tree path
let application_code_of_yojson = string_of_yojson
let kinesis_streams_output_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn_update =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARNUpdate")
          _list path);
     resource_arn_update =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARNUpdate") _list
          path)
   } : kinesis_streams_output_update)
let kinesis_firehose_output_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn_update =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARNUpdate")
          _list path);
     resource_arn_update =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARNUpdate") _list
          path)
   } : kinesis_firehose_output_update)
let lambda_output_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn_update =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARNUpdate")
          _list path);
     resource_arn_update =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARNUpdate") _list
          path)
   } : lambda_output_update)
let destination_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_format_type =
       (value_for_key record_format_type_of_yojson "RecordFormatType" _list
          path)
   } : destination_schema)
let output_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_schema_update =
       (option_of_yojson
          (value_for_key destination_schema_of_yojson
             "DestinationSchemaUpdate") _list path);
     lambda_output_update =
       (option_of_yojson
          (value_for_key lambda_output_update_of_yojson "LambdaOutputUpdate")
          _list path);
     kinesis_firehose_output_update =
       (option_of_yojson
          (value_for_key kinesis_firehose_output_update_of_yojson
             "KinesisFirehoseOutputUpdate") _list path);
     kinesis_streams_output_update =
       (option_of_yojson
          (value_for_key kinesis_streams_output_update_of_yojson
             "KinesisStreamsOutputUpdate") _list path);
     name_update =
       (option_of_yojson
          (value_for_key in_app_stream_name_of_yojson "NameUpdate") _list
          path);
     output_id = (value_for_key id_of_yojson "OutputId" _list path)
   } : output_update)
let output_updates_of_yojson tree path =
  list_of_yojson output_update_of_yojson tree path
let in_app_table_name_of_yojson = string_of_yojson
let bucket_ar_n_of_yojson = string_of_yojson
let file_key_of_yojson = string_of_yojson
let s3_reference_data_source_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_role_arn_update =
       (option_of_yojson
          (value_for_key role_ar_n_of_yojson "ReferenceRoleARNUpdate") _list
          path);
     file_key_update =
       (option_of_yojson (value_for_key file_key_of_yojson "FileKeyUpdate")
          _list path);
     bucket_arn_update =
       (option_of_yojson
          (value_for_key bucket_ar_n_of_yojson "BucketARNUpdate") _list path)
   } : s3_reference_data_source_update)
let source_schema_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_columns =
       (value_for_key record_columns_of_yojson "RecordColumns" _list path);
     record_encoding =
       (option_of_yojson
          (value_for_key record_encoding_of_yojson "RecordEncoding") _list
          path);
     record_format =
       (value_for_key record_format_of_yojson "RecordFormat" _list path)
   } : source_schema)
let reference_data_source_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_schema_update =
       (option_of_yojson
          (value_for_key source_schema_of_yojson "ReferenceSchemaUpdate")
          _list path);
     s3_reference_data_source_update =
       (option_of_yojson
          (value_for_key s3_reference_data_source_update_of_yojson
             "S3ReferenceDataSourceUpdate") _list path);
     table_name_update =
       (option_of_yojson
          (value_for_key in_app_table_name_of_yojson "TableNameUpdate") _list
          path);
     reference_id = (value_for_key id_of_yojson "ReferenceId" _list path)
   } : reference_data_source_update)
let reference_data_source_updates_of_yojson tree path =
  list_of_yojson reference_data_source_update_of_yojson tree path
let log_stream_ar_n_of_yojson = string_of_yojson
let cloud_watch_logging_option_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_arn_update =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARNUpdate")
          _list path);
     log_stream_arn_update =
       (option_of_yojson
          (value_for_key log_stream_ar_n_of_yojson "LogStreamARNUpdate")
          _list path);
     cloud_watch_logging_option_id =
       (value_for_key id_of_yojson "CloudWatchLoggingOptionId" _list path)
   } : cloud_watch_logging_option_update)
let cloud_watch_logging_option_updates_of_yojson tree path =
  list_of_yojson cloud_watch_logging_option_update_of_yojson tree path
let application_update_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_logging_option_updates =
       (option_of_yojson
          (value_for_key cloud_watch_logging_option_updates_of_yojson
             "CloudWatchLoggingOptionUpdates") _list path);
     reference_data_source_updates =
       (option_of_yojson
          (value_for_key reference_data_source_updates_of_yojson
             "ReferenceDataSourceUpdates") _list path);
     output_updates =
       (option_of_yojson
          (value_for_key output_updates_of_yojson "OutputUpdates") _list path);
     application_code_update =
       (option_of_yojson
          (value_for_key application_code_of_yojson "ApplicationCodeUpdate")
          _list path);
     input_updates =
       (option_of_yojson
          (value_for_key input_updates_of_yojson "InputUpdates") _list path)
   } : application_update)
let update_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_update =
       (value_for_key application_update_of_yojson "ApplicationUpdate" _list
          path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : update_application_request)
let error_message_of_yojson = string_of_yojson
let unsupported_operation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : unsupported_operation_exception)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : resource_not_found_exception)
let resource_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : resource_in_use_exception)
let invalid_argument_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_argument_exception)
let concurrent_modification_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : concurrent_modification_exception)
let code_validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : code_validation_exception)
let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let kinesis_analytics_ar_n_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_keys_of_yojson "TagKeys" _list path);
     resource_ar_n =
       (value_for_key kinesis_analytics_ar_n_of_yojson "ResourceARN" _list
          path)
   } : untag_resource_request)
let too_many_tags_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : too_many_tags_exception)
let raw_input_record_of_yojson = string_of_yojson
let raw_input_records_of_yojson tree path =
  list_of_yojson raw_input_record_of_yojson tree path
let processed_input_record_of_yojson = string_of_yojson
let processed_input_records_of_yojson tree path =
  list_of_yojson processed_input_record_of_yojson tree path
let unable_to_detect_schema_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     processed_input_records =
       (option_of_yojson
          (value_for_key processed_input_records_of_yojson
             "ProcessedInputRecords") _list path);
     raw_input_records =
       (option_of_yojson
          (value_for_key raw_input_records_of_yojson "RawInputRecords") _list
          path);
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : unable_to_detect_schema_exception)
let timestamp__of_yojson = timestamp_epoch_seconds_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (option_of_yojson (value_for_key tag_value_of_yojson "Value") _list
          path);
     key = (value_for_key tag_key_of_yojson "Key" _list path)
   } : tag)
let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tags_of_yojson "Tags" _list path);
     resource_ar_n =
       (value_for_key kinesis_analytics_ar_n_of_yojson "ResourceARN" _list
          path)
   } : tag_resource_request)
let stop_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let stop_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : stop_application_request)
let start_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let input_starting_position_of_yojson (tree : t) path =
  (match tree with
   | `String "LAST_STOPPED_POINT" -> LAST_STOPPED_POINT
   | `String "TRIM_HORIZON" -> TRIM_HORIZON
   | `String "NOW" -> NOW
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "InputStartingPosition"
            value)
   | _ -> raise (deserialize_wrong_type_error path "InputStartingPosition") : 
  input_starting_position)
let input_starting_position_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_starting_position =
       (option_of_yojson
          (value_for_key input_starting_position_of_yojson
             "InputStartingPosition") _list path)
   } : input_starting_position_configuration)
let input_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_starting_position_configuration =
       (value_for_key input_starting_position_configuration_of_yojson
          "InputStartingPositionConfiguration" _list path);
     id = (value_for_key id_of_yojson "Id" _list path)
   } : input_configuration)
let input_configurations_of_yojson tree path =
  list_of_yojson input_configuration_of_yojson tree path
let start_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_configurations =
       (value_for_key input_configurations_of_yojson "InputConfigurations"
          _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : start_application_request)
let invalid_application_configuration_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : invalid_application_configuration_exception)
let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : service_unavailable_exception)
let s3_reference_data_source_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_role_ar_n =
       (value_for_key role_ar_n_of_yojson "ReferenceRoleARN" _list path);
     file_key = (value_for_key file_key_of_yojson "FileKey" _list path);
     bucket_ar_n =
       (value_for_key bucket_ar_n_of_yojson "BucketARN" _list path)
   } : s3_reference_data_source_description)
let s3_reference_data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_role_ar_n =
       (value_for_key role_ar_n_of_yojson "ReferenceRoleARN" _list path);
     file_key = (value_for_key file_key_of_yojson "FileKey" _list path);
     bucket_ar_n =
       (value_for_key bucket_ar_n_of_yojson "BucketARN" _list path)
   } : s3_reference_data_source)
let s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_key = (value_for_key file_key_of_yojson "FileKey" _list path);
     bucket_ar_n =
       (value_for_key bucket_ar_n_of_yojson "BucketARN" _list path);
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path)
   } : s3_configuration)
let resource_provisioned_throughput_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : resource_provisioned_throughput_exceeded_exception)
let reference_data_source_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_schema =
       (option_of_yojson
          (value_for_key source_schema_of_yojson "ReferenceSchema") _list
          path);
     s3_reference_data_source_description =
       (value_for_key s3_reference_data_source_description_of_yojson
          "S3ReferenceDataSourceDescription" _list path);
     table_name =
       (value_for_key in_app_table_name_of_yojson "TableName" _list path);
     reference_id = (value_for_key id_of_yojson "ReferenceId" _list path)
   } : reference_data_source_description)
let reference_data_source_descriptions_of_yojson tree path =
  list_of_yojson reference_data_source_description_of_yojson tree path
let reference_data_source_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_schema =
       (value_for_key source_schema_of_yojson "ReferenceSchema" _list path);
     s3_reference_data_source =
       (option_of_yojson
          (value_for_key s3_reference_data_source_of_yojson
             "S3ReferenceDataSource") _list path);
     table_name =
       (value_for_key in_app_table_name_of_yojson "TableName" _list path)
   } : reference_data_source)
let parsed_input_record_field_of_yojson = string_of_yojson
let parsed_input_record_of_yojson tree path =
  list_of_yojson parsed_input_record_field_of_yojson tree path
let parsed_input_records_of_yojson tree path =
  list_of_yojson parsed_input_record_of_yojson tree path
let kinesis_streams_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path);
     resource_ar_n =
       (value_for_key resource_ar_n_of_yojson "ResourceARN" _list path)
   } : kinesis_streams_output)
let kinesis_firehose_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path);
     resource_ar_n =
       (value_for_key resource_ar_n_of_yojson "ResourceARN" _list path)
   } : kinesis_firehose_output)
let lambda_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path);
     resource_ar_n =
       (value_for_key resource_ar_n_of_yojson "ResourceARN" _list path)
   } : lambda_output)
let output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_schema =
       (value_for_key destination_schema_of_yojson "DestinationSchema" _list
          path);
     lambda_output =
       (option_of_yojson
          (value_for_key lambda_output_of_yojson "LambdaOutput") _list path);
     kinesis_firehose_output =
       (option_of_yojson
          (value_for_key kinesis_firehose_output_of_yojson
             "KinesisFirehoseOutput") _list path);
     kinesis_streams_output =
       (option_of_yojson
          (value_for_key kinesis_streams_output_of_yojson
             "KinesisStreamsOutput") _list path);
     name = (value_for_key in_app_stream_name_of_yojson "Name" _list path)
   } : output)
let outputs_of_yojson tree path = list_of_yojson output_of_yojson tree path
let kinesis_streams_output_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list
          path);
     resource_ar_n =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path)
   } : kinesis_streams_output_description)
let kinesis_firehose_output_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list
          path);
     resource_ar_n =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path)
   } : kinesis_firehose_output_description)
let lambda_output_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list
          path);
     resource_ar_n =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path)
   } : lambda_output_description)
let output_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     destination_schema =
       (option_of_yojson
          (value_for_key destination_schema_of_yojson "DestinationSchema")
          _list path);
     lambda_output_description =
       (option_of_yojson
          (value_for_key lambda_output_description_of_yojson
             "LambdaOutputDescription") _list path);
     kinesis_firehose_output_description =
       (option_of_yojson
          (value_for_key kinesis_firehose_output_description_of_yojson
             "KinesisFirehoseOutputDescription") _list path);
     kinesis_streams_output_description =
       (option_of_yojson
          (value_for_key kinesis_streams_output_description_of_yojson
             "KinesisStreamsOutputDescription") _list path);
     name =
       (option_of_yojson (value_for_key in_app_stream_name_of_yojson "Name")
          _list path);
     output_id =
       (option_of_yojson (value_for_key id_of_yojson "OutputId") _list path)
   } : output_description)
let output_descriptions_of_yojson tree path =
  list_of_yojson output_description_of_yojson tree path
let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path)
   } : list_tags_for_resource_response)
let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       (value_for_key kinesis_analytics_ar_n_of_yojson "ResourceARN" _list
          path)
   } : list_tags_for_resource_request)
let application_status_of_yojson (tree : t) path =
  (match tree with
   | `String "UPDATING" -> UPDATING
   | `String "RUNNING" -> RUNNING
   | `String "READY" -> READY
   | `String "STOPPING" -> STOPPING
   | `String "STARTING" -> STARTING
   | `String "DELETING" -> DELETING
   | `String value ->
       raise
         (deserialize_unknown_enum_value_error path "ApplicationStatus" value)
   | _ -> raise (deserialize_wrong_type_error path "ApplicationStatus") : 
  application_status)
let application_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_status =
       (value_for_key application_status_of_yojson "ApplicationStatus" _list
          path);
     application_ar_n =
       (value_for_key resource_ar_n_of_yojson "ApplicationARN" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : application_summary)
let application_summaries_of_yojson tree path =
  list_of_yojson application_summary_of_yojson tree path
let boolean_object_of_yojson = bool_of_yojson
let list_applications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     has_more_applications =
       (value_for_key boolean_object_of_yojson "HasMoreApplications" _list
          path);
     application_summaries =
       (value_for_key application_summaries_of_yojson "ApplicationSummaries"
          _list path)
   } : list_applications_response)
let list_applications_input_limit_of_yojson = int_of_yojson
let list_applications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exclusive_start_application_name =
       (option_of_yojson
          (value_for_key application_name_of_yojson
             "ExclusiveStartApplicationName") _list path);
     limit =
       (option_of_yojson
          (value_for_key list_applications_input_limit_of_yojson "Limit")
          _list path)
   } : list_applications_request)
let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key error_message_of_yojson "message")
          _list path)
   } : limit_exceeded_exception)
let kinesis_streams_input_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list
          path);
     resource_ar_n =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path)
   } : kinesis_streams_input_description)
let kinesis_streams_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path);
     resource_ar_n =
       (value_for_key resource_ar_n_of_yojson "ResourceARN" _list path)
   } : kinesis_streams_input)
let kinesis_firehose_input_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list
          path);
     resource_ar_n =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path)
   } : kinesis_firehose_input_description)
let kinesis_firehose_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path);
     resource_ar_n =
       (value_for_key resource_ar_n_of_yojson "ResourceARN" _list path)
   } : kinesis_firehose_input)
let discover_input_schema_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     raw_input_records =
       (option_of_yojson
          (value_for_key raw_input_records_of_yojson "RawInputRecords") _list
          path);
     processed_input_records =
       (option_of_yojson
          (value_for_key processed_input_records_of_yojson
             "ProcessedInputRecords") _list path);
     parsed_input_records =
       (option_of_yojson
          (value_for_key parsed_input_records_of_yojson "ParsedInputRecords")
          _list path);
     input_schema =
       (option_of_yojson
          (value_for_key source_schema_of_yojson "InputSchema") _list path)
   } : discover_input_schema_response)
let input_lambda_processor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path);
     resource_ar_n =
       (value_for_key resource_ar_n_of_yojson "ResourceARN" _list path)
   } : input_lambda_processor)
let input_processing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_lambda_processor =
       (value_for_key input_lambda_processor_of_yojson "InputLambdaProcessor"
          _list path)
   } : input_processing_configuration)
let discover_input_schema_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_processing_configuration =
       (option_of_yojson
          (value_for_key input_processing_configuration_of_yojson
             "InputProcessingConfiguration") _list path);
     s3_configuration =
       (option_of_yojson
          (value_for_key s3_configuration_of_yojson "S3Configuration") _list
          path);
     input_starting_position_configuration =
       (option_of_yojson
          (value_for_key input_starting_position_configuration_of_yojson
             "InputStartingPositionConfiguration") _list path);
     role_ar_n =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list
          path);
     resource_ar_n =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path)
   } : discover_input_schema_request)
let application_description_of_yojson = string_of_yojson
let in_app_stream_names_of_yojson tree path =
  list_of_yojson in_app_stream_name_of_yojson tree path
let input_lambda_processor_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n =
       (option_of_yojson (value_for_key role_ar_n_of_yojson "RoleARN") _list
          path);
     resource_ar_n =
       (option_of_yojson
          (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path)
   } : input_lambda_processor_description)
let input_processing_configuration_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_lambda_processor_description =
       (option_of_yojson
          (value_for_key input_lambda_processor_description_of_yojson
             "InputLambdaProcessorDescription") _list path)
   } : input_processing_configuration_description)
let input_parallelism_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     count =
       (option_of_yojson
          (value_for_key input_parallelism_count_of_yojson "Count") _list
          path)
   } : input_parallelism)
let input_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_starting_position_configuration =
       (option_of_yojson
          (value_for_key input_starting_position_configuration_of_yojson
             "InputStartingPositionConfiguration") _list path);
     input_parallelism =
       (option_of_yojson
          (value_for_key input_parallelism_of_yojson "InputParallelism")
          _list path);
     input_schema =
       (option_of_yojson
          (value_for_key source_schema_of_yojson "InputSchema") _list path);
     kinesis_firehose_input_description =
       (option_of_yojson
          (value_for_key kinesis_firehose_input_description_of_yojson
             "KinesisFirehoseInputDescription") _list path);
     kinesis_streams_input_description =
       (option_of_yojson
          (value_for_key kinesis_streams_input_description_of_yojson
             "KinesisStreamsInputDescription") _list path);
     input_processing_configuration_description =
       (option_of_yojson
          (value_for_key input_processing_configuration_description_of_yojson
             "InputProcessingConfigurationDescription") _list path);
     in_app_stream_names =
       (option_of_yojson
          (value_for_key in_app_stream_names_of_yojson "InAppStreamNames")
          _list path);
     name_prefix =
       (option_of_yojson
          (value_for_key in_app_stream_name_of_yojson "NamePrefix") _list
          path);
     input_id =
       (option_of_yojson (value_for_key id_of_yojson "InputId") _list path)
   } : input_description)
let input_descriptions_of_yojson tree path =
  list_of_yojson input_description_of_yojson tree path
let cloud_watch_logging_option_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path);
     log_stream_ar_n =
       (value_for_key log_stream_ar_n_of_yojson "LogStreamARN" _list path);
     cloud_watch_logging_option_id =
       (option_of_yojson
          (value_for_key id_of_yojson "CloudWatchLoggingOptionId") _list path)
   } : cloud_watch_logging_option_description)
let cloud_watch_logging_option_descriptions_of_yojson tree path =
  list_of_yojson cloud_watch_logging_option_description_of_yojson tree path
let application_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_version_id =
       (value_for_key application_version_id_of_yojson "ApplicationVersionId"
          _list path);
     application_code =
       (option_of_yojson
          (value_for_key application_code_of_yojson "ApplicationCode") _list
          path);
     cloud_watch_logging_option_descriptions =
       (option_of_yojson
          (value_for_key cloud_watch_logging_option_descriptions_of_yojson
             "CloudWatchLoggingOptionDescriptions") _list path);
     reference_data_source_descriptions =
       (option_of_yojson
          (value_for_key reference_data_source_descriptions_of_yojson
             "ReferenceDataSourceDescriptions") _list path);
     output_descriptions =
       (option_of_yojson
          (value_for_key output_descriptions_of_yojson "OutputDescriptions")
          _list path);
     input_descriptions =
       (option_of_yojson
          (value_for_key input_descriptions_of_yojson "InputDescriptions")
          _list path);
     last_update_timestamp =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "LastUpdateTimestamp") _list
          path);
     create_timestamp =
       (option_of_yojson
          (value_for_key timestamp__of_yojson "CreateTimestamp") _list path);
     application_status =
       (value_for_key application_status_of_yojson "ApplicationStatus" _list
          path);
     application_ar_n =
       (value_for_key resource_ar_n_of_yojson "ApplicationARN" _list path);
     application_description =
       (option_of_yojson
          (value_for_key application_description_of_yojson
             "ApplicationDescription") _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : application_detail)
let describe_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_detail =
       (value_for_key application_detail_of_yojson "ApplicationDetail" _list
          path)
   } : describe_application_response)
let describe_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : describe_application_request)
let delete_application_reference_data_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_application_reference_data_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_id = (value_for_key id_of_yojson "ReferenceId" _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : delete_application_reference_data_source_request)
let delete_application_output_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_application_output_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_id = (value_for_key id_of_yojson "OutputId" _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : delete_application_output_request)
let delete_application_input_processing_configuration_response_of_yojson tree
  path = let _list = assoc_of_yojson tree path in (() : unit)
let delete_application_input_processing_configuration_request_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     input_id = (value_for_key id_of_yojson "InputId" _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : delete_application_input_processing_configuration_request)
let delete_application_cloud_watch_logging_option_response_of_yojson tree
  path = let _list = assoc_of_yojson tree path in (() : unit)
let delete_application_cloud_watch_logging_option_request_of_yojson tree path
  =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_logging_option_id =
       (value_for_key id_of_yojson "CloudWatchLoggingOptionId" _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : delete_application_cloud_watch_logging_option_request)
let delete_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let delete_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_timestamp =
       (value_for_key timestamp__of_yojson "CreateTimestamp" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : delete_application_request)
let create_application_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     application_summary =
       (value_for_key application_summary_of_yojson "ApplicationSummary"
          _list path)
   } : create_application_response)
let input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input_schema =
       (value_for_key source_schema_of_yojson "InputSchema" _list path);
     input_parallelism =
       (option_of_yojson
          (value_for_key input_parallelism_of_yojson "InputParallelism")
          _list path);
     kinesis_firehose_input =
       (option_of_yojson
          (value_for_key kinesis_firehose_input_of_yojson
             "KinesisFirehoseInput") _list path);
     kinesis_streams_input =
       (option_of_yojson
          (value_for_key kinesis_streams_input_of_yojson
             "KinesisStreamsInput") _list path);
     input_processing_configuration =
       (option_of_yojson
          (value_for_key input_processing_configuration_of_yojson
             "InputProcessingConfiguration") _list path);
     name_prefix =
       (value_for_key in_app_stream_name_of_yojson "NamePrefix" _list path)
   } : input)
let inputs_of_yojson tree path = list_of_yojson input_of_yojson tree path
let cloud_watch_logging_option_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     role_ar_n = (value_for_key role_ar_n_of_yojson "RoleARN" _list path);
     log_stream_ar_n =
       (value_for_key log_stream_ar_n_of_yojson "LogStreamARN" _list path)
   } : cloud_watch_logging_option)
let cloud_watch_logging_options_of_yojson tree path =
  list_of_yojson cloud_watch_logging_option_of_yojson tree path
let create_application_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path);
     application_code =
       (option_of_yojson
          (value_for_key application_code_of_yojson "ApplicationCode") _list
          path);
     cloud_watch_logging_options =
       (option_of_yojson
          (value_for_key cloud_watch_logging_options_of_yojson
             "CloudWatchLoggingOptions") _list path);
     outputs =
       (option_of_yojson (value_for_key outputs_of_yojson "Outputs") _list
          path);
     inputs =
       (option_of_yojson (value_for_key inputs_of_yojson "Inputs") _list path);
     application_description =
       (option_of_yojson
          (value_for_key application_description_of_yojson
             "ApplicationDescription") _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : create_application_request)
let add_application_reference_data_source_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let add_application_reference_data_source_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reference_data_source =
       (value_for_key reference_data_source_of_yojson "ReferenceDataSource"
          _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : add_application_reference_data_source_request)
let add_application_output_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let add_application_output_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output = (value_for_key output_of_yojson "Output" _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : add_application_output_request)
let add_application_input_processing_configuration_response_of_yojson tree
  path = let _list = assoc_of_yojson tree path in (() : unit)
let add_application_input_processing_configuration_request_of_yojson tree
  path =
  let _list = assoc_of_yojson tree path in
  ({
     input_processing_configuration =
       (value_for_key input_processing_configuration_of_yojson
          "InputProcessingConfiguration" _list path);
     input_id = (value_for_key id_of_yojson "InputId" _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : add_application_input_processing_configuration_request)
let add_application_input_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let add_application_input_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     input = (value_for_key input_of_yojson "Input" _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : add_application_input_request)
let add_application_cloud_watch_logging_option_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let add_application_cloud_watch_logging_option_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cloud_watch_logging_option =
       (value_for_key cloud_watch_logging_option_of_yojson
          "CloudWatchLoggingOption" _list path);
     current_application_version_id =
       (value_for_key application_version_id_of_yojson
          "CurrentApplicationVersionId" _list path);
     application_name =
       (value_for_key application_name_of_yojson "ApplicationName" _list path)
   } : add_application_cloud_watch_logging_option_request)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson