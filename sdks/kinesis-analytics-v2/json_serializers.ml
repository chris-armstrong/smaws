open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_argument_exception_to_yojson (x : invalid_argument_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_application_configuration_exception_to_yojson
    (x : invalid_application_configuration_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let operation_id_to_yojson = string_to_yojson
let role_ar_n_to_yojson = string_to_yojson
let log_stream_ar_n_to_yojson = string_to_yojson
let id_to_yojson = string_to_yojson

let cloud_watch_logging_option_description_to_yojson (x : cloud_watch_logging_option_description) =
  assoc_to_yojson
    [
      ("CloudWatchLoggingOptionId", option_to_yojson id_to_yojson x.cloud_watch_logging_option_id);
      ("LogStreamARN", Some (log_stream_ar_n_to_yojson x.log_stream_ar_n));
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let cloud_watch_logging_option_descriptions_to_yojson tree =
  list_to_yojson cloud_watch_logging_option_description_to_yojson tree

let application_version_id_to_yojson = long_to_yojson
let resource_ar_n_to_yojson = string_to_yojson

let add_application_cloud_watch_logging_option_response_to_yojson
    (x : add_application_cloud_watch_logging_option_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
      ( "CloudWatchLoggingOptionDescriptions",
        option_to_yojson cloud_watch_logging_option_descriptions_to_yojson
          x.cloud_watch_logging_option_descriptions );
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let conditional_token_to_yojson = string_to_yojson

let cloud_watch_logging_option_to_yojson (x : cloud_watch_logging_option) =
  assoc_to_yojson [ ("LogStreamARN", Some (log_stream_ar_n_to_yojson x.log_stream_ar_n)) ]

let application_name_to_yojson = string_to_yojson

let add_application_cloud_watch_logging_option_request_to_yojson
    (x : add_application_cloud_watch_logging_option_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.current_application_version_id );
      ( "CloudWatchLoggingOption",
        Some (cloud_watch_logging_option_to_yojson x.cloud_watch_logging_option) );
      ("ConditionalToken", option_to_yojson conditional_token_to_yojson x.conditional_token);
    ]

let code_validation_exception_to_yojson (x : code_validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

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

let input_parallelism_count_to_yojson = int_to_yojson

let input_parallelism_to_yojson (x : input_parallelism) =
  assoc_to_yojson [ ("Count", option_to_yojson input_parallelism_count_to_yojson x.count) ]

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

let kinesis_firehose_input_description_to_yojson (x : kinesis_firehose_input_description) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let kinesis_streams_input_description_to_yojson (x : kinesis_streams_input_description) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let input_lambda_processor_description_to_yojson (x : input_lambda_processor_description) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
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

let in_app_stream_name_to_yojson = string_to_yojson
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

let add_application_input_response_to_yojson (x : add_application_input_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
      ("InputDescriptions", option_to_yojson input_descriptions_to_yojson x.input_descriptions);
    ]

let kinesis_firehose_input_to_yojson (x : kinesis_firehose_input) =
  assoc_to_yojson [ ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n)) ]

let kinesis_streams_input_to_yojson (x : kinesis_streams_input) =
  assoc_to_yojson [ ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n)) ]

let input_lambda_processor_to_yojson (x : input_lambda_processor) =
  assoc_to_yojson [ ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n)) ]

let input_processing_configuration_to_yojson (x : input_processing_configuration) =
  assoc_to_yojson
    [ ("InputLambdaProcessor", Some (input_lambda_processor_to_yojson x.input_lambda_processor)) ]

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

let add_application_input_processing_configuration_response_to_yojson
    (x : add_application_input_processing_configuration_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
      ("InputId", option_to_yojson id_to_yojson x.input_id);
      ( "InputProcessingConfigurationDescription",
        option_to_yojson input_processing_configuration_description_to_yojson
          x.input_processing_configuration_description );
    ]

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

let destination_schema_to_yojson (x : destination_schema) =
  assoc_to_yojson [ ("RecordFormatType", Some (record_format_type_to_yojson x.record_format_type)) ]

let lambda_output_description_to_yojson (x : lambda_output_description) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let kinesis_firehose_output_description_to_yojson (x : kinesis_firehose_output_description) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let kinesis_streams_output_description_to_yojson (x : kinesis_streams_output_description) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
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

let add_application_output_response_to_yojson (x : add_application_output_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
      ("OutputDescriptions", option_to_yojson output_descriptions_to_yojson x.output_descriptions);
    ]

let lambda_output_to_yojson (x : lambda_output) =
  assoc_to_yojson [ ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n)) ]

let kinesis_firehose_output_to_yojson (x : kinesis_firehose_output) =
  assoc_to_yojson [ ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n)) ]

let kinesis_streams_output_to_yojson (x : kinesis_streams_output) =
  assoc_to_yojson [ ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n)) ]

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

let file_key_to_yojson = string_to_yojson
let bucket_ar_n_to_yojson = string_to_yojson

let s3_reference_data_source_description_to_yojson (x : s3_reference_data_source_description) =
  assoc_to_yojson
    [
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("FileKey", Some (file_key_to_yojson x.file_key));
      ("ReferenceRoleARN", option_to_yojson role_ar_n_to_yojson x.reference_role_ar_n);
    ]

let in_app_table_name_to_yojson = string_to_yojson

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

let add_application_reference_data_source_response_to_yojson
    (x : add_application_reference_data_source_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
      ( "ReferenceDataSourceDescriptions",
        option_to_yojson reference_data_source_descriptions_to_yojson
          x.reference_data_source_descriptions );
    ]

let s3_reference_data_source_to_yojson (x : s3_reference_data_source) =
  assoc_to_yojson
    [
      ("BucketARN", option_to_yojson bucket_ar_n_to_yojson x.bucket_ar_n);
      ("FileKey", option_to_yojson file_key_to_yojson x.file_key);
    ]

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

let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let subnet_id_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let vpc_id_to_yojson = string_to_yojson

