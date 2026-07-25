open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_argument_exception_to_yojson (x : invalid_argument_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let add_application_cloud_watch_logging_option_response_to_yojson = unit_to_yojson
let role_ar_n_to_yojson = string_to_yojson
let log_stream_ar_n_to_yojson = string_to_yojson

let cloud_watch_logging_option_to_yojson (x : cloud_watch_logging_option) =
  assoc_to_yojson
    [
      ("LogStreamARN", Some (log_stream_ar_n_to_yojson x.log_stream_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let application_version_id_to_yojson = long_to_yojson
let application_name_to_yojson = string_to_yojson

let add_application_cloud_watch_logging_option_request_to_yojson
    (x : add_application_cloud_watch_logging_option_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ( "CloudWatchLoggingOption",
        Some (cloud_watch_logging_option_to_yojson x.cloud_watch_logging_option) );
    ]

let code_validation_exception_to_yojson (x : code_validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let add_application_input_response_to_yojson = unit_to_yojson
let record_column_sql_type_to_yojson = string_to_yojson
let record_column_mapping_to_yojson = string_to_yojson
let record_column_name_to_yojson = string_to_yojson

let record_column_to_yojson (x : record_column) =
  assoc_to_yojson
    [
      ("Name", Some (record_column_name_to_yojson x.name));
      ("Mapping", option_to_yojson record_column_mapping_to_yojson x.mapping);
      ("SqlType", Some (record_column_sql_type_to_yojson x.sql_type));
    ]

let record_columns_to_yojson tree = list_to_yojson record_column_to_yojson tree
let record_encoding_to_yojson = string_to_yojson
let record_column_delimiter_to_yojson = string_to_yojson
let record_row_delimiter_to_yojson = string_to_yojson

let csv_mapping_parameters_to_yojson (x : csv_mapping_parameters) =
  assoc_to_yojson
    [
      ("RecordRowDelimiter", Some (record_row_delimiter_to_yojson x.record_row_delimiter));
      ("RecordColumnDelimiter", Some (record_column_delimiter_to_yojson x.record_column_delimiter));
    ]

let record_row_path_to_yojson = string_to_yojson

let json_mapping_parameters_to_yojson (x : json_mapping_parameters) =
  assoc_to_yojson [ ("RecordRowPath", Some (record_row_path_to_yojson x.record_row_path)) ]

let mapping_parameters_to_yojson (x : mapping_parameters) =
  assoc_to_yojson
    [
      ( "JSONMappingParameters",
        option_to_yojson json_mapping_parameters_to_yojson x.json_mapping_parameters );
      ( "CSVMappingParameters",
        option_to_yojson csv_mapping_parameters_to_yojson x.csv_mapping_parameters );
    ]

let record_format_type_to_yojson (x : record_format_type) =
  match x with JSON -> `String "JSON" | CSV -> `String "CSV"

let record_format_to_yojson (x : record_format) =
  assoc_to_yojson
    [
      ("RecordFormatType", Some (record_format_type_to_yojson x.record_format_type));
      ("MappingParameters", option_to_yojson mapping_parameters_to_yojson x.mapping_parameters);
    ]

let source_schema_to_yojson (x : source_schema) =
  assoc_to_yojson
    [
      ("RecordFormat", Some (record_format_to_yojson x.record_format));
      ("RecordEncoding", option_to_yojson record_encoding_to_yojson x.record_encoding);
      ("RecordColumns", Some (record_columns_to_yojson x.record_columns));
    ]

let input_parallelism_count_to_yojson = int_to_yojson

let input_parallelism_to_yojson (x : input_parallelism) =
  assoc_to_yojson [ ("Count", option_to_yojson input_parallelism_count_to_yojson x.count) ]

let resource_ar_n_to_yojson = string_to_yojson

let kinesis_firehose_input_to_yojson (x : kinesis_firehose_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let kinesis_streams_input_to_yojson (x : kinesis_streams_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let input_lambda_processor_to_yojson (x : input_lambda_processor) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let input_processing_configuration_to_yojson (x : input_processing_configuration) =
  assoc_to_yojson
    [ ("InputLambdaProcessor", Some (input_lambda_processor_to_yojson x.input_lambda_processor)) ]

let in_app_stream_name_to_yojson = string_to_yojson

let input_to_yojson (x : input) =
  assoc_to_yojson
    [
      ("NamePrefix", Some (in_app_stream_name_to_yojson x.name_prefix));
      ( "InputProcessingConfiguration",
        option_to_yojson input_processing_configuration_to_yojson x.input_processing_configuration
      );
      ( "KinesisStreamsInput",
        option_to_yojson kinesis_streams_input_to_yojson x.kinesis_streams_input );
      ( "KinesisFirehoseInput",
        option_to_yojson kinesis_firehose_input_to_yojson x.kinesis_firehose_input );
      ("InputParallelism", option_to_yojson input_parallelism_to_yojson x.input_parallelism);
      ("InputSchema", Some (source_schema_to_yojson x.input_schema));
    ]

let add_application_input_request_to_yojson (x : add_application_input_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("Input", Some (input_to_yojson x.input));
    ]

let add_application_input_processing_configuration_response_to_yojson = unit_to_yojson
let id_to_yojson = string_to_yojson

let add_application_input_processing_configuration_request_to_yojson
    (x : add_application_input_processing_configuration_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("InputId", Some (id_to_yojson x.input_id));
      ( "InputProcessingConfiguration",
        Some (input_processing_configuration_to_yojson x.input_processing_configuration) );
    ]

let add_application_output_response_to_yojson = unit_to_yojson

let destination_schema_to_yojson (x : destination_schema) =
  assoc_to_yojson [ ("RecordFormatType", Some (record_format_type_to_yojson x.record_format_type)) ]

let lambda_output_to_yojson (x : lambda_output) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let kinesis_firehose_output_to_yojson (x : kinesis_firehose_output) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let kinesis_streams_output_to_yojson (x : kinesis_streams_output) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let output_to_yojson (x : output) =
  assoc_to_yojson
    [
      ("Name", Some (in_app_stream_name_to_yojson x.name));
      ( "KinesisStreamsOutput",
        option_to_yojson kinesis_streams_output_to_yojson x.kinesis_streams_output );
      ( "KinesisFirehoseOutput",
        option_to_yojson kinesis_firehose_output_to_yojson x.kinesis_firehose_output );
      ("LambdaOutput", option_to_yojson lambda_output_to_yojson x.lambda_output);
      ("DestinationSchema", Some (destination_schema_to_yojson x.destination_schema));
    ]

let add_application_output_request_to_yojson (x : add_application_output_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("Output", Some (output_to_yojson x.output));
    ]

let add_application_reference_data_source_response_to_yojson = unit_to_yojson
let file_key_to_yojson = string_to_yojson
let bucket_ar_n_to_yojson = string_to_yojson

let s3_reference_data_source_to_yojson (x : s3_reference_data_source) =
  assoc_to_yojson
    [
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("FileKey", Some (file_key_to_yojson x.file_key));
      ("ReferenceRoleARN", Some (role_ar_n_to_yojson x.reference_role_ar_n));
    ]

let in_app_table_name_to_yojson = string_to_yojson

let reference_data_source_to_yojson (x : reference_data_source) =
  assoc_to_yojson
    [
      ("TableName", Some (in_app_table_name_to_yojson x.table_name));
      ( "S3ReferenceDataSource",
        option_to_yojson s3_reference_data_source_to_yojson x.s3_reference_data_source );
      ("ReferenceSchema", Some (source_schema_to_yojson x.reference_schema));
    ]

let add_application_reference_data_source_request_to_yojson
    (x : add_application_reference_data_source_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("ReferenceDataSource", Some (reference_data_source_to_yojson x.reference_data_source));
    ]

let application_code_to_yojson = string_to_yojson
let application_description_to_yojson = string_to_yojson

let cloud_watch_logging_option_description_to_yojson (x : cloud_watch_logging_option_description) =
  assoc_to_yojson
    [
      ("CloudWatchLoggingOptionId", option_to_yojson id_to_yojson x.cloud_watch_logging_option_id);
      ("LogStreamARN", Some (log_stream_ar_n_to_yojson x.log_stream_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let cloud_watch_logging_option_descriptions_to_yojson tree =
  list_to_yojson cloud_watch_logging_option_description_to_yojson tree

let s3_reference_data_source_description_to_yojson (x : s3_reference_data_source_description) =
  assoc_to_yojson
    [
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("FileKey", Some (file_key_to_yojson x.file_key));
      ("ReferenceRoleARN", Some (role_ar_n_to_yojson x.reference_role_ar_n));
    ]

let reference_data_source_description_to_yojson (x : reference_data_source_description) =
  assoc_to_yojson
    [
      ("ReferenceId", Some (id_to_yojson x.reference_id));
      ("TableName", Some (in_app_table_name_to_yojson x.table_name));
      ( "S3ReferenceDataSourceDescription",
        Some (s3_reference_data_source_description_to_yojson x.s3_reference_data_source_description)
      );
      ("ReferenceSchema", option_to_yojson source_schema_to_yojson x.reference_schema);
    ]

let reference_data_source_descriptions_to_yojson tree =
  list_to_yojson reference_data_source_description_to_yojson tree

let lambda_output_description_to_yojson (x : lambda_output_description) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let kinesis_firehose_output_description_to_yojson (x : kinesis_firehose_output_description) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let kinesis_streams_output_description_to_yojson (x : kinesis_streams_output_description) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let output_description_to_yojson (x : output_description) =
  assoc_to_yojson
    [
      ("OutputId", option_to_yojson id_to_yojson x.output_id);
      ("Name", option_to_yojson in_app_stream_name_to_yojson x.name);
      ( "KinesisStreamsOutputDescription",
        option_to_yojson kinesis_streams_output_description_to_yojson
          x.kinesis_streams_output_description );
      ( "KinesisFirehoseOutputDescription",
        option_to_yojson kinesis_firehose_output_description_to_yojson
          x.kinesis_firehose_output_description );
      ( "LambdaOutputDescription",
        option_to_yojson lambda_output_description_to_yojson x.lambda_output_description );
      ("DestinationSchema", option_to_yojson destination_schema_to_yojson x.destination_schema);
    ]

let output_descriptions_to_yojson tree = list_to_yojson output_description_to_yojson tree

let input_starting_position_to_yojson (x : input_starting_position) =
  match x with
  | NOW -> `String "NOW"
  | TRIM_HORIZON -> `String "TRIM_HORIZON"
  | LAST_STOPPED_POINT -> `String "LAST_STOPPED_POINT"

let input_starting_position_configuration_to_yojson (x : input_starting_position_configuration) =
  assoc_to_yojson
    [
      ( "InputStartingPosition",
        option_to_yojson input_starting_position_to_yojson x.input_starting_position );
    ]

let kinesis_firehose_input_description_to_yojson (x : kinesis_firehose_input_description) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let kinesis_streams_input_description_to_yojson (x : kinesis_streams_input_description) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let input_lambda_processor_description_to_yojson (x : input_lambda_processor_description) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let input_processing_configuration_description_to_yojson
    (x : input_processing_configuration_description) =
  assoc_to_yojson
    [
      ( "InputLambdaProcessorDescription",
        option_to_yojson input_lambda_processor_description_to_yojson
          x.input_lambda_processor_description );
    ]

let in_app_stream_names_to_yojson tree = list_to_yojson in_app_stream_name_to_yojson tree

let input_description_to_yojson (x : input_description) =
  assoc_to_yojson
    [
      ("InputId", option_to_yojson id_to_yojson x.input_id);
      ("NamePrefix", option_to_yojson in_app_stream_name_to_yojson x.name_prefix);
      ("InAppStreamNames", option_to_yojson in_app_stream_names_to_yojson x.in_app_stream_names);
      ( "InputProcessingConfigurationDescription",
        option_to_yojson input_processing_configuration_description_to_yojson
          x.input_processing_configuration_description );
      ( "KinesisStreamsInputDescription",
        option_to_yojson kinesis_streams_input_description_to_yojson
          x.kinesis_streams_input_description );
      ( "KinesisFirehoseInputDescription",
        option_to_yojson kinesis_firehose_input_description_to_yojson
          x.kinesis_firehose_input_description );
      ("InputSchema", option_to_yojson source_schema_to_yojson x.input_schema);
      ("InputParallelism", option_to_yojson input_parallelism_to_yojson x.input_parallelism);
      ( "InputStartingPositionConfiguration",
        option_to_yojson input_starting_position_configuration_to_yojson
          x.input_starting_position_configuration );
    ]

let input_descriptions_to_yojson tree = list_to_yojson input_description_to_yojson tree
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let application_status_to_yojson (x : application_status) =
  match x with
  | DELETING -> `String "DELETING"
  | STARTING -> `String "STARTING"
  | STOPPING -> `String "STOPPING"
  | READY -> `String "READY"
  | RUNNING -> `String "RUNNING"
  | UPDATING -> `String "UPDATING"

let application_detail_to_yojson (x : application_detail) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "ApplicationDescription",
        option_to_yojson application_description_to_yojson x.application_description );
      ("ApplicationARN", Some (resource_ar_n_to_yojson x.application_ar_n));
      ("ApplicationStatus", Some (application_status_to_yojson x.application_status));
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("LastUpdateTimestamp", option_to_yojson timestamp_to_yojson x.last_update_timestamp);
      ("InputDescriptions", option_to_yojson input_descriptions_to_yojson x.input_descriptions);
      ("OutputDescriptions", option_to_yojson output_descriptions_to_yojson x.output_descriptions);
      ( "ReferenceDataSourceDescriptions",
        option_to_yojson reference_data_source_descriptions_to_yojson
          x.reference_data_source_descriptions );
      ( "CloudWatchLoggingOptionDescriptions",
        option_to_yojson cloud_watch_logging_option_descriptions_to_yojson
          x.cloud_watch_logging_option_descriptions );
      ("ApplicationCode", option_to_yojson application_code_to_yojson x.application_code);
      ("ApplicationVersionId", Some (application_version_id_to_yojson x.application_version_id));
    ]

let application_summary_to_yojson (x : application_summary) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("ApplicationARN", Some (resource_ar_n_to_yojson x.application_ar_n));
      ("ApplicationStatus", Some (application_status_to_yojson x.application_status));
    ]

let application_summaries_to_yojson tree = list_to_yojson application_summary_to_yojson tree

let cloud_watch_logging_option_update_to_yojson (x : cloud_watch_logging_option_update) =
  assoc_to_yojson
    [
      ("CloudWatchLoggingOptionId", Some (id_to_yojson x.cloud_watch_logging_option_id));
      ("LogStreamARNUpdate", option_to_yojson log_stream_ar_n_to_yojson x.log_stream_arn_update);
      ("RoleARNUpdate", option_to_yojson role_ar_n_to_yojson x.role_arn_update);
    ]

let cloud_watch_logging_option_updates_to_yojson tree =
  list_to_yojson cloud_watch_logging_option_update_to_yojson tree

let s3_reference_data_source_update_to_yojson (x : s3_reference_data_source_update) =
  assoc_to_yojson
    [
      ("BucketARNUpdate", option_to_yojson bucket_ar_n_to_yojson x.bucket_arn_update);
      ("FileKeyUpdate", option_to_yojson file_key_to_yojson x.file_key_update);
      ("ReferenceRoleARNUpdate", option_to_yojson role_ar_n_to_yojson x.reference_role_arn_update);
    ]

let reference_data_source_update_to_yojson (x : reference_data_source_update) =
  assoc_to_yojson
    [
      ("ReferenceId", Some (id_to_yojson x.reference_id));
      ("TableNameUpdate", option_to_yojson in_app_table_name_to_yojson x.table_name_update);
      ( "S3ReferenceDataSourceUpdate",
        option_to_yojson s3_reference_data_source_update_to_yojson x.s3_reference_data_source_update
      );
      ("ReferenceSchemaUpdate", option_to_yojson source_schema_to_yojson x.reference_schema_update);
    ]

let reference_data_source_updates_to_yojson tree =
  list_to_yojson reference_data_source_update_to_yojson tree

let lambda_output_update_to_yojson (x : lambda_output_update) =
  assoc_to_yojson
    [
      ("ResourceARNUpdate", option_to_yojson resource_ar_n_to_yojson x.resource_arn_update);
      ("RoleARNUpdate", option_to_yojson role_ar_n_to_yojson x.role_arn_update);
    ]

let kinesis_firehose_output_update_to_yojson (x : kinesis_firehose_output_update) =
  assoc_to_yojson
    [
      ("ResourceARNUpdate", option_to_yojson resource_ar_n_to_yojson x.resource_arn_update);
      ("RoleARNUpdate", option_to_yojson role_ar_n_to_yojson x.role_arn_update);
    ]

let kinesis_streams_output_update_to_yojson (x : kinesis_streams_output_update) =
  assoc_to_yojson
    [
      ("ResourceARNUpdate", option_to_yojson resource_ar_n_to_yojson x.resource_arn_update);
      ("RoleARNUpdate", option_to_yojson role_ar_n_to_yojson x.role_arn_update);
    ]

let output_update_to_yojson (x : output_update) =
  assoc_to_yojson
    [
      ("OutputId", Some (id_to_yojson x.output_id));
      ("NameUpdate", option_to_yojson in_app_stream_name_to_yojson x.name_update);
      ( "KinesisStreamsOutputUpdate",
        option_to_yojson kinesis_streams_output_update_to_yojson x.kinesis_streams_output_update );
      ( "KinesisFirehoseOutputUpdate",
        option_to_yojson kinesis_firehose_output_update_to_yojson x.kinesis_firehose_output_update
      );
      ("LambdaOutputUpdate", option_to_yojson lambda_output_update_to_yojson x.lambda_output_update);
      ( "DestinationSchemaUpdate",
        option_to_yojson destination_schema_to_yojson x.destination_schema_update );
    ]

let output_updates_to_yojson tree = list_to_yojson output_update_to_yojson tree

let input_parallelism_update_to_yojson (x : input_parallelism_update) =
  assoc_to_yojson
    [ ("CountUpdate", option_to_yojson input_parallelism_count_to_yojson x.count_update) ]

let input_schema_update_to_yojson (x : input_schema_update) =
  assoc_to_yojson
    [
      ("RecordFormatUpdate", option_to_yojson record_format_to_yojson x.record_format_update);
      ("RecordEncodingUpdate", option_to_yojson record_encoding_to_yojson x.record_encoding_update);
      ("RecordColumnUpdates", option_to_yojson record_columns_to_yojson x.record_column_updates);
    ]

let kinesis_firehose_input_update_to_yojson (x : kinesis_firehose_input_update) =
  assoc_to_yojson
    [
      ("ResourceARNUpdate", option_to_yojson resource_ar_n_to_yojson x.resource_arn_update);
      ("RoleARNUpdate", option_to_yojson role_ar_n_to_yojson x.role_arn_update);
    ]

let kinesis_streams_input_update_to_yojson (x : kinesis_streams_input_update) =
  assoc_to_yojson
    [
      ("ResourceARNUpdate", option_to_yojson resource_ar_n_to_yojson x.resource_arn_update);
      ("RoleARNUpdate", option_to_yojson role_ar_n_to_yojson x.role_arn_update);
    ]

let input_lambda_processor_update_to_yojson (x : input_lambda_processor_update) =
  assoc_to_yojson
    [
      ("ResourceARNUpdate", option_to_yojson resource_ar_n_to_yojson x.resource_arn_update);
      ("RoleARNUpdate", option_to_yojson role_ar_n_to_yojson x.role_arn_update);
    ]

let input_processing_configuration_update_to_yojson (x : input_processing_configuration_update) =
  assoc_to_yojson
    [
      ( "InputLambdaProcessorUpdate",
        Some (input_lambda_processor_update_to_yojson x.input_lambda_processor_update) );
    ]

let input_update_to_yojson (x : input_update) =
  assoc_to_yojson
    [
      ("InputId", Some (id_to_yojson x.input_id));
      ("NamePrefixUpdate", option_to_yojson in_app_stream_name_to_yojson x.name_prefix_update);
      ( "InputProcessingConfigurationUpdate",
        option_to_yojson input_processing_configuration_update_to_yojson
          x.input_processing_configuration_update );
      ( "KinesisStreamsInputUpdate",
        option_to_yojson kinesis_streams_input_update_to_yojson x.kinesis_streams_input_update );
      ( "KinesisFirehoseInputUpdate",
        option_to_yojson kinesis_firehose_input_update_to_yojson x.kinesis_firehose_input_update );
      ("InputSchemaUpdate", option_to_yojson input_schema_update_to_yojson x.input_schema_update);
      ( "InputParallelismUpdate",
        option_to_yojson input_parallelism_update_to_yojson x.input_parallelism_update );
    ]

let input_updates_to_yojson tree = list_to_yojson input_update_to_yojson tree

let application_update_to_yojson (x : application_update) =
  assoc_to_yojson
    [
      ("InputUpdates", option_to_yojson input_updates_to_yojson x.input_updates);
      ( "ApplicationCodeUpdate",
        option_to_yojson application_code_to_yojson x.application_code_update );
      ("OutputUpdates", option_to_yojson output_updates_to_yojson x.output_updates);
      ( "ReferenceDataSourceUpdates",
        option_to_yojson reference_data_source_updates_to_yojson x.reference_data_source_updates );
      ( "CloudWatchLoggingOptionUpdates",
        option_to_yojson cloud_watch_logging_option_updates_to_yojson
          x.cloud_watch_logging_option_updates );
    ]

let boolean_object_to_yojson = bool_to_yojson

let cloud_watch_logging_options_to_yojson tree =
  list_to_yojson cloud_watch_logging_option_to_yojson tree

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let create_application_response_to_yojson (x : create_application_response) =
  assoc_to_yojson
    [ ("ApplicationSummary", Some (application_summary_to_yojson x.application_summary)) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let outputs_to_yojson tree = list_to_yojson output_to_yojson tree
let inputs_to_yojson tree = list_to_yojson input_to_yojson tree

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "ApplicationDescription",
        option_to_yojson application_description_to_yojson x.application_description );
      ("Inputs", option_to_yojson inputs_to_yojson x.inputs);
      ("Outputs", option_to_yojson outputs_to_yojson x.outputs);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("ApplicationCode", option_to_yojson application_code_to_yojson x.application_code);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let delete_application_response_to_yojson = unit_to_yojson

let delete_application_request_to_yojson (x : delete_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("CreateTimestamp", Some (timestamp_to_yojson x.create_timestamp));
    ]

let delete_application_cloud_watch_logging_option_response_to_yojson = unit_to_yojson

let delete_application_cloud_watch_logging_option_request_to_yojson
    (x : delete_application_cloud_watch_logging_option_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("CloudWatchLoggingOptionId", Some (id_to_yojson x.cloud_watch_logging_option_id));
    ]

let delete_application_input_processing_configuration_response_to_yojson = unit_to_yojson

let delete_application_input_processing_configuration_request_to_yojson
    (x : delete_application_input_processing_configuration_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("InputId", Some (id_to_yojson x.input_id));
    ]

let delete_application_output_response_to_yojson = unit_to_yojson

let delete_application_output_request_to_yojson (x : delete_application_output_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("OutputId", Some (id_to_yojson x.output_id));
    ]

let delete_application_reference_data_source_response_to_yojson = unit_to_yojson

let delete_application_reference_data_source_request_to_yojson
    (x : delete_application_reference_data_source_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("ReferenceId", Some (id_to_yojson x.reference_id));
    ]

let describe_application_response_to_yojson (x : describe_application_response) =
  assoc_to_yojson
    [ ("ApplicationDetail", Some (application_detail_to_yojson x.application_detail)) ]

let describe_application_request_to_yojson (x : describe_application_request) =
  assoc_to_yojson [ ("ApplicationName", Some (application_name_to_yojson x.application_name)) ]

let processed_input_record_to_yojson = string_to_yojson
let processed_input_records_to_yojson tree = list_to_yojson processed_input_record_to_yojson tree
let raw_input_record_to_yojson = string_to_yojson
let raw_input_records_to_yojson tree = list_to_yojson raw_input_record_to_yojson tree

let unable_to_detect_schema_exception_to_yojson (x : unable_to_detect_schema_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("RawInputRecords", option_to_yojson raw_input_records_to_yojson x.raw_input_records);
      ( "ProcessedInputRecords",
        option_to_yojson processed_input_records_to_yojson x.processed_input_records );
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_provisioned_throughput_exceeded_exception_to_yojson
    (x : resource_provisioned_throughput_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let parsed_input_record_field_to_yojson = string_to_yojson
let parsed_input_record_to_yojson tree = list_to_yojson parsed_input_record_field_to_yojson tree
let parsed_input_records_to_yojson tree = list_to_yojson parsed_input_record_to_yojson tree

let discover_input_schema_response_to_yojson (x : discover_input_schema_response) =
  assoc_to_yojson
    [
      ("InputSchema", option_to_yojson source_schema_to_yojson x.input_schema);
      ("ParsedInputRecords", option_to_yojson parsed_input_records_to_yojson x.parsed_input_records);
      ( "ProcessedInputRecords",
        option_to_yojson processed_input_records_to_yojson x.processed_input_records );
      ("RawInputRecords", option_to_yojson raw_input_records_to_yojson x.raw_input_records);
    ]

let s3_configuration_to_yojson (x : s3_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("FileKey", Some (file_key_to_yojson x.file_key));
    ]

let discover_input_schema_request_to_yojson (x : discover_input_schema_request) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "InputStartingPositionConfiguration",
        option_to_yojson input_starting_position_configuration_to_yojson
          x.input_starting_position_configuration );
      ("S3Configuration", option_to_yojson s3_configuration_to_yojson x.s3_configuration);
      ( "InputProcessingConfiguration",
        option_to_yojson input_processing_configuration_to_yojson x.input_processing_configuration
      );
    ]

let input_configuration_to_yojson (x : input_configuration) =
  assoc_to_yojson
    [
      ("Id", Some (id_to_yojson x.id));
      ( "InputStartingPositionConfiguration",
        Some
          (input_starting_position_configuration_to_yojson x.input_starting_position_configuration)
      );
    ]

let input_configurations_to_yojson tree = list_to_yojson input_configuration_to_yojson tree

let invalid_application_configuration_exception_to_yojson
    (x : invalid_application_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let kinesis_analytics_ar_n_to_yojson = string_to_yojson
let update_application_response_to_yojson = unit_to_yojson

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("ApplicationUpdate", Some (application_update_to_yojson x.application_update));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (kinesis_analytics_ar_n_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (kinesis_analytics_ar_n_to_yojson x.resource_ar_n));
      ("Tags", Some (tags_to_yojson x.tags));
    ]

let stop_application_response_to_yojson = unit_to_yojson

let stop_application_request_to_yojson (x : stop_application_request) =
  assoc_to_yojson [ ("ApplicationName", Some (application_name_to_yojson x.application_name)) ]

let start_application_response_to_yojson = unit_to_yojson

let start_application_request_to_yojson (x : start_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("InputConfigurations", Some (input_configurations_to_yojson x.input_configurations));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (kinesis_analytics_ar_n_to_yojson x.resource_ar_n)) ]

let list_applications_response_to_yojson (x : list_applications_response) =
  assoc_to_yojson
    [
      ("ApplicationSummaries", Some (application_summaries_to_yojson x.application_summaries));
      ("HasMoreApplications", Some (boolean_object_to_yojson x.has_more_applications));
    ]

let list_applications_input_limit_to_yojson = int_to_yojson

let list_applications_request_to_yojson (x : list_applications_request) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson list_applications_input_limit_to_yojson x.limit);
      ( "ExclusiveStartApplicationName",
        option_to_yojson application_name_to_yojson x.exclusive_start_application_name );
    ]
