open Smaws_Lib.Json.SerializeHelpers
open Types

let warehouse_location_to_yojson = string_to_yojson
let vpc_endpoint_service_name_to_yojson = string_to_yojson
let non_empty_string_without_whitespace_to_yojson = string_to_yojson

let subnet_id_list_to_yojson tree =
  list_to_yojson non_empty_string_without_whitespace_to_yojson tree

let role_ar_n_to_yojson = string_to_yojson

let security_group_id_list_to_yojson tree =
  list_to_yojson non_empty_string_without_whitespace_to_yojson tree

let vpc_configuration_description_to_yojson (x : vpc_configuration_description) =
  assoc_to_yojson
    [
      ("VpcId", Some (non_empty_string_without_whitespace_to_yojson x.vpc_id));
      ("SecurityGroupIds", Some (security_group_id_list_to_yojson x.security_group_ids));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("SubnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
    ]

let vpc_configuration_to_yojson (x : vpc_configuration) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", Some (security_group_id_list_to_yojson x.security_group_ids));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("SubnetIds", Some (subnet_id_list_to_yojson x.subnet_ids));
    ]

let username_to_yojson = string_to_yojson
let update_destination_output_to_yojson = unit_to_yojson
let delivery_stream_name_to_yojson = string_to_yojson
let delivery_stream_version_id_to_yojson = string_to_yojson
let destination_id_to_yojson = string_to_yojson
let bucket_ar_n_to_yojson = string_to_yojson
let prefix_to_yojson = string_to_yojson
let error_output_prefix_to_yojson = string_to_yojson
let size_in_m_bs_to_yojson = int_to_yojson
let interval_in_seconds_to_yojson = int_to_yojson

let buffering_hints_to_yojson (x : buffering_hints) =
  assoc_to_yojson
    [
      ("IntervalInSeconds", option_to_yojson interval_in_seconds_to_yojson x.interval_in_seconds);
      ("SizeInMBs", option_to_yojson size_in_m_bs_to_yojson x.size_in_m_bs);
    ]

let compression_format_to_yojson (x : compression_format) =
  match x with
  | HADOOP_SNAPPY -> `String "HADOOP_SNAPPY"
  | SNAPPY -> `String "Snappy"
  | ZIP -> `String "ZIP"
  | GZIP -> `String "GZIP"
  | UNCOMPRESSED -> `String "UNCOMPRESSED"

let no_encryption_config_to_yojson (x : no_encryption_config) =
  match x with NoEncryption -> `String "NoEncryption"

let awskms_key_ar_n_to_yojson = string_to_yojson

let kms_encryption_config_to_yojson (x : kms_encryption_config) =
  assoc_to_yojson [ ("AWSKMSKeyARN", Some (awskms_key_ar_n_to_yojson x.awskms_key_ar_n)) ]

let encryption_configuration_to_yojson (x : encryption_configuration) =
  assoc_to_yojson
    [
      ( "KMSEncryptionConfig",
        option_to_yojson kms_encryption_config_to_yojson x.kms_encryption_config );
      ("NoEncryptionConfig", option_to_yojson no_encryption_config_to_yojson x.no_encryption_config);
    ]

let boolean_object_to_yojson = bool_to_yojson
let log_group_name_to_yojson = string_to_yojson
let log_stream_name_to_yojson = string_to_yojson

