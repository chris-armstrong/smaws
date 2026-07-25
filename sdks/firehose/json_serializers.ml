open Smaws_Lib.Json.SerializeHelpers
open Types

let awskms_key_ar_n_to_yojson = string_to_yojson
let awskms_key_arn_for_ss_e_to_yojson = string_to_yojson
let amazon_open_search_serverless_buffering_size_in_m_bs_to_yojson = int_to_yojson
let amazon_open_search_serverless_buffering_interval_in_seconds_to_yojson = int_to_yojson

let amazon_open_search_serverless_buffering_hints_to_yojson
    (x : amazon_open_search_serverless_buffering_hints) =
  assoc_to_yojson
    [
      ( "IntervalInSeconds",
        option_to_yojson amazon_open_search_serverless_buffering_interval_in_seconds_to_yojson
          x.interval_in_seconds );
      ( "SizeInMBs",
        option_to_yojson amazon_open_search_serverless_buffering_size_in_m_bs_to_yojson
          x.size_in_m_bs );
    ]

let amazon_open_search_serverless_collection_endpoint_to_yojson = string_to_yojson
let non_empty_string_without_whitespace_to_yojson = string_to_yojson

let security_group_id_list_to_yojson tree =
  list_to_yojson non_empty_string_without_whitespace_to_yojson tree

let role_ar_n_to_yojson = string_to_yojson

let subnet_id_list_to_yojson tree =
  list_to_yojson non_empty_string_without_whitespace_to_yojson tree

let vpc_configuration_to_yojson (x : vpc_configuration) =
  assoc_to_yojson
    [
      ("SubnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("SecurityGroupIds", Some (security_group_id_list_to_yojson x.security_group_ids));
    ]

let log_stream_name_to_yojson = string_to_yojson
let log_group_name_to_yojson = string_to_yojson
let boolean_object_to_yojson = bool_to_yojson

let cloud_watch_logging_options_to_yojson (x : cloud_watch_logging_options) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
      ("LogGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("LogStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
    ]

let processor_parameter_value_to_yojson = string_to_yojson

let processor_parameter_name_to_yojson (x : processor_parameter_name) =
  match x with
  | LAMBDA_ARN -> `String "LambdaArn"
  | LAMBDA_NUMBER_OF_RETRIES -> `String "NumberOfRetries"
  | METADATA_EXTRACTION_QUERY -> `String "MetadataExtractionQuery"
  | JSON_PARSING_ENGINE -> `String "JsonParsingEngine"
  | ROLE_ARN -> `String "RoleArn"
  | BUFFER_SIZE_IN_MB -> `String "BufferSizeInMBs"
  | BUFFER_INTERVAL_IN_SECONDS -> `String "BufferIntervalInSeconds"
  | SUB_RECORD_TYPE -> `String "SubRecordType"
  | Delimiter -> `String "Delimiter"
  | COMPRESSION_FORMAT -> `String "CompressionFormat"
  | DATA_MESSAGE_EXTRACTION -> `String "DataMessageExtraction"

let processor_parameter_to_yojson (x : processor_parameter) =
  assoc_to_yojson
    [
      ("ParameterName", Some (processor_parameter_name_to_yojson x.parameter_name));
      ("ParameterValue", Some (processor_parameter_value_to_yojson x.parameter_value));
    ]

let processor_parameter_list_to_yojson tree = list_to_yojson processor_parameter_to_yojson tree

let processor_type_to_yojson (x : processor_type) =
  match x with
  | RecordDeAggregation -> `String "RecordDeAggregation"
  | Decompression -> `String "Decompression"
  | CloudWatchLogProcessing -> `String "CloudWatchLogProcessing"
  | Lambda -> `String "Lambda"
  | MetadataExtraction -> `String "MetadataExtraction"
  | AppendDelimiterToRecord -> `String "AppendDelimiterToRecord"

let processor_to_yojson (x : processor) =
  assoc_to_yojson
    [
      ("Type", Some (processor_type_to_yojson x.type_));
      ("Parameters", option_to_yojson processor_parameter_list_to_yojson x.parameters);
    ]

let processor_list_to_yojson tree = list_to_yojson processor_to_yojson tree

let processing_configuration_to_yojson (x : processing_configuration) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
      ("Processors", option_to_yojson processor_list_to_yojson x.processors);
    ]

let kms_encryption_config_to_yojson (x : kms_encryption_config) =
  assoc_to_yojson [ ("AWSKMSKeyARN", Some (awskms_key_ar_n_to_yojson x.awskms_key_ar_n)) ]

let no_encryption_config_to_yojson (x : no_encryption_config) =
  match x with NoEncryption -> `String "NoEncryption"

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ("NoEncryptionConfig", option_to_yojson no_encryption_config_to_yojson x.no_encryption_config);
      ( "KMSEncryptionConfig",
        option_to_yojson kms_encryption_config_to_yojson x.kms_encryption_config );
    ]

let compression_format_to_yojson (x : compression_format) =
  match x with
  | UNCOMPRESSED -> `String "UNCOMPRESSED"
  | GZIP -> `String "GZIP"
  | ZIP -> `String "ZIP"
  | SNAPPY -> `String "Snappy"
  | HADOOP_SNAPPY -> `String "HADOOP_SNAPPY"

let interval_in_seconds_to_yojson = int_to_yojson
let size_in_m_bs_to_yojson = int_to_yojson

let buffering_hints_to_yojson (x : buffering_hints) =
  assoc_to_yojson
    [
      ("SizeInMBs", option_to_yojson size_in_m_bs_to_yojson x.size_in_m_bs);
      ("IntervalInSeconds", option_to_yojson interval_in_seconds_to_yojson x.interval_in_seconds);
    ]

let error_output_prefix_to_yojson = string_to_yojson
let prefix_to_yojson = string_to_yojson
let bucket_ar_n_to_yojson = string_to_yojson

let s3_destination_configuration_to_yojson (x : s3_destination_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ("CompressionFormat", option_to_yojson compression_format_to_yojson x.compression_format);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
    ]

let amazon_open_search_serverless_s3_backup_mode_to_yojson
    (x : amazon_open_search_serverless_s3_backup_mode) =
  match x with
  | FailedDocumentsOnly -> `String "FailedDocumentsOnly"
  | AllDocuments -> `String "AllDocuments"

let amazon_open_search_serverless_retry_duration_in_seconds_to_yojson = int_to_yojson

let amazon_open_search_serverless_retry_options_to_yojson
    (x : amazon_open_search_serverless_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson amazon_open_search_serverless_retry_duration_in_seconds_to_yojson
          x.duration_in_seconds );
    ]

let amazon_open_search_serverless_index_name_to_yojson = string_to_yojson

let amazon_open_search_serverless_destination_configuration_to_yojson
    (x : amazon_open_search_serverless_destination_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ( "CollectionEndpoint",
        option_to_yojson amazon_open_search_serverless_collection_endpoint_to_yojson
          x.collection_endpoint );
      ("IndexName", Some (amazon_open_search_serverless_index_name_to_yojson x.index_name));
      ( "BufferingHints",
        option_to_yojson amazon_open_search_serverless_buffering_hints_to_yojson x.buffering_hints
      );
      ( "RetryOptions",
        option_to_yojson amazon_open_search_serverless_retry_options_to_yojson x.retry_options );
      ( "S3BackupMode",
        option_to_yojson amazon_open_search_serverless_s3_backup_mode_to_yojson x.s3_backup_mode );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
    ]

let vpc_configuration_description_to_yojson (x : vpc_configuration_description) =
  assoc_to_yojson
    [
      ("SubnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("SecurityGroupIds", Some (security_group_id_list_to_yojson x.security_group_ids));
      ("VpcId", Some (non_empty_string_without_whitespace_to_yojson x.vpc_id));
    ]

let s3_destination_description_to_yojson (x : s3_destination_description) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("BufferingHints", Some (buffering_hints_to_yojson x.buffering_hints));
      ("CompressionFormat", Some (compression_format_to_yojson x.compression_format));
      ( "EncryptionConfiguration",
        Some (encryption_configuration_to_yojson x.encryption_configuration) );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
    ]

let amazon_open_search_serverless_destination_description_to_yojson
    (x : amazon_open_search_serverless_destination_description) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "CollectionEndpoint",
        option_to_yojson amazon_open_search_serverless_collection_endpoint_to_yojson
          x.collection_endpoint );
      ("IndexName", option_to_yojson amazon_open_search_serverless_index_name_to_yojson x.index_name);
      ( "BufferingHints",
        option_to_yojson amazon_open_search_serverless_buffering_hints_to_yojson x.buffering_hints
      );
      ( "RetryOptions",
        option_to_yojson amazon_open_search_serverless_retry_options_to_yojson x.retry_options );
      ( "S3BackupMode",
        option_to_yojson amazon_open_search_serverless_s3_backup_mode_to_yojson x.s3_backup_mode );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "VpcConfigurationDescription",
        option_to_yojson vpc_configuration_description_to_yojson x.vpc_configuration_description );
    ]

let s3_destination_update_to_yojson (x : s3_destination_update) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("BucketARN", option_to_yojson bucket_ar_n_to_yojson x.bucket_ar_n);
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ("CompressionFormat", option_to_yojson compression_format_to_yojson x.compression_format);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
    ]

let amazon_open_search_serverless_destination_update_to_yojson
    (x : amazon_open_search_serverless_destination_update) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "CollectionEndpoint",
        option_to_yojson amazon_open_search_serverless_collection_endpoint_to_yojson
          x.collection_endpoint );
      ("IndexName", option_to_yojson amazon_open_search_serverless_index_name_to_yojson x.index_name);
      ( "BufferingHints",
        option_to_yojson amazon_open_search_serverless_buffering_hints_to_yojson x.buffering_hints
      );
      ( "RetryOptions",
        option_to_yojson amazon_open_search_serverless_retry_options_to_yojson x.retry_options );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
    ]

let amazonopensearchservice_buffering_size_in_m_bs_to_yojson = int_to_yojson
let amazonopensearchservice_buffering_interval_in_seconds_to_yojson = int_to_yojson

let amazonopensearchservice_buffering_hints_to_yojson (x : amazonopensearchservice_buffering_hints)
    =
  assoc_to_yojson
    [
      ( "IntervalInSeconds",
        option_to_yojson amazonopensearchservice_buffering_interval_in_seconds_to_yojson
          x.interval_in_seconds );
      ( "SizeInMBs",
        option_to_yojson amazonopensearchservice_buffering_size_in_m_bs_to_yojson x.size_in_m_bs );
    ]

let amazonopensearchservice_cluster_endpoint_to_yojson = string_to_yojson

let default_document_id_format_to_yojson (x : default_document_id_format) =
  match x with
  | FIREHOSE_DEFAULT -> `String "FIREHOSE_DEFAULT"
  | NO_DOCUMENT_ID -> `String "NO_DOCUMENT_ID"

let document_id_options_to_yojson (x : document_id_options) =
  assoc_to_yojson
    [
      ( "DefaultDocumentIdFormat",
        Some (default_document_id_format_to_yojson x.default_document_id_format) );
    ]

let amazonopensearchservice_s3_backup_mode_to_yojson (x : amazonopensearchservice_s3_backup_mode) =
  match x with
  | FailedDocumentsOnly -> `String "FailedDocumentsOnly"
  | AllDocuments -> `String "AllDocuments"

let amazonopensearchservice_retry_duration_in_seconds_to_yojson = int_to_yojson

let amazonopensearchservice_retry_options_to_yojson (x : amazonopensearchservice_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson amazonopensearchservice_retry_duration_in_seconds_to_yojson
          x.duration_in_seconds );
    ]

let amazonopensearchservice_index_rotation_period_to_yojson
    (x : amazonopensearchservice_index_rotation_period) =
  match x with
  | NoRotation -> `String "NoRotation"
  | OneHour -> `String "OneHour"
  | OneDay -> `String "OneDay"
  | OneWeek -> `String "OneWeek"
  | OneMonth -> `String "OneMonth"