let vpc_configuration_description_to_yojson (x : vpc_configuration_description) =
  assoc_to_yojson
    [
      ("VpcConfigurationId", Some (id_to_yojson x.vpc_configuration_id));
      ("VpcId", Some (vpc_id_to_yojson x.vpc_id));
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("SecurityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
    ]

let add_application_vpc_configuration_response_to_yojson
    (x : add_application_vpc_configuration_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
      ( "VpcConfigurationDescription",
        option_to_yojson vpc_configuration_description_to_yojson x.vpc_configuration_description );
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let vpc_configuration_to_yojson (x : vpc_configuration) =
  assoc_to_yojson
    [
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("SecurityGroupIds", Some (security_group_ids_to_yojson x.security_group_ids));
    ]

let add_application_vpc_configuration_request_to_yojson
    (x : add_application_vpc_configuration_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.current_application_version_id );
      ("VpcConfiguration", Some (vpc_configuration_to_yojson x.vpc_configuration));
      ("ConditionalToken", option_to_yojson conditional_token_to_yojson x.conditional_token);
    ]

let code_content_type_to_yojson (x : code_content_type) =
  match x with PLAINTEXT -> `String "PLAINTEXT" | ZIPFILE -> `String "ZIPFILE"

let object_version_to_yojson = string_to_yojson

let s3_content_location_to_yojson (x : s3_content_location) =
  assoc_to_yojson
    [
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("FileKey", Some (file_key_to_yojson x.file_key));
      ("ObjectVersion", option_to_yojson object_version_to_yojson x.object_version);
    ]

let zip_file_content_to_yojson = blob_to_yojson
let text_content_to_yojson = string_to_yojson

let code_content_to_yojson (x : code_content) =
  assoc_to_yojson
    [
      ("TextContent", option_to_yojson text_content_to_yojson x.text_content);
      ("ZipFileContent", option_to_yojson zip_file_content_to_yojson x.zip_file_content);
      ("S3ContentLocation", option_to_yojson s3_content_location_to_yojson x.s3_content_location);
    ]

let application_code_configuration_to_yojson (x : application_code_configuration) =
  assoc_to_yojson
    [
      ("CodeContent", option_to_yojson code_content_to_yojson x.code_content);
      ("CodeContentType", Some (code_content_type_to_yojson x.code_content_type));
    ]

let s3_application_code_location_description_to_yojson
    (x : s3_application_code_location_description) =
  assoc_to_yojson
    [
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("FileKey", Some (file_key_to_yojson x.file_key));
      ("ObjectVersion", option_to_yojson object_version_to_yojson x.object_version);
    ]

let code_size_to_yojson = long_to_yojson
let code_m_d5_to_yojson = string_to_yojson

let code_content_description_to_yojson (x : code_content_description) =
  assoc_to_yojson
    [
      ("TextContent", option_to_yojson text_content_to_yojson x.text_content);
      ("CodeMD5", option_to_yojson code_m_d5_to_yojson x.code_m_d5);
      ("CodeSize", option_to_yojson code_size_to_yojson x.code_size);
      ( "S3ApplicationCodeLocationDescription",
        option_to_yojson s3_application_code_location_description_to_yojson
          x.s3_application_code_location_description );
    ]

let application_code_configuration_description_to_yojson
    (x : application_code_configuration_description) =
  assoc_to_yojson
    [
      ("CodeContentType", Some (code_content_type_to_yojson x.code_content_type));
      ( "CodeContentDescription",
        option_to_yojson code_content_description_to_yojson x.code_content_description );
    ]

let s3_content_location_update_to_yojson (x : s3_content_location_update) =
  assoc_to_yojson
    [
      ("BucketARNUpdate", option_to_yojson bucket_ar_n_to_yojson x.bucket_arn_update);
      ("FileKeyUpdate", option_to_yojson file_key_to_yojson x.file_key_update);
      ("ObjectVersionUpdate", option_to_yojson object_version_to_yojson x.object_version_update);
    ]

let code_content_update_to_yojson (x : code_content_update) =
  assoc_to_yojson
    [
      ("TextContentUpdate", option_to_yojson text_content_to_yojson x.text_content_update);
      ("ZipFileContentUpdate", option_to_yojson zip_file_content_to_yojson x.zip_file_content_update);
      ( "S3ContentLocationUpdate",
        option_to_yojson s3_content_location_update_to_yojson x.s3_content_location_update );
    ]

let application_code_configuration_update_to_yojson (x : application_code_configuration_update) =
  assoc_to_yojson
    [
      ( "CodeContentTypeUpdate",
        option_to_yojson code_content_type_to_yojson x.code_content_type_update );
      ("CodeContentUpdate", option_to_yojson code_content_update_to_yojson x.code_content_update);
    ]

let key_type_to_yojson (x : key_type) =
  match x with
  | AWS_OWNED_KEY -> `String "AWS_OWNED_KEY"
  | CUSTOMER_MANAGED_KEY -> `String "CUSTOMER_MANAGED_KEY"

let key_id_to_yojson = string_to_yojson

let application_encryption_configuration_to_yojson (x : application_encryption_configuration) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_to_yojson x.key_id);
      ("KeyType", Some (key_type_to_yojson x.key_type));
    ]

let maven_version_to_yojson = string_to_yojson
let maven_artifact_id_to_yojson = string_to_yojson
let maven_group_id_to_yojson = string_to_yojson

let maven_reference_to_yojson (x : maven_reference) =
  assoc_to_yojson
    [
      ("GroupId", Some (maven_group_id_to_yojson x.group_id));
      ("ArtifactId", Some (maven_artifact_id_to_yojson x.artifact_id));
      ("Version", Some (maven_version_to_yojson x.version));
    ]

let artifact_type_to_yojson (x : artifact_type) =
  match x with UDF -> `String "UDF" | DEPENDENCY_JAR -> `String "DEPENDENCY_JAR"

let custom_artifact_configuration_to_yojson (x : custom_artifact_configuration) =
  assoc_to_yojson
    [
      ("ArtifactType", Some (artifact_type_to_yojson x.artifact_type));
      ("S3ContentLocation", option_to_yojson s3_content_location_to_yojson x.s3_content_location);
      ("MavenReference", option_to_yojson maven_reference_to_yojson x.maven_reference);
    ]

let custom_artifacts_configuration_list_to_yojson tree =
  list_to_yojson custom_artifact_configuration_to_yojson tree

let base_path_to_yojson = string_to_yojson

let s3_content_base_location_to_yojson (x : s3_content_base_location) =
  assoc_to_yojson
    [
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("BasePath", option_to_yojson base_path_to_yojson x.base_path);
    ]

let deploy_as_application_configuration_to_yojson (x : deploy_as_application_configuration) =
  assoc_to_yojson
    [ ("S3ContentLocation", Some (s3_content_base_location_to_yojson x.s3_content_location)) ]

let database_ar_n_to_yojson = string_to_yojson

let glue_data_catalog_configuration_to_yojson (x : glue_data_catalog_configuration) =
  assoc_to_yojson [ ("DatabaseARN", Some (database_ar_n_to_yojson x.database_ar_n)) ]

let catalog_configuration_to_yojson (x : catalog_configuration) =
  assoc_to_yojson
    [
      ( "GlueDataCatalogConfiguration",
        Some (glue_data_catalog_configuration_to_yojson x.glue_data_catalog_configuration) );
    ]

let log_level_to_yojson (x : log_level) =
  match x with
  | INFO -> `String "INFO"
  | WARN -> `String "WARN"
  | ERROR -> `String "ERROR"
  | DEBUG -> `String "DEBUG"

let zeppelin_monitoring_configuration_to_yojson (x : zeppelin_monitoring_configuration) =
  assoc_to_yojson [ ("LogLevel", Some (log_level_to_yojson x.log_level)) ]

let zeppelin_application_configuration_to_yojson (x : zeppelin_application_configuration) =
  assoc_to_yojson
    [
      ( "MonitoringConfiguration",
        option_to_yojson zeppelin_monitoring_configuration_to_yojson x.monitoring_configuration );
      ( "CatalogConfiguration",
        option_to_yojson catalog_configuration_to_yojson x.catalog_configuration );
      ( "DeployAsApplicationConfiguration",
        option_to_yojson deploy_as_application_configuration_to_yojson
          x.deploy_as_application_configuration );
      ( "CustomArtifactsConfiguration",
        option_to_yojson custom_artifacts_configuration_list_to_yojson
          x.custom_artifacts_configuration );
    ]

let vpc_configurations_to_yojson tree = list_to_yojson vpc_configuration_to_yojson tree
let boolean_object_to_yojson = bool_to_yojson

let application_system_rollback_configuration_to_yojson
    (x : application_system_rollback_configuration) =
  assoc_to_yojson [ ("RollbackEnabled", Some (boolean_object_to_yojson x.rollback_enabled)) ]

let application_snapshot_configuration_to_yojson (x : application_snapshot_configuration) =
  assoc_to_yojson [ ("SnapshotsEnabled", Some (boolean_object_to_yojson x.snapshots_enabled)) ]

let property_value_to_yojson = string_to_yojson
let property_key_to_yojson = string_to_yojson
let property_map_to_yojson tree = map_to_yojson property_key_to_yojson property_value_to_yojson tree

let property_group_to_yojson (x : property_group) =
  assoc_to_yojson
    [
      ("PropertyGroupId", Some (id_to_yojson x.property_group_id));
      ("PropertyMap", Some (property_map_to_yojson x.property_map));
    ]

let property_groups_to_yojson tree = list_to_yojson property_group_to_yojson tree

let environment_properties_to_yojson (x : environment_properties) =
  assoc_to_yojson [ ("PropertyGroups", Some (property_groups_to_yojson x.property_groups)) ]

let parallelism_per_kp_u_to_yojson = int_to_yojson
let parallelism_to_yojson = int_to_yojson