let cloud_watch_logging_options_to_yojson (x : cloud_watch_logging_options) =
  assoc_to_yojson
    [
      ("LogStreamName", option_to_yojson log_stream_name_to_yojson x.log_stream_name);
      ("LogGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
    ]

let s3_destination_update_to_yojson (x : s3_destination_update) =
  assoc_to_yojson
    [
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("CompressionFormat", option_to_yojson compression_format_to_yojson x.compression_format);
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("BucketARN", option_to_yojson bucket_ar_n_to_yojson x.bucket_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let processor_type_to_yojson (x : processor_type) =
  match x with
  | AppendDelimiterToRecord -> `String "AppendDelimiterToRecord"
  | MetadataExtraction -> `String "MetadataExtraction"
  | Lambda -> `String "Lambda"
  | CloudWatchLogProcessing -> `String "CloudWatchLogProcessing"
  | Decompression -> `String "Decompression"
  | RecordDeAggregation -> `String "RecordDeAggregation"

let processor_parameter_name_to_yojson (x : processor_parameter_name) =
  match x with
  | DATA_MESSAGE_EXTRACTION -> `String "DataMessageExtraction"
  | COMPRESSION_FORMAT -> `String "CompressionFormat"
  | Delimiter -> `String "Delimiter"
  | SUB_RECORD_TYPE -> `String "SubRecordType"
  | BUFFER_INTERVAL_IN_SECONDS -> `String "BufferIntervalInSeconds"
  | BUFFER_SIZE_IN_MB -> `String "BufferSizeInMBs"
  | ROLE_ARN -> `String "RoleArn"
  | JSON_PARSING_ENGINE -> `String "JsonParsingEngine"
  | METADATA_EXTRACTION_QUERY -> `String "MetadataExtractionQuery"
  | LAMBDA_NUMBER_OF_RETRIES -> `String "NumberOfRetries"
  | LAMBDA_ARN -> `String "LambdaArn"

let processor_parameter_value_to_yojson = string_to_yojson

let processor_parameter_to_yojson (x : processor_parameter) =
  assoc_to_yojson
    [
      ("ParameterValue", Some (processor_parameter_value_to_yojson x.parameter_value));
      ("ParameterName", Some (processor_parameter_name_to_yojson x.parameter_name));
    ]

let processor_parameter_list_to_yojson tree = list_to_yojson processor_parameter_to_yojson tree

let processor_to_yojson (x : processor) =
  assoc_to_yojson
    [
      ("Parameters", option_to_yojson processor_parameter_list_to_yojson x.parameters);
      ("Type", Some (processor_type_to_yojson x.type_));
    ]

let processor_list_to_yojson tree = list_to_yojson processor_to_yojson tree

let processing_configuration_to_yojson (x : processing_configuration) =
  assoc_to_yojson
    [
      ("Processors", option_to_yojson processor_list_to_yojson x.processors);
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
    ]

let s3_backup_mode_to_yojson (x : s3_backup_mode) =
  match x with Enabled -> `String "Enabled" | Disabled -> `String "Disabled"

let schema_configuration_to_yojson (x : schema_configuration) =
  assoc_to_yojson
    [
      ("VersionId", option_to_yojson non_empty_string_without_whitespace_to_yojson x.version_id);
      ("Region", option_to_yojson non_empty_string_without_whitespace_to_yojson x.region);
      ("TableName", option_to_yojson non_empty_string_without_whitespace_to_yojson x.table_name);
      ( "DatabaseName",
        option_to_yojson non_empty_string_without_whitespace_to_yojson x.database_name );
      ("CatalogId", option_to_yojson non_empty_string_without_whitespace_to_yojson x.catalog_id);
      ("RoleARN", option_to_yojson non_empty_string_without_whitespace_to_yojson x.role_ar_n);
    ]

let non_empty_string_to_yojson = string_to_yojson

let column_to_json_key_mappings_to_yojson tree =
  map_to_yojson non_empty_string_without_whitespace_to_yojson non_empty_string_to_yojson tree

let open_x_json_ser_de_to_yojson (x : open_x_json_ser_de) =
  assoc_to_yojson
    [
      ( "ColumnToJsonKeyMappings",
        option_to_yojson column_to_json_key_mappings_to_yojson x.column_to_json_key_mappings );
      ("CaseInsensitive", option_to_yojson boolean_object_to_yojson x.case_insensitive);
      ( "ConvertDotsInJsonKeysToUnderscores",
        option_to_yojson boolean_object_to_yojson x.convert_dots_in_json_keys_to_underscores );
    ]

let list_of_non_empty_strings_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let hive_json_ser_de_to_yojson (x : hive_json_ser_de) =
  assoc_to_yojson
    [
      ("TimestampFormats", option_to_yojson list_of_non_empty_strings_to_yojson x.timestamp_formats);
    ]

let deserializer_to_yojson (x : deserializer) =
  assoc_to_yojson
    [
      ("HiveJsonSerDe", option_to_yojson hive_json_ser_de_to_yojson x.hive_json_ser_de);
      ("OpenXJsonSerDe", option_to_yojson open_x_json_ser_de_to_yojson x.open_x_json_ser_de);
    ]

let input_format_configuration_to_yojson (x : input_format_configuration) =
  assoc_to_yojson [ ("Deserializer", option_to_yojson deserializer_to_yojson x.deserializer) ]

let block_size_bytes_to_yojson = int_to_yojson
let parquet_page_size_bytes_to_yojson = int_to_yojson

let parquet_compression_to_yojson (x : parquet_compression) =
  match x with
  | SNAPPY -> `String "SNAPPY"
  | GZIP -> `String "GZIP"
  | UNCOMPRESSED -> `String "UNCOMPRESSED"

let non_negative_integer_object_to_yojson = int_to_yojson

let parquet_writer_version_to_yojson (x : parquet_writer_version) =
  match x with V2 -> `String "V2" | V1 -> `String "V1"

let parquet_ser_de_to_yojson (x : parquet_ser_de) =
  assoc_to_yojson
    [
      ("WriterVersion", option_to_yojson parquet_writer_version_to_yojson x.writer_version);
      ("MaxPaddingBytes", option_to_yojson non_negative_integer_object_to_yojson x.max_padding_bytes);
      ( "EnableDictionaryCompression",
        option_to_yojson boolean_object_to_yojson x.enable_dictionary_compression );
      ("Compression", option_to_yojson parquet_compression_to_yojson x.compression);
      ("PageSizeBytes", option_to_yojson parquet_page_size_bytes_to_yojson x.page_size_bytes);
      ("BlockSizeBytes", option_to_yojson block_size_bytes_to_yojson x.block_size_bytes);
    ]

let orc_stripe_size_bytes_to_yojson = int_to_yojson
let orc_row_index_stride_to_yojson = int_to_yojson
let proportion_to_yojson = double_to_yojson

let orc_compression_to_yojson (x : orc_compression) =
  match x with SNAPPY -> `String "SNAPPY" | ZLIB -> `String "ZLIB" | NONE -> `String "NONE"

let list_of_non_empty_strings_without_whitespace_to_yojson tree =
  list_to_yojson non_empty_string_without_whitespace_to_yojson tree

let orc_format_version_to_yojson (x : orc_format_version) =
  match x with V0_12 -> `String "V0_12" | V0_11 -> `String "V0_11"

let orc_ser_de_to_yojson (x : orc_ser_de) =
  assoc_to_yojson
    [
      ("FormatVersion", option_to_yojson orc_format_version_to_yojson x.format_version);
      ("DictionaryKeyThreshold", option_to_yojson proportion_to_yojson x.dictionary_key_threshold);
      ( "BloomFilterFalsePositiveProbability",
        option_to_yojson proportion_to_yojson x.bloom_filter_false_positive_probability );
      ( "BloomFilterColumns",
        option_to_yojson list_of_non_empty_strings_without_whitespace_to_yojson
          x.bloom_filter_columns );
      ("Compression", option_to_yojson orc_compression_to_yojson x.compression);
      ("PaddingTolerance", option_to_yojson proportion_to_yojson x.padding_tolerance);
      ("EnablePadding", option_to_yojson boolean_object_to_yojson x.enable_padding);
      ("RowIndexStride", option_to_yojson orc_row_index_stride_to_yojson x.row_index_stride);
      ("BlockSizeBytes", option_to_yojson block_size_bytes_to_yojson x.block_size_bytes);
      ("StripeSizeBytes", option_to_yojson orc_stripe_size_bytes_to_yojson x.stripe_size_bytes);
    ]

let serializer_to_yojson (x : serializer) =
  assoc_to_yojson
    [
      ("OrcSerDe", option_to_yojson orc_ser_de_to_yojson x.orc_ser_de);
      ("ParquetSerDe", option_to_yojson parquet_ser_de_to_yojson x.parquet_ser_de);
    ]

let output_format_configuration_to_yojson (x : output_format_configuration) =
  assoc_to_yojson [ ("Serializer", option_to_yojson serializer_to_yojson x.serializer) ]

let data_format_conversion_configuration_to_yojson (x : data_format_conversion_configuration) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
      ( "OutputFormatConfiguration",
        option_to_yojson output_format_configuration_to_yojson x.output_format_configuration );
      ( "InputFormatConfiguration",
        option_to_yojson input_format_configuration_to_yojson x.input_format_configuration );
      ("SchemaConfiguration", option_to_yojson schema_configuration_to_yojson x.schema_configuration);
    ]

let retry_duration_in_seconds_to_yojson = int_to_yojson

let retry_options_to_yojson (x : retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let dynamic_partitioning_configuration_to_yojson (x : dynamic_partitioning_configuration) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
      ("RetryOptions", option_to_yojson retry_options_to_yojson x.retry_options);
    ]

let file_extension_to_yojson = string_to_yojson
let custom_time_zone_to_yojson = string_to_yojson

let extended_s3_destination_update_to_yojson (x : extended_s3_destination_update) =
  assoc_to_yojson
    [
      ("CustomTimeZone", option_to_yojson custom_time_zone_to_yojson x.custom_time_zone);
      ("FileExtension", option_to_yojson file_extension_to_yojson x.file_extension);
      ( "DynamicPartitioningConfiguration",
        option_to_yojson dynamic_partitioning_configuration_to_yojson
          x.dynamic_partitioning_configuration );
      ( "DataFormatConversionConfiguration",
        option_to_yojson data_format_conversion_configuration_to_yojson
          x.data_format_conversion_configuration );
      ("S3BackupUpdate", option_to_yojson s3_destination_update_to_yojson x.s3_backup_update);
      ("S3BackupMode", option_to_yojson s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("CompressionFormat", option_to_yojson compression_format_to_yojson x.compression_format);
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("BucketARN", option_to_yojson bucket_ar_n_to_yojson x.bucket_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let cluster_jdbcur_l_to_yojson = string_to_yojson
let data_table_name_to_yojson = string_to_yojson
let data_table_columns_to_yojson = string_to_yojson
let copy_options_to_yojson = string_to_yojson

let copy_command_to_yojson (x : copy_command) =
  assoc_to_yojson
    [
      ("CopyOptions", option_to_yojson copy_options_to_yojson x.copy_options);
      ("DataTableColumns", option_to_yojson data_table_columns_to_yojson x.data_table_columns);
      ("DataTableName", Some (data_table_name_to_yojson x.data_table_name));
    ]

let password_to_yojson = string_to_yojson
let redshift_retry_duration_in_seconds_to_yojson = int_to_yojson

let redshift_retry_options_to_yojson (x : redshift_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson redshift_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let redshift_s3_backup_mode_to_yojson (x : redshift_s3_backup_mode) =
  match x with Enabled -> `String "Enabled" | Disabled -> `String "Disabled"

let secret_ar_n_to_yojson = string_to_yojson

let secrets_manager_configuration_to_yojson (x : secrets_manager_configuration) =
  assoc_to_yojson
    [
      ("Enabled", Some (boolean_object_to_yojson x.enabled));
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("SecretARN", option_to_yojson secret_ar_n_to_yojson x.secret_ar_n);
    ]

let redshift_destination_update_to_yojson (x : redshift_destination_update) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("S3BackupUpdate", option_to_yojson s3_destination_update_to_yojson x.s3_backup_update);
      ("S3BackupMode", option_to_yojson redshift_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ("RetryOptions", option_to_yojson redshift_retry_options_to_yojson x.retry_options);
      ("Password", option_to_yojson password_to_yojson x.password);
      ("Username", option_to_yojson username_to_yojson x.username);
      ("CopyCommand", option_to_yojson copy_command_to_yojson x.copy_command);
      ("ClusterJDBCURL", option_to_yojson cluster_jdbcur_l_to_yojson x.cluster_jdbcur_l);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let elasticsearch_domain_ar_n_to_yojson = string_to_yojson
let elasticsearch_cluster_endpoint_to_yojson = string_to_yojson
let elasticsearch_index_name_to_yojson = string_to_yojson
let elasticsearch_type_name_to_yojson = string_to_yojson

let elasticsearch_index_rotation_period_to_yojson (x : elasticsearch_index_rotation_period) =
  match x with
  | OneMonth -> `String "OneMonth"
  | OneWeek -> `String "OneWeek"
  | OneDay -> `String "OneDay"
  | OneHour -> `String "OneHour"
  | NoRotation -> `String "NoRotation"

let elasticsearch_buffering_interval_in_seconds_to_yojson = int_to_yojson
let elasticsearch_buffering_size_in_m_bs_to_yojson = int_to_yojson

let elasticsearch_buffering_hints_to_yojson (x : elasticsearch_buffering_hints) =
  assoc_to_yojson
    [
      ("SizeInMBs", option_to_yojson elasticsearch_buffering_size_in_m_bs_to_yojson x.size_in_m_bs);
      ( "IntervalInSeconds",
        option_to_yojson elasticsearch_buffering_interval_in_seconds_to_yojson x.interval_in_seconds
      );
    ]

let elasticsearch_retry_duration_in_seconds_to_yojson = int_to_yojson

let elasticsearch_retry_options_to_yojson (x : elasticsearch_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson elasticsearch_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let default_document_id_format_to_yojson (x : default_document_id_format) =
  match x with
  | NO_DOCUMENT_ID -> `String "NO_DOCUMENT_ID"
  | FIREHOSE_DEFAULT -> `String "FIREHOSE_DEFAULT"

let document_id_options_to_yojson (x : document_id_options) =
  assoc_to_yojson
    [
      ( "DefaultDocumentIdFormat",
        Some (default_document_id_format_to_yojson x.default_document_id_format) );
    ]

let elasticsearch_destination_update_to_yojson (x : elasticsearch_destination_update) =
  assoc_to_yojson
    [
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ("RetryOptions", option_to_yojson elasticsearch_retry_options_to_yojson x.retry_options);
      ("BufferingHints", option_to_yojson elasticsearch_buffering_hints_to_yojson x.buffering_hints);
      ( "IndexRotationPeriod",
        option_to_yojson elasticsearch_index_rotation_period_to_yojson x.index_rotation_period );
      ("TypeName", option_to_yojson elasticsearch_type_name_to_yojson x.type_name);
      ("IndexName", option_to_yojson elasticsearch_index_name_to_yojson x.index_name);
      ( "ClusterEndpoint",
        option_to_yojson elasticsearch_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("DomainARN", option_to_yojson elasticsearch_domain_ar_n_to_yojson x.domain_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let amazonopensearchservice_domain_ar_n_to_yojson = string_to_yojson
let amazonopensearchservice_cluster_endpoint_to_yojson = string_to_yojson
let amazonopensearchservice_index_name_to_yojson = string_to_yojson
let amazonopensearchservice_type_name_to_yojson = string_to_yojson

let amazonopensearchservice_index_rotation_period_to_yojson
    (x : amazonopensearchservice_index_rotation_period) =
  match x with
  | OneMonth -> `String "OneMonth"
  | OneWeek -> `String "OneWeek"
  | OneDay -> `String "OneDay"
  | OneHour -> `String "OneHour"
  | NoRotation -> `String "NoRotation"

let amazonopensearchservice_buffering_interval_in_seconds_to_yojson = int_to_yojson
let amazonopensearchservice_buffering_size_in_m_bs_to_yojson = int_to_yojson

let amazonopensearchservice_buffering_hints_to_yojson (x : amazonopensearchservice_buffering_hints)
    =
  assoc_to_yojson
    [
      ( "SizeInMBs",
        option_to_yojson amazonopensearchservice_buffering_size_in_m_bs_to_yojson x.size_in_m_bs );
      ( "IntervalInSeconds",
        option_to_yojson amazonopensearchservice_buffering_interval_in_seconds_to_yojson
          x.interval_in_seconds );
    ]

let amazonopensearchservice_retry_duration_in_seconds_to_yojson = int_to_yojson

let amazonopensearchservice_retry_options_to_yojson (x : amazonopensearchservice_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson amazonopensearchservice_retry_duration_in_seconds_to_yojson
          x.duration_in_seconds );
    ]

let amazonopensearchservice_destination_update_to_yojson
    (x : amazonopensearchservice_destination_update) =
  assoc_to_yojson
    [
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "RetryOptions",
        option_to_yojson amazonopensearchservice_retry_options_to_yojson x.retry_options );
      ( "BufferingHints",
        option_to_yojson amazonopensearchservice_buffering_hints_to_yojson x.buffering_hints );
      ( "IndexRotationPeriod",
        option_to_yojson amazonopensearchservice_index_rotation_period_to_yojson
          x.index_rotation_period );
      ("TypeName", option_to_yojson amazonopensearchservice_type_name_to_yojson x.type_name);
      ("IndexName", option_to_yojson amazonopensearchservice_index_name_to_yojson x.index_name);
      ( "ClusterEndpoint",
        option_to_yojson amazonopensearchservice_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("DomainARN", option_to_yojson amazonopensearchservice_domain_ar_n_to_yojson x.domain_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let hec_endpoint_to_yojson = string_to_yojson

let hec_endpoint_type_to_yojson (x : hec_endpoint_type) =
  match x with Event -> `String "Event" | Raw -> `String "Raw"

let hec_token_to_yojson = string_to_yojson
let hec_acknowledgment_timeout_in_seconds_to_yojson = int_to_yojson
let splunk_retry_duration_in_seconds_to_yojson = int_to_yojson

let splunk_retry_options_to_yojson (x : splunk_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson splunk_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let splunk_s3_backup_mode_to_yojson (x : splunk_s3_backup_mode) =
  match x with AllEvents -> `String "AllEvents" | FailedEventsOnly -> `String "FailedEventsOnly"

let splunk_buffering_interval_in_seconds_to_yojson = int_to_yojson
let splunk_buffering_size_in_m_bs_to_yojson = int_to_yojson

let splunk_buffering_hints_to_yojson (x : splunk_buffering_hints) =
  assoc_to_yojson
    [
      ("SizeInMBs", option_to_yojson splunk_buffering_size_in_m_bs_to_yojson x.size_in_m_bs);
      ( "IntervalInSeconds",
        option_to_yojson splunk_buffering_interval_in_seconds_to_yojson x.interval_in_seconds );
    ]

let splunk_destination_update_to_yojson (x : splunk_destination_update) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("BufferingHints", option_to_yojson splunk_buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ("S3BackupMode", option_to_yojson splunk_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson splunk_retry_options_to_yojson x.retry_options);
      ( "HECAcknowledgmentTimeoutInSeconds",
        option_to_yojson hec_acknowledgment_timeout_in_seconds_to_yojson
          x.hec_acknowledgment_timeout_in_seconds );
      ("HECToken", option_to_yojson hec_token_to_yojson x.hec_token);
      ("HECEndpointType", option_to_yojson hec_endpoint_type_to_yojson x.hec_endpoint_type);
      ("HECEndpoint", option_to_yojson hec_endpoint_to_yojson x.hec_endpoint);
    ]

let http_endpoint_url_to_yojson = string_to_yojson
let http_endpoint_name_to_yojson = string_to_yojson
let http_endpoint_access_key_to_yojson = string_to_yojson

let http_endpoint_configuration_to_yojson (x : http_endpoint_configuration) =
  assoc_to_yojson
    [
      ("AccessKey", option_to_yojson http_endpoint_access_key_to_yojson x.access_key);
      ("Name", option_to_yojson http_endpoint_name_to_yojson x.name);
      ("Url", Some (http_endpoint_url_to_yojson x.url));
    ]

let http_endpoint_buffering_size_in_m_bs_to_yojson = int_to_yojson
let http_endpoint_buffering_interval_in_seconds_to_yojson = int_to_yojson

let http_endpoint_buffering_hints_to_yojson (x : http_endpoint_buffering_hints) =
  assoc_to_yojson
    [
      ( "IntervalInSeconds",
        option_to_yojson http_endpoint_buffering_interval_in_seconds_to_yojson x.interval_in_seconds
      );
      ("SizeInMBs", option_to_yojson http_endpoint_buffering_size_in_m_bs_to_yojson x.size_in_m_bs);
    ]

let content_encoding_to_yojson (x : content_encoding) =
  match x with GZIP -> `String "GZIP" | NONE -> `String "NONE"

let http_endpoint_attribute_name_to_yojson = string_to_yojson
let http_endpoint_attribute_value_to_yojson = string_to_yojson

let http_endpoint_common_attribute_to_yojson (x : http_endpoint_common_attribute) =
  assoc_to_yojson
    [
      ("AttributeValue", Some (http_endpoint_attribute_value_to_yojson x.attribute_value));
      ("AttributeName", Some (http_endpoint_attribute_name_to_yojson x.attribute_name));
    ]

let http_endpoint_common_attributes_list_to_yojson tree =
  list_to_yojson http_endpoint_common_attribute_to_yojson tree

let http_endpoint_request_configuration_to_yojson (x : http_endpoint_request_configuration) =
  assoc_to_yojson
    [
      ( "CommonAttributes",
        option_to_yojson http_endpoint_common_attributes_list_to_yojson x.common_attributes );
      ("ContentEncoding", option_to_yojson content_encoding_to_yojson x.content_encoding);
    ]

let http_endpoint_retry_duration_in_seconds_to_yojson = int_to_yojson

let http_endpoint_retry_options_to_yojson (x : http_endpoint_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson http_endpoint_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let http_endpoint_s3_backup_mode_to_yojson (x : http_endpoint_s3_backup_mode) =
  match x with AllData -> `String "AllData" | FailedDataOnly -> `String "FailedDataOnly"

let http_endpoint_destination_update_to_yojson (x : http_endpoint_destination_update) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ("S3BackupMode", option_to_yojson http_endpoint_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson http_endpoint_retry_options_to_yojson x.retry_options);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "RequestConfiguration",
        option_to_yojson http_endpoint_request_configuration_to_yojson x.request_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson http_endpoint_buffering_hints_to_yojson x.buffering_hints);
      ( "EndpointConfiguration",
        option_to_yojson http_endpoint_configuration_to_yojson x.endpoint_configuration );
    ]

let amazon_open_search_serverless_collection_endpoint_to_yojson = string_to_yojson
let amazon_open_search_serverless_index_name_to_yojson = string_to_yojson
let amazon_open_search_serverless_buffering_interval_in_seconds_to_yojson = int_to_yojson
let amazon_open_search_serverless_buffering_size_in_m_bs_to_yojson = int_to_yojson

let amazon_open_search_serverless_buffering_hints_to_yojson
    (x : amazon_open_search_serverless_buffering_hints) =
  assoc_to_yojson
    [
      ( "SizeInMBs",
        option_to_yojson amazon_open_search_serverless_buffering_size_in_m_bs_to_yojson
          x.size_in_m_bs );
      ( "IntervalInSeconds",
        option_to_yojson amazon_open_search_serverless_buffering_interval_in_seconds_to_yojson
          x.interval_in_seconds );
    ]

let amazon_open_search_serverless_retry_duration_in_seconds_to_yojson = int_to_yojson

let amazon_open_search_serverless_retry_options_to_yojson
    (x : amazon_open_search_serverless_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson amazon_open_search_serverless_retry_duration_in_seconds_to_yojson
          x.duration_in_seconds );
    ]

let amazon_open_search_serverless_destination_update_to_yojson
    (x : amazon_open_search_serverless_destination_update) =
  assoc_to_yojson
    [
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ( "RetryOptions",
        option_to_yojson amazon_open_search_serverless_retry_options_to_yojson x.retry_options );
      ( "BufferingHints",
        option_to_yojson amazon_open_search_serverless_buffering_hints_to_yojson x.buffering_hints
      );
      ("IndexName", option_to_yojson amazon_open_search_serverless_index_name_to_yojson x.index_name);
      ( "CollectionEndpoint",
        option_to_yojson amazon_open_search_serverless_collection_endpoint_to_yojson
          x.collection_endpoint );
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let snowflake_account_url_to_yojson = string_to_yojson
let snowflake_private_key_to_yojson = string_to_yojson
let snowflake_key_passphrase_to_yojson = string_to_yojson
let snowflake_user_to_yojson = string_to_yojson
let snowflake_database_to_yojson = string_to_yojson
let snowflake_schema_to_yojson = string_to_yojson
let snowflake_table_to_yojson = string_to_yojson
let snowflake_role_to_yojson = string_to_yojson

let snowflake_role_configuration_to_yojson (x : snowflake_role_configuration) =
  assoc_to_yojson
    [
      ("SnowflakeRole", option_to_yojson snowflake_role_to_yojson x.snowflake_role);
      ("Enabled", option_to_yojson boolean_object_to_yojson x.enabled);
    ]

let snowflake_data_loading_option_to_yojson (x : snowflake_data_loading_option) =
  match x with
  | VARIANT_CONTENT_AND_METADATA_MAPPING -> `String "VARIANT_CONTENT_AND_METADATA_MAPPING"
  | VARIANT_CONTENT_MAPPING -> `String "VARIANT_CONTENT_MAPPING"
  | JSON_MAPPING -> `String "JSON_MAPPING"

let snowflake_meta_data_column_name_to_yojson = string_to_yojson
let snowflake_content_column_name_to_yojson = string_to_yojson
let snowflake_retry_duration_in_seconds_to_yojson = int_to_yojson

let snowflake_retry_options_to_yojson (x : snowflake_retry_options) =
  assoc_to_yojson
    [
      ( "DurationInSeconds",
        option_to_yojson snowflake_retry_duration_in_seconds_to_yojson x.duration_in_seconds );
    ]

let snowflake_s3_backup_mode_to_yojson (x : snowflake_s3_backup_mode) =
  match x with AllData -> `String "AllData" | FailedDataOnly -> `String "FailedDataOnly"

let snowflake_buffering_size_in_m_bs_to_yojson = int_to_yojson
let snowflake_buffering_interval_in_seconds_to_yojson = int_to_yojson

let snowflake_buffering_hints_to_yojson (x : snowflake_buffering_hints) =
  assoc_to_yojson
    [
      ( "IntervalInSeconds",
        option_to_yojson snowflake_buffering_interval_in_seconds_to_yojson x.interval_in_seconds );
      ("SizeInMBs", option_to_yojson snowflake_buffering_size_in_m_bs_to_yojson x.size_in_m_bs);
    ]

let snowflake_destination_update_to_yojson (x : snowflake_destination_update) =
  assoc_to_yojson
    [
      ("BufferingHints", option_to_yojson snowflake_buffering_hints_to_yojson x.buffering_hints);
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("S3Update", option_to_yojson s3_destination_update_to_yojson x.s3_update);
      ("S3BackupMode", option_to_yojson snowflake_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson snowflake_retry_options_to_yojson x.retry_options);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ContentColumnName",
        option_to_yojson snowflake_content_column_name_to_yojson x.content_column_name );
      ( "MetaDataColumnName",
        option_to_yojson snowflake_meta_data_column_name_to_yojson x.meta_data_column_name );
      ( "DataLoadingOption",
        option_to_yojson snowflake_data_loading_option_to_yojson x.data_loading_option );
      ( "SnowflakeRoleConfiguration",
        option_to_yojson snowflake_role_configuration_to_yojson x.snowflake_role_configuration );
      ("Table", option_to_yojson snowflake_table_to_yojson x.table);
      ("Schema", option_to_yojson snowflake_schema_to_yojson x.schema);
      ("Database", option_to_yojson snowflake_database_to_yojson x.database);
      ("User", option_to_yojson snowflake_user_to_yojson x.user);
      ("KeyPassphrase", option_to_yojson snowflake_key_passphrase_to_yojson x.key_passphrase);
      ("PrivateKey", option_to_yojson snowflake_private_key_to_yojson x.private_key);
      ("AccountUrl", option_to_yojson snowflake_account_url_to_yojson x.account_url);
    ]

let string_with_letters_digits_underscores_dots_to_yojson = string_to_yojson

let partition_field_to_yojson (x : partition_field) =
  assoc_to_yojson
    [ ("SourceName", Some (non_empty_string_without_whitespace_to_yojson x.source_name)) ]

let partition_fields_to_yojson tree = list_to_yojson partition_field_to_yojson tree

let partition_spec_to_yojson (x : partition_spec) =
  assoc_to_yojson [ ("Identity", option_to_yojson partition_fields_to_yojson x.identity) ]

let destination_table_configuration_to_yojson (x : destination_table_configuration) =
  assoc_to_yojson
    [
      ( "S3ErrorOutputPrefix",
        option_to_yojson error_output_prefix_to_yojson x.s3_error_output_prefix );
      ("PartitionSpec", option_to_yojson partition_spec_to_yojson x.partition_spec);
      ( "UniqueKeys",
        option_to_yojson list_of_non_empty_strings_without_whitespace_to_yojson x.unique_keys );
      ( "DestinationDatabaseName",
        Some (string_with_letters_digits_underscores_dots_to_yojson x.destination_database_name) );
      ( "DestinationTableName",
        Some (string_with_letters_digits_underscores_dots_to_yojson x.destination_table_name) );
    ]

let destination_table_configuration_list_to_yojson tree =
  list_to_yojson destination_table_configuration_to_yojson tree

let schema_evolution_configuration_to_yojson (x : schema_evolution_configuration) =
  assoc_to_yojson [ ("Enabled", Some (boolean_object_to_yojson x.enabled)) ]

let table_creation_configuration_to_yojson (x : table_creation_configuration) =
  assoc_to_yojson [ ("Enabled", Some (boolean_object_to_yojson x.enabled)) ]

let iceberg_s3_backup_mode_to_yojson (x : iceberg_s3_backup_mode) =
  match x with AllData -> `String "AllData" | FailedDataOnly -> `String "FailedDataOnly"

let glue_data_catalog_ar_n_to_yojson = string_to_yojson

let catalog_configuration_to_yojson (x : catalog_configuration) =
  assoc_to_yojson
    [
      ("WarehouseLocation", option_to_yojson warehouse_location_to_yojson x.warehouse_location);
      ("CatalogARN", option_to_yojson glue_data_catalog_ar_n_to_yojson x.catalog_ar_n);
    ]

let s3_destination_configuration_to_yojson (x : s3_destination_configuration) =
  assoc_to_yojson
    [
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("CompressionFormat", option_to_yojson compression_format_to_yojson x.compression_format);
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let iceberg_destination_update_to_yojson (x : iceberg_destination_update) =
  assoc_to_yojson
    [
      ("S3Configuration", option_to_yojson s3_destination_configuration_to_yojson x.s3_configuration);
      ( "CatalogConfiguration",
        option_to_yojson catalog_configuration_to_yojson x.catalog_configuration );
      ("AppendOnly", option_to_yojson boolean_object_to_yojson x.append_only);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RetryOptions", option_to_yojson retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson iceberg_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ( "TableCreationConfiguration",
        option_to_yojson table_creation_configuration_to_yojson x.table_creation_configuration );
      ( "SchemaEvolutionConfiguration",
        option_to_yojson schema_evolution_configuration_to_yojson x.schema_evolution_configuration
      );
      ( "DestinationTableConfigurationList",
        option_to_yojson destination_table_configuration_list_to_yojson
          x.destination_table_configuration_list );
    ]

let update_destination_input_to_yojson (x : update_destination_input) =
  assoc_to_yojson
    [
      ( "IcebergDestinationUpdate",
        option_to_yojson iceberg_destination_update_to_yojson x.iceberg_destination_update );
      ( "SnowflakeDestinationUpdate",
        option_to_yojson snowflake_destination_update_to_yojson x.snowflake_destination_update );
      ( "AmazonOpenSearchServerlessDestinationUpdate",
        option_to_yojson amazon_open_search_serverless_destination_update_to_yojson
          x.amazon_open_search_serverless_destination_update );
      ( "HttpEndpointDestinationUpdate",
        option_to_yojson http_endpoint_destination_update_to_yojson
          x.http_endpoint_destination_update );
      ( "SplunkDestinationUpdate",
        option_to_yojson splunk_destination_update_to_yojson x.splunk_destination_update );
      ( "AmazonopensearchserviceDestinationUpdate",
        option_to_yojson amazonopensearchservice_destination_update_to_yojson
          x.amazonopensearchservice_destination_update );
      ( "ElasticsearchDestinationUpdate",
        option_to_yojson elasticsearch_destination_update_to_yojson
          x.elasticsearch_destination_update );
      ( "RedshiftDestinationUpdate",
        option_to_yojson redshift_destination_update_to_yojson x.redshift_destination_update );
      ( "ExtendedS3DestinationUpdate",
        option_to_yojson extended_s3_destination_update_to_yojson x.extended_s3_destination_update
      );
      ( "S3DestinationUpdate",
        option_to_yojson s3_destination_update_to_yojson x.s3_destination_update );
      ("DestinationId", Some (destination_id_to_yojson x.destination_id));
      ( "CurrentDeliveryStreamVersionId",
        Some (delivery_stream_version_id_to_yojson x.current_delivery_stream_version_id) );
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_argument_exception_to_yojson (x : invalid_argument_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let untag_delivery_stream_output_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_delivery_stream_input_to_yojson (x : untag_delivery_stream_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let topic_name_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let throughput_hint_in_m_bs_to_yojson = int_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_delivery_stream_output_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", Some (tag_key_to_yojson x.key));
    ]

let tag_delivery_stream_input_tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_delivery_stream_input_to_yojson (x : tag_delivery_stream_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_delivery_stream_input_tag_list_to_yojson x.tags));
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let stop_delivery_stream_encryption_output_to_yojson = unit_to_yojson

let stop_delivery_stream_encryption_input_to_yojson (x : stop_delivery_stream_encryption_input) =
  assoc_to_yojson
    [ ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name)) ]

let start_delivery_stream_encryption_output_to_yojson = unit_to_yojson
let awskms_key_arn_for_ss_e_to_yojson = string_to_yojson

let key_type_to_yojson (x : key_type) =
  match x with
  | CUSTOMER_MANAGED_CMK -> `String "CUSTOMER_MANAGED_CMK"
  | AWS_OWNED_CMK -> `String "AWS_OWNED_CMK"

let delivery_stream_encryption_configuration_input_to_yojson
    (x : delivery_stream_encryption_configuration_input) =
  assoc_to_yojson
    [
      ("KeyType", Some (key_type_to_yojson x.key_type));
      ("KeyARN", option_to_yojson awskms_key_arn_for_ss_e_to_yojson x.key_ar_n);
    ]

let start_delivery_stream_encryption_input_to_yojson (x : start_delivery_stream_encryption_input) =
  assoc_to_yojson
    [
      ( "DeliveryStreamEncryptionConfigurationInput",
        option_to_yojson delivery_stream_encryption_configuration_input_to_yojson
          x.delivery_stream_encryption_configuration_input );
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let error_code_to_yojson = string_to_yojson

let invalid_kms_resource_exception_to_yojson (x : invalid_kms_resource_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("code", option_to_yojson error_code_to_yojson x.code);
    ]

let s3_destination_description_to_yojson (x : s3_destination_description) =
  assoc_to_yojson
    [
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "EncryptionConfiguration",
        Some (encryption_configuration_to_yojson x.encryption_configuration) );
      ("CompressionFormat", Some (compression_format_to_yojson x.compression_format));
      ("BufferingHints", Some (buffering_hints_to_yojson x.buffering_hints));
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let splunk_destination_description_to_yojson (x : splunk_destination_description) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("BufferingHints", option_to_yojson splunk_buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ("S3BackupMode", option_to_yojson splunk_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson splunk_retry_options_to_yojson x.retry_options);
      ( "HECAcknowledgmentTimeoutInSeconds",
        option_to_yojson hec_acknowledgment_timeout_in_seconds_to_yojson
          x.hec_acknowledgment_timeout_in_seconds );
      ("HECToken", option_to_yojson hec_token_to_yojson x.hec_token);
      ("HECEndpointType", option_to_yojson hec_endpoint_type_to_yojson x.hec_endpoint_type);
      ("HECEndpoint", option_to_yojson hec_endpoint_to_yojson x.hec_endpoint);
    ]

let splunk_destination_configuration_to_yojson (x : splunk_destination_configuration) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("BufferingHints", option_to_yojson splunk_buffering_hints_to_yojson x.buffering_hints);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ("S3BackupMode", option_to_yojson splunk_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson splunk_retry_options_to_yojson x.retry_options);
      ( "HECAcknowledgmentTimeoutInSeconds",
        option_to_yojson hec_acknowledgment_timeout_in_seconds_to_yojson
          x.hec_acknowledgment_timeout_in_seconds );
      ("HECToken", option_to_yojson hec_token_to_yojson x.hec_token);
      ("HECEndpointType", Some (hec_endpoint_type_to_yojson x.hec_endpoint_type));
      ("HECEndpoint", Some (hec_endpoint_to_yojson x.hec_endpoint));
    ]

let direct_put_source_description_to_yojson (x : direct_put_source_description) =
  assoc_to_yojson
    [
      ( "ThroughputHintInMBs",
        option_to_yojson throughput_hint_in_m_bs_to_yojson x.throughput_hint_in_m_bs );
    ]

let kinesis_stream_ar_n_to_yojson = string_to_yojson
let delivery_start_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let kinesis_stream_source_description_to_yojson (x : kinesis_stream_source_description) =
  assoc_to_yojson
    [
      ( "DeliveryStartTimestamp",
        option_to_yojson delivery_start_timestamp_to_yojson x.delivery_start_timestamp );
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("KinesisStreamARN", option_to_yojson kinesis_stream_ar_n_to_yojson x.kinesis_stream_ar_n);
    ]

let msk_cluster_ar_n_to_yojson = string_to_yojson

let connectivity_to_yojson (x : connectivity) =
  match x with PRIVATE -> `String "PRIVATE" | PUBLIC -> `String "PUBLIC"

let authentication_configuration_to_yojson (x : authentication_configuration) =
  assoc_to_yojson
    [
      ("Connectivity", Some (connectivity_to_yojson x.connectivity));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let read_from_timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let msk_source_description_to_yojson (x : msk_source_description) =
  assoc_to_yojson
    [
      ("ReadFromTimestamp", option_to_yojson read_from_timestamp_to_yojson x.read_from_timestamp);
      ( "DeliveryStartTimestamp",
        option_to_yojson delivery_start_timestamp_to_yojson x.delivery_start_timestamp );
      ( "AuthenticationConfiguration",
        option_to_yojson authentication_configuration_to_yojson x.authentication_configuration );
      ("TopicName", option_to_yojson topic_name_to_yojson x.topic_name);
      ("MSKClusterARN", option_to_yojson msk_cluster_ar_n_to_yojson x.msk_cluster_ar_n);
    ]

let database_type_to_yojson (x : database_type) =
  match x with PostgreSQL -> `String "PostgreSQL" | MySQL -> `String "MySQL"

let database_endpoint_to_yojson = string_to_yojson
let database_port_to_yojson = int_to_yojson

let ssl_mode_to_yojson (x : ssl_mode) =
  match x with Enabled -> `String "Enabled" | Disabled -> `String "Disabled"

let database_name_to_yojson = string_to_yojson
let database_include_or_exclude_list_to_yojson tree = list_to_yojson database_name_to_yojson tree

let database_list_to_yojson (x : database_list) =
  assoc_to_yojson
    [
      ("Exclude", option_to_yojson database_include_or_exclude_list_to_yojson x.exclude);
      ("Include", option_to_yojson database_include_or_exclude_list_to_yojson x.include_);
    ]

let database_table_name_to_yojson = string_to_yojson

let database_table_include_or_exclude_list_to_yojson tree =
  list_to_yojson database_table_name_to_yojson tree

let database_table_list_to_yojson (x : database_table_list) =
  assoc_to_yojson
    [
      ("Exclude", option_to_yojson database_table_include_or_exclude_list_to_yojson x.exclude);
      ("Include", option_to_yojson database_table_include_or_exclude_list_to_yojson x.include_);
    ]

let database_column_name_to_yojson = string_to_yojson

let database_column_include_or_exclude_list_to_yojson tree =
  list_to_yojson database_column_name_to_yojson tree

let database_column_list_to_yojson (x : database_column_list) =
  assoc_to_yojson
    [
      ("Exclude", option_to_yojson database_column_include_or_exclude_list_to_yojson x.exclude);
      ("Include", option_to_yojson database_column_include_or_exclude_list_to_yojson x.include_);
    ]

let snapshot_requested_by_to_yojson (x : snapshot_requested_by) =
  match x with FIREHOSE -> `String "FIREHOSE" | USER -> `String "USER"

let snapshot_status_to_yojson (x : snapshot_status) =
  match x with
  | SUSPENDED -> `String "SUSPENDED"
  | COMPLETE -> `String "COMPLETE"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let delivery_stream_failure_type_to_yojson (x : delivery_stream_failure_type) =
  match x with
  | UNKNOWN_ERROR -> `String "UNKNOWN_ERROR"
  | SECURITY_GROUP_ACCESS_DENIED -> `String "SECURITY_GROUP_ACCESS_DENIED"
  | SUBNET_ACCESS_DENIED -> `String "SUBNET_ACCESS_DENIED"
  | ENI_ACCESS_DENIED -> `String "ENI_ACCESS_DENIED"
  | SECURITY_GROUP_NOT_FOUND -> `String "SECURITY_GROUP_NOT_FOUND"
  | SUBNET_NOT_FOUND -> `String "SUBNET_NOT_FOUND"
  | DELETE_ENI_FAILED -> `String "DELETE_ENI_FAILED"
  | CREATE_ENI_FAILED -> `String "CREATE_ENI_FAILED"
  | KMS_OPT_IN_REQUIRED -> `String "KMS_OPT_IN_REQUIRED"
  | KMS_KEY_NOT_FOUND -> `String "KMS_KEY_NOT_FOUND"
  | INVALID_KMS_KEY -> `String "INVALID_KMS_KEY"
  | DISABLED_KMS_KEY -> `String "DISABLED_KMS_KEY"
  | KMS_ACCESS_DENIED -> `String "KMS_ACCESS_DENIED"
  | CREATE_KMS_GRANT_FAILED -> `String "CREATE_KMS_GRANT_FAILED"
  | RETIRE_KMS_GRANT_FAILED -> `String "RETIRE_KMS_GRANT_FAILED"
  | VPC_INTERFACE_ENDPOINT_SERVICE_ACCESS_DENIED ->
      `String "VPC_INTERFACE_ENDPOINT_SERVICE_ACCESS_DENIED"
  | VPC_ENDPOINT_SERVICE_NAME_NOT_FOUND -> `String "VPC_ENDPOINT_SERVICE_NAME_NOT_FOUND"

let failure_description_to_yojson (x : failure_description) =
  assoc_to_yojson
    [
      ("Details", Some (non_empty_string_to_yojson x.details));
      ("Type", Some (delivery_stream_failure_type_to_yojson x.type_));
    ]

let database_snapshot_info_to_yojson (x : database_snapshot_info) =
  assoc_to_yojson
    [
      ("FailureDescription", option_to_yojson failure_description_to_yojson x.failure_description);
      ("Status", Some (snapshot_status_to_yojson x.status));
      ("RequestedBy", Some (snapshot_requested_by_to_yojson x.requested_by));
      ("RequestTimestamp", Some (timestamp_to_yojson x.request_timestamp));
      ("Table", Some (database_table_name_to_yojson x.table));
      ("Id", Some (non_empty_string_without_whitespace_to_yojson x.id));
    ]

let database_snapshot_info_list_to_yojson tree =
  list_to_yojson database_snapshot_info_to_yojson tree

let database_source_authentication_configuration_to_yojson
    (x : database_source_authentication_configuration) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        Some (secrets_manager_configuration_to_yojson x.secrets_manager_configuration) );
    ]

let database_source_vpc_configuration_to_yojson (x : database_source_vpc_configuration) =
  assoc_to_yojson
    [
      ( "VpcEndpointServiceName",
        Some (vpc_endpoint_service_name_to_yojson x.vpc_endpoint_service_name) );
    ]

let database_source_description_to_yojson (x : database_source_description) =
  assoc_to_yojson
    [
      ( "DatabaseSourceVPCConfiguration",
        option_to_yojson database_source_vpc_configuration_to_yojson
          x.database_source_vpc_configuration );
      ( "DatabaseSourceAuthenticationConfiguration",
        option_to_yojson database_source_authentication_configuration_to_yojson
          x.database_source_authentication_configuration );
      ("SnapshotInfo", option_to_yojson database_snapshot_info_list_to_yojson x.snapshot_info);
      ( "SnapshotWatermarkTable",
        option_to_yojson database_table_name_to_yojson x.snapshot_watermark_table );
      ( "SurrogateKeys",
        option_to_yojson database_column_include_or_exclude_list_to_yojson x.surrogate_keys );
      ("Columns", option_to_yojson database_column_list_to_yojson x.columns);
      ("Tables", option_to_yojson database_table_list_to_yojson x.tables);
      ("Databases", option_to_yojson database_list_to_yojson x.databases);
      ("SSLMode", option_to_yojson ssl_mode_to_yojson x.ssl_mode);
      ("Port", option_to_yojson database_port_to_yojson x.port);
      ("Endpoint", option_to_yojson database_endpoint_to_yojson x.endpoint);
      ("Type", option_to_yojson database_type_to_yojson x.type_);
    ]

let source_description_to_yojson (x : source_description) =
  assoc_to_yojson
    [
      ( "DatabaseSourceDescription",
        option_to_yojson database_source_description_to_yojson x.database_source_description );
      ( "MSKSourceDescription",
        option_to_yojson msk_source_description_to_yojson x.msk_source_description );
      ( "KinesisStreamSourceDescription",
        option_to_yojson kinesis_stream_source_description_to_yojson
          x.kinesis_stream_source_description );
      ( "DirectPutSourceDescription",
        option_to_yojson direct_put_source_description_to_yojson x.direct_put_source_description );
    ]

let snowflake_private_link_vpce_id_to_yojson = string_to_yojson

let snowflake_vpc_configuration_to_yojson (x : snowflake_vpc_configuration) =
  assoc_to_yojson
    [
      ("PrivateLinkVpceId", Some (snowflake_private_link_vpce_id_to_yojson x.private_link_vpce_id));
    ]

let snowflake_destination_description_to_yojson (x : snowflake_destination_description) =
  assoc_to_yojson
    [
      ("BufferingHints", option_to_yojson snowflake_buffering_hints_to_yojson x.buffering_hints);
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ("S3BackupMode", option_to_yojson snowflake_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson snowflake_retry_options_to_yojson x.retry_options);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "SnowflakeVpcConfiguration",
        option_to_yojson snowflake_vpc_configuration_to_yojson x.snowflake_vpc_configuration );
      ( "ContentColumnName",
        option_to_yojson snowflake_content_column_name_to_yojson x.content_column_name );
      ( "MetaDataColumnName",
        option_to_yojson snowflake_meta_data_column_name_to_yojson x.meta_data_column_name );
      ( "DataLoadingOption",
        option_to_yojson snowflake_data_loading_option_to_yojson x.data_loading_option );
      ( "SnowflakeRoleConfiguration",
        option_to_yojson snowflake_role_configuration_to_yojson x.snowflake_role_configuration );
      ("Table", option_to_yojson snowflake_table_to_yojson x.table);
      ("Schema", option_to_yojson snowflake_schema_to_yojson x.schema);
      ("Database", option_to_yojson snowflake_database_to_yojson x.database);
      ("User", option_to_yojson snowflake_user_to_yojson x.user);
      ("AccountUrl", option_to_yojson snowflake_account_url_to_yojson x.account_url);
    ]

let snowflake_destination_configuration_to_yojson (x : snowflake_destination_configuration) =
  assoc_to_yojson
    [
      ("BufferingHints", option_to_yojson snowflake_buffering_hints_to_yojson x.buffering_hints);
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ("S3BackupMode", option_to_yojson snowflake_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson snowflake_retry_options_to_yojson x.retry_options);
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "SnowflakeVpcConfiguration",
        option_to_yojson snowflake_vpc_configuration_to_yojson x.snowflake_vpc_configuration );
      ( "ContentColumnName",
        option_to_yojson snowflake_content_column_name_to_yojson x.content_column_name );
      ( "MetaDataColumnName",
        option_to_yojson snowflake_meta_data_column_name_to_yojson x.meta_data_column_name );
      ( "DataLoadingOption",
        option_to_yojson snowflake_data_loading_option_to_yojson x.data_loading_option );
      ( "SnowflakeRoleConfiguration",
        option_to_yojson snowflake_role_configuration_to_yojson x.snowflake_role_configuration );
      ("Table", Some (snowflake_table_to_yojson x.table));
      ("Schema", Some (snowflake_schema_to_yojson x.schema));
      ("Database", Some (snowflake_database_to_yojson x.database));
      ("User", option_to_yojson snowflake_user_to_yojson x.user);
      ("KeyPassphrase", option_to_yojson snowflake_key_passphrase_to_yojson x.key_passphrase);
      ("PrivateKey", option_to_yojson snowflake_private_key_to_yojson x.private_key);
      ("AccountUrl", Some (snowflake_account_url_to_yojson x.account_url));
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("message", option_to_yojson error_message_to_yojson x.message) ]

let redshift_destination_description_to_yojson (x : redshift_destination_description) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "S3BackupDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_backup_description );
      ("S3BackupMode", option_to_yojson redshift_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "S3DestinationDescription",
        Some (s3_destination_description_to_yojson x.s3_destination_description) );
      ("RetryOptions", option_to_yojson redshift_retry_options_to_yojson x.retry_options);
      ("Username", option_to_yojson username_to_yojson x.username);
      ("CopyCommand", Some (copy_command_to_yojson x.copy_command));
      ("ClusterJDBCURL", Some (cluster_jdbcur_l_to_yojson x.cluster_jdbcur_l));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let redshift_destination_configuration_to_yojson (x : redshift_destination_configuration) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "S3BackupConfiguration",
        option_to_yojson s3_destination_configuration_to_yojson x.s3_backup_configuration );
      ("S3BackupMode", option_to_yojson redshift_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ("RetryOptions", option_to_yojson redshift_retry_options_to_yojson x.retry_options);
      ("Password", option_to_yojson password_to_yojson x.password);
      ("Username", option_to_yojson username_to_yojson x.username);
      ("CopyCommand", Some (copy_command_to_yojson x.copy_command));
      ("ClusterJDBCURL", Some (cluster_jdbcur_l_to_yojson x.cluster_jdbcur_l));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let data_to_yojson = blob_to_yojson
let record_to_yojson (x : record) = assoc_to_yojson [ ("Data", Some (data_to_yojson x.data)) ]
let put_response_record_id_to_yojson = string_to_yojson

let put_record_output_to_yojson (x : put_record_output) =
  assoc_to_yojson
    [
      ("Encrypted", option_to_yojson boolean_object_to_yojson x.encrypted);
      ("RecordId", Some (put_response_record_id_to_yojson x.record_id));
    ]

let put_record_input_to_yojson (x : put_record_input) =
  assoc_to_yojson
    [
      ("Record", Some (record_to_yojson x.record));
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let put_record_batch_response_entry_to_yojson (x : put_record_batch_response_entry) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("RecordId", option_to_yojson put_response_record_id_to_yojson x.record_id);
    ]

let put_record_batch_response_entry_list_to_yojson tree =
  list_to_yojson put_record_batch_response_entry_to_yojson tree

let put_record_batch_request_entry_list_to_yojson tree = list_to_yojson record_to_yojson tree

let put_record_batch_output_to_yojson (x : put_record_batch_output) =
  assoc_to_yojson
    [
      ("RequestResponses", Some (put_record_batch_response_entry_list_to_yojson x.request_responses));
      ("Encrypted", option_to_yojson boolean_object_to_yojson x.encrypted);
      ("FailedPutCount", Some (non_negative_integer_object_to_yojson x.failed_put_count));
    ]

let put_record_batch_input_to_yojson (x : put_record_batch_input) =
  assoc_to_yojson
    [
      ("Records", Some (put_record_batch_request_entry_list_to_yojson x.records));
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let invalid_source_exception_to_yojson (x : invalid_source_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson error_message_to_yojson x.message);
      ("code", option_to_yojson error_code_to_yojson x.code);
    ]

let msk_source_configuration_to_yojson (x : msk_source_configuration) =
  assoc_to_yojson
    [
      ("ReadFromTimestamp", option_to_yojson read_from_timestamp_to_yojson x.read_from_timestamp);
      ( "AuthenticationConfiguration",
        Some (authentication_configuration_to_yojson x.authentication_configuration) );
      ("TopicName", Some (topic_name_to_yojson x.topic_name));
      ("MSKClusterARN", Some (msk_cluster_ar_n_to_yojson x.msk_cluster_ar_n));
    ]

let list_tags_for_delivery_stream_output_tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let list_tags_for_delivery_stream_output_to_yojson (x : list_tags_for_delivery_stream_output) =
  assoc_to_yojson
    [
      ("HasMoreTags", Some (boolean_object_to_yojson x.has_more_tags));
      ("Tags", Some (list_tags_for_delivery_stream_output_tag_list_to_yojson x.tags));
    ]

let list_tags_for_delivery_stream_input_limit_to_yojson = int_to_yojson

let list_tags_for_delivery_stream_input_to_yojson (x : list_tags_for_delivery_stream_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson list_tags_for_delivery_stream_input_limit_to_yojson x.limit);
      ("ExclusiveStartTagKey", option_to_yojson tag_key_to_yojson x.exclusive_start_tag_key);
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let delivery_stream_name_list_to_yojson tree = list_to_yojson delivery_stream_name_to_yojson tree

let list_delivery_streams_output_to_yojson (x : list_delivery_streams_output) =
  assoc_to_yojson
    [
      ("HasMoreDeliveryStreams", Some (boolean_object_to_yojson x.has_more_delivery_streams));
      ("DeliveryStreamNames", Some (delivery_stream_name_list_to_yojson x.delivery_stream_names));
    ]

let list_delivery_streams_input_limit_to_yojson = int_to_yojson

let delivery_stream_type_to_yojson (x : delivery_stream_type) =
  match x with
  | DatabaseAsSource -> `String "DatabaseAsSource"
  | MSKAsSource -> `String "MSKAsSource"
  | KinesisStreamAsSource -> `String "KinesisStreamAsSource"
  | DirectPut -> `String "DirectPut"

let list_delivery_streams_input_to_yojson (x : list_delivery_streams_input) =
  assoc_to_yojson
    [
      ( "ExclusiveStartDeliveryStreamName",
        option_to_yojson delivery_stream_name_to_yojson x.exclusive_start_delivery_stream_name );
      ("DeliveryStreamType", option_to_yojson delivery_stream_type_to_yojson x.delivery_stream_type);
      ("Limit", option_to_yojson list_delivery_streams_input_limit_to_yojson x.limit);
    ]

let kinesis_stream_source_configuration_to_yojson (x : kinesis_stream_source_configuration) =
  assoc_to_yojson
    [
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("KinesisStreamARN", Some (kinesis_stream_ar_n_to_yojson x.kinesis_stream_ar_n));
    ]

let iceberg_destination_description_to_yojson (x : iceberg_destination_description) =
  assoc_to_yojson
    [
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "CatalogConfiguration",
        option_to_yojson catalog_configuration_to_yojson x.catalog_configuration );
      ("AppendOnly", option_to_yojson boolean_object_to_yojson x.append_only);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ("RetryOptions", option_to_yojson retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson iceberg_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ( "TableCreationConfiguration",
        option_to_yojson table_creation_configuration_to_yojson x.table_creation_configuration );
      ( "SchemaEvolutionConfiguration",
        option_to_yojson schema_evolution_configuration_to_yojson x.schema_evolution_configuration
      );
      ( "DestinationTableConfigurationList",
        option_to_yojson destination_table_configuration_list_to_yojson
          x.destination_table_configuration_list );
    ]

let iceberg_destination_configuration_to_yojson (x : iceberg_destination_configuration) =
  assoc_to_yojson
    [
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ("CatalogConfiguration", Some (catalog_configuration_to_yojson x.catalog_configuration));
      ("AppendOnly", option_to_yojson boolean_object_to_yojson x.append_only);
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
      ("RetryOptions", option_to_yojson retry_options_to_yojson x.retry_options);
      ("S3BackupMode", option_to_yojson iceberg_s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ( "TableCreationConfiguration",
        option_to_yojson table_creation_configuration_to_yojson x.table_creation_configuration );
      ( "SchemaEvolutionConfiguration",
        option_to_yojson schema_evolution_configuration_to_yojson x.schema_evolution_configuration
      );
      ( "DestinationTableConfigurationList",
        option_to_yojson destination_table_configuration_list_to_yojson
          x.destination_table_configuration_list );
    ]

let http_endpoint_description_to_yojson (x : http_endpoint_description) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson http_endpoint_name_to_yojson x.name);
      ("Url", option_to_yojson http_endpoint_url_to_yojson x.url);
    ]

let http_endpoint_destination_description_to_yojson (x : http_endpoint_destination_description) =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ("S3BackupMode", option_to_yojson http_endpoint_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson http_endpoint_retry_options_to_yojson x.retry_options);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "RequestConfiguration",
        option_to_yojson http_endpoint_request_configuration_to_yojson x.request_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson http_endpoint_buffering_hints_to_yojson x.buffering_hints);
      ( "EndpointConfiguration",
        option_to_yojson http_endpoint_description_to_yojson x.endpoint_configuration );
    ]

let http_endpoint_destination_configuration_to_yojson (x : http_endpoint_destination_configuration)
    =
  assoc_to_yojson
    [
      ( "SecretsManagerConfiguration",
        option_to_yojson secrets_manager_configuration_to_yojson x.secrets_manager_configuration );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ("S3BackupMode", option_to_yojson http_endpoint_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson http_endpoint_retry_options_to_yojson x.retry_options);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "RequestConfiguration",
        option_to_yojson http_endpoint_request_configuration_to_yojson x.request_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ("BufferingHints", option_to_yojson http_endpoint_buffering_hints_to_yojson x.buffering_hints);
      ( "EndpointConfiguration",
        Some (http_endpoint_configuration_to_yojson x.endpoint_configuration) );
    ]

let delivery_stream_ar_n_to_yojson = string_to_yojson

let delivery_stream_status_to_yojson (x : delivery_stream_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DELETING_FAILED -> `String "DELETING_FAILED"
  | DELETING -> `String "DELETING"
  | CREATING_FAILED -> `String "CREATING_FAILED"
  | CREATING -> `String "CREATING"

let delivery_stream_encryption_status_to_yojson (x : delivery_stream_encryption_status) =
  match x with
  | DISABLING_FAILED -> `String "DISABLING_FAILED"
  | DISABLING -> `String "DISABLING"
  | DISABLED -> `String "DISABLED"
  | ENABLING_FAILED -> `String "ENABLING_FAILED"
  | ENABLING -> `String "ENABLING"
  | ENABLED -> `String "ENABLED"

let delivery_stream_encryption_configuration_to_yojson
    (x : delivery_stream_encryption_configuration) =
  assoc_to_yojson
    [
      ("FailureDescription", option_to_yojson failure_description_to_yojson x.failure_description);
      ("Status", option_to_yojson delivery_stream_encryption_status_to_yojson x.status);
      ("KeyType", option_to_yojson key_type_to_yojson x.key_type);
      ("KeyARN", option_to_yojson awskms_key_arn_for_ss_e_to_yojson x.key_ar_n);
    ]

let extended_s3_destination_description_to_yojson (x : extended_s3_destination_description) =
  assoc_to_yojson
    [
      ("CustomTimeZone", option_to_yojson custom_time_zone_to_yojson x.custom_time_zone);
      ("FileExtension", option_to_yojson file_extension_to_yojson x.file_extension);
      ( "DynamicPartitioningConfiguration",
        option_to_yojson dynamic_partitioning_configuration_to_yojson
          x.dynamic_partitioning_configuration );
      ( "DataFormatConversionConfiguration",
        option_to_yojson data_format_conversion_configuration_to_yojson
          x.data_format_conversion_configuration );
      ( "S3BackupDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_backup_description );
      ("S3BackupMode", option_to_yojson s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "EncryptionConfiguration",
        Some (encryption_configuration_to_yojson x.encryption_configuration) );
      ("CompressionFormat", Some (compression_format_to_yojson x.compression_format));
      ("BufferingHints", Some (buffering_hints_to_yojson x.buffering_hints));
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let elasticsearch_s3_backup_mode_to_yojson (x : elasticsearch_s3_backup_mode) =
  match x with
  | AllDocuments -> `String "AllDocuments"
  | FailedDocumentsOnly -> `String "FailedDocumentsOnly"

let elasticsearch_destination_description_to_yojson (x : elasticsearch_destination_description) =
  assoc_to_yojson
    [
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
      ( "VpcConfigurationDescription",
        option_to_yojson vpc_configuration_description_to_yojson x.vpc_configuration_description );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ("S3BackupMode", option_to_yojson elasticsearch_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson elasticsearch_retry_options_to_yojson x.retry_options);
      ("BufferingHints", option_to_yojson elasticsearch_buffering_hints_to_yojson x.buffering_hints);
      ( "IndexRotationPeriod",
        option_to_yojson elasticsearch_index_rotation_period_to_yojson x.index_rotation_period );
      ("TypeName", option_to_yojson elasticsearch_type_name_to_yojson x.type_name);
      ("IndexName", option_to_yojson elasticsearch_index_name_to_yojson x.index_name);
      ( "ClusterEndpoint",
        option_to_yojson elasticsearch_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("DomainARN", option_to_yojson elasticsearch_domain_ar_n_to_yojson x.domain_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let amazonopensearchservice_s3_backup_mode_to_yojson (x : amazonopensearchservice_s3_backup_mode) =
  match x with
  | AllDocuments -> `String "AllDocuments"
  | FailedDocumentsOnly -> `String "FailedDocumentsOnly"

let amazonopensearchservice_destination_description_to_yojson
    (x : amazonopensearchservice_destination_description) =
  assoc_to_yojson
    [
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
      ( "VpcConfigurationDescription",
        option_to_yojson vpc_configuration_description_to_yojson x.vpc_configuration_description );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "S3BackupMode",
        option_to_yojson amazonopensearchservice_s3_backup_mode_to_yojson x.s3_backup_mode );
      ( "RetryOptions",
        option_to_yojson amazonopensearchservice_retry_options_to_yojson x.retry_options );
      ( "BufferingHints",
        option_to_yojson amazonopensearchservice_buffering_hints_to_yojson x.buffering_hints );
      ( "IndexRotationPeriod",
        option_to_yojson amazonopensearchservice_index_rotation_period_to_yojson
          x.index_rotation_period );
      ("TypeName", option_to_yojson amazonopensearchservice_type_name_to_yojson x.type_name);
      ("IndexName", option_to_yojson amazonopensearchservice_index_name_to_yojson x.index_name);
      ( "ClusterEndpoint",
        option_to_yojson amazonopensearchservice_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("DomainARN", option_to_yojson amazonopensearchservice_domain_ar_n_to_yojson x.domain_ar_n);
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let amazon_open_search_serverless_s3_backup_mode_to_yojson
    (x : amazon_open_search_serverless_s3_backup_mode) =
  match x with
  | AllDocuments -> `String "AllDocuments"
  | FailedDocumentsOnly -> `String "FailedDocumentsOnly"

let amazon_open_search_serverless_destination_description_to_yojson
    (x : amazon_open_search_serverless_destination_description) =
  assoc_to_yojson
    [
      ( "VpcConfigurationDescription",
        option_to_yojson vpc_configuration_description_to_yojson x.vpc_configuration_description );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ( "S3BackupMode",
        option_to_yojson amazon_open_search_serverless_s3_backup_mode_to_yojson x.s3_backup_mode );
      ( "RetryOptions",
        option_to_yojson amazon_open_search_serverless_retry_options_to_yojson x.retry_options );
      ( "BufferingHints",
        option_to_yojson amazon_open_search_serverless_buffering_hints_to_yojson x.buffering_hints
      );
      ("IndexName", option_to_yojson amazon_open_search_serverless_index_name_to_yojson x.index_name);
      ( "CollectionEndpoint",
        option_to_yojson amazon_open_search_serverless_collection_endpoint_to_yojson
          x.collection_endpoint );
      ("RoleARN", option_to_yojson role_ar_n_to_yojson x.role_ar_n);
    ]

let destination_description_to_yojson (x : destination_description) =
  assoc_to_yojson
    [
      ( "IcebergDestinationDescription",
        option_to_yojson iceberg_destination_description_to_yojson x.iceberg_destination_description
      );
      ( "AmazonOpenSearchServerlessDestinationDescription",
        option_to_yojson amazon_open_search_serverless_destination_description_to_yojson
          x.amazon_open_search_serverless_destination_description );
      ( "SnowflakeDestinationDescription",
        option_to_yojson snowflake_destination_description_to_yojson
          x.snowflake_destination_description );
      ( "HttpEndpointDestinationDescription",
        option_to_yojson http_endpoint_destination_description_to_yojson
          x.http_endpoint_destination_description );
      ( "SplunkDestinationDescription",
        option_to_yojson splunk_destination_description_to_yojson x.splunk_destination_description
      );
      ( "AmazonopensearchserviceDestinationDescription",
        option_to_yojson amazonopensearchservice_destination_description_to_yojson
          x.amazonopensearchservice_destination_description );
      ( "ElasticsearchDestinationDescription",
        option_to_yojson elasticsearch_destination_description_to_yojson
          x.elasticsearch_destination_description );
      ( "RedshiftDestinationDescription",
        option_to_yojson redshift_destination_description_to_yojson
          x.redshift_destination_description );
      ( "ExtendedS3DestinationDescription",
        option_to_yojson extended_s3_destination_description_to_yojson
          x.extended_s3_destination_description );
      ( "S3DestinationDescription",
        option_to_yojson s3_destination_description_to_yojson x.s3_destination_description );
      ("DestinationId", Some (destination_id_to_yojson x.destination_id));
    ]

let destination_description_list_to_yojson tree =
  list_to_yojson destination_description_to_yojson tree

let delivery_stream_description_to_yojson (x : delivery_stream_description) =
  assoc_to_yojson
    [
      ("HasMoreDestinations", Some (boolean_object_to_yojson x.has_more_destinations));
      ("Destinations", Some (destination_description_list_to_yojson x.destinations));
      ("Source", option_to_yojson source_description_to_yojson x.source);
      ("LastUpdateTimestamp", option_to_yojson timestamp_to_yojson x.last_update_timestamp);
      ("CreateTimestamp", option_to_yojson timestamp_to_yojson x.create_timestamp);
      ("VersionId", Some (delivery_stream_version_id_to_yojson x.version_id));
      ("DeliveryStreamType", Some (delivery_stream_type_to_yojson x.delivery_stream_type));
      ( "DeliveryStreamEncryptionConfiguration",
        option_to_yojson delivery_stream_encryption_configuration_to_yojson
          x.delivery_stream_encryption_configuration );
      ("FailureDescription", option_to_yojson failure_description_to_yojson x.failure_description);
      ("DeliveryStreamStatus", Some (delivery_stream_status_to_yojson x.delivery_stream_status));
      ("DeliveryStreamARN", Some (delivery_stream_ar_n_to_yojson x.delivery_stream_ar_n));
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

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
      ( "ExclusiveStartDestinationId",
        option_to_yojson destination_id_to_yojson x.exclusive_start_destination_id );
      ("Limit", option_to_yojson describe_delivery_stream_input_limit_to_yojson x.limit);
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let delete_delivery_stream_output_to_yojson = unit_to_yojson

let delete_delivery_stream_input_to_yojson (x : delete_delivery_stream_input) =
  assoc_to_yojson
    [
      ("AllowForceDelete", option_to_yojson boolean_object_to_yojson x.allow_force_delete);
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]

let create_delivery_stream_output_to_yojson (x : create_delivery_stream_output) =
  assoc_to_yojson
    [
      ("DeliveryStreamARN", option_to_yojson delivery_stream_ar_n_to_yojson x.delivery_stream_ar_n);
    ]

let direct_put_source_configuration_to_yojson (x : direct_put_source_configuration) =
  assoc_to_yojson
    [ ("ThroughputHintInMBs", Some (throughput_hint_in_m_bs_to_yojson x.throughput_hint_in_m_bs)) ]

let extended_s3_destination_configuration_to_yojson (x : extended_s3_destination_configuration) =
  assoc_to_yojson
    [
      ("CustomTimeZone", option_to_yojson custom_time_zone_to_yojson x.custom_time_zone);
      ("FileExtension", option_to_yojson file_extension_to_yojson x.file_extension);
      ( "DynamicPartitioningConfiguration",
        option_to_yojson dynamic_partitioning_configuration_to_yojson
          x.dynamic_partitioning_configuration );
      ( "DataFormatConversionConfiguration",
        option_to_yojson data_format_conversion_configuration_to_yojson
          x.data_format_conversion_configuration );
      ( "S3BackupConfiguration",
        option_to_yojson s3_destination_configuration_to_yojson x.s3_backup_configuration );
      ("S3BackupMode", option_to_yojson s3_backup_mode_to_yojson x.s3_backup_mode);
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "EncryptionConfiguration",
        option_to_yojson encryption_configuration_to_yojson x.encryption_configuration );
      ("CompressionFormat", option_to_yojson compression_format_to_yojson x.compression_format);
      ("BufferingHints", option_to_yojson buffering_hints_to_yojson x.buffering_hints);
      ("ErrorOutputPrefix", option_to_yojson error_output_prefix_to_yojson x.error_output_prefix);
      ("Prefix", option_to_yojson prefix_to_yojson x.prefix);
      ("BucketARN", Some (bucket_ar_n_to_yojson x.bucket_ar_n));
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let elasticsearch_destination_configuration_to_yojson (x : elasticsearch_destination_configuration)
    =
  assoc_to_yojson
    [
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ("S3BackupMode", option_to_yojson elasticsearch_s3_backup_mode_to_yojson x.s3_backup_mode);
      ("RetryOptions", option_to_yojson elasticsearch_retry_options_to_yojson x.retry_options);
      ("BufferingHints", option_to_yojson elasticsearch_buffering_hints_to_yojson x.buffering_hints);
      ( "IndexRotationPeriod",
        option_to_yojson elasticsearch_index_rotation_period_to_yojson x.index_rotation_period );
      ("TypeName", option_to_yojson elasticsearch_type_name_to_yojson x.type_name);
      ("IndexName", Some (elasticsearch_index_name_to_yojson x.index_name));
      ( "ClusterEndpoint",
        option_to_yojson elasticsearch_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("DomainARN", option_to_yojson elasticsearch_domain_ar_n_to_yojson x.domain_ar_n);
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let amazonopensearchservice_destination_configuration_to_yojson
    (x : amazonopensearchservice_destination_configuration) =
  assoc_to_yojson
    [
      ("DocumentIdOptions", option_to_yojson document_id_options_to_yojson x.document_id_options);
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "S3BackupMode",
        option_to_yojson amazonopensearchservice_s3_backup_mode_to_yojson x.s3_backup_mode );
      ( "RetryOptions",
        option_to_yojson amazonopensearchservice_retry_options_to_yojson x.retry_options );
      ( "BufferingHints",
        option_to_yojson amazonopensearchservice_buffering_hints_to_yojson x.buffering_hints );
      ( "IndexRotationPeriod",
        option_to_yojson amazonopensearchservice_index_rotation_period_to_yojson
          x.index_rotation_period );
      ("TypeName", option_to_yojson amazonopensearchservice_type_name_to_yojson x.type_name);
      ("IndexName", Some (amazonopensearchservice_index_name_to_yojson x.index_name));
      ( "ClusterEndpoint",
        option_to_yojson amazonopensearchservice_cluster_endpoint_to_yojson x.cluster_endpoint );
      ("DomainARN", option_to_yojson amazonopensearchservice_domain_ar_n_to_yojson x.domain_ar_n);
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let amazon_open_search_serverless_destination_configuration_to_yojson
    (x : amazon_open_search_serverless_destination_configuration) =
  assoc_to_yojson
    [
      ("VpcConfiguration", option_to_yojson vpc_configuration_to_yojson x.vpc_configuration);
      ( "CloudWatchLoggingOptions",
        option_to_yojson cloud_watch_logging_options_to_yojson x.cloud_watch_logging_options );
      ( "ProcessingConfiguration",
        option_to_yojson processing_configuration_to_yojson x.processing_configuration );
      ("S3Configuration", Some (s3_destination_configuration_to_yojson x.s3_configuration));
      ( "S3BackupMode",
        option_to_yojson amazon_open_search_serverless_s3_backup_mode_to_yojson x.s3_backup_mode );
      ( "RetryOptions",
        option_to_yojson amazon_open_search_serverless_retry_options_to_yojson x.retry_options );
      ( "BufferingHints",
        option_to_yojson amazon_open_search_serverless_buffering_hints_to_yojson x.buffering_hints
      );
      ("IndexName", Some (amazon_open_search_serverless_index_name_to_yojson x.index_name));
      ( "CollectionEndpoint",
        option_to_yojson amazon_open_search_serverless_collection_endpoint_to_yojson
          x.collection_endpoint );
      ("RoleARN", Some (role_ar_n_to_yojson x.role_ar_n));
    ]

let database_surrogate_key_list_to_yojson tree =
  list_to_yojson non_empty_string_without_whitespace_to_yojson tree

let database_source_configuration_to_yojson (x : database_source_configuration) =
  assoc_to_yojson
    [
      ( "DatabaseSourceVPCConfiguration",
        Some (database_source_vpc_configuration_to_yojson x.database_source_vpc_configuration) );
      ( "DatabaseSourceAuthenticationConfiguration",
        Some
          (database_source_authentication_configuration_to_yojson
             x.database_source_authentication_configuration) );
      ("SnapshotWatermarkTable", Some (database_table_name_to_yojson x.snapshot_watermark_table));
      ("SurrogateKeys", option_to_yojson database_surrogate_key_list_to_yojson x.surrogate_keys);
      ("Columns", option_to_yojson database_column_list_to_yojson x.columns);
      ("Tables", Some (database_table_list_to_yojson x.tables));
      ("Databases", Some (database_list_to_yojson x.databases));
      ("SSLMode", option_to_yojson ssl_mode_to_yojson x.ssl_mode);
      ("Port", Some (database_port_to_yojson x.port));
      ("Endpoint", Some (database_endpoint_to_yojson x.endpoint));
      ("Type", Some (database_type_to_yojson x.type_));
    ]

let create_delivery_stream_input_to_yojson (x : create_delivery_stream_input) =
  assoc_to_yojson
    [
      ( "DatabaseSourceConfiguration",
        option_to_yojson database_source_configuration_to_yojson x.database_source_configuration );
      ( "IcebergDestinationConfiguration",
        option_to_yojson iceberg_destination_configuration_to_yojson
          x.iceberg_destination_configuration );
      ( "SnowflakeDestinationConfiguration",
        option_to_yojson snowflake_destination_configuration_to_yojson
          x.snowflake_destination_configuration );
      ( "MSKSourceConfiguration",
        option_to_yojson msk_source_configuration_to_yojson x.msk_source_configuration );
      ( "AmazonOpenSearchServerlessDestinationConfiguration",
        option_to_yojson amazon_open_search_serverless_destination_configuration_to_yojson
          x.amazon_open_search_serverless_destination_configuration );
      ("Tags", option_to_yojson tag_delivery_stream_input_tag_list_to_yojson x.tags);
      ( "HttpEndpointDestinationConfiguration",
        option_to_yojson http_endpoint_destination_configuration_to_yojson
          x.http_endpoint_destination_configuration );
      ( "SplunkDestinationConfiguration",
        option_to_yojson splunk_destination_configuration_to_yojson
          x.splunk_destination_configuration );
      ( "AmazonopensearchserviceDestinationConfiguration",
        option_to_yojson amazonopensearchservice_destination_configuration_to_yojson
          x.amazonopensearchservice_destination_configuration );
      ( "ElasticsearchDestinationConfiguration",
        option_to_yojson elasticsearch_destination_configuration_to_yojson
          x.elasticsearch_destination_configuration );
      ( "RedshiftDestinationConfiguration",
        option_to_yojson redshift_destination_configuration_to_yojson
          x.redshift_destination_configuration );
      ( "ExtendedS3DestinationConfiguration",
        option_to_yojson extended_s3_destination_configuration_to_yojson
          x.extended_s3_destination_configuration );
      ( "S3DestinationConfiguration",
        option_to_yojson s3_destination_configuration_to_yojson x.s3_destination_configuration );
      ( "DeliveryStreamEncryptionConfigurationInput",
        option_to_yojson delivery_stream_encryption_configuration_input_to_yojson
          x.delivery_stream_encryption_configuration_input );
      ( "KinesisStreamSourceConfiguration",
        option_to_yojson kinesis_stream_source_configuration_to_yojson
          x.kinesis_stream_source_configuration );
      ( "DirectPutSourceConfiguration",
        option_to_yojson direct_put_source_configuration_to_yojson x.direct_put_source_configuration
      );
      ("DeliveryStreamType", option_to_yojson delivery_stream_type_to_yojson x.delivery_stream_type);
      ("DeliveryStreamName", Some (delivery_stream_name_to_yojson x.delivery_stream_name));
    ]