let amazonopensearchservice_type_name_to_yojson = string_to_yojson
let amazonopensearchservice_index_name_to_yojson = string_to_yojson
let amazonopensearchservice_domain_ar_n_to_yojson = string_to_yojson

let amazonopensearchservice_destination_configuration_to_yojson
    (x : amazonopensearchservice_destination_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("DomainARN", option_to_yojson amazonopensearchservice_domain_ar_n_to_yojson x.domain_ar_n);
      ( "ClusterEndpoint",
        option_to_yojson amazonopensearchservice_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("IndexName", Some (amazonopensearchservice_index_name_to_yojson x.index_name));
      ("TypeName", option_to_yojson amazonopensearchservice_type_name_to_yojson x.type_name);
      ( "IndexRotationPeriod",
        option_to_yojson amazonopensearchservice_index_rotation_period_to_yojson
          x.index_rotation_period );
      ( "BufferingHints",
        option_to_yojson amazonopensearchservice_buffering_hints_to_yojson x.buffering_hints );
      ( "RetryOptions",
        option_to_yojson amazonopensearchservice_retry_options_to_yojson x.retry_options );
      ( "S3BackupMode",
        option_to_yojson amazonopensearchservice_s3_backup_mode_to_yojson x.s3_backup_mode );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
    ]

let amazonopensearchservice_destination_description_to_yojson
    (x : amazonopensearchservice_destination_description) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("DomainARN", option_to_yojson amazonopensearchservice_domain_ar_n_to_yojson x.domain_ar_n);
      ( "ClusterEndpoint",
        option_to_yojson amazonopensearchservice_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("IndexName", option_to_yojson amazonopensearchservice_index_name_to_yojson x.index_name);
      ("TypeName", option_to_yojson amazonopensearchservice_type_name_to_yojson x.type_name);
      ( "IndexRotationPeriod",
        option_to_yojson amazonopensearchservice_index_rotation_period_to_yojson
          x.index_rotation_period );
      ( "BufferingHints",
        option_to_yojson amazonopensearchservice_buffering_hints_to_yojson x.buffering_hints );
      ( "RetryOptions",
        option_to_yojson amazonopensearchservice_retry_options_to_yojson x.retry_options );
      ( "S3BackupMode",
        option_to_yojson amazonopensearchservice_s3_backup_mode_to_yojson x.s3_backup_mode );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "VpcConfigurationDescription",
        option_to_yojson vpc_configuration_description_to_yojson x.vpc_configuration_description );
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
    ]

let amazonopensearchservice_destination_update_to_yojson
    (x : amazonopensearchservice_destination_update) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("DomainARN", option_to_yojson amazonopensearchservice_domain_ar_n_to_yojson x.domain_ar_n);
      ( "ClusterEndpoint",
        option_to_yojson amazonopensearchservice_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("IndexName", option_to_yojson amazonopensearchservice_index_name_to_yojson x.index_name);
      ("TypeName", option_to_yojson amazonopensearchservice_type_name_to_yojson x.type_name);
      ( "IndexRotationPeriod",
        option_to_yojson amazonopensearchservice_index_rotation_period_to_yojson
          x.index_rotation_period );
      ( "BufferingHints",
        option_to_yojson amazonopensearchservice_buffering_hints_to_yojson x.buffering_hints );
      ( "RetryOptions",
        option_to_yojson amazonopensearchservice_retry_options_to_yojson x.retry_options );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
    ]

let connectivity_to_yojson (x : connectivity) =
  match x with PUBLIC -> `String "PUBLIC" | PRIVATE -> `String "PRIVATE"

let authentication_configuration_to_yojson (x : authentication_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("Connectivity", Some (connectivity_to_yojson x.connectivity));
    ]

let block_size_bytes_to_yojson = int_to_yojson
let warehouse_location_to_yojson = string_to_yojson
let glue_data_catalog_ar_n_to_yojson = string_to_yojson

let catalog_configuration_to_yojson (x : catalog_configuration) =
  assoc_to_yojson
    [
      ("CatalogARN", option_to_yojson glue_data_catalog_ar_n_to_yojson x.catalog_ar_n);
      ("WarehouseLocation", option_to_yojson warehouse_location_to_yojson x.warehouse_location);
    ]

let cluster_jdbcur_l_to_yojson = string_to_yojson
let non_empty_string_to_yojson = string_to_yojson

let column_to_json_key_mappings_to_yojson tree =
  map_to_yojson non_empty_string_without_whitespace_to_yojson non_empty_string_to_yojson tree

let error_message_to_yojson = string_to_yojson

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let content_encoding_to_yojson (x : content_encoding) =
  match x with NONE -> `String "NONE" | GZIP -> `String "GZIP"

let copy_options_to_yojson = string_to_yojson
let data_table_columns_to_yojson = string_to_yojson
let data_table_name_to_yojson = string_to_yojson