let configuration_type_to_yojson (x : configuration_type) =
  match x with DEFAULT -> `String "DEFAULT" | CUSTOM -> `String "CUSTOM"

let parallelism_configuration_to_yojson (x : parallelism_configuration) =
  assoc_to_yojson
    [
      ("ConfigurationType", Some (configuration_type_to_yojson x.configuration_type));
      ("Parallelism", option_to_yojson parallelism_to_yojson x.parallelism);
      ("ParallelismPerKPU", option_to_yojson parallelism_per_kp_u_to_yojson x.parallelism_per_kp_u);
      ("AutoScalingEnabled", option_to_yojson boolean_object_to_yojson x.auto_scaling_enabled);
    ]

let metrics_level_to_yojson (x : metrics_level) =
  match x with
  | APPLICATION -> `String "APPLICATION"
  | TASK -> `String "TASK"
  | OPERATOR -> `String "OPERATOR"
  | PARALLELISM -> `String "PARALLELISM"

let monitoring_configuration_to_yojson (x : monitoring_configuration) =
  assoc_to_yojson
    [
      ("ConfigurationType", Some (configuration_type_to_yojson x.configuration_type));
      ("MetricsLevel", option_to_yojson metrics_level_to_yojson x.metrics_level);
      ("LogLevel", option_to_yojson log_level_to_yojson x.log_level);
    ]

let min_pause_between_checkpoints_to_yojson = long_to_yojson
let checkpoint_interval_to_yojson = long_to_yojson

let checkpoint_configuration_to_yojson (x : checkpoint_configuration) =
  assoc_to_yojson
    [
      ("ConfigurationType", Some (configuration_type_to_yojson x.configuration_type));
      ("CheckpointingEnabled", option_to_yojson boolean_object_to_yojson x.checkpointing_enabled);
      ("CheckpointInterval", option_to_yojson checkpoint_interval_to_yojson x.checkpoint_interval);
      ( "MinPauseBetweenCheckpoints",
        option_to_yojson min_pause_between_checkpoints_to_yojson x.min_pause_between_checkpoints );
    ]

let flink_application_configuration_to_yojson (x : flink_application_configuration) =
  assoc_to_yojson
    [
      ( "CheckpointConfiguration",
        option_to_yojson checkpoint_configuration_to_yojson x.checkpoint_configuration );
      ( "MonitoringConfiguration",
        option_to_yojson monitoring_configuration_to_yojson x.monitoring_configuration );
      ( "ParallelismConfiguration",
        option_to_yojson parallelism_configuration_to_yojson x.parallelism_configuration );
    ]

let reference_data_sources_to_yojson tree = list_to_yojson reference_data_source_to_yojson tree
let outputs_to_yojson tree = list_to_yojson output_to_yojson tree
let inputs_to_yojson tree = list_to_yojson input_to_yojson tree

let sql_application_configuration_to_yojson (x : sql_application_configuration) =
  assoc_to_yojson
    [
      ("Inputs", option_to_yojson inputs_to_yojson x.inputs);
      ("Outputs", option_to_yojson outputs_to_yojson x.outputs);
      ( "ReferenceDataSources",
        option_to_yojson reference_data_sources_to_yojson x.reference_data_sources );
    ]

let application_configuration_to_yojson (x : application_configuration) =
  assoc_to_yojson
    [
      ( "SqlApplicationConfiguration",
        option_to_yojson sql_application_configuration_to_yojson x.sql_application_configuration );
      ( "FlinkApplicationConfiguration",
        option_to_yojson flink_application_configuration_to_yojson x.flink_application_configuration
      );
      ( "EnvironmentProperties",
        option_to_yojson environment_properties_to_yojson x.environment_properties );
      ( "ApplicationCodeConfiguration",
        option_to_yojson application_code_configuration_to_yojson x.application_code_configuration
      );
      ( "ApplicationSnapshotConfiguration",
        option_to_yojson application_snapshot_configuration_to_yojson
          x.application_snapshot_configuration );
      ( "ApplicationSystemRollbackConfiguration",
        option_to_yojson application_system_rollback_configuration_to_yojson
          x.application_system_rollback_configuration );
      ("VpcConfigurations", option_to_yojson vpc_configurations_to_yojson x.vpc_configurations);
      ( "ZeppelinApplicationConfiguration",
        option_to_yojson zeppelin_application_configuration_to_yojson
          x.zeppelin_application_configuration );
      ( "ApplicationEncryptionConfiguration",
        option_to_yojson application_encryption_configuration_to_yojson
          x.application_encryption_configuration );
    ]

let application_encryption_configuration_description_to_yojson
    (x : application_encryption_configuration_description) =
  assoc_to_yojson
    [
      ("KeyId", option_to_yojson key_id_to_yojson x.key_id);
      ("KeyType", Some (key_type_to_yojson x.key_type));
    ]

let custom_artifact_configuration_description_to_yojson
    (x : custom_artifact_configuration_description) =
  assoc_to_yojson
    [
      ("ArtifactType", option_to_yojson artifact_type_to_yojson x.artifact_type);
      ( "S3ContentLocationDescription",
        option_to_yojson s3_content_location_to_yojson x.s3_content_location_description );
      ( "MavenReferenceDescription",
        option_to_yojson maven_reference_to_yojson x.maven_reference_description );
    ]

let custom_artifacts_configuration_description_list_to_yojson tree =
  list_to_yojson custom_artifact_configuration_description_to_yojson tree

let s3_content_base_location_description_to_yojson (x : s3_content_base_location_description) =
  assoc_to_yojson
    [
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("BasePath", option_to_yojson base_path_to_yojson x.base_path);
    ]

let deploy_as_application_configuration_description_to_yojson
    (x : deploy_as_application_configuration_description) =
  assoc_to_yojson
    [
      ( "S3ContentLocationDescription",
        Some (s3_content_base_location_description_to_yojson x.s3_content_location_description) );
    ]

let glue_data_catalog_configuration_description_to_yojson
    (x : glue_data_catalog_configuration_description) =
  assoc_to_yojson [ ("DatabaseARN", Some (database_ar_n_to_yojson x.database_ar_n)) ]

let catalog_configuration_description_to_yojson (x : catalog_configuration_description) =
  assoc_to_yojson
    [
      ( "GlueDataCatalogConfigurationDescription",
        Some
          (glue_data_catalog_configuration_description_to_yojson
             x.glue_data_catalog_configuration_description) );
    ]

let zeppelin_monitoring_configuration_description_to_yojson
    (x : zeppelin_monitoring_configuration_description) =
  assoc_to_yojson [ ("LogLevel", option_to_yojson log_level_to_yojson x.log_level) ]

let zeppelin_application_configuration_description_to_yojson
    (x : zeppelin_application_configuration_description) =
  assoc_to_yojson
    [
      ( "MonitoringConfigurationDescription",
        Some
          (zeppelin_monitoring_configuration_description_to_yojson
             x.monitoring_configuration_description) );
      ( "CatalogConfigurationDescription",
        option_to_yojson catalog_configuration_description_to_yojson
          x.catalog_configuration_description );
      ( "DeployAsApplicationConfigurationDescription",
        option_to_yojson deploy_as_application_configuration_description_to_yojson
          x.deploy_as_application_configuration_description );
      ( "CustomArtifactsConfigurationDescription",
        option_to_yojson custom_artifacts_configuration_description_list_to_yojson
          x.custom_artifacts_configuration_description );
    ]

let vpc_configuration_descriptions_to_yojson tree =
  list_to_yojson vpc_configuration_description_to_yojson tree

let application_system_rollback_configuration_description_to_yojson
    (x : application_system_rollback_configuration_description) =
  assoc_to_yojson [ ("RollbackEnabled", Some (boolean_object_to_yojson x.rollback_enabled)) ]

let application_snapshot_configuration_description_to_yojson
    (x : application_snapshot_configuration_description) =
  assoc_to_yojson [ ("SnapshotsEnabled", Some (boolean_object_to_yojson x.snapshots_enabled)) ]

let environment_property_descriptions_to_yojson (x : environment_property_descriptions) =
  assoc_to_yojson
    [
      ( "PropertyGroupDescriptions",
        option_to_yojson property_groups_to_yojson x.property_group_descriptions );
    ]

let job_plan_description_to_yojson = string_to_yojson

let parallelism_configuration_description_to_yojson (x : parallelism_configuration_description) =
  assoc_to_yojson
    [
      ("ConfigurationType", option_to_yojson configuration_type_to_yojson x.configuration_type);
      ("Parallelism", option_to_yojson parallelism_to_yojson x.parallelism);
      ("ParallelismPerKPU", option_to_yojson parallelism_per_kp_u_to_yojson x.parallelism_per_kp_u);
      ("CurrentParallelism", option_to_yojson parallelism_to_yojson x.current_parallelism);
      ("AutoScalingEnabled", option_to_yojson boolean_object_to_yojson x.auto_scaling_enabled);
    ]

let monitoring_configuration_description_to_yojson (x : monitoring_configuration_description) =
  assoc_to_yojson
    [
      ("ConfigurationType", option_to_yojson configuration_type_to_yojson x.configuration_type);
      ("MetricsLevel", option_to_yojson metrics_level_to_yojson x.metrics_level);
      ("LogLevel", option_to_yojson log_level_to_yojson x.log_level);
    ]

let checkpoint_configuration_description_to_yojson (x : checkpoint_configuration_description) =
  assoc_to_yojson
    [
      ("ConfigurationType", option_to_yojson configuration_type_to_yojson x.configuration_type);
      ("CheckpointingEnabled", option_to_yojson boolean_object_to_yojson x.checkpointing_enabled);
      ("CheckpointInterval", option_to_yojson checkpoint_interval_to_yojson x.checkpoint_interval);
      ( "MinPauseBetweenCheckpoints",
        option_to_yojson min_pause_between_checkpoints_to_yojson x.min_pause_between_checkpoints );
    ]

let flink_application_configuration_description_to_yojson
    (x : flink_application_configuration_description) =
  assoc_to_yojson
    [
      ( "CheckpointConfigurationDescription",
        option_to_yojson checkpoint_configuration_description_to_yojson
          x.checkpoint_configuration_description );
      ( "MonitoringConfigurationDescription",
        option_to_yojson monitoring_configuration_description_to_yojson
          x.monitoring_configuration_description );
      ( "ParallelismConfigurationDescription",
        option_to_yojson parallelism_configuration_description_to_yojson
          x.parallelism_configuration_description );
      ("JobPlanDescription", option_to_yojson job_plan_description_to_yojson x.job_plan_description);
    ]

let flink_run_configuration_to_yojson (x : flink_run_configuration) =
  assoc_to_yojson
    [
      ("AllowNonRestoredState", option_to_yojson boolean_object_to_yojson x.allow_non_restored_state);
    ]

let snapshot_name_to_yojson = string_to_yojson