let copy_command_to_yojson (x : copy_command) =
  assoc_to_yojson
    [
      ("DataTableName", Some (data_table_name_to_yojson x.data_table_name));
      ("DataTableColumns", option_to_yojson data_table_columns_to_yojson x.data_table_columns);
      ("CopyOptions", option_to_yojson copy_options_to_yojson x.copy_options);
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let error_code_to_yojson = string_to_yojson

let invalid_kms_resource_exception_to_yojson (x : invalid_kms_resource_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson error_code_to_yojson x.code);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let invalid_argument_exception_to_yojson (x : invalid_argument_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delivery_stream_ar_n_to_yojson = string_to_yojson

let create_delivery_stream_output_to_yojson (x : create_delivery_stream_output) =
  assoc_to_yojson
    [
      ("DeliveryStreamARN", option_to_yojson delivery_stream_ar_n_to_yojson x.delivery_stream_ar_n);
    ]

let vpc_endpoint_service_name_to_yojson = string_to_yojson

let database_source_vpc_configuration_to_yojson (x : database_source_vpc_configuration) =
  assoc_to_yojson
    [
      ( "VpcEndpointServiceName",
        Some (vpc_endpoint_service_name_to_yojson x.vpc_endpoint_service_name) );
    ]

let secret_ar_n_to_yojson = string_to_yojson

let secrets_manager_configuration_to_yojson (x : secrets_manager_configuration) =
  assoc_to_yojson
    [
      ("SecretARN", option_to_yojson secret_ar_n_to_yojson x.secret_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("Enabled", Some (boolean_object_to_yojson x.enabled));
    ]

let database_source_authentication_configuration_to_yojson
    (x : database_source_authentication_configuration) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        Some (secrets_manager_configuration_to_yojson x.secrets_manager_configuration) );
    ]

let database_table_name_to_yojson = string_to_yojson

let database_surrogate_key_list_to_yojson tree =
  list_to_yojson non_empty_string_without_whitespace_to_yojson tree

let database_column_name_to_yojson = string_to_yojson

let database_column_include_or_exclude_list_to_yojson tree =
  list_to_yojson database_column_name_to_yojson tree

let database_column_list_to_yojson (x : database_column_list) =
  assoc_to_yojson
    [
      ("Include", option_to_yojson database_column_include_or_exclude_list_to_yojson x.include_);
      ("Exclude", option_to_yojson database_column_include_or_exclude_list_to_yojson x.exclude);
    ]

let database_table_include_or_exclude_list_to_yojson tree =
  list_to_yojson database_table_name_to_yojson tree

let database_table_list_to_yojson (x : database_table_list) =
  assoc_to_yojson
    [
      ("Include", option_to_yojson database_table_include_or_exclude_list_to_yojson x.include_);
      ("Exclude", option_to_yojson database_table_include_or_exclude_list_to_yojson x.exclude);
    ]

let database_name_to_yojson = string_to_yojson
let database_include_or_exclude_list_to_yojson tree = list_to_yojson database_name_to_yojson tree

let database_list_to_yojson (x : database_list) =
  assoc_to_yojson
    [
      ("Include", option_to_yojson database_include_or_exclude_list_to_yojson x.include_);
      ("Exclude", option_to_yojson database_include_or_exclude_list_to_yojson x.exclude);
    ]

let ssl_mode_to_yojson (x : ssl_mode) =
  match x with Disabled -> `String "Disabled" | Enabled -> `String "Enabled"

let database_port_to_yojson = int_to_yojson
let database_endpoint_to_yojson = string_to_yojson

let database_type_to_yojson (x : database_type) =
  match x with MySQL -> `String "MySQL" | PostgreSQL -> `String "PostgreSQL"

let database_source_configuration_to_yojson (x : database_source_configuration) =
  assoc_to_yojson
    [
      ("Type", Some (database_type_to_yojson x.type_));
      ("Endpoint", Some (database_endpoint_to_yojson x.endpoint));
      ("Port", Some (database_port_to_yojson x.port));
      ("SSLMode", option_to_yojson ssl_mode_to_yojson x.ssl_mode);
      ("Databases", Some (database_list_to_yojson x.databases));
      ("Tables", Some (database_table_list_to_yojson x.tables));
      ("Columns", option_to_yojson database_column_list_to_yojson x.columns);
      ("SurrogateKeys", option_to_yojson database_surrogate_key_list_to_yojson x.surrogate_keys);
      ("SnapshotWatermarkTable", Some (database_table_name_to_yojson x.snapshot_watermark_table));
      ( "DatabaseSourceAuthenticationConfiguration",
        Some
          (database_source_authentication_configuration_to_yojson
             x.database_source_authentication_configuration) );
      ( "DatabaseSourceVPCConfiguration",
        Some (database_source_vpc_configuration_to_yojson x.database_source_vpc_configuration) );
    ]

let retry_duration_in_seconds_to_yojson = int_to_yojson

let retry_options_to_yojson (x : retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let iceberg_s3_backup_mode_to_yojson (x : iceberg_s3_backup_mode) =
  match x with FailedDataOnly -> `String "FailedDataOnly" | AllData -> `String "AllData"

let table_creation_configuration_to_yojson (x : table_creation_configuration) =
  assoc_to_yojson [ ("Enabled", Some (boolean_object_to_yojson x.enabled)) ]

let schema_evolution_configuration_to_yojson (x : schema_evolution_configuration) =
  assoc_to_yojson [ ("Enabled", Some (boolean_object_to_yojson x.enabled)) ]

let partition_field_to_yojson (x : partition_field) =
  assoc_to_yojson
    [ ("SourceName", Some (non_empty_string_without_whitespace_to_yojson x.source_name)) ]

let partition_fields_to_yojson tree = list_to_yojson partition_field_to_yojson tree

let partition_spec_to_yojson (x : partition_spec) =
  assoc_to_yojson [ ("Identity", option_to_yojson partition_fields_to_yojson x.identity) ]

let list_of_non_empty_strings_without_whitespace_to_yojson tree =
  list_to_yojson non_empty_string_without_whitespace_to_yojson tree

let string_with_letters_digits_underscores_dots_to_yojson = string_to_yojson

let destination_table_configuration_to_yojson (x : destination_table_configuration) =
  assoc_to_yojson
    [
      ( "DestinationTableName",
        Some (string_with_letters_digits_underscores_dots_to_yojson x.destination_table_name) );
      ( "DestinationDatabaseName",
        Some (string_with_letters_digits_underscores_dots_to_yojson x.destination_database_name) );
      ( "UniqueKeys",
        option_to_yojson list_of_non_empty_strings_without_whitespace_to_yojson x.unique_keys );
      ("PartitionSpec", option_to_yojson partition_spec_to_yojson x.partition_spec);
      ( "S3ErrorOutputPrefix",
        option_to_yojson error_output_prefix_to_yojson x.s3_error_output_prefix );
    ]

let destination_table_configuration_list_to_yojson tree =
  list_to_yojson destination_table_configuration_to_yojson tree

let iceberg_destination_configuration_to_yojson (x : iceberg_destination_configuration) =
  assoc_to_yojson
    [
      ( "DestinationTableConfigurationList",
        option_to_yojson destination_table_configuration_list_to_yojson
          x.destination_table_configuration_list );
      ( "SchemaEvolutionConfiguration",
        option_to_yojson schema_evolution_configuration_to_yojson x.schema_evolution_configuration
      );
      ( "TableCreationConfiguration",
        option_to_yojson table_creation_configuration_to_yojson x.table_creation_configuration );
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson iceberg_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson retry_options_to_yojson x.retry_options);
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("AppendOnly", option_to_yojson boolean_object_to_yojson x.append_only);
      ("CatalogConfiguration", Some (catalog_configuration_to_yojson x.catalog_configuration));
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
    ]

let snowflake_buffering_interval_in_seconds_to_yojson = int_to_yojson
let snowflake_buffering_size_in_m_bs_to_yojson = int_to_yojson

let snowflake_buffering_hints_to_yojson (x : snowflake_buffering_hints) =
  assoc_to_yojson
    [
      ("SizeInMBs", option_to_yojson snowflake_buffering_size_in_m_bs_to_yojson x.size_in_m_bs);
      ( "IntervalInSeconds",
        option_to_yojson snowflake_buffering_interval_in_seconds_to_yojson x.interval_in_seconds );
    ]

let snowflake_s3_backup_mode_to_yojson (x : snowflake_s3_backup_mode) =
  match x with FailedDataOnly -> `String "FailedDataOnly" | AllData -> `String "AllData"

let snowflake_retry_duration_in_seconds_to_yojson = int_to_yojson

let snowflake_retry_options_to_yojson (x : snowflake_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson snowflake_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let snowflake_private_link_vpce_id_to_yojson = string_to_yojson

let snowflake_vpc_configuration_to_yojson (x : snowflake_vpc_configuration) =
  assoc_to_yojson
    [
      ("PrivateLinkVpceId", Some (snowflake_private_link_vpce_id_to_yojson x.private_link_vpce_id));
    ]

let snowflake_content_column_name_to_yojson = string_to_yojson
let snowflake_meta_data_column_name_to_yojson = string_to_yojson

let snowflake_data_loading_option_to_yojson (x : snowflake_data_loading_option) =
  match x with
  | JSON_MAPPING -> `String "JSON_MAPPING"
  | VARIANT_CONTENT_MAPPING -> `String "VARIANT_CONTENT_MAPPING"
  | VARIANT_CONTENT_AND_METADATA_MAPPING -> `String "VARIANT_CONTENT_AND_METADATA_MAPPING"

let snowflake_role_to_yojson = string_to_yojson

let snowflake_role_configuration_to_yojson (x : snowflake_role_configuration) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
      ("SnowflakeRole", option_to_yojson snowflake_role_to_yojson x.snowflake_role);
    ]

let snowflake_table_to_yojson = string_to_yojson
let snowflake_schema_to_yojson = string_to_yojson
let snowflake_database_to_yojson = string_to_yojson
let snowflake_user_to_yojson = string_to_yojson
let snowflake_key_passphrase_to_yojson = string_to_yojson
let snowflake_private_key_to_yojson = string_to_yojson
let snowflake_account_url_to_yojson = string_to_yojson

let snowflake_destination_configuration_to_yojson (x : snowflake_destination_configuration) =
  assoc_to_yojson
    [
      ("AccountUrl", Some (snowflake_account_url_to_yojson x.account_url));
      ("PrivateKey", option_to_yojson snowflake_private_key_to_yojson x.private_key);
      ("KeyPassphrase", option_to_yojson snowflake_key_passphrase_to_yojson x.key_passphrase);
      ("User", option_to_yojson snowflake_user_to_yojson x.user);
      ("Database", Some (snowflake_database_to_yojson x.database));
      ("Schema", Some (snowflake_schema_to_yojson x.schema));
      ("Table", Some (snowflake_table_to_yojson x.table));
      ( "SnowflakeRoleConfiguration",
        option_to_yojson snowflake_role_configuration_to_yojson x.snowflake_role_configuration );
      ( "DataLoadingOption",
        option_to_yojson snowflake_data_loading_option_to_yojson x.data_loading_option );
      ( "MetaDataColumnName",
        option_to_yojson snowflake_meta_data_column_name_to_yojson x.meta_data_column_name );
      ( "ContentColumnName",
        option_to_yojson snowflake_content_column_name_to_yojson x.content_column_name );
      ( "SnowflakeVpcConfiguration",
        option_to_yojson snowflake_vpc_configuration_to_yojson x.snowflake_vpc_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("RetryOptions", option_to_yojson snowflake_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson snowflake_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("BufferingHints", option_to_yojson snowflake_buffering_hints_to_yojson x.buffering_hints);
    ]

let read_from_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let topic_name_to_yojson = string_to_yojson
let msk_cluster_ar_n_to_yojson = string_to_yojson

let msk_source_configuration_to_yojson (x : msk_source_configuration) =
  assoc_to_yojson
    [
      ("MSKClusterARN", Some (msk_cluster_ar_n_to_yojson x.msk_cluster_ar_n));
      ("TopicName", Some (topic_name_to_yojson x.topic_name));
      ( "AuthenticationConfiguration",
        Some (authentication_configuration_to_yojson x.authentication_configuration) );
      ("ReadFromTimestamp", option_to_yojson read_from_timestamp_to_yojson x.read_from_timestamp);
    ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_delivery_stream_input_tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let http_endpoint_s3_backup_mode_to_yojson (x : http_endpoint_s3_backup_mode) =
  match x with FailedDataOnly -> `String "FailedDataOnly" | AllData -> `String "AllData"

let http_endpoint_retry_duration_in_seconds_to_yojson = int_to_yojson

let http_endpoint_retry_options_to_yojson (x : http_endpoint_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson http_endpoint_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let http_endpoint_attribute_value_to_yojson = string_to_yojson
let http_endpoint_attribute_name_to_yojson = string_to_yojson

let http_endpoint_common_attribute_to_yojson (x : http_endpoint_common_attribute) =
  assoc_to_yojson
    [
      ("AttributeName", Some (http_endpoint_attribute_name_to_yojson x.attribute_name));
      ("AttributeValue", Some (http_endpoint_attribute_value_to_yojson x.attribute_value));
    ]

let http_endpoint_common_attributes_list_to_yojson tree =
  list_to_yojson http_endpoint_common_attribute_to_yojson tree

let http_endpoint_request_configuration_to_yojson (x : http_endpoint_request_configuration) =
  assoc_to_yojson
    [
      ("ContentEncoding", option_to_yojson content_encoding_to_yojson x.content_encoding);
      ( "CommonAttributes",
        option_to_yojson http_endpoint_common_attributes_list_to_yojson x.common_attributes );
    ]

let http_endpoint_buffering_interval_in_seconds_to_yojson = int_to_yojson
let http_endpoint_buffering_size_in_m_bs_to_yojson = int_to_yojson

let http_endpoint_buffering_hints_to_yojson (x : http_endpoint_buffering_hints) =
  assoc_to_yojson
    [
      ("SizeInMBs", option_to_yojson http_endpoint_buffering_size_in_m_bs_to_yojson x.size_in_m_bs);
      ( "IntervalInSeconds",
        option_to_yojson http_endpoint_buffering_interval_in_seconds_to_yojson x.interval_in_seconds
      );
    ]

let http_endpoint_access_key_to_yojson = string_to_yojson
let http_endpoint_name_to_yojson = string_to_yojson
let http_endpoint_url_to_yojson = string_to_yojson

let http_endpoint_configuration_to_yojson (x : http_endpoint_configuration) =
  assoc_to_yojson
    [
      ("Url", Some (http_endpoint_url_to_yojson x.url));
      ("Name", option_to_yojson http_endpoint_name_to_yojson x.name);
      ("AccessKey", option_to_yojson http_endpoint_access_key_to_yojson x.access_key);
    ]

let http_endpoint_destination_configuration_to_yojson (x : http_endpoint_destination_configuration)
    =
  assoc_to_yojson
    [
      ( "EndpointConfiguration",
        Some (http_endpoint_configuration_to_yojson x.endpoint_configuration) );
      ("BufferingHints", option_to_yojson http_endpoint_buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "RequestConfiguration",
        option_to_yojson http_endpoint_request_configuration_to_yojson x.request_configuration );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RetryOptions", option_to_yojson http_endpoint_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson http_endpoint_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let splunk_buffering_size_in_m_bs_to_yojson = int_to_yojson
let splunk_buffering_interval_in_seconds_to_yojson = int_to_yojson

let splunk_buffering_hints_to_yojson (x : splunk_buffering_hints) =
  assoc_to_yojson
    [
      ( "IntervalInSeconds",
        option_to_yojson splunk_buffering_interval_in_seconds_to_yojson x.interval_in_seconds );
      ("SizeInMBs", option_to_yojson splunk_buffering_size_in_m_bs_to_yojson x.size_in_m_bs);
    ]

let splunk_s3_backup_mode_to_yojson (x : splunk_s3_backup_mode) =
  match x with FailedEventsOnly -> `String "FailedEventsOnly" | AllEvents -> `String "AllEvents"

let splunk_retry_duration_in_seconds_to_yojson = int_to_yojson

let splunk_retry_options_to_yojson (x : splunk_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson splunk_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let hec_acknowledgment_timeout_in_seconds_to_yojson = int_to_yojson
let hec_token_to_yojson = string_to_yojson

let hec_endpoint_type_to_yojson (x : hec_endpoint_type) =
  match x with Raw -> `String "Raw" | Event -> `String "Event"

let hec_endpoint_to_yojson = string_to_yojson

let splunk_destination_configuration_to_yojson (x : splunk_destination_configuration) =
  assoc_to_yojson
    [
      ("HECEndpoint", Some (hec_endpoint_to_yojson x.hec_endpoint));
      ("HECEndpointType", Some (hec_endpoint_type_to_yojson x.hec_endpoint_type));
      ("HECToken", option_to_yojson hec_token_to_yojson x.hec_token);
      ( "HECAcknowledgmentTimeoutInSeconds",
        option_to_yojson hec_acknowledgment_timeout_in_seconds_to_yojson
          x.hec_acknowledgment_timeout_in_seconds );
      ("RetryOptions", option_to_yojson splunk_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson splunk_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson splunk_buffering_hints_to_yojson x.buffering_hints);
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let elasticsearch_s3_backup_mode_to_yojson (x : elasticsearch_s3_backup_mode) =
  match x with
  | FailedDocumentsOnly -> `String "FailedDocumentsOnly"
  | AllDocuments -> `String "AllDocuments"

let elasticsearch_retry_duration_in_seconds_to_yojson = int_to_yojson

let elasticsearch_retry_options_to_yojson (x : elasticsearch_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson elasticsearch_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let elasticsearch_buffering_size_in_m_bs_to_yojson = int_to_yojson
let elasticsearch_buffering_interval_in_seconds_to_yojson = int_to_yojson

let elasticsearch_buffering_hints_to_yojson (x : elasticsearch_buffering_hints) =
  assoc_to_yojson
    [
      ( "IntervalInSeconds",
        option_to_yojson elasticsearch_buffering_interval_in_seconds_to_yojson x.interval_in_seconds
      );
      ("SizeInMBs", option_to_yojson elasticsearch_buffering_size_in_m_bs_to_yojson x.size_in_m_bs);
    ]

let elasticsearch_index_rotation_period_to_yojson (x : elasticsearch_index_rotation_period) =
  match x with
  | NoRotation -> `String "NoRotation"
  | OneHour -> `String "OneHour"
  | OneDay -> `String "OneDay"
  | OneWeek -> `String "OneWeek"
  | OneMonth -> `String "OneMonth"

let elasticsearch_type_name_to_yojson = string_to_yojson
let elasticsearch_index_name_to_yojson = string_to_yojson
let elasticsearch_cluster_endpoint_to_yojson = string_to_yojson
let elasticsearch_domain_ar_n_to_yojson = string_to_yojson

let elasticsearch_destination_configuration_to_yojson (x : elasticsearch_destination_configuration)
    =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("DomainARN", option_to_yojson elasticsearch_domain_ar_n_to_yojson x.domain_ar_n);
      ( "ClusterEndpoint",
        option_to_yojson elasticsearch_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("IndexName", Some (elasticsearch_index_name_to_yojson x.index_name));
      ("TypeName", option_to_yojson elasticsearch_type_name_to_yojson x.type_name);
      ( "IndexRotationPeriod",
        option_to_yojson elasticsearch_index_rotation_period_to_yojson x.index_rotation_period );
      ("BufferingHints", option_to_yojson elasticsearch_buffering_hints_to_yojson x.buffering_hints);
      ("RetryOptions", option_to_yojson elasticsearch_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson elasticsearch_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
    ]

let redshift_s3_backup_mode_to_yojson (x : redshift_s3_backup_mode) =
  match x with Disabled -> `String "Disabled" | Enabled -> `String "Enabled"

let redshift_retry_duration_in_seconds_to_yojson = int_to_yojson

let redshift_retry_options_to_yojson (x : redshift_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson redshift_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let password_to_yojson = string_to_yojson
let username_to_yojson = string_to_yojson

let redshift_destination_configuration_to_yojson (x : redshift_destination_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("ClusterJDBCURL", Some (cluster_jdbcur_l_to_yojson x.cluster_jdbcur_l));
      ("CopyCommand", Some (copy_command_to_yojson x.copy_command));
      ("Username", option_to_yojson username_to_yojson x.username);
      ("Password", option_to_yojson password_to_yojson x.password);
      ("RetryOptions", option_to_yojson redshift_retry_options_to_yojson x.retry_options);
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson redshift_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "S3BackupConfiguration",
        option_to_yojson s3_destination_configuration_to_yojson x.s3_backup_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let custom_time_zone_to_yojson = string_to_yojson
let file_extension_to_yojson = string_to_yojson

let dynamic_partitioning_configuration_to_yojson (x : dynamic_partitioning_configuration) =
  assoc_to_yojson
    [
      ("RetryOptions", option_to_yojson retry_options_to_yojson x.retry_options);
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
    ]

let orc_format_version_to_yojson (x : orc_format_version) =
  match x with V0_11 -> `String "V0_11" | V0_12 -> `String "V0_12"

let proportion_to_yojson = double_to_yojson

let orc_compression_to_yojson (x : orc_compression) =
  match x with NONE -> `String "NONE" | ZLIB -> `String "ZLIB" | SNAPPY -> `String "SNAPPY"

let orc_row_index_stride_to_yojson = int_to_yojson
let orc_stripe_size_bytes_to_yojson = int_to_yojson

let orc_ser_de_to_yojson (x : orc_ser_de) =
  assoc_to_yojson
    [
      ("StripeSizeBytes", option_to_yojson orc_stripe_size_bytes_to_yojson x.stripe_size_bytes);
      ("BlockSizeBytes", option_to_yojson block_size_bytes_to_yojson x.block_size_bytes);
      ("RowIndexStride", option_to_yojson orc_row_index_stride_to_yojson x.row_index_stride);
      ("EnablePadding", option_to_yojson boolean_object_to_yojson x.enable_padding);
      ("PaddingTolerance", option_to_yojson proportion_to_yojson x.padding_tolerance);
      ("Compression", option_to_yojson orc_compression_to_yojson x.compression);
      ( "BloomFilterColumns",
        option_to_yojson list_of_non_empty_strings_without_whitespace_to_yojson
          x.bloom_filter_columns );
      ( "BloomFilterFalsePositiveProbability",
        option_to_yojson proportion_to_yojson x.bloom_filter_false_positive_probability );
      ("DictionaryKeyThreshold", option_to_yojson proportion_to_yojson x.dictionary_key_threshold);
      ("FormatVersion", option_to_yojson orc_format_version_to_yojson x.format_version);
    ]

let parquet_writer_version_to_yojson (x : parquet_writer_version) =
  match x with V1 -> `String "V1" | V2 -> `String "V2"

let non_negative_integer_object_to_yojson = int_to_yojson

let parquet_compression_to_yojson (x : parquet_compression) =
  match x with
  | UNCOMPRESSED -> `String "UNCOMPRESSED"
  | GZIP -> `String "GZIP"
  | SNAPPY -> `String "SNAPPY"

let parquet_page_size_bytes_to_yojson = int_to_yojson

let parquet_ser_de_to_yojson (x : parquet_ser_de) =
  assoc_to_yojson
    [
      ("BlockSizeBytes", option_to_yojson block_size_bytes_to_yojson x.block_size_bytes);
      ("PageSizeBytes", option_to_yojson parquet_page_size_bytes_to_yojson x.page_size_bytes);
      ("Compression", option_to_yojson parquet_compression_to_yojson x.compression);
      ( "EnableDictionaryCompression",
        option_to_yojson boolean_object_to_yojson x.enable_dictionary_compression );
      ("MaxPaddingBytes", option_to_yojson non_negative_integer_object_to_yojson x.max_padding_bytes);
      ("WriterVersion", option_to_yojson parquet_writer_version_to_yojson x.writer_version);
    ]

let serializer_to_yojson (x : serializer) =
  assoc_to_yojson
    [
      ("ParquetSerDe", option_to_yojson parquet_ser_de_to_yojson x.parquet_ser_de);
      ("OrcSerDe", option_to_yojson orc_ser_de_to_yojson x.orc_ser_de);
    ]

let output_format_configuration_to_yojson (x : output_format_configuration) =
  assoc_to_yojson [ ("Serializer", option_to_yojson serializer_to_yojson x.serializer) ]

let list_of_non_empty_strings_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let hive_json_ser_de_to_yojson (x : hive_json_ser_de) =
  assoc_to_yojson
    [
      ("TimestampFormats", option_to_yojson list_of_non_empty_strings_to_yojson x.timestamp_formats);
    ]

let open_x_json_ser_de_to_yojson (x : open_x_json_ser_de) =
  assoc_to_yojson
    [
      ( "ConvertDotsInJsonKeysToUnderscores",
        option_to_yojson boolean_object_to_yojson x.convert_dots_in_json_keys_to_underscores );
      ("CaseInsensitive", option_to_yojson boolean_object_to_yojson x.case_insensitive);
      ( "ColumnToJsonKeyMappings",
        option_to_yojson column_to_json_key_mappings_to_yojson x.column_to_json_key_mappings );
    ]

let deserializer_to_yojson (x : deserializer) =
  assoc_to_yojson
    [
      ("OpenXJsonSerDe", option_to_yojson open_x_json_ser_de_to_yojson x.open_x_json_ser_de);
      ("HiveJsonSerDe", option_to_yojson hive_json_ser_de_to_yojson x.hive_json_ser_de);
    ]

let input_format_configuration_to_yojson (x : input_format_configuration) =
  assoc_to_yojson [ ("Deserializer", option_to_yojson deserializer_to_yojson x.deserializer) ]

let schema_configuration_to_yojson (x : schema_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson non_empty_string_without_whitespace_to_yojson x.role_ar_n);
      ("CatalogId", option_to_yojson non_empty_string_without_whitespace_to_yojson x.catalog_id);
      ( "DatabaseName",
        option_to_yojson non_empty_string_without_whitespace_to_yojson x.database_name );
      ("TableName", option_to_yojson non_empty_string_without_whitespace_to_yojson x.table_name);
      ("Region", option_to_yojson non_empty_string_without_whitespace_to_yojson x.region);
      ("VersionId", option_to_yojson non_empty_string_without_whitespace_to_yojson x.version_id);
    ]

let data_format_conversion_configuration_to_yojson (x : data_format_conversion_configuration) =
  assoc_to_yojson
    [
      ("SchemaConfiguration", option_to_yojson schema_configuration_to_yojson x.schema_configuration);
      ( "InputFormatConfiguration",
        option_to_yojson input_format_configuration_to_yojson x.input_format_configuration );
      ( "OutputFormatConfiguration",
        option_to_yojson output_format_configuration_to_yojson x.output_format_configuration );
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
    ]

let s3_backup_mode_to_yojson (x : s3_backup_mode) =
  match x with Disabled -> `String "Disabled" | Enabled -> `String "Enabled"

let extended_s3_destination_configuration_to_yojson (x : extended_s3_destination_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ("CompressionFormat", option_to_yojson compression_format_to_yojson x.compression_format);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "S3BackupConfiguration",
        option_to_yojson s3_destination_configuration_to_yojson x.s3_backup_configuration );
      ( "DataFormatConversionConfiguration",
        option_to_yojson data_format_conversion_configuration_to_yojson
          x.data_format_conversion_configuration );
      ( "DynamicPartitioningConfiguration",
        option_to_yojson dynamic_partitioning_configuration_to_yojson
          x.dynamic_partitioning_configuration );
      ("FileExtension", option_to_yojson file_extension_to_yojson x.file_extension);
      ("CustomTimeZone", option_to_yojson custom_time_zone_to_yojson x.custom_time_zone);
    ]

let key_type_to_yojson (x : key_type) =
  match x with
  | AWS_OWNED_CMK -> `String "AWS_OWNED_CMK"
  | CUSTOMER_MANAGED_CMK -> `String "CUSTOMER_MANAGED_CMK"

let delivery_stream_encryption_configuration_input_to_yojson
    (x : delivery_stream_encryption_configuration_input) =
  assoc_to_yojson
    [
      ("KeyARN", option_to_yojson awskms_key_arn_for_ss_e_to_yojson x.key_ar_n);
      ("KeyType", Some (key_type_to_yojson x.key_type));
    ]

let kinesis_stream_ar_n_to_yojson = string_to_yojson

let kinesis_stream_source_configuration_to_yojson (x : kinesis_stream_source_configuration) =
  assoc_to_yojson
    [
      ("KinesisStreamARN", Some (kinesis_stream_ar_n_to_yojson x.kinesis_stream_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let throughput_hint_in_m_bs_to_yojson = int_to_yojson

let direct_put_source_configuration_to_yojson (x : direct_put_source_configuration) =
  assoc_to_yojson
    [ ("ThroughputHintInMBs", Some (throughput_hint_in_m_bs_to_yojson x.throughput_hint_in_m_bs)) ]

let delivery_stream_type_to_yojson (x : delivery_stream_type) =
  match x with
  | DirectPut -> `String "DirectPut"
  | KinesisStreamAsSource -> `String "KinesisStreamAsSource"
  | MSKAsSource -> `String "MSKAsSource"
  | DatabaseAsSource -> `String "DatabaseAsSource"

let delivery_stream_name_to_yojson = string_to_yojson

let create_delivery_stream_input_to_yojson (x : create_delivery_stream_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("DeliveryStreamType", option_to_yojson delivery_stream_type_to_yojson x.delivery_stream_type);
      ( "DirectPutSourceConfiguration",
        option_to_yojson direct_put_source_configuration_to_yojson x.direct_put_source_configuration
      );
      ( "KinesisStreamSourceConfiguration",
        option_to_yojson kinesis_stream_source_configuration_to_yojson
          x.kinesis_stream_source_configuration );
      ( "DeliveryStreamEncryptionConfigurationInput",
        option_to_yojson delivery_stream_encryption_configuration_input_to_yojson
          x.delivery_stream_encryption_configuration_input );
      ( "S3DestinationConfiguration",
        option_to_yojson s3_destination_configuration_to_yojson x.s3_destination_configuration );
      ( "ExtendedS3DestinationConfiguration",
        option_to_yojson extended_s3_destination_configuration_to_yojson
          x.extended_s3_destination_configuration );
      ( "RedshiftDestinationConfiguration",
        option_to_yojson redshift_destination_configuration_to_yojson
          x.redshift_destination_configuration );
      ( "ElasticsearchDestinationConfiguration",
        option_to_yojson elasticsearch_destination_configuration_to_yojson
          x.elasticsearch_destination_configuration );
      ( "AmazonopensearchserviceDestinationConfiguration",
        option_to_yojson amazonopensearchservice_destination_configuration_to_yojson
          x.amazonopensearchservice_destination_configuration );
      ( "SplunkDestinationConfiguration",
        option_to_yojson splunk_destination_configuration_to_yojson
          x.splunk_destination_configuration );
      ( "HttpEndpointDestinationConfiguration",
        option_to_yojson http_endpoint_destination_configuration_to_yojson
          x.http_endpoint_destination_configuration );
      ("Tags", option_to_yojson tag_delivery_stream_input_tag_list_to_yojson x.tags);
      ( "AmazonOpenSearchServerlessDestinationConfiguration",
        option_to_yojson amazon_open_search_serverless_destination_configuration_to_yojson
          x.amazon_open_search_serverless_destination_configuration );
      ( "MSKSourceConfiguration",
        option_to_yojson msk_source_configuration_to_yojson x.msk_source_configuration );
      ( "SnowflakeDestinationConfiguration",
        option_to_yojson snowflake_destination_configuration_to_yojson
          x.snowflake_destination_configuration );
      ( "IcebergDestinationConfiguration",
        option_to_yojson iceberg_destination_configuration_to_yojson
          x.iceberg_destination_configuration );
      ( "DatabaseSourceConfiguration",
        option_to_yojson database_source_configuration_to_yojson x.database_source_configuration );
    ]

let data_to_yojson = blob_to_yojson

let delivery_stream_failure_type_to_yojson (x : delivery_stream_failure_type) =
  match x with
  | VPC_ENDPOINT_SERVICE_NAME_NOT_FOUND -> `String "VPC_ENDPOINT_SERVICE_NAME_NOT_FOUND"
  | VPC_INTERFACE_ENDPOINT_SERVICE_ACCESS_DENIED ->
      `String "VPC_INTERFACE_ENDPOINT_SERVICE_ACCESS_DENIED"
  | RETIRE_KMS_GRANT_FAILED -> `String "RETIRE_KMS_GRANT_FAILED"
  | CREATE_KMS_GRANT_FAILED -> `String "CREATE_KMS_GRANT_FAILED"
  | KMS_ACCESS_DENIED -> `String "KMS_ACCESS_DENIED"
  | DISABLED_KMS_KEY -> `String "DISABLED_KMS_KEY"
  | INVALID_KMS_KEY -> `String "INVALID_KMS_KEY"
  | KMS_KEY_NOT_FOUND -> `String "KMS_KEY_NOT_FOUND"
  | KMS_OPT_IN_REQUIRED -> `String "KMS_OPT_IN_REQUIRED"
  | CREATE_ENI_FAILED -> `String "CREATE_ENI_FAILED"
  | DELETE_ENI_FAILED -> `String "DELETE_ENI_FAILED"
  | SUBNET_NOT_FOUND -> `String "SUBNET_NOT_FOUND"
  | SECURITY_GROUP_NOT_FOUND -> `String "SECURITY_GROUP_NOT_FOUND"
  | ENI_ACCESS_DENIED -> `String "ENI_ACCESS_DENIED"
  | SUBNET_ACCESS_DENIED -> `String "SUBNET_ACCESS_DENIED"
  | SECURITY_GROUP_ACCESS_DENIED -> `String "SECURITY_GROUP_ACCESS_DENIED"
  | UNKNOWN_ERROR -> `String "UNKNOWN_ERROR"

let failure_description_to_yojson (x : failure_description) =
  assoc_to_yojson
    [
      ("Type", Some (delivery_stream_failure_type_to_yojson x.type_));
      ("Details", Some (non_empty_string_to_yojson x.details));
    ]

let snapshot_status_to_yojson (x : snapshot_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETE -> `String "COMPLETE"
  | SUSPENDED -> `String "SUSPENDED"

let snapshot_requested_by_to_yojson (x : snapshot_requested_by) =
  match x with USER -> `String "USER" | FIREHOSE -> `String "FIREHOSE"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let database_snapshot_info_to_yojson (x : database_snapshot_info) =
  assoc_to_yojson
    [
      ("Id", Some (non_empty_string_without_whitespace_to_yojson x.id));
      ("Table", Some (database_table_name_to_yojson x.table));
      ("RequestTimestamp", Some (timestamp_to_yojson x.request_timestamp));
      ("RequestedBy", Some (snapshot_requested_by_to_yojson x.requested_by));
      ("Status", Some (snapshot_status_to_yojson x.status));
      ("FailureDescription", option_to_yojson failure_description_to_yojson x.failure_description);
    ]

let database_snapshot_info_list_to_yojson tree =
  list_to_yojson database_snapshot_info_to_yojson tree

let database_source_description_to_yojson (x : database_source_description) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson database_type_to_yojson x.type_);
      ("Endpoint", option_to_yojson database_endpoint_to_yojson x.endpoint);
      ("Port", option_to_yojson database_port_to_yojson x.port);
      ("SSLMode", option_to_yojson ssl_mode_to_yojson x.ssl_mode);
      ("Databases", option_to_yojson database_list_to_yojson x.databases);
      ("Tables", option_to_yojson database_table_list_to_yojson x.tables);
      ("Columns", option_to_yojson database_column_list_to_yojson x.columns);
      ( "SurrogateKeys",
        option_to_yojson database_column_include_or_exclude_list_to_yojson x.surrogate_keys );
      ( "SnapshotWatermarkTable",
        option_to_yojson database_table_name_to_yojson x.snapshot_watermark_table );
      ("SnapshotInfo", option_to_yojson database_snapshot_info_list_to_yojson x.snapshot_info);
      ( "DatabaseSourceAuthenticationConfiguration",
        option_to_yojson database_source_authentication_configuration_to_yojson
          x.database_source_authentication_configuration );
      ( "DatabaseSourceVPCConfiguration",
        option_to_yojson database_source_vpc_configuration_to_yojson
          x.database_source_vpc_configuration );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let delete_delivery_stream_output_to_yojson = unit_to_yojson

let delete_delivery_stream_input_to_yojson (x : delete_delivery_stream_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("AllowForceDelete", option_to_yojson boolean_object_to_yojson x.allow_force_delete);
    ]

let delivery_start_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let iceberg_destination_description_to_yojson (x : iceberg_destination_description) =
  assoc_to_yojson
    [
      ( "DestinationTableConfigurationList",
        option_to_yojson destination_table_configuration_list_to_yojson
          x.destination_table_configuration_list );
      ( "SchemaEvolutionConfiguration",
        option_to_yojson schema_evolution_configuration_to_yojson x.schema_evolution_configuration
      );
      ( "TableCreationConfiguration",
        option_to_yojson table_creation_configuration_to_yojson x.table_creation_configuration );
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson iceberg_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson retry_options_to_yojson x.retry_options);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("AppendOnly", option_to_yojson boolean_object_to_yojson x.append_only);
      ( "CatalogConfiguration",
        option_to_yojson catalog_configuration_to_yojson x.catalog_configuration );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
    ]

let snowflake_destination_description_to_yojson (x : snowflake_destination_description) =
  assoc_to_yojson
    [
      ("AccountUrl", option_to_yojson snowflake_account_url_to_yojson x.account_url);
      ("User", option_to_yojson snowflake_user_to_yojson x.user);
      ("Database", option_to_yojson snowflake_database_to_yojson x.database);
      ("Schema", option_to_yojson snowflake_schema_to_yojson x.schema);
      ("Table", option_to_yojson snowflake_table_to_yojson x.table);
      ( "SnowflakeRoleConfiguration",
        option_to_yojson snowflake_role_configuration_to_yojson x.snowflake_role_configuration );
      ( "DataLoadingOption",
        option_to_yojson snowflake_data_loading_option_to_yojson x.data_loading_option );
      ( "MetaDataColumnName",
        option_to_yojson snowflake_meta_data_column_name_to_yojson x.meta_data_column_name );
      ( "ContentColumnName",
        option_to_yojson snowflake_content_column_name_to_yojson x.content_column_name );
      ( "SnowflakeVpcConfiguration",
        option_to_yojson snowflake_vpc_configuration_to_yojson x.snowflake_vpc_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RetryOptions", option_to_yojson snowflake_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson snowflake_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("BufferingHints", option_to_yojson snowflake_buffering_hints_to_yojson x.buffering_hints);
    ]

let http_endpoint_description_to_yojson (x : http_endpoint_description) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson http_endpoint_url_to_yojson x.url);
      ("Name", option_to_yojson http_endpoint_name_to_yojson x.name);
    ]

let http_endpoint_destination_description_to_yojson (x : http_endpoint_destination_description) =
  assoc_to_yojson
    [
      ( "EndpointConfiguration",
        option_to_yojson http_endpoint_description_to_yojson x.endpoint_configuration );
      ("BufferingHints", option_to_yojson http_endpoint_buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "RequestConfiguration",
        option_to_yojson http_endpoint_request_configuration_to_yojson x.request_configuration );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RetryOptions", option_to_yojson http_endpoint_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson http_endpoint_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let splunk_destination_description_to_yojson (x : splunk_destination_description) =
  assoc_to_yojson
    [
      ("HECEndpoint", option_to_yojson hec_endpoint_to_yojson x.hec_endpoint);
      ("HECEndpointType", option_to_yojson hec_endpoint_type_to_yojson x.hec_endpoint_type);
      ("HECToken", option_to_yojson hec_token_to_yojson x.hec_token);
      ( "HECAcknowledgmentTimeoutInSeconds",
        option_to_yojson hec_acknowledgment_timeout_in_seconds_to_yojson
          x.hec_acknowledgment_timeout_in_seconds );
      ("RetryOptions", option_to_yojson splunk_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson splunk_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson splunk_buffering_hints_to_yojson x.buffering_hints);
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let elasticsearch_destination_description_to_yojson (x : elasticsearch_destination_description) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("DomainARN", option_to_yojson elasticsearch_domain_ar_n_to_yojson x.domain_ar_n);
      ( "ClusterEndpoint",
        option_to_yojson elasticsearch_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("IndexName", option_to_yojson elasticsearch_index_name_to_yojson x.index_name);
      ("TypeName", option_to_yojson elasticsearch_type_name_to_yojson x.type_name);
      ( "IndexRotationPeriod",
        option_to_yojson elasticsearch_index_rotation_period_to_yojson x.index_rotation_period );
      ("BufferingHints", option_to_yojson elasticsearch_buffering_hints_to_yojson x.buffering_hints);
      ("RetryOptions", option_to_yojson elasticsearch_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson elasticsearch_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "VpcConfigurationDescription",
        option_to_yojson vpc_configuration_description_to_yojson x.vpc_configuration_description );
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
    ]

let redshift_destination_description_to_yojson (x : redshift_destination_description) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("ClusterJDBCURL", Some (cluster_jdbcur_l_to_yojson x.cluster_jdbcur_l));
      ("CopyCommand", Some (copy_command_to_yojson x.copy_command));
      ("Username", option_to_yojson username_to_yojson x.username);
      ("RetryOptions", option_to_yojson redshift_retry_options_to_yojson x.retry_options);
      ( "S3DestinationDescription",
        Some (s3_destination_description_to_yojson x.s3_destination_description) );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson redshift_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "S3BackupDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_backup_description );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let extended_s3_destination_description_to_yojson (x : extended_s3_destination_description) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("BufferingHints", Some (buffering_hints_to_yojson x.buffering_hints));
      ("CompressionFormat", Some (compression_format_to_yojson x.compression_format));
      ( "EncryptionConfiguration",
        Some (encryption_configuration_to_yojson x.encryption_configuration) );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "S3BackupDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_backup_description );
      ( "DataFormatConversionConfiguration",
        option_to_yojson data_format_conversion_configuration_to_yojson
          x.data_format_conversion_configuration );
      ( "DynamicPartitioningConfiguration",
        option_to_yojson dynamic_partitioning_configuration_to_yojson
          x.dynamic_partitioning_configuration );
      ("FileExtension", option_to_yojson file_extension_to_yojson x.file_extension);
      ("CustomTimeZone", option_to_yojson custom_time_zone_to_yojson x.custom_time_zone);
    ]

let destination_id_to_yojson = string_to_yojson

let destination_description_to_yojson (x : destination_description) =
  assoc_to_yojson
    [
      ("DestinationId", Some (destination_id_to_yojson x.destination_id));
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "ExtendedS3DestinationDescription",
        option_to_yojson extended_s3_destination_description_to_yojson
          x.extended_s3_destination_description );
      ( "RedshiftDestinationDescription",
        option_to_yojson redshift_destination_description_to_yojson
          x.redshift_destination_description );
      ( "ElasticsearchDestinationDescription",
        option_to_yojson elasticsearch_destination_description_to_yojson
          x.elasticsearch_destination_description );
      ( "AmazonopensearchserviceDestinationDescription",
        option_to_yojson amazonopensearchservice_destination_description_to_yojson
          x.amazonopensearchservice_destination_description );
      ( "SplunkDestinationDescription",
        option_to_yojson splunk_destination_description_to_yojson x.splunk_destination_description
      );
      ( "HttpEndpointDestinationDescription",
        option_to_yojson http_endpoint_destination_description_to_yojson
          x.http_endpoint_destination_description );
      ( "SnowflakeDestinationDescription",
        option_to_yojson snowflake_destination_description_to_yojson
          x.snowflake_destination_description );
      ( "AmazonOpenSearchServerlessDestinationDescription",
        option_to_yojson amazon_open_search_serverless_destination_description_to_yojson
          x.amazon_open_search_serverless_destination_description );
      ( "IcebergDestinationDescription",
        option_to_yojson iceberg_destination_description_to_yojson x.iceberg_destination_description
      );
    ]

let destination_description_list_to_yojson tree =
  list_to_yojson destination_description_to_yojson tree

let msk_source_description_to_yojson (x : msk_source_description) =
  assoc_to_yojson
    [
      ("MSKClusterARN", option_to_yojson msk_cluster_ar_n_to_yojson x.msk_cluster_ar_n);
      ("TopicName", option_to_yojson topic_name_to_yojson x.topic_name);
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_to_yojson x.authentication_configuration );
      ( "DeliveryStartTimestamp",
        option_to_yojson delivery_start_timestamp_to_yojson x.delivery_start_timestamp );
      ("ReadFromTimestamp", option_to_yojson read_from_timestamp_to_yojson x.read_from_timestamp);
    ]

let kinesis_stream_source_description_to_yojson (x : kinesis_stream_source_description) =
  assoc_to_yojson
    [
      ("KinesisStreamARN", option_to_yojson kinesis_stream_ar_n_to_yojson x.kinesis_stream_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "DeliveryStartTimestamp",
        option_to_yojson delivery_start_timestamp_to_yojson x.delivery_start_timestamp );
    ]

let direct_put_source_description_to_yojson (x : direct_put_source_description) =
  assoc_to_yojson
    [
      ( "ThroughputHintInMBs",
        option_to_yojson throughput_hint_in_m_bs_to_yojson x.throughput_hint_in_m_bs );
    ]

let source_description_to_yojson (x : source_description) =
  assoc_to_yojson
    [
      ( "DirectPutSourceDescription",
        option_to_yojson direct_put_source_description_to_yojson x.direct_put_source_description );
      ( "KinesisStreamSourceDescription",
        option_to_yojson kinesis_stream_source_description_to_yojson
          x.kinesis_stream_source_description );
      ( "MSKSourceDescription",
        option_to_yojson msk_source_description_to_yojson x.msk_source_description );
      ( "DatabaseSourceDescription",
        option_to_yojson database_source_description_to_yojson x.database_source_description );
    ]

let delivery_stream_version_id_to_yojson = string_to_yojson

let delivery_stream_encryption_status_to_yojson (x : delivery_stream_encryption_status) =
  match x with
  | ENABLED -> `String "ENABLED"
  | ENABLING -> `String "ENABLING"
  | ENABLING_FAILED -> `String "ENABLING_FAILED"
  | DISABLED -> `String "DISABLED"
  | DISABLING -> `String "DISABLING"
  | DISABLING_FAILED -> `String "DISABLING_FAILED"

let delivery_stream_encryption_configuration_to_yojson
    (x : delivery_stream_encryption_configuration) =
  assoc_to_yojson
    [
      ("KeyARN", option_to_yojson awskms_key_arn_for_ss_e_to_yojson x.key_ar_n);
      ("KeyType", option_to_yojson key_type_to_yojson x.key_type);
      ("Status", option_to_yojson delivery_stream_encryption_status_to_yojson x.status);
      ("FailureDescription", option_to_yojson failure_description_to_yojson x.failure_description);
    ]

let delivery_stream_status_to_yojson (x : delivery_stream_status) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATING_FAILED -> `String "CREATING_FAILED"
  | DELETING -> `String "DELETING"
  | DELETING_FAILED -> `String "DELETING_FAILED"
  | ACTIVE -> `String "ACTIVE"

let delivery_stream_description_to_yojson (x : delivery_stream_description) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("DeliveryStreamARN", Some (delivery_stream_ar_n_to_yojson x.delivery_stream_ar_n));
      ("DeliveryStreamStatus", Some (delivery_stream_status_to_yojson x.delivery_stream_status));
      ("FailureDescription", option_to_yojson failure_description_to_yojson x.failure_description);
      ( "DeliveryStreamEncryptionConfiguration",
        option_to_yojson delivery_stream_encryption_configuration_to_yojson
          x.delivery_stream_encryption_configuration );
      ("DeliveryStreamType", Some (delivery_stream_type_to_yojson x.delivery_stream_type));
      ("VersionId", Some (delivery_stream_version_id_to_yojson x.version_id));
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("LastUpdateTimestamp", option_to_yojson timestamp_to_yojson x.last_update_timestamp);
      ("Source", option_to_yojson source_description_to_yojson x.source);
      ("Destinations", Some (destination_description_list_to_yojson x.destinations));
      ("HasMoreDestinations", Some (boolean_object_to_yojson x.has_more_destinations));
    ]

let delivery_stream_name_list_to_yojson tree = list_to_yojson delivery_stream_name_to_yojson tree

let describe_delivery_stream_output_to_yojson (x : describe_delivery_stream_output) =
  assoc_to_yojson
    [
      ( "DeliveryStreamDescription",
        Some (delivery_stream_description_to_yojson x.delivery_stream_description) );
    ]

let describe_delivery_stream_input_limit_to_yojson = int_to_yojson

let describe_delivery_stream_input_to_yojson (x : describe_delivery_stream_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("Limit", option_to_yojson describe_delivery_stream_input_limit_to_yojson x.limit);
      ( "ExclusiveStartDestinationId",
        option_to_yojson destination_id_to_yojson x.exclusive_start_destination_id );
    ]

let elasticsearch_destination_update_to_yojson (x : elasticsearch_destination_update) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("DomainARN", option_to_yojson elasticsearch_domain_ar_n_to_yojson x.domain_ar_n);
      ( "ClusterEndpoint",
        option_to_yojson elasticsearch_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("IndexName", option_to_yojson elasticsearch_index_name_to_yojson x.index_name);
      ("TypeName", option_to_yojson elasticsearch_type_name_to_yojson x.type_name);
      ( "IndexRotationPeriod",
        option_to_yojson elasticsearch_index_rotation_period_to_yojson x.index_rotation_period );
      ("BufferingHints", option_to_yojson elasticsearch_buffering_hints_to_yojson x.buffering_hints);
      ("RetryOptions", option_to_yojson elasticsearch_retry_options_to_yojson x.retry_options);
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
    ]

let extended_s3_destination_update_to_yojson (x : extended_s3_destination_update) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("BucketARN", option_to_yojson bucket_ar_n_to_yojson x.bucket_ar_n);
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ("CompressionFormat", option_to_yojson compression_format_to_yojson x.compression_format);
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3BackupUpdate", option_to_yojson s3_destination_update_to_yojson x.s3_backup_update);
      ( "DataFormatConversionConfiguration",
        option_to_yojson data_format_conversion_configuration_to_yojson
          x.data_format_conversion_configuration );
      ( "DynamicPartitioningConfiguration",
        option_to_yojson dynamic_partitioning_configuration_to_yojson
          x.dynamic_partitioning_configuration );
      ("FileExtension", option_to_yojson file_extension_to_yojson x.file_extension);
      ("CustomTimeZone", option_to_yojson custom_time_zone_to_yojson x.custom_time_zone);
    ]

let update_destination_output_to_yojson = unit_to_yojson

let iceberg_destination_update_to_yojson (x : iceberg_destination_update) =
  assoc_to_yojson
    [
      ( "DestinationTableConfigurationList",
        option_to_yojson destination_table_configuration_list_to_yojson
          x.destination_table_configuration_list );
      ( "SchemaEvolutionConfiguration",
        option_to_yojson schema_evolution_configuration_to_yojson x.schema_evolution_configuration
      );
      ( "TableCreationConfiguration",
        option_to_yojson table_creation_configuration_to_yojson x.table_creation_configuration );
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson iceberg_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson retry_options_to_yojson x.retry_options);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("AppendOnly", option_to_yojson boolean_object_to_yojson x.append_only);
      ( "CatalogConfiguration",
        option_to_yojson catalog_configuration_to_yojson x.catalog_configuration );
      ("S3Configuration", option_to_yojson s3_destination_configuration_to_yojson x.s3_configuration);
    ]

let snowflake_destination_update_to_yojson (x : snowflake_destination_update) =
  assoc_to_yojson
    [
      ("AccountUrl", option_to_yojson snowflake_account_url_to_yojson x.account_url);
      ("PrivateKey", option_to_yojson snowflake_private_key_to_yojson x.private_key);
      ("KeyPassphrase", option_to_yojson snowflake_key_passphrase_to_yojson x.key_passphrase);
      ("User", option_to_yojson snowflake_user_to_yojson x.user);
      ("Database", option_to_yojson snowflake_database_to_yojson x.database);
      ("Schema", option_to_yojson snowflake_schema_to_yojson x.schema);
      ("Table", option_to_yojson snowflake_table_to_yojson x.table);
      ( "SnowflakeRoleConfiguration",
        option_to_yojson snowflake_role_configuration_to_yojson x.snowflake_role_configuration );
      ( "DataLoadingOption",
        option_to_yojson snowflake_data_loading_option_to_yojson x.data_loading_option );
      ( "MetaDataColumnName",
        option_to_yojson snowflake_meta_data_column_name_to_yojson x.meta_data_column_name );
      ( "ContentColumnName",
        option_to_yojson snowflake_content_column_name_to_yojson x.content_column_name );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RetryOptions", option_to_yojson snowflake_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson snowflake_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("BufferingHints", option_to_yojson snowflake_buffering_hints_to_yojson x.buffering_hints);
    ]

let http_endpoint_destination_update_to_yojson (x : http_endpoint_destination_update) =
  assoc_to_yojson
    [
      ( "EndpointConfiguration",
        option_to_yojson http_endpoint_configuration_to_yojson x.endpoint_configuration );
      ("BufferingHints", option_to_yojson http_endpoint_buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "RequestConfiguration",
        option_to_yojson http_endpoint_request_configuration_to_yojson x.request_configuration );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RetryOptions", option_to_yojson http_endpoint_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson http_endpoint_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let splunk_destination_update_to_yojson (x : splunk_destination_update) =
  assoc_to_yojson
    [
      ("HECEndpoint", option_to_yojson hec_endpoint_to_yojson x.hec_endpoint);
      ("HECEndpointType", option_to_yojson hec_endpoint_type_to_yojson x.hec_endpoint_type);
      ("HECToken", option_to_yojson hec_token_to_yojson x.hec_token);
      ( "HECAcknowledgmentTimeoutInSeconds",
        option_to_yojson hec_acknowledgment_timeout_in_seconds_to_yojson
          x.hec_acknowledgment_timeout_in_seconds );
      ("RetryOptions", option_to_yojson splunk_retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson splunk_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson splunk_buffering_hints_to_yojson x.buffering_hints);
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let redshift_destination_update_to_yojson (x : redshift_destination_update) =
  assoc_to_yojson
    [
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("ClusterJDBCURL", option_to_yojson cluster_jdbcur_l_to_yojson x.cluster_jdbcur_l);
      ("CopyCommand", option_to_yojson copy_command_to_yojson x.copy_command);
      ("Username", option_to_yojson username_to_yojson x.username);
      ("Password", option_to_yojson password_to_yojson x.password);
      ("RetryOptions", option_to_yojson redshift_retry_options_to_yojson x.retry_options);
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3BackupMode", option_to_yojson redshift_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("S3BackupUpdate", option_to_yojson s3_destination_update_to_yojson x.s3_backup_update);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
    ]

let update_destination_input_to_yojson (x : update_destination_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ( "CurrentDeliveryStreamVersionId",
        Some (delivery_stream_version_id_to_yojson x.current_delivery_stream_version_id) );
      ("DestinationId", Some (destination_id_to_yojson x.destination_id));
      ( "S3DestinationUpdate",
        option_to_yojson s3_destination_update_to_yojson x.s3_destination_update );
      ( "ExtendedS3DestinationUpdate",
        option_to_yojson extended_s3_destination_update_to_yojson x.extended_s3_destination_update
      );
      ( "RedshiftDestinationUpdate",
        option_to_yojson redshift_destination_update_to_yojson x.redshift_destination_update );
      ( "ElasticsearchDestinationUpdate",
        option_to_yojson elasticsearch_destination_update_to_yojson
          x.elasticsearch_destination_update );
      ( "AmazonopensearchserviceDestinationUpdate",
        option_to_yojson amazonopensearchservice_destination_update_to_yojson
          x.amazonopensearchservice_destination_update );
      ( "SplunkDestinationUpdate",
        option_to_yojson splunk_destination_update_to_yojson x.splunk_destination_update );
      ( "HttpEndpointDestinationUpdate",
        option_to_yojson http_endpoint_destination_update_to_yojson
          x.http_endpoint_destination_update );
      ( "AmazonOpenSearchServerlessDestinationUpdate",
        option_to_yojson amazon_open_search_serverless_destination_update_to_yojson
          x.amazon_open_search_serverless_destination_update );
      ( "SnowflakeDestinationUpdate",
        option_to_yojson snowflake_destination_update_to_yojson x.snowflake_destination_update );
      ( "IcebergDestinationUpdate",
        option_to_yojson iceberg_destination_update_to_yojson x.iceberg_destination_update );
    ]

let untag_delivery_stream_output_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_delivery_stream_input_to_yojson (x : untag_delivery_stream_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_delivery_stream_output_to_yojson = unit_to_yojson

let tag_delivery_stream_input_to_yojson (x : tag_delivery_stream_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("Tags", Some (tag_delivery_stream_input_tag_list_to_yojson x.tags));
    ]

let stop_delivery_stream_encryption_output_to_yojson = unit_to_yojson

let stop_delivery_stream_encryption_input_to_yojson (x : stop_delivery_stream_encryption_input) =
  assoc_to_yojson
    [ ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name)) ]

let start_delivery_stream_encryption_output_to_yojson = unit_to_yojson

let start_delivery_stream_encryption_input_to_yojson (x : start_delivery_stream_encryption_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ( "DeliveryStreamEncryptionConfigurationInput",
        option_to_yojson delivery_stream_encryption_configuration_input_to_yojson
          x.delivery_stream_encryption_configuration_input );
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_source_exception_to_yojson (x : invalid_source_exception) =
  assoc_to_yojson
    [
      ("code", option_to_yojson error_code_to_yojson x.code);
      ("message", option_to_yojson error_message_to_yojson x.message);
    ]

let put_response_record_id_to_yojson = string_to_yojson

let put_record_batch_response_entry_to_yojson (x : put_record_batch_response_entry) =
  assoc_to_yojson
    [
      ("RecordId", option_to_yojson put_response_record_id_to_yojson x.record_id);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let put_record_batch_response_entry_list_to_yojson tree =
  list_to_yojson put_record_batch_response_entry_to_yojson tree

let put_record_batch_output_to_yojson (x : put_record_batch_output) =
  assoc_to_yojson
    [
      ("FailedPutCount", Some (non_negative_integer_object_to_yojson x.failed_put_count));
      ("Encrypted", option_to_yojson boolean_object_to_yojson x.encrypted);
      ("RequestResponses", Some (put_record_batch_response_entry_list_to_yojson x.request_responses));
    ]

let record_to_yojson (x : record) = assoc_to_yojson [ ("Data", Some (data_to_yojson x.data)) ]
let put_record_batch_request_entry_list_to_yojson tree = list_to_yojson record_to_yojson tree

let put_record_batch_input_to_yojson (x : put_record_batch_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("Records", Some (put_record_batch_request_entry_list_to_yojson x.records));
    ]

let put_record_output_to_yojson (x : put_record_output) =
  assoc_to_yojson
    [
      ("RecordId", Some (put_response_record_id_to_yojson x.record_id));
      ("Encrypted", option_to_yojson boolean_object_to_yojson x.encrypted);
    ]

let put_record_input_to_yojson (x : put_record_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("Record", Some (record_to_yojson x.record));
    ]

let list_tags_for_delivery_stream_output_tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let list_tags_for_delivery_stream_output_to_yojson (x : list_tags_for_delivery_stream_output) =
  assoc_to_yojson
    [
      ("Tags", Some (list_tags_for_delivery_stream_output_tag_list_to_yojson x.tags));
      ("HasMoreTags", Some (boolean_object_to_yojson x.has_more_tags));
    ]

let list_tags_for_delivery_stream_input_limit_to_yojson = int_to_yojson

let list_tags_for_delivery_stream_input_to_yojson (x : list_tags_for_delivery_stream_input) =
  assoc_to_yojson
    [
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
      ("ExclusiveStartTagKey", option_to_yojson tag_key_to_yojson x.exclusive_start_tag_key);
      ("Limit", option_to_yojson list_tags_for_delivery_stream_input_limit_to_yojson x.limit);
    ]

let list_delivery_streams_output_to_yojson (x : list_delivery_streams_output) =
  assoc_to_yojson
    [
      ("DeliveryStreamNames", Some (delivery_stream_name_list_to_yojson x.delivery_stream_names));
      ("HasMoreDeliveryStreams", Some (boolean_object_to_yojson x.has_more_delivery_streams));
    ]

let list_delivery_streams_input_limit_to_yojson = int_to_yojson

let list_delivery_streams_input_to_yojson (x : list_delivery_streams_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson list_delivery_streams_input_limit_to_yojson x.limit);
      ("DeliveryStreamType", option_to_yojson delivery_stream_type_to_yojson x.delivery_stream_type);
      ( "ExclusiveStartDeliveryStreamName",
        option_to_yojson delivery_stream_name_to_yojson x.exclusive_start_delivery_stream_name );
    ]