let application_restore_type_to_yojson (x : application_restore_type) =
  match x with
  | SKIP_RESTORE_FROM_SNAPSHOT -> `String "SKIP_RESTORE_FROM_SNAPSHOT"
  | RESTORE_FROM_LATEST_SNAPSHOT -> `String "RESTORE_FROM_LATEST_SNAPSHOT"
  | RESTORE_FROM_CUSTOM_SNAPSHOT -> `String "RESTORE_FROM_CUSTOM_SNAPSHOT"

let application_restore_configuration_to_yojson (x : application_restore_configuration) =
  assoc_to_yojson
    [
      ( "ApplicationRestoreType",
        Some (application_restore_type_to_yojson x.application_restore_type) );
      ("SnapshotName", option_to_yojson snapshot_name_to_yojson x.snapshot_name);
    ]

let run_configuration_description_to_yojson (x : run_configuration_description) =
  assoc_to_yojson
    [
      ( "ApplicationRestoreConfigurationDescription",
        option_to_yojson application_restore_configuration_to_yojson
          x.application_restore_configuration_description );
      ( "FlinkRunConfigurationDescription",
        option_to_yojson flink_run_configuration_to_yojson x.flink_run_configuration_description );
    ]

let sql_application_configuration_description_to_yojson
    (x : sql_application_configuration_description) =
  assoc_to_yojson
    [
      ("InputDescriptions", option_to_yojson input_descriptions_to_yojson x.input_descriptions);
      ("OutputDescriptions", option_to_yojson output_descriptions_to_yojson x.output_descriptions);
      ( "ReferenceDataSourceDescriptions",
        option_to_yojson reference_data_source_descriptions_to_yojson
          x.reference_data_source_descriptions );
    ]

let application_configuration_description_to_yojson (x : application_configuration_description) =
  assoc_to_yojson
    [
      ( "SqlApplicationConfigurationDescription",
        option_to_yojson sql_application_configuration_description_to_yojson
          x.sql_application_configuration_description );
      ( "ApplicationCodeConfigurationDescription",
        option_to_yojson application_code_configuration_description_to_yojson
          x.application_code_configuration_description );
      ( "RunConfigurationDescription",
        option_to_yojson run_configuration_description_to_yojson x.run_configuration_description );
      ( "FlinkApplicationConfigurationDescription",
        option_to_yojson flink_application_configuration_description_to_yojson
          x.flink_application_configuration_description );
      ( "EnvironmentPropertyDescriptions",
        option_to_yojson environment_property_descriptions_to_yojson
          x.environment_property_descriptions );
      ( "ApplicationSnapshotConfigurationDescription",
        option_to_yojson application_snapshot_configuration_description_to_yojson
          x.application_snapshot_configuration_description );
      ( "ApplicationSystemRollbackConfigurationDescription",
        option_to_yojson application_system_rollback_configuration_description_to_yojson
          x.application_system_rollback_configuration_description );
      ( "VpcConfigurationDescriptions",
        option_to_yojson vpc_configuration_descriptions_to_yojson x.vpc_configuration_descriptions
      );
      ( "ZeppelinApplicationConfigurationDescription",
        option_to_yojson zeppelin_application_configuration_description_to_yojson
          x.zeppelin_application_configuration_description );
      ( "ApplicationEncryptionConfigurationDescription",
        option_to_yojson application_encryption_configuration_description_to_yojson
          x.application_encryption_configuration_description );
    ]

let application_encryption_configuration_update_to_yojson
    (x : application_encryption_configuration_update) =
  assoc_to_yojson
    [
      ("KeyIdUpdate", option_to_yojson key_id_to_yojson x.key_id_update);
      ("KeyTypeUpdate", Some (key_type_to_yojson x.key_type_update));
    ]

let s3_content_base_location_update_to_yojson (x : s3_content_base_location_update) =
  assoc_to_yojson
    [
      ("BucketARNUpdate", option_to_yojson bucket_ar_n_to_yojson x.bucket_arn_update);
      ("BasePathUpdate", option_to_yojson base_path_to_yojson x.base_path_update);
    ]

let deploy_as_application_configuration_update_to_yojson
    (x : deploy_as_application_configuration_update) =
  assoc_to_yojson
    [
      ( "S3ContentLocationUpdate",
        option_to_yojson s3_content_base_location_update_to_yojson x.s3_content_location_update );
    ]

let glue_data_catalog_configuration_update_to_yojson (x : glue_data_catalog_configuration_update) =
  assoc_to_yojson [ ("DatabaseARNUpdate", Some (database_ar_n_to_yojson x.database_arn_update)) ]

let catalog_configuration_update_to_yojson (x : catalog_configuration_update) =
  assoc_to_yojson
    [
      ( "GlueDataCatalogConfigurationUpdate",
        Some
          (glue_data_catalog_configuration_update_to_yojson x.glue_data_catalog_configuration_update)
      );
    ]

let zeppelin_monitoring_configuration_update_to_yojson
    (x : zeppelin_monitoring_configuration_update) =
  assoc_to_yojson [ ("LogLevelUpdate", Some (log_level_to_yojson x.log_level_update)) ]

let zeppelin_application_configuration_update_to_yojson
    (x : zeppelin_application_configuration_update) =
  assoc_to_yojson
    [
      ( "MonitoringConfigurationUpdate",
        option_to_yojson zeppelin_monitoring_configuration_update_to_yojson
          x.monitoring_configuration_update );
      ( "CatalogConfigurationUpdate",
        option_to_yojson catalog_configuration_update_to_yojson x.catalog_configuration_update );
      ( "DeployAsApplicationConfigurationUpdate",
        option_to_yojson deploy_as_application_configuration_update_to_yojson
          x.deploy_as_application_configuration_update );
      ( "CustomArtifactsConfigurationUpdate",
        option_to_yojson custom_artifacts_configuration_list_to_yojson
          x.custom_artifacts_configuration_update );
    ]

let vpc_configuration_update_to_yojson (x : vpc_configuration_update) =
  assoc_to_yojson
    [
      ("VpcConfigurationId", Some (id_to_yojson x.vpc_configuration_id));
      ("SubnetIdUpdates", option_to_yojson subnet_ids_to_yojson x.subnet_id_updates);
      ( "SecurityGroupIdUpdates",
        option_to_yojson security_group_ids_to_yojson x.security_group_id_updates );
    ]

let vpc_configuration_updates_to_yojson tree =
  list_to_yojson vpc_configuration_update_to_yojson tree

let application_system_rollback_configuration_update_to_yojson
    (x : application_system_rollback_configuration_update) =
  assoc_to_yojson
    [ ("RollbackEnabledUpdate", Some (boolean_object_to_yojson x.rollback_enabled_update)) ]

let application_snapshot_configuration_update_to_yojson
    (x : application_snapshot_configuration_update) =
  assoc_to_yojson
    [ ("SnapshotsEnabledUpdate", Some (boolean_object_to_yojson x.snapshots_enabled_update)) ]

let environment_property_updates_to_yojson (x : environment_property_updates) =
  assoc_to_yojson [ ("PropertyGroups", Some (property_groups_to_yojson x.property_groups)) ]

let parallelism_configuration_update_to_yojson (x : parallelism_configuration_update) =
  assoc_to_yojson
    [
      ( "ConfigurationTypeUpdate",
        option_to_yojson configuration_type_to_yojson x.configuration_type_update );
      ("ParallelismUpdate", option_to_yojson parallelism_to_yojson x.parallelism_update);
      ( "ParallelismPerKPUUpdate",
        option_to_yojson parallelism_per_kp_u_to_yojson x.parallelism_per_kpu_update );
      ( "AutoScalingEnabledUpdate",
        option_to_yojson boolean_object_to_yojson x.auto_scaling_enabled_update );
    ]

let monitoring_configuration_update_to_yojson (x : monitoring_configuration_update) =
  assoc_to_yojson
    [
      ( "ConfigurationTypeUpdate",
        option_to_yojson configuration_type_to_yojson x.configuration_type_update );
      ("MetricsLevelUpdate", option_to_yojson metrics_level_to_yojson x.metrics_level_update);
      ("LogLevelUpdate", option_to_yojson log_level_to_yojson x.log_level_update);
    ]

let checkpoint_configuration_update_to_yojson (x : checkpoint_configuration_update) =
  assoc_to_yojson
    [
      ( "ConfigurationTypeUpdate",
        option_to_yojson configuration_type_to_yojson x.configuration_type_update );
      ( "CheckpointingEnabledUpdate",
        option_to_yojson boolean_object_to_yojson x.checkpointing_enabled_update );
      ( "CheckpointIntervalUpdate",
        option_to_yojson checkpoint_interval_to_yojson x.checkpoint_interval_update );
      ( "MinPauseBetweenCheckpointsUpdate",
        option_to_yojson min_pause_between_checkpoints_to_yojson
          x.min_pause_between_checkpoints_update );
    ]

let flink_application_configuration_update_to_yojson (x : flink_application_configuration_update) =
  assoc_to_yojson
    [
      ( "CheckpointConfigurationUpdate",
        option_to_yojson checkpoint_configuration_update_to_yojson x.checkpoint_configuration_update
      );
      ( "MonitoringConfigurationUpdate",
        option_to_yojson monitoring_configuration_update_to_yojson x.monitoring_configuration_update
      );
      ( "ParallelismConfigurationUpdate",
        option_to_yojson parallelism_configuration_update_to_yojson
          x.parallelism_configuration_update );
    ]

let s3_reference_data_source_update_to_yojson (x : s3_reference_data_source_update) =
  assoc_to_yojson
    [
      ("BucketARNUpdate", option_to_yojson bucket_ar_n_to_yojson x.bucket_arn_update);
      ("FileKeyUpdate", option_to_yojson file_key_to_yojson x.file_key_update);
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
  assoc_to_yojson [ ("ResourceARNUpdate", Some (resource_ar_n_to_yojson x.resource_arn_update)) ]

let kinesis_firehose_output_update_to_yojson (x : kinesis_firehose_output_update) =
  assoc_to_yojson [ ("ResourceARNUpdate", Some (resource_ar_n_to_yojson x.resource_arn_update)) ]

let kinesis_streams_output_update_to_yojson (x : kinesis_streams_output_update) =
  assoc_to_yojson [ ("ResourceARNUpdate", Some (resource_ar_n_to_yojson x.resource_arn_update)) ]

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
  assoc_to_yojson [ ("CountUpdate", Some (input_parallelism_count_to_yojson x.count_update)) ]

let input_schema_update_to_yojson (x : input_schema_update) =
  assoc_to_yojson
    [
      ("RecordFormatUpdate", option_to_yojson record_format_to_yojson x.record_format_update);
      ("RecordEncodingUpdate", option_to_yojson record_encoding_to_yojson x.record_encoding_update);
      ("RecordColumnUpdates", option_to_yojson record_columns_to_yojson x.record_column_updates);
    ]

let kinesis_firehose_input_update_to_yojson (x : kinesis_firehose_input_update) =
  assoc_to_yojson [ ("ResourceARNUpdate", Some (resource_ar_n_to_yojson x.resource_arn_update)) ]

let kinesis_streams_input_update_to_yojson (x : kinesis_streams_input_update) =
  assoc_to_yojson [ ("ResourceARNUpdate", Some (resource_ar_n_to_yojson x.resource_arn_update)) ]

let input_lambda_processor_update_to_yojson (x : input_lambda_processor_update) =
  assoc_to_yojson [ ("ResourceARNUpdate", Some (resource_ar_n_to_yojson x.resource_arn_update)) ]

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

let sql_application_configuration_update_to_yojson (x : sql_application_configuration_update) =
  assoc_to_yojson
    [
      ("InputUpdates", option_to_yojson input_updates_to_yojson x.input_updates);
      ("OutputUpdates", option_to_yojson output_updates_to_yojson x.output_updates);
      ( "ReferenceDataSourceUpdates",
        option_to_yojson reference_data_source_updates_to_yojson x.reference_data_source_updates );
    ]

let application_configuration_update_to_yojson (x : application_configuration_update) =
  assoc_to_yojson
    [
      ( "SqlApplicationConfigurationUpdate",
        option_to_yojson sql_application_configuration_update_to_yojson
          x.sql_application_configuration_update );
      ( "ApplicationCodeConfigurationUpdate",
        option_to_yojson application_code_configuration_update_to_yojson
          x.application_code_configuration_update );
      ( "FlinkApplicationConfigurationUpdate",
        option_to_yojson flink_application_configuration_update_to_yojson
          x.flink_application_configuration_update );
      ( "EnvironmentPropertyUpdates",
        option_to_yojson environment_property_updates_to_yojson x.environment_property_updates );
      ( "ApplicationSnapshotConfigurationUpdate",
        option_to_yojson application_snapshot_configuration_update_to_yojson
          x.application_snapshot_configuration_update );
      ( "ApplicationSystemRollbackConfigurationUpdate",
        option_to_yojson application_system_rollback_configuration_update_to_yojson
          x.application_system_rollback_configuration_update );
      ( "VpcConfigurationUpdates",
        option_to_yojson vpc_configuration_updates_to_yojson x.vpc_configuration_updates );
      ( "ZeppelinApplicationConfigurationUpdate",
        option_to_yojson zeppelin_application_configuration_update_to_yojson
          x.zeppelin_application_configuration_update );
      ( "ApplicationEncryptionConfigurationUpdate",
        option_to_yojson application_encryption_configuration_update_to_yojson
          x.application_encryption_configuration_update );
    ]

let application_description_to_yojson = string_to_yojson

let application_mode_to_yojson (x : application_mode) =
  match x with STREAMING -> `String "STREAMING" | INTERACTIVE -> `String "INTERACTIVE"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let application_maintenance_window_end_time_to_yojson = string_to_yojson
let application_maintenance_window_start_time_to_yojson = string_to_yojson

let application_maintenance_configuration_description_to_yojson
    (x : application_maintenance_configuration_description) =
  assoc_to_yojson
    [
      ( "ApplicationMaintenanceWindowStartTime",
        Some
          (application_maintenance_window_start_time_to_yojson
             x.application_maintenance_window_start_time) );
      ( "ApplicationMaintenanceWindowEndTime",
        Some
          (application_maintenance_window_end_time_to_yojson
             x.application_maintenance_window_end_time) );
    ]

let application_status_to_yojson (x : application_status) =
  match x with
  | DELETING -> `String "DELETING"
  | STARTING -> `String "STARTING"
  | STOPPING -> `String "STOPPING"
  | READY -> `String "READY"
  | RUNNING -> `String "RUNNING"
  | UPDATING -> `String "UPDATING"
  | AUTOSCALING -> `String "AUTOSCALING"
  | FORCE_STOPPING -> `String "FORCE_STOPPING"
  | ROLLING_BACK -> `String "ROLLING_BACK"
  | MAINTENANCE -> `String "MAINTENANCE"
  | ROLLED_BACK -> `String "ROLLED_BACK"

let runtime_environment_to_yojson (x : runtime_environment) =
  match x with
  | SQL_1_0 -> `String "SQL-1_0"
  | FLINK_1_6 -> `String "FLINK-1_6"
  | FLINK_1_8 -> `String "FLINK-1_8"
  | ZEPPELIN_FLINK_1_0 -> `String "ZEPPELIN-FLINK-1_0"
  | FLINK_1_11 -> `String "FLINK-1_11"
  | FLINK_1_13 -> `String "FLINK-1_13"
  | ZEPPELIN_FLINK_2_0 -> `String "ZEPPELIN-FLINK-2_0"
  | FLINK_1_15 -> `String "FLINK-1_15"
  | ZEPPELIN_FLINK_3_0 -> `String "ZEPPELIN-FLINK-3_0"
  | FLINK_1_18 -> `String "FLINK-1_18"
  | FLINK_1_19 -> `String "FLINK-1_19"
  | FLINK_1_20 -> `String "FLINK-1_20"
  | FLINK_2_2 -> `String "FLINK-2_2"

let application_detail_to_yojson (x : application_detail) =
  assoc_to_yojson
    [
      ("ApplicationARN", Some (resource_ar_n_to_yojson x.application_ar_n));
      ( "ApplicationDescription",
        option_to_yojson application_description_to_yojson x.application_description );
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("RuntimeEnvironment", Some (runtime_environment_to_yojson x.runtime_environment));
      ("ServiceExecutionRole", option_to_yojson role_ar_n_to_yojson x.service_execution_role);
      ("ApplicationStatus", Some (application_status_to_yojson x.application_status));
      ("ApplicationVersionId", Some (application_version_id_to_yojson x.application_version_id));
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("LastUpdateTimestamp", option_to_yojson timestamp_to_yojson x.last_update_timestamp);
      ( "ApplicationConfigurationDescription",
        option_to_yojson application_configuration_description_to_yojson
          x.application_configuration_description );
      ( "CloudWatchLoggingOptionDescriptions",
        option_to_yojson cloud_watch_logging_option_descriptions_to_yojson
          x.cloud_watch_logging_option_descriptions );
      ( "ApplicationMaintenanceConfigurationDescription",
        option_to_yojson application_maintenance_configuration_description_to_yojson
          x.application_maintenance_configuration_description );
      ( "ApplicationVersionUpdatedFrom",
        option_to_yojson application_version_id_to_yojson x.application_version_updated_from );
      ( "ApplicationVersionRolledBackFrom",
        option_to_yojson application_version_id_to_yojson x.application_version_rolled_back_from );
      ( "ApplicationVersionCreateTimestamp",
        option_to_yojson timestamp_to_yojson x.application_version_create_timestamp );
      ("ConditionalToken", option_to_yojson conditional_token_to_yojson x.conditional_token);
      ( "ApplicationVersionRolledBackTo",
        option_to_yojson application_version_id_to_yojson x.application_version_rolled_back_to );
      ("ApplicationMode", option_to_yojson application_mode_to_yojson x.application_mode);
    ]

let application_maintenance_configuration_update_to_yojson
    (x : application_maintenance_configuration_update) =
  assoc_to_yojson
    [
      ( "ApplicationMaintenanceWindowStartTimeUpdate",
        Some
          (application_maintenance_window_start_time_to_yojson
             x.application_maintenance_window_start_time_update) );
    ]

let operation_status_to_yojson (x : operation_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | CANCELLED -> `String "CANCELLED"
  | SUCCESSFUL -> `String "SUCCESSFUL"
  | FAILED -> `String "FAILED"

let operation_to_yojson = string_to_yojson

let application_operation_info_to_yojson (x : application_operation_info) =
  assoc_to_yojson
    [
      ("Operation", option_to_yojson operation_to_yojson x.operation);
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("EndTime", option_to_yojson timestamp_to_yojson x.end_time);
      ("OperationStatus", option_to_yojson operation_status_to_yojson x.operation_status);
    ]

let error_string_to_yojson = string_to_yojson

let error_info_to_yojson (x : error_info) =
  assoc_to_yojson [ ("ErrorString", option_to_yojson error_string_to_yojson x.error_string) ]

let operation_failure_details_to_yojson (x : operation_failure_details) =
  assoc_to_yojson
    [
      ("RollbackOperationId", option_to_yojson operation_id_to_yojson x.rollback_operation_id);
      ("ErrorInfo", option_to_yojson error_info_to_yojson x.error_info);
    ]

let application_version_change_details_to_yojson (x : application_version_change_details) =
  assoc_to_yojson
    [
      ( "ApplicationVersionUpdatedFrom",
        Some (application_version_id_to_yojson x.application_version_updated_from) );
      ( "ApplicationVersionUpdatedTo",
        Some (application_version_id_to_yojson x.application_version_updated_to) );
    ]

let application_operation_info_details_to_yojson (x : application_operation_info_details) =
  assoc_to_yojson
    [
      ("Operation", Some (operation_to_yojson x.operation));
      ("StartTime", Some (timestamp_to_yojson x.start_time));
      ("EndTime", Some (timestamp_to_yojson x.end_time));
      ("OperationStatus", Some (operation_status_to_yojson x.operation_status));
      ( "ApplicationVersionChangeDetails",
        option_to_yojson application_version_change_details_to_yojson
          x.application_version_change_details );
      ( "OperationFailureDetails",
        option_to_yojson operation_failure_details_to_yojson x.operation_failure_details );
    ]

let application_operation_info_list_to_yojson tree =
  list_to_yojson application_operation_info_to_yojson tree

let application_summary_to_yojson (x : application_summary) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("ApplicationARN", Some (resource_ar_n_to_yojson x.application_ar_n));
      ("ApplicationStatus", Some (application_status_to_yojson x.application_status));
      ("ApplicationVersionId", Some (application_version_id_to_yojson x.application_version_id));
      ("RuntimeEnvironment", Some (runtime_environment_to_yojson x.runtime_environment));
      ("ApplicationMode", option_to_yojson application_mode_to_yojson x.application_mode);
    ]

let application_summaries_to_yojson tree = list_to_yojson application_summary_to_yojson tree

let application_version_summary_to_yojson (x : application_version_summary) =
  assoc_to_yojson
    [
      ("ApplicationVersionId", Some (application_version_id_to_yojson x.application_version_id));
      ("ApplicationStatus", Some (application_status_to_yojson x.application_status));
    ]

let application_version_summaries_to_yojson tree =
  list_to_yojson application_version_summary_to_yojson tree

let authorized_url_to_yojson = string_to_yojson

let cloud_watch_logging_option_update_to_yojson (x : cloud_watch_logging_option_update) =
  assoc_to_yojson
    [
      ("CloudWatchLoggingOptionId", Some (id_to_yojson x.cloud_watch_logging_option_id));
      ("LogStreamARNUpdate", option_to_yojson log_stream_ar_n_to_yojson x.log_stream_arn_update);
    ]

let cloud_watch_logging_option_updates_to_yojson tree =
  list_to_yojson cloud_watch_logging_option_update_to_yojson tree

let cloud_watch_logging_options_to_yojson tree =
  list_to_yojson cloud_watch_logging_option_to_yojson tree

let unsupported_operation_exception_to_yojson (x : unsupported_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let too_many_tags_exception_to_yojson (x : too_many_tags_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_application_response_to_yojson (x : create_application_response) =
  assoc_to_yojson
    [ ("ApplicationDetail", Some (application_detail_to_yojson x.application_detail)) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "ApplicationDescription",
        option_to_yojson application_description_to_yojson x.application_description );
      ("RuntimeEnvironment", Some (runtime_environment_to_yojson x.runtime_environment));
      ("ServiceExecutionRole", Some (role_ar_n_to_yojson x.service_execution_role));
      ( "ApplicationConfiguration",
        option_to_yojson application_configuration_to_yojson x.application_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ApplicationMode", option_to_yojson application_mode_to_yojson x.application_mode);
    ]

let create_application_presigned_url_response_to_yojson
    (x : create_application_presigned_url_response) =
  assoc_to_yojson [ ("AuthorizedUrl", option_to_yojson authorized_url_to_yojson x.authorized_url) ]

let session_expiration_duration_in_seconds_to_yojson = long_to_yojson

let url_type_to_yojson (x : url_type) =
  match x with
  | FLINK_DASHBOARD_URL -> `String "FLINK_DASHBOARD_URL"
  | ZEPPELIN_UI_URL -> `String "ZEPPELIN_UI_URL"

let create_application_presigned_url_request_to_yojson
    (x : create_application_presigned_url_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("UrlType", Some (url_type_to_yojson x.url_type));
      ( "SessionExpirationDurationInSeconds",
        option_to_yojson session_expiration_duration_in_seconds_to_yojson
          x.session_expiration_duration_in_seconds );
    ]

let create_application_snapshot_response_to_yojson = unit_to_yojson

let create_application_snapshot_request_to_yojson (x : create_application_snapshot_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("SnapshotName", Some (snapshot_name_to_yojson x.snapshot_name));
    ]

let delete_application_response_to_yojson = unit_to_yojson

let delete_application_request_to_yojson (x : delete_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("CreateTimestamp", Some (timestamp_to_yojson x.create_timestamp));
    ]

let delete_application_cloud_watch_logging_option_response_to_yojson
    (x : delete_application_cloud_watch_logging_option_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
      ( "CloudWatchLoggingOptionDescriptions",
        option_to_yojson cloud_watch_logging_option_descriptions_to_yojson
          x.cloud_watch_logging_option_descriptions );
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let delete_application_cloud_watch_logging_option_request_to_yojson
    (x : delete_application_cloud_watch_logging_option_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.current_application_version_id );
      ("CloudWatchLoggingOptionId", Some (id_to_yojson x.cloud_watch_logging_option_id));
      ("ConditionalToken", option_to_yojson conditional_token_to_yojson x.conditional_token);
    ]

let delete_application_input_processing_configuration_response_to_yojson
    (x : delete_application_input_processing_configuration_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
    ]

let delete_application_input_processing_configuration_request_to_yojson
    (x : delete_application_input_processing_configuration_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("InputId", Some (id_to_yojson x.input_id));
    ]

let delete_application_output_response_to_yojson (x : delete_application_output_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
    ]

let delete_application_output_request_to_yojson (x : delete_application_output_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("OutputId", Some (id_to_yojson x.output_id));
    ]

let delete_application_reference_data_source_response_to_yojson
    (x : delete_application_reference_data_source_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
    ]

let delete_application_reference_data_source_request_to_yojson
    (x : delete_application_reference_data_source_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
      ("ReferenceId", Some (id_to_yojson x.reference_id));
    ]

let delete_application_snapshot_response_to_yojson = unit_to_yojson

let delete_application_snapshot_request_to_yojson (x : delete_application_snapshot_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("SnapshotName", Some (snapshot_name_to_yojson x.snapshot_name));
      ("SnapshotCreationTimestamp", Some (timestamp_to_yojson x.snapshot_creation_timestamp));
    ]

let delete_application_vpc_configuration_response_to_yojson
    (x : delete_application_vpc_configuration_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.application_version_id );
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let delete_application_vpc_configuration_request_to_yojson
    (x : delete_application_vpc_configuration_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.current_application_version_id );
      ("VpcConfigurationId", Some (id_to_yojson x.vpc_configuration_id));
      ("ConditionalToken", option_to_yojson conditional_token_to_yojson x.conditional_token);
    ]

let describe_application_response_to_yojson (x : describe_application_response) =
  assoc_to_yojson
    [ ("ApplicationDetail", Some (application_detail_to_yojson x.application_detail)) ]

let describe_application_request_to_yojson (x : describe_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "IncludeAdditionalDetails",
        option_to_yojson boolean_object_to_yojson x.include_additional_details );
    ]

let describe_application_operation_response_to_yojson (x : describe_application_operation_response)
    =
  assoc_to_yojson
    [
      ( "ApplicationOperationInfoDetails",
        option_to_yojson application_operation_info_details_to_yojson
          x.application_operation_info_details );
    ]

let describe_application_operation_request_to_yojson (x : describe_application_operation_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("OperationId", Some (operation_id_to_yojson x.operation_id));
    ]

let snapshot_status_to_yojson (x : snapshot_status) =
  match x with
  | CREATING -> `String "CREATING"
  | READY -> `String "READY"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"

let snapshot_details_to_yojson (x : snapshot_details) =
  assoc_to_yojson
    [
      ("SnapshotName", Some (snapshot_name_to_yojson x.snapshot_name));
      ("SnapshotStatus", Some (snapshot_status_to_yojson x.snapshot_status));
      ("ApplicationVersionId", Some (application_version_id_to_yojson x.application_version_id));
      ( "SnapshotCreationTimestamp",
        option_to_yojson timestamp_to_yojson x.snapshot_creation_timestamp );
      ("RuntimeEnvironment", option_to_yojson runtime_environment_to_yojson x.runtime_environment);
      ( "ApplicationEncryptionConfigurationDescription",
        option_to_yojson application_encryption_configuration_description_to_yojson
          x.application_encryption_configuration_description );
    ]

let describe_application_snapshot_response_to_yojson (x : describe_application_snapshot_response) =
  assoc_to_yojson [ ("SnapshotDetails", Some (snapshot_details_to_yojson x.snapshot_details)) ]

let describe_application_snapshot_request_to_yojson (x : describe_application_snapshot_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("SnapshotName", Some (snapshot_name_to_yojson x.snapshot_name));
    ]

let describe_application_version_response_to_yojson (x : describe_application_version_response) =
  assoc_to_yojson
    [
      ( "ApplicationVersionDetail",
        option_to_yojson application_detail_to_yojson x.application_version_detail );
    ]

let describe_application_version_request_to_yojson (x : describe_application_version_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("ApplicationVersionId", Some (application_version_id_to_yojson x.application_version_id));
    ]

let processed_input_record_to_yojson = string_to_yojson
let processed_input_records_to_yojson tree = list_to_yojson processed_input_record_to_yojson tree
let raw_input_record_to_yojson = string_to_yojson
let raw_input_records_to_yojson tree = list_to_yojson raw_input_record_to_yojson tree

let unable_to_detect_schema_exception_to_yojson (x : unable_to_detect_schema_exception) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("RawInputRecords", option_to_yojson raw_input_records_to_yojson x.raw_input_records);
      ( "ProcessedInputRecords",
        option_to_yojson processed_input_records_to_yojson x.processed_input_records );
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_provisioned_throughput_exceeded_exception_to_yojson
    (x : resource_provisioned_throughput_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

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
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("FileKey", Some (file_key_to_yojson x.file_key));
    ]

let discover_input_schema_request_to_yojson (x : discover_input_schema_request) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("ServiceExecutionRole", Some (role_ar_n_to_yojson x.service_execution_role));
      ( "InputStartingPositionConfiguration",
        option_to_yojson input_starting_position_configuration_to_yojson
          x.input_starting_position_configuration );
      ("S3Configuration", option_to_yojson s3_configuration_to_yojson x.s3_configuration);
      ( "InputProcessingConfiguration",
        option_to_yojson input_processing_configuration_to_yojson x.input_processing_configuration
      );
    ]

let kinesis_analytics_ar_n_to_yojson = string_to_yojson

let update_application_maintenance_configuration_response_to_yojson
    (x : update_application_maintenance_configuration_response) =
  assoc_to_yojson
    [
      ("ApplicationARN", option_to_yojson resource_ar_n_to_yojson x.application_ar_n);
      ( "ApplicationMaintenanceConfigurationDescription",
        option_to_yojson application_maintenance_configuration_description_to_yojson
          x.application_maintenance_configuration_description );
    ]

let update_application_maintenance_configuration_request_to_yojson
    (x : update_application_maintenance_configuration_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "ApplicationMaintenanceConfigurationUpdate",
        Some
          (application_maintenance_configuration_update_to_yojson
             x.application_maintenance_configuration_update) );
    ]

let update_application_response_to_yojson (x : update_application_response) =
  assoc_to_yojson
    [
      ("ApplicationDetail", Some (application_detail_to_yojson x.application_detail));
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let run_configuration_update_to_yojson (x : run_configuration_update) =
  assoc_to_yojson
    [
      ( "FlinkRunConfiguration",
        option_to_yojson flink_run_configuration_to_yojson x.flink_run_configuration );
      ( "ApplicationRestoreConfiguration",
        option_to_yojson application_restore_configuration_to_yojson
          x.application_restore_configuration );
    ]

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        option_to_yojson application_version_id_to_yojson x.current_application_version_id );
      ( "ApplicationConfigurationUpdate",
        option_to_yojson application_configuration_update_to_yojson
          x.application_configuration_update );
      ( "ServiceExecutionRoleUpdate",
        option_to_yojson role_ar_n_to_yojson x.service_execution_role_update );
      ( "RunConfigurationUpdate",
        option_to_yojson run_configuration_update_to_yojson x.run_configuration_update );
      ( "CloudWatchLoggingOptionUpdates",
        option_to_yojson cloud_watch_logging_option_updates_to_yojson
          x.cloud_watch_logging_option_updates );
      ("ConditionalToken", option_to_yojson conditional_token_to_yojson x.conditional_token);
      ( "RuntimeEnvironmentUpdate",
        option_to_yojson runtime_environment_to_yojson x.runtime_environment_update );
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

let stop_application_response_to_yojson (x : stop_application_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let stop_application_request_to_yojson (x : stop_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("Force", option_to_yojson boolean_object_to_yojson x.force);
    ]

let start_application_response_to_yojson (x : start_application_response) =
  assoc_to_yojson [ ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id) ]

let sql_run_configuration_to_yojson (x : sql_run_configuration) =
  assoc_to_yojson
    [
      ("InputId", Some (id_to_yojson x.input_id));
      ( "InputStartingPositionConfiguration",
        Some
          (input_starting_position_configuration_to_yojson x.input_starting_position_configuration)
      );
    ]

let sql_run_configurations_to_yojson tree = list_to_yojson sql_run_configuration_to_yojson tree

let run_configuration_to_yojson (x : run_configuration) =
  assoc_to_yojson
    [
      ( "FlinkRunConfiguration",
        option_to_yojson flink_run_configuration_to_yojson x.flink_run_configuration );
      ( "SqlRunConfigurations",
        option_to_yojson sql_run_configurations_to_yojson x.sql_run_configurations );
      ( "ApplicationRestoreConfiguration",
        option_to_yojson application_restore_configuration_to_yojson
          x.application_restore_configuration );
    ]

let start_application_request_to_yojson (x : start_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("RunConfiguration", option_to_yojson run_configuration_to_yojson x.run_configuration);
    ]

let rollback_application_response_to_yojson (x : rollback_application_response) =
  assoc_to_yojson
    [
      ("ApplicationDetail", Some (application_detail_to_yojson x.application_detail));
      ("OperationId", option_to_yojson operation_id_to_yojson x.operation_id);
    ]

let rollback_application_request_to_yojson (x : rollback_application_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ( "CurrentApplicationVersionId",
        Some (application_version_id_to_yojson x.current_application_version_id) );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (kinesis_analytics_ar_n_to_yojson x.resource_ar_n)) ]

let next_token_to_yojson = string_to_yojson

let list_application_versions_response_to_yojson (x : list_application_versions_response) =
  assoc_to_yojson
    [
      ( "ApplicationVersionSummaries",
        option_to_yojson application_version_summaries_to_yojson x.application_version_summaries );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_application_versions_input_limit_to_yojson = int_to_yojson

let list_application_versions_request_to_yojson (x : list_application_versions_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("Limit", option_to_yojson list_application_versions_input_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let snapshot_summaries_to_yojson tree = list_to_yojson snapshot_details_to_yojson tree

let list_application_snapshots_response_to_yojson (x : list_application_snapshots_response) =
  assoc_to_yojson
    [
      ("SnapshotSummaries", option_to_yojson snapshot_summaries_to_yojson x.snapshot_summaries);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_snapshots_input_limit_to_yojson = int_to_yojson

let list_application_snapshots_request_to_yojson (x : list_application_snapshots_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("Limit", option_to_yojson list_snapshots_input_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_applications_response_to_yojson (x : list_applications_response) =
  assoc_to_yojson
    [
      ("ApplicationSummaries", Some (application_summaries_to_yojson x.application_summaries));
      ("NextToken", option_to_yojson application_name_to_yojson x.next_token);
    ]

let list_applications_input_limit_to_yojson = int_to_yojson

let list_applications_request_to_yojson (x : list_applications_request) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson list_applications_input_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson application_name_to_yojson x.next_token);
    ]

let list_application_operations_response_to_yojson (x : list_application_operations_response) =
  assoc_to_yojson
    [
      ( "ApplicationOperationInfoList",
        option_to_yojson application_operation_info_list_to_yojson x.application_operation_info_list
      );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_application_operations_input_limit_to_yojson = int_to_yojson

let list_application_operations_request_to_yojson (x : list_application_operations_request) =
  assoc_to_yojson
    [
      ("ApplicationName", Some (application_name_to_yojson x.application_name));
      ("Limit", option_to_yojson list_application_operations_input_limit_to_yojson x.limit);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Operation", option_to_yojson operation_to_yojson x.operation);
      ("OperationStatus", option_to_yojson operation_status_to_yojson x.operation_status);
    ]
